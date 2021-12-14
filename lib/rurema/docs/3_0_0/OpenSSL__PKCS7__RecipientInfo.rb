class OpenSSL::PKCS7::RecipientInfo
  # --- enc_key -> String
  # 送信先の公開鍵で暗号化された共通鍵を返します。
  # 
  # 詳しくは [[RFC:2315]] の 10.2、10.3 を参照してください。
  # 
  # 通常は [[m:OpenSSL::PKCS7#decrypt]] で復号化するので
  # あまり使わないでしょう。
  def enc_key; end

  # --- issuer -> OpenSSL::X509::Name
  # 送信先の証明書の発行者の名前(DN)を返します。
  # 
  # これと [[m:OpenSSL::PKCS7::RecipientInfo#serial]] で
  # 送信先を一意に識別します。
  def issuer; end

  # --- serial -> Integer
  # 送信先の証明書の識別番号を返します。
  # 
  # これと [[m:OpenSSL::PKCS7::RecipientInfo#issuer]] で
  # 送信先を一意に識別します。
  def serial; end

  # --- new(cert) -> RecipientInfo
  # 送信先オブジェクトを証明書から生成します。
  # 
  # @param cert 証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  def new; end

end
