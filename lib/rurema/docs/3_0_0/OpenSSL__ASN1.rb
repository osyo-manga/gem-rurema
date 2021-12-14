module OpenSSL::ASN1
  # --- BMPString(value) -> OpenSSL::ASN1::BMPString -> OpenSSL::ASN1::BMPString
  # --- BMPString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::BMPString
  # ASN.1 の BMPString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::BMPString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def BMPString; end

  # --- BitString(value) -> OpenSSL::ASN1::BitString -> OpenSSL::ASN1::BitString
  # --- BitString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::BitString
  # ASN.1 の BitString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::BitString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def BitString; end

  # --- Boolean(value) -> OpenSSL::ASN1::Boolean
  # --- Boolean(value , tag , tagging , tag_class) -> OpenSSL::ASN1::Boolean
  # ASN.1 の Boolean 型の値を表現する OpenSSL::ASN1::Boolean オブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN::Boolean.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(true もしくは false)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Boolean; end

  # --- Enumerated(value) -> OpenSSL::ASN1::Enumerated
  # --- Enumerated(value, tag, tagging, tag_class) -> OpenSSL::ASN1::Enumerated
  # ASN.1 の Enumerated 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::Enumerated.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(0以上の整数)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Enumerated; end

  # --- GeneralString(value) -> OpenSSL::ASN1::GeneralString -> OpenSSL::ASN1::GeneralString
  # --- GeneralString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::GeneralString
  # ASN.1 の GeneralString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::GeneralString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def GeneralString; end

  # --- GeneralizedTime(value) -> OpenSSL::ASN1::GeneralizedTime -> OpenSSL::ASN1::GeneralizedTime
  # --- GeneralizedTime(value, tag, tagging, tag_class) -> OpenSSL::ASN1::GeneralizedTime
  # ASN.1 の GeneralizedTime 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::GeneralizedTime.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(Timeのオブジェクト)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def GeneralizedTime; end

  # --- GraphicString(value) -> OpenSSL::ASN1::GraphicString -> OpenSSL::ASN1::GraphicString
  # --- GraphicString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::GraphicString
  # ASN.1 の GraphicString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::GraphicString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def GraphicString; end

  # --- IA5String(value) -> OpenSSL::ASN1::IA5String -> OpenSSL::ASN1::IA5String
  # --- IA5String(value, tag, tagging, tag_class) -> OpenSSL::ASN1::IA5String
  # ASN.1 の IA5String 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::IA5String.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def IA5String; end

  # --- ISO64String(value) -> OpenSSL::ASN1::ISO64String -> OpenSSL::ASN1::ISO64String
  # --- ISO64String(value, tag, tagging, tag_class) -> OpenSSL::ASN1::ISO64String
  # ASN.1 の ISO64String 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::ISO64String.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def ISO64String; end

  # --- Integer(value) -> OpenSSL::ASN1::Integer
  # --- Integer(value, tag, tagging, tag_class) -> OpenSSL::ASN1::Integer
  # ASN.1 の Integer 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::Integer.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト([[c:OpenSSL::BN]]のインスタンス)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Integer; end

  # --- Null(value) -> OpenSSL::ASN1::Null -> OpenSSL::ASN1::Null
  # --- Null(value, tag, tagging, tag_class) -> OpenSSL::ASN1::Null
  # ASN.1 の Null 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::Null.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(nilのみ)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Null; end

  # --- NumericString(value) -> OpenSSL::ASN1::NumericString -> OpenSSL::ASN1::NumericString
  # --- NumericString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::NumericString
  # ASN.1 の NumericString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::NumericString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def NumericString; end

  # --- ObjectId(value) -> OpenSSL::ASN1::ObjectId -> OpenSSL::ASN1::ObjectId
  # --- ObjectId(value, tag, tagging, tag_class) -> OpenSSL::ASN1::ObjectId
  # ASN.1 の ObjectId 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::ObjectId.new]] と同じです。
  # 
  # @param value ASN.1 オブジェクト識別子を表す文字列
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def ObjectId; end

  # --- OctetString(value) -> OpenSSL::ASN1::OctetString -> OpenSSL::ASN1::OctetString
  # --- OctetString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::OctetString
  # ASN.1 の OctetString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::OctetString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def OctetString; end

  # --- PrintableString(value) -> OpenSSL::ASN1::PrintableString -> OpenSSL::ASN1::PrintableString
  # --- PrintableString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::PrintableString
  # ASN.1 の PrintableString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::PrintableString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def PrintableString; end

  # --- Sequence(value) -> OpenSSL::ASN1::Sequence -> OpenSSL::ASN1::Sequence
  # --- Sequence(value, tag, tagging, tag_class) -> OpenSSL::ASN1::Sequence
  # ASN.1 の Sequence 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::Sequence.new]] と同じです。
  # 
  # @param value ASN.1値を表すRubyのオブジェクト([[c:OpenSSL::ASN1::ASN1Data]]の配列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Sequence; end

  # --- Set(value) -> OpenSSL::ASN1::Set -> OpenSSL::ASN1::Set
  # --- Set(value, tag, tagging, tag_class) -> OpenSSL::ASN1::Set
  # ASN.1 の Set 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::Set.new]] と同じです。
  # 
  # @param value ASN.1値を表すRubyのオブジェクト([[c:OpenSSL::ASN1::ASN1Data]]の配列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def Set; end

  # --- T61String(value) -> OpenSSL::ASN1::T61String -> OpenSSL::ASN1::T61String
  # --- T61String(value, tag, tagging, tag_class) -> OpenSSL::ASN1::T61String
  # ASN.1 の T61String 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::T61String.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def T61String; end

  # --- UTCTime(value) -> OpenSSL::ASN1::UTCTime -> OpenSSL::ASN1::UTCTime
  # --- UTCTime(value, tag, tagging, tag_class) -> OpenSSL::ASN1::UTCTime
  # ASN.1 の UTCTime 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::UTCTime.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(Timeのオブジェクト)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def UTCTime; end

  # --- UTF8String(value) -> OpenSSL::ASN1::UTF8String -> OpenSSL::ASN1::UTF8String
  # --- UTF8String(value, tag, tagging, tag_class) -> OpenSSL::ASN1::UTF8String
  # ASN.1 の UTF8String 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::UTF8String.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def UTF8String; end

  # --- UniversalString(value) -> OpenSSL::ASN1::UniversalString -> OpenSSL::ASN1::UniversalString
  # --- UniversalString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::UniversalString
  # ASN.1 の UniversalString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::UniversalString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def UniversalString; end

  # --- VideotexString(value) -> OpenSSL::ASN1::VideotexString -> OpenSSL::ASN1::VideotexString
  # --- VideotexString(value, tag, tagging, tag_class) -> OpenSSL::ASN1::VideotexString
  # ASN.1 の VideotexString 型の値を表現する Ruby のオブジェクトを
  # 生成します。
  # 
  # [[m:OpenSSL::ASN1::VideotexString.new]] と同じです。
  # 
  # @param value ASN.1 値を表す Ruby のオブジェクト(文字列)
  # @param tag タグ番号
  # @param tagging タグ付けの方法(:IMPLICIT もしくは :EXPLICIT)
  # @param tag_class タグクラス(:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  def VideotexString; end

  # --- decode(der) -> OpenSSL::ASN1::ASN1Data
  # DER 表現の文字列を解析し、そこにエンコードされている ASN.1 の値を
  # [[c:OpenSSL::ASN1::ASN1Data]] のサブクラスのインスタンスとして返します。
  # 
  # 複数の ASN.1 の値が含まれている場合、先頭の値だけを返します。
  # 
  # ASN.1 オブジェクトが Constructive である場合は、
  # それを構成する要素も再帰的に解析します。
  # 
  # 例:
  # 
  #   ruby -e '
  #   require "openssl"
  #   require "pp"
  #   pem = File.read(ARGV[0])
  #   cert = OpenSSL::X509::Certificate.new(pem)
  #   pp OpenSSL::ASN1.decode(cert.to_der)
  #   ' mycert.pem
  #   #<OpenSSL::ASN1::Sequence:0x814e9fc
  #    @tag=16,
  #    @tag_class=:UNIVERSAL,
  #    @tagging=nil,
  #    @value=
  #     [#<OpenSSL::ASN1::Sequence:0x814ead8
  #       @tag=16,
  #       @tag_class=:UNIVERSAL,
  #       @tagging=nil,
  #       @value=
  #        [#<OpenSSL::ASN1::ASN1Data:0x814f690
  #          @tag=0,
  #          @tag_class=:CONTEXT_SPECIFIC,
  #          @value=
  #           [#<OpenSSL::ASN1::Integer:0x814f6a4
  #             @tag=2,
  #             @tag_class=:UNIVERSAL,
  #             @tagging=nil,
  #             @value=2>]>,
  #             ...
  # 
  # @param der DER形式の文字列
  # @raise OpenSSL::ASN1::ASN1Error 解析に失敗した場合に発生します
  def decode; end

  # --- decode_all(der) -> [OpenSSL::ASN1::ASN1Data]
  # DER 表現の文字列を解析し、そこにエンコードされている ASN.1 の値を全て
  # [[c:OpenSSL::ASN1::ASN1Data]] のサブクラスのインスタンスの配列として
  # 返します。
  # 
  # @param der DER形式の文字列
  # @raise OpenSSL::ASN1::ASN1Error 解析に失敗した場合に発生します
  # @see [[m:OpenSSL::ASN1.#decode]]
  def decode_all; end

  # --- traverse(der) {|depth, off, hlen, len, constructed, tag_class, tag| ...} -> nil
  # DER形式の文字列を解析し、そこに含まれる ASN.1 の値
  # のプロパティを引数として与えられたブロックを呼びだします。
  # 
  # [[m:OpenSSL::ASN1.#decode_all]] のように、文字列に含まれる
  # 全ての ASN.1 オブジェクトのインスタンスを解析します。
  # 
  # ブロックに渡される引数は以下の通りです。
  #   * depth: 再帰の深さ
  #   * off: 対象の値をエンコードした文字列の der の先頭からのオフセット
  #   * hlen: エンコードされたデータのヘッダのバイト数
  #   * len: エンコードされたデータの値フィールドのバイト数
  #   * constructed:対象の ASN.1 値が Constructive なら真
  #   * tag_class: タグクラスを表す [[c:Symbol]] オブジェクト
  #     (:UNIVERSAL, :CONTEXT_SPECIFIC, :APPLICATION, :PRIVATE のいずれか)
  #   * tag: タグ番号
  # 
  # @param der DER形式の文字列
  # @raise OpenSSL::ASN1::ASN1Error 解析に失敗した場合に発生します
  # @see [[m:OpenSSL::ASN1.#decode]]
  def traverse; end

  # --- BIT_STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # BIT_STRING のタグ番号 3 を表す定数です。
  def BIT_STRING; end

  # --- BMPSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # BMPSTRING のタグ番号 30 を表す定数です。
  def BMPSTRING; end

  # --- BOOLEAN -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # BOOLEAN のタグ番号 1 を表す定数です。
  def BOOLEAN; end

  # --- CHARACTER_STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # CHARACTER_STRING のタグ番号 29 を表す定数です。
  def CHARACTER_STRING; end

  # --- EMBEDDED_PDV -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # EMBEDDED_PDV のタグ番号 11 を表す定数です。
  def EMBEDDED_PDV; end

  # --- ENUMERATED -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # ENUMERATED のタグ番号 10 を表す定数です。
  def ENUMERATED; end

  # --- EOC -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # EOC のタグ番号 0 を表す定数です。
  def EOC; end

  # --- EXTERNAL -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # EXTERNAL のタグ番号 8 を表す定数です。
  def EXTERNAL; end

  # --- GENERALIZEDTIME -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # GENERALIZEDTIME のタグ番号 24 を表す定数です。
  def GENERALIZEDTIME; end

  # --- GENERALSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # GENERALSTRING のタグ番号 27 を表す定数です。
  def GENERALSTRING; end

  # --- GRAPHICSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # GRAPHICSTRING のタグ番号 25 を表す定数です。
  def GRAPHICSTRING; end

  # --- IA5STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # IA5STRING のタグ番号 22 を表す定数です。
  def IA5STRING; end

  # --- INTEGER -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # INTEGER のタグ番号 2 を表す定数です。
  def INTEGER; end

  # --- ISO64STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # ISO64STRING のタグ番号 26 を表す定数です。
  def ISO64STRING; end

  # --- NULL -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # NULL のタグ番号 5 を表す定数です。
  def NULL; end

  # --- NUMERICSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # NUMERICSTRING のタグ番号 18 を表す定数です。
  def NUMERICSTRING; end

  # --- OBJECT -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # OBJECT のタグ番号 6 を表す定数です。
  def OBJECT; end

  # --- OBJECT_DESCRIPTOR -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # OBJECT_DESCRIPTOR のタグ番号 7 を表す定数です。
  def OBJECT_DESCRIPTOR; end

  # --- OCTET_STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # OCTET_STRING のタグ番号 4 を表す定数です。
  def OCTET_STRING; end

  # --- PRINTABLESTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # PRINTABLESTRING のタグ番号 19 を表す定数です。
  def PRINTABLESTRING; end

  # --- REAL -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # REAL のタグ番号 9 を表す定数です。
  def REAL; end

  # --- RELATIVE_OID -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # RELATIVE_OID のタグ番号 13 を表す定数です。
  def RELATIVE_OID; end

  # --- SEQUENCE -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # SEQUENCE のタグ番号 16 を表す定数です。
  def SEQUENCE; end

  # --- SET -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # SET のタグ番号 17 を表す定数です。
  def SET; end

  # --- T61STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # T61STRING のタグ番号 20 を表す定数です。
  def T61STRING; end

  # --- UNIVERSALSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # UNIVERSALSTRING のタグ番号 28 を表す定数です。
  def UNIVERSALSTRING; end

  # --- UNIVERSAL_TAG_NAME -> [String]
  # タグ番号が表す ASN.1 オブジェクト名を収録した配列です。
  # 
  # 例:
  # 
  #   require 'openssl'
  #   p OpenSSL::ASN1::UNIVERSAL_TAG_NAME[0]  # => "EOC"
  #   p OpenSSL::ASN1::UNIVERSAL_TAG_NAME[12] # => "UTF8STRING"
  # 
  # ASN.1 オブジェクトのタグ番号を表す定数が以下のように定義されています。
  # 
  #   require 'openssl'
  #   p OpenSSL::ASN1::UTF8STRING # => 12
  def UNIVERSAL_TAG_NAME; end

  # --- UTCTIME -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # UTCTIME のタグ番号 23 を表す定数です。
  def UTCTIME; end

  # --- UTF8STRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # UTF8STRING のタグ番号 12 を表す定数です。
  def UTF8STRING; end

  # --- VIDEOTEXSTRING -> Integer
  # 
  # ASN.1 UNIVERSAL タグの、
  # VIDEOTEXSTRING のタグ番号 21 を表す定数です。
  def VIDEOTEXSTRING; end

end
