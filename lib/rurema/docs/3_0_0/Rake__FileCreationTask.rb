class Rake::FileCreationTask
  # --- needed? -> bool
  # 
  # ファイルが存在しない場合、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # 
  # @see [[FileTask#needed?]]
  def needed?; end

  # --- timestamp -> Rake::EarlyTime
  # 
  # どんなタイムスタンプよりも前の時刻をあらわすタイムスタンプを返します。
  # 
  # 
  # @see [[FileTask#timestamp]]
  def timestamp; end

end
