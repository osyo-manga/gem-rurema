class OpenSSL::X509::Extension
  # ---critical=(bool)
  # その拡張領域の重要度(critical)を真偽値で設定します。
  # 
  # @param bool 設定する重要度の真偽値
  # @see [[c:OpenSSL::X509::Extension#critical?]]
  def critical=; end

  # ---critical? -> bool
  # その拡張領域の重要度(critical)を返します。
  # 
  # @see [[c:OpenSSL::X509::Extension#critical=]]
  def critical?; end

  # ---oid -> String
  # 拡張領域の識別子(extnID)をOIDの文字列で返します。
  # 
  # @see [[c:OpenSSL::X509::Extension#oid=]]
  def oid; end

  # ---oid=(oid)
  # 
  # 拡張領域の識別子(extnID)をOIDの文字列で設定します。
  # 
  # @param oid OIDの文字列
  # @raise OpenSSL::X509::Extension 識別子の設定に失敗した場合に発生します
  # @see [[c:OpenSSL::X509::Extension#oid]]
  def oid=; end

  # --- to_a -> [String, String, bool]
  # 
  # 拡張領域の内容を、[識別子(extnID), 値(extnValue), 重要度(critical)] という
  # 形で返します。
  def to_a; end

  # ---to_der -> String
  # 
  # DER 形式のバイト列に変換して返します。
  # 
  # @raise OpenSSL::X509::Extension 変換に失敗した場合に発生します
  def to_der; end

  # --- to_h -> Hash
  # 拡張領域の内容を、
  #   { "oid" => 識別子(extnID), "value" => 値(extnValue), "critical" => 重要度(critical) }
  # というハッシュで返します。
  def to_h; end

  # --- to_s -> String
  # 拡張領域の内容を、文字列表現で返します。
  def to_s; end

  # ---value -> String
  # 
  # 拡張領域の値(extnValue)を返します。
  # 
  # @see [[c:OpenSSL::X509::Extension#value=]]
  def value; end

  # ---value=(value)
  # 
  # 拡張領域の値(extnValue)を設定します。
  # 
  # @param value 設定する値の文字列
  # @raise OpenSSL::X509::Extension 値の設定に失敗した場合に発生します
  # @see [[c:OpenSSL::X509::Extension#value]]
  def value=; end

  # --- new(der) -> OpenSSL::X509::Extension
  # --- new(oid, value, critical=false) -> OpenSSL::X509::Extension
  # [[c:OpenSSL::X509::Extension]] オブジェクトを生成します。
  # 
  # 引数が1つの場合は DER 形式の文字列を渡します。
  # 
  # 引数が2つ以上の場合は、oid には拡張領域の OID の ドット区切り表記、
  # short name、long name のいずれかである文字列を与えます。
  # value にはその値を表す DER 形式の文字列、もしくは 
  # [[c:OpenSSL::ASN1::ASN1Data]] のサブクラスを与えます。
  # 
  # 例;
  # 
  #   require 'openssl'
  #   include OpenSSL
  #   oid = "subjectKeyIdentifier"
  #   val = "\004\024\206\312\245\"\201b\357\255\n\211\274\255rA,)I\364\206V"
  #   ex = X509::Extension.new(oid, val)
  #   p ex.value # => "86:CA:A5:22:81:62:EF:AD:0A:89:BC:AD:72:41:2C:29:49:F4:86:56"
  #   ex2 = X509::Extension.new("2.5.29.19", "0\x03\x01\x01\xFF")
  #   p ex2.oid # => "basicConstrains"
  #   ex3 = X509::Extension.new("basicConstraints", ASN1.Sequence([ASN1::Boolean(false)]))
  #   p ex3 # => basicConstraints = CA:FALSE
  # 
  # @param der DER形式の文字列
  # @param oid OIDを表す文字列(ドット区切り、short name, long nameのいずれか)
  # @param value 拡張領域の値を表す DER 形式文字列
  # @param critical 拡張領域の重要度 
  def new; end

end
