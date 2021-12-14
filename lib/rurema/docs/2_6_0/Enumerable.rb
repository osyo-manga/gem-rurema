module Enumerable
  # --- all?               -> bool
  # --- all? {|item| ... } -> bool
  # --- all?(pattern)      -> bool
  # 
  # すべての要素が真である場合に true を返します。
  # 偽である要素があれば、ただちに false を返します。
  # 
  # ブロックを伴う場合は、各要素に対してブロックを評価し、すべての結果
  # が真である場合に true を返します。ブロックが偽を返した時点で、
  # ただちに false を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # require 'set'
  # 
  # # すべて正の数か？
  # p Set[5,  6, 7].all? {|v| v > 0 }      # => true
  # p Set[5, -1, 7].all? {|v| v > 0 }      # => false
  # p Set[].all? {|v| v > 0 }              # => true
  # 
  # p Set['ant', 'bear', 'cat'].all?(/t/)  # => false
  # //}
  # 
  # @see [[m:Array#all?]]
  def all?; end

  # --- any?               -> bool
  # --- any? {|item| ... } -> bool
  # --- any?(pattern)      -> bool
  # 
  # すべての要素が偽である場合に false を返します。
  # 真である要素があれば、ただちに true を返します。
  # 
  # ブロックを伴う場合は、各要素に対してブロックを評価し、すべての結果
  # が偽である場合に false を返します。ブロックが真を返した時点
  # で、ただちに true を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # require 'set'
  # p Set[1, 2, 3].any? {|v| v > 3 }         # => false
  # p Set[1, 2, 3].any? {|v| v > 1 }         # => true
  # p Set[].any? {|v| v > 0 }                # => false
  # p Set['ant', 'bear', 'cat'].any?(/d/)    # => false
  # p Set[nil, true, 99].any?(Integer)       # => true
  # p Set[nil, true, 99].any?                # => true
  # p Set[].any?                             # => false
  # //}
  # 
  # @see [[m:Array#any?]]
  def any?; end

  # --- chain(*enums) -> Enumerator::Chain
  # 
  # 自身と enums 引数を続けて繰り返す [[c:Enumerator::Chain]] を返します。
  # 
  # //emlist[例][ruby]{
  # e = (1..3).chain([4, 5])
  # e.to_a #=> [1, 2, 3, 4, 5]
  # //}
  # 
  # @see [[m:Enumerator#+]]
  def chain; end

  # --- chunk {|elt| ... } -> Enumerator
  # 
  # 要素を前から順にブロックで評価し、その結果によって
  # 要素をチャンクに分けた(グループ化した)要素を持つ
  # [[c:Enumerator]] を返します。
  # 
  # ブロックの評価値が同じ値が続くものを一つのチャンクとして
  # 取り扱います。すなわち、ブロックの評価値が一つ前と
  # 異なる所でチャンクが区切られます。
  # 
  # 返り値の [[c:Enumerator]] は各チャンクのブロック評価値と
  # 各チャンクの要素を持つ配列のペアを各要素とします。
  # そのため、eachだと以下のようになります。
  # 
  # //emlist[][ruby]{
  # enum.chunk {|elt| key }.each {|key, ary| do_something }
  # //}
  # 
  # 例として、整数列を連続する奇数/偶数に分ける例を見てみます。
  # 「n.even?」の値が切り替わるところで区切られているのがわかるでしょう。
  # 
  # //emlist[例][ruby]{
  # [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5].chunk {|n|
  #   n.even?
  # }.each {|even, ary|
  #   p [even, ary]
  # }
  # # => [false, [3, 1]]
  # #    [true, [4]]
  # #    [false, [1, 5, 9]]
  # #    [true, [2, 6]]
  # #    [false, [5, 3, 5]]
  # //}
  # 
  # このメソッドは各要素が既にソートされている場合に便利です。
  # 
  # 以下の例では、テキスト辞書ファイルに含まれる単語の頭文字の頻度を調べています。
  # このファイルは、Linux や macOS などで、ソートされた英語（など）の単語の
  # リストを改行で区切って収めたものです。
  # 大文字／小文字の違いを無視するため upcase しています。
  # 
  # //emlist[例][ruby]{
  # # ファイルのエンコーディングは実際のファイルに合わせてください。
  # open("/usr/share/dict/words", "r:iso-8859-1") {|f|
  #   f.chunk {|line| line[0].upcase }.each {|ch, lines| p [ch, lines.length] }
  # }
  # # => ["A", 17096]
  # #    ["B", 11070]
  # #    ["C", 19901]
  # #    ["D", 10896]
  # #    ...
  # //}
  # 
  # さらにこのメソッドは以下の値を特別扱いします。
  # 
  #   * ブロックの評価値が nil もしくは :_separator であった場合、
  #     その要素を捨てます。チャンクはこの前後で区切られます。
  #   * ブロックの評価値 :_alone であった場合はその要素は
  #     単独のチャンクをなすものと解釈されます。
  # 
  # それ以外のアンダースコアで始まるシンボルを指定した場合は例外が発生します。
  # 
  # //emlist[例][ruby]{
  # [1, 2].chunk { |item| :_underscore }.to_a
  # # => RuntimeError: symbols beginning with an underscore are reserved
  # 
  # # 「.to_a」無しだと Enumerator を返すのみで例外は発生しない
  # //}
  # 
  # nil、 :_separator はある要素を無視したい場合に用います。
  # 例として svn log の出力のハイフンの所で区切りたい場合を考えます。
  # 
  # //emlist[例][ruby]{
  # sep = "-"*72 + "\n" # ハイフンが72個の行
  # IO.popen("svn log README") {|f|
  #   f.chunk {|line|
  #     line != sep || nil
  #   }.each {|_, lines|
  #     pp lines
  #   }
  # }
  # #=> ["r20018 | knu | 2008-10-29 13:20:42 +0900 (Wed, 29 Oct 2008) | 2 lines\n",
  # #    "\n",
  # #    "* README, README.ja: Update the portability section.\n",
  # #    "\n"]
  # #   ["r16725 | knu | 2008-05-31 23:34:23 +0900 (Sat, 31 May 2008) | 2 lines\n",
  # #    "\n",
  # #    "* README, README.ja: Add a note about default C flags.\n",
  # #    "\n"]
  # #   ...
  # //}
  # 
  # テキストを空行で区切られた段落に分けたい場合にも nil が使えます。
  # 
  # //emlist[例][ruby]{
  # File.foreach("README").chunk {|line|
  #   /\A\s*\z/ !~ line || nil
  # }.each {|_, lines|
  #   pp lines
  # }
  # //}
  # 
  # 「:_alone」は要素を素通ししたい場合に用います。
  # 以下の例では「Foo#bar」という形式の行が連続している場合のみ
  # チャンク化し、それ以外は素通しします。
  # 
  # //emlist[例][ruby]{
  # pat = /\A[A-Z][A-Za-z0-9_]+\#/
  # open(filename) {|f|
  #   f.chunk {|line| pat =~ line ? $& : :_alone }.each {|key, lines|
  #     if key != :_alone
  #       print lines.sort.join('')
  #     else
  #       print lines.join('')
  #     end
  #   }
  # }
  # //}
  # 
  # @raise RuntimeError 予約されている値を用いた場合に発生します
  def chunk; end

  # --- chunk_while {|elt_before, elt_after| ... } -> Enumerator
  # 
  # 要素を前から順にブロックで評価し、その結果によって要素をチャンクに分け
  # た(グループ化した)要素を持つ[[c:Enumerator]] を返します。
  # 
  # 隣り合う値をブロックパラメータ elt_before、elt_after に渡し、ブロックの
  # 評価値が偽になる所でチャンクを区切ります。
  # 
  # ブロックは self の長さ - 1 回呼び出されます。
  # 
  # @return チャンクごとの配列をブロックパラメータに渡す [[c:Enumerator]]
  #         を返します。eachメソッドは以下のように呼び出します。
  # //emlist{
  #   enum.chunk_while { |elt_before, elt_after| bool }.each { |ary| ... }
  # //}
  #         to_a や map などのその他の [[c:Enumerable]] モジュールのメソッ
  #         ドも有用です。
  # 
  # //emlist[例][ruby]{
  # # 1ずつ増加する部分配列ごとに分ける。
  # a = [1,2,4,9,10,11,12,15,16,19,20,21]
  # b = a.chunk_while {|i, j| i+1 == j }
  # p b.to_a # => [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
  # c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
  # p c # => [[1, 2], [4], "9-12", [15, 16], "19-21"]
  # d = c.join(",")
  # p d # => "1,2,4,9-12,15,16,19-21"
  # 
  # # 増加のみの部分配列ごとに分ける。
  # a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
  # p a.chunk_while {|i, j| i <= j }.to_a
  # # => [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]
  # 
  # # 隣り合う偶数同士、奇数同士の部分配列ごとに分ける。
  # # (Enumerable#chunk を使って実現する事も可能)
  # a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
  # p a.chunk_while {|i, j| i.even? == j.even? }.to_a
  # # => [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]
  # //}
  # 
  # [[m:Enumerable#slice_when]] はブロックの戻り値が真ではなく偽の時に要素
  # を分ける事を除いて同じ処理を行います。
  # 
  # @see [[m:Enumerable#slice_when]], [[m:Enumerable#chunk]]
  def chunk_while; end

  # --- collect  -> Enumerator
  # --- map      -> Enumerator
  # --- collect {|item| ... } -> [object]
  # --- map {|item| ... }     -> [object]
  # 
  # 各要素に対してブロックを評価した結果を全て含む配列を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # # すべて 3 倍にした配列を返す
  # p (1..3).map {|n| n * 3 }  # => [3, 6, 9]
  # p (1..3).collect { "cat" } # => ["cat", "cat", "cat"]
  # //}
  # 
  # @see [[m:Hash#to_h]], [[m:Array#collect]], [[m:Array#map]]
  def collect; end

  # --- flat_map       -> Enumerator
  # --- collect_concat -> Enumerator
  # --- flat_map       {| obj | block }  -> Array
  # --- collect_concat {| obj | block }  -> Array
  # 各要素をブロックに渡し、その返り値を連結した配列を返します。
  # 
  # ブロックの返り値は基本的に配列を返すべきです。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # [[1,2], [3,4]].flat_map{|i| i.map{|j| j*2}} # => [2,4,6,8]
  # //}
  def collect_concat; end

  # --- count                   -> Integer
  # --- count(item)             -> Integer
  # --- count {|obj| ... }  -> Integer
  # 
  # レシーバの要素数を返します。
  # 
  # 引数を指定しない場合は、レシーバの要素数を返します。
  # このとき、要素数を一つずつカウントします。
  # 
  # 引数を一つ指定した場合は、レシーバの要素のうち引数に一致するものの
  # 個数をカウントして返します(一致は == で判定します)。
  # 
  # ブロックを指定した場合は、ブロックを評価して真になった要素の個数を
  # カウントして返します。
  # 
  # @param item カウント対象となる値。
  # 
  # //emlist[例][ruby]{
  # enum = [1, 2, 4, 2].each
  # enum.count                  # => 4
  # enum.count(2)               # => 2
  # enum.count{|x|x%2==0}       # => 3
  # //}
  # 
  # @see [[m:Array#count]]
  def count; end

  # --- cycle(n=nil)       -> Enumerator
  # --- cycle(n=nil) {|obj| ... } -> object | nil
  # Enumerable オブジェクトの各要素を n 回 or 無限回(n=nil)繰り返し
  # ブロックを呼びだします。
  # 
  # n に 0 もしくは負の値を渡した場合は何もしません。
  # 繰り返しが最後まで終了した場合(つまりbreakなどで中断しなかった場合)
  # は nil を返します。
  # このメソッドは内部の配列に各要素を保存しておくため、
  # 一度 Enumerable の終端に到達した後に自分自身を変更しても
  # このメソッドの動作に影響を与えません。
  # 
  # //emlist[例][ruby]{
  # a = ["a", "b", "c"]
  # a.cycle {|x| puts x }  # print, a, b, c, a, b, c,.. forever.
  # a.cycle(2) {|x| puts x }  # print, a, b, c, a, b, c.
  # //}
  # 
  # ブロックを省略した場合は、n 回 or 無限回 enum の各要素を
  # 繰り返す [[c:Enumerator]] を返します。
  # 
  # @return ブロックを指定しなかった場合は、[[c:Enumerator]] を返します。
  #         レシーバが空の場合は nil を返します。
  def cycle; end

  # --- find(ifnone = nil)   -> Enumerator
  # --- detect(ifnone = nil) -> Enumerator
  # --- find(ifnone = nil) {|item| ... }   -> object
  # --- detect(ifnone = nil) {|item| ... } -> object
  # 
  # 要素に対してブロックを評価した値が真になった最初の要素を返します。
  # 
  # 真になる要素が見つからず、ifnone も指定されていないときは nil を返します。
  # 真になる要素が見つからず、ifnone が指定されているときは ifnone を call した結果を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param ifnone  call メソッドを持つオブジェクト (例えば [[c:Proc]]) を指定します。
  # 
  # //emlist[例][ruby]{
  # # 最初の 3 の倍数を探す
  # p [1, 2, 3, 4, 5].find {|i| i % 3 == 0 }   # => 3
  # p [2, 2, 2, 2, 2].find {|i| i % 3 == 0 }   # => nil
  # 
  # # ifnone の使用例
  # ifnone = proc { raise ArgumentError, "item not found" }
  # p [1, 2, 3, 4, 5].find(ifnone) {|i| i % 7 == 0 }
  #     # ArgumentError: item not found
  # //}
  def detect; end

  # --- drop(n)               -> Array
  # 
  # Enumerable オブジェクトの先頭の n 要素を捨てて、
  # 残りの要素を配列として返します。
  # 
  # @param n 捨てる要素数。
  # 
  # //emlist[例][ruby]{
  # e = [1, 2, 3, 4, 5, 0].each
  # e.drop(3)             # => [4, 5, 0]
  # //}
  # 
  # @see [[m:Array#drop]]
  def drop; end

  # --- drop_while                    -> Enumerator
  # --- drop_while {|element| ... }   -> Array
  # 
  # ブロックを評価して最初に偽となった要素の手前の要素まで捨て、
  # 残りの要素を配列として返します。
  # 
  # ブロックを指定しなかった場合は、[[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5, 0]
  # a.drop_while {|i| i < 3 }   # => [3, 4, 5, 0]
  # //}
  def drop_while; end

  # --- each_cons(n)               -> Enumerator
  # --- each_cons(n) {|list| ... } -> nil
  # 
  # 要素を重複ありで n 要素ずつに区切り、
  # ブロックに渡して繰り返します。
  # 
  # 
  # ブロックを省略した場合は重複ありで
  # n 要素ずつ繰り返す [[c:Enumerator]] を返します。
  # 
  # @param n ブロックに渡す要素の数です。正の整数を与えます。
  #          要素数より大きな数を与えると、ブロックは一度も実行されません。
  # 
  # //emlist[例][ruby]{
  # (1..10).each_cons(3){|v| p v }
  # # => [1, 2, 3]
  # #    [2, 3, 4]
  # #    [3, 4, 5]
  # #    [4, 5, 6]
  # #    [5, 6, 7]
  # #    [6, 7, 8]
  # #    [7, 8, 9]
  # #    [8, 9, 10]
  # //}
  # 
  # @see [[m:Enumerable#each_slice]]
  def each_cons; end

  # --- each_entry -> Enumerator
  # --- each_entry {|obj| block} -> self
  # 
  # ブロックを各要素に一度ずつ適用します。
  # 
  # 一要素として複数の値が渡された場合はブロックには配列として渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   include Enumerable
  #   def each
  #     yield 1
  #     yield 1,2
  #   end
  # end
  # Foo.new.each_entry{|o| print o, " -- "}
  # # => 1 -- [1, 2] --
  # //}
  # 
  # ブロックを省略した場合は [[c:Enumerator]] が返されます。
  # 
  # @see [[m:Enumerable#slice_before]]
  def each_entry; end

  # --- each_slice(n)               -> Enumerator
  # --- each_slice(n) {|list| ... } -> nil
  # 
  # n 要素ずつブロックに渡して繰り返します。
  # 
  # 要素数が n で割り切れないときは、最後の回だけ要素数が減ります。
  # 
  # 
  # ブロックを省略した場合は
  # n 要素ずつ繰り返す [[c:Enumerator]] を返します。
  # 
  # @param n   区切る要素数を示す整数です。
  # 
  # //emlist[例][ruby]{
  # (1..10).each_slice(3) {|a| p a}
  #     # => [1, 2, 3]
  #     #    [4, 5, 6]
  #     #    [7, 8, 9]
  #     #    [10]
  # //}
  # 
  # @see [[m:Enumerable#each_cons]]
  def each_slice; end

  # --- each_with_index(*args)                      -> Enumerator
  # --- each_with_index(*args) {|item, index| ... } -> self
  # 
  # 要素とそのインデックスをブロックに渡して繰り返します。
  # 
  # ブロックを省略した場合は、
  # 要素とそのインデックスを繰り返すような
  # [[c:Enumerator]] を返します。
  # 
  # [[m:Enumerator#with_index]] は offset 引数を受け取りますが、
  # each_with_index は受け取りません (引数はイテレータメソッドにそのまま渡されます)。
  # 
  # @param args イテレータメソッド (each など) にそのまま渡されます。
  # 
  # //emlist[例][ruby]{
  # [5, 10, 15].each_with_index do |n, idx|
  #   p [n, idx]
  # end
  # # => [5, 0]
  # #    [10, 1]
  # #    [15, 2]
  # //}
  # 
  # //emlist[引数ありの例][ruby]{
  # require 'stringio'
  # StringIO.new("foo|bar|baz").each_with_index("|") do |s, i|
  #   p [s, i]
  # end
  # # => ["foo|", 0]
  # #    ["bar|", 1]
  # #    ["baz", 2]
  # //}
  # 
  # @see [[m:Enumerator#with_index]]
  def each_with_index; end

  # --- each_with_object(obj) -> Enumerator
  # --- each_with_object(obj) {|(*args), memo_obj| ... } -> object
  # 
  # 与えられた任意のオブジェクトと要素をブロックに渡し繰り返し、最初に与えられたオブジェクトを返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param obj 任意のオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # evens = (1..10).each_with_object([]) {|i, a| a << i*2 }
  # # => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
  # //}
  # 
  # @see [[m:Enumerator#with_object]]
  def each_with_object; end

  # --- to_a(*args)    -> [object]
  # --- entries(*args) -> [object]
  # 
  # 全ての要素を含む配列を返します。
  # 
  # @param args each の呼び出し時に引数として渡されます。
  # 
  # //emlist[例][ruby]{
  # (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
  # { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
  # 
  # require 'prime'
  # Prime.entries 10                  #=> [2, 3, 5, 7]
  # //}
  def entries; end

  # --- find_all  -> Enumerator
  # --- select    -> Enumerator
  # --- filter    -> Enumerator
  # --- find_all {|item| ... } -> [object]
  # --- select {|item| ... }   -> [object]
  # --- filter {|item| ... }   -> [object]
  # 
  # 各要素に対してブロックを評価した値が真であった要素を全て含む配列を
  # 返します。真になる要素がひとつもなかった場合は空の配列を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # (1..10).find_all                        # => #<Enumerator: 1..10:find_all>
  # (1..10).find_all { |i| i % 3 == 0 }     # => [3, 6, 9]
  # 
  # [1,2,3,4,5].select                      # => #<Enumerator: [1, 2, 3, 4, 5]:select>
  # [1,2,3,4,5].select { |num| num.even? }  # => [2, 4]
  # //}
  # 
  # @see [[m:Enumerable#reject]]
  # @see [[m:Enumerable#grep]]
  def filter; end

  # --- find_index(val)               -> Integer | nil
  # --- find_index {|obj| ... }       -> Integer | nil
  # --- find_index                    -> Enumerator
  # 
  # 条件に一致する最初の要素の位置を返します。
  # 
  # @param val 位置を知りたいオブジェクトを指定します。
  # 
  # 指定された val と == で等しい最初の要素の位置を返します。
  # 等しい要素がひとつもなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # (1..10).find_index(11)  #=> nil
  # (1..10).find_index(2)   #=> 1
  # //}
  # 
  # ブロックが与えられた場合には、各要素を引数として先頭から順にブロックを実行し、
  # ブロックが真を返した最初の要素の位置を返します。
  # 一つも真にならなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # (1..10).find_index  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  # (1..100).find_index {|i| i % 5 == 0 and i % 7 == 0 }   #=> 34
  # //}
  # 
  # 引数、ブロックのどちらも与えられなかった場合は、
  # [[c:Enumerator]] のインスタンスを返します。
  def find_index; end

  # --- first      -> object | nil
  # --- first(n)   -> Array
  # 
  # Enumerable オブジェクトの最初の要素、もしくは最初の n 要素を返します。
  # 
  # Enumerable オブジェクトが空の場合、引数を指定しない形式では nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # e = "abcd".each_byte
  # e.first #=> 97
  # e.first(2) #=> [97,98]
  # e = "".each_byte
  # e.first #=> nil
  # e.first(2) #=> []
  # //}
  def first; end

  # --- grep(pattern)                -> [object]
  # --- grep(pattern) {|item| ... }  -> [object]
  # 
  # pattern === item が成立する要素を全て含んだ配列を返します。
  # 
  # ブロックとともに呼び出された時には条件の成立した要素に対して
  # それぞれブロックを評価し、その結果の配列を返します。
  # マッチする要素がひとつもなかった場合は空の配列を返します。
  # 
  # @param pattern 「===」メソッドを持つオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # ['aa', 'bb', 'cc', 'dd', 'ee'].grep(/[bc]/)  # => ["bb", "cc"]
  # 
  #   Array.instance_methods.grep(/gr/) # => [:grep, :group_by]
  # //}
  # 
  # @see [[m:Enumerable#select]]
  # @see [[m:Enumerable#grep_v]]
  def grep; end

  # --- grep_v(pattern)                -> [object]
  # --- grep_v(pattern) { |item| ... } -> [object]
  # 
  # [[m:Enumerable#grep]] のマッチの条件を逆にして、pattern === item が成立
  # しない要素を全て含んだ配列を返します。
  # 
  # @param pattern 「===」メソッドを持つオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # (1..10).grep_v 2..5   # => [1, 6, 7, 8, 9, 10]
  # res =(1..10).grep_v(2..5) { |v| v * 2 }
  # res                   # => [2, 12, 14, 16, 18, 20]
  # //}
  # 
  # @see [[m:Enumerable#grep]]
  # @see [[m:Enumerable#reject]]
  def grep_v; end

  # --- group_by               -> Enumerator
  # --- group_by {|obj| ... }  -> Hash
  # 
  # ブロックを評価した結果をキー、対応する要素の配列を値とするハッシュを返します。
  # 
  # 
  # //emlist[例][ruby]{
  # (1..6).group_by {|i| i%3}   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}
  # //}
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  def group_by; end

  # --- member?(val)  -> bool
  # --- include?(val) -> bool
  # 
  # val と == の関係にある要素を含むとき真を返します。
  # 
  # @param val   任意のオブジェクト
  # 
  # //emlist[例][ruby]{
  # [2, 4, 6].include? 2 #=> true
  # [2, 4, 6].include? 1 #=> false
  # [2, 4, 6].member? 2  #=> true
  # [2, 4, 6].member? 1  #=> false
  # //}
  def include?; end

  # --- inject(init = self.first) {|result, item| ... } -> object
  # --- inject(sym)                                     -> object
  # --- inject(init, sym)                               -> object
  # --- reduce(init = self.first) {|result, item| ... } -> object
  # --- reduce(sym)                                     -> object
  # --- reduce(init, sym)                               -> object
  # 
  # リストのたたみこみ演算を行います。
  # 
  # 最初に初期値 init と self の最初の要素を引数にブロックを実行します。
  # 2 回目以降のループでは、前のブロックの実行結果と
  # self の次の要素を引数に順次ブロックを実行します。
  # そうして最後の要素まで繰り返し、最後のブロックの実行結果を返します。
  # 
  # 要素が存在しない場合は init を返します。
  # 
  # 初期値 init を省略した場合は、
  # 最初に先頭の要素と 2 番目の要素をブロックに渡します。
  # また要素が 1 つしかなければブロックを実行せずに最初の要素を返します。
  # 要素がなければブロックを実行せずに nil を返します。
  # 
  # @param init  最初の result の値です。任意のオブジェクトが渡せます。
  # @param sym   ブロックの代わりに使われるメソッド名を表す [[c:Symbol]] オブジェクトを指定します。
  #              実行結果に対して sym という名前のメソッドが呼ばれます。
  # 
  # //emlist[例][ruby]{
  # # 合計を計算する。
  # p [2, 3, 4, 5].inject {|result, item| result + item }        #=> 14
  # 
  # # 自乗和を計算する。初期値をセットする必要がある。
  # p [2, 3, 4, 5].inject(0) {|result, item| result + item**2 }  #=> 54
  # //}
  # 
  # この式は以下のように書いても同じ結果が得られます。
  # 
  # //emlist[例][ruby]{
  # result = 0
  # [1, 2, 3, 4, 5].each {|v| result += v }
  # p result   # => 15
  # 
  # p [1, 2, 3, 4, 5].inject(:+)                    #=> 15
  # p ["b", "c", "d"].inject("abbccddde", :squeeze) #=> "abcde"
  # //}
  def inject; end

  # --- lazy -> Enumerator::Lazy
  # 
  # 自身を lazy な Enumerator に変換したものを返します。
  # 
  # この Enumerator は、以下のメソッドが遅延評価を行う (つまり、配列ではな
  # くEnumeratorを返す) ように再定義されています。
  # 
  #  * map/collect
  #  * flat_map/collect_concat
  #  * select/find_all
  #  * reject
  #  * grep
  #  * take, take_while
  #  * drop, drop_while
  #  * zip (※一貫性のため、ブロックを渡さないケースのみlazy)
  #  * cycle (※一貫性のため、ブロックを渡さないケースのみlazy)
  # 
  # 以下はピタゴラス数 (a**2 + b**2 = c**2 を満たす自然数 a, b, c の組) を
  # 列挙するプログラムです。
  # 
  # //emlist[例][ruby]{
  # def pythagorean_triples
  #   (1..Float::INFINITY).lazy.flat_map {|z|
  #     (1..z).flat_map {|x|
  #       (x..z).select {|y|
  #         x**2 + y**2 == z**2
  #       }.map {|y|
  #         [x, y, z]
  #       }
  #     }
  #   }
  # end
  # # 最初の10個のピタゴラス数を表示する
  # p pythagorean_triples.take(10).force # takeはlazyなので、forceが必要です
  # p pythagorean_triples.first(10)      # firstはeagerです
  # # 100より小さいピタゴラス数を表示する
  # p pythagorean_triples.take_while { |*, z| z < 100 }.force
  # //}
  # 
  # @see [[c:Enumerator::Lazy]]
  def lazy; end

  # --- max    -> object | nil
  # --- max(n) -> Array
  # 
  # 最大の要素、もしくは最大の n 要素が入った降順の配列を返します。
  # 全要素が互いに <=> メソッドで比較できることを仮定しています。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.max                        # => "horse"
  # a.max(2)                     # => ["horse", "dog"]
  # //}
  # 
  # --- max {|a, b| ... }    -> object | nil
  # --- max(n) {|a, b| ... } -> Array
  # 
  # ブロックの評価結果で各要素の大小判定を行い、最大の要素、もしくは最大の
  # n 要素が入った降順の配列を返します。
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # ブロックの値は、a > b のとき正、
  # a == b のとき 0、a < b のとき負の整数を、期待しています。
  # 
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # @param n 取得する要素数。
  # 
  # @raise TypeError    ブロックが整数以外を返したときに発生します。
  # 
  # //emlist[例][ruby]{
  # class Person
  #   attr_reader :name, :age
  # 
  #   def initialize(name, age)
  #     @name = name
  #     @age = age
  #   end
  # end
  # 
  # people = [
  #   Person.new("sato", 55),
  #   Person.new("sato", 33),
  #   Person.new("sato", 11),
  #   Person.new("suzuki", 55),
  #   Person.new("suzuki", 33),
  #   Person.new("suzuki", 11),
  #   Person.new("tanaka", 55),
  #   Person.new("tanaka", 33),
  #   Person.new("tanaka", 11)
  # ]
  # 
  # # 年齢が最大、名前が最小
  # people.max { |x, y| (x.age <=> y.age).nonzero? || y.name <=> x.name }
  # # => #<Person:0x007fc54b0240a0 @name="sato", @age=55>
  # people.max(2) { |x, y| (x.age <=> y.age).nonzero? || y.name <=> x.name }
  # # => [#<Person:0x007fc54b0240a0 @name="sato", @age=55>, #<Person:0x007fc54c033ea0 @name="suzuki", @age=55>]
  # //}
  def max; end

  # --- max_by                  -> Enumerator
  # --- max_by(n)               -> Enumerator
  # --- max_by {|item| ... }    -> object | nil
  # --- max_by(n) {|item| ... } -> Array
  # 
  # 各要素を順番にブロックに渡して実行し、
  # その評価結果を <=> で比較して、
  # 最大であった値に対応する元の要素、もしくは最大の n 要素が降順で入った配列を返します。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # [[m:Enumerable#max]] と [[m:Enumerable#max_by]] の
  # 違いは [[m:Enumerable#sort]] と [[m:Enumerable#sort_by]] の違いと同じです。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.max_by                    # => #<Enumerator: ["albatross", "dog", "horse"]:max_by>
  # a.max_by { |x| x.length }   # => "albatross"
  # //}
  # 
  # //emlist[例][ruby]{
  # a = %w[albatross dog horse]
  # a.max_by(2)                 # => #<Enumerator: ["albatross", "dog", "horse"]:max_by(2)>
  # a.max_by(2) {|x| x.length } # => ["albatross", "horse"]
  # //}
  # 
  # //emlist[例: enum.max_by（n）は、重み付きランダムサンプリングを実装するために使用できます。次の実装例は、Enumerable#wsampleを使用します。][ruby]{
  # module Enumerable
  #   # weighted random sampling.
  #   #
  #   # Pavlos S. Efraimidis, Paul G. Spirakis
  #   # Weighted random sampling with a reservoir
  #   # Information Processing Letters
  #   # Volume 97, Issue 5 (16 March 2006)
  #   def wsample(n)
  #     self.max_by(n) {|v| rand ** (1.0/yield(v)) }
  #   end
  # end
  # e = (-20..20).to_a*10000
  # a = e.wsample(20000) {|x|
  #   Math.exp(-(x/5.0)**2) # normal distribution
  # }
  # # a is 20000 samples from e.
  # p a.length #=> 20000
  # h = a.group_by {|x| x }
  # -10.upto(10) {|x| puts "*" * (h[x].length/30.0).to_i if h[x] }
  # #=> *
  # #   ***
  # #   ******
  # #   ***********
  # #   ******************
  # #   *****************************
  # #   *****************************************
  # #   ****************************************************
  # #   ***************************************************************
  # #   ********************************************************************
  # #   ***********************************************************************
  # #   ***********************************************************************
  # #   **************************************************************
  # #   ****************************************************
  # #   ***************************************
  # #   ***************************
  # #   ******************
  # #   ***********
  # #   *******
  # #   ***
  # #   *
  # //}
  # 
  # @see [[m:Enumerable#sort_by]]
  def max_by; end

  # --- min    -> object | nil
  # --- min(n) -> Array
  # 
  # 最小の要素、もしくは最小の n 要素が昇順で入った配列を返します。
  # 全要素が互いに <=> メソッドで比較できることを仮定しています。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.min                                # => "albatross"
  # a.min(2)                             # => ["albatross", "dog"]
  # //}
  # 
  # --- min {|a, b| ... }    -> object | nil
  # --- min(n) {|a, b| ... } -> Array
  # 
  # ブロックの評価結果で各要素の大小判定を行い、最小の要素、もしくは最小の
  # n 要素が昇順で入った配列を返します。
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # ブロックの値は、a > b のとき正、a == b のとき 0、
  # a < b のとき負の整数を、期待しています。
  # 
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # @param n 取得する要素数。
  # 
  # 
  # //emlist[例][ruby]{
  # class Person
  #   attr_reader :name, :age
  # 
  #   def initialize(name, age)
  #     @name = name
  #     @age = age
  #   end
  # end
  # 
  # people = [
  #   Person.new("sato", 55),
  #   Person.new("sato", 33),
  #   Person.new("sato", 11),
  #   Person.new("suzuki", 55),
  #   Person.new("suzuki", 33),
  #   Person.new("suzuki", 11),
  #   Person.new("tanaka", 55),
  #   Person.new("tanaka", 33),
  #   Person.new("tanaka", 11)
  # ]
  # 
  # # 年齢が最小、名前が最大
  # people.min { |x, y| (x.age <=> y.age).nonzero? || y.name <=> x.name }
  # # => #<Person:0x007fd6f0824190 @name="tanaka", @age=11>
  # 
  # people.min(2) { |x, y| (x.age <=> y.age).nonzero? || y.name <=> x.name }
  # # => [#<Person:0x007fb5899ef4a8 @name="tanaka", @age=11>, #<Person:0x007fb5899ef728 @name="suzuki", @age=11>]
  # //}
  # 
  # @raise TypeError    ブロックが整数以外を返したときに発生します。
  def min; end

  # --- min_by                  -> Enumerator
  # --- min_by(n)               -> Enumerator
  # --- min_by {|item| ... }    -> object | nil
  # --- min_by(n) {|item| ... } -> Array
  # 
  # 各要素を順番にブロックに渡して評価し、
  # その評価結果を <=> で比較して、
  # 最小であった値に対応する元の要素、もしくは最小の n 要素が昇順で入った配列を返します。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # [[m:Enumerable#min]] と [[m:Enumerable#min_by]] の
  # 違いは [[m:Enumerable#sort]] と [[m:Enumerable#sort_by]] の違いと同じです。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.min_by                    # => #<Enumerator: ["albatross", "dog", "horse"]:min_by>
  # a.min_by { |x| x.length }   # => "dog"
  # a.min_by(2)                 # => #<Enumerator: ["albatross", "dog", "horse"]:min_by(2)>
  # a.min_by(2) {|x| x.length } # => ["dog", "horse"]
  # //}
  # 
  # @see [[m:Enumerable#sort_by]]
  def min_by; end

  # --- minmax                 -> [object, object]
  # --- minmax{|a, b| ... }    -> [object, object]
  # 
  # Enumerable オブジェクトの各要素のうち最小の要素と最大の要素を
  # 要素とするサイズ 2 の配列を返します。
  # 
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # 一つ目の形式は、Enumerable オブジェクトのすべての要素が Comparable を
  # 実装していることを仮定しています。二つ目の形式では、要素同士の比較を
  # ブロックを用いて行います。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.minmax                                 #=> ["albatross", "horse"]
  # a.minmax{|a,b| a.length <=> b.length }   #=> ["dog", "albatross"]
  # [].minmax # => [nil, nil]
  # //}
  # 
  # @see [[m:Enumerable#sort]]
  def minmax; end

  # --- minmax_by                -> Enumerator
  # --- minmax_by {|obj| ... }   -> [object, object]
  # 
  # Enumerable オブジェクトの各要素をブロックに渡して評価し、その結果を <=> で比較して
  # 最小の要素と最大の要素を要素とするサイズ 2 の配列を返します。
  # 
  # 該当する要素が複数存在する場合、どの要素を返すかは不定です。
  # 
  # [[m:Enumerable#minmax]] と [[m:Enumerable#minmax_by]] の
  # 違いは sort と sort_by の違いと同じです。
  # 詳細は [[m:Enumerable#sort_by]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # a = %w(albatross dog horse)
  # a.minmax_by {|x| x.length }   #=> ["dog", "albatross"]
  # 
  # [].minmax_by{} # => [nil, nil]
  # //}
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @see [[m:Enumerable#sort_by]]
  def minmax_by; end

  # --- none?               -> bool
  # --- none?{|obj| ... }   -> bool
  # --- none?(pattern)      -> bool
  # ブロックを指定しない場合は、 Enumerable オブジェクトのすべての
  # 要素が偽であれば真を返します。そうでなければ偽を返します。
  # 
  # ブロックを指定した場合は、Enumerable オブジェクトのすべての要素を
  # ブロックで評価した結果が、すべて偽であれば真を返します。
  # そうでなければ偽を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # require 'set'
  # Set['ant', 'bear', 'cat'].none? {|word| word.length == 5}  # => true
  # Set['ant', 'bear', 'cat'].none? {|word| word.length >= 4}  # => false
  # Set['ant', 'bear', 'cat'].none?(/d/)                       # => true
  # Set[].none?                                                # => true
  # Set[nil].none?                                             # => true
  # Set[nil,false].none?                                       # => true
  # Set[nil, false, true].none?                                # => false
  # //}
  # 
  # @see [[m:Array#none?]]
  def none?; end

  # --- one?                -> bool
  # --- one?{|obj| ... }    -> bool
  # --- one?(pattern)       -> bool
  # 
  # ブロックを指定しない場合は、 Enumerable オブジェクトの要素のうち
  # ちょうど一つだけが真であれば、真を返します。
  # そうでなければ偽を返します。
  # 
  # ブロックを指定した場合は、Enumerable オブジェクトの要素を
  # ブロックで評価した結果、一つの要素だけが真であれば真を返します。
  # そうでなければ偽を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # require 'set'
  # Set['ant', 'bear', 'cat'].one? {|word| word.length == 4}  # => true
  # Set['ant', 'bear', 'cat'].one? {|word| word.length > 4}   # => false
  # Set['ant', 'bear', 'cat'].one?(/t/)                       # => false
  # Set[nil, true, 99].one?                                   # => false
  # Set[nil, true, false].one?                                # => true
  # Set[nil, true, 99].one?(Integer)                          # => true
  # Set[].one?                                                # => false
  # //}
  # 
  # @see [[m:Array#one?]]
  def one?; end

  # --- partition               -> Enumerator
  # --- partition {|item| ... } -> [[object], [object]]
  # 
  # 各要素を、ブロックの条件を満たす要素と満たさない要素に分割します。
  # 各要素に対してブロックを評価して、その値が真であった要素の配列と、
  # 偽であった要素の配列の 2 つを配列に入れて返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0].partition {|i| i % 3 == 0 }
  #  #=> [[9, 6, 3, 0], [10, 8, 7, 5, 4, 2, 1]]
  # //}
  def partition; end

  # --- reject               -> Enumerator
  # --- reject {|item| ... } -> [object]
  # 
  # 各要素に対してブロックを評価し、
  # その値が偽であった要素を集めた新しい配列を返します。
  # 条件を反転させた select です。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # # 偶数を除外する (奇数を集める)
  # (1..6).reject {|i| i % 2 == 0 } # => [1, 3, 5]
  # //}
  # 
  # @see [[m:Enumerable#select]], [[m:Array#reject]]
  # @see [[m:Enumerable#grep_v]]
  def reject; end

  # --- reverse_each -> Enumerator
  # --- reverse_each {|element| ... } -> self
  # 
  # 逆順に各要素に対してブロックを評価します。
  # 
  # 内部で各要素を保持した配列を作ります。
  # 
  # ブロックを省略した場合は、各要素を逆順に辿る
  # [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # (1..3).reverse_each # => #<Enumerator: 1..3:reverse_each>
  # (1..3).reverse_each { |v| p v }
  # # => 3
  # #    2
  # #    1
  # //}
  def reverse_each; end

  # --- slice_after(pattern) -> Enumerator
  # --- slice_after {|elt| bool } -> Enumerator
  # 
  # パターンがマッチした要素、もしくはブロックが真を返した要素を末尾の要素
  # としてチャンク化(グループ化)したものを繰り返す [[c:Enumerator]] を 返し
  # ます。
  # 
  # パターンを渡した場合は各要素に対し === が呼び出され、 それが真になった
  # ところをチャンクの末尾と見なします。 ブロックを渡した場合は、各要素に対
  # しブロックを適用し 返り値が真であった要素をチャンクの末尾と見なします。
  # 
  # パターンもブロックも最初から最後の要素まで呼び出されます。
  # 
  # 各チャンクは配列として表現されます。そのため、以下のような呼び出しを行
  # う事もできます。
  # 
  # //emlist[例][ruby]{
  # enum.slice_after(pattern).each { |ary|
  #   # ...
  # }
  # enum.slice_after { |elt| bool }.each { |ary|
  #   # ...
  # }
  # //}
  # 
  # //emlist[例][ruby]{
  # # 偶数要素をチャンクの末尾と見なす
  # [0,2,4,1,2,4,5,3,1,4,2].slice_after(&:even?).to_a
  # # => [[0], [2], [4], [1, 2], [4], [5, 3, 1, 4], [2]]
  # 
  # # 奇数要素をチャンクの末尾と見なす
  # [0,2,4,1,2,4,5,3,1,4,2].slice_after(&:odd?).to_a
  # # => [[0, 2, 4, 1], [2, 4, 5], [3], [1], [4, 2]]
  # 
  # # バックスラッシュで終わる行を継続
  # lines = ["foo\n", "bar\\\n", "baz\n", "\n", "qux\n"]
  # e = lines.slice_after(/(?<!\\)\n\z/)
  # p e.to_a
  # #=> [["foo\n"], ["bar\\\n", "baz\n"], ["\n"], ["qux\n"]]
  # p e.map {|ll| ll[0...-1].map {|l| l.sub(/\\\n\z/, "") }.join + ll.last }
  # #=>["foo\n", "barbaz\n", "\n", "qux\n"]
  # //}
  # 
  # [[m:Enumerable#map]] のようなメソッドを使うこともできます。
  # 
  # @see [[m:Enumerable#chunk]], [[m:Enumerable#slice_before]]
  def slice_after; end

  # --- slice_before(pattern) -> Enumerator
  # --- slice_before {|elt| bool } -> Enumerator
  # 
  # パターンがマッチした要素、もしくはブロックが真を返した要素から
  # 次にマッチする手前までを
  # チャンク化(グループ化)したものを繰り返す [[c:Enumerator]] を
  # 返します。
  # 
  # パターンを渡した場合は各要素に対し === が呼び出され、
  # それが真になったところをチャンクの先頭と見なします。
  # ブロックを渡した場合は、各要素に対しブロックを適用し
  # 返り値が真であった要素をチャンクの先頭と見なします。
  # 
  # より厳密にいうと、「先頭要素」の手前で分割していきます。
  # 最初の要素の評価は無視されます。
  # 
  # 各チャンクは配列として表現されます。
  # 
  # [[m:Enumerable#to_a]] や [[m:Enumerable#map]] のようなメソッドを使うこ
  # ともできます。
  # 
  # //emlist[例][ruby]{
  # # 偶数要素をチャンクの先頭と見なす
  # [0,2,4,1,2,4,5,3,1,4,2].slice_before(&:even?).to_a
  # # => [[0], [2], [4, 1], [2], [4, 5, 3, 1], [4], [2]]
  # 
  # # 奇数要素をチャンクの先頭と見なす
  # [0,2,4,1,2,4,5,3,1,4,2].slice_before(&:odd?).to_a
  # # => [[0, 2, 4], [1, 2, 4], [5], [3], [1, 4, 2]]
  # 
  # # ChangeLog のエントリーを順に取る
  # open("ChangeLog") {|f|
  #   f.slice_before(/\A\S/).each {|e| pp e}
  # }
  # 
  # # 上と同じだが、パターンでなくブロックを使う
  # open("ChangeLog") {|f|
  #   f.slice_before {|line| /\A\S/ === line }.each {|e| pp e}
  # }
  # 
  # # "svn proplist -R" の結果を分割する
  # # これは一要素が複数行にまたがっている
  # 
  # IO.popen([{"LC_ALL"=>"C"}, "svn", "proplist", "-R"]) {|f|
  #   f.lines.slice_before(/\AProp/).each {|lines| p lines }
  # }
  # #=> ["Properties on '.':\n", "  svn:ignore\n", "  svk:merge\n"]
  # #   ["Properties on 'goruby.c':\n", "  svn:eol-style\n"]
  # #   ["Properties on 'complex.c':\n", "  svn:mime-type\n", "  svn:eol-style\n"]
  # #   ["Properties on 'regparse.c':\n", "  svn:eol-style\n"]
  # #   ...
  # //}
  # 
  # 複数要素にわたる状態遷移が必要な場合は、ローカル変数でこれを実現する
  # ことができます。例えば、連続に増える数値が3つ以上ある場合、これを
  # まとめる処理をするためには以下のようにします
  # ([[m:Enumerable#chunk_while]] のより簡単な例も参照)。
  # 
  # //emlist[][ruby]{
  # a = [0,2,3,4,6,7,9]
  # prev = a[0]
  # p a.slice_before {|e|
  #   prev, prev2 = e, prev
  #   prev2 + 1 != e
  # }.map {|es|
  #   es.length <= 2 ? es.join(",") : "#{es.first}-#{es.last}"
  # }.join(",")
  # #=> "0,2-4,6,7,9"
  # //}
  # 
  # 
  # @see [[m:Enumerable#chunk]], [[m:Enumerable#slice_after]]
  def slice_before; end

  # --- slice_when {|elt_before, elt_after| bool } -> Enumerator
  # 
  # 要素を前から順にブロックで評価し、その結果によって要素をチャンクに分け
  # た(グループ化した)要素を持つ[[c:Enumerator]] を返します。
  # 
  # 隣り合う値をブロックパラメータ elt_before、elt_after に渡し、ブロックの
  # 評価値が真になる所でチャンクを区切ります。
  # 
  # ブロックは self の長さ - 1 回呼び出されます。
  # 
  # @return チャンクごとの配列をブロックパラメータに渡す [[c:Enumerator]]
  #         を返します。eachメソッドは以下のように呼び出します。
  # //emlist{
  #   enum.slice_when { |elt_before, elt_after| bool }.each { |ary| ... }
  # //}
  #         to_a や map などのその他の [[c:Enumerable]] モジュールのメソッ
  #         ドも有用です。
  # 
  # //emlist[例][ruby]{
  # # 1ずつ増加する部分配列ごとに分ける。
  # a = [1,2,4,9,10,11,12,15,16,19,20,21]
  # b = a.slice_when {|i, j| i+1 != j }
  # p b.to_a # => [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
  # c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
  # p c # => [[1, 2], [4], "9-12", [15, 16], "19-21"]
  # d = c.join(",")
  # p d # => "1,2,4,9-12,15,16,19-21"
  # 
  # # ソート済の配列を近い値(差が6以内)の部分配列ごとに分ける。
  # a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
  # p a.slice_when {|i, j| 6 < j - i }.to_a
  # # => [[3], [11, 14], [25, 28, 29, 29], [41], [55, 57]]
  # 
  # # 増加のみの部分配列ごとに分ける。
  # a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
  # p a.slice_when {|i, j| i > j }.to_a
  # # => [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]
  # 
  # # 隣り合う偶数同士、奇数同士の部分配列ごとに分ける。
  # # (Enumerable#chunk を使って実現する事も可能)
  # a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
  # p a.slice_when {|i, j| i.even? != j.even? }.to_a
  # # => [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]
  # 
  # # 段落(空行が後ろに続く非空行の文字列)ごとに分ける。
  # # (Enumerable#chunk で空行を無視して実現する事も可能)
  # lines = ["foo\n", "bar\n", "\n", "baz\n", "qux\n"]
  # p lines.slice_when {|l1, l2| /\A\s*\z/ =~ l1 && /\S/ =~ l2 }.to_a
  # # => [["foo\n", "bar\n", "\n"], ["baz\n", "qux\n"]]
  # //}
  # 
  # [[m:Enumerable#chunk_while]] はブロックの戻り値が偽ではなく真の時に要
  # 素を分ける事を除いて同じ処理を行います。
  # 
  # @see [[m:Enumerable#chunk_while]], [[m:Enumerable#chunk]]
  def slice_when; end

  # --- sort               -> [object]
  # --- sort {|a, b| ... } -> [object]
  # 
  # 全ての要素を昇順にソートした配列を生成して返します。
  # 
  # ブロックなしのときは <=> メソッドを要素に対して呼び、
  # その結果をもとにソートします。
  # 
  # <=> 以外でソートしたい場合は、ブロックを指定します。
  # この場合、ブロックの評価結果を元にソートします。
  # ブロックの値は、a > b のとき正、a == b のとき 0、
  # a < b のとき負の整数を、期待しています。
  # ブロックが整数以外を返したときは例外 [[c:TypeError]] が発生します。
  # 
  # Enumerable#sort は安定ではありません (unstable sort)。
  # 安定なソートが必要な場合は [[m:Enumerable#sort_by]] を使って工夫する必要があります。
  # 詳しくは [[m:Enumerable#sort_by]] の項目を参照してください。
  # 
  # ※ 比較結果が同じ要素は元の順序通りに並ぶソートを
  # 「安定なソート (stable sort)」と言います。
  # 
  # //emlist[例][ruby]{
  # %w(rhea kea flea).sort           # => ["flea", "kea", "rhea"]
  # (1..10).sort { |a, b| b <=> a }  # => [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  # //}
  # 
  # @see [[m:Enumerable#sort_by]]
  def sort; end

  # --- sort_by               -> Enumerator
  # --- sort_by {|item| ... } -> [object]
  # 
  # ブロックの評価結果を <=> メソッドで比較することで、self を昇
  # 順にソートします。ソートされた配列を新たに生成して返します。
  # 
  # つまり、以下とほぼ同じ動作をします。
  # 
  # //emlist[例][ruby]{
  # class Array
  #   def sort_by
  #     self.map {|i| [yield(i), i] }.
  #        sort {|a, b| a[0] <=> b[0] }.
  #        map {|i| i[1]}
  #   end
  # end
  # //}
  # 
  # [[m:Enumerable#sort]] と比較して sort_by が優れている点として、
  # 比較条件が複雑な場合の速度が挙げられます。
  # sort_by を使わない以下の例では比較を行う度に downcase が実行されます。
  # 従って downcase の実行速度が遅ければ sort の速度が致命的に低下します。
  # 
  # //emlist[][ruby]{
  # p ["BAR", "FOO", "bar", "foo"].sort {|a, b| a.downcase <=> b.downcase }
  # //}
  # 
  # 一方、次のように sort_by を使うと downcase の実行回数は要素数と同じです。
  # つまり、その部分の実行時間は O(n) のオーダーです。
  # 
  # //emlist[][ruby]{
  # p ["BAR", "FOO", "bar", "foo"].sort_by {|v| v.downcase }
  # //}
  # 
  # 以下の、実行回数の検証結果を参照してみてください。
  # 
  # //emlist[][ruby]{
  # class Integer
  #   def count
  #     $n += 1
  #     self
  #   end
  # end
  # 
  # ary = []
  # 1.upto(1000) {|v| ary << rand(v) }
  # 
  # $n = 0
  # ary.sort {|a,b| a.count <=> b.count }
  # p $n          # => 18200
  # 
  # $n = 0
  # ary.sort_by {|v| v.count }
  # p $n          # => 1000
  # //}
  # 
  # Enumerable#sort_by は安定ではありません (unstable sort)。
  # ただし、sort_by を以下のように使うと安定なソートを実装できます。
  # 
  # //emlist[][ruby]{
  # i = 0
  # ary.sort_by {|v| [v, i += 1] }
  # //}
  # 
  # ※ 比較結果が同じ要素は元の順序通りに並ぶソートを
  # 「安定なソート (stable sort)」と言います。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # 
  # @see [[m:Enumerable#sort]]
  def sort_by; end

  # --- sum(init=0)                    -> object
  # --- sum(init=0) {|e| expr }        -> object
  # 
  # 要素の合計を返します。
  # 
  # ブロックが与えられた場合、加算する前に各要素にブロックが適用されます。
  # 
  # selfが空の場合、initを返します。
  # 
  # //emlist[例][ruby]{
  # { 1 => 10, 2 => 20 }.sum {|k, v| k * v }  # => 50
  # (1..10).sum                               # => 55
  # (1..10).sum {|v| v * 2 }                  # => 110
  # ('a'..'z').sum                            # => TypeError
  # //}
  # 
  # init 引数を明示的に指名すると数値以外のオブジェクトにも使えます。
  # 
  # //emlist[例][ruby]{
  # { 1 => 10, 2 => 20 }.sum([])                   #=> [1, 10, 2, 20]
  # "a\nb\nc".each_line.lazy.map(&:chomp).sum("")  #=> "abc"
  # [[1], [[2]], [3]].sum([])          #=> [1, [2], 3]
  # //}
  # 
  # "+" メソッドが再定義されている場合、Enumerable#sum は再定義を無視することがあります(例えばInteger#+)。
  # 
  # @see [[m:Array#sum]]
  def sum; end

  # --- take(n)               -> Array
  # 
  # Enumerable オブジェクトの先頭から n 要素を配列として返します。
  # 
  # @param n 要素数を指定します。
  # 
  # //emlist[例][ruby]{
  # e = [1, 2, 3, 4, 5, 0].each
  # e.take(3)             # => [1, 2, 3]
  # //}
  # 
  # @see [[m:Array#take]]
  def take; end

  # --- take_while                    -> Enumerator
  # --- take_while {|element| ... }   -> Array
  # 
  # Enumerable オブジェクトの要素を順に偽になるまでブロックで評価します。
  # 最初に偽になった要素の手前の要素までを配列として返します。
  # 
  # //emlist[例][ruby]{
  # e = [1, 2, 3, 4, 5, 0].each
  # e.take_while {|i| i < 3 }   # => [1, 2]
  # //}
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @see [[m:Array#take_while]]
  def take_while; end

  # --- to_h(*args) -> Hash
  # --- to_h(*args) { ... } -> Hash
  # 
  # self を [key, value] のペアの配列として解析した結果を [[c:Hash]] にして
  # 返します。
  # 
  # @param args each の呼び出し時に引数として渡されます。
  # 
  # //emlist[例][ruby]{
  # %i[hello world].each_with_index.to_h # => {:hello => 0, :world => 1}
  # //}
  # 
  # ブロックを指定すると各要素でブロックを呼び出し、
  # その結果をペアとして使います。
  # 
  # //emlist[ブロック付きの例][ruby]{
  # (1..5).to_h {|x| [x, x ** 2]} # => {1=>1, 2=>4, 3=>9, 4=>16, 5=>25}
  # //}
  def to_h; end

  # --- to_set(klass = Set, *args) -> Set
  # --- to_set(klass = Set, *args) {|o| ... } -> Set
  # 
  # Enumerable オブジェクトの要素から、新しい集合オブジェクトを作ります。
  # 
  # 引数 klass を与えた場合、Set クラスの代わりに、指定した集合クラスの
  # インスタンスを作ります。
  # この引数を指定することで、SortedSet あるいはその他のユーザ定義の
  # 集合クラスのインスタンスを作ることができます
  # (ここでいう集合クラスとは、Setとメソッド/クラスメソッドで互換性のあるクラスです)。
  # 引数 args およびブロックは、集合オブジェクトを生成するための new
  # メソッドに渡されます。
  # 
  # 
  # @param klass 生成する集合クラスを指定します。
  # @param args 集合クラスのオブジェクト初期化メソッドに渡す引数を指定します。
  # @param block 集合クラスのオブジェクト初期化メソッドに渡すブロックを指定します。
  # @return 生成された集合オブジェクトを返します。
  # 
  # //emlist[][ruby]{
  # require 'set'
  # p [30, 10, 20].to_set
  # #=> #<Set: {30, 10, 20}>
  # p [30, 10, 20].to_set(SortedSet)
  # #=> #<SortedSet: {10, 20, 30}>
  # MySet = Class.new(Set)
  # p [30, 10, 20].to_set(MySet)
  # #=> #<MySet: {10, 20, 30}>
  # p [30, 10, 20].to_set {|num| num / 10}
  # #=> #<Set: {3, 1, 2}>
  # //}
  # 
  # @see [[m:Set.new]]
  def to_set; end

  # --- uniq                -> Array
  # --- uniq { |item| ... } -> Array
  # 
  # self から重複した値を取り除いた配列を返します。
  # 
  # ブロックが与えられた場合、ブロックが返した値が重複した要素を取り除いた
  # 配列を返します。
  # 
  # //emlist[例][ruby]{
  # olympics = {
  #   1896 => 'Athens',
  #   1900 => 'Paris',
  #   1904 => 'Chicago',
  #   1906 => 'Athens',
  #   1908 => 'Rome',
  # }
  # olympics.uniq{|k,v| v} # => [[1896, "Athens"], [1900, "Paris"], [1904, "Chicago"], [1908, "Rome"]]
  # 
  # (1..100).uniq{|x| (x**2) % 10 } # => [1, 2, 3, 4, 5, 10]
  # //}
  # 
  # @see [[m:Array#uniq]]
  def uniq; end

  # --- zip(*lists)  -> [[object]]
  # --- zip(*lists) {|v1, v2, ...| ...} -> nil
  # 
  # self と引数に渡した配列の各要素からなる配列の配列を生成して返します。
  # 生成される配列の要素数は self の要素数と同じです。
  # 
  # ブロック付きで呼び出した場合は、
  # self と引数に渡した配列の各要素を順番にブロックに渡します。
  # 
  # @param lists 配列を指定します。配列でない場合は to_ary メソッドにより配列に変換します。
  #              to_ary メソッドが無い場合は each を試します。
  # 
  # //emlist[例][ruby]{
  # p (1..3).zip([4,5,6], [7,8,9])
  # # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  # 
  # p (1..2).zip([:a,:b,:c], [:A,:B,:C,:D])
  # # => [[1, :a, :A], [2, :b, :B]]
  # 
  # p (1..5).zip([:a,:b,:c], [:A,:B,:C,:D])
  # # => [[1, :a, :A], [2, :b, :B],
  # #     [3, :c, :C], [4, nil, :D], [5, nil, nil]]
  # //}
  # 
  # //emlist[例][ruby]{
  # p [1,2,3].zip([4,5,6], [7,8,9]) {|ary|
  #   p ary
  # }
  # # => [1, 4, 7]
  # #    [2, 5, 8]
  # #    [3, 6, 9]
  # #    nil
  # //}
  def zip; end

end
