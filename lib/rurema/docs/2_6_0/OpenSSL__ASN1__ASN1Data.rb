class OpenSSL::ASN1::ASN1Data
  # --- tag -> Integer
  # タグ番号を返します。
  # 
  # タグ番号です。Universal 型の場合は BOOLEAN = 1 から BMPSTRING = 30 
  # のいずれかの値をとります。
  # 
  # @see [[m:OpenSSL::ASN1::ASN1Data#tag=]]
  def tag; end

  # --- tag=(tag)
  # タグ番号を設定します。
  # 
  # @param tag 設定するタグ番号
  # @see [[m:OpenSSL::ASN1::ASN1Data#tag]]
  def tag=; end

  # --- tag_class -> Symbol
  # タグクラスを返します。
  # 
  # :UNIVERSAL、:CONTEXT_SPECIFIC、:APPLICATION, :PRIVATE のいずれかを返します。
  # 
  # @see [[m:OpenSSL::ASN1::ASN1Data#tag_class=]]
  def tag_class; end

  # --- tag_class=(tag_class)
  # タグクラスを設定します。
  # 
  # @param tag_class 設定するタグクラス。:UNIVERSAL、:ONTEXT_SPECIFIC、:APPLICATION、:PRIVATE のいずれか
  # @see [[m:OpenSSL::ASN1::ASN1Data#tag_class]]
  def tag_class=; end

  # --- to_der -> String
  # ASN.1 値の DER 表現を返します。
  # 
  # @see [[m:OpenSSL::ASN1.#decode]]
  def to_der; end

  # --- value -> object
  # ASN.1 値に対応するRubyのオブジェクトを返します。
  # 
  # @see [[m:OpenSSL::ASN1::ASN1Data#value=]]
  def value; end

  # --- value=(value)
  # ASN.1 値に対応するRubyのオブジェクトを変更します。
  # 
  # @param value 設定するオブジェクト
  # @see [[m:OpenSSL::ASN1::ASN1Data#value]]
  def value=; end

  # --- new(value, tag, tag_class) -> OpenSSL::ASN1::ASN1Data
  # ASN.1 値を表現する [[c:OpenSSL::ASN1::ASN1Data]] オブジェクトを
  # 生成します。
  # 
  # 通常 UNIVERSAL なタグクラスを持つ ASN.1 値はこのクラスのサブクラスで
  # 表現されるため、tag_class はそれ以外(:CONTEXT_SPECIFIC、:APPLICATION、
  # :PRIVATE のいずれか)を指定します。
  # 
  # value としては、通常は文字列(IMPLICIT tagging 相当)
  # もしくは OpenSSL::ASN1::ASN1Data の配列(IMPLICIT tagging相当)
  # を指定します。
  # 
  # @param value そのオブジェクトが表現する値
  # @param tag タグ
  # @param tag_class タグクラス
  def new; end

end
