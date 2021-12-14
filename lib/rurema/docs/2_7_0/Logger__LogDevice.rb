class Logger::LogDevice
  # --- close -> nil
  # 
  # 出力先の IO オブジェクトを閉じます。
  # 
  # このメソッドは同期されます。
  # 
  # 
  # @see [[m:IO#close]]
  def close; end

  # --- dev -> IO
  # 
  # 出力先の IO オブジェクトを取得します。
  def dev; end

  # --- filename -> String | nil
  # 
  # 出力先のファイル名を取得します。
  # 
  # 出力先がファイルではない場合は nil を返します。
  def filename; end

  # --- write(message) -> Integer
  # 
  # 出力先の IO オブジェクトにメッセージを書き込みます。
  # 
  # このメソッドは同期されます。
  # 
  # 
  # @see [[m:IO#write]]
  def write; end

  # --- new(log = nil, opt = {}) -> Logger::LogDevice
  # 
  # ログの出力先を初期化します。
  # 
  # @param log ログの出力先。IO オブジェクトを指定します。
  #            省略すると nil が使用されますが、実行中に例外が発生します。
  # 
  # @param opt オプションをハッシュで指定します。
  #            ハッシュのキーには :shift_age, :shift_size を指定します。
  #            省略すると、それぞれ 7, 1048756 (1 MByte) が使用されます。
  # 
  # 
  # @see [[m:Logger.new]]
  def new; end

end
