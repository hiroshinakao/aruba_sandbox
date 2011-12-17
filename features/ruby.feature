# language: ja
#Feature: ruby -e
#  Scenario: print something
#    When I run `ruby -e "puts 'hello'"`
#    Then it should pass with:
#      """
#      hello
#      """

機能: コマンド実行
  シナリオ: コマンドを実行する
    もし コマンド`ruby -e "puts 'hello'"`を実行する
    #ならば 実行に成功し、以下の出力があること
    #  """
    #  hello
    #  """
    ならば 出力が"hello"を含んでいること
    かつ 出力が以下を含んでいること
      """
      hello
      """
    かつ 出力が"hello\n"を正確に含んでいること
    かつ 出力が以下を正確に含んでいること
      """
      hello\n
      """

    ならば 出力が"bye"を含んでいないこと
    かつ 出力が以下を含んでいないこと
      """
      bye
      """

  シナリオ: コマンドを実行する
    もし コマンド`ruby -e "puts \\"hello, #{rand(100)}.\\""`を実行する
    ならば 出力が/^hello, (\d+)\.$/と一致すること
    ならば 出力が以下と一致すること
      """
      ^hello, (\d+)\.$
      """

#  シナリオ: 対話形式のコマンドを実行する
#    もし コマンド`irb`を対話的に実行する
#    かつ "puts `hello`"とタイプする
#    ならば 実行に成功し、以下の出力があること
#      """
#      hello
#      """
