# -*- coding: utf-8 -*-
require 'aruba/api'

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
