class OpenSSL::ASN1::BitString
  # --- new(value) ->  OpenSSL::ASN1::BitString
  # --- new(value, tag, tagging, tag_class) -> OpenSSL::ASN1::BitString
  # ASN.1 の Bit String 型の値を表現する OpenSSL::ASN1::BitString オブジェクトを
  # 生成します。
  # 
  # value 以外の引数を省略した場合はタグクラスは :UNIVERSAL、
  # タグ は [[m:OpenSSL::ASN1::BIT_STRING]] となります。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def new; end

  # --- unused_bits -> Integer | nil
  # Bit Stringに設定されたフラグを返します。
  # 
  # @see [[m:OpenSSL::ASN1::BitString#unused_bits=]]
  def unused_bits; end

  # --- unused_bits=(b)
  # Bit Stringにフラグを設定します。
  # 
  # @param b フラグ(整数)
  # @see [[m:OpenSSL::ASN1::BitString#unused_bits]]
  def unused_bits=; end

end
