class OpenSSL::X509::Attribute
  # --- oid -> String
  # attribute の Object ID(識別子)を文字列で返します。
  # 
  # @raise OpenSSL::X509::AttributeError Object ID の取得に失敗した場合に発生します
  # @see [[m:OpenSSL::X509::Attribute#oid=]]
  def oid; end

  # --- oid=(oid)
  # attribute の Object ID(識別子)を文字列で設定します。
  # 
  # @param oid 設定する Object ID 文字列
  # @raise OpenSSL::X509::AttributeError oidが不正であった場合に発生します
  # @see [[m:OpenSSL::X509::Attribute#oid]]
  def oid=; end

  # --- to_der -> String
  # 自身を DER 形式のバイト列に変換します。
  # 
  # @raise OpenSSL::X509::AttributeError 変換に失敗した場合に発生します
  def to_der; end

  # --- value -> OpenSSL::ASN1::ASN1Data
  # attribute の値を [[c:OpenSSL::ASN1::ASN1Data]] のオブジェクトで
  # 返します。
  # 
  # @raise OpenSSL::X509::AttributeError 値の取得に失敗した場合に発生します
  # @see [[m:OpenSSL::X509::Attribute#value=]]
  def value; end

  # --- value=(val)
  # attribute の値を設定します。
  # 
  # 引数には [[c:OpenSSL::ASN1::ASN1Data]] のオブジェクトを渡さなければなりません。
  # 
  # @param val 設定する値の [[c:OpenSSL::ASN1::ASN1Data]] オブジェクト
  # @raise OpenSSL::X509::AttributeError val が不正であった場合に発生します
  # @see [[m:OpenSSL::X509::Attribute#value]]
  def value=; end

  # --- new(der) -> OpenSSL::X509::Attribute
  # --- new(oid, value) -> OpenSSL::X509::Attribute
  # attribute オブジェクトを生成します。
  # 
  # 引数が1個で、文字列であるならば、それを DER 形式の
  # データであると見なして attribute オブジェクトを生成します。
  # 引数が1個で、それ以外の場合は to_der メソッドで DER 形式に変換してから
  # それを attribute オブジェクトに変換します。
  # 
  # 引数が2個の場合は、それぞれを attribute の Object ID (識別子)と
  # 値(内容)と見なして attribute オブジェクトを生成します。
  # この場合、oid は Object ID の文字列、value には
  # [[c:OpenSSL::ASN1::ASN1Data]] のインスタンスを渡さなければなりません。
  # 
  # @param der DER 形式の文字列、もしくは to_der を持つオブジェクト
  # @param oid Object ID 文字列
  # @param value 値を表す [[c:OpenSSL::ASN1::ASN1Data]] インスタンス
  # @raise OpenSSL::X509::AttributeError attributeオブジェクトの生成に失敗した場合に
  #        発生します。DER 形式文字列が不正であった場合、oid, value が不正であった
  #        場合などに発生します。
  def new; end

end
