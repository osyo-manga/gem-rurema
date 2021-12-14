class IRB::ExtendCommand::Kill
  # --- execute(*obj) -> object
  # 
  # 指定したサブ irb を停止します。
  # 
  # @param obj 停止するサブ irb を識別する以下のいずれかのオブジェクトを指定します。
  # 
  #  * irb インタプリタ番号
  #  * irb オブジェクト
  #  * スレッド ID
  #  * 各インタプリタの self (「irb(obj)」で起動した時の obj)
  def execute; end

end
