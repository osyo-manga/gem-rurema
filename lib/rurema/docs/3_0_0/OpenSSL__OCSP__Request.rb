class OpenSSL::OCSP::Request
  # --- add_certid(cid) -> self
  # Request オブジェクトに問い合わせ対象の証明書情報を追加します。
  # 
  # 証明書情報は [[c:OpenSSL::OCSP::CertificateId]] の形で渡す必要があります。
  # 
  # @param cid 問い合わせ対象の証明書情報([[c:OpenSSL::OCSP::CertificateId]] オブジェクト)
  # @raise OpenSSL::OCSP::OCSPError 追加に失敗した場合に発生します。
  # @see [[m:OpenSSL::OCSP::Request#certid]]
  def add_certid; end

  # --- add_nonce(nonce = nil) -> self
  # Request オブジェクトに nonce を追加します。
  # 
  # nonce とは、リプレイ攻撃を防止するために設定する乱数です。
  # 
  # @param nonce 設定するnonce文字列。nilの場合は適当な乱数を自動で設定します
  def add_nonce; end

  # --- certid -> [OpenSSL::OCSP::CertificateId]
  # Request オブジェクトが保持している問い合わせ対象の証明書の情報を
  # 配列で返します。
  # 
  # @see [[m:OpenSSL::OCSP::Request#add_certid]]
  def certid; end

  # --- check_nonce(basic_resp) -> Integer
  # 自身の nonce とレスポンスの nonce が整合しているか
  # チェックします。
  # 
  # -1 から 3 までの整数を返します。それぞれの意味は以下の通りです。
  #   * -1 自身にしか nonce が設定されていない
  #   * 0 nonce が自身とレスポンスの両方にあるが等しくない
  #   * 1 nonce が自身とレスポンスの両方にあり等しい
  #   * 2 nonce が自身とレスポンスのどちらにもない
  #   * 3 nonce がレスポンスにしか設定されていない
  # 
  # 0 は明らかに不正なので、これは必ずチェックする必要があります。
  # 1 は nonce が正しいということを意味します。
  # それ以外は、場合(サーバの実装など)
  # によって不正であったりそうでなかったりしますので、適切にチェック
  # する必要があります。
  # 
  # @param basic_resp 比較するレスポンス([[c:OpenSSL::OCSP::BasicResponse]] オブジェクト)
  def check_nonce; end

  # --- sign(signer_cert, signer_key, certs=nil, flags=nil) -> self
  # Request オブジェクトに署名をします。
  # 
  # この署名はリクエスタが自分自身を証明するために署名します。
  # OCSP レスポンダはこの署名を確認します。
  # Request に対する署名は必須ではありません。
  # 
  # certs に証明書の配列を渡すことで、この署名を検証するために
  # 必要となる別の証明書を付加することができます。
  # 
  # @param signer_cert 署名者の証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param signer_key 証明に用いる秘密鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @param certs 添付する証明書([[c:OpenSSL::X509::Certificate]] オブジェクトの配列)
  # @param flags フラグ(整数)
  # 
  # @raise OpenSSL::OCSP::OCSPError 署名に失敗した場合に発生します
  def sign; end

  # --- to_der -> String
  # Request オブジェクトを DER 形式の文字列に変換します。
  def to_der; end

  # --- verify(certs, store, flags=0) -> bool
  # Request オブジェクトの署名を検証します。
  # 
  # 検証に成功した場合は真を返します。
  # 
  # flags には以下の値の OR を取ったものを渡します。
  #   * [[m:OpenSSL::OCSP::TRUSTOTHER]]
  #   * [[m:OpenSSL::OCSP::NOSIGS]]
  #   * [[m:OpenSSL::OCSP::NOVERIFY]]
  #   * [[m:OpenSSL::OCSP::NOINTERN]]
  # 
  # TRUSTOTHER を有効にすると certs で指定した証明書を検証せずに信頼します。
  # 
  # @param certs 検証に用いる追加的な証明書([[c:OpenSSL::X509::Certificate]] オブジェクトの配列)
  # @param store 検証に用いる証明書ストア([[c:OpenSSL::X509::Store]] オブジェクト)
  # @param flags フラグ(整数)
  def verify; end

  # --- new -> OpenSSL::OCSP::Request
  # --- new(der) -> OpenSSL::OCSP::Request
  # 
  # Request オブジェクトを生成します。
  # 引数なしの場合は、中身が空のオブジェクトを生成します。
  # 文字列を渡した場合は DER 形式であると見なして読み込みます。
  # 
  # @param der リクエストの情報をエンコードした DER 形式の文字列
  # @raise OpenSSL::OCSP::OCSPError 文字列のデコードに失敗した場合に発生します
  def new; end

end
