class OpenSSL::X509::ExtensionFactory
  # --- config -> OpenSSL::Config
  # 自身に設定されているコンフィグファイルオブジェクトを設定します。
  def config; end

  # --- config=(config) 
  # 自身にコンフィグファイルオブジェクトを設定します。
  # 
  # 例
  #   require 'openssl'
  #   factory.config = OpenSSL::Config.load(OpenSSL::Config::DEFAULT_CONFIG_FILE)
  # 
  # @param config 設定ファイル([[c:OpenSSL::Config]] オブジェクト)
  def config=; end

  # --- create_ext(oid, value, critical = false)  -> OpenSSL::X509::Extension
  # [[c:OpenSSL::X509::Extension]] のインスタンスを生成して返します。
  # 
  # @param oid 拡張領域の識別子を表す文字列
  # @param value 拡張領域の値を表す文字列
  # @param critical 重要度(真偽値)
  def create_ext; end

  # --- create_ext_from_array(ary) -> OpenSSL::X509::Extension
  # [oid, value, critical] もしくは [oid, value] という配列から
  # [[c:OpenSSL::X509::Extension]] オブジェクトを生成します。
  # 
  # @param ary 生成する拡張領域のデータの配列
  # @see [[m:OpenSSL::X509::ExtensionFactory#create_ext]]
  def create_ext_from_array; end

  # --- create_ext_from_hash(hash)  -> OpenSSL::X509::Extension
  # ハッシュから [[c:OpenSSL::X509::Extension]] オブジェクトを生成します。
  # 
  # 渡すハッシュテーブルは 
  #   {"oid" => OID文字列, "value" => value文字列, "critical" => 真偽値 }
  # という内容が必要です。"critical" を省略した場合は false が
  # 渡されるのと同じになります。
  # 
  # @param hash 生成する拡張領域のデータのハッシュテーブル
  # @see [[m:OpenSSL::X509::ExtensionFactory#create_ext]]
  def create_ext_from_hash; end

  # --- create_ext_from_string(str)  -> OpenSSL::X509::Extension
  # 文字列から [[c:OpenSSL::X509::Extension]] オブジェクトを生成します。
  # 
  # 文字列は "oid = value" もしくは "oid = critical, value" という
  # 形式である必要があります。
  # 
  # @param str 生成する拡張領域のデータの文字列
  # @see [[m:OpenSSL::X509::ExtensionFactory#create_ext]]
  def create_ext_from_string; end

  # --- create_extension(obj)  -> OpenSSL::X509::Extension
  # --- create_extension(oid, value, critical=false)  -> OpenSSL::X509::Extension
  # [[c:OpenSSL::X509::Extension]] のインスタンスを生成して返します。
  # 
  # 引数の個数が1個である場合、それが配列、ハッシュ、文字列のいずれかである
  # ならば、
  # [[m:OpenSSL::X509::ExtensionFactory#create_ext_from_array]]、
  # [[m:OpenSSL::X509::ExtensionFactory#create_ext_from_hash]]、
  # [[m:OpenSSL::X509::ExtensionFactory#create_ext_from_string]]、
  # がそれぞれ呼びだされてオブジェクトを生成します。
  # 
  # 引数が2個以上である場合は、
  # [[m:OpenSSL::X509::ExtensionFactory#create_ext]] が呼びだされて
  # オブジェクトを生成します。
  # 
  # @param obj 拡張領域のデータ。配列、ハッシュ、文字列のいずれか
  # @param oid 拡張領域の識別子を表す文字列
  # @param value 拡張領域の値を表す文字列
  # @param critical 重要度(真偽値)
  def create_extension; end

  # --- crl -> OpenSSL::X509::CRL | nil
  # 自身に設定された証明書失効リストオブジェクトを返します。
  # 
  # 設定されていない場合は nil を返します。
  def crl; end

  # --- crl=(crl)
  # 自身に証明書失効リストオブジェクトを設定します。
  # 
  # @param crl 設定する証明書失効リスト([[c:OpenSSL::X509::CRL]])オブジェクト
  # @see [[m:OpenSSL::X509::ExtensionFactory.new]]
  def crl=; end

  # --- issuer_certificate -> OpenSSL::X509::Certificate | nil
  # 自身に設定されている発行者(issuer)の証明書オブジェクトを返します。
  # 
  # 証明書が設定されていない場合は nil を返します。
  def issuer_certificate; end

  # --- issuer_certificate=(cert)
  # 自身に発行者(issuer)の証明書オブジェクトを設定します。
  # 
  # @param cert 設定する証明書([[c:OpenSSL::X509::Certificate]])オブジェクト
  # @see [[m:OpenSSL::X509::ExtensionFactory.new]]
  def issuer_certificate=; end

  # --- subject_certificate -> OpenSSL::X509::Certificate | nil
  # 自身に設定されている所有者(subject)の証明書オブジェクトを返します。
  # 
  # 証明書が設定されていない場合は nil を返します。
  def subject_certificate; end

  # --- subject_certificate=(name)
  # 自身に所有者(subject)の証明書オブジェクトを設定します。
  # 
  # @param cert 設定する証明書([[c:OpenSSL::X509::Certificate]])オブジェクト
  # @see [[m:OpenSSL::X509::ExtensionFactory.new]]
  def subject_certificate=; end

  # --- subject_request -> OpenSSL::X509::Request | nil
  # 自身に設定されている証明書署名要求オブジェクトを返します。
  # 
  # 設定されていない場合は nil を返します。
  def subject_request; end

  # --- subject_request=(req)
  # 自身に証明書署名要求オブジェクトを設定します。
  # 
  # @param  req 設定する証明書署名要求([[c:OpenSSL::X509::Request]])オブジェクト
  # @see [[m:OpenSSL::X509::ExtensionFactory.new]]
  def subject_request=; end

  # --- new(issuer_cert=nil, subject_cert=nil, subject_req=nil, crl=nil) -> OpenSSL::X509::ExtensionFactory
  # ExtensionFactory オブジェクトを生成します。
  # 
  # 証明書の発行者や所有者の [[c:OpenSSL::X509::Certificate]] オブジェクトや
  # [[c:OpenSSL::X509::Request]]、[[c:OpenSSL::X509::CRL]] オブジェクトを
  # 渡すことによって、拡張領域の中身を ExtensionFactory オブジェクトが
  # 計算することができます。
  # 例えば、"subjectKeyIdentifier" 拡張領域は証明書の一部のハッシュ値
  # を値として持ちますが、
  # [[c:OpenSSL::X509::Certificate]] オブジェクトをあらかじめ渡しておくことによって
  # [[m:OpenSSL::X509::ExtensionFactory#create_extension]] がその値を計算します。
  # これらの情報が必要ない場合は nil を渡します。
  # 
  # 以下のメソッドによってオブジェクト生成後に証明書オブジェクト等を
  # 設定することができます。
  #   * [[m:OpenSSL::X509::ExtensionFactory#issuer_certificate=]]
  #   * [[m:OpenSSL::X509::ExtensionFactory#subject_certificate=]]
  #   * [[m:OpenSSL::X509::ExtensionFactory#subject_request=]]
  #   * [[m:OpenSSL::X509::ExtensionFactory#crl=]] 
  # 
  # @param issuer_cert 証明書発行者、すなわち CA の 
  #        [[c:OpenSSL::X509::Certificate]] オブジェクト
  # @param subject_cert 証明書所有者の
  #        [[c:OpenSSL::X509::Certificate]] オブジェクト
  # @param subject_req 関連する証明書署名要求([[c:OpenSSL::X509::Request]])
  #        オブジェクト
  # @param crl 関連する 証明書失効リスト([[c:OpenSSL::X509::CRL]])オブジェクト
  def new; end

end
