# -*- coding: utf-8 -*-
require 'aruba/api'

#### 前提
前提 /^クリーンなgemset"([^"]*)"を使用する$/ do |gemset|
  step %Q{I'm using a clean gemset "#{gemset}"}
end

前提 /^"([^"]*)"という名前のディレクトリを使用する$/ do |dir_name|
  step %Q{a directory named "#{dir_name}"}
end

前提 /^以下の記述がある"([^"]*)"という名前のファイルを使用する$/ do |file_name, file_content|
  step %Q{a file named "#{file_name}" with:}, file_content
end

前提 /^(\d+)バイトの"([^"]*)"という名前のファイルを使用する$/ do |file_size, file_name|
  step %Q{a #{file_size} byte file named "#{file_name}"}
end

前提 /^空の"([^"]*)"という名前のファイルを使用する$/ do |file_name|
  step %Q{an empty file named "#{file_name}"}
end

#### ファイル操作
もし /^"([^"]*)"ファイルに以下を記述する$/ do |file_name, file_content|
  step %Q{I write to "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに以下を上書きする$/ do |file_name, file_content|
  step %Q{I overwrite "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに以下を追記する$/ do |file_name, file_content|
   step %Q{I append to "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに"([^"]*)"を追記する$/ do |file_name, file_content|
  step %Q{I append to "#{file_name}" with "#{file_content}"}
end

もし /^"([^"]*)"ファイルを削除する$/ do |file_name|
  step %Q{I remove the file "#{file_name}"}
end

もし /^"([^"]*)"ディレクトリに移動する$/ do |dir|
  step %Q{I cd to "#{dir}"}
end

#### コマンド実行
もし /^コマンド`([^`]*)`を実行する$/ do |cmd|
  step %Q{I run `#{cmd}`}
end

もし /^コマンド`([^`]*)`を正常に実行する$/ do |cmd|
  step %Q{I successfully run `#{cmd}`}
end

もし /^コマンド`([^`]*)`を対話的に実行する$/ do |cmd|
  step %Q{I run `#{cmd}` interactively}
end

もし /^"([^"]*)"とタイプする$/ do |input|
  step %Q{I type "#{input}"}
end

#### 出力
ならば /^出力が"([^"]*)"を含んでいること$/ do |expected|
  step %Q{the output should contain "#{expected}"}
end

ならば /^`([^`]*)`コマンドを実行した出力が"([^"]*)"を含んでいること$/ do |cmd, expected|
  step %Q{the output from "#{cmd}" should contain "#{expected}"}
end

ならば /^`([^`]*)`コマンドを実行した出力が"([^"]*)"を含んでいないこと$/ do |cmd, unexpected|
  step %Q{the output from "#{cmd}" should not contain "#{unexpected}"}
end

ならば /^出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  step %Q{the output should not contain "#{unexpected}"}
end

ならば /^出力が以下を含んでいること$/ do |expected|
  step %Q{the output should contain:}, expected
end

ならば /^出力が以下を含んでいないこと$/ do |unexpected|
  step %Q{the output should not contain:}, unexpected
end

ならば /^出力が"([^"]*)"を正確に含んでいること$/ do |expected|
  step %Q{the output should contain exactly "#{expected}"}
end

ならば /^出力が以下を正確に含んでいること$/ do |expected|
  step %Q{the output should contain exactly:}, expected
end

