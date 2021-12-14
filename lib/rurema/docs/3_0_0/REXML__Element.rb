class REXML::Element
  # --- add_attribute(key, value) -> ()
  # --- add_attribute(attr) -> ()
  # 要素の属性を追加します。
  # 同じ名前の属性がすでにある場合はその属性を新しい
  # 属性で置き換えます。
  # 
  # 引数の与えかたは2通りあります。
  # 要素名と値の2つの文字列で渡す方法と [[c:REXML::Attribute]] オブジェクトを
  # 渡す方法です。
  # 
  # 文字列2つで指定する場合、属性値は unnormalized な文字列を渡す必要があります。
  # 
  # @param key 属性名(文字列)
  # @param value 属性値(文字列)
  # @param attr 属性([[c:REXML::Attribute]] オブジェクト)
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<e/>")
  # doc.root.add_attribute("a", "b"); doc.root # => <e a='b'/>
  # doc.root.add_attribute("x:a", "c"); doc.root # => <e a='b' x:a='c'/>
  # doc.root.add_attribute(REXML::Attribute.new("b", "d"))
  # doc.root # => <e a='b' x:a='c' b='d'/>
  # //}
  def add_attribute; end

  # --- add_attributes(attrs) -> ()
  # 要素の属性を複数追加します。
  # 同じ名前の属性がすでにある場合はその属性を新しい
  # 属性で置き換えます。
  # 
  # attrs には [[c:Hash]] もしくは [[c:Array]] を指定できます。
  # Hash の場合は、
  #   { "name1" => "value1", "name2" => "value2", ... }
  # という形で、配列の場合は
  #   [ ["name1", "value1"], ["name2", "value2"], ... }
  # という形で追加/更新する属性を指定します。
  # 
  # @param attrs 追加する属性の属性名と属性値の対の集合(Array or Hash)
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new("e")
  # e.add_attributes({"a" => "b", "c" => "d"})
  # e # => <e a='b' c='d'/>
  # e = REXML::Element.new("e")
  # e.add_attributes([["a", "b"], ["c", "d"]])
  # e # => <e a='b' c='d'/>
  # //}
  def add_attributes; end

  # --- add_element(element, attrs = nil) -> Element
  # 
  # 子要素を追加します。
  # 
  # element として追加する要素を指定します。
  # [[c:REXML::Element]] オブジェクトもしくは文字列を指定します。
  # 
  # element として REXML::Element オブジェクトを指定した場合、それが追加されます。
  # 文字列を指定した場合は、それを要素名とする要素を追加します。
  # 
  # attrs に { String => String } という Hash を渡すと、
  # 追加する要素の属性を指定できます。
  # 
  # 子要素の最後に追加されます。
  # 
  # 返り値は追加された要素です。
  # 
  # @param element 追加する要素
  # @param attrs 追加する要素に設定する属性
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new('<a/>')
  # el = doc.root.add_element 'my-tag' # => <my-tag/>
  # doc.root.to_s # => "<a><my-tag/></a>"
  # el = doc.root.add_element 'my-tag', {'attr1'=>'val1', 'attr2'=>'val2'}
  # # => <my-tag attr1='val1' attr2='val2'/>
  # doc.root.to_s # => "<a><my-tag/><my-tag attr1='val1' attr2='val2'/></a>"
  # el = REXML::Element.new 'my-tag'
  # doc.root.add_element el # => <my-tag/>
  # doc.root.to_s # => "<a><my-tag/><my-tag attr1='val1' attr2='val2'/><my-tag/></a>"
  # //}
  # 
  # @see [[m:REXML::Elements#add]], [[m:REXML::Element.new]]
  def add_element; end

  # --- add_namespace(prefix, uri) -> self
  # --- add_namespace(uri)
  # 名前空間を要素に追加します。
  # 
  # 引数が2個の場合は prefix と uri を指定します。
  # 引数が1個の場合はデフォルトの namespace の uri を指定します。
  # 
  # 既に同じ prefix が存在する場合はそれが上書きされます。
  # 
  # @param prefix 名前空間の prefix
  # @param uri 名前空間の uri
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # a = REXML::Element.new("a")
  # a.add_namespace("xmlns:foo", "bar" )
  # a.add_namespace("foo", "bar")  # 上と同じ意味
  # a.add_namespace("twiddle")
  # a.to_s # => "<a xmlns:foo='bar' xmlns='twiddle'/>"
  # a.add_namespace("foo", "baz")
  # a.to_s # => "<a xmlns:foo='baz' xmlns='twiddle'/>"
  # //}
  def add_namespace; end

  # --- attribute(name, namespace = nil) -> REXML::Attribute | nil
  # 
  # name で指定される属性を返します。
  # 
  # 属性は [[c:REXML::Attribute]] オブジェクトの形で返します。
  # 
  # name は "foo:bar" のように prefix を指定することができます。
  # 
  # namespace で名前空間の URI を指定することで、その名前空間内で
  # name という属性名を持つ属性を指定できます。
  # 
  # 指定した属性名の属性がない場合は nil を返します。
  # 
  # @param name 属性名(文字列)
  # @param namespace 名前空間のURI(文字列)
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # doc = REXML::Document.new(<<-EOS)
  # <root xmlns:foo="http://example.org/foo"
  #       xmlns:bar="http://example.org/bar">
  #   <a foo:att='1' bar:att='2' att='&lt;'/>
  # </root>
  # EOS
  # a = doc.get_elements("/root/a").first
  # a.attribute("att") # => att='&lt;'
  # a.attribute("att", "http://example.org/bar") # => bar:att='2'
  # a.attribute("bar:att") # => bar:att='2'
  # a.attribute("baz") # => nil
  # //}
  def attribute; end

  # --- attributes -> REXML::Attributes
  # 要素が保持している属性の集合を返します。
  def attributes; end

  # --- cdatas -> [REXML::CData]
  # すべての cdata 子ノードの配列を返します。
  # 
  # 返される配列は freeze されます。
  def cdatas; end

  # --- clone -> REXML::Element
  # self を複製して返します。
  # 
  # 複製されるのは名前、属性、名前空間のみです。
  # 子ノードは複製されません。
  def clone; end

  # --- comments -> [REXML::Comments]
  # すべての comment 子ノードの配列を返します。
  # 
  # 返される配列は freeze されます。
  def comments; end

  # --- context -> {Symbol => object} | nil
  # 
  # 要素の「コンテキスト」を [[c:Hash]] で返します。
  # 
  # コンテキストとは text node ([[c:REXML::Text]]) での特別な文字、特に空白について
  # の取り扱いについての設定です。
  # 以下の [[c:Symbol]] をハッシュのキーとして使います。
  # 
  # : :respect_whitespace
  #   空白を考慮して欲しい要素の名前の集合を文字列の配列で指定します。
  #   また、すべての要素で空白を考慮して欲しい場合には
  #   :all を指定します。
  #   デフォルト値は :all です。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :compress_whitespace
  #   空白を無視して欲しい要素の名前の集合を文字列の配列で指定します。
  #   この指定は :respect_whitespace での指定を上書きします。
  #   すべての要素で空白を無視して欲しい場合には
  #   :all を指定します。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :ignore_whitespace_nodes
  #   空白のみからなるノードを無視して欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべての要素で無視して欲しい場合は :all を指定します。
  #   これが設定された場合、空白のみからなる text node は追加されません。
  #   [[m:REXML::Element#ignore_whitespace_nodes]] も参照してください。
  # : :raw
  #   raw mode で取り扱いをして欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべてのノードを raw mode で取り扱って欲しい場合は :all を指定します。
  #   raw mode においては、text 中の特殊文字は一切変換されません。
  #   [[m:REXML::Element#raw]] も参照してください。
  # 
  # @see [[m:REXML::Element.new]], [[m:REXML::Element#context=]]
  def context; end

  # --- context=(value)
  # 
  # 要素の「コンテキスト」を [[c:Hash]] で設定します。
  # 
  # コンテキストとは、 text node ([[c:REXML::Text]]) での特別な文字、特に空白について
  # の取り扱いについての設定です。
  # 以下の [[c:Symbol]] をハッシュのキーとして使います。
  # 
  # : :respect_whitespace
  #   空白を考慮して欲しい要素の名前の集合を文字列の配列で指定します。
  #   また、すべての要素で空白を考慮して欲しい場合には
  #   :all を指定します。
  #   デフォルト値は :all です。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :compress_whitespace
  #   空白を無視して欲しい要素の名前の集合を文字列の配列で指定します。
  #   この指定は :respect_whitespace での指定を上書きします。
  #   すべての要素で空白を無視して欲しい場合には
  #   :all を指定します。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :ignore_whitespace_nodes
  #   空白のみからなるノードを無視して欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべての要素で無視して欲しい場合は :all を指定します。
  #   これが設定された場合、空白のみからなる text node は追加されません。
  #   [[m:REXML::Element#ignore_whitespace_nodes]] も参照してください。
  # : :raw
  #   raw mode で取り扱いをして欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべてのノードを raw mode で取り扱って欲しい場合は :all を指定します。
  #   raw mode においては、text 中の特殊文字は一切変換されません。
  #   [[m:REXML::Element#raw]] も参照してください。
  # 
  # nil を渡すことでデフォルト値を使うよう指示できます。
  # 
  # @param value 設定値
  # @see [[m:REXML::Element.new]], [[m:REXML::Element#context]]
  def context=; end

  # --- delete_attribute(key) -> REXML::Attribute | nil
  # 要素から key という属性名の属性を削除します。
  # 
  # 削除された属性を返します。
  # 
  # key という属性名の属性が存在しない場合は削除されずに、nil を返します。
  # 
  # @param key 削除する要素(文字列(属性名) or [[c:REXML::Attribute]]オブジェクト)
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new("E")
  # e.add_attribute("x", "foo"); e # => <E x='foo'/>
  # e.add_attribute("y:x", "bar"); e # => <E x='foo' y:x='bar'/>
  # e.delete_attribute("x"); e # => <E y:x='bar'/>
  # //}
  def delete_attribute; end

  # --- delete_element(element) -> REXML::Element
  # 
  # 子要素を削除します。
  # 
  # element で削除する要素を指定できます。整数、文字列、[[c:REXML::Element]]
  # オブジェクトのいずれかが指定できます。
  # 
  # REXML::Element を指定すると、その要素が削除されます。
  # 整数を指定すると、element 番目の要素を削除します(1-originで指定します)。
  # 文字列を指定すると、XPath としてマッチする要素を削除します。
  # 複数の要素がマッチする場合はそのうち1つが削除されます。
  # 
  # @param element 削除する要素
  # @see [[m:REXML::Elements#delete]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new '<a><b/><c/><c id="1"/><d/><c/></a>'
  # doc.delete_element("/a/b")
  # doc.to_s # => "<a><c/><c id='1'/><d/><c/></a>"
  # doc.delete_element("a/c[@id='1']")
  # doc.to_s # => "<a><c/><d/><c/></a>"
  # doc.root.delete_element("c")
  # doc.to_s # => "<a><d/><c/></a>"
  # doc.root.delete_element("c")
  # doc.to_s # => "<a><d/></a>"
  # doc.root.delete_element(1)
  # doc.to_s # => "<a/>"
  # //}
  def delete_element; end

  # --- delete_namespace(namespace = "xmlns") -> self
  # 名前空間を要素から削除します。
  # 
  # 削除可能な名前空間はそのノードで宣言されているもののみです。
  # 上位の要素で宣言されているものは削除できません。
  # 
  # 引数を省略した場合はデフォルトの名前空間を削除します。
  # 
  # @param namespace 削除する名前空間の prefix
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new "<a xmlns:foo='bar' xmlns='twiddle'/>"
  # doc.root.delete_namespace
  # doc.to_s # => "<a xmlns:foo='bar'/>"
  # doc.root.delete_namespace 'foo'
  # doc.to_s # => "<a/>"
  # //}
  def delete_namespace; end

  # --- document -> REXML::Document | nil
  # self が属する文書([[c:REXML::Document]])オブジェクトを返します。
  # 
  # 属する文書がない場合には nil を返します。
  def document; end

  # --- each_element(xpath = nil) {|element| ... } -> ()
  # 各子要素を引数としてブロックを呼び出します。
  # 
  # xpath に文字列を指定するとそれにマッチする子要素のみを対象とします。
  # 
  # @param xpath XPath 文字列
  def each_element; end

  # --- each_element_with_attribute(key, value = nil, max = 0, name = nil) {|element| ... } -> ()
  # 
  # 特定の属性を持つすべての子要素を引数としてブロックを呼び出します。
  # 
  # key で指定した属性名の属性を持つ要素のみを対象とします。
  # value を指定すると、keyで指定した属性名を持つ属性の値がvalueである
  # もののみを対象とします。
  # maxを指定すると、対象となる子要素の先頭 max 個のみが対象となります。
  # name を指定すると、それは xpath 文字列と見なされ、
  # それにマッチするもののみが対象となります。
  # 
  # max に 0 を指定すると、max の指定は無視されます(0個ではありません)。
  # 
  # @param key 属性名(文字列)
  # @param value 属性値(文字列)
  # @param max ブロック呼出の対象とする子要素の最大個数
  # @param name xpath文字列
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<a><b id='1'/><c id='2'/><d id='1'/><e/></a>")
  # doc.root.each_element_with_attribute('id'){|e| p e }
  # # >> <b id='1'/>
  # # >> <c id='2'/>
  # # >> <d id='1'/>
  # doc.root.each_element_with_attribute('id', '1'){|e| p e }
  # # >> <b id='1'/>
  # # >> <d id='1'/>
  # doc.root.each_element_with_attribute('id', '1', 1){|e| p e }
  # # >> <b id='1'/>
  # doc.root.each_element_with_attribute('id', '1', 0, 'd'){|e| p e }
  # # >> <d id='1'/>
  # //}
  def each_element_with_attribute; end

  # --- each_element_with_text(text = nil, max = 0, name = nil) {|element| ... } -> ()
  # テキストを子ノードとして
  # 持つすべての子要素を引数としてブロックを呼び出します。
  # 
  # text を指定すると、テキストの内容が text であるもののみを対象とします。
  # maxを指定すると、対象となる子要素の先頭 max 個のみが対象となります。
  # name を指定すると、それは xpath 文字列と見なされ、
  # それにマッチするもののみが対象となります。
  # 
  # max に 0 を指定すると、max の指定は無視されます(0個ではありません)。
  # 
  # @param text テキストの中身(文字列)
  # @param max ブロック呼出の対象とする子要素の最大個数
  # @param name xpath文字列
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new '<a><b>b</b><c>b</c><d>d</d><e/></a>'
  # doc.root.each_element_with_text {|e|p e}
  # # >> <b> ... </>
  # # >> <c> ... </>
  # # >> <d> ... </>
  # doc.root.each_element_with_text('b'){|e|p e}
  # # >> <b> ... </>
  # # >> <c> ... </>
  # doc.root.each_element_with_text('b', 1){|e|p e}
  # # >> <b> ... </>
  # doc.root.each_element_with_text(nil, 0, 'd'){|e|p e}
  # # >> <d> ... </>
  # //}
  def each_element_with_text; end

  # --- elements -> REXML::Elements
  # 要素が保持している子要素の集合を返します。
  def elements; end

  # --- get_elements(xpath) -> [REXML::Element]
  # xpath にマッチする要素を配列で返します。
  # 
  # xpath には XPath 文字列を指定します。
  # 
  # @param xpath XPath 文字列
  # @see [[m:REXML::Elements#to_a]]
  def get_elements; end

  # --- get_text(path = nil) -> REXML::Text | nil
  # 先頭のテキスト子ノードを返します。
  # 
  # raw モードの設定は無視され、常に正規化されたテキストを返します。
  # [[m:REXML::Text#value]] も参照してください。
  # 
  # path を渡した場合は、その XPath 文字列で指定される
  # テキストノードの文字列を返します。
  # 
  # テキストノードがない場合には nil を返します。
  # 
  # @param path XPath文字列
  # @see [[m:REXML::Element#text]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new "<p>some text <b>this is bold!</b> more text</p>"
  # # doc.root (<p> ... </p>) は2つのテキストノード("some text " と " more text"
  # # を持っているが、前者を返す
  # doc.root.get_text.value # => "some text "
  # //}
  def get_text; end

  # --- has_attributes? -> bool
  # 要素が属性を1つ以上持っていれば真を返します。
  def has_attributes?; end

  # --- has_elements? -> bool
  # self が一つでも子要素を持つならば true を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<a><b/><c>Text</c></a>")
  # doc.root.has_elements?               # => true
  # doc.elements["/a/b"].has_elements?   # => false
  # # /a/c はテキストノードしか持たないので false である
  # doc.elements["/a/c"].has_elements?   # => false
  # //}
  def has_elements?; end

  # --- has_text? -> bool
  # 要素がテキストノードを子ノードとして持つ場合に true を返します。
  def has_text?; end

  # --- instructions -> [REXML::Instraction]
  # すべての instruction 子ノードの配列を返します。
  # 
  # 返される配列は freeze されます。
  def instructions; end

  # --- namespace(prefix=nil) -> String
  # self の文脈で prefix が指している名前空間の URI を返します。
  # 
  # prefix を省略すると、デフォルトの名前空間の URI を返します。
  # 
  # prefix で指示される名前空間の宣言が存在しない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<a xmlns='1' xmlns:y='2'><b/><c xmlns:z='3'/><y:d /></a>")
  # b = doc.elements['//b']
  # b.namespace      # => "1"
  # b.namespace("y") # => "2"
  # b.namespace("z") # => nil
  # d = doc.elements['//y:d']
  # d.namespace      # => "2"
  # //}
  def namespace; end

  # --- namespaces -> {String => String}
  # self の文脈で定義されている名前空間の情報を返します。
  # 
  # 対象の要素とその外側の要素で定義されている名前空間を、{ prefix => 識別子 }
  # というハッシュテーブルで返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<a xmlns:x='1' xmlns:y='2'><b/><c xmlns:z='3'/></a>")
  # doc.elements['//b'].namespaces # => {"x"=>"1", "y"=>"2"}
  # //}
  def namespaces; end

  # --- next_element -> Element | nil
  # 次の兄弟要素を返します。
  # 
  # 次の要素が存在しない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new '<a><b/>text<c/></a>'
  # doc.root.elements['b'].next_element # => <c/>
  # doc.root.elements['c'].next_element # => nil
  # //}
  def next_element; end

  # --- node_type -> Symbol
  # シンボル :element を返します。
  def node_type; end

  # --- prefixes -> [String]
  # self の文脈で定義されている prefix を文字列の配列を返します。
  # 
  # 対象の要素とその外側の要素で定義されている prefix を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new("<a xmlns:x='1' xmlns:y='2'><b/><c xmlns:z='3'/></a>")
  # doc.elements['//b'].prefixes # => ["x", "y"]
  # //}
  def prefixes; end

  # --- previous_element -> Element | nil
  # 前の兄弟要素を返します。
  # 
  # 前の要素が存在しない場合は nil を返します。
  def previous_element; end

  # --- raw -> bool
  # その要素が raw モードであるならば真を返します。
  # 
  # 以下のいずれかであれば、raw モードであると判定されます。
  #   * [[m:REXML::Element#context]] の :raw が :all である
  #   * context の :raw の配列に self の要素名が含まれる
  def raw; end

  # --- root -> REXML::Element
  # self が属する文書のルート要素を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <root>
  # <children>
  #   <grandchildren />
  # </children>
  # </root>
  # EOS
  # 
  # children = doc.get_elements("/root/children").first
  # children.name # => "children"
  # children.root.name # => "root"
  # grandchildren = doc.get_elements("/root/children/grandchildren").first
  # grandchildren.name # => "grandchildren"
  # grandchildren.root.name # => "root"
  # //}
  def root; end

  # --- root_node -> REXML::Document | REXML::Node
  # self が属する文書のルートノードを返します。
  # 
  # 通常はその要素が属する文書([[c:REXML::Document]]) オブジェクトが
  # 返されます。
  # 
  # その要素が属する [[c:REXML::Document]] オブジェクトが存在しない
  # 場合は木構造上のルートノードが返されます。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <root>
  # <children>
  #   <grandchildren />
  # </children>
  # </root>
  # EOS
  # 
  # children = doc.get_elements("/root/children").first
  # children.name # => "children"
  # children.root_node == doc # => true
  # grandchildren = doc.get_elements("/root/children/grandchildren").first
  # grandchildren.name # => "grandchildren"
  # grandchildren.root_node == doc # => true
  # //}
  def root_node; end

  # --- text(path = nil) -> String | nil
  # 先頭のテキスト子ノードの文字列を返します。
  # 
  # テキストノードを複数保持している場合は最初のノードにしか
  # アクセスできないことに注意してください。
  # 
  # raw モードの設定は無視され、常に正規化されたテキストを返します。
  # [[m:REXML::Text#value]] も参照してください。
  # 
  # path を渡した場合は、その XPath 文字列で指定される
  # テキストノードの文字列を返します。
  # 
  # テキストノードがない場合には nil を返します。
  # 
  # @param path XPath文字列
  # @see [[m:REXML::Element#get_text]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new "<p>some text <b>this is bold!</b> more text</p>"
  # # doc.root (<p> ... </p>) は2つのテキストノード("some text " と " more text"
  # # を持っているが、前者を返す
  # doc.root.text # => "some text "
  # //}
  def text; end

  # --- text=(text)
  # 「先頭の」テキストノードを text で置き換えます。
  # 
  # テキストノードを1つ以上保持している場合はそのうち
  # 最初のノードを置き換えます。
  # 
  # 要素がテキストノードを保持していない場合は新たなテキストノードが追加されます。
  # 
  # text には文字列、[[c:REXML::Text]]、nil のいずれかが指定できます。
  # REXML::Text オブジェクトを指定した場合には、それが設定され、
  # 文字列を指定した場合には
  # [[m:REXML::Text.new]](text, whitespace(), nil, raw())
  # で生成される Text オブジェクトが設定されます。
  # nil を指定すると最初のテキストノードが削除されます。
  # 
  # @param text 置き換え後のテキスト(文字列、[[c:REXML::Text]], nil(削除))
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new('<a><b/></a>')
  # doc.to_s # => "<a><b/></a>"
  # doc.root.text = "Foo"; doc.to_s # => "<a><b/>Foo</a>"
  # doc.root.text = "Bar"; doc.to_s # => "<a><b/>Bar</a>"
  # doc.root.add_element "c"
  # doc.root.text = "Baz"; doc.to_s # => "<a><b/>Baz<c/></a>"
  # doc.root.text = nil; doc.to_s # => "<a><b/><c/></a>"
  # //}
  def text=; end

  # --- texts -> [REXML::Texts]
  # すべてのテキスト子ノードの配列を返します。
  # 
  # 返される配列は freeze されます。
  def texts; end

  # --- whitespace -> bool
  # 要素(self)内で空白が考慮されるならば真を返します。
  # 
  # これは、
  #   * [[m:REXML::Element#context]] に :respect_whitespace も :compress_whitespace も
  #     含まれない
  #   * context の :respect_whitespace に self の要素名が含まれていて、
  #     :compress_whitespace に self の要素名が含まれていない。
  #     「含まれている」というのには :all が指定されている場合と、
  #     配列に含まれている場合の両方があります。
  # のいずれかの場合に真を返します。
  # 
  # 要素名として [[m:REXML::Namespace#expanded_name]] が使われるので、
  # 名前空間の prefix は判定に影響します。
  def whitespace; end

  # --- write(output = $stdout, indent = -1, transitive = false, ie_hack = false)
  # このメソッドは deprecated です。 [[c:REXML::Formatter]] を代わりに
  # 使ってください。
  # 
  # output にその要素を文字列化したものを(子要素を含め)出力します。
  # 
  # @param output 出力先([[c:IO]] のように << で書き込めるオブジェクト)
  # @param indent インデントのスペースの数(-1 だとインデントしない)
  # @param transitive XMLではインデントのスペースでDOMが変化してしまう場合がある。
  #        これに真を渡すと、XMLのDOMに余計な要素が加わらないように
  #        空白の出力を適当に抑制するようになる
  # @param ie_hack IEはバージョンによってはXMLをちゃんと解釈できないので、
  #        それに対応したXMLを出力するかどうかを真偽値で指定する
  def write; end

  # --- xpath -> String
  # 文書上の対象の要素にのみマッチする xpath 文字列を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new('<a><b/><c/></a>')
  # c = doc.root.elements[2] # <a> .. </a> の中の <c/> 要素
  # c # => <c/>
  # c.xpath # => "/a/c"
  # doc = REXML::Document.new('<a><b/><b/></a>')
  # b = doc.root.elements[2] # <a> .. </a> の中の2番目の <b/> 要素
  # b # => <b/>
  # b.xpath # => "/a/b[2]"
  # //}
  def xpath; end

  # --- new(arg = UNDEFINED, parent = nil, context = nil) -> REXML::Element
  # 要素オブジェクトを生成します。
  # 
  # arg が文字列の場合、新たな要素の名前は arg に設定されます。
  # arg が [[c:REXML::Element]] オブジェクトの場合は、
  # 新たな要素の名前、属性、context が arg のもので初期化されます。
  # 
  # parent で親ノードを指定します。
  # 
  # context には hash table で要素のコンテキストを指定します。
  # 基本的には text node ([[c:REXML::Text]]) での特別な文字、特に空白について
  # の取り扱いを指定できます。
  # 以下の [[c:Symbol]] をハッシュのキーとして使います。
  # 
  # : :respect_whitespace
  #   空白を考慮して欲しい要素の名前の集合を文字列の配列で指定します。
  #   また、すべての要素で空白を考慮して欲しい場合には
  #   :all を指定します。
  #   デフォルト値は :all です。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :compress_whitespace
  #   空白を無視して欲しい要素の名前の集合を文字列の配列で指定します。
  #   この指定は :respect_whitespace での指定を上書きします。
  #   すべての要素で空白を無視して欲しい場合には
  #   :all を指定します。
  #   [[m:REXML::Element#whitespace]] も参照してください。
  # : :ignore_whitespace_nodes
  #   空白のみからなるノードを無視して欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべての要素で無視して欲しい場合は :all を指定します。
  #   これが設定された場合、空白のみからなる text node は追加されません。
  #   [[m:REXML::Element#ignore_whitespace_nodes]] も参照してください。
  # : :raw
  #   raw mode で取り扱いをして欲しい要素の名前の集合を
  #   文字列の配列で指定します。
  #   すべてのノードを raw mode で取り扱って欲しい場合は :all を指定します。
  #   raw mode においては、text 中の特殊文字は一切変換されません。
  #   [[m:REXML::Element#raw]] も参照してください。
  # 
  # @param arg 要素の名前(String)もしくは初期化に使う [[c:REXML::Element]]
  #        オブジェクト
  # @param parent 親ノード
  # @param context コンテキスト([[c:Hash]])
  # @see [[m:REXML::Parent.new]], [[m:REXML::Child.new]]
  def new; end

  # --- UNDEFINED -> String
  # "UNDEFINED" という文字列。
  def UNDEFINED; end

end
