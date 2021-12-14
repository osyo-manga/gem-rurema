class Proc
  # --- <<(callable) -> Proc
  # 
  # self と引数を合成した Proc を返します。
  # 
  # 戻り値の Proc は可変長の引数を受け取ります。
  # 戻り値の Proc を呼び出すと、まず受け取った引数を callable に渡して呼び出し、
  # その戻り値を self に渡して呼び出した結果を返します。
  # 
  # [[m:Proc#>>]] とは呼び出しの順序が逆になります。
  # 
  # @param callable Proc、Method、もしくは任意の call メソッドを持ったオブジェクト。
  # 
  # //emlist[例][ruby]{
  # f = proc { |x| x * x }
  # g = proc { |x| x + x }
  # 
  # # (3 + 3) * (3 + 3)
  # p (f << g).call(3) # => 36
  # //}
  # 
  # //emlist[call を定義したオブジェクトを渡す例][ruby]{
  # class WordScanner
  #   def self.call(str)
  #     str.scan(/\w+/)
  #   end
  # end
  # 
  # File.write('testfile', <<~TEXT)
  #   Hello, World!
  #   Hello, Ruby!
  # TEXT
  # 
  # pipeline = proc { |data| puts "word count: #{data.size}" } << WordScanner << File.method(:read)
  # pipeline.call('testfile') # => word count: 4
  # //}
  # 
  # @see [[m:Method#<<]], [[m:Method#>>]]
  def <<; end

  # --- [](*arg) -> ()
  # --- call(*arg) -> ()
  # --- ===(*arg) -> ()
  # --- yield(*arg) -> ()
  # 
  # 手続きオブジェクトを実行してその結果を返します。
  # 
  # 引数の渡され方はオブジェクトの生成方法によって異なります。
  # 詳しくは [[m:Proc#lambda?]] を参照してください。
  # 
  # 「===」は when の所に手続きを渡せるようにするためのものです。
  # 
  # //emlist[例][ruby]{
  # def sign(n)
  #   case n
  #   when lambda{|n| n > 0} then 1
  #   when lambda{|n| n < 0} then -1
  #   else 0
  #   end
  # end
  # 
  # p sign(-4) #=> -1
  # p sign(0)  #=> 0
  # p sign(7)  #=> 1
  # //}
  # 
  # また、以下のような syntactic sugar もあります。
  # 
  # //emlist[例][ruby]{
  # fib = lambda{|n|
  #   case n
  #   when 0 then 0
  #   when 1 then 1
  #   else
  #     fib.(n - 2) + fib.(n - 1)
  #   end
  # }
  # fib.(10) # => 55
  # //}
  # 
  # 
  # 
  # @param arg 手続きオブジェクトに与える引数を指定します。
  # 
  # @raise LocalJumpError Procを生成したメソッドからリターンしてしまった場合に発生します。
  def ===; end

  # --- >>(callable) -> Proc
  # 
  # self と引数を合成した Proc を返します。
  # 
  # 戻り値の Proc は可変長の引数を受け取ります。
  # 戻り値の Proc を呼び出すと、まず受け取った引数を self に渡して呼び出し、
  # その戻り値を callable に渡して呼び出した結果を返します。
  # 
  # [[m:Proc#<<]] とは呼び出しの順序が逆になります。
  # 
  # @param callable Proc、Method、もしくは任意の call メソッドを持ったオブジェクト。
  # 
  # //emlist[例][ruby]{
  # f = proc { |x| x * x }
  # g = proc { |x| x + x }
  # 
  # # (3 * 3) + (3 * 3)
  # p (f >> g).call(3) # => 18
  # //}
  # 
  # //emlist[call を定義したオブジェクトを渡す例][ruby]{
  # class WordScanner
  #   def self.call(str)
  #     str.scan(/\w+/)
  #   end
  # end
  # 
  # File.write('testfile', <<~TEXT)
  #   Hello, World!
  #   Hello, Ruby!
  # TEXT
  # 
  # pipeline = proc { |fname| File.read(fname) } >> WordScanner >> method(:p)
  # pipeline.call('testfile') # => ["Hello", "World", "Hello", "Ruby"]
  # //}
  # 
  # @see [[m:Method#<<]], [[m:Method#>>]]
  def >>; end

  # --- arity -> Integer
  # 
  # Proc オブジェクトが受け付ける引数の数を返します。
  # 
  # ただし、可変長引数を受け付ける場合、負の整数
  # 
  #   -(必要とされる引数の数 + 1)
  # 
  # を返します。
  # 
  # //emlist[例][ruby]{
  # lambda{           }.arity   # => 0
  # lambda{||         }.arity   # =>  0
  # lambda{|x|        }.arity   # =>  1
  # lambda{|*x|       }.arity   # => -1
  # lambda{|x, y|     }.arity   # =>  2
  # lambda{|x, *y|    }.arity   # => -2
  # lambda{|(x, y)|   }.arity   # =>  1
  # lambda{|(x, y), z|}.arity   # =>  2
  # //}
  def arity; end

  # --- binding -> Binding
  # 
  # Proc オブジェクトが保持するコンテキストを 
  # [[c:Binding]] オブジェクトで返します。
  # 
  # //emlist[例][ruby]{
  # def fred(param)
  #   proc {}
  # end
  # 
  # sample_proc = fred(99)
  # eval("param", sample_proc.binding)   # => 99
  # //}
  def binding; end

  # --- curry         -> Proc
  # --- curry(arity)  -> Proc
  # Procをカリー化します
  # 
  # カリー化したProcはいくつかの引数をとります。十分な数の引数が与えられると、元のProcに引数を渡し
  # て実行し、結果を返します。引数の個数が足りないときは、部分適用したカリー化Procを返します。
  # 
  # @param arity 引数の個数を指定します
  # @return カリー化したProcオブジェクトを返します
  # 
  # //emlist[例][ruby]{
  # b = proc {|x, y, z| (x||0) + (y||0) + (z||0) }
  # p b.curry[1][2][3]           #=> 6
  # p b.curry[1, 2][3, 4]        #=> 6
  # p b.curry(5)[1][2][3][4][5]  #=> 6
  # p b.curry(5)[1, 2][3, 4][5]  #=> 6
  # p b.curry(1)[1]              #=> 1
  # 
  # b = proc {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.sum }
  # p b.curry[1][2][3]           #=> 6
  # p b.curry[1, 2][3, 4]        #=> 10
  # p b.curry(5)[1][2][3][4][5]  #=> 15
  # p b.curry(5)[1, 2][3, 4][5]  #=> 15
  # p b.curry(1)[1]              #=> 1
  # 
  # b = lambda {|x, y, z| (x||0) + (y||0) + (z||0) }
  # p b.curry[1][2][3]           #=> 6
  # p b.curry[1, 2][3, 4]        #=> wrong number of arguments (given 4, expected 3)
  # p b.curry(5)                 #=> wrong number of arguments (given 5, expected 3)
  # p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3)
  # 
  # b = lambda {|x, y, z, *w| (x||0) + (y||0) + (z||0) + w.sum }
  # p b.curry[1][2][3]           #=> 6
  # p b.curry[1, 2][3, 4]        #=> 10
  # p b.curry(5)[1][2][3][4][5]  #=> 15
  # p b.curry(5)[1, 2][3, 4][5]  #=> 15
  # p b.curry(1)                 #=> wrong number of arguments (given 1, expected 3+)
  # 
  # b = proc { :foo }
  # p b.curry[]                  #=> :foo
  # //}
  def curry; end

  # --- hash -> Integer
  # 
  # self のハッシュ値を返します。
  def hash; end

  # --- to_s    -> String
  # --- inspect -> String
  # 
  # self の文字列表現を返します。
  # 
  # 可能なら self を生成したソースファイル名、行番号を含みます。
  # 
  # //emlist[例][ruby]{
  # p Proc.new {
  #    true
  # }.to_s
  # 
  # # => "#<Proc:0x0x401a880c@-:3>"
  # //}
  def inspect; end

  # --- lambda? -> bool
  # 手続きオブジェクトの引数の取扱が厳密であるならば true を返します。
  # 
  # 
  # 引数の取扱の厳密さの意味は以下の例を参考にしてください。
  # 
  # //emlist[例][ruby]{
  # # lambda で生成した Proc オブジェクトでは true 
  # lambda{}.lambda? # => true
  # # proc で生成した Proc オブジェクトでは false
  # proc{}.lambda?   # => false
  # # Proc.new で生成した Proc オブジェクトでは false
  # Proc.new{}.lambda? # => false
  # 
  # # 以下、lambda?が偽である場合
  # # 余分な引数を無視する
  # proc{|a,b| [a,b]}.call(1,2,3) # => [1,2]
  # # 足りない引数には nil が渡される
  # proc{|a,b| [a,b]}.call(1) # => [1, nil]
  # # 配列1つだと展開される
  # proc{|a,b| [a,b]}.call([1,2]) # => [1,2]
  # # lambdaの場合これらはすべて ArgumentError となる
  #  
  # # &が付いた仮引数で生成される Proc は lambda? が偽となる
  # def n(&b) b.lambda? end
  # n {} # => false
  # 
  # # &が付いた実引数によるものは、lambda?が元の Procオブジェクトから
  # # 引き継がれる
  # lambda(&lambda {}).lambda?   #=> true
  # proc(&lambda {}).lambda?     #=> true
  # Proc.new(&lambda {}).lambda? #=> true
  # 
  # lambda(&proc {}).lambda?     #=> false
  # proc(&proc {}).lambda?       #=> false
  # Proc.new(&proc {}).lambda?   #=> false
  # 
  # n(&lambda {})                #=> true
  # n(&proc {})                  #=> false
  # n(&Proc.new {})              #=> false
  # 
  # # Method#to_proc によるものは lambda?が真となる
  # def m() end
  # method(:m).to_proc.lambda? #=> true
  # 
  # # Module#define_method は特別扱いで、
  # # これで定義されたメソッドの引数は常に厳密に取り扱われる
  # class C
  #   define_method(:d) {}
  # end
  # C.new.d(1,2)       #=> ArgumentError
  # C.new.method(:d).to_proc.lambda?   #=> true
  # 
  # class C
  #   define_method(:e, &proc {})
  # end
  # C.new.e(1,2)       #=> ArgumentError
  # C.new.method(:e).to_proc.lambda?   #=> true
  # //}
  def lambda?; end

  # --- parameters -> [object]
  # Proc オブジェクトの引数の情報を返します。
  # 
  # Proc オブジェクトが引数を取らなければ空の配列を返します。引数を取る場合は、配列の配列を返し、
  # 各配列の要素は引数の種類に対応した以下のような Symbol と、引数名を表す Symbol の 2 要素です。
  # 
  # : :req
  #  必須の引数
  # : :opt
  #  デフォルト値が指定されたオプショナルな引数
  # : :rest
  #  * で指定された残りすべての引数
  # : :keyreq
  #  必須のキーワード引数
  # : :key
  #  デフォルト値が指定されたオプショナルなキーワード引数
  # : :keyrest
  #  ** で指定された残りのキーワード引数
  # : :block
  #  & で指定されたブロック引数
  # 
  # //emlist[例][ruby]{
  # prc = lambda{|x, y=42, *other, k_x:, k_y: 42, **k_other, &b|}
  # prc.parameters #=> [[:req, :x], [:opt, :y], [:rest, :other], [:keyreq, :k_x], [:key, :k_y], [:keyrest, :k_other], [:block, :b]]
  # //}
  # 
  # @see [[m:Method#parameters]], [[m:UnboundMethod#parameters]]
  def parameters; end

  # --- ruby2_keywords -> proc
  # 
  # Marks the proc as passing keywords through a normal argument splat. This
  # should only be called on procs that accept an argument splat (`*args`)
  # but not explicit keywords or a keyword splat.  It marks the proc such
  # that if the proc is called with keyword arguments, the final hash
  # argument is marked with a special flag such that if it is the final
  # element of a normal argument splat to another method call, and that
  # method call does not include explicit keywords or a keyword splat, the
  # final element is interpreted as keywords.  In other words, keywords will
  # be passed through the proc to other methods.
  # 
  # This should only be used for procs that delegate keywords to another
  # method, and only for backwards compatibility with Ruby versions before
  # 2.7.
  # 
  # This method will probably be removed at some point, as it exists only
  # for backwards compatibility. As it does not exist in Ruby versions
  # before 2.7, check that the proc responds to this method before calling
  # it. Also, be aware that if this method is removed, the behavior of the
  # proc will change so that it does not pass through keywords.
  # 
  # //emlist[][ruby]{
  # module Mod
  #   foo = ->(meth, *args, &block) do
  #     send(:"do_#{meth}", *args, &block)
  #   end
  #   foo.ruby2_keywords if foo.respond_to?(:ruby2_keywords)
  # end
  # //}
  def ruby2_keywords; end

  # --- source_location -> [String, Integer] | nil
  # ソースコードのファイル名と行番号を配列で返します。
  # 
  # その手続オブジェクトが ruby で定義されていない(つまりネイティブ
  # である)場合は nil を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # # /path/to/target.rb を実行
  # proc {}.source_location            # => ["/path/to/target.rb", 1]
  # proc {}.source_location            # => ["/path/to/target.rb", 2]
  # (eval "proc {}").source_location   # => ["(eval)", 1]
  # method(:p).to_proc.source_location # => nil
  # //}
  # 
  # @see [[m:Method#source_location]]
  def source_location; end

  # --- to_proc -> self
  # 
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # pr = proc {}
  # p pr == pr.to_proc # => true
  # //}
  def to_proc; end

  # --- new -> Proc
  # --- new { ... } -> Proc
  # 
  # ブロックをコンテキストとともにオブジェクト化して返します。
  # 
  # ブロックを指定しない場合、Ruby 2.7 では
  # [[m:$VERBOSE]] = true のときには警告メッセージ
  # 「warning: Capturing the given block using Proc.new is deprecated; use `&block` instead」
  # が出力され、Ruby 3.0 では
  # [[c:ArgumentError]] (tried to create Proc object without a block)
  # が発生します。
  # 
  # ブロックを指定しなければ、このメソッドを呼び出したメソッドが
  # ブロックを伴うときに、それを Proc オブジェクトとして生成して返します。
  # 
  # ただし、ブロックを指定しない呼び出しは推奨されていません。呼び出し元のメソッドで指定されたブロック
  # を得たい場合は明示的に & 引数でうけるべきです。
  # 
  # @raise ArgumentError スタック上にブロックがないのにブロックを省略した呼び出しを行ったときに発生します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   pr = Proc.new
  #   pr.call(1)
  # end
  # foo {|arg| p arg }
  # # => 1
  # //}
  # 
  # これは以下と同じです。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   yield(1)
  # end
  # foo {|arg| p arg }
  # # => 1
  # //}
  # 
  # 呼び出し元のメソッドがブロックを伴わなければ、例外
  # [[c:ArgumentError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   Proc.new
  # end
  # foo
  # # => -:2:in `new': tried to create Proc object without a block (ArgumentError)
  # #        from -:2:in `foo'
  # #        from -:4:in `<main>'
  # //}
  # 
  # Proc.new は、Proc#initialize が定義されていれば
  # オブジェクトの初期化のためにこれを呼び出します。このことを
  # 除けば、[[m:Kernel.#proc]] と同じです。
  def new; end

end
