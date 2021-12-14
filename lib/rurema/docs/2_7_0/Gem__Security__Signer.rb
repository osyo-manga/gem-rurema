class Gem::Security::Signer
  # --- cert_chain -> Array
  # 
  # 証明書チェーンを返します。
  def cert_chain; end

  # --- cert_chain=(cert_chain)
  # 
  # 証明書チェーンをセットします。
  # 
  # @param cert_chain 証明書チェーンを指定します。
  def cert_chain=; end

  # --- key -> OpenSSL::PKey::PKey
  # 
  # 鍵を返します。
  def key; end

  # --- key=(key)
  # 
  # 鍵をセットします。
  def key=; end

  # --- sign(data)
  # 自身に設定済みのダイジェストアルゴリズムを用いて与えられたデータに署名します。
  # 
  # @param data 署名対象のデータを指定します。
  def sign; end

  # --- new(key, cert_chain) -> Gem::Security::Signer
  # 
  # 与えられた鍵と証明書チェーンを用いて自身を初期化します。
  # 
  # @param key 鍵を指定します。
  # 
  # @param cert_chain 証明書チェーンを指定します。
  def new; end

end
