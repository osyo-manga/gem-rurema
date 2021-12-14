class PP
  # --- comma_breakable    -> ()
  # 
  # 以下と等価な働きをするもので簡便のために用意されています。
  # //emlist[][ruby]{
  # text ','
  # breakable
  # //}
  # 
  # @see [[m:PrettyPrint#text]], [[m:PrettyPrint#breakable]]
  def comma_breakable; end

  # --- object_group(obj) { ... }    -> ()
  # 
  # 以下と等価な働きをするもので簡便のために用意されています。
  #   group(1, '#<' + obj.class.name, '>') { ... }
  # 
  # @param obj 表示したいオブジェクトを指定します。
  # 
  # @see [[m:PrettyPrint#group]]
  def object_group; end

  # --- pp(obj)    -> ()
  # 
  # 指定されたオブジェクト obj を [[m:Object#pretty_print]] を使って自身のバッファに追加します。
  # 
  # obj がすでに、現在のノードの親において出力されていた場合には、
  # 参照のループが存在しているので、[[m:Object#pretty_print]] の代わりに
  # [[m:Object#pretty_print_cycle]] が使われます。
  # 
  # @param obj 表示したいオブジェクトを指定します。
  def pp; end

  # --- seplist(list, sep = lambda { comma_breakable }, iter_method = :each){|e| ...}    -> ()
  # 
  # リストの各要素を何かで区切りつつ、自身に追加していくために使われます。
  # 
  # list を iter_method によってイテレートし、各要素を引数としてブロックを実行します。
  # また、それぞれのブロックの実行の合間に sep が呼ばれます。
  # 
  # つまり、以下のふたつは同値です。
  # 
  # //emlist[][ruby]{
  # q.seplist([1,2,3]) {|v| q.pp v }
  # 
  # q.pp 1
  # q.comma_breakable
  # q.pp 2
  # q.comma_breakable
  # q.pp 3
  # //}
  # 
  # @param list 自身に追加したい配列を与えます。iter_method を適切に指定すれば、
  #             Enumerable でなくても構いません。
  # 
  # @param sep 区切りを自身に追加するブロックを与えます。list がイテレートされないなら、
  #            sep は決して呼ばれません。
  # 
  # @param iter_method list をイテレートするメソッドをシンボルで与えます。
  # 
  # @see [[m:PP#comma_breakable]]
  def seplist; end

  # --- pp(obj, out = $>, width = 79)    -> object
  # 
  # 指定されたオブジェクト obj を出力先 out に幅 width で出力します。
  # 出力先 out を返します。
  # 
  # @param obj 表示したいオブジェクトを指定します。
  # 
  # @param out 出力先を指定します。<< メソッドが定義されている必要があります。
  # 
  # @param width 出力先の幅を指定します。
  # 
  # //emlist[][ruby]{
  # require 'pp'
  # 
  # str = PP.pp([[:a, :b], [:a, [[:a, [:a, [:a, :b]]], [:a, :b],]]], '', 20)
  # puts str
  # # =>
  # # [[:a, :b],
  # #  [:a,
  # #   [[:a,
  # #     [:a, [:a, :b]]],
  # #    [:a, :b]]]]
  # //}
  # 
  # @see [[m:$>]]
  def pp; end

  # --- sharing_detection                 -> bool
  # --- sharing_detection=(boolean)
  # 
  # 共有検出フラグを表すアクセサです。
  # デフォルトは false です。true である場合、
  # [[m:PP.pp]] は一度出力したオブジェクトを再び出力する時
  # [[m:Object#pretty_print_cycle]] を使います。
  # 
  # @param boolean 共有検出フラグを true か false で指定します。
  # 
  # //emlist[][ruby]{
  # b = [1, 2, 3]
  # a = [b, b]
  # 
  # pp a                        #=> [[1, 2, 3], [1, 2, 3]]
  # 
  # PP.sharing_detection = true
  # pp a                        #=> [[1, 2, 3], [...]]
  # //}
  def sharing_detection; end

  # --- singleline_pp(obj, out=$>)    -> object
  # 
  # 指定されたオブジェクト obj を出力先 out に出力します。
  # ただし、インデントも改行もしません。
  # 出力先 out を返します。
  # 
  # @param obj 表示したいオブジェクトを指定します。
  # 
  # @param out 出力先を指定します。<< メソッドが定義されている必要があります。
  def singleline_pp; end

end
