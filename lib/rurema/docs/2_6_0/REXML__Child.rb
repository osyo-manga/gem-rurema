class REXML::Child
  # --- bytes
  # @todo
  def bytes; end

  # --- document -> REXML::Document | nil
  # そのノードが属する document ([[c:REXML::Document]]) を返します。
  # 
  # 属する document が存在しない場合は nil を返します。
  def document; end

  # --- next_sibling -> REXML::Node
  # 次の隣接ノードを返します。
  # 
  # [[m:REXML::Node#next_sibling_node]] の別名です。
  # 
  # @see [[m:REXML::Child#next_sibling=]]
  def next_sibling; end

  # --- next_sibling=(other)
  # other を self の次の隣接ノードとします。
  # 
  # つまり、親ノードが持つ子ノード列の self の後ろに
  # other を挿入します。
  # 
  # @param other 挿入するノード
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # a = REXML::Element.new("a")
  # b = a.add_element("b")
  # c = REXML::Element.new("c")
  # b.next_sibling = c
  # d = REXML::Element.new("d")
  # b.previous_sibling = d
  # 
  # p a.to_s # => "<a><d/><b/><c/></a>"
  # //}
  def next_sibling=; end

  # --- parent -> REXML::Parent|nil
  # 親ノードを返します。
  # 
  # ルートノードの場合は nil を返します。
  # 
  # @see [[m:REXML::Child#parent=]]
  def parent; end

  # --- parent=(other)
  # other を親ノードに設定します。
  # 
  # other が元の親ノードと同じならばこのメソッドは何もしません。
  # self が親を持たない場合は単純に other を親ノードに設定します。
  # どちらでもない場合は、元の親ノードの子ノード列から self を取り除いて
  # から other を親ノードに設定します。
  # 
  # このメソッドだけでは other の子ノード集合に self は追加されません。
  # つまりこのメソッドを呼び出した直後は不完全な状態であり、親ノード側を
  # 適切に設定する必要があります。
  # 
  # @param other 新たな親ノード
  # @see [[m:REXML::Child#parent]]
  def parent=; end

  # --- previous_sibling -> REXML::Node
  # 前の隣接ノードを返します。
  # 
  # [[m:REXML::Node#previous_sibling_node]] の別名です。
  # 
  # @see [[m:REXML::Child#previous_sibling=]]
  def previous_sibling; end

  # --- previous_sibling=(other)
  # 
  # other を self の前の隣接ノードとします。
  # 
  # つまり、親ノードが持つ子ノード列の self の前に
  # other を挿入します。
  # 
  # @param other 挿入するノード
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # a = REXML::Element.new("a")
  # b = a.add_element("b")
  # c = REXML::Element.new("c")
  # b.next_sibling = c
  # d = REXML::Element.new("d")
  # b.previous_sibling = d
  # 
  # p a.to_s # => "<a><d/><b/><c/></a>"
  # //}
  def previous_sibling=; end

  # --- remove -> self
  # 親ノードの子ノード列から self を取り除きます。
  def remove; end

  # --- replace_with(child) -> self
  # 親ノードの子ノード列上において、 self を child に置き換えます。
  # 
  # @param child 置き換え後のノード
  # @see [[m:REXML::Parent#replace_child]]
  def replace_with; end

  # --- new(parent = nil) -> REXML::Child
  # REXML::Child オブジェクトを生成します。
  # 
  # parent で親ノードを指定します。
  # 親ノードへの追加は行わないため、オブジェクト生成後に親に
  # 適切に設定する必要があります。
  # 
  # 通常、このメソッドは直接は使いません。継承先のクラスが適切に
  # このメソッド(initialize)を呼び出します。
  # 
  # @param parent 親ノード
  def new; end

end
