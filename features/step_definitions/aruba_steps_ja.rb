# -*- coding: utf-8 -*-
require 'aruba/api'

#### 前提
前提 /^クリーンなgemset"([^"]*)"を使用する$/ do |gemset|
  Given %{I'm using a clean gemset "#{gemset}"}
end

前提 /^"([^"]*)"という名前のディレクトリを使用する$/ do |dir_name|
  Given %{a directory named "#{dir_name}"}
end

前提 /^以下の記述がある"([^"]*)"という名前のファイルを使用する$/ do |file_name, file_content|
  Given %{a file named "#{file_name}" with:}, file_content
end

前提 /^(\d+)バイトの"([^"]*)"という名前のファイルを使用する$/ do |file_size, file_name|
  Given %{a #{file_size} byte file named "#{file_name}"}
end

前提 /^空の"([^"]*)"という名前のファイルを使用する$/ do |file_name|
  Given %{an empty file named "#{file_name}"}
end

#### ファイル操作
もし /^"([^"]*)"ファイルに以下を記述する$/ do |file_name, file_content|
  When %{I write to "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに以下を上書きする$/ do |file_name, file_content|
  When %{I overwrite "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに以下を追記する$/ do |file_name, file_content|
   When %{I append to "#{file_name}" with:}, file_content
end

もし /^"([^"]*)"ファイルに"([^"]*)"を追記する$/ do |file_name, file_content|
  When %{I append to "#{file_name}" with "#{file_content}"}
end

もし /^"([^"]*)"ファイルを削除する$/ do |file_name|
  When %{I remove the file "#{file_name}"}
end

もし /^"([^"]*)"ディレクトリに移動する$/ do |dir|
  When %{I cd to "#{dir}"}
end

#### コマンド実行
もし /^コマンド`([^`]*)`を実行する$/ do |cmd|
  When %{I run `#{cmd}`}
end

もし /^コマンド`([^`]*)`を正常に実行する$/ do |cmd|
  When %{I successfully run `#{cmd}`}
end

もし /^コマンド`([^`]*)`を対話的に実行する$/ do |cmd|
  When %{I run `#{cmd}` interactively}
end

もし /^"([^"]*)"とタイプする$/ do |input|
  When %{I type "#{input}"}
end

#### 出力
ならば /^出力が"([^"]*)"を含んでいること$/ do |expected|
  Then %{the output should contain "#{expected}"}
end

#Then /^the output from "([^"]*)" should contain "([^"]*)"$/ do |cmd, expected|
#  assert_partial_output(expected, output_from(cmd))
#end

#Then /^the output from "([^"]*)" should not contain "([^"]*)"$/ do |cmd, unexpected|
#  assert_no_partial_output(unexpected, output_from(cmd))
#end

ならば /^出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  Then %{the output should not contain "#{unexpected}"}
end

ならば /^出力が以下を含んでいること$/ do |expected|
  Then %{the output should contain:}, expected
end

ならば /^出力が以下を含んでいないこと$/ do |unexpected|
  Then %{the output should not contain:}, unexpected
end

ならば /^出力が"([^"]*)"を正確に含んでいること$/ do |expected|
  Then %{the output should contain exactly "#{expected}"}
end

ならば /^出力が以下を正確に含んでいること$/ do |expected|
  Then %{the output should contain exactly:}, expected
end

