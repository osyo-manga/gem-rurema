class IRB::ExtendCommand::IrbCommand
  # --- execute(*obj) -> IRB::Irb
  # 
  # 新しいサブ irb インタプリタを起動します。
  # 
  # @param obj 新しいサブ irb インタプリタで self にするオブジェクトを指定
  #            します。省略した場合は irb を起動したときの main オブジェク
  #            トを self にします。
  def execute; end

end
