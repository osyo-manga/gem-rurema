class Enumerator::Lazy
  # --- chunk {|elt| ... } -> Enumerator::Lazy
  # --- chunk(initial_state) {|elt, state| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#chunk]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.chunk{ |n| n % 3 == 0 }
  #   # => #<Enumerator::Lazy: #<Enumerator: #<Enumerator::Generator:0x007f8bf18118f0>:each>>
  # 
  #   1.step.lazy.chunk{ |n| n % 3 == 0 }.take(5).force
  #   # => [[false, [1, 2]], [true, [3]], [false, [4, 5]], [true, [6]], [false, [7, 8]]]
  # 
  # @see [[m:Enumerable#chunk]]
  def chunk; end

  # --- chunk_while {|elt_before, elt_after| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#chunk_while]] と同じですが、Enumerator ではなく Enumerator::Lazy を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  def chunk_while; end

  # --- map {|item| ... } -> Enumerator::Lazy
  # --- collect {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#map]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # 例:
  #   1.step.lazy.map{ |n| n % 3 == 0 }
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:map>
  # 
  #   1.step.lazy.collect{ |n| n.succ }.take(10).force
  #   # => [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  # 
  # @see [[m:Enumerable#map]]
  def collect; end

  # --- flat_map {|item| ... } -> Enumerator::Lazy
  # --- collect_concat {|item| ... } -> Enumerator::Lazy
  # 
  # ブロックの実行結果をひとつに繋げたものに対してイテレートするような
  # Enumerator::Lazy のインスタンスを返します。
  # 
  #   ["foo", "bar"].lazy.flat_map {|i| i.each_char.lazy}.force
  #   #=> ["f", "o", "o", "b", "a", "r"]
  # 
  # ブロックの返した値 x は、以下の場合にのみ分解され、連結されます。
  # 
  #  * x が配列であるか、to_ary メソッドを持つとき
  #  * x が each および force メソッドを持つ (例：Enumerator::Lazy) とき
  # 
  # それ以外のときは、x は分解されず、そのままの値として使われます。
  # 
  #   [{a:1}, {b:2}].lazy.flat_map {|i| i}.force
  #   #=> [{:a=>1}, {:b=>2}]
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # @see [[m:Enumerable#flat_map]]
  def collect_concat; end

  # --- compact -> Enumerator::Lazy
  # 
  # [[m:Enumerable#compact]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  def compact; end

  # --- drop(n) -> Enumerator::Lazy
  # 
  # [[m:Enumerable#drop]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # @param n 要素数を指定します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # 例:
  #   1.step.lazy.drop(3)
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:drop(3)>
  # 
  #   1.step.lazy.drop(3).take(10).force
  #   # => [4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  # 
  # @see [[m:Enumerable#drop]]
  def drop; end

  # --- drop_while {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#drop_while]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.drop_while { |i| i < 42 }
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:drop_while>
  # 
  #   1.step.lazy.drop_while { |i| i < 42 }.take(10).force
  #   # => [42, 43, 44, 45, 46, 47, 48, 49, 50, 51]
  # 
  # @see [[m:Enumerable#drop_while]]
  def drop_while; end

  # --- eager -> Enumerator
  # 
  # 自身を遅延評価しない Enumerator に変換して返します。
  # 
  # //emlist[例][ruby]{
  # lazy_enum = (1..).each.lazy
  # 
  # # select が遅延評価されるので終了する
  # p lazy_enum.class # => Enumerator::Lazy
  # p lazy_enum.select { |n| n.even? }.first(5)
  # # => [2, 4, 6, 8, 10]
  # 
  # # select が遅延評価されないので終了しない
  # enum = lazy_enum.eager
  # p enum.class # => Enumerator
  # p enum.select { |n| n.even? }.first(5)
  # //}
  def eager; end

  # --- to_enum(method = :each, *args)                 -> Enumerator::Lazy
  # --- enum_for(method = :each, *args)                -> Enumerator::Lazy
  # --- to_enum(method = :each, *args) {|*args| block} -> Enumerator::Lazy
  # --- enum_for(method = :each, *args){|*args| block} -> Enumerator::Lazy
  # 
  # [[m:Object#to_enum]] と同じですが、Enumerator::Lazy を返します。
  # 
  # to_enum は「ブロック付きで呼ぶとループを実行し、ブロックを省略した場合は
  # Enumerator を返す」ようなメソッドを定義するときによく使われます。
  # このときに lazy 性が正しく引き継がれるように、Lazy#to_enum は
  # 素のEnumerator ではなく Enumerator::Lazy を返すようになっています。
  # 
  # 例:
  # 
  #   module Enumerable
  #     # 要素をn回ずつ繰り返すメソッド
  #     # 例：[1,2,3].repeat(2)  #=> [1,1,2,2,3,3]
  #     def repeat(n)
  #       raise ArgumentError if n < 0
  #       if block_given?
  #         each do |*val|
  #           n.times { yield *val }
  #         end
  #       else
  #         to_enum(:repeat, n)
  #       end
  #     end
  #   end
  # 
  #   r = 1..10
  #   p r.map{|n| n**2}.repeat(2).first(5)
  #   #=> [1, 1, 4, 4, 9]
  # 
  #   r = 1..Float::INFINITY
  #   p r.lazy.map{|n| n**2}.repeat(2).first(5)
  #   #=> [1, 1, 4, 4, 9]
  # 
  #   # Lazy#to_enum のおかげで、repeat の返り値は
  #   # もとが Enumerator のときは Enumerator に、
  #   # もとが Lazy のときは Lazy になる
  def enum_for; end

  # --- select {|item| ... } -> Enumerator::Lazy
  # --- find_all {|item| ... } -> Enumerator::Lazy
  # --- filter {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#select]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # 例:
  #   1.step.lazy.find_all { |i| i.even? }
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:find_all>
  # 
  #   1.step.lazy.select { |i| i.even? }.take(10).force
  #   # => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
  # 
  # @see [[m:Enumerable#select]]
  def filter; end

  # --- filter_map {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#filter_map]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # //emlist[例][ruby]{
  # 1.step.lazy.filter_map { |n| n * 2 if n.even? }
  # # => #<Enumerator::Lazy: #<Enumerator::Lazy: (1.step)>:filter_map>
  # 
  # 1.step.lazy.filter_map { |n| n * 2 if n.even? }.take(10).force
  # # => [4, 8, 12, 16, 20, 24, 28, 32, 36, 40]
  # //}
  # 
  # @see [[m:Enumerable#filter_map]]
  def filter_map; end

  # --- force(*args) -> [object]
  # 
  # 全ての要素を含む配列を返します。Lazy から実際に値を取り出すのに使います。
  # 
  # [[m:Enumerable#to_a]] のエイリアスです。
  # 
  # 例:
  #   1.step.lazy.take(10).force
  #   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  # 
  #   1.step.lazy.take(10).to_a
  #   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  def force; end

  # --- grep(pattern) {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#grep]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # 例:
  #   (100..Float::INFINITY).lazy.map(&:to_s).grep(/\A(\d)\1+\z/)
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: 100..Infinity>:map>:grep(/\A(\d)\1+\z/)>
  #   (100..Float::INFINITY).lazy.map(&:to_s).grep(/\A(\d)\1+\z/).take(10).force
  #   # => ["111", "222", "333", "444", "555", "666", "777", "888", "999", "1111"]
  # 
  # @see [[m:Enumerable#grep]], [[m:Enumerable#grep_v]], [[m:Enumerator::Lazy#grep_v]]
  def grep; end

  # --- grep_v(pattern) {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#grep_v]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # 例:
  #   (100..Float::INFINITY).lazy.map(&:to_s).grep_v(/(\d).*\1/)
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: 100..Infinity>:map>:grep_v(/(\d).*\1/)>
  #   (100..Float::INFINITY).lazy.map(&:to_s).grep_v(/(\d).*\1/).take(15).force
  #   # => ["102", "103", "104", "105", "106", "107", "108", "109", "120", "123", "124", "125", "126", "127", "128"]
  # 
  # @see [[m:Enumerable#grep_v]], [[m:Enumerable#grep]], [[m:Enumerator::Lazy#grep]]
  def grep_v; end

  # --- lazy -> self
  # 
  # self を返します。
  # 
  # 例:
  #   lazy = (100..Float::INFINITY).lazy
  #   p lazy.lazy         # => #<Enumerator::Lazy: 100..Infinity>
  #   p lazy == lazy.lazy # => true
  def lazy; end

  # --- reject {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#reject]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # 例:
  #   1.step.lazy.reject { |i| i.even? }
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:reject>
  # 
  #   1.step.lazy.reject { |i| i.even? }.take(10).force
  #   # => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
  # 
  # @see [[m:Enumerable#reject]]
  def reject; end

  # --- slice_after(pattern) -> Enumerator::Lazy
  # --- slice_after {|elt| bool } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#slice_after]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.slice_after { |e| e % 3 == 0 }
  #   # => #<Enumerator::Lazy: #<Enumerator: #<Enumerator::Generator:0x007fd73980e6f8>:each>>
  # 
  #   1.step.lazy.slice_after { |e| e % 3 == 0 }.take(5).force
  #   # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15]]
  # 
  # @see [[m:Enumerable#slice_after]]
  def slice_after; end

  # --- slice_before(pattern) -> Enumerator::Lazy
  # --- slice_before {|elt| bool } -> Enumerator::Lazy
  # --- slice_before(initial_state) {|elt, state| bool } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#slice_before]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.slice_before { |e| e.even? }
  #   # => #<Enumerator::Lazy: #<Enumerator: #<Enumerator::Generator:0x00007f9f31844ce8>:each>>
  # 
  #   1.step.lazy.slice_before { |e| e % 3 == 0 }.take(5).force
  #   # => [[1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11], [12, 13, 14]]
  # 
  # @see [[m:Enumerable#slice_before]]
  def slice_before; end

  # --- slice_when {|elt_before, elt_after| bool } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#slice_when]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.slice_when { |i, j| (i + j) % 5 == 0 }
  #   # => #<Enumerator::Lazy: #<Enumerator: #<Enumerator::Generator:0x00007fce84118348>:each>>
  # 
  #   1.step.lazy.slice_when { |i, j| (i + j) % 5 == 0 }.take(5).force
  #   # => [[1, 2], [3, 4, 5, 6, 7], [8, 9, 10, 11, 12], [13, 14, 15, 16, 17], [18, 19, 20, 21, 22]]
  # 
  # @see [[m:Enumerable#slice_when]]
  def slice_when; end

  # --- take(n) -> Enumerator::Lazy
  # 
  # [[m:Enumerable#take]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # n が大きな数 (100000とか) の場合に備えて再定義されています。
  # 配列が必要な場合は [[m:Enumerable#first]] を使って下さい。
  # 
  # @param n 要素数を指定します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # 例:
  #   1.step.lazy.take(5)
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:take(5)>
  # 
  #   1.step.lazy.take(5).force
  #   # => [1, 2, 3, 4, 5]
  # 
  # @see [[m:Enumerable#take]]
  def take; end

  # --- take_while -> Enumerator::Lazy
  # --- take_while {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#take_while]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # 例:
  #   1.step.lazy.zip(('a'..'z').cycle).take_while { |e| e.first < 100_000 }
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:zip(#<Enumerator: "a".."z":cycle>)>:take_while>
  # 
  #   1.step.lazy.zip(('a'..'z').cycle).take_while { |e| e.first < 100_000 }.force.last(5)
  #   # => [[99995, "y"], [99996, "z"], [99997, "a"], [99998, "b"], [99999, "c"]]
  # 
  # @see [[m:Enumerable#take_while]]
  def take_while; end

  # --- uniq               -> Enumerator::Lazy
  # --- uniq {|item| ... } -> Enumerator::Lazy
  # 
  # [[m:Enumerable#uniq]] と同じですが、配列ではなく Enumerator::Lazy を返します。
  def uniq; end

  # --- zip(*lists)  -> Enumerator::Lazy
  # --- zip(*lists) {|v1, v2, ...| ... } -> nil
  # 
  # [[m:Enumerable#zip]] と同じですが、配列ではなくEnumerator::Lazy を返します。
  # 
  # ただし一貫性のため、ブロック付きで呼び出した場合は Enumerable#zip と
  # 同じ挙動になります。
  # 
  # 例:
  #   1.step.lazy.zip(('a'..'z').cycle)
  #   # => #<Enumerator::Lazy: #<Enumerator::Lazy: #<Enumerator: 1:step>>:zip(#<Enumerator: "a".."z":cycle>)>
  # 
  #   1.step.lazy.zip(('a'..'z').cycle).take(30).force.last(6)
  #   # => [[25, "y"], [26, "z"], [27, "a"], [28, "b"], [29, "c"], [30, "d"]]
  # 
  # @see [[m:Enumerable#zip]]
  def zip; end

  # --- new(obj, size=nil) {|yielder, *values| ... } -> Enumerator::Lazy
  # 
  # Lazy Enumerator を作成します。[[m:Enumerator::Lazy#force]] メソッドなどに
  # よって列挙が実行されたとき、objのeachメソッドが実行され、値が一つずつ
  # ブロックに渡されます。ブロックは、yielder を使って最終的に yield される値を
  # 指定できます。
  # 
  # Enumerable#filter_map と、その遅延評価版を定義する例:
  # 
  #   module Enumerable
  #     def filter_map(&block)
  #       map(&block).compact
  #     end
  #   end
  # 
  #   class Enumerator::Lazy
  #     def filter_map
  #       Lazy.new(self) do |yielder, *values|
  #         result = yield *values
  #         yielder << result if result
  #       end
  #     end
  #   end
  # 
  #   1.step.lazy.filter_map{|i| i*i if i.even?}.first(5)
  #       # => [4, 16, 36, 64, 100]
  # 
  # @raise ArgumentError 引数を指定しなかった場合、ブロックを指定しなかった場合に発生します。
  # 
  # @see [[m:Enumerator.new]]
  def new; end

end
