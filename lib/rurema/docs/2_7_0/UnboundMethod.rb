class UnboundMethod
  # --- ==(other)     -> bool
  # --- eql?(other)   -> bool
  # 
  # 自身と other が同じクラスあるいは同じモジュールの同じメソッドを表す場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # a = String.instance_method(:size)
  # b = String.instance_method(:size)
  # p a == b                            #=> true
  # 
  # c = Array.instance_method(:size)
  # p a == c                            #=> false
  # //}
  def ==; end

  # --- arity    -> Integer
  # 
  # メソッドが受け付ける引数の数を返します。
  # 
  # ただし、メソッドが可変長引数を受け付ける場合、負の整数
  #   -(必要とされる引数の数 + 1)
  # を返します。C 言語レベルで実装されたメソッドが可変長引数を
  # 受け付ける場合、-1 を返します。
  # 
  # //emlist[例][ruby]{
  # class C
  #   def one;    end
  #   def two(a); end
  #   def three(*a);  end
  #   def four(a, b); end
  #   def five(a, b, *c);    end
  #   def six(a, b, *c, &d); end
  # end
  # 
  # p C.instance_method(:one).arity     #=> 0
  # p C.instance_method(:two).arity     #=> 1
  # p C.instance_method(:three).arity   #=> -1
  # p C.instance_method(:four).arity    #=> 2
  # p C.instance_method(:five).arity    #=> -3
  # p C.instance_method(:six).arity     #=> -3
  # 
  # 
  # String.instance_method(:size).arity      #=> 0
  # String.instance_method(:replace).arity   #=> 1
  # String.instance_method(:squeeze).arity   #=> -1
  # String.instance_method(:count).arity     #=> -1
  # //}
  def arity; end

  # --- bind(obj)    -> Method
  # 
  # self を obj にバインドした [[c:Method]] オブジェクトを生成して返します。
  # 
  # 
  # @param obj 自身をバインドしたいオブジェクトを指定します。ただしバインドできるのは、
  #            生成元のクラスかそのサブクラスのインスタンスのみです。
  # 
  # @raise TypeError objがbindできないオブジェクトである場合に発生します
  # 
  # //emlist[例][ruby]{
  # # クラスのインスタンスメソッドの UnboundMethod の場合
  # class Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # 
  # # UnboundMethod `m' を生成
  # p m = Foo.instance_method(:foo) # => #<UnboundMethod: Foo#foo>
  # 
  # # Foo のインスタンスをレシーバとする Method オブジェクトを生成
  # p m.bind(Foo.new)               # => #<Method: Foo#foo>
  # 
  # # Foo のサブクラス Bar のインスタンスをレシーバとする Method
  # class Bar < Foo
  # end
  # p m.bind(Bar.new)               # => #<Method: Bar(Foo)#foo>
  # 
  # 
  # # モジュールのインスタンスメソッドの UnboundMethod の場合
  # module Foo
  #   def foo
  #     "foo"
  #   end
  # end
  # 
  # # UnboundMethod `m' を生成
  # p m = Foo.instance_method(:foo) # => #<UnboundMethod: Foo#foo>
  # 
  # # Foo をインクルードしたクラス Bar のインスタンスをレシーバと
  # # する Method オブジェクトを生成
  # class Bar
  #   include Foo
  # end
  # p m.bind(Bar.new)               # => #<Method: Bar(Foo)#foo>
  # //}
  # 
  # @see [[m:UnboundMethod#bind_call]]
  def bind; end

  # --- bind_call(recv, *args) -> object
  # --- bind_call(recv, *args) { ... } -> object
  # 
  # self を recv に bind して args を引数として呼び出します。
  # 
  # self.bind(recv).call(*args) と同じ意味です。
  # 
  # //emlist[][ruby]{
  # puts Kernel.instance_method(:inspect).bind_call(BasicObject.new) # => #<BasicObject:0x000055c65e8ea7b8>
  # //}
  # 
  # @see [[m:UnboundMethod#bind]], [[m:Method#call]]
  def bind_call; end

  # --- clone -> UnboundMethod
  # 
  # 自身を複製した [[c:UnboundMethod]] オブジェクトを作成して返します。
  # 
  # //emlist[例][ruby]{
  # a = String.instance_method(:size)
  # b = a.clone
  # 
  # a == b       # => true
  # //}
  def clone; end

  # --- hash    -> Integer
  # 
  # 自身のハッシュ値を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # a = method(:==).unbind
  # b = method(:eql?).unbind
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
  # 詳しくは [[m:Method#inspect]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # String.instance_method(:count).inspect   # => "#<UnboundMethod: String#count>"
  # //}
  # 
  # @see [[m:Method#inspect]]
  def inspect; end

  # --- name    -> Symbol
  # 
  # このメソッドの名前を返します。
  # 
  # //emlist[例][ruby]{
  # a = String.instance_method(:size)
  # a.name   # => :size
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
  # C.instance_method(:bar).original_name # => :foo
  # //}
  # 
  # @see [[m:Method#original_name]]
  def original_name; end

  # --- owner    -> Class | Module
  # 
  # このメソッドが定義されている class か module を返します。
  # 
  # //emlist[例][ruby]{
  # Integer.instance_method(:to_s).owner   # => Integer
  # Integer.instance_method(:to_c).owner   # => Numeric
  # Integer.instance_method(:hash).owner   # => Kernel
  # //}
  def owner; end

  # --- parameters -> [object]
  # 
  # UnboundMethod オブジェクトの引数の情報を返します。
  # 
  # 詳しくは [[m:Method#parameters]] を参照してください。
  # 
  # 
  # 
  # @see [[m:Proc#parameters]], [[m:Method#parameters]]
  def parameters; end

  # --- source_location -> [String, Integer] | nil
  # 
  # ソースコードのファイル名と行番号を配列で返します。
  # 
  # その手続オブジェクトが ruby で定義されていない(つまりネイティブ
  # である)場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # require 'time'
  # 
  # Time.instance_method(:zone).source_location       # => nil
  # Time.instance_method(:httpdate).source_location   # => ["/Users/user/.rbenv/versions/2.4.3/lib/ruby/2.4.0/time.rb", 654]
  # //}
  # 
  # @see [[m:Proc#source_location]], [[m:Method#source_location]]
  def source_location; end

  # --- super_method -> UnboundMethod | nil
  # 
  # self 内で super を実行した際に実行されるメソッドを [[c:UnboundMethod]] オブジェ
  # クトにして返します。
  # 
  # 
  # @see [[m:Method#super_method]]
  def super_method; end

end
