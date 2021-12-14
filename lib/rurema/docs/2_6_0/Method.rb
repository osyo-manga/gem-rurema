class Method
  # --- <<(callable) -> Proc
  # 
  # self と引数を合成した Proc を返します。
  # 
  # 戻り値の Proc は可変長の引数を受け取ります。
  # 戻り値の Proc を呼び出すと、まず受け取った引数を callable に渡して呼び出し、
  # その戻り値を self に渡して呼び出した結果を返します。
  # 
  # [[m:Method#>>]] とは呼び出しの順序が逆になります。
  # 
  # @param callable Proc、Method、もしくは任意の call メソッドを持ったオブジェクト。
  # 
  # //emlist[例][ruby]{
  # def f(x)
  #   x * x
  # end
  # 
  # def g(x)
  #   x + x
  # end
  # 
  # # (3 + 3) * (3 + 3)
  # p (method(:f) << method(:g)).call(3) # => 36
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
  # pipeline = method(:pp) << WordScanner << File.method(:read)
  # pipeline.call('testfile') # => ["Hello", "World", "Hello", "Ruby"]
  # //}
  # 
  # @see [[m:Proc#<<]], [[m:Proc#>>]]
  def <<; end

  # --- ==(other)     -> bool
  # --- eql?(other)   -> bool
  # 
  # 自身と other が同じインスタンスの同じメソッドを表す場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # s = "bar"
  # a = s.method(:size)
  # b = s.method(:size)
  # p a == b                            #=> true
  # //}
  def ==; end

  # --- [](*args) -> object
  # --- call(*args) -> object
  # --- call(*args) { ... } -> object
  # --- ===(*args) -> object
  # 
  # メソッドオブジェクトに封入されているメソッドを起動します。
  # 
  # 引数やブロックはそのままメソッドに渡されます。
  # 
  # self[] の形の呼び出しは通常のメソッド呼び出しに見た目を
  # 近付けるためだけに用意されたもので、Array#[]のような
  # 他の [] メソッドとの意味的な関連性はありません。
  # 
  # メソッドオブジェクトが汚染されている場合、そのメソッドは、セーフレベル 4 で実行されます
  # 
  # @param args self に渡される引数。
  # 
  # @see [[d:spec/safelevel]]
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo(arg)
  #     "foo called with arg #{arg}"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m[1]      # => "foo called with arg 1"
  # m.call(2) # => "foo called with arg 2"
  # //}
  def ===; end

  # --- >>(callable) -> Proc
  # 
  # self と引数を合成した Proc を返します。
  # 
  # 戻り値の Proc は可変長の引数を受け取ります。
  # 戻り値の Proc を呼び出すと、まず受け取った引数を self に渡して呼び出し、
  # その戻り値を callable に渡して呼び出した結果を返します。
  # 
  # [[m:Method#<<]] とは呼び出しの順序が逆になります。
  # 
  # @param callable Proc、Method、もしくは任意の call メソッドを持ったオブジェクト。
  # 
  # //emlist[例][ruby]{
  # def f(x)
  #   x * x
  # end
  # 
  # def g(x)
  #   x + x
  # end
  # 
  # # (3 * 3) + (3 * 3)
  # p (method(:f) >> method(:g)).call(3) # => 18
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
  # pipeline = File.method(:read) >> WordScanner >> method(:pp)
  # pipeline.call('testfile') # => ["Hello", "World", "Hello", "Ruby"]
  # //}
  # 
  # @see [[m:Proc#<<]], [[m:Proc#>>]]
  def >>; end

  # --- arity -> Integer
  # 
  # メソッドが受け付ける引数の数を返します。
  # 
  # ただし、メソッドが可変長引数を受け付ける場合、負の整数
  # 
  #   -(必要とされる引数の数 + 1)
  # 
  # を返します。C 言語レベルで実装されたメソッドが可変長引数を
  # 受け付ける場合、-1 を返します。
  # 
  # //emlist[例][ruby]{
  # class C
  #   def u;               end
  #   def v(a);            end
  #   def w(*a);           end
  #   def x(a, b);         end
  #   def y(a, b, *c);     end
  #   def z(a, b, *c, &d); end
  # end
  # 
  # c = C.new
  # p c.method(:u).arity     #=> 0
  # p c.method(:v).arity     #=> 1
  # p c.method(:w).arity     #=> -1
  # p c.method(:x).arity     #=> 2
  # p c.method(:y).arity     #=> -3
  # p c.method(:z).arity     #=> -3
  # 
  # s = "xyz"
  # s.method(:size).arity      #=> 0
  # s.method(:replace).arity   #=> 1
  # s.method(:squeeze).arity   #=> -1
  # s.method(:count).arity     #=> -1
  # //}
  def arity; end

  # --- clone -> Method
  # 
  # 自身を複製した [[c:Method]] オブジェクトを作成して返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m.call # => "foo"
  # 
  # m.clone # => #<Method: Foo#foo>
  # m.clone.call # => "foo"
  # //}
  def clone; end

  # --- curry        -> Proc
  # --- curry(arity) -> Proc
  # 
  # self を元にカリー化した [[c:Proc]] を返します。
  # 
  # カリー化した [[c:Proc]] はいくつかの引数をとります。十分な数の引数が与
  # えられると、元の [[c:Proc]] に引数を渡し て実行し、結果を返します。引数
  # の個数が足りないときは、部分適用したカリー化 [[c:Proc]] を返します。
  # 
  # @param arity 引数の個数を指定します。可変長の引数を指定できるメソッドを
  #              カリー化する際には必ず指定する必要があります。
  # 
  # //emlist[例][ruby]{
  # def foo(a,b,c)
  #   [a, b, c]
  # end
  # 
  # proc  = self.method(:foo).curry
  # proc2 = proc.call(1, 2)          #=> #<Proc>
  # proc2.call(3)                    #=> [1,2,3]
  # 
  # def vararg(*args)
  #   args
  # end
  # 
  # proc = self.method(:vararg).curry(4)
  # proc2 = proc.call(:x)      #=> #<Proc>
  # proc3 = proc2.call(:y, :z) #=> #<Proc>
  # proc3.call(:a)             #=> [:x, :y, :z, :a]
  # //}
  # 
  # @see [[m:Proc#curry]]
  def curry; end

  # --- hash    -> Integer
  # 
  # 自身のハッシュ値を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # a = method(:==)
  # b = method(:eql?)
  # p a.eql? b          # => true
  # p a.hash == b.hash  # => true
  # p [a, b].uniq.size  # => 1
  # //}
  def hash; end

  # --- inspect -> String
  # --- to_s    -> String
  # 
  # self を読みやすい文字列として返します。
  # 
  # 以下の形式の文字列を返します。
  # 
  #   #<Method: klass1(klass2)#method>                (形式1)
  # 
  # klass1 は、[[m:Method#inspect]] では、レシーバのクラス名、
  # [[m:UnboundMethod#inspect]] では、[[c:UnboundMethod]] オブジェクトの生成
  # 元となったクラス／モジュール名です。
  # 
  # klass2 は、実際にそのメソッドを定義しているクラス／モジュール名、
  # method は、メソッド名を表します。
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # class Bar
  #   include Foo
  #   def bar
  #   end
  # end
  # 
  # p Bar.new.method(:foo)        # => #<Method: Bar(Foo)#foo>
  # p Bar.new.method(:bar)        # => #<Method: Bar#bar>
  # //}
  # 
  # klass1 と klass2 が同じ場合は以下の形式になります。
  #   #<Method: klass1#method>                        (形式2)
  # 
  # 特異メソッドに対しては、
  #   #<Method: obj.method>                           (形式3)
  #   #<Method: klass1(klass2).method>                (形式4)
  # という形式の文字列を返します。二番目の形式では klass1 はレシーバ、
  # klass2 は実際にそのメソッドを定義しているオブジェクトになります。
  # 
  # //emlist[例][ruby]{
  # # オブジェクトの特異メソッド
  # obj = ""
  # class <<obj
  #   def foo
  #   end
  # end
  # p obj.method(:foo)      # => #<Method: "".foo>
  # 
  # # クラスメソッド(クラスの特異メソッド)
  # class Foo
  #   def Foo.foo
  #   end
  # end
  # p Foo.method(:foo)      # => #<Method: Foo.foo>
  # 
  # # スーパークラスのクラスメソッド
  # class Bar < Foo
  # end
  # p Bar.method(:foo)      # => #<Method: Bar.foo>
  # 
  # # 以下は(形式1)の出力になる
  # module Baz
  #   def baz
  #   end
  # end
  # 
  # class <<obj
  #   include Baz
  # end
  # p obj.method(:baz)      # => #<Method: Object(Baz)#baz>
  # //}
  # 
  # @see [[m:Object#inspect]]
  def inspect; end

  # --- name    -> Symbol
  # 
  # このメソッドの名前を返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo(arg)
  #     "foo called with arg #{arg}"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m.name # => :foo
  # //}
  def name; end

  # --- original_name -> Symbol
  # 
  # オリジナルのメソッド名を返します。
  # 
  # //emlist[例][ruby]{
  # class C
  #   def foo; end
  #   alias bar foo
  # end
  # C.new.method(:bar).original_name # => :foo
  # //}
  # 
  # @see [[m:UnboundMethod#original_name]]
  def original_name; end

  # --- owner    -> Class | Module
  # 
  # このメソッドが定義されている class か module を返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo(arg)
  #     "foo called with arg #{arg}"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m.owner # => Foo
  # 
  # m = Foo.new.method(:puts) # => #<Method: Foo(Kernel)#puts>
  # m.owner # => Kernel
  # //}
  def owner; end

  # --- parameters -> [object]
  # Method オブジェクトの引数の情報を返します。
  # 
  # Method オブジェクトが引数を取らなければ空の配列を返します。引数を取る場合は、配列の配列を返し、
  # 各配列の要素は引数の種類に応じた以下のような Symbol と、仮引数の名前を表す Symbol の 2 要素です。
  # 組み込みのメソッドでは、仮引数の名前が取れません。
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
  # m = Class.new{define_method(:m){|x, y=42, *other, k_x:, k_y: 42, **k_other, &b|}}.instance_method(:m)
  # m.parameters #=> [[:req, :x], [:opt, :y], [:rest, :other], [:keyreq, :k_x], [:key, :k_y], [:keyrest, :k_other], [:block, :b]]
  # File.method(:symlink).parameters #=> [[:req], [:req]]
  # //}
  # 
  # @see [[m:Proc#parameters]]
  def parameters; end

  # --- receiver    -> object
  # 
  # このメソッドオブジェクトのレシーバを返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo(arg)
  #     "foo called with arg #{arg}"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m.receiver # => #<Foo:0x007fb39203eb78>
  # m.receiver.foo(1) # => "foo called with arg 1"
  # //}
  def receiver; end

  # --- source_location -> [String, Integer] | nil
  # ソースコードのファイル名と行番号を配列で返します。
  # 
  # その手続オブジェクトが ruby で定義されていない(つまりネイティブ
  # である)場合は nil を返します。
  # 
  # @see [[m:Proc#source_location]]
  # 
  # //emlist[例][ruby]{
  # # ------- /tmp/foo.rb ---------
  # class Foo
  #   def foo; end
  # end
  # # ----- end of /tmp/foo.rb ----
  # 
  # require '/tmp/foo'
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # m.source_location # => ["/tmp/foo.rb", 2]
  # 
  # method(:puts).source_location # => nil
  # //}
  def source_location; end

  # --- super_method -> Method | nil
  # 
  # self 内で super を実行した際に実行されるメソッドを [[c:Method]] オブジェ
  # クトにして返します。
  # 
  # @see [[m:UnboundMethod#super_method]]
  # 
  # //emlist[例][ruby]{
  # class Super
  #   def foo
  #     "superclass method"
  #   end
  # end
  # 
  # class Sub < Super
  #   def foo
  #     "subclass method"
  #   end
  # end
  # 
  # m = Sub.new.method(:foo) # => #<Method: Sub#foo>
  # m.call # => "subclass method"
  # m.super_method # => #<Method: Super#foo>
  # m.super_method.call # => "superclass method"
  # //}
  def super_method; end

  # --- to_proc -> Proc
  # 
  # self を call する [[c:Proc]] オブジェクトを生成して返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # pr = m.to_proc # => #<Proc:0x007f874d026008 (lambda)>
  # pr.call # => "foo"
  # //}
  def to_proc; end

  # --- unbind -> UnboundMethod
  # 
  # self のレシーバとの関連を取り除いた [[c:UnboundMethod]] オブ
  # ジェクトを生成して返します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # 
  # m = Foo.new.method(:foo) # => #<Method: Foo#foo>
  # unbound_method = m.unbind # => #<UnboundMethod: Foo#foo>
  # unbound_method.bind(Foo.new) # => #<Method: Foo#foo>
  # //}
  def unbind; end

end
