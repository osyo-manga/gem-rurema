class Gem::Security::Policy
  # --- only_signed -> bool
  # 
  # この値が真である場合は、署名付きの Gem のみインストールします。
  def only_signed; end

  # --- only_signed=(flag)
  # 
  # 署名付きの Gem のみインストールするかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def only_signed=; end

  # --- only_trusted -> bool
  # 
  # この値が真である場合は、検証済みの Gem のみインストールします。
  def only_trusted; end

  # --- only_trusted=(flag)
  # 
  # 検証済みの Gem のみインストールするかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def only_trusted=; end

  # --- verify_chain -> bool
  # 
  # この値が真である場合は、証明書チェーンを検証します。
  def verify_chain; end

  # --- verify_chain=(flag)
  # 
  # 証明書チェーンを検証するかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def verify_chain=; end

  # --- verify_data -> bool
  # 
  # この値が真である場合は、データを検証します。
  def verify_data; end

  # --- verify_data=(flag)
  # 
  # データを検証するかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def verify_data=; end

  # --- verify_gem(signature, data, chain, time = Time.now) -> Array
  # 
  # 与えられたデータを与えられた署名と証明書チェーンで検証します。
  # 
  # @param signature 署名を指定します。
  # 
  # @param data 検証するデータを指定します。
  # 
  # @param chain 検証で使用する証明書チェーンを指定します。
  # 
  # @param time この時刻に有効であることを検証する。
  # 
  # @raise Gem::Security::Exception 検証に失敗した場合に発生します。
  def verify_gem; end

  # --- verify_root -> bool
  # 
  # この値が真である場合は、証明書チェーンのルートを検証します。
  def verify_root; end

  # --- verify_root=(flag)
  # 
  # 証明書チェーンのルートを検証するかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def verify_root=; end

  # --- verify_signer -> bool
  # 
  # この値が真である場合は、署名者を検証します。
  def verify_signer; end

  # --- verify_signer=(flag)
  # 
  # 署名者を検証するかどうかを設定します。
  # 
  # @param flag 真、または偽を指定します。
  def verify_signer=; end

  # --- new(policy = {}, options = {}) -> Gem::Security::Policy
  # 
  # @param policy モードを指定します。
  # 
  # @param options その他のオプションを指定します。
  def new; end

  # --- trusted_cert_path(cert, options) -> String
  # 
  # 与えられた証明書へのパスを返します。
  # 
  # @param cert 証明書オブジェクトを指定します。
  # 
  # @param options その他のオプションを指定します。
  def trusted_cert_path; end

end
