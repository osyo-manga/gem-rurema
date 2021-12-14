class Gem::StreamUI
  # --- alert(statement, question  = nil) -> String | nil
  # 
  # INFO レベルのアラートを表示します。
  # 
  # @param statement 表示する文字列を指定します。
  # 
  # @param question 必要であれば質問を指定します。
  # 
  # @return question を指定した場合は、それに対する回答を返します。
  #         question を指定しない場合は nil を返します。
  # 
  # @see [[m:Gem::StreamUI#ask]]
  def alert; end

  # --- alert_error(statement, question  = nil) -> String | nil
  # 
  # ERROR レベルのアラートを表示します。
  # 
  # @param statement 表示する文字列を指定します。
  # 
  # @param question 必要であれば質問を指定します。
  # 
  # @return question を指定した場合は、それに対する回答を返します。
  #         question を指定しない場合は nil を返します。
  # 
  # @see [[m:Gem::StreamUI#ask]]
  def alert_error; end

  # --- alert_warning(statement, question  = nil) -> String | nil
  # 
  # WARNING レベルのアラートを表示します。
  # 
  # @param statement 表示する文字列を指定します。
  # 
  # @param question 必要であれば質問を指定します。
  # 
  # @return question を指定した場合は、それに対する回答を返します。
  #         question を指定しない場合は nil を返します。
  # 
  # @see [[m:Gem::StreamUI#ask]]
  def alert_warning; end

  # --- ask(question) -> String | nil
  # 
  # 質問をします。
  # 
  # @param question 質問を指定します。
  # 
  # @return 入力ストリームが TTY に接続されている場合は回答を返します。
  #         そうでない場合は nil を返します。
  def ask; end

  # --- ask_yes_no(question) -> bool
  # 
  # イエス、ノーで答える質問をします。
  # 
  # @param question 質問を指定します。
  # 
  # @return ユーザの回答がイエスの場合は真を、ノーの場合は偽を返します。
  def ask_yes_no; end

  # --- choose_from_list(question, list) -> Array
  # 
  # リストから回答を選択する質問をします。
  # 
  # リストは質問の上に表示されます。
  # 
  # @param question 質問を指定します。
  # 
  # @param list 回答の選択肢を文字列の配列で指定します。
  # 
  # @return 選択肢の名称と選択肢のインデックスを要素とする配列を返します。
  def choose_from_list; end

  # --- errs -> IO
  # 
  # この UI にセットされているエラー出力ストリームを返します。
  def errs; end

  # --- ins -> IO
  # 
  # この UI にセットされている入力ストリームを返します。
  def ins; end

  # --- outs -> IO
  # 
  # この UI にセットされてきる出力ストリームを返します。
  def outs; end

  # --- progress_reporter(*args) -> SilentProgressReporter | SimpleProgressReporter | VerboseProgressReporter
  # 
  # 処理の進捗を報告するためのオブジェクトを返します。
  # 
  # 返されるオブジェクトの種類は現在の設定によります。
  # 
  # @param args 返値となるオブジェクトを初期化するための引数です。
  # 
  # @see [[c:Gem::StreamUI::SilentProgressReporter]], [[c:Gem::StreamUI::SimpleProgressReporter]], [[c:Gem::StreamUI::VerboseProgressReporter]]
  def progress_reporter; end

  # --- say(statement = '') -> ()
  # 
  # 与えられた文字列を表示します。
  # 
  # @param statement 表示する文字列を指定します。
  def say; end

  # --- terminate_interaction(status = 0) -> ()
  # 
  # アプリケーションを終了します。
  # 
  # @param status 終了ステータスを指定します。デフォルトは 0 (成功) です。
  # 
  # @raise Gem::SystemExitException このメソッドを呼び出すと必ず発生する例外です。
  def terminate_interaction; end

  # --- new(in_stream, out_stream, err_stream = STDERR)
  # 
  # このクラスを初期化します。
  # 
  # @param in_stream 入力元のストリームを指定します。
  # 
  # @param out_stream 出力先のストリームを指定します。
  # 
  # @param err_stream エラー出力を指定します。
  def new; end

end
