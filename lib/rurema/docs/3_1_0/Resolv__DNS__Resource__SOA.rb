class Resolv::DNS::Resource::SOA
  # --- expire -> Integer
  # プライマリサーバから得たゾーン情報をセカンダリサーバが
  # 何秒間有効なものとして保持するかを返します。
  def expire; end

  # --- minimum -> Integer
  # リソースレコードで TTL の値として使われる最小の秒数を
  # 返します。
  def minimum; end

  # --- mname -> Resolv::DNS::Name
  # 対象のゾーンのマスターゾーンファイルが存在するホスト名を返します。
  def mname; end

  # --- refresh -> Integer
  # プライマリサーバからの更新をセカンダリサーバがチェックする
  # 頻度を秒単位で返します。
  def refresh; end

  # --- retry -> Integer
  # セカンダリサーバがプライマリサーバからの情報更新に失敗した場合に
  # 何秒後にリトライするかを返します。
  def retry; end

  # --- rname -> Resolv::DNS::Name
  # 対象のドメイン名の管理者名を返します。
  def rname; end

  # --- serial -> Integer
  # ゾーンファイルのバージョンを返します。
  def serial; end

  # --- new(mname, rname, serial, refresh, retry_, expire, minimum) -> Resolv::DNS::Resource::SOA
  # Resolv::DNS::Resource::SOA のインスタンスを生成して返します。
  # 
  # @param mname 対象のゾーンのマスターゾーンファイルが存在するホスト名
  # @param rname 対象のドメイン名の管理者名
  # @param serial ゾーンファイルのバージョン
  # @param refresh プライマリサーバからの更新をセカンダリサーバが
  #                チェックする頻度(秒単位)
  # @param retry セカンダリサーバがプライマリサーバからの情報更新
  #              に失敗した場合のリトライの頻度(秒単位)
  # @param expire プライマリサーバから得たゾーン情報の有効期間(秒単位)
  # @param minimum リソースレコードの最小 TTL (秒単位)
  def new; end

end
