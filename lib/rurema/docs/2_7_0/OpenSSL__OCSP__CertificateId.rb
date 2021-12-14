class OpenSSL::OCSP::CertificateId
  # --- cmp(other) -> bool
  # 2つの CertificateId オブジェクトを比較し、
  # 同じものであれば真を返します。
  # 
  # @param other 比較する [[c:OpenSSL::OCSP::CertificateId]] オブジェクト
  # @see [[m:OpenSSL::OCSP::CertificateId#cmp_issuer]]
  def cmp; end

  # --- cmp_issuer(other) -> bool
  # 2つの CertificateId オブジェクトの issuer(証明書発行者)を比較し、
  # 同じ issuer であれば真を返します。
  # 
  # @param other 比較する [[c:OpenSSL::OCSP::CertificateId]] オブジェクト
  # @see [[m:OpenSSL::OCSP::CertificateId#cmp]]
  def cmp_issuer; end

  # --- serial -> OpenSSL::BN
  # 証明書の識別番号を返します。
  # 
  # @see [[m:OpenSSL::X509::Certificate#serial]]
  def serial; end

  # --- new(subject, issuer, digest=nil) -> OpenSSL::OCSP::CertificateId
  # CertificateId オブジェクトを生成します。
  # 
  # subject には問合せ対象の証明書を、issuerにはsubjectのissuer(発行者)
  # の証明書を渡します。
  # 
  # @param subject 問合せ対象の証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param issuer subjectのissuer(発行者)の証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param digest issuerの名前のハッシュ値、issuerの証明書の公開鍵のハッシュ値を取るためのハッシュアルゴリズム。nilでデフォルトのアルゴリズムが使われます
  # 
  # @raise OpenSSL::OCSP::OCSPError オブジェクトの生成に失敗した際に発生します
  def new; end

end
