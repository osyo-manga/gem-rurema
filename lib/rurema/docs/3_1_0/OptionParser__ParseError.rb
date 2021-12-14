class OptionParser::ParseError
  # --- args -> Array
  # 
  # エラーのあったオプションの一覧を配列で返します。
  # 
  # @return エラーのあったオプションの一覧。
  def args; end

  # --- inspect -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # @return 文字列を返します。
  # 
  # @see [[m:Object#inspect]]
  def inspect; end

  # --- message -> String
  # --- to_s    -> String
  # 
  # 標準エラーに出力するメッセージを返します。
  # 
  # @return 文字列を返します。
  def message; end

  # --- reason -> String
  # 
  # エラーの内容を文字列で返します。
  # 
  # @return 文字列を返します。
  def reason; end

  # --- reason=(reason)
  # 
  # エラーの内容を指定します。
  # 
  # @param reason 文字列を指定します。
  def reason=; end

  # --- recover(argv) -> Array
  # 
  # argv の先頭に self.args を戻します。
  # 
  # argv を返します。
  # 
  # @param argv [[m:OptionParser#parse]] に渡したオブジェクトなどの配列を指定します。
  # 
  # @return argv を返します。
  def recover; end

  # --- set_backtrace(array) -> [String]
  # 
  # 自身に array で指定したバックトレースを設定します。
  # 
  # @param array バックトレースを文字列の配列で指定します。
  # 
  # @return array を返します。
  def set_backtrace; end

  # --- set_option(opt, eq) -> self
  # 
  # エラーのあったオプションを指定します。
  # 
  # eq が真の場合、self が管理するエラーのあったオプションの一覧の先頭を
  # opt で置き換えます。そうでない場合は先頭に opt を追加します。
  # 
  # @param opt エラーのあったオプションを指定します。
  # 
  # @param eq self が管理するエラーのあったオプションの一覧の先頭を置き換え
  #           るかどうかを指定します。
  # 
  # @return self を返します。
  def set_option; end

  # --- filter_backtrace(array) -> [String]
  # 
  # array で指定されたバックトレースから optparse ライブラリに関する行を除
  # 外します。
  # 
  # デバッグモード([[m:$DEBUG]]が真)の場合は何もしません。
  # 
  # @param array バックトレースを文字列の配列で指定します。
  # 
  # @return array を返します。
  def filter_backtrace; end

end
