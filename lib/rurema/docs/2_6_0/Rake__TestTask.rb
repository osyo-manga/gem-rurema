class Rake::TestTask
  # --- define -> self
  # 
  # タスクを定義します。
  def define; end

  # --- libs -> Array
  # 
  # テスト実行前に [[m:$LOAD_PATH]] に追加するパスを返します。
  def libs; end

  # --- libs=(libs)
  # 
  # テスト実行前に [[m:$LOAD_PATH]] に追加するパスをセットします。
  # 
  # @param libs [[m:$LOAD_PATH]] に追加するパスを配列で指定します。
  def libs=; end

  # --- loader -> Symbol
  # 
  # テストをロードする方法を返します。
  def loader; end

  # --- loader=(style)
  # 
  # テストをロードする方法を指定します。
  # 
  # 指定できる方法は以下の通りです。
  # 
  # : rake
  #   Rake が提供する方法でテストをロードします。デフォルトはこれです。
  # : testrb
  #   Ruby が提供する testrb コマンドを用いてテストをロードします。
  # : direct
  #   コマンドラインで指定したファイルをロードします。
  # 
  # @param style シンボルでテストをロードする方法を指定します。
  def loader=; end

  # --- name -> String
  # 
  # テストタスクの名前を返します。デフォルトは "test" です。
  def name; end

  # --- name=(str)
  # 
  # テストタスクの名前をセットします。
  # 
  # @param str テストタスクの名前を指定します。
  def name=; end

  # --- options -> String
  # 
  # テストスイートに渡すパラメータを返します。
  # 
  # コマンドラインで "TESTOPTS=options" が指定されると、この値を上書きします。
  # デフォルトは何も指定されていません。
  def options; end

  # --- options=(option_str)
  # 
  # テストスイートに渡すパラメータをセットします。
  # 
  # @param option_str テストスイートに渡すパラメータを指定します。
  def options=; end

  # --- pattern -> String
  # 
  # テストファイルにマッチする glob パターンを返します。
  # 
  # デフォルトは 'test/test*.rb' です。
  def pattern; end

  # --- pattern=(pattern)
  # 
  # テストファイルにマッチする glob パターンを指定します。
  def pattern=; end

  # --- ruby_opts -> Array
  # 
  # テスト実行時に Ruby コマンドに渡されるオプションを返します。
  def ruby_opts; end

  # --- ruby_opts=(options)
  # 
  # テスト実行時に Ruby コマンドに渡されるオプションをセットします。
  # 
  # @param options 配列でオプションを指定します。
  def ruby_opts=; end

  # --- test_files=(list)
  # 
  # 明示的にテスト対象のファイルを指定します。
  # 
  # [[m:Rake::TestTask#pattern=]], [[m:Rake::TestTask#test_files=]] の
  # 両方でテスト対象を指定した場合、両者は一つにまとめて使用されます。
  # 
  # @param list 配列か [[c:Rake::FileList]] のインスタンスを指定します。
  def test_files=; end

  # --- verbose -> bool
  # 
  # この値が真である場合、テストの実行結果を詳細に表示します。
  def verbose; end

  # --- verbose=(flag)
  # 
  # テストの実行結果を詳細に表示するかどうかをセットします。
  # 
  # @param flag 真または偽を指定します。
  def verbose=; end

  # --- warning -> bool
  # 
  # この値が真である場合、テスト実行時に ruby -w を実行したのと同じ効果が生じます。
  def warning; end

  # --- warning=(flag)
  # 
  # テスト実行時に警告を表示させるかどうかをセットします。
  # 
  # @param flag 真または偽を指定します。
  def warning=; end

  # --- new(name = :test){|t| ... } -> Rake::TestTask
  # 
  # 自身を初期化します。
  # 
  # ブロックが与えられた場合は、自身をブロックパラメータとして与えられた
  # ブロックを評価します。
  # 
  # @param name ターゲット名を指定します。
  def new; end

end
