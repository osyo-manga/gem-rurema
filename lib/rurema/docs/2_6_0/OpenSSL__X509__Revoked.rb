class OpenSSL::X509::Revoked
  # --- add_extension(ex) -> OpenSSL::X509::Extension
  # 拡張領域に ex を追加します。
  # 
  # 追加するデータは [[c:OpenSSL::X509::Extension]] のオブジェクトを渡します。
  # 
  # ex を返します。
  # 
  # @param ex 追加するデータ
  # @raise OpenSSL::X509::RevokedError 追加に失敗した場合に発生します
  def add_extension; end

  # --- extensions -> [OpenSSL::X509::Extension]
  # 拡張領域のデータを配列で返します。
  def extensions; end

  # --- extensions=(extensions)
  # 拡張領域を extensions で更新します。
  # 
  # extensions には [[c:OpenSSL::X509::Extension]] の配列を渡します。
  # 
  # 更新前の拡張領域のデータは破棄されます。
  # 
  # @param extensions 拡張領域のデータ
  # @raise OpenSSL::X509::RevokedError 更新に失敗した場合に発生します
  def extensions=; end

  # --- serial -> OpenSSL::BN
  # 失効した証明書のシリアルを返します。
  def serial; end

  # --- serial=(serial)
  # 失効した証明書のシリアルを設定します。
  # 
  # シリアルは [[c:OpenSSL::BN]] のインスタンスで指定します。
  # 
  # @param serial 失効した証明書のシリアル
  # @see [[m:OpenSSL::X509::Revoked#serial]]
  def serial=; end

  # --- time -> Time
  # 失効した日時を返します。
  def time; end

  # --- time=(time)
  # 失効した日時を Time オブジェクトで設定します。
  # 
  # @param time 失効日時
  # @see [[m:OpenSSL::X509::Revoked#time]]
  def time=; end

  # --- new -> OpenSSL::X509::Revoked
  # 空の Revoked オブジェクトを生成し、返します。
  def new; end

end
