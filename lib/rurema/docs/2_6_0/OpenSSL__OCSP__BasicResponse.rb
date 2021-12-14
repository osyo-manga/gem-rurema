class OpenSSL::OCSP::BasicResponse
  # --- add_nonce(val=nil) -> self
  # BasicResponse に nonce を追加します。
  # 
  # 引数を省略すると、ランダムな nonce を生成し利用します。
  # 
  # 通常はこのメソッドを使わず [[m:OpenSSL::OCSP::BasicResponse#copy_nonce]] を
  # 用います。
  # 
  # @param val 追加する nonce の値(文字列)
  def add_nonce; end

  # --- add_status(cid, status, reason, revtime, thisupd, nextupd, exts) -> self
  # 証明書の状態の問い合わせの結果をオブジェクトに追加します。
  # 
  # 詳しくは [[m:OpenSSL::OCSP::BasicResponse#status]] を見てください。
  # 
  # @param cid 問い合わせの([[c:OpenSSL::OCSP::CertificateId]] オブジェクト)
  # @param status ステータスコード(整数)
  # @param reason 失効理由コード(整数)
  # @param revtime 失効時刻([[c:Time]] オブジェクトもしくは nil)
  # @param thisupd 最終更新時刻([[c:Time]] オブジェクト)
  # @param nextupd 次回更新時刻([[c:Time]] オブジェクト)
  # @param exts  拡張領域([[c:OpenSSL::X509::Extension]] オブジェクトの配列)
  def add_status; end

  # --- copy_nonce(request) -> Integer
  # request から nonce の値をコピーします。
  # 
  # @param request コピー元のnonceを保持している Request ([[c:OpenSSL::OCSP::Request]] オブジェクト)
  def copy_nonce; end

  # --- sign(signer_cert, signer_key, certs = [], flags=0) -> self
  # Response に署名します。
  # 
  # OCSP レスポンダ(もしくは CA)はレスポンスに署名をすることで、
  # レスポンスの内容を保証します。
  # 
  # flags には以下の値の OR を渡すことができます。
  #   * [[m:OpenSSL::OCSP::NOTIME]]
  #   * [[m:OpenSSL::OCSP::RESPID_KEY]]
  #   * [[m:OpenSSL::OCSP::NOCERTS]]
  # 
  # certs に証明書の配列を渡すことで、この署名を検証するために
  # 必要となる別の証明書を付加することができます。
  # 
  # @param signer_cert 署名者の証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param signer_key 証明に用いる秘密鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @param certs 添付する証明書([[c:OpenSSL::X509::Certificate]] オブジェクトの配列)
  # @param flags フラグ(整数)
  def sign; end

  # --- status -> [[OpenSSL::OCSP::CertificateId, Integer, Integer, Time|nil, Time, Time|nil, [OpenSSL::X509::Extension]]]
  # 証明書の状態の問い合わせの結果を返します。
  # 
  # この返り値には複数の問い合わせ結果が含まれています。
  # 個々の結果は以下の内容の配列です。
  #   [ 問い合わせの CertificateId オブジェクト,
  #     ステータスコード,
  #     失効理由コード,
  #     失効時刻,
  #     最終更新時刻,
  #     次回更新時刻,
  #     拡張領域 ]
  # 
  # ステータスコードはいかのいずれかの値を取ります
  #   * [[m:OpenSSL::OCSP::V_CERTSTATUS_GOOD]] 正常
  #   * [[m:OpenSSL::OCSP::V_CERTSTATUS_REVOKED]] 失効
  #   * [[m:OpenSSL::OCSP::V_CERTSTATUS_UNKNOWN]] 不明
  # 
  # 失効理由コードは以下のいずれかを返します。
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_NOSTATUS]] 
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_UNSPECIFIED]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_KEYCOMPROMISE]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_CACOMPROMISE]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_AFFILIATIONCHANGED]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_SUPERSEDED]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_CESSATIONOFOPERATION]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_CERTIFICATEHOLD]]
  #   * [[m:OpenSSL::OCSP::REVOKED_STATUS_REMOVEFROMCRL]]
  # 
  # 失効時刻は証明書が失効した時刻を表します。失効していない場合は nil を
  # 返します。
  # 
  # 最終更新時刻は失効情報が更新された時刻を表します。この時刻が現在時刻より
  # 先である場合には、この Response の内容は信用できません。
  # 
  # 次回更新時刻は、失効情報の更新予定時刻です。
  # この時刻が現在時刻より
  # 後である場合には、この Response の内容は信用できません。
  # 次回更新時刻が指定されていない場合には nil を返します。
  # 
  # 拡張領域には、[[c:OpenSSL::X509::Extension]] の配列が渡されます。
  # 
  # 結果をどのように解釈すべきか、より詳しくは [[RFC:2560]] や X.509 を見てください。
  # 
  # 例:
  #   res.basic.status  
  #   # => [
  #   #      [#<OpenSSL::OCSP::CertificateId:0x00000000e3c290>, # certificate ID
  #   #       0,                                                # status code
  #   #       0,                                                # reason code
  #   #       nil,                                              # revoked time
  #   #       2011-06-29 05:24:43 UTC,                          # update time
  #   #       2011-07-06 05:24:43 UTC,                          # next update time
  #   #       []]                                               # extensions
  #   #    ]
  # 
  # @raise OpenSSL::OCSP::OCSPError ステータスの読み出しに失敗した場合に発生します
  def status; end

  # --- verify(certs, store, flags=0) -> bool
  # 署名を検証します。
  # 
  # flagsには以下の値の OR を取ったものを渡します。
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

  # --- new -> OpenSSL::OCSP::BasicResponse
  # 空の BasicResponse オブジェクトを生成します。
  # 
  # @see [[m:OpenSSL::OCSP::Response.create]]
  def new; end

end
