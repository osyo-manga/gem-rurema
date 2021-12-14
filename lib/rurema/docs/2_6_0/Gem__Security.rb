module Gem::Security
  # --- add_trusted_cert(cert, options = {}) -> nil
  # 
  # 信頼済み証明書リストに与えられた証明書を追加します。
  # 
  # Note: しばらくの間 OPT[:trust_dir] に保存されますが、今後変更される可能性があります。
  # 
  # @param cert 証明書を指定します。
  # 
  # @param options オプションを指定します。
  def add_trusted_cert; end

  # --- build_cert(name, key, options = {}) -> OpenSSL::X509::Certificate
  # 
  # 与えられた DN と秘密鍵を使用して証明書を作成します。
  # 
  # @param name DN を指定します。
  # 
  # @param key 秘密鍵を指定します。
  # 
  # @param options オプションを指定します。
  def build_cert; end

  # --- build_self_signed_cert(email_addr, options = {}) -> Hash
  # 
  # 与えられたメールアドレスを元にして自己署名証明書を作成します。
  # 
  # @param email_addr メールアドレスを指定します。
  # 
  # @param options オプションを指定します。
  # 
  # @return 鍵と証明書とそれらを保存したパスを表すハッシュを返します。
  def build_self_signed_cert; end

  # --- sign_cert(cert, signing_key, signing_cert, options = {}) -> OpenSSL::X509::Certificate
  # 
  # 与えられた署名用の鍵と証明書を用いて証明書に署名します。
  # 
  # @param cert 署名する証明書を指定します。
  # 
  # @param signing_key 署名にしようする鍵を指定します。
  # 
  # @param signing_cert 署名に使用する証明書を指定します。
  # 
  # @param options オプションを指定します。
  # 
  # @return 署名された証明書を返します。
  def sign_cert; end

  # --- verify_trust_dir(path, perms)
  # 信頼するディレクトリが存在することを確認します。
  # 
  # 与えられたパスが存在する場合、ディレクトリであることを確認します。
  # そうでない場合は、ディレクトリを作成してパーミッションを変更します。
  # 
  # @param path 確認するパスを指定します。
  # 
  # @param perms ディレクトリを作成する場合のパーミッションを指定します。
  # 
  # @raise Gem::Security::Exception path がディレクトリでない場合に発生します。
  def verify_trust_dir; end

  # --- AlmostNoSecurity -> Gem::Security::Policy
  # 
  # ほとんどの検証を行わないポリシーです。
  # 
  # 署名されたデータの検証のみ行います。
  # 
  # このポリシーは何もしないよりはマシですが、ほとんど役に立たない上、
  # 簡単に騙すことができるので、使用しないでください。
  # 
  #     :verify_data      => true,
  #     :verify_signer    => false,
  #     :verify_chain     => false,
  #     :verify_root      => false,
  #     :only_trusted     => false,
  #     :only_signed      => false
  def AlmostNoSecurity; end

  # --- HighSecurity -> Gem::Security::Policy
  # 
  # 高レベルのセキュリティポリシーです。
  # 
  # 署名された Gem のみインストール可能です。
  # 
  # ルート証明書のみを信頼して、全ての検証を行います。
  # ただし、信頼するように指定された証明書は信頼します。
  # 
  # このセキュリティポリシーはバイパスするのがものすごく困難です。
  # 
  #     :verify_data      => true,
  #     :verify_signer    => true,
  #     :verify_chain     => true,
  #     :verify_root      => true,
  #     :only_trusted     => true,
  #     :only_signed      => true
  def HighSecurity; end

  # --- LowSecurity -> Gem::Security::Policy
  # 
  # 低レベルのセキュリティのポリシーです。
  # 
  # 署名されたデータと署名者の検証を行います。
  # 
  # このポリシーは何もしないよりはマシですが、ほとんど役に立たない上、
  # 簡単に騙すことができるので、使用しないでください。
  # 
  # 
  #     :verify_data      => true,
  #     :verify_signer    => true,
  #     :verify_chain     => false,
  #     :verify_root      => false,
  #     :only_trusted     => false,
  #     :only_signed      => false
  def LowSecurity; end

  # --- MediumSecurity -> Gem::Security::Policy
  # 
  # 中レベルのセキュリティポリシーです。
  # 
  # ルート証明書のみを信頼して、全ての検証を行います。
  # ただし、信頼するように指定された証明書は信頼します。
  # 
  # このポリシーは便利ですが、署名無しのパッケージを許可しているので、
  # 邪悪な人物がパッケージの署名を単純に削除して検証をパスさせることができます。
  # 
  #     :verify_data      => true,
  #     :verify_signer    => true,
  #     :verify_chain     => true,
  #     :verify_root      => true,
  #     :only_trusted     => true,
  #     :only_signed      => false
  def MediumSecurity; end

  # --- NoSecurity -> Gem::Security::Policy
  # 
  # セキュリティなしのポリシーです。
  # 
  # 全ての検証を行いません。
  # 
  #     :verify_data      => false,
  #     :verify_signer    => false,
  #     :verify_chain     => false,
  #     :verify_root      => false,
  #     :only_trusted     => false,
  #     :only_signed      => false
  def NoSecurity; end

  # --- OPT -> Hash
  # 
  # ほとんどのメソッドで使用するデフォルトのオプションを返します。
  def OPT; end

  # --- Policies -> Hash
  # 
  # 使用可能なポリシーの一覧を返します。
  # 
  #  * [[m:Gem::Security::NoSecurity]]
  #  * [[m:Gem::Security::AlmostNoSecurity]]
  #  * [[m:Gem::Security::LowSecurity]]
  #  * [[m:Gem::Security::MediumSecurity]]
  #  * [[m:Gem::Security::HighSecurity]]
  def Policies; end

end