# "the output should match" allows regex in the partial_output, if
# you don't need regex, use "the output should contain" instead since
# that way, you don't have to escape regex characters that
# appear naturally in the output
ならば /^出力が\/([^\/]*)\/と一致すること$/ do |expected|
  step %Q{the output should match \/#{expected}\/}
end

ならば /^出力が以下と一致すること$/ do |expected|
  step %Q{the output should match:}, expected
end

#### 終了ステータス
ならば /^終了ステータスが(\d+)であること$/ do |exit_status|
  step %Q{the exit status should be #{exit_status}}
end

ならば /^終了ステータスが(\d+)でないこと$/ do |exit_status|
  step %Q{the exit status should not be #{exit_status}}
end

ならば /^実行に(成功|失敗)し、出力が以下であること$/ do |pass_fail_ja, partial_output|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  step %Q{it should #{pass_fail} with:}, partial_output
end

ならば /^実行に(成功|失敗)し、出力が正確に以下であること$/ do |pass_fail_ja, exact_output|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  step %Q{it should #{pass_fail} with exactly:}, exact_output
end

ならば /^実行に(成功|失敗)し、出力が正規表現で以下であること$/ do |pass_fail_ja, expected|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  #step %Q{it should #{pass_fail} with regexp?:}, expected
  assert_matching_output(expected, all_output)
  assert_success(pass_fail == 'pass')
end

#### 標準出力／標準エラー出力
ならば /^標準エラー出力が"([^"]*)"を含んでいること$/ do |expected|
  step %Q{the stderr should contain "#{expected}"}
end

ならば /^標準エラー出力が以下を含んでいること$/ do |expected|
  step %Q{the stderr should contain:}, expected
end

ならば /^標準エラー出力が以下を正確に含んでいること$/ do |expected|
  step %Q{the stderr should contain exactly:}, expected
end

ならば /^標準出力が"([^"]*)"を含んでいること$/ do |expected|
  step %Q{the stdout should contain "#{expected}"}
end

ならば /^標準出力が以下を含んでいること$/ do |expected|
  step %Q{the stdout should contain:}, expected
end

ならば /^標準出力が以下を正確に含んでいること$/ do |expected|
  step %Q{the stdout should contain exactly:}, expected
end

ならば /^標準エラー出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  step %Q{the stderr should not contain "#{unexpected}"}
end

ならば /^標準エラー出力が以下を含んでいないこと$/ do |unexpected|
  step %Q{the stderr should not contain:}, unexpected
end

ならば /^標準出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  step %Q{the stdout should not contain "#{unexpected}"}
end

ならば /^標準出力が以下を含んでいないこと$/ do |unexpected|
  step %Q{the stdout should not contain:}, unexpected
end

ならば /^コマンド`([^`]*)`の標準出力が"([^"]*)"を含んでいること$/ do |cmd, expected|
  step %Q{the stdout from "#{cmd}" should contain "#{expected}"}
end

ならば /^コマンド`([^`]*)`の標準出力が"([^"]*)"を含んでいないこと$/ do |cmd, unexpected|
  step %Q{the stdout from "#{cmd}" should not contain "#{unexpected}"}
end

ならば /^コマンド`([^`]*)`の標準エラー出力が"([^"]*)"を含んでいること$/ do |cmd, expected|
  step %Q{the stderr from "#{cmd}" should contain "#{expected}"}
end

ならば /^コマンド`([^`]*)`の標準エラー出力が"([^"]*)"を含んでいないこと$/ do |cmd, unexpected|
  step %Q{the stderr from "#{cmd}" should not contain "#{unexpected}""}
end

#### ファイル
ならば /^以下のファイルが存在すること$/ do |files|
  step %Q{the following files should exist:}, files
end

ならば /^以下のファイルが存在しないこと$/ do |files|
  step %Q{the following files should not exist:}, files
end

ならば /^"([^"]*)"という名前のファイルが存在すること$/ do |file|
  step %Q{a file named "#{file}" should exist}
end

ならば /^"([^"]*)"という名前のファイルが存在しないこと$/ do |file|
  step %Q{a file named "#{file}" should not exist}
end

ならば /^(\d+)バイトの"([^"]*)"という名前のファイルが存在すること$/ do |file_size, file_name|
  step %Q{#{file_size} byte file named "#{file_name}" should exist}
end

ならば /^以下のディレクトリが存在すること$/ do |directories|
  step %Q{the following directories should exist:}, directories
end

ならば /^以下のディレクトリが存在しないこと$/ do |directories|
  step %Q{the following directories should not exist:}, directories
end

ならば /^"([^"]*)"という名前のディレクトリが存在すること$/ do |directory|
  step %Q{a directory named "#{directory}" should exist}
end

ならば /^"([^"]*)"という名前のディレクトリが存在しないこと$/ do |directory|
  step %Q{a directory named "#{directory}" should not exist}
end

ならば /^"([^"]*)"ファイルが"([^"]*)"を含んでいること$/ do |file, partial_content|
  step %Q{the file "#{file}" should contain "#{partial_content}"}
end

ならば /^"([^"]*)"ファイルが"([^"]*)"を含んでいないこと$/ do |file, partial_content|
  step %Q{the file "#{file}" should not contain "#{partial_content}"}
end

ならば /^"([^"]*)"ファイルが以下を正確に含んでいること$/ do |file, exact_content|
  step %Q{the file "#{file}" should contain exactly:}, exact_content
end

ならば /^"([^"]*)"ファイルが\/([^\/]*)\/と一致すること$/ do |file, partial_content|
  step %Q{the file "#{file}" should match \/#{partial_content}\/}
end

ならば /^"([^"]*)"ファイルが\/([^\/]*)\/と一致しないこと$/ do |file, partial_content|
  step %Q{the file "#{file}" should not match \/#{partial_content}\/}
end
