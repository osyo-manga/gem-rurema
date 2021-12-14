module TSort
  # --- each_strongly_connected_component {|nodes| ...} -> nil
  # --- each_strongly_connected_component -> Enumerator
  # 
  # [[m:TSort#strongly_connected_components]] メソッドのイテレータ版です。
  # obj.each_strongly_connected_component は
  # obj.strongly_connected_components.each に似ていますが、
  # ブロックの評価中に obj が変更された場合は予期しない結果になる
  # ことがあります。
  # 
  # each_strongly_connected_component は nil を返します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # class Hash
  #   include TSort
  #   alias tsort_each_node each_key
  #   def tsort_each_child(node, &block)
  #     fetch(node).each(&block)
  #   end
  # end
  # 
  # non_sort = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # 
  # non_sort.each_strongly_connected_component{|nodes|
  #   p nodes
  # }
  # 
  # #出力
  # #=> [4]
  # #=> [2, 3]
  # #=> [1]
  # //}
  # 
  # @see [[m:TSort.each_strongly_connected_component]]
  def each_strongly_connected_component; end

  # --- each_strongly_connected_component_from(node, id_map={}, stack=[]) {|nodes| ...} -> ()
  # --- each_strongly_connected_component_from(node, id_map={}, stack=[]) -> Enumerator
  # 
  # node から到達可能な強連結成分についてのイテレータです。
  # 
  # 返す値は規定されていません。
  # 
  # each_strongly_connected_component_from は
  # tsort_each_node を呼びません。
  # 
  # @param node ノードを指定します。
  # 
  # //emlist[例 到達可能なノードを表示する][ruby]{
  # require 'tsort'
  # 
  # class Hash
  #   include TSort
  #   alias tsort_each_node each_key
  #   def tsort_each_child(node, &block)
  #     fetch(node).each(&block)
  #   end
  # end
  # 
  # non_sort = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # 
  # non_sort.each_strongly_connected_component{|nodes|
  #   p nodes
  #   nodes.each {|node|
  #     non_sort.each_strongly_connected_component_from(node){|ns|
  #       printf("%s -> %s\n", node, ns.join(","))
  #     }
  #   }
  # }
  # 
  # #出力
  # #=> [4]
  # #=> 4 -> 4
  # #=> [2, 3]
  # #=> 2 -> 4
  # #=> 2 -> 2,3
  # #=> 3 -> 4
  # #=> 3 -> 3,2
  # #=> [1]
  # #=> 1 -> 4
  # #=> 1 -> 2,3
  # #=> 1 -> 1
  # //}
  # 
  # @see [[m:TSort.each_strongly_connected_component_from]]
  def each_strongly_connected_component_from; end

  # --- strongly_connected_components -> Array
  # 
  # 強連結成分の集まりを配列の配列として返します。
  # この配列は子から親に向かってソートされています。
  # 各要素は強連結成分を表す配列です。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # class Hash
  #   include TSort
  #   alias tsort_each_node each_key
  #   def tsort_each_child(node, &block)
  #     fetch(node).each(&block)
  #   end
  # end
  # 
  # non_sort = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # 
  # p non_sort.strongly_connected_components
  # #=> [[4], [2, 3], [1]]
  # //}
  # 
  # @see [[m:TSort.strongly_connected_components]]
  def strongly_connected_components; end

  # --- tsort -> Array
  # 
  # 頂点をトポロジカルソートして得られる配列を返します。
  # この配列は子から親に向かってソートされています。
  # すなわち、最初の要素は子を持たず、最後の要素は親を持ちません。
  # 
  # @raise TSort::Cyclic 閉路が存在するとき、発生します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # class Hash
  #   include TSort
  #   alias tsort_each_node each_key
  #   def tsort_each_child(node, &block)
  #     fetch(node).each(&block)
  #   end
  # end
  # 
  # sorted = {1=>[2, 3], 2=>[3], 3=>[], 4=>[]}.tsort
  # p sorted #=> [3, 2, 1, 4]
  # //}
  # 
  # @see [[m:TSort.tsort]]
  def tsort; end

  # --- tsort_each {|node| ...} -> nil
  # --- tsort_each -> Enumerator
  # 
  # [[m:TSort#tsort]] メソッドのイテレータ版です。
  # obj.tsort_each は obj.tsort.each と似ていますが、
  # ブロックの評価中に obj が変更された場合は予期しない結果になる
  # ことがあります。
  # 
  # tsort_each は nil を返します。
  # 閉路が存在するとき、例外 [[c:TSort::Cyclic]] を起こします。
  # 
  # @raise TSort::Cyclic 閉路が存在するとき、発生します.
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # class Hash
  #   include TSort
  #   alias tsort_each_node each_key
  #   def tsort_each_child(node, &block)
  #     fetch(node).each(&block)
  #   end
  # end
  # 
  # non_sort = {1=>[2, 3], 2=>[3], 3=>[], 4=>[]}
  # 
  # non_sort.tsort_each {|node|
  #   non_sort.tsort_each_child(node){|child|
  #     printf("%d -> %d\n", node, child)
  #   }
  # }
  # 
  # # 出力
  # #=> 2 -> 3
  # #=> 1 -> 2
  # #=> 1 -> 3
  # //}
  # 
  # @see [[m:TSort.tsort_each]]
  def tsort_each; end

  # --- tsort_each_child(node) {|child| ...} -> ()
  # 
  # TSort で拡張されるクラスで定義されていなければならないメソッドです。
  # 
  # tsort_each_child is used to iterate for child nodes of node.
  # 
  # @param node ノードを指定します。
  # 
  # @raise NotImplementedError TSort で拡張されるクラスで定義されていない場合発生します。
  def tsort_each_child; end

  # --- tsort_each_node {|node| ...} -> ()
  # 
  # TSort で拡張されるクラスで定義されていなければならないメソッドです。
  # 
  # tsort_each_node is used to iterate for all nodes over a graph.
  # 
  # @raise NotImplementedError TSort で拡張されるクラスで定義されていない場合発生します。
  def tsort_each_node; end

  # --- each_strongly_connected_component(each_node, each_child) {|nodes| ...} -> nil
  # --- each_strongly_connected_component(each_node, each_child) -> Enumerator
  # 
  # [[m:TSort.strongly_connected_components]] メソッドのイテレータ版です。
  # 
  # 引数 each_node と each_child でグラフを表します。
  # 
  # @param each_node グラフ上の頂点をそれぞれ評価するcallメソッドを持つオブ
  #                  ジェクトを指定します。
  # 
  # @param each_child 引数で与えられた頂点の子をそれぞれ評価するcallメソッ
  #                   ドを持つオブジェクトを指定します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # g = {1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # TSort.each_strongly_connected_component(each_node, each_child) {|scc| p scc }
  # 
  # # => [4]
  # #    [2]
  # #    [3]
  # #    [1]
  # 
  # g = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # TSort.each_strongly_connected_component(each_node, each_child) {|scc| p scc }
  # 
  # # => [4]
  # #    [2, 3]
  # #    [1]
  # //}
  # 
  # @see [[m:TSort#each_strongly_connected_component]]
  def each_strongly_connected_component; end

  # --- each_strongly_connected_component_from(node, each_child, id_map={}, stack=[]) {|nodes| ...} -> ()
  # --- each_strongly_connected_component_from(node, each_child, id_map={}, stack=[]) -> Enumerator
  # 
  # node から到達可能な強連結成分についてのイテレータです。
  # 
  # 引数 node と each_child でグラフを表します。
  # 
  # 返す値は規定されていません。
  # 
  # TSort.each_strongly_connected_component_fromは[[c:TSort]]をincludeして
  # グラフを表現する必要のないクラスメソッドです。
  # 
  # @param node ノードを指定します。
  # 
  # @param each_child 引数で与えられた頂点の子をそれぞれ評価するcallメソッ
  #                   ドを持つオブジェクトを指定します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # graph = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # each_child = lambda {|n, &b| graph[n].each(&b) }
  # TSort.each_strongly_connected_component_from(1, each_child) {|scc|
  #   p scc
  # }
  # # => [4]
  # #    [2, 3]
  # #    [1]
  # //}
  # 
  # @see [[m:TSort#each_strongly_connected_component_from]]
  def each_strongly_connected_component_from; end

  # --- strongly_connected_components(each_node, each_child) -> Array
  # 
  # 強連結成分の集まりを配列の配列として返します。
  # この配列は子から親に向かってソートされています。
  # 各要素は強連結成分を表す配列です。
  # 
  # 引数 each_node と each_child でグラフを表します。
  # 
  # @param each_node グラフ上の頂点をそれぞれ評価するcallメソッドを持つオブ
  #                  ジェクトを指定します。
  # 
  # @param each_child 引数で与えられた頂点の子をそれぞれ評価するcallメソッ
  #                   ドを持つオブジェクトを指定します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # g = {1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # p TSort.strongly_connected_components(each_node, each_child)
  # # => [[4], [2], [3], [1]]
  # 
  # g = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # p TSort.strongly_connected_components(each_node, each_child)
  # # => [[4], [2, 3], [1]]
  # //}
  # 
  # @see [[m:TSort#strongly_connected_components]]
  def strongly_connected_components; end

  # --- tsort(each_node, each_child) -> Array
  # 
  # 頂点をトポロジカルソートして得られる配列を返します。
  # この配列は子から親に向かってソートされています。
  # すなわち、最初の要素は子を持たず、最後の要素は親を持ちません。
  # 
  # 引数 each_node と each_child でグラフを表します。
  # 
  # @param each_node グラフ上の頂点をそれぞれ評価するcallメソッドを持つオブ
  #                  ジェクトを指定します。
  # 
  # @param each_child 引数で与えられた頂点の子をそれぞれ評価するcallメソッ
  #                   ドを持つオブジェクトを指定します。
  # 
  # @raise TSort::Cyclic 閉路が存在するとき、発生します。
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # g = {1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # p TSort.tsort(each_node, each_child) # => [4, 2, 3, 1]
  # 
  # g = {1=>[2], 2=>[3, 4], 3=>[2], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # p TSort.tsort(each_node, each_child) # raises TSort::Cyclic
  # //}
  # 
  # @see [[m:TSort#tsort]]
  def tsort; end

  # --- tsort_each(each_node, each_child) {|node| ...} -> nil
  # --- tsort_each(each_node, each_child) -> Enumerator
  # 
  # [[m:TSort.tsort]] メソッドのイテレータ版です。
  # 
  # 引数 each_node と each_child でグラフを表します。
  # 
  # @param each_node グラフ上の頂点をそれぞれ評価するcallメソッドを持つオブ
  #                  ジェクトを指定します。
  # 
  # @param each_child 引数で与えられた頂点の子をそれぞれ評価するcallメソッ
  #                   ドを持つオブジェクトを指定します。
  # 
  # @raise TSort::Cyclic 閉路が存在するとき、発生します.
  # 
  # //emlist[使用例][ruby]{
  # require 'tsort'
  # 
  # g = {1=>[2, 3], 2=>[4], 3=>[2, 4], 4=>[]}
  # each_node = lambda {|&b| g.each_key(&b) }
  # each_child = lambda {|n, &b| g[n].each(&b) }
  # TSort.tsort_each(each_node, each_child) {|n| p n }
  # # => 4
  # #    2
  # #    3
  # #    1
  # //}
  # 
  # @see [[m:TSort#tsort_each]]
  def tsort_each; end

end
