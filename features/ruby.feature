# language: ja
#Feature: ruby -e
#  Scenario: print something
#    When I run `ruby -e "puts 'hello'"`
#    Then it should pass with:
#      """
#      hello
#      """

機能: ruby -e
  シナリオ: 出力する
    もし コマンド`ruby -e "puts 'hello'"`を実行する
    ならば 実行に成功し、以下の出力があること
      """
      hello
      """

