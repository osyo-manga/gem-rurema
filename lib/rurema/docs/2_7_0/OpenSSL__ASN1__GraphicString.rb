class OpenSSL::ASN1::GraphicString
  # --- new(value) ->  OpenSSL::ASN1::GraphicString
  # --- new(value, tag, tagging, tag_class) -> OpenSSL::ASN1::GraphicString
  # ASN.1 の GraphicString 型の値を表現する OpenSSL::ASN1::GraphicString オブジェクトを
  # 生成します。
  # 
  # value 以外の引数を省略した場合はタグクラスは :UNIVERSAL、
  # タグ は [[m:OpenSSL::ASN1::GRAPHICSTRING]] となります。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def new; end

end
