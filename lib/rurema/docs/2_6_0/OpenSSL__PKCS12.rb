class OpenSSL::PKCS12
  # --- ca_certs -> [OpenSSL::X509::Certificate]
  # 自身が保持しているCA証明書を配列で返します。
  def ca_certs; end

  # --- certificate -> OpenSSL::X509::Certificate
  # 自身が保持している証明書を返します。
  def certificate; end

  # --- key -> OpenSSL::PKey::PKey
  # 自身が保持している鍵を返します。
  def key; end

  # --- to_der -> String
  # 自身を DER 形式の文字列に変換します。
  # 
  # @raise OpenSSL::PKCS12::PKCS12Error 変換に失敗した場合に発生します
  def to_der; end

  # --- create(pass, name, pkey, cert, ca=nil, key_nid=nil, cert_nid=nil, key_iter=nil, mac_iter=nil, keytype=nil) -> OpenSSL::PKCS12
  # 
  # PKCS#12 オブジェクトを生成します。
  # 
  # pass はデータを暗号化するためのパスフレーズです。
  # name は利用者の利便性のためにオブジェクトに与える名前です。
  # pkey は秘密鍵、certは証明書、caはCA証明書の配列です。
  # ca に nil を渡すのは空の配列を渡すのと同じ意味です。
  # nid_key と nid_cert は 秘密鍵、証明書の暗号化方式を
  # 文字列で指定します。
  # key_iter は暗号化アルゴリズムにイテレーション回数、
  # mac_iter は MAC のイテレーション回数、
  # keytype は鍵の種類を渡します。
  # 
  # key_nid, cert_nid, key_iter, mac_iter, keytype すべてに nil を渡すと
  # デフォルトとして、証明書は 40 bit RC2 で暗号化、秘密鍵は triple DES
  # で暗号化、key_iter は2048、mac_iter は1、keytypeなしとなります。
  # 
  # mac_iter がデフォルトで1なのは古いソフトウェアとの互換性のためです。
  # 互換性が問題でなければ 2048(PKCS12_DEFAULT_ITER)を用いてください。
  # 
  # 
  # @param pass パスフレーズ文字列
  # @param name 名前文字列
  # @param pkey 秘密鍵([[c:OpenSSL::PKey::PKey]] のサブクラスのオブジェクト)
  # @param cert 証明書([[c:OpenSSL::X509::Certificate]] のオブジェクト)
  # @param ca CA証明書群([[c:OpenSSL::X509::Certificate]] の配列)
  # @param key_nid 秘密鍵の暗号化方式を表す文字列
  # @param cert_nid 証明書の暗号化方式を表す文字列
  # @param key_iter 暗号化アルゴリズムにイテレーション回数
  # @param mac_iter MAC のイテレーション回数
  # @param keytype 鍵の種類(整数)
  # @raise OpenSSL::PKCS12::PKCS12Error オブジェクト生成に失敗した場合に発生します
  def create; end

  # --- new(obj=nil, pass=nil) -> OpenSSL::PKCS12
  # 文字列もしくは [[c:IO]] オブジェクトから PKCS#12 オブジェクトを生成します。
  # 
  # データは通常パスフレーズで暗号化されているため、pass でそのパスワードを渡し
  # ます。
  # 
  # @param obj PKCS#12データを読み込むオブジェクト(文字列もしくは IO)
  # @param pass パスフレーズ文字列
  # @raise OpenSSL::PKCS12::PKCS12Error データの読み込みに失敗した場合に発生します
  def new; end

end
