class REXML::DocType
  # --- add(child) -> ()
  # child を子ノード列の最後に追加します。
  # 
  # [[m:REXML::Parent#add]] を内部で呼び出します。
  # また、[[m:REXML::DocType#entities]] を更新します。
  # 
  # @param child 追加するノード
  def add; end

  # --- attribute_of(element, attribute) -> String | nil
  # DTD 内の属性リスト宣言で、 element という名前の要素の attribute という
  # 名前の属性のデフォルト値を返します。
  # 
  # elementという名前の要素の属性値は宣言されていない、
  # elementという名前の要素にはattributeという名前の属性が宣言されていない、
  # もしくはデフォルト値が宣言されていない、のいずれかの場合は nil を返します。
  # 
  # @param element 要素名(文字列)
  # @param attribute 属性名(文字列)
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE books [
  # <!ELEMENT book (comment)>
  # <!ELEMENT comment (#PCDATA)>
  # <!ATTLIST book
  #           author CDATA #REQUIRED
  #           title CDATA #REQUIRED
  #           publisher CDATA "foobar publisher">
  # ]>
  # EOS
  # 
  # p doctype.attribute_of("book", "publisher") # => "foobar publisher"
  # p doctype.attribute_of("bar", "foo") # => nil
  # p doctype.attribute_of("book", "baz") # => nil
  # p doctype.attribute_of("book", "title") # => nil
  # //}
  def attribute_of; end

  # --- attributes_of(element) -> [REXML::Attribute]
  # DTD 内の属性リスト宣言で、 element という名前の要素に対し宣言されている
  # 属性の名前とデフォルト値を REXML::Attribute の配列で返します。
  # 
  # 名前とデフォルト値のペアは、各 Attribute オブジェクトの
  # [[m:REXML::Attribute#name]] と
  # [[m:REXML::Attribute#value]] で表現されます。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE books [
  # <!ELEMENT book (comment)>
  # <!ELEMENT comment (#PCDATA)>
  # <!ATTLIST book
  #           author CDATA #REQUIRED
  #           title CDATA #REQUIRED
  #           publisher CDATA "foobar publisher">
  # ]>
  # EOS
  # 
  # p doctype.attributes_of("book")
  # # => [author='', title='', publisher='foobar publisher']
  # p doctype.attributes_of("book")[0].name # => "author"
  # p doctype.attributes_of("book")[0].value # => ""
  # //}
  def attributes_of; end

  # --- clone -> REXML::DocType
  # self の複製を返します。
  # 
  # external_id ([[m:REXML::DocType#external_id]]) と
  # 名前([[m:REXML::DocType#name]]) のみ複製されるため、
  # 結果として得られるオブジェクトはあまり有用ではないでしょう。
  def clone; end

  # --- context -> { Symbol => object }
  # DTD が属する文書の「コンテキスト」を返します。
  # 
  # 具体的には親ノードである [[c:REXML::Document]] オブジェクトの
  # [[m:REXML::Element#context]] を返します。
  # 
  # コンテキストの具体的な内容については [[m:REXML::Element#context]] を
  # 参照してください。
  def context; end

  # --- entities -> { String => REXML::Entity }
  # DTD で宣言されている実体の集合を Hash で返します。
  # 
  # 返される Hash は実体参照名をキーとし、対応する [[c:REXML::Entity]] オブジェクト
  # を値とするハッシュテーブルです。
  # 
  # これには、XML のデフォルトの実体(gt, lt, quot, apos)も含まれています。
  # 
  # //emlist[][ruby]{
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE foo [
  #   <!ENTITY bar "barbarbarbar">
  # ]>
  # EOS
  # 
  # p doctype.entities # => { "gt" => #<REXML::Entity: ...>,
  #                     #      "lt" => #<REXML::Entity: ...>, ... }
  # p doctype.entities["bar"].to_s # => "<!ENTITY bar \"barbarbarbar\">"
  # p doctype.entities["gt"].to_s # => "<!ENTITY gt \">\">"
  # //}
  def entities; end

  # --- entity(name) -> String | nil
  # name という実体参照名を持つ実体を文字列で返します。
  # 
  # 返される文字列は非正規化([[m:REXML::Entity#unnormalized]] 参照)
  # された文字列が返されます。
  # 
  # name という名前を持つ実体が存在しない場合には nil を返します。
  # 
  # @param name 実体参照名(文字列)
  # 
  # //emlist[][ruby]{
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE foo [
  #   <!ENTITY bar "barbarbarbar">
  # ]>
  # EOS
  # p doctype.entity("bar") # => "barbarbar"
  # p doctype.entity("foo") # => nil
  # //}
  def entity; end

  # --- external_id -> String | nil
  # DTD が外部サブセットを用いている場合は "SYSTEM", "PUBLIC" の
  # いずれかの文字列を返します。
  # 
  # それ以外の場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  #           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  # EOS
  # doctype.name # => "html"
  # doctype.external_id  # => "PUBLIC"
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE books [
  #   <!ELEMENT books (book+)>
  #   <!ELEMENT book (title,author)>
  #   <!ELEMENT title (#PCDATA)>
  #   <!ELEMENT author (#PCDATA)>
  # ]>
  # EOS
  # doctype.name # => "books"
  # doctype.external_id # => nil
  # //}
  def external_id; end

  # --- name -> String
  # ルート要素名を返します。
  # 
  # //emlist[][ruby]{
  # document = REXML::Document.new(<<EOS)
  # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  #           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  # EOS
  # doctype = document.doctype
  # p doctype.name # => "html"
  # //}
  def name; end

  # --- namespaces -> nil
  # nil を返します。
  def namespaces; end

  # --- node_type -> Symbol
  # [[c:Symbol]] :doctype を返します。
  def node_type; end

  # --- notation(name) -> REXML::NotationDecl | nil
  # DTD に含まれている記法宣言 ([[c:REXML::NotationDecl]]) で
  # name という名前を持つものを返します。
  # 
  # name という名前を持つ記法宣言が存在しない場合は nil を返します。
  # 
  # @param name 検索する記法名
  def notation; end

  # --- notations -> [REXML::NotationDecl]
  # DTD に含まれている記法宣言 ([[c:REXML::NotationDecl]]) を
  # 配列で返します。
  def notations; end

  # --- public -> String | nil
  # DTD の公開識別子を返します。
  # 
  # DTD が公開識別子による外部サブセットを含んでいない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  #           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  # EOS
  # doctype.system # => "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  # doctype.public  # => "-//W3C//DTD XHTML 1.0 Strict//EN"
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE root SYSTEM "foobar">
  # EOS
  # doctype.system # => "foobar"
  # doctype.public  # => nil
  # //}
  def public; end

  # --- system -> String | nil
  # DTD のシステム識別子を返します。
  # 
  # DTD が外部サブセットを含んでいない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  #           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  # EOS
  # doctype.system # => "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  # doctype.public  # => "-//W3C//DTD XHTML 1.0 Strict//EN"
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE root SYSTEM "foobar">
  # EOS
  # doctype.system # => "foobar"
  # doctype.public  # => nil
  # //}
  def system; end

  # --- write(output, indent = 0, transitive = false, ie_hack = false) -> ()
  # output に DTD を出力します。
  # 
  # このメソッドは deprecated です。[[c:REXML::Formatter]] で
  # 出力してください。
  # 
  # @param output 出力先の IO オブジェクト
  # @param indent インデントの深さ。指定しないでください。
  # @param transitive 無視されます。指定しないでください。
  # @param ie_hack 無視されます。指定しないでください。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE books [
  # <!ELEMENT book (comment)>
  # <!ELEMENT comment (#PCDATA)>
  # <!ATTLIST book
  #           author CDATA #REQUIRED
  #           title CDATA #REQUIRED
  #           publisher CDATA "foobar publisher">
  # <!ENTITY p "foobar publisher">
  # <!ENTITY % q "quzz">
  # ]>
  # EOS
  # 
  # doctype.write(STDOUT)
  # # =>
  # # <!DOCTYPE books [
  # # <!ELEMENT book (comment)>
  # # ....
  # //}
  def write; end

  # --- new(source, parent = nil) -> REXML::DocType
  # 
  # DocType オブジェクトを生成します。
  # 
  # [[c:REXML::Source]] オブジェクトの場合は、Source オブジェクトが
  # 保持しているDTDのテキストがパースされ、その内容によって DocType
  # オブジェクトが初期化されます。
  #   REXML::DocType.new(Source.new(<<EOS))
  #   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  #          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  #   EOS
  # このインターフェースは deprecated です。
  # 
  # このメソッドは他のインターフェースもありますが、内部用なので使わないで
  # ください。
  # 
  # 一般的にいって、XML 文書に含まれる DTD は [[m:REXML::Document.new]] などで
  # 適切に解析され、[[m:REXML::Document#doctype]] で取得できます。
  # このメソッドを直接使う必要はありません。
  def new; end

  # --- DEFAULT_ENTITIES -> { String => REXML::Entity }
  # XML の仕様上デフォルトで定義されている実体の Hash table。
  # 
  # "amp" => [[m:REXML::EntityConst::AMP]] は含まれません。
  def DEFAULT_ENTITIES; end

end
