# language: ja

機能: ファイル操作
  シナリオ: ファイル操作をする
    もし "./tests"という名前のディレクトリを使用する
    かつ 以下の記述がある"./tests/test_file.txt"という名前のファイルを使用する
    """
    aaa
    bbb
    ccc

    """
    もし "./tests"ディレクトリに移動する
    ならば "test_file.txt"という名前のファイルが存在すること
    かつ "test_file.txt"ファイルが"aaa"を含んでいること
    かつ "test_file.txt"ファイルが"zzz"を含んでいないこと

    もし "test_file.txt"ファイルに以下を追記する
    """
    ddd

    """
    ならば "test_file.txt"ファイルが以下を正確に含んでいること
    """
    aaa
    bbb
    ccc
    ddd

    """

    もし "test_file.txt"ファイルに以下を上書きする
    """
    eee
    fff

    """
    ならば "test_file.txt"ファイルが以下を正確に含んでいること
    """
    eee
    fff

    """

    もし "test_file.txt"ファイルを削除する
    ならば "test_file.txt"という名前のファイルが存在しないこと

