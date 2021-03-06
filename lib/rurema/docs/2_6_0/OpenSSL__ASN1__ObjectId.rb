class OpenSSL::ASN1::ObjectId
  # --- ln -> String | nil
  # --- long_name -> String | nil
  # 
  # オブジェクト識別子に対応する long name を返します。
  # 
  # 例:
  #   require "openssl"
  #   oid = OpenSSL::ASN1::ObjectId.new("subjectAltName")
  #   p oid.ln   #=> "X509v3 Subject Alternative Name"
  # 
  # @see [[m:OpenSSL::ASN1::ObjectId#sn]]
  def ln; end

  # --- oid -> String
  # オブジェクト識別子のドット区切り数値を文字列で返します。
  # 
  # 例:
  #   require "openssl"
  #   oid = OpenSSL::ASN1::ObjectId.new("subjectAltName")
  #   p oid.oid   #=> "2.5.29.17"
  # 
  # @raise OpenSSL::ASN1::ASN1Error オブジェクト識別子名が未知である場合に発生します
  def oid; end

  # --- sn -> String | nil
  # --- short_name -> String | nil
  # オブジェクト識別子に対応する short name を返します。
  # 
  # 例:
  #   require "openssl"
  #   oid = OpenSSL::ASN1::ObjectId.new("subjectAltName")
  #   p oid.sn   #=> "subjectAltName"
  # 
  # @see [[m:OpenSSL::ASN1::ObjectId#ln]]
  def short_name; end

  # --- new(value) -> OpenSSL::ASN1::ObjectId
  # --- new(value, tag, tagging, tag_class) -> OpenSSL::ASN1::ObjectId
  # ASN.1 のオブジェクト識別子を表わす OpenSSL::ASN1::ObjectId の
  # オブジェクトを生成します。
  # 
  # value としては、ドット区切り数字表記、short name、long name の文字列の
  # をいずれかを渡します。
  # 
  # value 以外の引数を省略した場合はタグクラスは :UNIVERSAL、
  # タグ は [[m:OpenSSL::ASN1::OBJECT]] となります。
  # 
  # 例:
  # 
  #   require "openssl"
  #   include OpenSSL
  #   p ASN1::ObjectId.new("1.2.840.10040.4.3").long_name # => "dsaWithSHA1"
  #   p ASN1::ObjectId.new("dsaWithSHA1").oid             # => "1.2.840.10040.4.3"
  # 
  # @param value ASN.1 オブジェクト識別子を表す文字列
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def new; end

  # --- register(oid, short_name, long_name) -> true
  # オブジェクト識別子に対応する名前(short name と long name)を
  # OpenSSLの内部テーブルに登録します。
  # 
  # 登録した名前は [[c:OpenSSL::X509::Extension]] などで利用できるようになります。
  # 
  # 例:
  # 
  #   require "openssl"
  #   OpenSSL::ASN1::ObjectId.register(
  #     "2.5.29.9", "subjectDirAttrs", "X509v3 Subject Directory Attributes")
  #   p OpenSSL::ASN1::ObjectId.new("2.5.29.9").long_name 
  #   # => "X509v3 Subject Directory Attributes"
  # 
  # @param oid 登録する識別子(ドット区切り数字表記の文字列)
  # @param short_name short nameとして登録する文字列
  # @param long_name long nameとして登録する文字列
  # @raise OpenSSL::ASN1::ASN1Error 登録に失敗した場合に発生します。
  def register; end

end
