module REXML::Node
  # --- each_recursive {|node| ... } -> ()
  # self とその各 element node を引数とし、ブロックを呼び出します。
  def each_recursive; end

  # --- find_first_recursive {|node| ... } -> REXML::Node | nil
  # self とその各 element node を引数とし、ブロックを呼び出し、
  # そのブロックの返り値が真であった最初の node を返します。
  # 
  # 見付からなかった場合は nil を返します。
  def find_first_recursive; end

  # --- index_in_parent -> Insteger
  # self の親における index を返します。
  # 
  # 返される index は 1-origin です。
  # 
  # ノードが親を持たない([[c:REXML::Child]] でない)場合は例外を発生させます。
  def index_in_parent; end

  # --- next_sibling_node -> REXML::Node | nil
  # 次の兄弟ノードを返します。
  # 
  # 次の兄弟ノードが存在しない場合(ノードがルートである場合や、
  # 最後のノードである場合)は nil を返します。
  def next_sibling_node; end

  # --- parent? -> bool
  # 子を持つノードであれば真を返します。
  # 
  # [[c:REXML::Parent]] のサブクラスでは真を返します。
  # それ以外では偽を返します。
  # 
  # @see [[m:REXML::Parent#parent?]]
  def parent?; end

  # --- previous_sibling_node -> REXML::Node | nil
  # 前の兄弟ノードを返します。
  # 
  # 前の兄弟ノードが存在しない場合(ノードがルートである場合や、
  # 最初のノードである場合)は nil を返します。
  def previous_sibling_node; end

  # --- to_s(indent = -1) -> String
  # 
  # ノードを文字列に変換します。
  # 
  # @param indent このパラメータは deprecated で、無視されます
  def to_s; end

end
