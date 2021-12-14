class IRB::InputMethod
  # --- file_name -> String
  # 
  # ファイル名を文字列で返します。
  def file_name; end

  # --- gets
  # 
  # [[c:NotImplementedError]] が発生します。
  # 
  # @raise NotImplementedError 必ず発生します。
  def gets; end

  # --- readable_atfer_eof? -> false
  # 
  # 入力が EOF(End Of File)に達した後も読み込みが行えるかどうかを返します。
  def readable_atfer_eof?; end

  # --- new(file = STDIN_FILE_NAME) -> IRB::InputMethod
  # 
  # 自身を初期化します。
  def new; end

end
