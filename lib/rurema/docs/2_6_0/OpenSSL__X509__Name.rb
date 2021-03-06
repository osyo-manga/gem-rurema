class OpenSSL::X509::Name
  # --- cmp(other) ->  -1 | 0 | 1 
  # --- <=>(other) ->  -1 | 0 | 1 
  # 他の [[c:OpenSSL::X509::Name]] オブジェクトと比較します。
  # 
  # 自身が other と一致する場合は 0、otherより大きい場合は1、
  # 小さい場合は -1 を返します。
  # 
  # @param other 比較するオブジェクト
  def <=>; end

  # --- add_entry(oid, value, type = nil)
  # 新しい属性を追加します。
  # 
  # @param oid 属性型文字列
  # @param value 属性値文字列
  # @param type 属性値の(ASN.1の)型、省略時は [[c:OpenSSL::X509::Name::OBJECT_TYPE_TEMPLATE]] と oid から型が決まる
  # @raise OpenSSL::X509::NameError 属性の追加に失敗した場合に発生します
  def add_entry; end

  # --- hash_old -> Integer
  # 
  # OpenSSL 0.9.8 と互換な古い方式のハッシュ関数の
  # ハッシュ値を返します。
  # 
  # 内部では OpenSSL の X509_NAME_hash_old を呼び出します。
  def hash_old; end

  # --- to_a -> [[String, String, Integer]]
  # 
  # 内容を配列にして返します。
  # 
  # 配列の各要素は、[属性型文字列、属性値文字列、属性値の型を表す整数([[c:OpenSSL::ASN1]]以下の各定数で定義されているASN1の型)] という3要素の配列です。
  # 
  # 例:
  #   require 'openssl'
  #   n = OpenSSL::X509::Name.parse('/C=JP/ST=Kanagawa/L=Yokohama/O=Example Company/OU=Lab3/CN=foobar/emailAddress=foobar@lab3.example.co.jp')
  #   n.to_a
  #   # => [["C", "JP", 19], ["ST", "Kanagawa", 12], ["L", "Yokohama", 12], ["O", "Example Company", 12], ["OU", "Lab3", 12], ["CN", "foobar", 12], ["emailAddress", "foobar@lab3.example.co.jp", 22]]
  def to_a; end

  # --- to_der -> String
  # 
  # DER 形式のバイト列を返します。
  def to_der; end

  # --- to_s(flags=nil) -> String
  # 
  # DNの文字列表現を返します。
  # 
  # flags には通常は以下のいずれかを渡します。
  #   * nil
  #   * [[m:OpenSSL::X509::Name::COMPAT]]
  #   * [[m:OpenSSL::X509::Name::RFC2253]]
  #   * [[m:OpenSSL::X509::Name::ONELINE]]
  #   * [[m:OpenSSL::X509::Name::MULTILINE]]
  # 
  # * 
  # 例:
  #   require 'openssl'
  #   n = OpenSSL::X509::Name.parse('/C=JP/ST=Kanagawa/L=Yokohama/O=Example Company/OU=Lab3/CN=foobar/emailAddress=foobar@lab3.example.co.jp')
  #   n.to_s 
  #   # => "/C=JP/ST=Kanagawa/L=Yokohama/O=Example Company/OU=Lab3/CN=foobar/emailAddress=foobar@lab3.example.co.jp"
  #   n.to_s(OpenSSL::X509::Name::COMPAT)
  #   # => "C=JP, ST=Kanagawa, L=Yokohama, O=Example Company, OU=Lab3, CN=foobar/emailAddress=foobar@lab3.example.co.jp"
  #   n.to_s(OpenSSL::X509::Name::RFC2253)
  #   # => "emailAddress=foobar@lab3.example.co.jp,CN=foobar,OU=Lab3,O=Example Company,L=Yokohama,ST=Kanagawa,C=JP"
  #   n.to_s(OpenSSL::X509::Name::ONELINE)
  #   # => "C = JP, ST = Kanagawa, L = Yokohama, O = Example Company, OU = Lab3, CN = foobar, emailAddress = foobar@lab3.example.co.jp"
  #   n.to_s(OpenSSL::X509::Name::MULTILINE)
  #   # => "countryName               = JP\nstateOrProvinceName       = Kanagawa\nlocalityName              = Yokohama\norganizationName          = Example Company\norganizationalUnitName    = Lab3\ncommonName                = foobar\nemailAddress              = foobar@lab3.example.co.jp"
  def to_s; end

  # --- new -> OpenSSL::X509::Name
  # --- new(ary, template = OBJECT_TYPE_TEMPLATE) -> OpenSSL::X509::Name
  # --- new(obj) -> OpenSSL::X509::Name
  # [[c:OpenSSL::X509::Name]] オブジェクトを生成します。
  # 
  # 引数を与えなかった場合は空のオブジェクトを返します。
  # 
  # 第1引数として配列を与えた場合には、
  # その内容が属性型と属性値の文字列のペアであると仮定して、オブジェクトを生成します。
  # この場合値のデータ型(ASN.1の型)は template で与えたハッシュによって定まります。
  # 
  # obj が [[c:OpenSSL::X509::Name]] である場合には内容を複製した
  # オブジェクトを返します。
  # 
  # それ以外の場合は obj の to_der メソッドを読んで DER 形式のバイト列に変換し、
  # そこから内容を作ります。
  # 
  # 例:
  #     require 'openssl'
  #     OpenSSL::X509::Name.new([["C", "JP"], ["ST", "Kanagawa"], ["L", "Yokohama"], ["O", "Example Company"], ["OU", "Lab3"], ["CN", "foobar"], ["emailAddress", "foobar@lab3.example.co.jp"]])
  #     # => OpenSSL::X509::Name object: /C=JP/ST=Kanagawa/L=Yokohama/O=Example Company/OU=Lab3/CN=foobar/emailAddress=foobar@lab3.example.co.jp
  # 
  # @param ary 属性型と属性値のペアの配列
  # @param obj 識別子オブジェクトを生成するための情報
  # @param template objに配列を与えた場合には属性型に対応するデータ型を表わすハッシュ
  # @raise OpenSSL::X509::NameError 与えたデータが不正である場合など、オブジェクトが生成できなかった場合に発生します
  def new; end

  # --- parse(str, template=OBJECT_TYPE_TEMPLATE) -> OpenSSL::X509::Name
  # --- parse_openssl(str, template=OBJECT_TYPE_TEMPLATE) -> OpenSSL::X509::Name
  # 文字列をパースして [[c:OpenSSL::X509::Name]] オブジェクトを返します。
  # 
  # 例:
  #   require 'openssl'
  #   OpenSSL::X509::Name.parse('/C=JP/ST=Kanagawa/L=Yokohama/O=Example Company/OU=Lab3/CN=foobar/emailAddress=foobar@lab3.example.co.jp')
  # 
  # @param str パースする文字列
  # @param template 属性型に対応するデータ型を表わすハッシュ
  def parse; end

  # --- parse_rfc2253(str, template=OBJECT_TYPE_TEMPLATE) -> OpenSSL::X509::Name
  # RFC2253形式の文字列を
  # パースして [[c:OpenSSL::X509::Name]] オブジェクトを返します。
  # 
  # @param str パースする文字列
  # @param template 属性型に対応するデータ型を表わすハッシュ
  def parse_rfc2253; end

  # --- COMPAT -> Integer
  # [[m:OpenSSL::X509::Name#to_s]] のフラグとして使います。
  def COMPAT; end

  # --- DEFAULT_OBJECT_TYPE -> Integer
  # 属性値のデフォルトの ASN.1 の型です。
  # 
  # [[m:OpenSSL::X509::Name.parse]] や [[m:OpenSSL::X509::Name.new]] で
  # template に指定されなかった属性はこの型であると仮定して処理されます。
  # 
  # [[m:OpenSSL::ASN1::UTF8STRING]] を返します。
  def DEFAULT_OBJECT_TYPE; end

  # --- MULTILINE -> Integer
  # [[m:OpenSSL::X509::Name#to_s]] のフラグとして使います。
  # 
  # 複数行でフォーマットされます。
  def MULTILINE; end

  # --- OBJECT_TYPE_TEMPLATE -> { String => Integer }
  # 属性型に対応する ASN.1の型を格納したハッシュです。
  # 
  # [[m:OpenSSL::X509::Name.parse]] や [[m:OpenSSL::X509::Name.new]] 
  # などでデフォルト値として使われます。
  # 
  # キーは属性型文字列で、ASN.1の型を表わす整数が対応します。
  # 
  # 以下の文字列がキーです。
  #   'C', 'countryName', 'serialNumber', 'dnQualifier',
  #   'DC', 'domainComponent', 'emailAddress'
  def OBJECT_TYPE_TEMPLATE; end

  # --- ONELINE -> Integer
  # [[m:OpenSSL::X509::Name#to_s]] のフラグとして使います。
  # 
  # 1行で読みやすくフォーマットされます。
  def ONELINE; end

  # --- RFC2253 -> Integer
  # [[m:OpenSSL::X509::Name#to_s]] のフラグとして使います。
  # 
  # [[RFC:2253]] 互換方式でフォーマットされます。
  def RFC2253; end

end
