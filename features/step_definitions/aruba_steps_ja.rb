# -*- coding: utf-8 -*-

もし /^コマンド`([^`]*)`を実行する$/ do |cmd|
  When %{I run `#{cmd}`}
end

ならば /^実行に成功し、以下の出力があること$/ do |string|
  Then %{it should pass with:}, string
end
