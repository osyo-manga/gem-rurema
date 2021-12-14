class IRB::ExtendCommand::Foreground
  # --- execute(*obj) -> IRB::Irb
  # 
  # 指定したサブ irb に移動します。
  # 
  # @param obj 移動するサブ irb を識別する以下のいずれかのオブジェクトを指定します。
  # 
  #  * irb インタプリタ番号
  #  * irb オブジェクト
  #  * スレッド ID
  #  * 各インタプリタの self (「irb(obj)」で起動した時の obj)
  def execute; end

end
