class Gem::SourceInfoCacheEntry
  # --- refresh(source_uri, all) -> Gem::SourceIndex
  # 
  # ソースインデックスを更新します。
  # 
  # @param source_uri データを取得する URI を指定します。
  # 
  # @param all 全てのインデックスを更新するかどうかを指定します。
  def refresh; end

  # --- size -> Integer
  # 
  # ソースエントリのサイズです。
  # 
  # ソースインデックスが変化したことを検出するために使用します。
  def size; end

  # --- source_index -> Gem::SourceIndex
  # 
  # このキャッシュエントリに対するソースインデックスです。
  def source_index; end

  # --- new(si, size) -> Gem::SourceInfoCacheEntry
  # 
  # キャッシュのエントリを作成します。
  # 
  # @param si [[c:Gem::SourceIndex]] のインスタンスを指定します。
  # 
  # @param size エントリのサイズを指定します。
  def new; end

end
