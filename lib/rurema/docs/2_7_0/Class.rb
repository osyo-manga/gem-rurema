class Class
  # --- _load(str)    -> Class
  # 
  # [[m:Object#_dump]] を参照して下さい。
  # 
  # @param str Ruby のオブジェクトがダンプされた文字列を指定します。
  def _load; end

  # --- allocate    -> object
  # 
  # 自身のインスタンスを生成して返します。生成したオブジェクトは
  # 自身のインスタンスであること以外には何も特性を持ちません。
  # 
  # //emlist[例][ruby]{
  # klass = Class.new do
  #   def initialize(*args)
  #     @initialized = true
  #   end
  # 
  #   def initialized?
  #     @initialized || false
  #   end
  # end
  # 
  # klass.allocate.initialized? #=> false
  # //}
  def allocate; end

  # --- inherited(subclass)     -> ()
  # 
  # クラスのサブクラスが定義された時、新しく生成されたサブクラスを引数
  # にインタプリタから呼び出されます。このメソッドが呼ばれるタイミングは
  # クラス定義文の実行直前です。
  # 
  # @param subclass プログラム内で新たに定義された自身のサブクラスです。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def Foo.inherited(subclass)
  #     puts "class \"#{self}\" was inherited by \"#{subclass}\""
  #   end
  # end
  # class Bar < Foo
  #   puts "executing class body"
  # end
  # 
  # # => class "Foo" was inherited by "Bar"
  # #    executing class body
  # //}
  def inherited; end

  # --- json_creatable? -> bool
  # 
  # シリアライズされた JSON 形式の文字列から、インスタンスを作成するのにこのクラスを使用できる場合は
  # 真を返します。そうでない場合は、偽を返します。
  # 
  # このメソッドが真を返すクラスは json_create というメソッドを実装していなければなりません。
  # また json_create の第一引数は必要なデータを含むハッシュを期待しています。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # String.json_creatable?  # => true
  # Dir.json_creatable?     # => false
  # //}
  def json_creatable?; end

  # --- new(*args, &block)    -> object
  # 
  # 自身のインスタンスを生成して返します。
  # このメソッドの引数はブロック引数も含め [[m:Object#initialize]] に渡されます。
  # 
  # new は [[m:Class#allocate]] でインスタンスを生成し、
  # [[m:Object#initialize]] で初期化を行います。
  # 
  # @param args [[m:Object#initialize]] に渡される引数を指定します。
  # 
  # @param block [[m:Object#initialize]] に渡されるブロックを指定します。
  # 
  # //emlist[例][ruby]{
  # # [[c:Class]] クラスのインスタンス、C クラスを生成
  # C = Class.new   # => C
  # 
  # # [[c:Class]] クラスのインスタンス、C クラスのインスタンスを生成
  # C.new           # => #<C:0x00005623f8b4e458>
  # //}
  def new; end

  # --- superclass    -> Class | nil
  # 
  # 自身のスーパークラスを返します。
  # 
  # //emlist[例][ruby]{
  # File.superclass          #=> IO
  # IO.superclass            #=> Object
  # class Foo; end
  # class Bar < Foo; end
  # Bar.superclass           #=> Foo
  # Object.superclass        #=> BasicObject
  # //}
  # 
  # ただし [[c:BasicObject]].superclass は nil を返します。
  # 
  # //emlist[例][ruby]{
  # BasicObject.superclass   #=> nil
  # //}
  def superclass; end

  # --- new(superclass = Object)                -> Class
  # --- new(superclass = Object) {|klass| ... } -> Class
  # 
  # 新しく名前の付いていない superclass のサブクラスを生成します。
  # 
  # 名前のないクラスは、最初に名前を求める際に代入されている定数名を検
  # 索し、見つかった定数名をクラス名とします。
  # 
  # //emlist[例][ruby]{
  # p foo = Class.new   # => #<Class:0x401b90f8>
  # p foo.name          # => nil
  # Foo = foo           # ここで p foo すれば "Foo" 固定
  # Bar = foo
  # p foo.name          # => "Bar"  ("Foo" になるか "Bar" になるかは不定)
  # //}
  # 
  # ブロックが与えられた場合、生成したクラスを引数として
  # クラスのコンテキストでブロックを実行します。以下のコードと同じです。
  # 
  # //emlist[例][ruby]{
  # klass = Class.new(superclass)
  # klass.module_eval {|m|
  #   # ...
  # }
  # klass
  # //}
  # 
  # この場合も生成したクラスを返します。
  # ブロックの実行は Class#initialize が行います。
  # 
  # @param superclass 生成するクラスのスーパークラスを指定します。
  # 
  # //emlist[例][ruby]{
  # k = Class.new{|c|
  #   def initialize
  #     p "in initialize"
  #   end
  # 
  #   def hoge
  #     p "hoge hoge hoge"
  #   end
  # }
  # o = k.new              #=> "in initialize"
  # o.hoge                 #=> "hoge hoge hoge"
  # //}
  def new; end

end
