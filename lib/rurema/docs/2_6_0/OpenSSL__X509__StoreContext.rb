class OpenSSL::X509::StoreContext
  # --- chain -> [OpenSSL::X509::Certificate] | nil
  # 検証に利用した証明書チェインを証明書オブジェクト
  # ([[c:OpenSSL::X509::Certificate]]のインスタンス)の配列で返します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼ぶ前は nil を返します。
  def chain; end

  # --- cleanup -> self
  # このメソッドは使わないでください。
  def cleanup; end

  # --- current_cert -> OpenSSL::X509::Certificate
  # 直前に検証した証明書のオブジェクトを返します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] で検証が失敗した場合は
  # 証明書チェイン中で検証に失敗した証明書のオブジェクトを返します。
  # 
  # 証明書チェインの各証明書検証後
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])呼び出しに
  # 渡される StoreContext オブジェクトにこのメソッドを呼び出すと
  # 直前に検証した証明書を返します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼ぶ前に
  # このメソッドを呼ぶと空の [[c:OpenSSL::X509::Certificate]] を返します。
  def current_cert; end

  # --- current_crl -> OpenSSL::X509::CRL | nil
  # 直前に検証に利用した CRL のオブジェクトを返します。
  # 
  # 証明書チェインの各証明書検証後
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])呼び出しに
  # 渡される StoreContext オブジェクトにこのメソッドを呼び出すと
  # 直前に検証に利用した CRL オブジェクトを返します。
  def current_crl; end

  # --- error -> Integer
  # 検証時のエラーコードを返します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼びだし、
  # 証明書チェインの各証明書を検証した
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])が呼び出され、
  # StoreContext オブジェクトが渡されますが、このメソッドを呼ぶと
  # 直前の証明書検証結果のエラーコードが得られます。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼び出したあと、
  # このメソッドを呼ぶと検証の最終的な検証結果のエラーコードを返します。
  # 
  # エラーコードの整数値は [[c:OpenSSL::X509]] に定数が定義されています。
  # 詳しくは [[ref:c:OpenSSL::X509#verify_error]] を見てください。
  # 検証に成功した場合は [[m:OpenSSL::X509::V_OK]] を返します。
  # 
  # @see [[m:OpenSSL::X509::Store#error]]
  def error; end

  # --- error=(error)
  # エラーコードを設定します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼びだし、
  # 証明書チェインの各証明書を検証した
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])が呼び出され、
  # StoreContext オブジェクトが渡されますが、このメソッドでエラーコードを
  # 設定し、コールバックの返り値を false にすると、最終的なエラーコードが
  # ここで設定したものになります。[[m:OpenSSL::X509::StoreContext#error_string]] 
  # もその値に応じた文字列が返るようになります。
  # 
  # 例:
  #   require 'openssl'
  # 
  #   store = OpenSSL::X509::Store.new
  #   store.set_default_paths
  #   cert = OpenSSL::X509::Certificate.new(...)
  #   store.verify(cert, chain){|ok,ctx| 
  #     ctx.error = OpenSSL::X509::V_ERR_APPLICATION_VERIFICATION; 
  #   false}  # => false
  #   p store.error # => OpenSSL::X509::V_ERR_APPLICATION_VERIFICATION
  #   p store.error_string # => "application verification failure"
  #   
  # @param error エラーコードの整数値
  # @see [[m:OpenSSL::X509::StoreContext#error]]
  def error=; end

  # --- error_depth -> Integer
  # エラーが起きた場所の深さを返します。
  # 
  # 検証対象の証明書は深さ0、その証明書を発行した CA の証明書は
  # 深さ1、その CA の証明証を発行した上位の CA の証明書は深さ2、…
  # と定義されいてます。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼び出したあと、
  # このメソッドを呼ぶと検証でエラーが起きた場所の深さを返します。
  # 
  # 証明書チェインの各証明書を検証した
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])が検証時に
  # 呼びだされ、StoreContext オブジェクトが渡されますが、そのオブジェクトに
  # 対しこのメソッドを呼びだすと、そこで検証された証明書の
  # 深さが得られます。
  def error_depth; end

  # --- error_string -> String
  # 検証したときのエラー文字列を返します。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼びだし、
  # 証明書チェインの各証明書を検証した
  # コールバック([[m:OpenSSL::X509::Store#verify_callback=]])が呼び出され、
  # StoreContext オブジェクトが渡されますが、このメソッドを呼ぶと
  # 直前の証明書検証結果のエラー文字列が得られます。
  # 
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼び出したあと、
  # このメソッドを呼ぶと検証の最終的な検証結果のエラー文字列を返します。
  # 
  # 検証に成功した場合は "ok" を返します。
  def error_string; end

  # --- flags=(flags)
  # CRL に関するフラグを設定します。
  # 
  # 以下の定数から必要なものを選んで OR 取り、渡します。
  #   * [[m:OpenSSL::X509::V_FLAG_CRL_CHECK]]
  #   * [[m:OpenSSL::X509::V_FLAG_CRL_CHECK_ALL]]
  # 
  # @param flags 設定するフラグ(整数値)
  # @see [[m:OpenSSL::X509::Store#flags=]]
  def flags=; end

  # --- purpose=(purpose)
  # 証明書の使用目的を設定します。
  # 
  # 以下の定数値のうちいずれか1つを渡します。
  #   * [[m:OpenSSL::X509::PURPOSE_ANY]]
  #   * [[m:OpenSSL::X509::PURPOSE_CRL_SIGN]]
  #   * [[m:OpenSSL::X509::PURPOSE_NS_SSL_SERVER]]
  #   * [[m:OpenSSL::X509::PURPOSE_SMIME_ENCRYPT]]
  #   * [[m:OpenSSL::X509::PURPOSE_SMIME_SIGN]]
  #   * [[m:OpenSSL::X509::PURPOSE_SSL_CLIENT]]
  #   * [[m:OpenSSL::X509::PURPOSE_SSL_SERVER]]
  #   * [[m:OpenSSL::X509::PURPOSE_OCSP_HELPER]]
  # 
  # 証明書に記載されている使用目的が適合していない場合には検証が失敗します。
  # @param purpose 証明書の使用目的を表す整数値
  # @see [[m:OpenSSL::X509::Store#purpose=]]
  def purpose=; end

  # --- time=(time)
  # 証明書の有効期限の検証に使う日時を設定します。
  # 
  # デフォルトでは現在時刻が使われます。
  # 
  # @param time 検証に使う日時の [[c:Time]] オブジェクト
  # @see [[m:OpenSSL::X509::Store#time=]]
  def time=; end

  # --- trust=(trust)
  # 
  # @todo
  # 
  # 以下のいずれかの定数の値を指定します。
  # 
  #  * [[m:OpenSSL::X509::TRUST_COMPAT]]
  #  * [[m:OpenSSL::X509::TRUST_EMAIL]]
  #  * [[m:OpenSSL::X509::TRUST_OBJECT_SIGN]]
  #  * [[m:OpenSSL::X509::TRUST_SSL_CLIENT]]
  #  * [[m:OpenSSL::X509::TRUST_SSL_SERVER]]
  #  * [[m:OpenSSL::X509::TRUST_OCSP_REQUEST]]
  #  * [[m:OpenSSL::X509::TRUST_OCSP_SIGN]]
  # 
  # @param trust 整数値
  # @see [[m:OpenSSL::X509::Store#trust=]]
  def trust=; end

  # --- verify -> bool
  # 証明書を検証します。
  # 
  # [[m:OpenSSL::X509::StoreContext.new]] で設定した証明書を検証します。
  # 検証に成功した場合は true を、失敗した場合は false を返します。
  # 
  # 検証の詳細な情報は
  #   * [[m:OpenSSL::X509::StoreContext#error]]
  #   * [[m:OpenSSL::X509::StoreContext#error_string]]
  #   * [[m:OpenSSL::X509::StoreContext#chain]]
  #   * [[m:OpenSSL::X509::StoreContext#current_crl]]
  def verify; end

  # ---new(store, cert, chain=nil) -> OpenSSL::X509::StoreContext
  # 証明書ストアコンテキストを生成します。
  # 
  # store には検証に必要なルート CA 証明書を含む [[c:OpenSSL::X509::Store]]
  # オブジェクトを渡します。 cert は検証対象の証明書、chain は
  # 中間 CA 証明書チェインを証明書の配列で渡します。
  # 
  # @param store ルート CA 群を持っている証明書ストア
  #        ([[c:OpenSSL::X509::Store]] オブジェクト)
  # @param cert 検証対象となる証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param chain 検証に利用する証明書チェイン
  #        ([[c:OpenSSL::X509::Certificate]] オブジェクトの配列)
  # @raise OpenSSL::X509::StoreError コンテキストの生成に失敗した場合に発生します
  def new; end

end