# "the output should match" allows regex in the partial_output, if
# you don't need regex, use "the output should contain" instead since
# that way, you don't have to escape regex characters that
# appear naturally in the output
ならば /^出力が\/([^\/]*)\/と一致すること$/ do |expected|
  Then %{the output should match \/#{expected}\/}
end

ならば /^出力が以下と一致すること$/ do |expected|
  Then %{the output should match:}, expected
end

#### 終了ステータス
ならば /^終了ステータスが(\d+)であること$/ do |exit_status|
  Then %{the exit status should be #{exit_status}}
end

ならば /^終了ステータスが(\d+)でないこと$/ do |exit_status|
  Then %{the exit status should not be #{exit_status}}
end

ならば /^実行に(成功|失敗)し、出力が以下であること$/ do |pass_fail_ja, partial_output|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  Then %{it should #{pass_fail} with:}, partial_output
end

ならば /^実行に(成功|失敗)し、出力が正確に以下であること$/ do |pass_fail_ja, exact_output|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  Then %{it should #{pass_fail} with exactly:}, exact_output
end

ならば /^実行に(成功|失敗)し、出力が正規表現で以下であること$/ do |pass_fail_ja, expected|
  pass_fail = pass_fail_ja == "成功" ? "pass" : "fail"
  #Then %{it should #{pass_fail} with regexp?:}, expected
  assert_matching_output(expected, all_output)
  assert_success(pass_fail == 'pass')
end

#### 標準出力／標準エラー出力
ならば /^標準エラー出力が"([^"]*)"を含んでいること$/ do |expected|
  Then %{the stderr should contain "#{expected}"}
end

ならば /^標準エラー出力が以下を含んでいること$/ do |expected|
  Then %{the stderr should contain:}, expected
end

ならば /^標準エラー出力が以下を正確に含んでいること$/ do |expected|
  Then %{the stderr should contain exactly:}, expected
end

ならば /^標準出力が"([^"]*)"を含んでいること$/ do |expected|
  Then %{the stdout should contain "#{expected}"}
end

ならば /^標準出力が以下を含んでいること$/ do |expected|
  Then %{the stdout should contain:}, expected
end

ならば /^標準出力が以下を正確に含んでいること$/ do |expected|
  Then %{the stdout should contain exactly:}, expected
end

ならば /^標準エラー出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  Then %{the stderr should not contain "#{unexpected}"}
end

ならば /^標準エラー出力が以下を含んでいないこと$/ do |unexpected|
  Then %{the stderr should not contain:}, unexpected
end

ならば /^標準出力が"([^"]*)"を含んでいないこと$/ do |unexpected|
  Then %{the stdout should not contain "#{unexpected}"}
end

ならば /^標準出力が以下を含んでいないこと$/ do |unexpected|
  Then %{the stdout should not contain:}, unexpected
end

ならば /^コマンド`([^`]*)`の標準出力が"([^"]*)"を含んでいること$/ do |cmd, expected|
  Then %{the stdout from "#{cmd}" should contain "#{expected}"}
end

ならば /^コマンド`([^`]*)`の標準出力が"([^"]*)"を含んでいないこと$/ do |cmd, unexpected|
  Then %{the stdout from "#{cmd}" should not contain "#{unexpected}"}
end

ならば /^コマンド`([^`]*)`の標準エラー出力が"([^"]*)"を含んでいること$/ do |cmd, expected|
  Then %{the stderr from "#{cmd}" should contain "#{expected}"}
end

ならば /^コマンド`([^`]*)`の標準エラー出力が"([^"]*)"を含んでいないこと$/ do |cmd, unexpected|
  Then %{the stderr from "#{cmd}" should not contain "#{unexpected}""}
end

#### ファイル
ならば /^以下のファイルが存在すること$/ do |files|
  Then %{the following files should exist:}, files
end

ならば /^以下のファイルが存在しないこと$/ do |files|
  Then %{the following files should not exist:}, files
end

ならば /^"([^"]*)"という名前のファイルが存在すること$/ do |file|
  Then %{a file named "#{file}" should exist}
end

ならば /^"([^"]*)"という名前のファイルが存在しないこと$/ do |file|
  Then %{a file named "#{file}" should not exist}
end

ならば /^(\d+)バイトの"([^"]*)"という名前のファイルが存在すること$/ do |file_size, file_name|
  Then %{#{file_size} byte file named "#{file_name}" should exist}
end

ならば /^以下のディレクトリが存在すること$/ do |directories|
  Then %{the following directories should exist:}, directories
end

ならば /^以下のディレクトリが存在しないこと$/ do |directories|
  Then %{the following directories should not exist:}, directories
end

ならば /^"([^"]*)"という名前のディレクトリが存在すること$/ do |directory|
  Then %{a directory named "#{directory}" should exist}
end

ならば /^"([^"]*)"という名前のディレクトリが存在しないこと$/ do |directory|
  Then %{a directory named "#{directory}" should not exist}
end

ならば /^"([^"]*)"ファイルが"([^"]*)"を含んでいること$/ do |file, partial_content|
  Then %{the file "#{file}" should contain "#{partial_content}"}
end

ならば /^"([^"]*)"ファイルが"([^"]*)"を含んでいないこと$/ do |file, partial_content|
  Then %{the file "#{file}" should not contain "#{partial_content}"}
end

ならば /^"([^"]*)"ファイルが以下を正確に含んでいること$/ do |file, exact_content|
  Then %{the file "#{file}" should contain exactly:}, exact_content
end

ならば /^"([^"]*)"ファイルが\/([^\/]*)\/一致すること$/ do |file, partial_content|
  Then %{the file "#{file}" should match \/#{partial_content}\/}
end

ならば /^"([^"]*)"ファイルが\/([^\/]*)\/一致しないこと$/ do |file, partial_content|
  Then %{the file "#{file}" should not match \/#{partial_content}\/}
end
