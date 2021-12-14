class IRB::ExtendCommand::PushWorkspace
  # --- execute(*obj) -> [IRB::WorkSpace]
  # 
  # UNIX シェルコマンドの pushd と同じです。
  # 
  # @param obj [[c:IRB::WorkSpace]] オブジェクトを指定します。複数指定した
  #            場合は先頭のオブジェクトのみが設定されます。
  def execute; end

end
