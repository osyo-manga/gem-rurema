class Array
  # --- &(other)    -> Array
  # 
  # 集合の積演算です。両方の配列に含まれる要素からなる新しい配列を返
  # します。重複する要素は取り除かれます。
  # 
  # 要素の重複判定は、[[m:Object#eql?]] により行われます。
  # 
  # 新しい配列における要素の順は self における要素の順と同じです。
  # 
  # @param other 配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # [1, 1, 2, 3] & [3, 1, 4] #=> [1, 3]
  # //}
  # 
  # @see [[m:Array#|]]
  def &; end

  # --- *(times)    -> Array
  # 
  # 配列の内容を times 回 繰り返した新しい配列を作成して返します。
  # 値はコピーされないことに注意してください。
  # 
  # @param times 繰り返したい回数を整数で指定します。
  #              整数以外のオブジェクトを指定した場合は to_int メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError 引数に負の数を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p [1, 2, 3] * 3  #=> [1, 2, 3, 1, 2, 3, 1, 2, 3]
  # //}
  # 
  # --- *(sep)    -> String
  # 
  # 指定された sep を間にはさんで連結した文字列を生成して返します。[[m:Array#join]](sep) と同じ動作をします。
  # 
  # @param sep 文字列を指定します。
  #            文字列以外のオブジェクトを指定した場合は to_str メソッドによ
  #            る暗黙の型変換を試みます。
  # 
  # //emlist[例][ruby]{
  # p [1,2,3] * ","
  # # => "1,2,3"
  # //}
  # 
  # @see [[m:Array#join]]
  def *; end

  # --- +(other)    -> Array
  # 
  # 自身と other の内容を繋げた配列を生成して返します。
  # 
  # @param other 自身と繋げたい配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2]
  # b = [8, 9]
  # p a + b     #=> [1, 2, 8, 9]
  # p a         #=> [1, 2]        (変化なし)
  # p b         #=> [8, 9]        (こちらも変化なし)
  # //}
  def +; end

  # --- -(other)    -> Array
  # 
  # 自身から other の要素を取り除いた配列を生成して返します。
  # 
  # 要素の同一性は [[m:Object#eql?]] により評価されます。
  # self 中で重複していて、other中に存在していなかった要素は、その重複が保持されます。
  # 
  # @param other 自身から取り除きたい要素の配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # [1, 2, 1, 3, 1, 4] - [4, 2]    # => [1, 1, 3, 1]
  # 
  # [1, 2, 1, 3, 1, 4] - [1, 4]    # => [2, 3]
  # //}
  # 
  # 
  # @see [[m:Array#difference]]
  def -; end

  # --- <<(obj)    -> self
  # 
  # 指定された obj を自身の末尾に破壊的に追加します。
  # 
  # //emlist[例][ruby]{
  # ary = [1]
  # ary << 2
  # p ary      # [1, 2]
  # //}
  # 
  # またこのメソッドは self を返すので、以下のように連続して
  # 書くことができます。
  # 
  # //emlist[例][ruby]{
  # ary = [1]
  # ary << 2 << 3 << 4
  # p ary   #=> [1, 2, 3, 4]
  # //}
  # 
  # @param obj 自身に加えたいオブジェクトを指定します。[[m:Array#push]] と違って引数は一つしか指定できません。
  # 
  # @see [[m:Array#push]]
  def <<; end

  # --- <=>(other)    -> -1 | 0 | 1 | nil
  # 
  # 自身と other の各要素をそれぞれ順に <=> で比較していき、結果が 0 でなかった場合に
  # その値を返します。各要素が等しく、配列の長さも等しい場合には 0 を返します。
  # 各要素が等しいまま一方だけ配列の末尾に達した時、自身の方が短ければ -1 をそうでなければ 1
  # を返します。
  # other に配列以外のオブジェクトを指定した場合は nil を返します。
  # 
  # @param other 自身と比較したい配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # 
  # //emlist[例][ruby]{
  # [ 1, 2, 3 ] <=> [ 1, 3, 2 ]       #=> -1
  # [ 1, 2, 3 ] <=> [ 1, 2, 3 ]       #=> 0
  # [ 1, 2, 3 ] <=> [ 1, 2 ]          #=> 1
  # //}
  def <=>; end

  # --- ==(other)    -> bool
  # 
  # 自身と other の各要素をそれぞれ順に == で比較し
  # て、全要素が等しければ true を返します。そうでない場合には false を返します。
  # 
  # @param other 自身と比較したい配列を指定します。
  # 
  # @see [[m:Object#==]]
  # 
  # //emlist[例][ruby]{
  # [ "a", "c" ]    == [ "a", "c", 7 ]     #=> false
  # [ "a", "c", 7 ] == [ "a", "c", 7 ]     #=> true
  # [ "a", "c", 7 ] == [ "a", "d", "f" ]   #=> false
  # //}
  def ==; end

  # --- [](nth)    -> object | nil
  # --- at(nth)    -> object | nil
  # 
  # nth 番目の要素を返します。nth 番目の要素が存在しない時には nil を返します。
  # 
  # @param nth インデックスを整数で指定します。
  #            先頭の要素が 0 番目になります。nth の値が負の時には末尾から
  #            のインデックスと見倣します。末尾の要素が -1 番目になります。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c", "d", "e" ]
  # a[0]  #=> "a"
  # a[1]  #=> "b"
  # a[-1] #=> "e"
  # a[-2] #=> "d"
  # a[10] #=> nil
  # //}
  # 
  # --- [](range)    -> Array | nil
  # 
  # [[c:Range]] オブジェクト range の範囲にある要素からなる部分配列を返します。
  # range の first の値が配列の範囲に収まらない場合 nil を返します。
  # range の first が end より後にある場合には空の配列を返します。
  # 
  # @param range 生成したい部分配列の範囲を [[c:Range]] オブジェクトで指定します。
  #              range の first や end の値が負の時には末尾からのインデックスと見倣します。末尾
  #              の要素が -1 番目になります。
  #              end の値が配列の範囲を越える時には、越えた分は無視されます。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c", "d", "e" ]
  # a[0..1]   #=> ["a", "b"]
  # a[0...1]  #=> ["a"]
  # a[0..-1]  #=> ["a", "b", "c", "d", "e"]
  # a[-2..-1] #=> ["d", "e"]
  # a[-2..4]  #=> ["d", "e"]  (start は末尾から -2 番目、end は先頭から (4+1) 番目となる。)
  # a[0..10]  #=> ["a", "b", "c", "d", "e"]
  # a[10..11] #=> nil
  # a[2..1]   #=> []
  # a[-1..-2] #=> []
  # 
  # # 特殊なケース。first が自身の長さと同じ場合には以下のようになります。
  # a[5]                   #=> nil
  # a[5, 1]                #=> []
  # a[5..10]               #=> []
  # //}
  # 
  # --- [](start, length)    ->  Array | nil
  # 
  # start 番目から length 個の要素を含む部分配列を返します。
  # length が負の時、start が自身の範囲を越えた時には nil を返します。
  # 
  # @param start 生成したい部分配列の先頭のインデックスを整数で指定します。
  #              start の値が負の時には末尾からのインデックスと見倣します。
  #              末尾の要素が -1 番目になります。
  #              整数以外のオブジェクトを指定した場合は to_int メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @param length 生成したい部分配列の長さを整数で指定します。
  #               length が start 番目からの配列の長さより長い時には、越え
  #               た分の長さは無視されます。
  #               整数以外のオブジェクトを指定した場合は to_int メソッドに
  #               よる暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c", "d", "e" ]
  # a[0, 1]    #=> ["a"]
  # a[-1, 1]   #=> ["e"]
  # a[0, 10]   #=> ["a", "b", "c", "d", "e"]
  # a[0, 0]    #=> []
  # a[0, -1]   #=> nil
  # a[10, 1]   #=> nil
  # 
  # # 特殊なケース。start が自身の長さと同じ場合には以下のようになります。
  # a[5]                   #=> nil
  # a[5, 1]                #=> []
  # a[5..10]               #=> []
  # //}
  def []; end

  # --- []=(nth, val)
  # 
  # nth 番目の要素を val に設定します。nth が配列の範囲を越える時には配列の長さを自動的に拡張し、
  # 拡張した領域を nil で初期化します。
  # 
  # @param nth インデックスを整数で指定します。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @param val 設定したい要素の値を指定します。
  # 
  # @raise TypeError 引数 nth に整数以外の(暗黙の型変換が行えない)オブジェ
  #                  クトを指定した場合に発生します。
  # 
  # @raise IndexError 指定された nth が自身の始点よりも前を指している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4, 5]
  # a[0] = "a"
  # p a  #=> ["a", 1, 2, 3, 4, 5]
  # a[10] = "x"
  # p a  #=> ["a", 1, 2, 3, 4, 5, nil, nil, nil, nil, "x"]
  # 
  # a = [0, 1, 2, 3, 4, 5]
  # a[-100] = 1           #=> IndexError
  # //}
  # 
  # --- []=(range, val)
  # 
  # [[c:Range]] オブジェクト range の範囲にある要素を配列 val の内容に置換します。
  # range の first が自身の末尾を越える時には配列の長さを自動的に拡張し、拡張した領域を nil で初期化します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 1, 2, 3, 4, 5]
  # ary[0..2] = ["a", "b"]
  # p ary  # => ["a", "b", 3, 4, 5]
  # 
  # ary = [0, 1, 2]
  # ary[5..6] = "x"
  # p ary  # => [0, 1, 2, nil, nil, "x"]
  # 
  # ary = [0, 1, 2, 3, 4, 5]
  # ary[1..3] = "x"
  # p ary  # => [0, "x", 4, 5]
  # //}
  # 
  # @param range 設定したい配列の範囲を [[c:Range]] オブジェクトで指定します。
  #              range の first や end の値が負の時には末尾からのインデックスと見倣します。
  #              末尾の要素が -1 番目になります。
  #              range の first が end より後にある場合には first の直前に val を挿入します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 1, 2, 3, 4, 5]
  # ary[2..0] = ["a", "b", "c"]
  # p ary   # => [0, 1, "a", "b", "c", 2, 3, 4, 5]
  # //}
  # 
  # @param val range の範囲に設定したい要素を配列で指定します。
  #            配列以外のオブジェクトを指定した場合は to_ary メソッドによる
  #            暗黙の型変換を試みます。to_ary メソッドに応答できない場合は
  #            [val] を用います。
  #            val の要素の数の方が range の長さより大きい時には、後ろの要素がずれます。
  #            val が空の配列 [] なら start から end までの要素が削除されます。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 1, 2, 3, 4, 5]
  # ary[2..4] = []
  # p ary   # => [0, 1, 5]
  # //}
  # 
  # @raise RangeError 指定された範囲の始点が自身の始点よりも前にある場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4, 5]
  # a[-10..10] = 1        #=> RangeError
  # //}
  # 
  # --- []=(start, length, val)
  # 
  # インデックス start から length 個の要素を配列 val の内容で置き換えます。
  # start が自身の末尾を越える時には配列の長さを自動的に拡張し、拡張した領域を nil で初期化します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 1, 2, 3]
  # ary[1, 2] = ["a", "b", "c", "d"]
  # p ary                        #=> [0, "a", "b", "c", "d", 3]
  # 
  # ary = [0, 1, 2]
  # ary[5, 1] = "Z"
  # p ary                        #=> [0, 1, 2, nil, nil, "Z"]
  # 
  # ary = [0, 1, 2, 3]
  # ary[0, 10] = ["a"]
  # p ary                        #=> ["a"]
  # //}
  # 
  # @param start 置き換えたい範囲の先頭のインデックスを指定します。
  #              start の値が負の時には末尾からのインデックスと見倣します。
  #              末尾の要素が -1 番目になります。
  #              整数以外のオブジェクトを指定した場合は to_int メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @param length 置き換えたい要素の個数を指定します。
  #               length の値が 0 のときは start の直前に val を挿入します。
  #               整数以外のオブジェクトを指定した場合は to_int メソッドに
  #               よる暗黙の型変換を試みます。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 1, 2, 3]
  # ary[1, 0] = ["inserted"]
  # p ary                        # => [0, "inserted", 1, 2, 3]
  # //}
  # 
  # @param val 設定したい要素を配列で指定します。
  #            配列以外のオブジェクトを指定した場合は to_ary メソッドによる
  #            暗黙の型変換を試みます。to_ary メソッドに応答できない場合は
  #            [val] を用います。
  #            val の長さが length と等しくない場合には、val の長さに合わせて要素が削除されたりずれたりします。
  #            val が空の配列 [] なら start から end までの要素が削除されます。
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4, 5]
  # a[2, 3] = []
  # p a   # => [0, 1, 5]
  # //}
  # 
  # @raise TypeError 引数 start、length に整数以外の(暗黙の型変換が行えな
  #                  い)オブジェクトを指定した場合に発生します。
  # 
  # @raise TypeError 引数 val に配列以外の(暗黙の型変換が行えない)オブジェ
  #                  クトを指定した場合に発生します。
  # 
  # @raise IndexError 引数 start が自身の始点よりも前を指している場合に発生します。
  # 
  # @raise IndexError 引数 length に負の数を指定した場合に発生します。
  def []=; end

  # --- abbrev(pattern = nil) -> Hash
  # 
  # self が文字列の配列の場合、self から一意に決まる短縮形を計算し、
  # 短縮形をキー、元の文字列を値とするハッシュを返します。
  # 
  # 引数に正規表現を指定すると、self のうちそのパターンにマッチしたものから短縮形を計算します。
  # 引数に文字列を指定すると、self のうちその文字列で始まるものから短縮形を計算します。
  # 
  # [[m:Abbrev.#abbrev]](self, pattern) と同じです。
  # 
  # @param pattern [[c:Regexp]] か [[c:String]] を指定します。
  # 
  # 
  #   require 'abbrev'
  #   p %w[ruby rubyist].abbrev
  #   #=> {"ruby"    => "ruby",
  #   #    "rubyi"   => "rubyist",
  #   #    "rubyis"  => "rubyist",
  #   #    "rubyist" => "rubyist"}
  # 
  # @see [[m:Abbrev.#abbrev]]
  def abbrev; end

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
  # # すべて正の数か？
  # p [5,  6, 7].all? {|v| v > 0 }   # => true
  # p [5, -1, 7].all? {|v| v > 0 }   # => false
  # p [].all? {|v| v > 0 }           # => true
  # p %w[ant bear cat].all?(/t/)     # => false
  # //}
  # 
  # @see [[m:Enumerable#all?]]
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
  # p [1, 2, 3].any? {|v| v > 3 }   # => false
  # p [1, 2, 3].any? {|v| v > 1 }   # => true
  # p [].any? {|v| v > 0 }          # => false
  # p %w[ant bear cat].any?(/d/)    # => false
  # p [nil, true, 99].any?(Integer) # => true
  # p [nil, true, 99].any?          # => true
  # p [].any?                       # => false
  # //}
  # 
  # @see [[m:Enumerable#any?]]
  def any?; end

  # --- push(*obj)        -> self
  # --- append(*obj)      -> self
  # 
  # 指定された obj を順番に配列の末尾に追加します。
  # 引数を指定しなければ何もしません。
  # 
  # @param obj 自身に追加したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # array = [1, 2, 3]
  # array.push 4
  # array.push [5, 6]
  # array.push 7, 8
  # p array          # => [1, 2, 3, 4, [5, 6], 7, 8]
  # //}
  # 
  # @see [[m:Array#pop]], [[m:Array#shift]], [[m:Array#unshift]], [[m:Array#<<]]
  def append; end

  # --- assoc(key)    -> Array | nil
  # 
  # 配列の配列を検索して、その 0 番目の要素が key に == で等しい
  # 最初の要素を返します。該当する要素がなければ nil を返します。
  # 
  # @param key 検索するオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # ary = [[1,15], [2,25], [3,35]]
  # p ary.assoc(2)           # => [2, 25]
  # p ary.assoc(100)         # => nil
  # p ary.assoc(15)          # => nil
  # //}
  # 
  # @see [[m:Array#rassoc]]
  def assoc; end

  # --- bsearch { |x| ... } -> object | nil
  # --- bsearch             -> Enumerator
  # 
  # ブロックの評価結果で範囲内の各要素の判定を行い、条件を満たす値を二分探
  # 索(計算量は O(log n))で検索します。要素が見つからない場合は nil を返し
  # ます。self はあらかじめソートしておく必要があります。
  # 
  # 本メソッドはブロックを評価した結果により以下のいずれかのモードで動作し
  # ます。
  # 
  #  * find-minimum モード
  #  * find-any モード
  # 
  # find-minimum モード(特に理由がない限りはこのモードを使う方がいいでしょ
  # う)では、条件判定の結果を以下のようにする必要があります。
  # 
  #  * 求める値がブロックパラメータの値か前の要素の場合: true を返す
  #  * 求める値がブロックパラメータより後の要素の場合: false を返す
  # 
  # ブロックの評価結果が true になる最初の要素を返すか、nil を返します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 4, 7, 10, 12]
  # ary.bsearch {|x| x >=   4 } # => 4
  # ary.bsearch {|x| x >=   6 } # => 7
  # ary.bsearch {|x| x >=  -1 } # => 0
  # ary.bsearch {|x| x >= 100 } # => nil
  # //}
  # 
  # find-any モードは [[man:bsearch(3)]] のように動作します。ブロックは真偽値
  # ではなく、以下のような数値を返す必要があります。求める要素が配列の i 番目
  # から j-1 番目までに入っているとします。またブロックパラメータの値の
  # インデックスを k とします。
  # 
  #  * ブロックパラメータの値が求める値の範囲よりも小さい（0 <= k < i）場合: 正の数を返す
  #  * ブロックパラメータの値が求める値の範囲に合致する（i <= k < j）場合: 0 を返す
  #  * ブロックパラメータの値が求める値の範囲よりも大きい（j <= k < self.size）場合: 負の数を返す
  # 
  # ブロックの評価結果が 0 になるいずれかの要素を返すか、nil を返します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 4, 7, 10, 12]
  # # 4 <= v < 8 になる要素を検索
  # ary.bsearch {|x| 1 - x / 4 } # => 4 or 7
  # # 8 <= v < 10 になる要素を検索
  # ary.bsearch {|x| 4 - x / 2 } # => nil
  # //}
  # 
  # 上記の 2 つのモードを混在して使用しないでください(ブロックの評価結果は
  # 常に true/false、数値のいずれかを一貫して返すようにしてください)。
  # また、二分探索の各イテレーションで値がどのような順序で選ばれるかは
  # 未規定です。
  # 
  # ブロックが与えられなかった場合は、 [[c:Enumerator]] のインスタンスを返します。
  # 
  # @raise TypeError ブロックの評価結果が true、false、nil、数値以外であっ
  #                  た場合に発生します。
  # 
  # @see [[m:Array#bsearch_index]], [[m:Range#bsearch]], [[url:https://magazine.rubyist.net/articles/0041/0041-200Special-note.html]]
  def bsearch; end

  # --- bsearch_index { |x| ... } -> Integer | nil
  # --- bsearch_index             -> Enumerator
  # 
  # ブロックの評価結果で範囲内の各要素の判定を行い、条件を満たす値の位置を
  # 二分探索(計算量は O(log n))で検索します。要素が見つからない場合は nil
  # を返します。self はあらかじめソートしておく必要があります。
  # 
  # 本メソッドは[[m:Array#bsearch]]と同様に、ブロックを評価した結果により2
  # つのモードで動作します。[[m:Array#bsearch]] との違いは見つかった要素自
  # 身を返すか位置を返すかのみです。各モードのより詳細な違いについては
  # [[m:Array#bsearch]] を参照してください。
  # 
  # //emlist[例: find-minimum モード][ruby]{
  # ary = [0, 4, 7, 10, 12]
  # ary.bsearch_index { |x| x >=   4 } # => 1
  # ary.bsearch_index { |x| x >=   6 } # => 2
  # ary.bsearch_index { |x| x >=  -1 } # => 0
  # ary.bsearch_index { |x| x >= 100 } # => nil
  # //}
  # 
  # //emlist[例: find-any モード][ruby]{
  # ary = [0, 4, 7, 10, 12]
  # # 4 <= v < 8 になる要素の位置を検索
  # ary.bsearch_index { |x| 1 - x / 4 } # => 2
  # # 8 <= v < 10 になる要素の位置を検索
  # ary.bsearch_index { |x| 4 - x / 2 } # => nil
  # //}
  # 
  # @see [[m:Array#bsearch]]
  def bsearch_index; end

  # --- clear    -> self
  # 
  # 配列の要素をすべて削除して空にします。
  # 
  # //emlist[例][ruby]{
  # ary = [1, 2]
  # ary.clear
  # p ary     #=> []
  # //}
  def clear; end

  # --- clone    -> Array
  # --- dup      -> Array
  # 
  # レシーバと同じ内容を持つ新しい配列を返します。
  # 
  # clone は frozen tainted singleton-class の情報も含めてコピーしますが、
  # dup は内容だけをコピーします。
  # またどちらのメソッドも要素それ自体のコピーはしません。
  # つまり「浅い(shallow)」コピーを行います。
  # 
  # //emlist[例][ruby]{
  # ary = ['string']
  # p ary             #=> ["string"]
  # copy = ary.dup
  # p copy            #=> ["string"]
  # 
  # ary[0][0...3] = ''
  # p ary             #=> ["ing"]
  # p copy            #=> ["ing"]
  # //}
  def clone; end

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
  # # すべて 3 倍にする
  # p [1, 2, 3].map {|n| n * 3 }  # => [3, 6, 9]
  # //}
  # 
  # @see [[m:Hash#to_h]], [[m:Enumerable#collect]], [[m:Enumerable#map]]
  def collect; end

  # --- collect! {|item| ..}    -> self
  # --- map! {|item| ..}        -> self
  # --- collect!                -> Enumerator
  # --- map!                    -> Enumerator
  # 
  # 各要素を順番にブロックに渡して評価し、その結果で要素を
  # 置き換えます。
  # 
  # ブロックが与えられなかった場合は、自身と map! から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # ary = [1, 2, 3]
  # ary.map! {|i| i * 3 }
  # p ary   #=> [3, 6, 9]
  # 
  # ary = [1, 2, 3]
  # e = ary.map!
  # e.each{ 1 }
  # p ary           #=> [1, 1, 1]
  # //}
  # 
  # @see [[m:Array#collect]],  [[c:Enumerator]]
  def collect!; end

  # --- combination(n) {|c| block }    -> Array
  # --- combination(n)                 -> Enumerator
  # 
  # サイズ n の組み合わせをすべて生成し、それを引数としてブロックを実行します。
  # 
  # 得られる組み合わせの順序は保証されません。ブロックなしで呼び出されると、組み合わせ
  # を生成する [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param n 生成される配列のサイズを整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4]
  # a.combination(1).to_a  #=> [[1],[2],[3],[4]]
  # a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
  # a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
  # a.combination(4).to_a  #=> [[1,2,3,4]]
  # a.combination(0).to_a  #=> [[]]: one combination of length 0
  # a.combination(5).to_a  #=> []  : no combinations of length 5
  # //}
  # 
  # @see [[m:Array#permutation]], [[m:Array#repeated_combination]]
  def combination; end

  # --- compact     -> Array
  # --- compact!    -> self | nil
  # 
  # compact は自身から nil を取り除いた配列を生成して返します。
  # compact! は自身から破壊的に nil を取り除き、変更が
  # 行われた場合は self を、そうでなければ nil を返します。
  # 
  # //emlist[例][ruby]{
  # ary = [1, nil, 2, nil, 3, nil]
  # p ary.compact   #=> [1, 2, 3]
  # p ary           #=> [1, nil, 2, nil, 3, nil]
  # ary.compact!
  # p ary           #=> [1, 2, 3]
  # p ary.compact!  #=> nil
  # //}
  def compact; end

  # --- concat(other)    -> self
  # 
  # 配列 other を自身の末尾に破壊的に連結します。
  # 
  # @param other 自身と連結したい配列を指定します。
  # 
  # //emlist[例][ruby]{
  # array = [1, 2]
  # a     = [3, 4]
  # array.concat a
  # p array          # => [1, 2, 3, 4]
  # p a              # => [3, 4]       # こちらは変わらない
  # //}
  # 
  # --- concat(*other_arrays)    -> self
  # 
  # other_arrays の要素を自身の末尾に破壊的に連結します。
  # 
  # @param other_arrays 自身と連結したい配列を指定します。
  # 
  # //emlist[例][ruby]{
  # [ "a", "b" ].concat( ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
  # [ "a" ].concat( ["b"], ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
  # [ "a" ].concat #=> [ "a" ]
  # 
  # a = [ 1, 2, 3 ]
  # a.concat( [ 4, 5 ] )
  # a                                 #=> [ 1, 2, 3, 4, 5 ]
  # 
  # a = [ 1, 2 ]
  # a.concat(a, a)                    #=> [1, 2, 1, 2, 1, 2]
  # //}
  # 
  # @see [[m:Array#+]]
  def concat; end

  # --- count                   -> Integer
  # --- count(item)             -> Integer
  # --- count {|obj| ... }  -> Integer
  # 
  # レシーバの要素数を返します。
  # 
  # 引数を指定しない場合は、配列の要素数を返します。
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
  # ary = [1, 2, 4, 2.0]
  # ary.count             # => 4
  # ary.count(2)          # => 2
  # ary.count{|x|x%2==0}  # => 3
  # //}
  # 
  # @see [[m:Enumerable#count]]
  def count; end

  # --- cycle(n=nil) {|obj| block } -> nil
  # --- cycle(n=nil) -> Enumerator
  # 
  # 配列の全要素を n 回(nilの場合は無限に)繰り返しブロックを呼びだします。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param n 繰り返したい回数を整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = ["a", "b", "c"]
  # a.cycle {|x| puts x }  # print, a, b, c, a, b, c,.. forever.
  # //}
  def cycle; end

  # --- delete(val)           -> object | nil
  # --- delete(val) { ... }   -> object
  # 
  # 指定された val と == で等しい要素を自身からすべて取り除きます。
  # 等しい要素が見つかった場合は最後に見つかった要素を、
  # そうでない場合には nil を返します。
  # 
  # ブロックが与えられた場合、val と等しい要素が見つからなかったときにブロッ
  # クを評価してその結果を返します。
  # 
  # @param val 自身から削除したい値を指定します。
  # 
  # //emlist[例][ruby]{
  # array = [1, 2, 3, 2, 1]
  # p array.delete(2)       #=> 2
  # p array                 #=> [1, 3, 1]
  # 
  # # ブロックなしの引数に nil を渡すとその戻り値から削除が
  # # 行われたかどうかの判定をすることはできない
  # ary = [nil,nil,nil]
  # p ary.delete(nil)       #=> nil
  # p ary                   #=> []
  # p ary.delete(nil)       #=> nil
  # //}
  def delete; end

  # --- delete_at(pos)    -> object | nil
  # 
  # 指定された位置 pos にある要素を取り除きそれを返します。
  # pos が範囲外であったら nil を返します。
  # 
  # [[m:Array#at]] と同様に負のインデックスで末尾から位置を指定するこ
  # とができます。
  # 
  # @param pos 削除したい要素のインデックスを整数で指定します。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # array = [0, 1, 2, 3, 4]
  # array.delete_at 2
  # p array             #=> [0, 1, 3, 4]
  # //}
  def delete_at; end

  # --- delete_if {|x| ... }    -> self
  # --- reject! {|x| ... }      -> self | nil
  # --- delete_if               -> Enumerator
  # --- reject!                 -> Enumerator
  # 
  # 要素を順番にブロックに渡して評価し、その結果が真になった要素をすべて削除します。
  # delete_if は常に self を返しますが、reject! は要素が 1 つ以上削除されれば self を、
  # 1 つも削除されなければ nil を返します。
  # 
  # ブロックが与えられなかった場合は、自身と reject! から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 返された Enumerator オブジェクトの each メソッドには、
  # もとの配列に対して副作用があることに注意してください。
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4, 5]
  # a.delete_if{|x| x % 2 == 0}
  # p a #=> [1, 3, 5]
  # 
  # a = [0, 1, 2, 3, 4, 5]
  # e = a.reject!
  # e.each{|i| i % 2 == 0}
  # p a                    #=> [1, 3, 5]  もとの配列から削除されていることに注意。
  # //}
  def delete_if; end

  # --- difference(*other_arrays) -> Array
  # 
  # 自身から other_arrays の要素を取り除いた配列を生成して返します。
  # 
  # 要素の同一性は [[m:Object#hash]] と [[m:Object#eql?]] により評価されます。
  # self 中で重複していて、other_arrays中に存在していなかった要素は、その重複が保持されます。
  # 新しい配列における要素の順は self における要素の順と同じです。
  # 
  # //emlist[例][ruby]{
  # [ 1, 1, 2, 2, 3, 3, 4, 5 ].difference([ 1, 2, 4 ])       # => [ 3, 3, 5 ]
  # [ 1, 'c', :s, 'yep' ].difference([ 1 ], [ 'a', 'c' ])    # => [:s, "yep"]
  # //}
  # 
  # 集合のような振る舞いが必要なら [[c:Set]] も参照してください。
  # 
  # @see [[m:Array#-]]
  def difference; end

  # --- dig(idx, ...) -> object | nil
  # 
  # self 以下のネストしたオブジェクトを dig メソッドで再帰的に参照して返し
  # ます。途中のオブジェクトが nil であった場合は nil を返します。
  # 
  # @param idx インデックスを整数で任意個指定します。
  # 
  # //emlist[例][ruby]{
  # a = [[1, [2, 3]]]
  # 
  # a.dig(0, 1, 1)                 # => 3
  # a.dig(1, 2, 3)                 # => nil
  # a.dig(0, 0, 0)                 # => TypeError: Integer does not have #dig method
  # [42, {foo: :bar}].dig(1, :foo) # => :bar
  # //}
  # 
  # @see [[m:Hash#dig]], [[m:Struct#dig]], [[m:OpenStruct#dig]]
  def dig; end

  # --- drop(n)               -> Array
  # 
  # 配列の先頭の n 要素を捨てて、
  # 残りの要素を配列として返します。
  # このメソッドは自身を破壊的に変更しません。
  # 
  # @param n 捨てる要素数。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5, 0]
  # a.drop(3)             # => [4, 5, 0]
  # 
  # # 変数aの値は変化しない
  # a                     # => [1, 2, 3, 4, 5, 0]
  # //}
  # 
  # @see [[m:Enumerable#drop]], [[m:Array#drop_while]], [[m:Array#shift]]
  def drop; end

  # --- drop_while                    -> Enumerator
  # --- drop_while {|element| ... }   -> Array
  # 
  # ブロックを評価して最初に偽となった要素の手前の要素まで捨て、
  # 残りの要素を配列として返します。
  # このメソッドは自身を破壊的に変更しません。
  # 
  # ブロックを指定しなかった場合は、[[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5, 0]
  # a.drop_while {|i| i < 3 }   # => [3, 4, 5, 0]
  # 
  # # 変数aの値は変化しない
  # a                           # => [1, 2, 3, 4, 5, 0]
  # //}
  # 
  # @see [[m:Enumerable#drop_while]], [[m:Array#drop]]
  def drop_while; end

  # --- each {|item| .... }    -> self
  # --- each                   -> Enumerator
  # 
  # 各要素に対してブロックを評価します。
  # 
  # ブロックが与えられなかった場合は、自身と each から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # [1, 2, 3].each do |i|
  #   puts i
  # end
  # #=> 1
  # #   2
  # #   3
  # //}
  # 
  # 
  # @see [[m:Array#each_index]], [[m:Array#reverse_each]]
  def each; end

  # --- each_index {|index| .... }    -> self
  # --- each_index                    -> Enumerator
  # 
  # 各要素のインデックスに対してブロックを評価します。
  # 
  # 以下と同じです。
  # 
  # //emlist[例][ruby]{
  # (0 ... ary.size).each do |index|
  #   # ....
  # end
  # //}
  # 
  # ブロックが与えられなかった場合は、自身と each_index から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @see [[m:Array#each]], [[m:Array#reverse_each]]
  def each_index; end

  # --- empty?    -> bool
  # 
  # 自身の要素の数が 0 の時に真を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # p [].empty?         #=> true
  # p [1, 2, 3].empty?  #=> false
  # //}
  def empty?; end

  # --- eql?(other)    -> bool
  # 
  # 自身と other の各要素をそれぞれ順に
  # [[m:Object#eql?]] で比較して、全要素が等しければ真を返
  # します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したい配列を指定します。
  # 
  # //emlist[例][ruby]{
  # ["a", "b", "c"].eql? ["a", "b", "c"]      #=> true
  # ["a", "b", "c"].eql? ["a", "c", "b"]      #=> false
  # ["a", "b", 1].eql?   ["a", "b", 1.0]      #=> false (1.eql?(1.0) が false なので)
  # //}
  # 
  # @see [[m:Object#eql?]]
  def eql?; end

  # --- fetch(nth)               -> object
  # --- fetch(nth, ifnone)       -> object
  # --- fetch(nth) {|nth| ... }  -> object
  # 
  # nth 番目の要素を返します。
  # 
  # [[m:Array#[] ]](nth) とは nth 番目の要素が存在しない場合の振舞いが異
  # なります。最初の形式では、例外 [[c:IndexError]] が発生します。
  # 二番目の形式では、引数 ifnone を返します。
  # 三番目の形式では、ブロックを評価した結果を返します。
  # 
  # @param nth 取得したい要素のインデックスを整数で指定します。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @param ifnone 要素が存在しなかった場合に返すべき値を指定します。
  # 
  # @raise TypeError 引数 nth に整数以外の(暗黙の型変換が行えない)オブジェ
  #                  クトを指定した場合に発生します。
  # 
  # @raise IndexError 引数 ifnone もブロックも指定しておらず、 nth 番目の要
  #                   素も存在しなかった場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5]
  # begin
  #   p a.fetch(10)
  # rescue IndexError => err
  #   puts err #=> index 10 out of array
  # end
  # 
  # p a.fetch(10, 999) #=> 999
  # 
  # result = a.fetch(10){|nth|
  #   print "#{nth} はありません。\n"
  #   999
  # }
  # p result #=> 999
  # //}
  def fetch; end

  # --- fill(val)            -> self
  # --- fill {|index| ... }  -> self
  # 
  # すべての要素に val をセットします。
  # 
  # このメソッドが val のコピーでなく val 自身をセットする
  # ことに注意してください。
  # val の代わりにブロックを指定するとブロックの評価結果を値とします。
  # 
  # @param val 自身にセットしたいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4]
  # a.fill(10)
  # p a #=> [10, 10, 10, 10, 10]
  # 
  # a = [0, 1, 2, 3, 4]
  # a.fill("a")
  # p a #=> ["a", "a", "a", "a", "a"]
  # a[0].capitalize!
  # p a #=> ["A", "A", "A", "A", "A"]
  # //}
  # 
  # --- fill(val, start, length = nil)             -> self
  # --- fill(val, range)                     -> self
  # --- fill(start, length = nil) {|index| ... }    -> self
  # --- fill(range) {|index| ... }            -> self
  # 
  # 配列の指定された範囲すべてに val をセットします。
  # 
  # 範囲の始点が自身の末尾を越える時には配列の長さを自動的に拡張し、拡張した領域を nil で初期化します。
  # 範囲の終点が自身の末尾を越える時は長さを自動的に拡張し、拡張した部分を val で初期化します。
  # このメソッドが val のコピーでなく val 自身をセットすることに注意してください。
  # //emlist[例][ruby]{
  # a = [0, 1, 2]
  # a.fill("x", 5..10)
  # p a #=> [0, 1, 2, nil, nil, "x", "x", "x", "x", "x", "x"]
  # //}
  # 
  # val の代わりにブロックを指定するとブロックの評価結果を値とし
  # ます。ブロックは要素毎に実行されるので、セットする値のそれぞれをあ
  # るオブジェクトの複製にすることができます。
  # ブロックのパラメータには start からのインデックスが渡されます。
  # 
  # //emlist[例][ruby]{
  # ary = []
  # p ary.fill(1..2) {|i| i}         # => [nil, 1, 2]
  # p ary.fill(0,3) {|i| i}          # => [0, 1, 2]
  # p ary.fill { "foo" }             # => ["foo", "foo", "foo"]
  # p ary.collect {|v| v.object_id } # => [537770124, 537770112, 537770100]
  # //}
  # 
  # @param val 自身に設定したいオブジェクトを指定します。
  # 
  # @param start val を設定する範囲の始点のインデックスを整数で指定します。start の値が負の時には末尾からのインデックスと見倣します。末尾の要素が -1 番目になります。
  # 
  # @param length val を設定する要素の個数を指定します。nil が指定された時は配列の終りまでの長さを意味します。
  # 
  # @param range val を設定する範囲を [[c:Range]] オブジェクトで指定します。
  def fill; end

  # --- select    -> Enumerator
  # --- filter    -> Enumerator
  # --- select {|item| ... }   -> [object]
  # --- filter {|item| ... }   -> [object]
  # 
  # 各要素に対してブロックを評価した値が真であった要素を全て含む配列を
  # 返します。真になる要素がひとつもなかった場合は空の配列を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # [1,2,3,4,5].select                      # => #<Enumerator: [1, 2, 3, 4, 5]:select>
  # [1,2,3,4,5].select { |num| num.even? }  # => [2, 4]
  # //}
  # @see [[m:Enumerable#select]]
  # @see [[m:Array#select!]]
  def filter; end

  # --- select! {|item| block } -> self | nil
  # --- select! -> Enumerator
  # --- filter! {|item| block } -> self | nil
  # --- filter! -> Enumerator
  # 
  # ブロックが false を返した要素を自身から削除します。
  # 変更があった場合は self を、
  # 変更がなかった場合には nil を返します。
  # 
  # //emlist[例][ruby]{
  # a = %w{ a b c d e f }
  # a.select! {|v| v =~ /[a-z]/ }   # => nil
  # a # => ["a", "b", "c", "d", "e", "f"]
  # //}
  # 
  # ブロックが与えられなかった場合は、自身と select! から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @see [[m:Array#keep_if]]
  def filter!; end

  # --- find_index(val)          -> Integer | nil
  # --- index(val)               -> Integer | nil
  # --- find_index {|item| ...}  -> Integer | nil
  # --- index {|item| ...}       -> Integer | nil
  # --- find_index               -> Enumerator
  # --- index                    -> Enumerator
  # 
  # 条件に一致する最初の要素の位置を返します。
  # 
  # @param val 位置を知りたいオブジェクトを指定します。
  # 
  # 指定された val と == で等しい最初の要素の位置を返します。
  # 等しい要素がひとつもなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # p [1, 0, 0, 1, 0].index(1)   #=> 0
  # p [1, 0, 0, 0, 0].index(1)   #=> 0
  # p [0, 0, 0, 0, 0].index(1)   #=> nil
  # //}
  # 
  # ブロックが与えられた場合には、各要素を引数として順にブロックを実行し、
  # ブロックが真を返した最初の要素の位置を返します。
  # 一つも真にならなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # p [0, 1, 0, 1, 0].index {|v| v > 0}   #=> 1
  # //}
  # 
  # 
  # 引数、ブロックのどちらも与えられなかった場合は、
  # [[c:Enumerator]] のインスタンスを返します。
  # 
  # @see [[m:Array#rindex]]
  def find_index; end

  # --- first       -> object | nil
  # 
  # 配列の先頭の要素を返します。要素がなければ nil を返します。
  # 
  # //emlist[例][ruby]{
  # p [0, 1, 2].first   #=> 0
  # p [].first          #=> nil
  # //}
  # 
  # @see [[m:Array#last]]
  # 
  # --- first(n)    -> Array
  # 
  # 先頭の n 要素を配列で返します。n は 0 以上でなければなりません。
  # 
  # @param n 取得したい要素の個数を整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError n が負値の場合発生します。
  # 
  # //emlist[例][ruby]{
  # ary =  [0, 1, 2]
  # p ary.first(0)
  # p ary.first(1)
  # p ary.first(2)
  # p ary.first(3)
  # p ary.first(4)
  # # => []
  # #    [0]
  # #    [0, 1]
  # #    [0, 1, 2]
  # #    [0, 1, 2]
  # //}
  # 
  # @see [[m:Array#last]]
  def first; end

  # --- flatten(lv = nil)     -> Array
  # --- flatten!(lv = nil)    -> self | nil
  # 
  # flatten は自身を再帰的に平坦化した配列を生成して返します。flatten! は
  # 自身を再帰的かつ破壊的に平坦化し、平坦化が行われた場合は self をそうでない
  # 場合は nil を返します。
  # lv が指定された場合、lv の深さまで再帰的に平坦化します。
  # 
  # @param lv 平坦化の再帰の深さを整数で指定します。nil を指定した場合、再
  #           帰の深さの制限無しに平坦化します。
  #           整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #           黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError 配列要素が自身を含むような無限にネストした配列に対して flatten を呼んだ場合に発生します。
  # 
  # //emlist[例][ruby]{
  # # 自身を再帰的に平坦化する例。
  # a = [1, [2, 3, [4], 5]]
  # p a.flatten                     #=> [1, 2, 3, 4, 5]
  # p a                             #=> [1, [2, 3, [4], 5]]
  # 
  # # 自身を破壊的に平坦化する例。
  # a = [[[1, [2, 3]]]]
  # p a.flatten!                    #=> [1, 2, 3]
  # p a                             #=> [1, 2, 3]
  # 
  # # 平坦化が行われない場合は nil を返す。
  # p [1, 2, 3].flatten!            #=> nil
  # 
  # # 平坦化の再帰の深さを指定する例。
  # a = [ 1, 2, [3, [4, 5] ] ]
  # a.flatten(1)              #=> [1, 2, 3, [4, 5]]
  # //}
  def flatten; end

  # --- hash    -> Integer
  # 
  # 自身のハッシュ値を整数で返します。ハッシュ値は自身の各要素のハッシュ値から
  # 計算されます。[[m:Array#eql?]] で比較して等しい配列同士は同じハッシュ値を返します。
  # 
  # //emlist[例][ruby]{
  # a = ["a", "b", 1]
  # a.hash                #=>  321
  # b = a.dup
  # b.hash                #=>  321
  # 
  # ["a", 1, "b"].hash    #=>  491
  # ["a", 1.0, "b"].hash  #=>  466227
  # //}
  def hash; end

  # --- include?(val)    -> bool
  # 
  # 配列が val と == で等しい要素を持つ時に真を返します。
  # 
  # @param val オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c" ]
  # a.include?("b")       #=> true
  # a.include?("z")       #=> false
  # //}
  def include?; end

  # --- insert(nth, *val)    -> self
  # 
  # インデックス nth の要素の直前(nth が負の場合は直後)に第 2 引数以降の値を挿入します。
  # 引数 val を一つも指定しなければ何もしません。
  # 
  # @param nth val を挿入する位置を整数で指定します。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @param val 自身に挿入するオブジェクトを指定します。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # ary = [1, 2, 3]
  # ary.insert(2, "a", "b")
  # p ary                  # => [1, 2, "a", "b", 3]
  # ary.insert(-2, "X")
  # p ary                  # => [1, 2, "a", "b", "X", 3]
  # //}
  def insert; end

  # --- to_s    -> String
  # --- inspect -> String
  # 
  # 自身の情報を人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # [1, 2, 3, 4].to_s    # => "[1, 2, 3, 4]"
  # [1, 2, 3, 4].inspect # => "[1, 2, 3, 4]"
  # //}
  def inspect; end

  # --- join(sep = $,)    -> String
  # 
  # 配列の要素を文字列 sep を間に挟んで連結した文字列を返します。
  # 
  # 文字列でない要素に対しては、to_str があれば to_str、なければ to_s した結果を連結します。
  # 要素がまた配列であれば再帰的に (同じ sep を利用して)
  # join した文字列を連結します。
  # ただし、配列要素が自身を含むような無限にネストした配列に対しては、以下
  # のような結果になります。
  # 
  # //emlist[例][ruby]{
  # ary = [1,2,3]
  # ary.push ary
  # p ary           # => [1, 2, 3, [...]]
  # p ary.join      # => ArgumentError: recursive array join
  # //}
  # 
  # @param sep 間に挟む文字列を指定します。nil のときは空文字列を使います。
  #            文字列以外のオブジェクトを指定した場合は to_str メソッドによ
  #            る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に文字列以外の(暗黙の型変換が行えない)オブジェクト
  #                  を指定した場合に発生します。
  # 
  # @raise ArgumentError 配列要素が自身を含むような無限にネストした配列に対
  #                      して join を呼んだ場合に発生します。
  # 
  # //emlist[例][ruby]{
  # [1, 2, 3].join('-') #=> "1-2-3"
  # //}
  # 
  # @see [[m:Array#*]], [[m:$,]]
  def join; end

  # --- keep_if {|item| ... } -> self
  # --- keep_if -> Enumerator
  # 
  # ブロックが false を返した要素を削除します。
  # 
  # //emlist[例][ruby]{
  # a = %w{ a b c d e f }
  # a.keep_if {|v| v =~ /[aeiou]/}   # => ["a", "e"]
  # a # => ["a", "e"]
  # //}
  # 
  # [[m:Array#select!]] と同様に自身を上書きしますが、削除する要素がなかっ
  # た場合には修正を行いません。
  # 
  # //emlist[例][ruby]{
  # a = %w{ a b c d e f }
  # a.keep_if {|v| v =~ /[a-z]/ }   # => ["a", "b", "c", "d", "e", "f"]
  # a # => ["a", "b", "c", "d", "e", "f"]
  # //}
  # 
  # ブロックが与えられなかった場合は、自身と keep_if から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @see [[m:Array#select!]]
  def keep_if; end

  # --- last    -> object | nil
  # 
  # 配列の末尾の要素を返します。配列が空のときは nil を返します。
  # 
  # //emlist[例][ruby]{
  # p [0, 1, 2].last   #=> 2
  # p [].last          #=> nil
  # //}
  # 
  # @see [[m:Array#first]]
  # 
  # --- last(n)    -> Array
  # 
  # 末尾の n 要素を配列で返します。n は 0 以上でなければなりません。
  # 
  # @param n 取得したい要素の個数を整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError n が負値の場合発生します。
  # 
  # //emlist[例][ruby]{
  # ary =  [0, 1, 2]
  # p ary.last(0)
  # p ary.last(1)
  # p ary.last(2)
  # p ary.last(3)
  # p ary.last(4)
  # # => []
  # #    [2]
  # #    [1, 2]
  # #    [0, 1, 2]
  # #    [0, 1, 2]
  # //}
  # 
  # @see [[m:Array#first]]
  def last; end

  # --- length    -> Integer
  # --- size      -> Integer
  # 
  # 配列の長さを返します。配列が空のときは 0 を返します。
  # 
  # //emlist[例][ruby]{
  # p [1, nil, 3, nil].size    #=> 4
  # //}
  def length; end

  # --- max    -> object | nil
  # --- max(n) -> Array
  # 
  # 最大の要素、もしくは最大の n 要素が降順に入った配列を返します。
  # 全要素が互いに <=> メソッドで比較できることを仮定しています。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # [].max           #=> nil
  # [].max(1)        #=> []
  # [2, 5, 3].max    #=> 5
  # [2, 5, 3].max(2) #=> [5, 3]
  # //}
  # 
  # @param n 取得する要素数。
  # 
  # @see [[m:Enumerable#max]]
  # 
  # --- max {|a, b| ... }    -> object | nil
  # --- max(n) {|a, b| ... } -> Array
  # 
  # ブロックの評価結果で各要素の大小判定を行い、最大の要素、もしくは最大の
  # n 要素が降順に入った配列を返します。
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # ブロックの値は、a > b のとき正、
  # a == b のとき 0、a < b のとき負の整数を、期待しています。
  # 
  # //emlist[例][ruby]{
  # [].max {|a, b| a <=> b }    #=> nil
  # [].max(1) {|a, b| a <=> b } #=> []
  # 
  # ary = %w(albatross dog horse)
  # ary.max {|a, b| a.length <=> b.length }    #=> "albatross"
  # ary.max(2) {|a, b| a.length <=> b.length } #=> ["albatross", "horse"]
  # //}
  # 
  # @param n 取得する要素数。
  # 
  # @see [[m:Enumerable#max]]
  def max; end

  # --- min    -> object | nil
  # --- min(n) -> Array
  # 
  # 最小の要素、もしくは最小の n 要素が昇順で入った配列を返します。
  # 全要素が互いに <=> メソッドで比較できることを仮定しています。
  # 
  # 引数を指定しない形式では要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # [].min           #=> nil
  # [].min(1)        #=> []
  # [2, 5, 3].min    #=> 2
  # [2, 5, 3].min(2) #=> [2, 3]
  # //}
  # 
  # @param n 取得する要素数。
  # 
  # @see [[m:Enumerable#min]]
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
  # //emlist[例][ruby]{
  # [].min {|a, b| a <=> b }    #=> nil
  # [].min(1) {|a, b| a <=> b } #=> []
  # 
  # ary = %w(albatross dog horse)
  # ary.min {|a, b| a.length <=> b.length }    #=> "dog"
  # ary.min(2) {|a, b| a.length <=> b.length } #=> ["dog", "horse"]
  # //}
  # 
  # @param n 取得する要素数。
  # 
  # @see [[m:Enumerable#min]]
  def min; end

  # --- none?               -> bool
  # --- none?{|obj| ... }   -> bool
  # --- none?(pattern)      -> bool
  # 
  # ブロックを指定しない場合は、 配列のすべての
  # 要素が偽であれば真を返します。そうでなければ偽を返します。
  # 
  # ブロックを指定した場合は、配列のすべての要素を
  # ブロックで評価した結果が、すべて偽であれば真を返します。
  # そうでなければ偽を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # %w{ant bear cat}.none? {|word| word.length == 5}  # => true
  # %w{ant bear cat}.none? {|word| word.length >= 4}  # => false
  # %w{ant bear cat}.none?(/d/)                       # => true
  # [].none?                                          # => true
  # [nil].none?                                       # => true
  # [nil,false].none?                                 # => true
  # [nil, false, true].none?                          # => false
  # //}
  # 
  # @see [[m:Enumerable#none?]]
  def none?; end

  # --- one?                -> bool
  # --- one?{|obj| ... }    -> bool
  # --- one?(pattern)       -> bool
  # 
  # ブロックを指定しない場合は、 配列の要素のうち
  # ちょうど一つだけが真であれば、真を返します。
  # そうでなければ偽を返します。
  # 
  # ブロックを指定した場合は、配列の要素を
  # ブロックで評価した結果、一つの要素だけが真であれば真を返します。
  # そうでなければ偽を返します。
  # 
  # @param pattern ブロックの代わりに各要素に対して pattern === item を評価します。
  # 
  # //emlist[例][ruby]{
  # %w{ant bear cat}.one? {|word| word.length == 4}   # => true
  # %w{ant bear cat}.one? {|word| word.length > 4}    # => false
  # %w{ant bear cat}.one?(/t/)                        # => false
  # [ nil, true, 99 ].one?                            # => false
  # [ nil, true, false ].one?                         # => true
  # [ nil, true, 99 ].one?(Integer)                   # => true
  # [].one?                                           # => false
  # //}
  # 
  # @see [[m:Enumerable#one?]]
  def one?; end

  # --- pack(template)                      -> String
  # --- pack(template, buffer: String.new)  -> String
  # 
  # 配列の内容を template で指定された文字列にしたがって、
  # バイナリとしてパックした文字列を返します。
  # 
  # テンプレートは
  # 型指定文字列とその長さ(省略時は1)を並べたものです。長さと
  # して * が指定された時は「残りのデータ全て」の長さを
  # 表します。型指定文字は以下で述べる pack テンプレート文字列の通りです。
  # 
  # buffer が指定されていれば、バッファとして使って返値として返します。
  # もし template の最初にオフセット (@) が指定されていれば、
  # 結果はオフセットの後ろから詰められます。
  # buffer の元の内容がオフセットより長ければ、
  # オフセットより後ろの部分は上書きされます。
  # オフセットより短ければ、足りない部分は "\0" で埋められます。
  # 
  # buffer オプションはメモリ確保が発生しないことを保証するものでは
  # ないことに注意してください。
  # buffer のサイズ(capacity)が足りなければ、packはメモリを確保します。
  # 
  # //emlist[例][ruby]{
  # ['!'].pack('@1a', buffer: 'abc')  # => "a!"
  # ['!'].pack('@5a', buffer: 'abc')  # => "abc\u0000\u0000!"
  # //}
  # 
  # @param template 自身のバイナリとしてパックするためのテンプレートを文字列で指定します。
  # @param buffer   結果を詰めるバッファとして使う文字列オブジェクトを指定します。
  #                 指定した場合は返値も指定した文字列オブジェクトになります。
  # 
  # 
  # 以下にあげるものは、[[m:Array#pack]]、[[m:String#unpack]]、[[m:String#unpack1]]
  # のテンプレート文字の一覧です。テンプレート文字は後に「長さ」を表す数字
  # を続けることができます。「長さ」の代わりに`*'とすることで「残り全て」
  # を表すこともできます。
  # 
  # 長さの意味はテンプレート文字により異なりますが大抵、
  #   "iiii"
  # のように連続するテンプレート文字は
  #   "i4"
  # と書き換えることができます。
  # 
  # テンプレート文字列中の空白類は無視されます。
  # また、`#' から改行あるいはテンプレート文字列の最後まではコメントとみな
  # され無視されます。
  # 
  # === 整数のテンプレート文字のシステム依存性
  # 
  # 各テンプレート文字の説明の中で、
  # short や long はシステムによらずそれぞれ 2, 4バイトサ
  # イズの数値(32ビットマシンで一般的なshort, longのサイズ)を意味していま
  # す。s, S, l, L に対しては直後に _ または ! を "s_" あるいは "s!" のように
  # 続けることでシステム依存の short, long のサイズにすることもできます。
  # 
  # i, I (int)のサイズは常にシステム依存であり、n, N, v, V
  # のサイズは常にシステム依存ではない(!をつけられない)ことに注意してください。
  # 
  # つまり、[[m:IO#ioctl]] などで C の構造体を渡すときのように、
  # システム依存のサイズとエンディアンに合わせる必要があるときには
  # s!, S!, i!, I!, l!, L!, q!, Q!, j!, J! を用います。
  # また、ネットワークプロトコルやファイルフォーマットのように、
  # システムに依存しないデータを扱うときには
  # n, N, v, V を用います。
  # 
  # 強制的にエンディアンを指定したいときは、
  # リトルエンディアンなら < を、
  # ビッグエンディアンなら >
  # を後ろにつけます。! と組み合わせることも可能です。
  # 
  # まとめると以下のようになります。
  # 
  # : エンディアン非依存、整数サイズ非依存 (ネットワークプロトコルなどに適切)
  # //emlist{
  #   n: big endian unsigned 16bit
  #   N: big endian unsigned 32bit
  #   v: little endian unsigned 16bit
  #   V: little endian unsigned 32bit
  # //}
  # 
  # : エンディアン依存、整数サイズ依存 (C の構造体などに適切)
  # //emlist{
  #   s!: signed short
  #   S!: unsigned short
  #   i,i!: signed int
  #   I,I!: unsigned int
  #   l!: signed long
  #   L!: unsigned long
  #   q!: signed long long
  #   Q!: unsigned long long
  #   j,j!: intptr_t
  #   J,J!: uintptr_t
  # //}
  # 
  # : エンディアン依存、整数サイズ非依存 (C99 の stdint.h にある厳密な幅を持つ整数型に適切)
  # //emlist{
  #   s: int16_t
  #   S: uint16_t
  #   l: int32_t
  #   L: uint32_t
  #   q: int64_t
  #   Q: uint64_t
  # //}
  # 
  # : エンディアンの強制指定(バイナリ解析などに適切)
  # //emlist{
  #   S>:  big endian unsigned 16bit(nと同じ)
  #   s>:  big endian int16_t
  #   s!>: big endian signed short
  #   l<:  little endian int32_t
  #   l!<: little endian signed long
  # //}
  # 
  # === 各テンプレート文字の説明
  # 
  # 説明中、[[m:Array#pack]] と [[m:String#unpack]] で違いのあるものは `/' で区切って
  # 「Array#pack の説明 / String#unpack の説明」としています。
  # 
  # : a
  # 
  #   ASCII文字列(ヌル文字を詰める/後続するヌル文字やスペースを残す)
  # //emlist[][ruby]{
  # ["abc"].pack("a")    # => "a"
  # ["abc"].pack("a*")   # => "abc"
  # ["abc"].pack("a4")   # => "abc\x00"
  # 
  # "abc\0".unpack("a4") # => ["abc\x00"]
  # "abc ".unpack("a4")  # => ["abc "]
  # //}
  # 
  # : A
  # 
  #   ASCII文字列(スペースを詰める/後続するヌル文字やスペースを削除)
  # //emlist[][ruby]{
  # ["abc"].pack("A")    # => "a"
  # ["abc"].pack("A*")   # => "abc"
  # ["abc"].pack("A4")   # => "abc "
  # 
  # "abc ".unpack("A4")  # => ["abc"]
  # "abc\0".unpack("A4") # => ["abc"]
  # //}
  # 
  # : Z
  # 
  #   ヌル終端文字列(長さが`*'の場合も含め、ヌル文字を詰める/後続するヌル文字を削除)
  # //emlist[][ruby]{
  # ["abc"].pack("Z")  # => "a"
  # ["abc"].pack("Z*") # => "abc\x00"
  # ["abc"].pack("Z5") # => "abc\x00\x00"
  # 
  # "abc\0".unpack("Z4") # => ["abc"]
  # "abc ".unpack("Z4")  # => ["abc "]
  # //}
  # 
  # : b
  # 
  #   ビットストリング(各バイトごとに下位ビットから上位ビット)
  # //emlist[][ruby]{
  # "\xFF\x00".unpack("b*") # => ["1111111100000000"]
  # "\x01\x02".unpack("b*") # => ["1000000001000000"]
  # "\x01\x02".unpack("b3") # => ["100"]
  # 
  # 
  # ["1000000001000000"].pack("b*") # => "\x01\x02"
  # //}
  # 
  # : B
  # 
  #   ビットストリング(各バイトごとに上位ビットから下位ビット)
  # //emlist[][ruby]{
  # "\xFF\x00".unpack("B*")  # => ["1111111100000000"]
  # "\x01\x02".unpack("B*")  # => ["0000000100000010"]
  # "\x01\x02".unpack("B9")  # => ["000000010"]
  # "\x01\x02".unpack("B15") # => ["000000010000001"]
  # 
  # ["0000000100000010"].pack("B*")  # => "\x01\x02"
  # ["0000000100000010"].pack("B0")  # => ""
  # ["0000000100000010"].pack("B1")  # => "\x00"
  # ["0000000100000010"].pack("B7")  # => "\x00"
  # ["0000000100000010"].pack("B8")  # => "\x01"
  # ["0000000100000010"].pack("B9")  # => "\x01\x00"
  # ["0000000100000010"].pack("B14") # => "\x01\x00"
  # ["0000000100000010"].pack("B15") # => "\x01\x02"
  # ["0000000100000010"].pack("B16") # => "\x01\x02"
  # //}
  # 
  # : h
  # 
  #   16進文字列(下位ニブルが先)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("h*") # => ["10ef"]
  # "\x01\xFE".unpack("h3") # => ["10e"]
  # 
  # ["10ef"].pack("h*") # => "\x01\xFE"
  # //}
  # 
  # : H
  # 
  #   16進文字列(上位ニブルが先)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("H*") # => ["01fe"]
  # "\x01\xFE".unpack("H3") # => ["01f"]
  # "~".unpack("H2")        # => ["7e"]
  # 
  # ["01fe"].pack("H*") # => "\x01\xFE"
  # ["7e"].pack("H2")   # => "~"
  # //}
  # 
  # : c
  # 
  #   char (8bit 符号つき整数)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("c*") # => [1, -2]
  # 
  # [1, -2].pack("c*")  # => "\x01\xFE"
  # [1, 254].pack("c*") # => "\x01\xFE"
  # //}
  # 
  # : C
  # 
  #   unsigned char (8bit 符号なし整数)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("C*") # => [1, 254]
  # 
  # [1, -2].pack("C*")  # => "\x01\xFE"
  # [1, 254].pack("C*") # => "\x01\xFE"
  # //}
  # 
  # : s
  # 
  #   short (16bit 符号つき整数, エンディアンに依存)
  #   (s! は 16bit でなく、short のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("s*") # => [513, -514]
  # 
  # [513, 65022].pack("s*") # => "\x01\x02\xFE\xFD"
  # [513, -514].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("s*") # => [258, -259]
  # 
  # [258, 65277].pack("s*") # => "\x01\x02\xFE\xFD"
  # [258, -259].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  # : S
  # 
  #   unsigned short (16bit 符号なし整数, エンディアンに依存)
  #   (S! は 16bit でなく、short のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("S*") # => [513, 65022]
  # 
  # [513, 65022].pack("s*") # => "\x01\x02\xFE\xFD"
  # [513, -514].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  #   ビッグエンディアン:
  # 
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("S*") # => [258, 65277]
  # 
  # [258, 65277].pack("S*") # => "\x01\x02\xFE\xFD"
  # [258, -259].pack("S*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  # : i
  # 
  #   int (符号つき整数, エンディアンと int のサイズに依存)
  # 
  #   リトルエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("i*") # => [67305985, -50462977]
  # 
  # [67305985, 4244504319].pack("i*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("i*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("i*") # => [16909060, -66052]
  # 
  # [16909060, 4294901244].pack("i*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("i*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # : I
  # 
  #   unsigned int (符号なし整数, エンディアンと int のサイズに依存)
  # 
  #   リトルエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("I*") # => [67305985, 4244504319]
  # 
  # [67305985, 4244504319].pack("I*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("I*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  #   ビッグエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("I*") # => [16909060, 4294901244]
  # 
  # [16909060, 4294901244].pack("I*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("I*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : l
  # 
  #   long (32bit 符号つき整数, エンディアンに依存)
  #   (l! は 32bit でなく、long のサイズに依存)
  # 
  #   リトルエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("l*") # => [67305985, -50462977]
  # 
  # [67305985, 4244504319].pack("l*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("l*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("l*") # => [16909060, -66052]
  # 
  # [16909060, 4294901244].pack("l*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("l*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : L
  # 
  #   unsigned long (32bit 符号なし整数, エンディアンに依存)
  #   (L! は 32bit でなく、long のサイズに依存)
  # 
  #   リトルエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("L*") # => [67305985, 4244504319]
  # 
  # [67305985, 4244504319].pack("L*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("L*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("L*") # => [16909060, 4294901244]
  # 
  # [16909060, 4294901244].pack("L*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("L*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : q
  # 
  #   64bit 符号付き整数 (エンディアンに依存)
  #   (q! は 64bit でなく、long long のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("q*")
  # # => [578437695752307201, -506097522914230529]
  # 
  # [578437695752307201, -506097522914230529].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [578437695752307201, 17940646550795321087].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("q*")
  # # => [72623859790382856, -283686952306184]
  # 
  # [72623859790382856, -283686952306184].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [72623859790382856, 18446460386757245432].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # : Q
  # 
  #   64bit 符号なし整数 (エンディアンに依存)
  #   (Q! は 64bit でなく、long long のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("Q*")
  # # => [578437695752307201, 17940646550795321087]
  # 
  # [578437695752307201, 17940646550795321087].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [578437695752307201, -506097522914230529].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("Q*")
  # # => [72623859790382856, 18446460386757245432]
  # 
  # [72623859790382856, 18446460386757245432].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [72623859790382856, -283686952306184].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # : m
  # 
  #   base64された文字列。60 オクテットごと(と最後)に改行コードが付加されます。
  # 
  #   Base64は、3オクテット(8bits * 3 = 24bits)のバイナリコードをASCII文字の
  #   うちの65文字 ([A-Za-z0-9+/]の64文字とpaddingのための'=')だけを使用して
  #   4オクテット(6bits * 4 = 24bits)の印字可能文字列に変換するエンコーディ
  #   ング法です。[[RFC:2045]], [[RFC:4648]] で定義されています。
  # //emlist[][ruby]{
  # [""].pack("m")             # => ""
  # ["\0"].pack("m")           # => "AA==\n"
  # ["\0\0"].pack("m")         # => "AAA=\n"
  # ["\0\0\0"].pack("m")       # => "AAAA\n"
  # ["\xFF"].pack("m")         # => "/w==\n"
  # ["\xFF\xFF"].pack("m")     # => "//8=\n"
  # ["\xFF\xFF\xFF"].pack("m") # => "////\n"
  # 
  # ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"].pack("m")
  # # => "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJT\nVFVWV1hZWg==\n"
  # ["abcdefghijklmnopqrstuvwxyz"].pack("m3")
  # # => "YWJj\nZGVm\nZ2hp\namts\nbW5v\ncHFy\nc3R1\ndnd4\neXo=\n"
  # 
  # "".unpack("m")       # => [""]
  # "AA==\n".unpack("m") # => ["\x00"]
  # "AA==".unpack("m")   # => ["\x00"]
  # 
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJT\nVFVWV1hZWg==\n".unpack("m")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg==\n".unpack("m")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # //}
  #   m0 は [[RFC:4648]] 対応
  # //emlist[][ruby]{
  # [""].pack("m0")             # => ""
  # ["\0"].pack("m0")           # => "AA=="
  # ["\0\0"].pack("m0")         # => "AAA="
  # ["\0\0\0"].pack("m0")       # => "AAAA"
  # ["\xFF"].pack("m0")         # => "/w=="
  # ["\xFF\xFF"].pack("m0")     # => "//8="
  # ["\xFF\xFF\xFF"].pack("m0") # => "////"
  # 
  # ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"].pack("m0")
  # # => "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg=="
  # 
  # "".unpack("m0")       # => [""]
  # "AA==\n".unpack("m0") # => ArgumentError (invalid base64)
  # "AA==".unpack("m0")   # => ["\x00"]
  # 
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg==".unpack("m0")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # //}
  # @see [[lib:base64]]
  # 
  # : M
  # 
  #   quoted-printable encoding された文字列
  # //emlist[][ruby]{
  # ["a b c\td \ne"].pack("M") # => "a b c\td =\n\ne=\n"
  # 
  # "a b c\td =\n\ne=\n".unpack("M") # => ["a b c\td \ne"]
  # //}
  # 
  # : n
  # 
  #   ネットワークバイトオーダー(ビッグエンディアン)のunsigned short (16bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1,32767,-32768,65535].pack("n*")
  # # => "\x00\x00\x00\x01\xFF\xFF\x7F\xFF\x80\x00\xFF\xFF"
  # 
  # "\x00\x00\x00\x01\xFF\xFF\x7F\xFF\x80\x00\xFF\xFF".unpack("n*")
  # # => [0, 1, 65535, 32767, 32768, 65535]
  # //}
  # 
  # : N
  # 
  #   ネットワークバイトオーダー(ビッグエンディアン)のunsigned long (32bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1].pack("N*") # => "\x00\x00\x00\x00\x00\x00\x00\x01\xFF\xFF\xFF\xFF"
  # 
  # "\x00\x00\x00\x00\x00\x00\x00\x01\xFF\xFF\xFF\xFF".unpack("N*") # => [0, 1, 4294967295]
  # //}
  # 
  # : v
  # 
  #   "VAX"バイトオーダー(リトルエンディアン)のunsigned short (16bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1,32767,-32768,65535].pack("v*")
  # # => "\x00\x00\x01\x00\xFF\xFF\xFF\x7F\x00\x80\xFF\xFF"
  # 
  # "\x00\x00\x01\x00\xFF\xFF\xFF\x7F\x00\x80\xFF\xFF".unpack("v*")
  # # => [0, 1, 65535, 32767, 32768, 65535]
  # //}
  # 
  # : V
  # 
  #   "VAX"バイトオーダー(リトルエンディアン)のunsigned long (32bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1].pack("V*") # => "\x00\x00\x00\x00\x01\x00\x00\x00\xFF\xFF\xFF\xFF"
  # 
  # 
  # "\x00\x00\x00\x00\x01\x00\x00\x00\xFF\xFF\xFF\xFF".unpack("V*") # => [0, 1, 4294967295]
  # //}
  # 
  # : f
  # 
  #   単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754 単精度 リトルエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("f")      # => "\x00\x00\x80?"
  # [0.0/0.0].pack("f")  # => "\x00\x00\xC0\x7F"      # NaN
  # [1.0/0.0].pack("f")  # => "\x00\x00\x80\x7F"      # +Inf
  # [-1.0/0.0].pack("f") # => "\x00\x00\x80\xFF"      # -Inf
  # //}
  # 
  #   MIPS (IEEE754 単精度 ビッグエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("f")      # => "?\x80\x00\x00"
  # [0.0/0.0].pack("f")  # => "\x7F\xBF\xFF\xFF"      # NaN
  # [1.0/0.0].pack("f")  # => "\x7F\x80\x00\x00"      # +Inf
  # [-1.0/0.0].pack("f") # => "\xFF\x80\x00\x00"      # -Inf
  # //}
  # 
  #   VAX (NetBSD 3.0) (非IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("f") # => "\x80@\x00\x00"
  # //}
  # 
  # : d
  # 
  #   倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754 倍精度 リトルエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("d")      # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # [0.0/0.0].pack("d")  # => "\x00\x00\x00\x00\x00\x00\xF8\x7F"      # NaN
  # [1.0/0.0].pack("d")  # => "\x00\x00\x00\x00\x00\x00\xF0\x7F"      # +Inf
  # [-1.0/0.0].pack("d") # => "\x00\x00\x00\x00\x00\x00\xF0\xFF"      # -Inf
  # //}
  # 
  #   MIPS (IEEE754 倍精度 ビッグエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("d")      # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # [0.0/0.0].pack("d")  # => "\x7F\xF7\xFF\xFF\xFF\xFF\xFF\xFF"      # NaN
  # [1.0/0.0].pack("d")  # => "\x7F\xF0\x00\x00\x00\x00\x00\x00"      # +Inf
  # [-1.0/0.0].pack("d") # => "\xFF\xF0\x00\x00\x00\x00\x00\x00"      # -Inf
  # //}
  # 
  #   VAX (NetBSD 3.0) (非IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("d") # => "\x80@\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  # : e
  # 
  #   リトルエンディアンの単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("e") # => "\x00\x00\x80?"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("e") # => "\x00\x00\x80?"
  # //}
  # 
  # : E
  # 
  #   リトルエンディアンの倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("E") # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("E") # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # //}
  # 
  # : g
  # 
  #   ビッグエンディアンの単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("g") # => "?\x80\x00\x00"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("g") # => "?\x80\x00\x00"
  # //}
  # 
  #   IEEE754準拠な環境の場合、以下のようにして符号、指数部、仮数部を取り出せます。
  # //emlist[][ruby]{
  # s = [v].pack("g").unpack("B*")[0][0,1]      # 符号
  # e = [v].pack("g").unpack("B*")[0][1,8]      # 指数部
  # f = [v].pack("g").unpack("B*")[0][9,23]     # 仮数部
  # //}
  # 
  #   そして、s, e, f の意味は以下の通りです。
  # //emlist[][ruby]{
  # sgn = s == "0" ? +1.0 : -1.0
  # exp = Integer("0b" + e)
  # fra = Integer("0b" + f)
  # if exp == 0
  #   if fra == 0
  #     sgn * 0                     # ±0 (positive/negative zero)
  #   else
  #     sgn * fra * 2**(-126-23)    # 非正規化数 (denormalized number)
  #   end
  # elsif exp == 255
  #   if fra == 0
  #     sgn * Inf                   # ±∞ (positive/negative infinity)
  #   else
  #     NaN                         # 非数 (not a number)
  #   end
  # else
  #   fra += 1 << 23                # ゲタ
  #   sgn * fra * 2**(exp-127-23)   # 正規化数 (normalized number)
  # end
  # //}
  # 
  # : G
  # 
  #   ビッグエンディアンの倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("G") # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("G") # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   IEEE754準拠な環境の場合、以下のようにして符号、指数部、仮数部を取り出せます。
  # //emlist[][ruby]{
  # s = [v].pack("G").unpack("B*")[0][0,1]    # 符号
  # e = [v].pack("G").unpack("B*")[0][1,11]   # 指数部
  # f = [v].pack("G").unpack("B*")[0][12,52]  # 仮数部
  # //}
  # 
  #   そして、s, e, f の意味は以下の通りです。
  # //emlist[][ruby]{
  # sgn = s == "0" ? +1.0 : -1.0
  # exp = Integer("0b" + e)
  # fra = Integer("0b" + f)
  # if exp == 0
  #   if fra == 0
  #     sgn * 0                     # ±0 (positive/negative zero)
  #   else
  #     sgn * fra * 2**(-1022-52)   # 非正規化数 (denormalized number)
  #   end
  # elsif exp == 2047
  #   if fra == 0
  #     sgn * Inf                   # ±∞ (positive/negative infinity)
  #   else
  #     NaN                         # 非数 (not a number)
  #   end
  # else
  #   fra += 1 << 52                # ゲタ
  #   sgn * fra * 2**(exp-1023-52)  # 正規化数 (normalized number)
  # end
  # //}
  # 
  # : p
  # 
  #   ヌル終端の文字列へのポインタ
  # //emlist[][ruby]{
  # [""].pack("p")             # => "\x980\xBEf\x1CV\x00\x00"
  # ["a", "b", "c"].pack("p3") # => "\x98\xE5\x9ER\xD2U\x00\x00p\xE5\x9ER\xD2U\x00\x00H\xE5\x9ER\xD2U\x00\x00"
  # [nil].pack("p")            # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  # : P
  # 
  #   構造体(固定長文字列)へのポインタ
  # //emlist[][ruby]{
  # [nil].pack("P")    # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # ["abc"].pack("P3") # => "\xA0\xEE\er\x84U\x00\x00"
  # 
  # ["abc"].pack("P4") # => ArgumentError: too short buffer for P(3 for 4)
  # [""].pack("P")     # => ArgumentError: too short buffer for P(0 for 1)
  # //}
  # 
  # : u
  # 
  #   uuencodeされた文字列
  # //emlist[][ruby]{
  # [""].pack("u")           # => ""
  # ["a"].pack("u")          # => "!80``\n"
  # ["abc"].pack("u")        # => "#86)C\n"
  # ["abcd"].pack("u")       # => "$86)C9```\n"
  # ["a"*45].pack("u")       # => "M86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A\n"
  # ["a"*46].pack("u")       # => "M86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A\n!80``\n"
  # ["abcdefghi"].pack("u6") # => "&86)C9&5F\n#9VAI\n"
  # //}
  # 
  # : U
  # 
  #   UTF-8
  # //emlist[][ruby]{
  # [0].pack("U")                               # => "\u0000"
  # [1].pack("U")                               # => "\u0001"
  # [0x7f].pack("U")                            # => "\u007F"
  # [0x80].pack("U")                            # => "\u0080"
  # [0x7fffffff].pack("U")                      # => "\xFD\xBF\xBF\xBF\xBF\xBF"
  # [0x80000000].pack("U")                      # => RangeError: pack(U): value out of range
  # [0,256,65536].pack("U3").b                  # => "\x00\xC4\x80\xF0\x90\x80\x80"
  # 
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U3") # => [0, 256, 65536]
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U")  # => [0]
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U*") # => [0, 256, 65536]
  # //}
  # 
  # : w
  # 
  #   BER圧縮整数
  # 
  #   1バイトあたり7ビットを使用して必要最小限のバイト数で任意サイズの
  #   0以上の整数を表す数値表現。各バイトの最上位ビットはデータの最後
  #   を除いて必ず1が立っている(つまり最上位ビットはどこまでデータがあ
  #   るかを示している)。
  # 
  #   ISO/IEC 8825-1:1995 : Information technology−ASN.1 encoding rules : Specification of Basic Encoding Rules(BER) に定められる整数の符号化方法。
  # 
  # //emlist[][ruby]{
  # [0].pack("w")             # => "\x00"
  # [1].pack("w")             # => "\x01"
  # [127].pack("w")           # => "\x7F"
  # [128].pack("w")           # => "\x81\x00"
  # [0x3fff].pack("w")        # => "\xFF\x7F"
  # [0x4000].pack("w")        # => "\x81\x80\x00"
  # [0x3fffffff].pack("w")    # => "\x83\xFF\xFF\xFF\x7F"
  # [0x40000000].pack("w")    # => "\x84\x80\x80\x80\x00"
  # [0xffffffff].pack("w")    # => "\x8F\xFF\xFF\xFF\x7F"
  # [0x100000000].pack("w")   # => "\x90\x80\x80\x80\x00"
  # 
  # "\x00".unpack("w")              # => [0]
  # "\x00\x81\x00\x01".unpack("w*") # => [0, 128, 1]
  # //}
  # 
  #   なお、BER圧縮整数でエンコードした結果は大小関係を保存しない。
  #   たとえば、[0x3fff].pack("w") > [0x4000].pack("w") である。
  # 
  # : x
  # 
  #   ヌルバイト（pack）／1バイト読み飛ばし（unpack）
  # //emlist[][ruby]{
  # [97, 98].pack("CxC")    # => "a\x00b"
  # [97, 98].pack("Cx3C")   # => "a\x00\x00\x00b"
  # 
  # "abc".unpack("CxC")  # => [97, 99]
  # "abc".unpack("Cx3C") # => ArgumentError: x outside of string
  # //}
  # 
  # : X
  # 
  #   1バイト後退
  # //emlist[][ruby]{
  # [97, 98, 99].pack("CCXC") # => "ac"
  # 
  # "abcdef".unpack("x*XC") # => [102]
  # //}
  # 
  # : @
  # 
  #   絶対位置への移動
  # //emlist[][ruby]{
  # [97, 98].pack("C @3 C") # => "a\x00\x00b"
  # 
  # "abcd".unpack("C @3 C") # => [97, 100]
  # //}
  # 
  # : j
  # 
  # intptr_t (ポインタの幅の符号つき整数, エンディアンに依存)
  # 
  # : J
  # 
  # uintptr_t (ポインタの幅の符号なし整数, エンディアンに依存)
  # 
  # === 使用例
  # 
  # 以下、pack/unpack の使用例の一部です。
  # 
  # pack を使用しなくても同じことができる場合はその例も載せています。
  # pack は暗号になりやすい面があることを考慮し、pack を使いたくない人
  # に別解を示すためです。
  # 
  # : 数値(文字コード)の配列を文字列に変換する例
  # //emlist[][ruby]{
  # [82, 117, 98, 121].pack("cccc")  # => "Ruby"
  # [82, 117, 98, 121].pack("c4")    # => "Ruby"
  # [82, 117, 98, 121].pack("c*")    # => "Ruby"
  # 
  # s = ""
  # [82, 117, 98, 121].each {|c| s << c}
  # s    # => "Ruby"
  # 
  # [82, 117, 98, 121].collect {|c| sprintf "%c", c}.join   # => "Ruby"
  # 
  # [82, 117, 98, 121].inject("") {|s, c| s << c}    # => "Ruby"
  # //}
  # 
  # : 文字列を数値(文字コード)の配列に変換する例
  # //emlist[][ruby]{
  # "Ruby".unpack('C*')    # => [82, 117, 98, 121]
  # 
  # a = []
  # "Ruby".each_byte {|c| a << c}
  # a    # => [82, 117, 98, 121]
  # //}
  # 
  # : "x" でヌルバイトを埋めることができる
  # //emlist[][ruby]{
  # [82, 117, 98, 121].pack("ccxxcc")    # => "Ru\x00\x00by"
  # //}
  # 
  # : "x" で文字を読み飛ばす事が出来る
  # //emlist[][ruby]{
  # "Ru\x00\x00by".unpack('ccxxcc')    # => [82, 117, 98, 121]
  # //}
  # 
  # : Hexダンプを数値の配列に変換する例
  # //emlist[][ruby]{
  # "61 62 63 64 65 66".delete(' ').lines.pack('H*').unpack('C*')
  # # => [97, 98, 99, 100, 101, 102]
  # 
  # "61 62 63 64 65 66".split.collect {|c| c.hex}
  # # => [97, 98, 99, 100, 101, 102]
  # //}
  # 
  # : バイナリと16進数のpackでは長さ指定は生成されるバイト数ではなく、ビットやニブルの個数を表す
  # //emlist[][ruby]{
  # [0b01010010, 0b01110101, 0b01100010, 0b01111001].pack("C4")
  # # => "Ruby"
  # ["01010010011101010110001001111001"].pack("B32") # 8 bits * 4
  # # => "Ruby"
  # 
  # [0x52, 0x75, 0x62, 0x79].pack("C4")
  # # => "Ruby"
  # ["52756279"].pack("H8")  # 2 nybbles * 4
  # # => "Ruby"
  # //}
  # 
  # : テンプレート文字'a'の長さ指定は1つの文字列だけに適用される
  # //emlist[][ruby]{
  # ["RUBY", "u", "b", "y"].pack("a4")
  # # => "RUBY"
  # 
  # ["RUBY", "u", "b", "y"].pack("aaaa")
  # # => "Ruby"
  # 
  # ["RUBY", "u", "b", "y"].pack("a*aaa")
  # # => "RUBYuby"
  # //}
  # 
  # : テンプレート文字"a"は、長さが足りない分をヌル文字で補う
  # //emlist[][ruby]{
  # ["Ruby"].pack("a8")
  # # => "Ruby\x00\x00\x00\x00"
  # //}
  # 
  # : リトルエンディアンとビッグエンディアン
  # //emlist[][ruby]{
  # [1,2].pack("s2")
  # # => "\x01\x00\002\x00" # リトルエンディアンのシステムでの出力
  # # => "\x00\x01\x00\002" # ビッグエンディアンのシステムでの出力
  # 
  # [1,2].pack("n2")
  # # => "\x00\x01\x00\002" # システムによらずビッグエンディアン
  # 
  # [1,2].pack("v2")
  # # => "\x01\x00\002\x00" # システムによらずリトルエンディアン
  # //}
  # 
  # : ネットワークバイトオーダの signed long
  # //emlist[][ruby]{
  # s = "\xFF\xFF\xFF\xFE"
  # n = s.unpack("N")[0]
  # if n[31] == 1
  #   n = -((n ^ 0xffff_ffff) + 1)
  # end
  # n # => -2
  # //}
  # 
  # : ネットワークバイトオーダの signed long(その2)
  # //emlist[][ruby]{
  # s = "\xFF\xFF\xFF\xFE"
  # n = s.unpack("N").pack("l").unpack("l")[0]
  # n # => -2
  # //}
  # 
  # : IPアドレス
  # //emlist[][ruby]{
  # require 'socket'
  # official_hostname, alias_hostnames, address_family, *address_list = Socket.gethostbyname("localhost")
  # address_list.find {|address| address.size == 4 }.unpack("C4").join(".")
  # # => "127.0.0.1"
  # 
  # "127.0.0.1".split(".").collect {|c| c.to_i}.pack("C4")
  # # => "\x7F\x00\x00\x01"
  # //}
  # 
  # : sockaddr_in 構造体
  # //emlist[][ruby]{
  # require 'socket'
  # [Socket::AF_INET,
  #  Socket.getservbyname('echo'),
  #  127, 0, 0, 1].pack("s n C4 x8")
  # # => "\x02\x00\x00\a\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   pack/unpack を使う代わりに
  #   [[m:Socket.pack_sockaddr_in]],
  #   [[m:Socket.unpack_sockaddr_in]] メソッドがあります。
  # 
  # : '\0'終端文字列のアドレス
  # 
  #   テンプレート文字 "p" や "P" は、C 言語レベルのインタフェースのた
  #   めにあります(例えば [[m:IO#ioctl]])。
  # //emlist[][ruby]{
  # ["foo"].pack("p")    # => "xp\xC2\x85\vV\x00\x00"
  # //}
  # 
  #   結果の文字列はゴミに見えますが、実際は文字列"foo\0"を指すアドレ
  #   ス(のバイナリ表現)です。以下のようにすれば見慣れた表記で見ること
  #   が出来ます
  # //emlist[][ruby]{
  # printf "%#014x\n", "xp\xC2\x85\vV\x00\x00".unpack("J")[0] # => 0x560b85c27078
  # //}
  # 
  #   アドレスが指す先のオブジェクト(この例で "foo\0") は、pack の結
  #   果が GC されるまではGCされないことが保証されています。
  # 
  #   unpack("p"), unpack("P") は、pack の結果からしか unpack できません。
  # //emlist[][ruby]{
  # ["foo"].pack("p").unpack("p") # => ["foo"]
  # "xp\xC2\x85\vV\x00\x00".unpack("p")
  # # => ArgumentError: no associated pointer
  # //}
  #   "p" や "P" は、nil を特別に扱い NULL
  #   ポインタとして解釈します。(以下は、64bitマシンで一般的な結果)
  # //emlist[][ruby]{
  # [nil].pack("p")        # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # "\x00\x00\x00\x00\x00\x00\x00\x00".unpack("p") # => [nil]
  # //}
  # 
  # : 構造体のアドレス
  # 
  #   例えば、
  # //emlist{
  #       struct {
  #         int   a;
  #         short b;
  #         long  c;
  #       } v = {1,2,3};
  # //}
  #   を表す文字列は
  # //emlist[][ruby]{
  # v = [1,2,3].pack("i!s!l!")
  # //}
  #   です。(byte alignment の問題から実際は適当な padding が必要に
  #   なるかもしれません)
  # 
  #   この構造体を指すアドレスは
  # //emlist[][ruby]{
  # [v].pack("P")  # => "\xC0\xCC2L\fV\x00\x00"
  # //}
  #   で得られます。
  # 
  # : UTF-8からUCS-2への変換 (サロゲートを処理していないので UTF-16 とはいえない)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # ("Comments").unpack("U*").pack("v*") # => "C\x00o\x00m\x00m\x00e\x00n\x00t\x00s\x00"
  # //}
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # ("Comments").unpack("U*").pack("n*") # => "\x00C\x00o\x00m\x00m\x00e\x00n\x00t\x00s"
  # //}
  # 
  # @see [[m:String#unpack]], [[m:String#unpack1]]
  def pack; end

  # --- permutation(n = self.length) { |p| block }       -> Array
  # --- permutation(n = self.length)                     -> Enumerator
  # 
  # サイズ n の順列をすべて生成し，それを引数としてブロックを実行します。
  # 
  # 引数を省略した場合は配列の要素数と同じサイズの順列に対してブロックを実
  # 行します。
  # 
  # 得られる順列の順序は保証されません。ブロックなしで呼び出されると， 順列
  # を生成する [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param n 生成する配列のサイズを整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3]
  # a.permutation.to_a     #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  # a.permutation(1).to_a  #=> [[1],[2],[3]]
  # a.permutation(2).to_a  #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
  # a.permutation(3).to_a  #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  # a.permutation(0).to_a  #=> [[]]: one permutation of length 0
  # a.permutation(4).to_a  #=> []  : no permutations of length 4
  # //}
  # 
  # @see [[m:Array#combination]], [[m:Array#repeated_permutation]]
  def permutation; end

  # --- pop    -> object | nil
  # --- pop(n) -> Array
  # 
  # 自身の末尾から要素を取り除いてそれを返します。
  # 引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  # 
  # 空配列の場合、n が指定されていない場合は nil を、
  # 指定されている場合は空配列を返します。
  # また、n が自身の要素数より少ない場合はその要素数の配列を
  # 返します。どちらの場合も自身は空配列となります。
  # 
  # 返す値と副作用の両方を利用して、個数を指定して配列を 2 分する簡単な方法として使えます。
  # 
  # @param n 自身から取り除きたい要素の個数を整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # array = [1, [2, 3], 4]
  # p array.pop      # => 4
  # p array.pop      # => [2, 3]
  # p array          # => [1]
  # 
  # p array.pop      # => 1
  # p array.pop      # => nil
  # p array          # => []
  # array = [1, 2, 3]
  # p array.pop(2)   #=> [2, 3]
  # p array          #=> [1]
  # //}
  # 
  # @see [[m:Array#push]], [[m:Array#shift]], [[m:Array#unshift]]
  def pop; end

  # --- unshift(*obj)        -> self
  # --- prepend(*obj)        -> self
  # 
  # 指定された obj を引数の最後から順番に配列の先頭に挿入します。
  # 引数を指定しなければ何もしません。
  # 
  # @param obj 自身に追加したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # arr = [1,2,3]
  # arr.unshift 0
  # p arr             #=> [0, 1, 2, 3]
  # arr.unshift [0]
  # p arr             #=> [[0], 0, 1, 2, 3]
  # arr.unshift 1, 2
  # p arr             #=> [1, 2, [0], 0, 1, 2, 3]
  # //}
  # 
  # @see [[m:Array#push]], [[m:Array#pop]], [[m:Array#shift]]
  def prepend; end

  # --- product(*lists)    -> Array
  # --- product(*lists) { |e| ... }   -> self
  # 
  # レシーバの配列と引数で与えられた配列（複数可）のそれぞれから要素を1
  # 個ずつとって配列とし，それらのすべての配列を要素とする配列を返します。
  # 
  # 返される配列の長さは，レシーバと引数で与えられた配列の長さのすべての積にな
  # ります。
  # 
  # 
  # @param lists 配列。複数指定可能。
  # 
  # //emlist[例][ruby]{
  # [1,2,3].product([4,5])     # => [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
  # [1,2].product([1,2])       # => [[1,1],[1,2],[2,1],[2,2]]
  # [1,2].product([3,4],[5,6]) # => [[1,3,5],[1,3,6],[1,4,5],[1,4,6],
  #                            #     [2,3,5],[2,3,6],[2,4,5],[2,4,6]]
  # [1,2].product()            # => [[1],[2]]
  # [1,2].product([])          # => []
  # //}
  # 
  # ブロックが与えられた場合、作成した配列の各要素を引数としてブロックを実
  # 行して self を返します。
  # 
  # //emlist[例][ruby]{
  # a = []
  # [1,2,3].product([4,5]) {|e| a << e} # => [1,2,3]
  # a # => [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
  # //}
  def product; end

  # --- rassoc(obj)    -> Array | nil
  # 
  # 自身が配列の配列であると仮定して、要素の配列でインデックス
  # 1 の要素が obj に等しいものを検索し見つかった最初の要素を返
  # します。該当する要素がなければ nil を返します。
  # 
  # 比較は == 演算子を使って行われます。
  # 
  # @param obj 検索するオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # a = [[15,1], [25,2], [35,3]]
  # p a.rassoc(2)    # => [25, 2]
  # //}
  # 
  # @see [[m:Array#assoc]]
  def rassoc; end

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
  # [1, 2, 3, 4, 5, 6].reject {|i| i % 2 == 0 }  # => [1, 3, 5]
  # //}
  # 
  # @see [[m:Array#select]], [[m:Enumerable#reject]]
  # @see [[m:Enumerable#grep_v]]
  def reject; end

  # --- repeated_combination(n) { |c| ... } -> Array
  # --- repeated_combination(n)             -> Enumerator
  # 
  # サイズ n の重複組み合わせをすべて生成し、それを引数としてブロックを実行
  # します。
  # 
  # 得られる組み合わせの順序は保証されません。ブロックなしで呼び出されると、
  # 組み合わせを生成する Enumerator オブジェクトを返します。
  # 
  # @param n 生成される配列のサイズを整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3]
  # a.repeated_combination(1).to_a  #=> [[1], [2], [3]]
  # a.repeated_combination(2).to_a  #=> [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
  # a.repeated_combination(3).to_a  #=> [[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],
  #                                 #    [1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]]
  # a.repeated_combination(4).to_a  #=> [[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,2],[1,1,2,3],
  #                                 #    [1,1,3,3],[1,2,2,2],[1,2,2,3],[1,2,3,3],[1,3,3,3],
  #                                 #    [2,2,2,2],[2,2,2,3],[2,2,3,3],[2,3,3,3],[3,3,3,3]]
  # a.repeated_combination(0).to_a  #=> [[]] # one combination of length 0
  # //}
  # 
  # @see [[m:Array#repeated_permutation]], [[m:Array#combination]]
  def repeated_combination; end

  # --- repeated_permutation(n) { |p| ... } -> Array
  # --- repeated_permutation(n)             -> Enumerator
  # 
  # サイズ n の重複順列をすべて生成し，それを引数としてブロックを実行します。
  # 
  # 得られる順列の順序は保証されません。ブロックなしで呼び出されると， 順列
  # を生成する Enumerator オブジェクトを返します。
  # 
  # @param n 生成する配列のサイズを整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2]
  # a.repeated_permutation(1).to_a  #=> [[1], [2]]
  # a.repeated_permutation(2).to_a  #=> [[1,1],[1,2],[2,1],[2,2]]
  # a.repeated_permutation(3).to_a  #=> [[1,1,1],[1,1,2],[1,2,1],[1,2,2],
  #                                 #    [2,1,1],[2,1,2],[2,2,1],[2,2,2]]
  # a.repeated_permutation(0).to_a  #=> [[]] # one permutation of length 0
  # //}
  # 
  # @see [[m:Array#repeated_combination]], [[m:Array#permutation]]
  def repeated_permutation; end

  # --- replace(another)    -> self
  # 
  # 配列の内容を配列 another の内容で置き換えます。
  # 
  # @param another 配列を指定します。
  #                配列以外のオブジェクトを指定した場合は to_ary メソッドに
  #                よる暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3]
  # a.replace [4, 5, 6]
  # p a                 #=> [4, 5, 6]
  # //}
  def replace; end

  # --- reverse     -> Array
  # --- reverse!    -> self
  # 
  # reverse は自身の要素を逆順に並べた新しい配列を生成して返します。
  # reverse! は自身を破壊的に並べ替えます。
  # reverse! は self を返します。
  # 
  # //emlist[例][ruby]{
  # a = ["a", 2, true]
  # p a.reverse         #=> [true, 2, "a"]
  # p a                 #=> ["a", 2, true] (変化なし)
  # 
  # a = ["a", 2, true]
  # p a.reverse!        #=> [true, 2, "a"]
  # p a                 #=> [true, 2, "a"]
  # //}
  def reverse; end

  # --- reverse_each {|item| ... }    -> self
  # --- reverse_each                  -> Enumerator
  # 
  # 各要素に対して逆順にブロックを評価します。
  # 
  # ブロックが与えられなかった場合は、自身と reverse_each から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c" ]
  # a.reverse_each {|x| print x, " " }
  # # => c b a
  # //}
  # 
  # @see [[m:Array#each]]
  def reverse_each; end

  # --- rindex(val)           -> Integer | nil
  # --- rindex {|item| ... }  -> Integer | nil
  # --- rindex                -> Enumerator
  # 
  # 指定された val と == で等しい最後の要素の位置を返します。
  # 等しい要素がひとつもなかった時には nil を返します。
  # 
  # ブロックが与えられた時には、各要素を右(末尾)から順に引数としてブロックを実行し、
  # ブロックが真を返す最初の要素の位置を返します。
  # ブロックが真を返す要素がなかった時には nil を返します。
  # 
  # 引数、ブロックのどちらも与えられなかった時には、自身と rindex から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param val オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # p [1, 0, 0, 1, 0].rindex(1)   #=> 3
  # p [1, 0, 0, 0, 0].rindex(1)   #=> 0
  # p [0, 0, 0, 0, 0].rindex(1)   #=> nil
  # p [0, 1, 0, 1, 0].rindex {|v| v > 0}   #=> 3
  # //}
  # 
  # @see [[m:Array#index]]
  def rindex; end

  # --- rotate(cnt = 1) -> Array
  # 
  # cnt で指定したインデックスの要素が先頭になる配列を新しく作成します。
  # cnt より前の要素は末尾に移動します。cnt に負の数を指定した場合、逆の操
  # 作を行います。
  # 
  # @param cnt 先頭にする要素のインデックスを指定します。指定しなかった場合
  #            は 1 になります。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c", "d" ]
  # a.rotate         # => ["b", "c", "d", "a"]
  # a                # => ["a", "b", "c", "d"]
  # a.rotate(2)      # => ["c", "d", "a", "b"]
  # a.rotate(-1)     # => ["d", "a", "b", "c"]
  # a.rotate(-3)     # => ["b", "c", "d", "a"]
  # //}
  # 
  # @see [[m:Array#rotate!]]
  def rotate; end

  # --- rotate!(cnt = 1) -> self
  # 
  # cnt で指定したインデックスの要素が先頭になるように自身の順番を変更しま
  # す。cnt より前の要素は末尾に移動します。cnt に負の数を指定した場合、逆
  # の操作を行います。
  # 
  # @param cnt 先頭にする要素のインデックスを指定します。指定しなかった場合
  #            は 1 になります。
  #            整数以外のオブジェクトを指定した場合は to_int メソッドによる
  #            暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c", "d" ]
  # a.rotate!        #=> ["b", "c", "d", "a"]
  # a                #=> ["b", "c", "d", "a"]
  # a.rotate!(2)     #=> ["d", "a", "b", "c"]
  # a.rotate!(-3)    #=> ["a", "b", "c", "d"]
  # //}
  # 
  # @see [[m:Array#rotate]]
  def rotate!; end

  # --- sample        -> object | nil
  # --- sample(n)     -> Array
  # --- sample(random: Random)    -> object | nil
  # --- sample(n, random: Random) -> Array
  # 
  # 配列の要素を1個(引数を指定した場合は自身の要素数を越えない範囲で n 個)
  # ランダムに選んで返します。
  # 
  # 重複したインデックスは選択されません。そのため、自身がユニークな配列の
  # 場合は返り値もユニークな配列になります。
  # 
  # 配列が空の場合、無引数の場合は nil を、個数を指定した場合は空配列を返します。
  # 
  # srand()が有効です。
  # 
  # @param n 取得する要素の数を指定します。自身の要素数(self.length)以上の
  #          値を指定した場合は要素数と同じ数の配列を返します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # 
  # @param random 乱数生成器(主に [[c:Random]] オブジェクト)を指定します。
  #               選択する要素のインデックスを返す rand メソッドに応答する
  #               オブジェクトであれば指定する事ができます。rand メソッド
  #               の引数には [[m:Random#rand]](max) のように選択可能なイン
  #               デックスの最大値が指定されます。
  #               [[m:Kernel.#rand]]、[[c:Random]] を使用しないオブジェク
  #               トを指定した場合、[[m:Kernel.#srand]]の指定に影響されません。
  # 
  # @raise TypeError 引数 n に整数以外の(暗黙の型変換が行えない)オブジェク
  #                  トを指定した場合に発生します。
  # 
  # @raise ArgumentError 引数 n に負の数を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = (1..10).to_a
  # p a.sample        #=>  9
  # p a.sample        #=> 10
  # p a.sample(3)     #=> [1, 9, 3]
  # p a               #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  # //}
  def sample; end

  # --- shelljoin -> String
  # 配列の各要素である文字列に対して、Bourne シェルのコマンドライン中で安全に
  # 使えるためのエスケープを適用し、空白文字を介してそれらを連結したコマンド
  # ライン文字列を生成します。
  # 
  # array.shelljoin は、Shellwords.shelljoin(array) と等価です。
  # 
  # @return エスケープ結果を連結した文字列を返します。
  # @see [[m:Shellwords.#shelljoin]]
  def shelljoin; end

  # --- shift -> object | nil
  # --- shift(n) -> Array
  # 
  # 配列の先頭の要素を取り除いてそれを返します。
  # 引数を指定した場合はその個数だけ取り除き、それを配列で返します。
  # 
  # 空配列の場合、n が指定されていない場合は nil を、
  # 指定されている場合は空配列を返します。
  # また、n が自身の要素数より少ない場合はその要素数の配列を
  # 返します。どちらの場合も自身は空配列となります。
  # 
  # 返す値と副作用の両方を利用して、個数を指定して配列を 2 分する簡単な方法として使えます。
  # 
  # @param n 自身から取り除きたい要素の個数を非負整数で指定します。
  #          整数以外のオブジェクトを指定した場合は to_int メソッドによる暗
  #          黙の型変換を試みます。
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError 引数に負の数を指定した場合に発生します。
  # 
  # 
  # 
  # //emlist[例][ruby]{
  # a = [0, 1, 2, 3, 4]
  # p a.shift            #=> 0
  # p a                  #=> [1, 2, 3, 4]
  # 
  # p [].shift           #=> nil
  # p [].shift(1)        #=> []
  # //}
  # 
  # @see [[m:Array#push]], [[m:Array#pop]], [[m:Array#unshift]]
  def shift; end

  # --- shuffle -> Array
  # --- shuffle(random: Random) -> Array
  # 
  # 配列の要素をランダムシャッフルして，その結果を配列として返します。
  # 
  # 引数に [[c:Random]] オブジェクトを渡すことでそのオブジェクトが
  # 生成する擬似乱数列を用いることができます。
  # 
  # //emlist[例][ruby]{
  # a = [ 1, 2, 3 ]           #=> [1, 2, 3]
  # a.shuffle                 #=> [2, 3, 1]
  # rng = Random.new
  # rng2 = rng.dup # RNGを複製
  # # 以下の2つは同じ結果を返す
  # [1,2,3].shuffle(random: rng)
  # [1,2,3].shuffle(random: rng2)
  # //}
  # 
  # @see [[m:Array#shuffle!]]
  def shuffle; end

  # --- shuffle!        -> self
  # --- shuffle!(random: Random) -> self
  # 
  # 配列を破壊的にランダムシャッフルします。
  # 
  # @param random 乱数生成器(主に [[c:Random]] オブジェクト)を指定します。
  #               選択する要素のインデックスを返す rand メソッドに応答する
  #               オブジェクトであれば指定する事ができます。rand メソッド
  #               の引数には [[m:Random#rand]](max) のように選択可能なイン
  #               デックスの最大値が指定されます。
  #               [[m:Kernel.#rand]]、[[c:Random]] を使用しないオブジェク
  #               トを指定した場合、[[m:Kernel.#srand]]の指定に影響されま
  #               せん。
  # 
  # //emlist[例][ruby]{
  # a = [ 1, 2, 3 ]           #=> [1, 2, 3]
  # a.shuffle!                #=> [2, 3, 1]
  # a                         #=> [2, 3, 1]
  # //}
  # 
  # @see [[m:Array#shuffle]]
  def shuffle!; end

  # --- slice(nth)       -> object | nil
  # 
  # 指定された自身の要素を返します。[[m:Array#[] ]] と同じです。
  # 
  # @param nth 要素のインデックスを整数で指定します。[[m:Array#[] ]] と同じです。
  # 
  # //emlist[例][ruby]{
  # p [0, 1, 2].slice(1)    #=> 1
  # p [0, 1, 2].slice(2)    #=> 2
  # p [0, 1, 2].slice(10)   #=> nil
  # //}
  # 
  # --- slice(pos, len)  -> Array | nil
  # --- slice(range)     -> Array | nil
  # 
  # 指定された自身の部分配列を返します。[[m:Array#[] ]] と同じです。
  # 
  # @param pos [[m:Array#[] ]] と同じです。
  # 
  # @param len [[m:Array#[] ]] と同じです。
  # 
  # @param range [[m:Array#[] ]] と同じです。
  # 
  # //emlist[例][ruby]{
  # p [0, 1, 2].slice(0, 2)    #=> [0, 1]
  # p [0, 1, 2].slice(2..3)    #=> [2]
  # p [0, 1, 2].slice(10, 1)   #=> nil
  # //}
  def slice; end

  # --- slice!(nth)       -> object | nil
  # 
  # 指定した要素を自身から取り除き、取り除いた要素を返します。取り除く要素がなければ nil
  # を返します。
  # 
  # @param nth 取り除く要素のインデックスを整数で指定します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c" ]
  # a.slice!(1)     #=> "b"
  # a               #=> ["a", "c"]
  # a.slice!(-1)    #=> "c"
  # a               #=> ["a"]
  # a.slice!(100)   #=> nil
  # a               #=> ["a"]
  # //}
  # 
  # --- slice!(start, len)  -> Array | nil
  # --- slice!(range)     -> Array | nil
  # 
  # 指定した部分配列を自身から取り除き、取り除いた部分配列を返します。取り除く要素がなければ nil
  # を返します。
  # 
  # @param start 削除したい部分配列の先頭のインデックスを整数で指定します。
  # 
  # @param len 削除したい部分配列の長さを整数で指定します。
  # 
  # @param range 削除したい配列の範囲を [[c:Range]] オブジェクトで指定します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b", "c" ]
  # a.slice!(1, 2)     #=> ["b", "c"]
  # a                  #=> ["a"]
  # 
  # a = [ "a", "b", "c" ]
  # a.slice!(1, 0)     #=> []
  # a                  #=> [ "a", "b", "c" ]
  # //}
  def slice!; end

  # --- sort                -> Array
  # --- sort!               -> self
  # --- sort {|a, b| ... }  -> Array
  # --- sort! {|a, b| ... } -> self
  # 
  # 配列の内容をソートします。要素同士の比較は <=> 演算子を使って行います。sort はソートされた配列を生成して返します。
  # sort! は self を破壊的にソートし、self を返します。
  # 
  # ブロックとともに呼び出された時には、要素同士の比較をブロックを用いて行います。
  # ブロックに2つの要素を引数として与えて評価し、その結果で比較します。
  # ブロックは <=> 演算子と同様に整数を返すことが期待されています。つまり、
  # ブロックは第1引数が大きいなら正の整数、両者が等しいなら0、そして第1引数の方が小さいなら
  # 負の整数を返さなければいけません。両者を比較できない時は nil を返します。
  # 
  # //emlist[例][ruby]{
  # ary1 = [ "d", "a", "e", "c", "b" ]
  # p ary1.sort                             #=> ["a", "b", "c", "d", "e"]
  # 
  # ary2 = ["9", "7", "10", "11", "8"]
  # p ary2.sort                             #=> ["10", "11", "7", "8", "9"] (文字列としてソートするとこうなる)
  # p ary2.sort{|a, b| a.to_i <=> b.to_i }  #=> ["7", "8", "9", "10", "11"] (ブロックを使って数字としてソート)
  # 
  # # sort_by を使っても良い
  # p ary2.sort_by{|x| x.to_i }             #=> ["7", "8", "9", "10", "11"]
  # //}
  # 
  # @see [[m:Enumerable#sort_by]]
  #      , [[m:Array#sort_by!]]
  def sort; end

  # --- sort_by!               -> Enumerator
  # --- sort_by! {|item| ... } -> self
  # sort_by の破壊的バージョンです。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # fruits = %w{apple pear fig}
  # fruits.sort_by! { |word| word.length }
  # fruits # => ["fig", "pear", "apple"]
  # //}
  # 
  # @see [[m:Enumerable#sort_by]]
  def sort_by!; end

  # --- sum(init=0)                    -> object
  # --- sum(init=0) {|e| expr }        -> object
  # 
  # 要素の合計を返します。例えば [e1, e2, e3].sum は init + e1 + e2 + e3 を返します。
  # 
  # ブロックが与えられた場合、加算する前に各要素にブロックが適用されます。
  # 
  # 配列が空の場合、initを返します。
  # 
  # //emlist[例][ruby]{
  # [].sum                             #=> 0
  # [].sum(0.0)                        #=> 0.0
  # [1, 2, 3].sum                      #=> 6
  # [3, 5.5].sum                       #=> 8.5
  # [2.5, 3.0].sum(0.0) {|e| e * e }   #=> 15.25
  # [Object.new].sum                   #=> TypeError
  # //}
  # 
  # 配列の平均値は以下のように求められます。
  # 
  # //emlist[例][ruby]{
  # mean = ary.sum(0.0) / ary.length
  # //}
  # 
  # init 引数を明示的に指名すると数値以外のオブジェクトにも使えます。
  # 
  # //emlist[例][ruby]{
  # ["a", "b", "c"].sum("")            #=> "abc"
  # [[1], [[2]], [3]].sum([])          #=> [1, [2], 3]
  # //}
  # 
  # しかし、文字列の配列や配列の配列の場合 Array#join や Array#flatten の方が Array#sum よりも高速です。
  # 
  # //emlist[例][ruby]{
  # ["a", "b", "c"].join               #=> "abc"
  # [[1], [[2]], [3]].flatten(1)       #=> [1, [2], 3]
  # //}
  # 
  # "+" メソッドが再定義されている場合、Array#sum は再定義を無視することがあります(例えばInteger#+)。
  # 
  # @see [[m:Enumerable#sum]]
  def sum; end

  # --- take(n)               -> Array
  # 
  # 配列の先頭から n 要素を配列として返します。
  # このメソッドは自身を破壊的に変更しません。
  # 
  # @param n 要素数を指定します。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5, 0]
  # a.take(3)             # => [1, 2, 3]
  # //}
  # 
  # @see [[m:Enumerable#take]]
  def take; end

  # --- take_while                    -> Enumerator
  # --- take_while {|element| ... }   -> Array
  # 
  # 配列の要素を順に偽になるまでブロックで評価します。
  # 最初に偽になった要素の手前の要素までを配列として返します。
  # このメソッドは自身を破壊的に変更しません。
  # 
  # //emlist[例][ruby]{
  # a = [1, 2, 3, 4, 5, 0]
  # a.take_while {|i| i < 3 }   # => [1, 2]
  # //}
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @see [[m:Enumerable#take_while]]
  def take_while; end

  # --- to_a       -> Array
  # 
  # self を返します。ただし、Array のサブクラスのインスタンスに対して呼ばれた時は、
  # 自身を Array に変換したものを返します。
  # 
  # //emlist[例][ruby]{
  # class SubArray < Array; end
  # ary1 = Array([1, 2, 3, 4])
  # ary2 = SubArray([1, 2, 3, 4])
  # 
  # ary1.to_a        # => [1, 2, 3, 4]
  # ary1.to_a.class  # => Array
  # 
  # ary2.to_a        # => [1, 2, 3, 4]
  # ary2.to_a.class  # => Array
  # //}
  # 
  # @see [[m:Array#to_ary]]
  def to_a; end

  # --- to_ary  -> self
  # 
  # self をそのまま返します。
  # 
  # //emlist[例][ruby]{
  # class SubArray < Array; end
  # ary1 = Array([1, 2, 3, 4])
  # ary2 = SubArray([1, 2, 3, 4])
  # 
  # ary1.to_ary        # => [1, 2, 3, 4]
  # ary1.to_ary.class  # => Array
  # 
  # ary2.to_ary        # => [1, 2, 3, 4]
  # ary2.to_ary.class  # => SubArray
  # //}
  # 
  # @see [[m:Array#to_a]]
  def to_ary; end

  # --- to_csv(**options) -> String
  # 
  # CSV.generate_line(self, options) と同様です。
  # 
  # Array オブジェクトを 1 行の CSV 文字列に変換するためのショートカットです。
  # 
  # @param options [[m:CSV.generate_line]] と同様のオプションを指定します。
  # 
  # //emlist[][ruby]{
  # require 'csv'
  # 
  # p [1, 'Matz', :Ruby, Date.new(1965, 4, 14)].to_csv                                 # => "1,Matz,Ruby,1965-04-14\n"
  # p [1, 'Matz', :Ruby, Date.new(1965, 4, 14)].to_csv(col_sep: ' ', row_sep: "\r\n")  # => "1 Matz Ruby 1965-04-14\r\n"
  # //}
  # 
  # 
  # @see [[m:CSV.generate_line]]
  def to_csv; end

  # --- to_h -> Hash
  # --- to_h { block } -> Hash
  # 
  # self を [key, value] のペアの配列として解析した結果を [[c:Hash]] にして
  # 返します。
  # 
  # //emlist[例][ruby]{
  # [[:foo, :bar], [1, 2]].to_h # => {:foo => :bar, 1 => 2}
  # //}
  # 
  # ブロックを指定すると配列の各要素でブロックを呼び出し、
  # その結果をペアとして使います。
  # 
  # //emlist[ブロック付きの例][ruby]{
  # ["foo", "bar"].to_h {|s| [s.ord, s]} # => {102=>"foo", 98=>"bar"}
  # //}
  def to_h; end

  # --- transpose    -> Array
  # 
  # 自身を行列と見立てて、行列の転置(行と列の入れ換え)を行いま
  # す。転置した配列を生成して返します。空の配列に対しては空の配列を生
  # 成して返します。
  # 
  # それ以外の一次元の配列に対しては、例外
  # [[c:TypeError]] が発生します。各要素のサイズが不揃いな配列に対して
  # は、例外 [[c:IndexError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # p [[1,2],
  #    [3,4],
  #    [5,6]].transpose
  # # => [[1, 3, 5], [2, 4, 6]]
  # 
  # p [].transpose
  # # => []
  # 
  # p [1,2,3].transpose
  # 
  # # => -:1:in `transpose': cannot convert Fixnum into Array (TypeError)
  # #       from -:1
  # 
  # p [[1,2],
  #    [3,4,5],
  #    [6,7]].transpose
  # # => -:3:in `transpose': element size differ (3 should be 2) (IndexError)
  # //}
  def transpose; end

  # --- union(*other_arrays) -> Array
  # 
  # 集合の和演算です。self と other_arrays の配列にどれかに含まれる要素を
  # 全て含む新しい配列を返します。重複する要素は取り除かれます。
  # 
  # 要素の重複判定は、[[m:Object#eql?]] と [[m:Object#hash]] により行われます。
  # 
  # @param other_arrays 0個以上の配列を指定します。
  # 
  # //emlist[例][ruby]{
  # ["a", "b", "c"].union([ "c", "d", "a" ])    #=> ["a", "b", "c", "d"]
  # ["a"].union(["e", "b"], ["a", "c", "b"])    #=> ["a", "e", "b", "c"]
  # ["a"].union # => ["a"]
  # //}
  # 
  # @see [[m:Array#|]]
  def union; end

  # --- uniq     -> Array
  # --- uniq!    -> self | nil
  # --- uniq {|item| ... } -> Array
  # --- uniq! {|item| ... } -> self | nil
  # 
  # uniq は配列から重複した要素を取り除いた新しい配列を返します。
  # uniq! は削除を破壊的に行い、削除が行われた場合は self を、
  # そうでなければnil を返します。
  # 
  # 取り除かれた要素の部分は前に詰められます。
  # 要素の重複判定は、[[m:Object#eql?]] により行われます。
  # 
  # //emlist[例][ruby]{
  # p [1, 1, 1].uniq         # => [1]
  # p [1, 4, 1].uniq         # => [1, 4]
  # p [1, 3, 2, 2, 3].uniq   # => [1, 3, 2]
  # //}
  # 
  # ブロックが与えられた場合、ブロックが返した値が重複した要素を取り除いた
  # 配列を返します。
  # 
  # //emlist[例][ruby]{
  # p [1, 3, 2, "2", "3"].uniq                # => [1, 3, 2, "2", "3"]
  # p [1, 3, 2, "2", "3"].uniq { |n| n.to_s } # => [1, 3, 2]
  # //}
  # 
  # 要素を先頭から辿っていき、最初に出現したものが残ります。
  def uniq; end

  # --- values_at(*selectors)    -> Array
  # 
  # 引数で指定されたインデックスに対応する要素を配列で返します。インデッ
  # クスに対応する値がなければ nil が要素になります。
  # 
  # @param selectors インデックスを整数もしくは整数の [[c:Range]] で指定します。
  # 
  # //emlist[例][ruby]{
  # ary = %w( a b c d e )
  # p ary.values_at( 0, 2, 4 )          #=> ["a", "c", "e"]
  # p ary.values_at( 3, 4, 5, 6, 35 )   #=> ["d", "e", nil, nil, nil]
  # p ary.values_at( 0, -1, -2 )        #=> ["a", "e", "d"]
  # p ary.values_at( -4, -5, -6, -35 )  #=> ["b", "a", nil, nil]
  # p ary.values_at( 1..2 )             #=> ["b", "c"]
  # p ary.values_at( 3..10 )            #=> ["d", "e", nil, nil, nil, nil, nil, nil]
  # p ary.values_at( 6..7 )             #=> [nil, nil]
  # p ary.values_at( 0, 3..5 )          #=> ["a", "d", "e", nil]
  # //}
  def values_at; end

  # --- zip(*lists)  -> [[object]]
  # --- zip(*lists) {|v1, v2, ...| ...} -> nil
  # 
  # 自身と引数に渡した配列の各要素からなる配列の配列を生成して返します。
  # 生成される配列の要素数は self の要素数と同じです。
  # 
  # ブロック付きで呼び出した場合は、
  # self と引数に渡した配列の各要素を順番にブロックに渡します。
  # 
  # @param lists 配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。to_ary メソッドに応答できない場
  #              合は each メソッドによる暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # 
  # //emlist[例][ruby]{
  # p [1,2,3].zip([4,5,6], [7,8,9])
  # # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  # 
  # p [1,2].zip([:a,:b,:c], [:A,:B,:C,:D])
  # # => [[1, :a, :A], [2, :b, :B]]
  # 
  # p [1,2,3,4,5].zip([:a,:b,:c], [:A,:B,:C,:D])
  # # => [[1, :a, :A], [2, :b, :B],
  # #     [3, :c, :C], [4, nil, :D], [5, nil, nil]]
  # 
  # p [1,2,3].zip([4,5,6], [7,8,9]) { |ary| p ary }
  # # => [1, 4, 7]
  # #    [2, 5, 8]
  # #    [3, 6, 9]
  # #    nil
  # //}
  def zip; end

  # --- |(other)    -> Array
  # 
  # 集合の和演算です。両方の配列にいずれかに含まれる要素を全て含む新し
  # い配列を返します。重複する要素は取り除かれます。
  # 
  # 要素の重複判定は、[[m:Object#eql?]] と [[m:Object#hash]] により行われます。
  # 
  # 新しい配列における要素の順は self における要素の順と同じです。
  # 
  # @param other 配列を指定します。
  #              配列以外のオブジェクトを指定した場合は to_ary メソッドによ
  #              る暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に配列以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # [1, 1, 4, 2, 3] | [5, 4, 5]  #=> [1, 4, 2, 3, 5]
  # //}
  # 
  # @see [[m:Array#&]]
  # @see [[m:Array#union]]
  def |; end

  # --- [](*item)    -> Array
  # 
  # 引数 item を要素として持つ配列を生成して返します。
  # 
  # [[c:Array]] のサブクラスを作成したしたときに、そのサブクラスのインスタンスを作成
  # しやすくするために用意されている。
  # 
  # @param item 配列の要素を指定します。
  # 
  # //emlist[例][ruby]{
  # Array[1, 2, 3] #=> [1, 2, 3]
  # 
  # class SubArray < Array
  #   # ...
  # end
  # p SubArray[1, 2, 3] # => [1, 2, 3]
  # //}
  def []; end

  # --- new(size = 0, val = nil)    -> Array
  # 
  # 長さ size の配列を生成し、各要素を val で初期化して返します。
  # 
  # 要素毎に val が複製されるわけではないことに注意してください。
  # 全要素が同じオブジェクト val を参照します。
  # 後述の例では、配列の各要素は全て同一の文字列を指します。
  # 
  # @param size 配列の長さを数値で指定します。
  # 
  # @param val 配列の要素の値を指定します。
  # 
  # //emlist[例][ruby]{
  # ary = Array.new(3, "foo")
  # p ary                     #=> ["foo", "foo", "foo"]
  # ary[0].capitalize!
  # p ary                     #=> ["Foo", "Foo", "Foo"]  (各要素は同一のオブジェクトである)
  # //}
  # 
  # --- new(ary)    -> Array
  # 
  # 指定された配列 ary を複製して返します。
  # [[m:Array#dup]] 同様 要素を複製しない浅い複製です。
  # 
  # @param ary 複製したい配列を指定します。
  # 
  # //emlist[例][ruby]{
  # p Array.new([1,2,3]) # => [1,2,3]
  # 
  # a = ["a", "b", "c"]
  # b = Array.new(a)
  # a.each{|s| s.capitalize! }
  # p a                        #=> ["A", "B", "C"]
  # p b                        #=> ["A", "B", "C"]   (b は a と要素を共有する)
  # //}
  # 
  # 
  # --- new(size) {|index| ... }    -> Array
  # 
  # 長さ size の配列を生成し、各要素のインデックスを引数としてブロックを実行し、
  # 各要素の値をブロックの評価結果に設定します。
  # 
  # ブロックは要素毎に実行されるので、全要素をあるオブジェクトの複製にすることができます。
  # 
  # @param size 配列の長さを数値で指定します。
  # 
  # //emlist[例][ruby]{
  # ary = Array.new(3){|index| "hoge#{index}"}
  # p ary                      #=> ["hoge0", "hoge1", "hoge2"]
  # //}
  # 
  # //emlist[例][ruby]{
  # ary = Array.new(3){ "foo" }
  # p ary                      #=> ["foo", "foo", "foo"]
  # ary[0].capitalize!
  # p ary                      #=> ["Foo", "foo", "foo"]  (各要素は違うオブジェクトである)
  # //}
  def new; end

  # --- try_convert(obj) -> Array | nil
  # to_ary メソッドを用いて obj を配列に変換しようとします。
  # 
  # 何らかの理由で変換できないときには nil を返します。
  # このメソッドは引数が配列であるかどうかを調べるために使えます。
  # 
  # //emlist[例][ruby]{
  # Array.try_convert([1])   # => [1]
  # Array.try_convert("1")   # => nil
  # 
  # if tmp = Array.try_convert(arg)
  #   # the argument is an array
  # elsif tmp = String.try_convert(arg)
  #   # the argument is a string
  # end
  # //}
  def try_convert; end

end
