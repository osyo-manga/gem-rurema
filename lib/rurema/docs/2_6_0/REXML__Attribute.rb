class REXML::Attribute
  # --- ==(other) -> bool
  # 属性の名前と値が other と一致する場合に真を返します。
  def ==; end

  # --- clone -> REXML::Element
  # self を複製し返します。
  def clone; end

  # --- element -> REXML::Element
  # その属性が属する要素を返します。
  def element; end

  # --- element=(element)
  # self が属する要素を変更します。
  # 
  # @param element 変更先の要素([[c:REXML::Element]])
  def element=; end

  # --- namespace(arg = nil) -> String | nil
  # 属性の名前空間の URI を返します。
  # 
  # URI が定義されていない場合は nil を返します。
  # 
  # @param arg この値を指定すると、その属性の名前空間でなく、arg という名前空間
  #        の URI が返されます。
  #        通常は省略します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new("el")
  # e.add_attribute("xmlns:ns", "http://www.example.com/ns")
  # e.add_attribute("ns:r", "rval")
  # p e.attributes.get_attribute("r").prefix  # => "ns"
  # p e.attributes.get_attribute("r").namespace # => "http://www.example.com/ns"
  # //}
  def namespace; end

  # --- node_type -> Symbol
  # 「:attribute」というシンボルを返します。
  def node_type; end

  # --- normalized=(value)
  # 正規化された属性値を設定します。
  # 
  # 通常はライブラリが自動的にこの値を設定するので
  # ユーザはこれを使う必要はないでしょう。
  # 
  # @param value 正規化された属性値
  def normalized=; end

  # --- prefix -> String
  # 属性の名前空間を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new( "elns:myelement" )
  # e.add_attribute( "nsa:a", "aval" )
  # e.add_attribute( "b", "bval" )
  # p e.attributes.get_attribute( "a" ).prefix   # -> "nsa"
  # p e.attributes.get_attribute( "b" ).prefix   # -> "elns"
  # a = REXML::Attribute.new( "x", "y" )
  # p a.prefix                                   # -> ""
  # //}
  def prefix; end

  # --- remove -> ()
  # self を所属する要素から取り除きます。
  def remove; end

  # --- to_s -> String
  # 正規化された属性値を返します。
  # 
  # 属性値の正規化については XML の仕様を参考にしてください。
  def to_s; end

  # --- to_string -> String
  # "name='value'" という形式の文字列を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new("el")
  # e.add_attribute("ns:r", "rval")
  # p e.attributes.get_attribute("r").to_string # => "ns:r='rval'"
  # //}
  def to_string; end

  # --- value -> String
  # 正規化されていない属性値を返します。
  # 
  # 属性値の正規化については XML の仕様を参考にしてください。
  def value; end

  # --- write(output, indent = -1)  -> object
  # output に self の情報を name='value' という形式で書き込みます。
  # 
  # output が返ります。
  # 
  # @param output 書き込み先の IO オブジェクト
  # @param indent インデントレベル、ここでは無視される
  def write; end

  # --- xpath -> String
  # その属性を指定する xpath 文字列を返します。
  # 
  # 例えば "/foo/bar/@ns:r" という文字列を返します。
  def xpath; end

  # --- new(attribute_to_clone, parent = nil) -> REXML::Attribute
  # --- new(attribute, value, parent = nil) -> REXML::Attribute
  # 新たな属性オブジェクトを生成します。
  # 
  # 2種類の初期化が可能です。
  # REXML::Attribute オブジェクトを渡した場合は、
  # 属性名とその値がそれから複製されます。
  # parent で新たに作られる属性オブジェクトが属する
  # 要素が指定できます。
  # parent を省略した場合は複製元と同じ要素の属するように
  # 設定されます。
  # 
  # また、属性名とその値を文字列で指定することもできます。
  # parent で新たに作られる属性オブジェクトが属する
  # 要素が指定できます。
  # parent を省略した場合は nil が設定されます。
  # 
  # 通常はこのメソッドは直接は使わず、[[m:REXML::Element#add_attribute]] などを
  # 使うでしょう。
  # 
  # @param attribute_to_clone 複製元の [[c:REXML::Attribute]] オブジェクト
  # @param attribute 属性名
  # @param value 属性の値
  # @param parent 生成される属性が所属する要素([[c:REXML::Element]])
  def new; end

end
