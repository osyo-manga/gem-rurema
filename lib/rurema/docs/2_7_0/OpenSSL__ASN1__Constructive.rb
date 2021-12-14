class OpenSSL::ASN1::Constructive
  # --- each {|item| ... } -> self
  # 構造型のデータに含まれる各要素に対してブロックを
  # 評価します。
  def each; end

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
  # @see [[m:OpenSSL::ASN1::Constructive#tagging=]]
  def tagging; end

  # --- tagging=(tag)
  # タグ付けの方式を設定します。
  # 
  # @param tagging タグ付けの方式(:IMPLICIT または :EXPLICIT)
  # @see [[m:OpenSSL::ASN1::Constructive#tagging=]]
  def tagging=; end

end
