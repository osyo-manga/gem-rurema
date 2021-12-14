class Range
  # --- step(s = 1) {|item| ... } -> self
  # --- step(s = 1) -> Enumerator
  # --- step(s = 1) -> Enumerator::ArithmeticSequence
  # --- %(s)        -> Enumerator
  # --- %(s)        -> Enumerator::ArithmeticSequence
  # 
  # 範囲内の要素を s おきに繰り返します。
  # 
  # @param s 各ステップの大きさを数値で指定します。負の数を指定することもできます。
  # @return ブロックを指定した時は self を返します。
  # @return ブロックを指定しなかった時かつ数値の Range の時は [[c:Enumerator::ArithmeticSequence]] を返します。
  # @return ブロックを指定しなかったその他の Range の時は [[c:Enumerator]] を返します。(例: String の Range)
  # 
  # //emlist[例][ruby]{
  # ("a" .. "f").step(2) {|v| p v}
  # # => "a"
  # #    "c"
  # #    "e"
  # //}
  def %; end

  # --- ==(other)     -> bool
  # 
  # 指定された other が Range クラスのインスタンスであり、
  # 始端と終端が == メソッドで比較して等しく、[[m:Range#exclude_end?]] が同じ場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # p (1..2) == (1..2)               # => true
  # p (1..2) == (1...2)              # => false
  # p (1..2) == Range.new(1.0, 2.0)  # => true
  # //}
  def ==; end

  # --- ===(obj) -> bool
  # 
  # 始端と終端の中に obj があるとき、true を返します。
  # そうでないとき、false を返します。
  # 
  # [[m:Range#===]] は主に case 式での比較に用いられます。
  # 
  # //emlist[例][ruby]{
  # p (0...50) === 79  #=> false
  # p (60...80) === 79 #=> true
  # 
  # case 79
  # when  0...60  then  puts "low"
  # when 60...80  then  puts "medium" # => medium
  # when 80..100  then  puts "high"
  # end
  # //}
  # 
  # 2.5 以前は、単純に [[m:Range#include?]] メソッドを内部で呼んでいました。
  # 
  # しかし、2.6 以降では、(文字列を除いて) [[m:Range#cover?]] と同様の処理をするように切り替わりました。
  # 
  # ただし、=== は、[[m:Range#cover?]] のように Range オブジェクトを引数にはとる設計はありません。
  # 
  # //emlist[例][ruby]{
  # require 'date'
  # p (Date.today - 100...Date.today + 100).include?(DateTime.now)  #=> false
  # p (Date.today - 100...Date.today + 100).cover?(DateTime.now)    #=> true
  # p (Date.today - 100...Date.today + 100) ===  DateTime.now       #=> true
  # # 2.5 以前は、=== は、include? と同じく比較できず false を返していました。
  # //}
  # 
  # 2.7 以降の === は、文字列も [[m:Range#cover?]] と同様の処理をするようになりました。
  # 
  # //emlist[例][ruby]{
  # p ('a'..'z').include? 'at'  #=> false
  # p ('a'..'z').cover? 'at'    #=> true
  # p ('a'..'z') === 'at'       #=> true
  # # 2.6 以前は、=== は、include? と同じく比較できず false を返していました。
  # //}
  # 
  # @see [[ref:d:spec/control#case]]
  # @see [[m:Range#include?]], [[m:Range#cover?]]
  def ===; end

  # --- begin -> object
  # --- first -> object
  # 
  # 始端の要素を返します。範囲オブジェクトが始端を含むかどうかは関係ありま
  # せん。
  # 
  # 
  # //emlist[例][ruby]{
  # p (1..5).begin # => 1
  # p (1..0).begin # => 1
  # //}
  # 
  # @see [[m:Range#end]]
  # 
  # --- first(n) -> [object]
  # 
  # 最初の n 要素を返します。範囲内に要素が含まれない場合は空の配列を返します。
  # 
  # @param n 取得する要素数を整数で指定します。整数以外のオブジェクトを指定
  #          した場合は to_int メソッドによる暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # (10..20).first(3)  # => [10, 11, 12]
  # //}
  # 
  # @see [[m:Range#last]], [[ruby-core:12697]]
  def begin; end

  # --- bsearch {|obj| ... } -> object | nil
  # --- bsearch              -> Enumerator
  # 
  # ブロックの評価結果で範囲内の各要素の大小判定を行い、条件を満たす値を二
  # 分探索(計算量は O(log n))で検索します。要素が見つからない場合は nil を
  # 返します。
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
  # 
  # //emlist[例][ruby]{
  # ary = [0, 4, 7, 10, 12]
  # (0...ary.size).bsearch {|i| ary[i] >= 4 } # => 1
  # (0...ary.size).bsearch {|i| ary[i] >= 6 } # => 2
  # (0...ary.size).bsearch {|i| ary[i] >= 8 } # => 3
  # (0...ary.size).bsearch {|i| ary[i] >= 100 } # => nil
  # 
  # (0.0...Float::INFINITY).bsearch {|x| Math.log(x) >= 0 } # => 1.0
  # //}
  # 
  # find-any モードは [[man:bsearch(3)]] のように動作します。ブロックは真偽値
  # ではなく、以下のような数値を返す必要があります。求める値の範囲がx...y
  # （x <= y）であるとします。また、ブロックパラメータの値を v とします。
  # 
  #  * ブロックパラメータの値が求める値の範囲よりも小さい（v < x）場合: 正の数を返す
  #  * ブロックパラメータの値が求める値の範囲に合致する（x <= v < y）場合: 0 を返す
  #  * ブロックパラメータの値が求める値の範囲よりも大きい（y <= v）場合: 負の数を返す
  # 
  # ブロックの評価結果が 0 になるいずれかの要素を返すか、nil を返します。
  # 
  # //emlist[例][ruby]{
  # ary = [0, 100, 100, 100, 200]
  # (0..4).bsearch {|i| 100 - ary[i] } # => 1, 2 or 3
  # (0..4).bsearch {|i| 300 - ary[i] } # => nil
  # (0..4).bsearch {|i|  50 - ary[i] } # => nil
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
  # @see [[m:Array#bsearch]]
  def bsearch; end

  # --- cover?(obj) -> bool
  # 
  # obj が範囲内に含まれている時に true を返します。
  # 
  # [[m:Range#include?]] と異なり <=> メソッドによる演算により範囲内かどうかを判定します。
  # [[m:Range#include?]] は原則として離散値を扱い、
  # Range#cover? は連続値を扱います。
  # （数値については、例外として [[m:Range#include?]] も連続的に扱います。）
  # 
  # [[m:Range#exclude_end?]]がfalseなら「begin <= obj <= end」を、
  # trueなら「begin <= obj < end」を意味します。
  # 
  # @param obj 比較対象のオブジェクトを指定します。
  # 
  # //emlist[数値は連続的に扱われているため、 include? / cover? が同じ結果を返す][ruby]{
  # (1.1..2.3).include?(1.0)    # => false
  # (1.1..2.3).include?(1.1)    # => true
  # (1.1..2.3).include?(1.555)  # => true
  # (1.1..2.3).cover?(1.0)      # => false
  # (1.1..2.3).cover?(1.1)      # => true
  # (1.1..2.3).cover?(1.555)    # => true
  # //}
  # 
  # //emlist[String の例][ruby]{
  # ('b'..'d').include?('d')    # => true
  # ('b'..'d').include?('ba')   # => false
  # ('b'..'d').cover?('d')      # => true
  # ('b'..'d').cover?('ba')     # => true
  # //}
  # 
  # //emlist[Date, DateTime の例][ruby]{
  # require 'date'
  # (Date.today - 365 .. Date.today + 365).include?(Date.today)    #=> true
  # (Date.today - 365 .. Date.today + 365).include?(DateTime.now)  #=> false
  # (Date.today - 365 .. Date.today + 365).cover?(Date.today)      #=> true
  # (Date.today - 365 .. Date.today + 365).cover?(DateTime.now)    #=> true
  # //}
  # 
  # 
  # --- cover?(range) -> bool
  # 
  # 2.6 以降の cover? は、[[m:Range#include?]] や [[m:Range#===]] と異なり、
  # 引数に Range オブジェクトを指定して比較できます。
  # 
  # 引数が Range オブジェクトの場合、引数の範囲が self の範囲に含まれる時に true を返します。
  # 
  # @param range 比較対象の Range クラスのインスタンスを指定します。
  # 
  # //emlist[引数が Range の例][ruby]{
  # (1..5).cover?(2..3)     #=> true
  # (1..5).cover?(0..6)     #=> false
  # (1..5).cover?(1...6)    #=> true
  # //}
  # 
  # 「(a..b).cover?(c...d)」のように終端を含まない Range オブジェクトが引数に渡されており、
  # 「a <= c && b < d」を満たし、cが数値ではない(つまり引数の Range の終端を
  # 求めるために succ メソッドの呼び出しが必要な)場合、パフォーマンスの問題が起きる可能性があります。
  # 
  # //emlist[パフォーマンス上の問題が起きる例][ruby]{
  # p ('aaaaa'..'zzzzy').cover?('aaaaa'...'zzzzz') # => true
  # //}
  # 
  # @see [[m:Range#include?]], [[m:Range#===]]
  def cover?; end

  # --- each {|item|  ... } -> self
  # --- each -> Enumerator
  # 
  # 範囲内の要素に対して繰り返します。
  # 
  # Range#each は各要素の succ メソッドを使用してイテレーションするようになりました。
  # 
  # @raise TypeError succ メソッドを持たないクラスの範囲オブジェクトに対してこのメソッドを呼んだ場合に発生します。
  # 
  # 
  # //emlist[例][ruby]{
  # (10..15).each {|n| print n, ' ' }
  # # prints: 10 11 12 13 14 15
  # 
  # (2.5..5).each {|n| print n, ' ' }
  # # raises: TypeError: can't iterate from Float
  # //}
  def each; end

  # --- end -> object
  # --- last -> object
  # 
  # 終端の要素を返します。範囲オブジェクトが終端を含むかどうかは関係ありま
  # せん。
  # 
  # //emlist[例][ruby]{
  # (10..20).last      # => 20
  # (10...20).last     # => 20
  # //}
  # 
  # @see [[m:Range#begin]]
  # 
  # --- last(n) -> [object]
  # 
  # 最後の n 要素を返します。範囲内に要素が含まれない場合は空の配列を返します。
  # 
  # @param n 取得する要素数を整数で指定します。整数以外のオブジェクトを指定
  #          した場合は to_int メソッドによる暗黙の型変換を試みます。
  # 
  # @raise TypeError 引数に整数以外の(暗黙の型変換が行えない)オブジェクトを
  #                  指定した場合に発生します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # [注意] 引数を省略して実行した場合は、終端を含むかどうか
  # ([[m:Range#exclude_end?]] の戻り値)に関わらず終端の要素を返す事に注意し
  # てください。
  # 
  # //emlist[例][ruby]{
  # (10..20).last(3)   # => [18, 19, 20]
  # (10...20).last(3)  # => [17, 18, 19]
  # //}
  # 
  # @see [[m:Range#first]]
  def end; end

  # --- to_a -> Array
  # --- entries -> Array
  # 
  # self を配列に変換します。
  # 
  # @raise RangeError 終端のない Range オブジェクトを変換しようとしたときに発生します。
  # 
  # //emlist[例][ruby]{
  # p (5..0).to_a      # => []
  # p (0..3).to_a      # => [0, 1, 2, 3]
  # p ('a'..'c').to_a  # => ["a", "b", "c"]
  # p (:a..:d).to_a  # => [:a, :b, :c, :d]
  # 
  # require 'date'
  # p (Date.new(1965, 4, 14) .. Date.new(1965, 4, 14)).to_a # => [#<Date: 1965-04-14 ((2438865j,0s,0n),+0s,2299161j)>]
  # 
  # (1..).to_a   # RangeError: cannot convert endless range to an array
  # //}
  def entries; end

  # --- eql?(other)   -> bool
  # 
  # 指定された other が Range クラスのインスタンスであり、
  # 始端と終端が eql? メソッドで比較して等しく、[[m:Range#exclude_end?]] が同じ場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # p (1..2).eql?(1..2)                 # => true
  # p (1..2).eql?(1...2)                # => false
  # p (1..2).eql?(Range.new(1.0, 2.0))  # => false
  # //}
  def eql?; end

  # --- exclude_end? -> bool
  # 
  # 範囲オブジェクトが終端を含まないとき真を返します。
  # 
  # //emlist[例][ruby]{
  # (1..5).exclude_end?     # => false
  # (1...5).exclude_end?    # => true
  # //}
  def exclude_end?; end

  # --- hash    -> Integer
  # 
  # 始端と終端のハッシュ値と [[m:Range#exclude_end?]] の値からハッシュ値を計算して整数として返します。
  # 
  # //emlist[例][ruby]{
  # p (1..2).hash    # => 5646
  # p (1...2).hash   # => 16782863
  # //}
  def hash; end

  # --- include?(obj) -> bool
  # --- member?(obj) -> bool
  # 
  # obj が範囲内に含まれている時に true を返します。
  # そうでない場合は、false を返します。
  # 
  # 
  # <=> メソッドによる演算により範囲内かどうかを判定するには [[m:Range#cover?]] を使用してください。
  # 
  # 始端・終端・引数が数値であれば、 [[m:Range#cover?]] と同様の動きをします。
  # 
  # @param obj 比較対象のオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # p ("a" .. "c").include?("b")  # => true
  # p ("a" .. "c").include?("B")  # => false
  # p ("a" .. "c").include?("ba") # => false
  # p ("a" .. "c").cover?("ba")   # => true
  # 
  # p (1 .. 3).include?(1.5) # => true
  # //}
  # 
  # @see [[ref:d:spec/control#case]]
  # @see [[m:Range#cover?]], [[m:Range#===]]
  def include?; end

  # --- inspect -> String
  # 
  # self を文字列に変換します(始端と終端のオブジェクトは #inspect メソッド
  # で文字列に変換されます)。
  # 
  # @see [[m:Range#to_s]]
  # 
  # //emlist[例][ruby]{
  # (1..5).inspect      # => "1..5"
  # ("1".."5").inspect  # => "\"1\"..\"5\""
  # //}
  def inspect; end

  # --- max               -> object | nil
  # --- max(n) -> [object]
  # 
  # 範囲内の最大の値、もしくは最大の n 要素が降順で入った配列を返します。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # (1..5).max     # => 5
  # //}
  # //emlist[例][ruby]{
  # (1..5).max(3)  # => [5, 4, 3]
  # //}
  # 
  # 始端が終端より大きい場合、もしくは、終端を含まない範囲オブジェクトの始端が終端と
  # 等しい場合は、引数を指定しない形式では nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # (2..1).max     # => nil
  # (1...1).max    # => nil
  # //}
  # //emlist[例][ruby]{
  # (2..1).max(3)  # => []
  # (1...1).max(3) # => []
  # //}
  # 
  # --- max {|a, b| ... } -> object | nil
  # --- max(n) {|a, b| ... } -> [object]
  # 
  # ブロックの評価結果で範囲内の各要素の大小判定を行い、最大の要素、もしくは
  # 最大の n 要素を返します。引数を指定しない形式では、
  # 範囲内に要素が存在しなければ nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # ブロックの値は、a > b のとき正、 a == b のとき 0、a < b のとき負の整数
  # を、期待しています。
  # 
  # @param n 取得する要素数。
  # 
  # @raise TypeError ブロックが整数以外を返したときに発生します。
  # 
  # @see [[m:Range#last]], [[m:Range#min]], [[m:Enumerable#max]]
  # 
  # //emlist[例][ruby]{
  # h = { 1 => "C", 2 => "Go", 3 => "Ruby" }
  # (1..3).max { |a, b| h[a].length <=> h[b].length }    # => 3
  # //}
  # //emlist[例][ruby]{
  # (1..3).max(2) { |a, b| h[a].length <=> h[b].length } # => [3, 2]
  # //}
  def max; end

  # --- min               -> object | nil
  # --- min(n)            -> [object]
  # 
  # 範囲内の最小の値、もしくは最小の n 要素が昇順で入った配列を返します。
  # 
  # @param n 取得する要素数。
  # 
  # //emlist[例][ruby]{
  # (1..5).min    # => 1
  # //}
  # //emlist[例][ruby]{
  # (1..5).min(3) # => [1, 2, 3]
  # //}
  # 
  # 始端が終端より大きい場合、もしくは、終端を含まない範囲オブジェクトの始端が終端と
  # 等しい場合は、引数を指定しない形式では nil を返します。
  # 引数を指定する形式では、空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # (2..1).min     # => nil
  # (1...1).min    # => nil
  # //}
  # //emlist[例][ruby]{
  # (2..1).min(3)  # => []
  # (1...1).min(3) # => []
  # //}
  # 
  # --- min {|a, b| ... } -> object | nil
  # --- min(n) {|a, b| ... } -> [object]
  # 
  # ブロックの評価結果で範囲内の各要素の大小判定を行い、最小の要素、もしくは
  # 最小の n 要素を返します。引数を指定しない形式では、範囲内に要素が存在しなければ
  # nil を返します。引数を指定する形式では、空の配列を返します。
  # 
  # ブロックの値は、a > b のとき正、a == b のとき 0、 a < b のとき負の整数
  # を、期待しています。
  # 
  # @param n 取得する要素数。
  # 
  # @raise TypeError ブロックが整数以外を返したときに発生します。
  # 
  # @see [[m:Range#first]], [[m:Range#max]], [[m:Enumerable#min]]
  # 
  # //emlist[例][ruby]{
  # h = { 1 => "C", 2 => "Go", 3 => "Ruby" }
  # (1..3).min { |a, b| h[a].length <=> h[b].length }    # => 1
  # //}
  # //emlist[例][ruby]{
  # (1..3).min(2) { |a, b| h[a].length <=> h[b].length } # => [1, 2]
  # //}
  def min; end

  # --- minmax                      -> [object, object]
  # --- minmax {|a, b| ... }        -> [object, object]
  # 
  # 範囲内の要素のうち、最小の要素と最大の要素を要素とするサイズ 2 の配列を返します。
  # 
  # 一つ目の形式では、全要素が互いに <=> メソッドで比較できることを仮定しています。
  # 
  # 二つ目の形式では、要素同士の比較をブロックを用いて行います。
  # ブロックの値は、a > b のとき正、 a == b のとき 0、a < b のとき負の整数を、期待しています。
  # 
  # //emlist[例][ruby]{
  # (1..3).minmax # => [1, 3]
  # 
  # h = { 1 => "C", 2 => "Go", 3 => "Ruby" }
  # (1..3).minmax { |a, b| h[a].length <=> h[b].length } # => [1, 3]
  # //}
  def minmax; end

  # --- size -> Integer | Float::INFINITY | nil
  # 
  # 範囲内の要素数を返します。始端、終端のいずれかのオブジェクトが
  # [[c:Numeric]] のサブクラスのオブジェクトではない場合には nil を返します。
  # 
  # //emlist[例][ruby]{
  # (10..20).size    # => 11
  # ("a".."z").size  # => nil
  # (-Float::INFINITY..Float::INFINITY).size # => Infinity
  # //}
  def size; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数はそのまま [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] に渡されます。
  # 
  # //emlist[例][ruby]{
  # require "json/add/core"
  # 
  # (1..5).to_json # => "{\"json_class\":\"Range\",\"a\":[1,5,false]}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_s -> String
  # 
  # self を文字列に変換します(始端と終端のオブジェクトは #to_s メソッドで文
  # 字列に変換されます)。
  # 
  # @see [[m:Range#inspect]]
  # 
  # //emlist[例][ruby]{
  # (1..5).to_s      # => "1..5"
  # ("1".."5").to_s  # => "1..5"
  # //}
  def to_s; end

  # --- json_create(hash) -> Range
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- new(first, last, exclude_end = false) -> Range
  # 
  # first から last までの範囲オブジェクトを生成して返しま
  # す。
  # 
  # exclude_end が真ならば終端を含まない範囲オブジェクトを生
  # 成します。exclude_end 省略時には終端を含みます。
  # 
  # @param first 最初のオブジェクト
  # @param last 最後のオブジェクト
  # @param exclude_end 真をセットした場合終端を含まない範囲オブジェクトを生成します
  # 
  # @raise ArgumentError first <=> last が nil の場合に発生します
  # 
  # //emlist[例: 整数の範囲オブジェクトの場合][ruby]{
  # Range.new(1, 10)       # => 1..10
  # Range.new(1, 10, true) # => 1...10
  # //}
  # 
  # //emlist[例: 日付オブジェクトの範囲オブジェクトの場合][ruby]{
  # require 'date'
  # Range.new(Date.today, Date.today >> 1).each {|d| puts d }
  # # => 2017-09-16
  # #    2017-09-17
  # #    ...
  # #    2017-10-16
  # //}
  # 
  # //emlist[例: IPアドレスの範囲オブジェクトの場合][ruby]{
  # require 'ipaddr'
  # Range.new(IPAddr.new("192.0.2.1"), IPAddr.new("192.0.2.3")).each {|ip| puts ip}
  # # => 192.0.2.1
  # #    192.0.2.2
  # #    192.0.2.3
  # //}
  # 
  # //emlist[例: 自作のオブジェクトの場合][ruby]{
  # MyInteger = Struct.new(:value) do
  #   def succ
  #     self.class.new(value + 1)
  #   end
  # 
  #   def <=>(other)
  #     value <=> other.value
  #   end
  # 
  #   def to_s
  #     value.to_s
  #   end
  # end
  # Range.new(MyInteger.new(1), MyInteger.new(3)).each {|i| puts i }
  # # => 1
  # #    2
  # #    3
  # //}
  def new; end

end
