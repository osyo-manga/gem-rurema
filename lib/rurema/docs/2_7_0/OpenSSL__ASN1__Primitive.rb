class OpenSSL::ASN1::Primitive
  # --- tagging -> Symbol | nil
  # タグ付けの方式を返します。
  # 
  # :IMPLICIT、:EXPLICIT、nil のいずれかを返します。
  # 
  # タグ([[m:OpenSSL::ASN1::ASN1Data#tag]])が :UNIVERSAL ならば
  # この値は無視されます。
  # 
  # nil は :IMPLICIT と同義です。
  # 
  # @see [[m:OpenSSL::ASN1::Primitive#tagging=]]
  def tagging; end

  # --- tagging=(tagging)
  # タグ付けの方式を設定します。
  # 
  # @param tagging タグ付けの方式(:IMPLICIT または :EXPLICIT)
  # @see [[m:OpenSSL::ASN1::Primitive#tagging=]]
  def tagging=; end

end
