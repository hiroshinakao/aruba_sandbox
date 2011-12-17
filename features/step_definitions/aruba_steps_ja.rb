# -*- coding: utf-8 -*-


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
ならば /^実行に成功し、以下の出力があること$/ do |string|
  Then %{it should pass with:}, string
end

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
