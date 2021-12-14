class Enumerator
  # --- +(enum) -> Enumerator::Chain
  # 
  # 自身と enum 引数を続けて繰り返す [[c:Enumerator::Chain]] を返します。
  # 
  # //emlist[例][ruby]{
  # e = (1..3).each + [4, 5]
  # e.to_a #=> [1, 2, 3, 4, 5]
  # //}
  # 
  # @see [[m:Enumerable#chain]]
  def +; end

  # --- each {...}        -> object
  # --- each              -> self
  # --- each(*args) {...} -> object
  # --- each(*args)       -> Enumerator
  # 
  # 生成時のパラメータに従ってブロックを繰り返します。
  # *args を渡した場合は、生成時のパラメータ内引数末尾へ *args を追加した状態で繰り返します。
  # ブロック付きで呼び出された場合は、
  # 生成時に指定したイテレータの戻り値をそのまま返します。
  # 
  # @param args 末尾へ追加する引数
  # 
  # //emlist[例1][ruby]{
  # str = "Yet Another Ruby Hacker"
  # 
  # enum = Enumerator.new(str, :scan, /\w+/)
  # enum.each {|word| p word }              # => "Yet"
  #                                         #    "Another"
  #                                         #    "Ruby"
  #                                         #    "Hacker"
  # 
  # str.scan(/\w+/) {|word| p word }        # => "Yet"
  #                                         #    "Another"
  #                                         #    "Ruby"
  #                                         #    "Hacker"
  # //}
  # 
  # //emlist[例2][ruby]{
  # "Hello, world!".scan(/\w+/)                     # => ["Hello", "world"]
  # "Hello, world!".to_enum(:scan, /\w+/).to_a      # => ["Hello", "world"]
  # "Hello, world!".to_enum(:scan).each(/\w+/).to_a # => ["Hello", "world"]
  # 
  # obj = Object.new
  # 
  # def obj.each_arg(a, b=:b, *rest)
  #   yield a
  #   yield b
  #   yield rest
  #   :method_returned
  # end
  # 
  # enum = obj.to_enum :each_arg, :a, :x
  # 
  # enum.each.to_a                  # => [:a, :x, []]
  # enum.each.equal?(enum)          # => true
  # enum.each { |elm| elm }         # => :method_returned
  # 
  # enum.each(:y, :z).to_a          # => [:a, :x, [:y, :z]]
  # enum.each(:y, :z).equal?(enum)  # => false
  # enum.each(:y, :z) { |elm| elm } # => :method_returned
  # //}
  def each; end

  # --- feed(obj) -> nil
  # 
  # Enumerator 内部の yield が返す値を設定します。
  # 
  # これで値を設定しなかった場合は yield は nil を返します。
  # 
  # この値は内部で yield された時点でクリアされます。
  # 
  # //emlist[例][ruby]{
  # # (1), (2), ... (10) の順に実行される
  # o = Object.new
  # def o.each
  #   x = yield         # (2) blocks
  #   p x               # (5) => "foo"
  #   x = yield         # (6) blocks
  #   p x               # (8) => nil
  #   x = yield         # (9) blocks
  #   p x               # not reached w/o another e.next
  # end
  # 
  # e = o.to_enum
  # e.next              # (1)
  # e.feed "foo"        # (3)
  # e.next              # (4)
  # e.next              # (7)
  #                     # (10)
  # //}
  # 
  # @param obj Enumerator 内部の yield が返す値
  # @raise TypeError すでに値をこのメソッドでセットしている場合に発生します
  def feed; end

  # --- next -> object
  # 「次」のオブジェクトを返します。
  # 
  # 現在までの列挙状態に応じて「次」のオブジェクトを返し、列挙状態を1つ分進めます。
  # 列挙が既に最後へ到達している場合は、
  # [[c:StopIteration]] 例外を発生します。このとき列挙状態は変化しません。
  # つまりもう一度 next を呼ぶと再び例外が発生します。
  # 
  # next メソッドによる外部列挙の状態は他のイテレータメソッドによる
  # 内部列挙には影響を与えません。
  # ただし、 [[m:IO#each_line]] のようにおおもとの列挙メカニズムが副作用を
  # 伴っている場合には影響があり得ます。
  # 
  # @raise StopIteration 列挙状態が既に最後へ到達しているとき
  # @see [[m:Enumerator#rewind]]
  # 
  # //emlist[例1][ruby]{
  # str = "xyz"
  # enum = str.each_byte
  # 
  # str.bytesize.times do
  #   puts enum.next
  # end
  #     # => 120
  #     #    121
  #     #    122
  # //}
  # 
  # //emlist[例2][ruby]{
  # str = "xyz"
  # enum = str.each_byte
  # 
  # begin
  #   puts enum.next while true
  # rescue StopIteration
  #   puts "iteration reached at end"
  # end
  #     # => 120
  #     #    121
  #     #    122
  #     #    iteration reached at end
  # puts enum.next
  #     #=> 再度 StopIteration 例外が発生
  # //}
  # 
  # //emlist[例3: Kernel.#loop は StopIteration を捕捉します。][ruby]{
  # str = "xyz"
  # enum = str.each_byte
  # loop do
  #   puts enum.next
  # end
  #     # => 120
  #     #    121
  #     #    122
  # //}
  def next; end

  # --- next_values -> Array
  # 
  # 「次」のオブジェクトを配列で返します。
  # 
  # [[m:Enumerator#next]] とほぼ同様の挙動をします。終端まで到達した場合は
  # [[c:StopIteration]] 例外を発生させます。
  # 
  # このメソッドは、
  #   yield
  # と
  #   yield nil
  # を区別するために使えます。
  # 
  # next メソッドによる外部列挙の状態は他のイテレータメソッドによる
  # 内部列挙には影響を与えません。
  # ただし、 [[m:IO#each_line]] のようにおおもとの列挙メカニズムが副作用を
  # 伴っている場合には影響があり得ます。
  # 
  # //emlist[例: next と next_values の違いを][ruby]{
  # o = Object.new
  # def o.each
  #   yield
  #   yield 1
  #   yield 1, 2
  #   yield nil
  #   yield [1, 2]
  # end
  # e = o.to_enum
  # p e.next_values
  # p e.next_values
  # p e.next_values
  # p e.next_values
  # p e.next_values
  # e = o.to_enum
  # p e.next
  # p e.next
  # p e.next
  # p e.next
  # p e.next
  # 
  # ## yield args       next_values      next
  # #  yield            []               nil
  # #  yield 1          [1]              1
  # #  yield 1, 2       [1, 2]           [1, 2]
  # #  yield nil        [nil]            nil
  # #  yield [1, 2]     [[1, 2]]         [1, 2]
  # //}
  # 
  # @raise StopIteration 列挙状態が既に最後へ到達しているとき
  # @see [[m:Enumerator#next]], [[m:Enumerator#peek]], [[m:Enumerator#peek_values]]
  def next_values; end

  # --- peek -> object
  # 「次」のオブジェクトを返しますが、列挙状態を変化させません。
  # 
  # [[m:Enumerator#next]] のように
  # 現在までの列挙状態に応じて「次」のオブジェクトを返しますが、
  # next と異なり列挙状態を変更しません。
  # 
  # 列挙が既に最後へ到達している場合は、[[c:StopIteration]] 例外を発生します。
  # 
  # //emlist[例][ruby]{
  # a = [1,2,3]
  # e = a.to_enum
  # p e.next   #=> 1
  # p e.peek   #=> 2
  # p e.peek   #=> 2
  # p e.peek   #=> 2
  # p e.next   #=> 2
  # p e.next   #=> 3
  # p e.next   #raises StopIteration
  # //}
  # 
  # @raise StopIteration 列挙状態が既に最後へ到達しているとき
  # @see [[m:Enumerator#next]], [[m:Enumerator#next_values]], [[m:Enumerator#peek_values]]
  def peek; end

  # --- peek_values -> Array
  # 
  # [[m:Enumerator#next_values]] のように「次」のオブジェクトを
  # 配列で返しますが、列挙状態を変化させません。
  # 
  # [[m:Enumerator#next]], [[m:Enumerator#next_values]] のように
  # 現在までの列挙状態に応じて「次」のオブジェクトを返しますが、
  # next と異なり列挙状態を変更しません。
  # 
  # 列挙が既に最後へ到達している場合は、[[c:StopIteration]] 例外を発生します。
  # 
  # このメソッドは [[m:Enumerator#next_values]] と同様
  #   yield
  # と
  #   yield nil
  # を区別するために使えます。
  #   
  # //emlist[例][ruby]{
  # o = Object.new
  # def o.each
  #   yield
  #   yield 1
  #   yield 1, 2
  # end
  # e = o.to_enum
  # p e.peek_values    #=> []
  # e.next
  # p e.peek_values    #=> [1]
  # p e.peek_values    #=> [1]
  # e.next
  # p e.peek_values    #=> [1, 2]
  # e.next
  # p e.peek_values    # raises StopIteration
  # //}
  # 
  # @raise StopIteration 列挙状態が既に最後へ到達しているとき
  # @see [[m:Enumerator#next]], [[m:Enumerator#next_values]], [[m:Enumerator#peek_values]]
  def peek_values; end

  # --- rewind -> self
  # 列挙状態を巻き戻します。
  # 
  # next メソッドによる外部列挙の状態を最初まで巻き戻します。 self を返します。
  # 
  # 内包するオブジェクトが rewind メソッドを持つとき(respond_to?(:rewind) に
  # 真を返すとき) は、その rewind メソッドを呼び出します。
  # 
  # @see [[m:Enumerator#next]]
  # 
  # //emlist[例][ruby]{
  # str = "xyz"
  # enum = str.each_byte
  # 
  # p enum.next # => 120
  # p enum.next # => 121
  # enum.rewind
  # p enum.next # => 120
  # //}
  def rewind; end

  # --- size -> Integer | Float::INFINITY | nil
  # 
  # self の要素数を返します。
  # 
  # 要素数が無限の場合は [[m:Float::INFINITY]] を返します。
  # [[m:Enumerator.new]] に [[c:Proc]] オブジェクトを指定していた場合はその
  # 実行結果を返します。呼び出した時に要素数が不明であった場合は nil を返し
  # ます。
  # 
  # //emlist[例][ruby]{
  # (1..100).to_a.permutation(4).size # => 94109400
  # loop.size # => Float::INFINITY
  # (1..100).drop_while.size # => nil
  # //}
  # 
  # @see [[m:Enumerator.new]]
  def size; end

  # --- with_index(offset = 0) {|(*args), idx| ... } -> object
  # --- with_index(offset = 0) -> Enumerator
  # 
  # 生成時のパラメータに従って、要素にインデックスを添えて繰り返します。
  # インデックスは offset から始まります。
  # 
  # ブロックを指定した場合の戻り値は生成時に指定したレシーバ自身です。
  # 
  # //emlist[例][ruby]{
  # str = "xyz"
  # 
  # enum = Enumerator.new(str, :each_byte)
  # enum.with_index {|byte, idx| p [byte, idx] }
  #     # => [120, 0]
  #     #    [121, 1]
  #     #    [122, 2]
  # 
  # require "stringio"
  # StringIO.new("foo|bar|baz").each("|").with_index(1) {|s, i| p [s, i] }
  #     # => ["foo|", 1]
  #     #    ["bar|", 2]
  #     #    ["baz", 3]
  # //}
  # 
  # 
  # 生成時のパラメータに従って、要素にインデックスを添えてブロックを繰り返します。
  # インデックスは 0 から始まります。
  # [[m:Enumerator#with_index]] は offset 引数を受け取りますが、
  # each_with_index は受け取りません (引数はイテレータメソッドにそのまま渡されます)。
  def with_index; end

  # --- with_object(obj) -> Enumerator
  # --- with_object(obj) {|(*args), memo_obj| ... } -> object
  # 
  # 繰り返しの各要素に obj を添えてブロックを繰り返し、obj を返り値として返します。
  # 
  # obj には任意のオブジェクトを渡すことができます。
  # 
  # ブロックが渡されなかった場合は、上で説明した繰り返しを実行し、
  # 最後に obj を返す [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # # 0,1,2 と呼びだす enumeratorを作る
  # to_three = Enumerator.new do |y|
  #   3.times do |x|
  #     y << x
  #   end
  # end
  # 
  # to_three_with_string = to_three.with_object("foo")
  # to_three_with_string.each do |x,string|
  #   puts "#{string}: #{x}"
  # end
  # # => foo:0
  # # => foo:1
  # # => foo:2
  # //}
  # 
  # @param obj 繰り返しの各要素に添えて渡されるオブジェクト
  # @see [[m:Enumerable#each_with_object]]
  def with_object; end

  # --- new(obj, method = :each, *args) -> Enumerator
  # 
  # オブジェクト obj について、 each の代わりに method という
  # 名前のメソッドを使って繰り返すオブジェクトを生成して返します。
  # args を指定すると、 method の呼び出し時に渡されます。
  # 
  # @param obj イテレータメソッドのレシーバとなるオブジェクト
  # @param method イテレータメソッドの名前を表すシンボルまたは文字列
  # @param args イテレータメソッドの呼び出しに渡す任意個の引数
  # 
  # //emlist[例][ruby]{
  # str = "xyz"
  # 
  # enum = Enumerator.new(str, :each_byte)
  # p enum.map {|b| '%02x' % b }   # => ["78", "79", "7a"]
  # //}
  # 
  # 
  # --- new(size=nil){|y| ... }         -> Enumerator
  # 
  # Enumerator オブジェクトを生成して返します。与えられたブロックは [[c:Enumerator::Yielder]] オブジェクトを
  # 引数として実行されます。
  # 
  # 生成された Enumerator オブジェクトに対して each を呼ぶと、この生成時に指定されたブロックを
  # 実行し、Yielder オブジェクトに対して << メソッドが呼ばれるたびに、
  # each に渡されたブロックが繰り返されます。
  # 
  # new に渡されたブロックが終了した時点で each の繰り返しが終わります。
  # このときのブロックの返り値が each の返り値となります。
  # 
  # @param size 生成する Enumerator オブジェクトの要素数を指定します。
  #             [[c:Integer]]、[[m:Float::INFINITY]]、[[c:Proc]] オブジェク
  #             ト、nil のいずれかを指定します。[[m:Enumerator#size]] の実
  #             行時に参照されます。
  # 
  # //emlist[例][ruby]{
  # enum = Enumerator.new{|y|
  #   (1..10).each{|i|
  #     y << i if i % 5 == 0
  #   }
  # }
  # enum.each{|i| p i }
  # 
  # #=>  5
  # #   10
  # 
  # 
  # fib = Enumerator.new { |y|
  #   a = b = 1
  #   loop {
  #     y << a
  #     a, b = b, a + b
  #   }
  # }
  # 
  # p fib.take(10) #=> [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
  # //}
  def new; end

  # --- produce(initial = nil) { |prev| ... } -> Enumerator
  # 
  # 与えられたブロックを呼び出し続ける、停止しない Enumerator を返します。
  # ブロックの戻り値が、次にブロックを呼び出す時に引数として渡されます。
  # initial 引数が渡された場合、最初にブロックを呼び出す時にそれがブロック
  # 呼び出しの引数として渡されます。initial が渡されなかった場合は nil が
  # 渡されます。
  # 
  # ブロックが例外 [[c:StopIteration]]を投げた場合、繰り返しが終了します。
  # 
  # @param initial ブロックに最初に渡される値です。任意のオブジェクトを渡せます。
  # 
  # //emlist[例][ruby]{
  # # 1, 2, 3, 4, ... と続く Enumerator
  # Enumerator.produce(1, &:succ)
  # 
  # # next を呼ぶたびランダムな数値を返す Enumerator
  # Enumerator.produce { rand(10) }
  # 
  # # ツリー構造の祖先ノードを列挙する Enumerator
  # ancestors = Enumerator.produce(node) { |prev| node = prev.parent or raise StopIteration }
  # enclosing_section = ancestors.find { |n| n.type == :section }
  # //}
  # 
  # このメソッドは Enumerable の各メソッドと組み合わせて使うことで、
  # while や until ループのような処理を実装できます。
  # 例えば [[m:Enumerable#detect]], [[m:Enumerable#slice_after]], [[m:Enumerable#take_while]]
  # などと合わせて使えるでしょう。
  # 
  # //emlist[Enumerable のメソッドと組み合わせる例][ruby]{
  # # 次の火曜日を返す例
  # require "date"
  # Enumerator.produce(Date.today, &:succ).detect(&:tuesday?)
  # 
  # # シンプルなレキサーの例
  # require "strscan"
  # scanner = StringScanner.new("7+38/6")
  # PATTERN = %r{\d+|[-/+*]}
  # Enumerator.produce { scanner.scan(PATTERN) }.slice_after { scanner.eos? }.first
  # # => ["7", "+", "38", "/", "6"]
  # //}
  def produce; end

end
