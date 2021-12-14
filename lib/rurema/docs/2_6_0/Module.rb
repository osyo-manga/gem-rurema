class Module
  # --- <(other)  -> bool | nil
  # 
  # 比較演算子。self が other の子孫である場合、 true を返します。
  # self が other の先祖か同一のクラス／モジュールである場合、false を返します。
  # 
  # 継承関係にないクラス同士の比較では
  # nil を返します。
  # 
  # @param other 比較対象のモジュールやクラス
  # 
  # @raise TypeError other がクラスやモジュールではない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # module Foo
  # end
  # class Bar
  #   include Foo
  # end
  # class Baz < Bar
  # end
  # class Qux
  # end
  # p Bar < Foo     # => true
  # p Baz < Bar     # => true
  # p Baz < Foo     # => true
  # p Baz < Qux     # => nil
  # p Baz > Qux     # => nil
  # 
  # p Foo < Object.new # => in `<': compared with non class/module (TypeError)
  # //}
  def <; end

  # --- <=(other) -> bool | nil
  # 
  # 比較演算子。self が other の子孫であるか、self と other が
  # 同一クラスである場合、 true を返します。
  # self が other の先祖である場合、false を返します。
  # 
  # 継承関係にないクラス同士の比較では
  # nil を返します。
  # 
  # @param other 比較対象のモジュールやクラス
  # 
  # @raise TypeError other がクラスやモジュールではない場合に発生します。
  # 
  # @see [[m:Module#<]]
  # 
  # //emlist[例][ruby]{
  # module Foo; end
  # module Bar
  #   include Foo
  # end
  # module Baz
  #   prepend Foo
  # end
  # 
  # Bar.ancestors # => [Bar, Foo]
  # Foo <= Bar # => false
  # Bar <= Foo # => true
  # 
  # Baz.ancestors # => [Foo, Baz]
  # Foo <= Baz # => false
  # Baz <= Foo # => true
  # 
  # Foo <= Foo # => true
  # Foo <= Object # => nil
  # //}
  def <=; end

  # --- <=>(other) -> Integer | nil
  # 
  # self と other の継承関係を比較します。
  # 
  # self と other を比較して、
  # self が other の子孫であるとき -1、
  # 同一のクラス／モジュールのとき 0、
  # self が other の先祖であるとき 1
  # を返します。
  # 
  # 継承関係にないクラス同士の比較では
  # nil を返します。
  # 
  # other がクラスやモジュールでなければ
  # nil を返します。
  # 
  # @param other 比較対象のクラスやモジュール
  # 
  # //emlist[例][ruby]{
  # module Foo
  # end
  # class Bar
  #   include Foo
  # end
  # class Baz < Bar
  # end
  # class Qux
  # end
  # p Bar <=> Foo     # => -1
  # p Baz <=> Bar     # => -1
  # p Baz <=> Foo     # => -1
  # p Baz <=> Qux     # => nil
  # p Qux <=> Baz     # => nil
  # 
  # p Baz <=> Object.new  # => nil
  # //}
  def <=>; end

  # --- ===(obj) -> bool
  # 
  # 指定された obj が self かそのサブクラスのインスタンスであるとき真を返します。
  # また、obj が self をインクルードしたクラスかそのサブクラスのインスタンスである場合にも
  # 真を返します。上記のいずれでもない場合に false を返します。
  # 
  # 言い替えると obj.kind_of?(self) が true の場合、 true を返します。
  # 
  # このメソッドは主に case 文での比較に用いられます。
  # case ではクラス、モジュールの所属関係をチェックすることになります。
  # 
  # //emlist[例][ruby]{
  # str = String.new
  # case str
  # when String     # String === str を評価する
  #   p true        # => true
  # end
  # //}
  # 
  # @param obj 任意のオブジェクト
  # 
  # @see [[m:Object#kind_of?]], [[m:Object#instance_of?]], [[ref:d:spec/control#case]]
  def ===; end

  # --- >(other)  -> bool | nil
  # 
  # 比較演算子。 self が other の先祖である場合、true を返します。
  # self が other の子孫か同一クラスである場合、false を返します。
  # 
  # 継承関係にないクラス同士の比較では
  # nil を返します。
  # 
  # @param other 比較対象のモジュールやクラス
  # 
  # @raise TypeError other がクラスやモジュールではない場合に発生します。
  # 
  # @see [[m:Module#<]]
  # 
  # //emlist[例][ruby]{
  # module Awesome; end
  # module Included
  #   include Awesome
  # end
  # module Prepended
  #   prepend Awesome
  # end
  # 
  # Included.ancestors # => [Included, Awesome]
  # Awesome > Included # => true
  # Included > Awesome # => false
  # 
  # Prepended.ancestors # => [Awesome, Prepended]
  # Awesome > Prepended # => true
  # Prepended > Awesome # => false
  # 
  # Awesome > Awesome # => false
  # Awesome > Object # => nil
  # //}
  def >; end

  # --- >=(other) -> bool | nil
  # 
  # 比較演算子。self が other の先祖か同一クラスである場合、 true を返します。
  # self が other の子孫である場合、false を返します。
  # 
  # 継承関係にないクラス同士の比較では
  # nil を返します。
  # 
  # @param other 比較対象のモジュールやクラス
  # 
  # @raise TypeError other がクラスやモジュールではない場合に発生します。
  # 
  # @see [[m:Module#<]]
  # 
  # //emlist[例][ruby]{
  # module Foo; end
  # module Bar
  #   include Foo
  # end
  # module Baz
  #   prepend Foo
  # end
  # 
  # Bar.ancestors # => [Bar, Foo]
  # Foo >= Bar # => true
  # Bar >= Foo # => false
  # 
  # Baz.ancestors # => [Foo, Baz]
  # Foo >= Baz # => true
  # Baz >= Foo # => false
  # 
  # Foo >= Foo # => true
  # Foo >= Object # => nil
  # //}
  def >=; end

  # --- alias_method(new, original) -> self
  # 
  # メソッドの別名を定義します。
  # 
  # //emlist[例][ruby]{
  # module Kernel
  #   alias_method :hoge, :puts # => Kernel
  # end
  # //}
  # 
  # alias との違いは以下の通りです。
  # 
  #   * メソッド名は [[c:String]] または [[c:Symbol]] で指定します
  #   * グローバル変数の別名をつけることはできません
  # 
  # また、クラスメソッドに対して使用することはできません。
  # 
  # @param new 新しいメソッド名。[[c:String]] または [[c:Symbol]] で指定します。
  # 
  # @param original 元のメソッド名。[[c:String]] または [[c:Symbol]] で指定します。
  # 
  # @return self を返します。
  # 
  # @see [[ref:d:spec/def#alias]]
  # 
  # 例:
  #   module Kernel
  #     alias_method :foo, :puts
  #   end
  # 
  #   foo "bar" # bar
  def alias_method; end

  # --- ancestors -> [Class, Module]
  # 
  # クラス、モジュールのスーパークラスとインクルードしているモジュール
  # を優先順位順に配列に格納して返します。
  # 
  # //emlist[例][ruby]{
  # module Foo
  # end
  # class Bar
  #   include Foo
  # end
  # class Baz < Bar
  #   p ancestors
  #   p included_modules
  #   p superclass
  # end
  # # => [Baz, Bar, Foo, Object, Kernel, BasicObject]
  # # => [Foo, Kernel]
  # # => Bar
  # //}
  # 
  # @see [[m:Module#included_modules]]
  def ancestors; end

  # --- append_features(module_or_class) -> self
  # 
  # モジュール(あるいはクラス)に self の機能を追加します。
  # 
  # このメソッドは [[m:Module#include]] の実体であり、
  # include を Ruby で書くと以下のように定義できます。
  # 
  # //emlist[例][ruby]{
  # def include(*modules)
  #   modules.reverse_each do |mod|
  #     # append_features や included はプライベートメソッドなので
  #     # 直接 mod.append_features(self) などとは書けない
  #     mod.__send__(:append_features, self)
  #     mod.__send__(:included, self)
  #   end
  # end
  # //}
  # 
  # @see [[m:Module#included]]
  def append_features; end

  # --- attr(*name) -> nil
  # --- attr(name, true) -> nil
  # --- attr(name, false) -> nil
  # 
  # インスタンス変数読み取りのためのインスタンスメソッド name を定義します。
  # 
  # 
  # このメソッドで定義されるアクセスメソッドの定義は次の通りです。
  # 
  #   def name
  #     @name
  #   end
  # 
  # 第 2 引数 が true で指定された場合には、属性の書き込み用メソッド name= も同時に定義されます。
  # その定義は次の通りです。
  # 
  #   def name=(val)
  #     @name = val
  #   end
  # 
  # 第 2 引数 に true か false を指定する方法は非推奨です。
  # 
  # @param name [[c:String]] または [[c:Symbol]] で指定します。
  def attr; end

  # --- attr_accessor(*name) -> nil
  # 
  # インスタンス変数 name に対する読み取りメソッドと書き込みメソッドの両方を
  # 定義します。
  # 
  # 
  # このメソッドで定義されるメソッドの定義は以下の通りです。
  # 
  #   def name
  #     @name
  #   end
  #   def name=(val)
  #     @name = val
  #   end
  # 
  # @param name [[c:String]] または [[c:Symbol]] を 1 つ以上指定します。
  def attr_accessor; end

  # --- attr_reader(*name) -> nil
  # 
  # インスタンス変数 name の読み取りメソッドを定義します。
  # 
  # 
  # このメソッドで定義されるメソッドの定義は以下の通りです。
  # 
  #   def name
  #     @name
  #   end
  # 
  # @param name [[c:String]] または [[c:Symbol]] を 1 つ以上指定します。
  def attr_reader; end

  # --- attr_writer(*name) -> nil
  # 
  # インスタンス変数 name への書き込みメソッド (name=) を定義します。
  # 
  # 
  # このメソッドで定義されるメソッドの定義は以下の通りです。
  # 
  #   def name=(val)
  #     @name = val
  #   end
  # 
  # @param name [[c:String]] または [[c:Symbol]] を 1 つ以上指定します。
  def attr_writer; end

  # --- autoload(const_name, feature) -> nil
  # 
  # 定数 const_name を最初に参照した時に feature を [[m:Kernel.#require]] するように設定します。
  # 
  # @param const_name [[c:String]] または [[c:Symbol]] で指定します。
  #        なお、const_name には、"::" 演算子を含めることはできません。
  #        つまり、self の直下に定義された定数しか指定できません。
  # 
  # @param feature [[m:Kernel.#require]] と同様な方法で autoload する対象を指定する。
  # 
  # //emlist[例][ruby]{
  # # ------- /tmp/foo.rb ---------
  # class Foo
  #   class Bar
  #   end
  # end
  # # ----- end of /tmp/foo.rb ----
  # 
  # class Foo
  #   autoload :Bar, '/tmp/foo'
  # end
  # p Foo::Bar #=> Foo::Bar
  # //}
  # 
  # 以下のようにモジュールを明示的にレシーバとして呼び出すこともできます。
  # 
  # //emlist[例][ruby]{
  # # ------- /tmp/foo.rb ---------
  # class Foo
  #   class Bar
  #   end
  # end
  # # ----- end of /tmp/foo.rb ----
  # 
  # class Foo
  # end
  # Foo.autoload :Bar, '/tmp/foo'
  # p Foo::Bar #=> Foo::Bar
  # //}
  # 
  # 以下のように、autoload したライブラリがネストした定数を定義しない場
  # 合、NameError が発生します。
  # 
  # //emlist[例][ruby]{
  # # ------- /tmp/bar.rb ---------
  # class Bar
  # end
  # # ----- end of /tmp/bar.rb ----
  # 
  # class Foo
  #   autoload :Bar, '/tmp/bar.rb'
  # end
  # p Foo::Bar
  # #=> -:4:in `<main>': uninitialized constant Foo::Bar (NameError)
  # //}
  # 
  # @see [[m:Kernel.#autoload]]
  def autoload; end

  # --- autoload?(const_name) -> String | nil
  # autoload 定数がまだ定義されてない(ロードされていない) ときにそのパス名を返します。
  # また、ロード済みなら nil を返します。
  # 
  # @param const_name [[c:String]] または [[c:Symbol]] で指定します。
  # 
  # @see [[m:Kernel.#autoload?]]
  # 
  # //emlist[例][ruby]{
  # autoload :Date, 'date'
  # 
  # autoload?(:Date) # => "date"
  # Date
  # autoload?(:Date) # => nil
  # autoload?(:Foo) # => nil
  # //}
  def autoload?; end

  # --- module_eval(expr, fname = "(eval)", lineno = 1) -> object
  # --- module_eval{|mod| ... }                         -> object
  # --- class_eval(expr, fname = "(eval)", lineno = 1)  -> object
  # --- class_eval{|mod| ... }                          -> object
  # 
  # モジュールのコンテキストで文字列 expr またはモジュール自身をブロックパラメータとするブロックを
  # 評価してその結果を返します。
  # 
  # モジュールのコンテキストで評価するとは、実行中そのモジュールが self になるということです。
  # つまり、そのモジュールの定義式の中にあるかのように実行されます。
  # 
  # ただし、ローカル変数は module_eval/class_eval の外側のスコープと共有します。
  # 
  # 文字列が与えられた場合には、定数とクラス変数のスコープは自身のモジュール定義式内と同じスコープになります。
  # ブロックが与えられた場合には、定数とクラス変数のスコープはブロックの外側のスコープになります。
  # 
  # 
  # @param expr 評価される文字列。
  # 
  # @param fname 文字列を指定します。ファイル fname に文字列 expr が書かれているかのように実行されます。
  #              スタックトレースの表示などを差し替えることができます。
  # 
  # @param lineno 文字列を指定します。行番号 lineno から文字列 expr が書かれているかのように実行されます。
  #               スタックトレースの表示などを差し替えることができます。
  # 
  # //emlist[例][ruby]{
  # class C
  # end
  # a = 1
  # C.class_eval %Q{
  #   def m                   # メソッドを動的に定義できる。
  #     return :m, #{a}
  #   end
  # }
  # 
  # p C.new.m        #=> [:m, 1]
  # //}
  # 
  # @see [[m:BasicObject#instance_eval]], [[m:Module.new]], [[m:Kernel.#eval]]
  def class_eval; end

  # --- module_exec(*args) {|*vars| ... }       -> object
  # --- class_exec(*args) {|*vars| ... }        -> object
  # 
  # 与えられたブロックを指定された args を引数としてモジュールのコンテキストで評価します。
  # 
  # モジュールのコンテキストで評価するとは、実行中そのモジュールが self になるということです。
  # つまり、そのモジュールの定義式の中にあるかのように実行されます。
  # 
  # ローカル変数、定数とクラス変数のスコープはブロックの外側のスコープになります。
  # 
  # @param args ブロックに渡す引数を指定します。
  # 
  # 
  # //emlist[例][ruby]{
  # class Thing
  # end
  # c = 1
  # 
  # Thing.class_exec{
  #   def hello() 
  #     "Hello there!" 
  #   end
  # 
  #   define_method(:foo) do   # ローカル変数がブロックの外側を参照している
  #     c
  #   end
  # }
  # 
  # t = Thing.new
  # p t.hello()            #=> "Hello there!"
  # p t.foo()              #=> 1
  # //}
  # 
  # @see [[m:Module#module_eval]], [[m:Module#class_eval]]
  def class_exec; end

  # --- class_variable_defined?(name) -> bool
  # 
  # name で与えられた名前のクラス変数がモジュールに存在する場合 true を
  # 返します。
  # 
  # @param name [[c:Symbol]] か [[c:String]] を指定します。
  # 
  # //emlist[例][ruby]{
  # class Fred
  #   @@foo = 99
  # end
  # Fred.class_variable_defined?(:@@foo)    #=> true
  # Fred.class_variable_defined?(:@@bar)    #=> false
  # Fred.class_variable_defined?('@@foo')    #=> true
  # Fred.class_variable_defined?('@@bar')    #=> false
  # //}
  def class_variable_defined?; end

  # --- class_variable_get(name) -> object
  # 
  # クラス／モジュールに定義されているクラス変数 name の値を返します。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @raise NameError クラス変数 name が定義されていない場合、発生します。
  # 
  # //emlist[例][ruby]{
  # class Fred
  #   @@foo = 99
  # end
  # 
  # def Fred.foo
  #   class_variable_get(:@@foo)
  # end
  # 
  # p Fred.foo #=> 99
  # //}
  def class_variable_get; end

  # --- class_variable_set(name, val) -> object
  # 
  # クラス／モジュールにクラス変数 name を定義して、その値として
  # val をセットします。val を返します。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # //emlist[例][ruby]{
  # class Fred
  #   @@foo = 99
  #   def foo
  #     @@foo
  #   end
  # end
  # 
  # def Fred.foo(val)
  #   class_variable_set(:@@foo, val)
  # end
  # 
  # p Fred.foo(101)   # => 101
  # p Fred.new.foo    # => 101
  # //}
  def class_variable_set; end

  # --- class_variables(inherit = true) -> [Symbol]
  # 
  # クラス／モジュールに定義されているクラス変数の名前の配列を返します。
  # 
  # @param inherit false を指定しない場合はスーパークラスやインクルードして
  #        いるモジュールのクラス変数を含みます。
  # 
  # //emlist[例][ruby]{
  # class One
  #   @@var1 = 1
  # end
  # class Two < One
  #   @@var2 = 2
  # end
  # One.class_variables          # => [:@@var1]
  # Two.class_variables          # => [:@@var2, :@@var1]
  # Two.class_variables(false)   # => [:@@var2]
  # //}
  # 
  # @see [[m:Module.constants]], [[m:Kernel.#local_variables]], [[m:Kernel.#global_variables]], [[m:Object#instance_variables]], [[m:Module#constants]]
  def class_variables; end

  # --- const_defined?(name, inherit = true) -> bool
  # 
  # モジュールに name で指定される名前の定数が定義されている時真
  # を返します。
  # 
  # スーパークラスや include したモジュールで定義された定数を検索対象
  # にするかどうかは第二引数で制御することができます。
  # 
  # @param name [[c:String]], [[c:Symbol]] で指定される定数名。
  # 
  # @param inherit false を指定するとスーパークラスや include したモジュールで
  #        定義された定数は対象にはなりません。
  # 
  # 
  # //emlist[例][ruby]{
  # module Kernel
  #   FOO = 1
  # end
  # 
  # # Object は include したモジュールの定数に対しても
  # # true を返す
  # p Object.const_defined?(:FOO)   # => true
  # 
  # module Bar
  #   BAR = 1
  # end
  # class Object
  #   include Bar
  # end
  # # ユーザ定義のモジュールに対しても同様
  # p Object.const_defined?(:BAR)   # => true
  # 
  # class Baz
  #   include Bar
  # end
  # # Object 以外でも同様になった
  # # 第二引数のデフォルト値が true であるため
  # p Baz.const_defined?(:BAR)      # => true
  # 
  # # 第二引数を false にした場合
  # p Baz.const_defined?(:BAR, false)   # => false
  # //}
  def const_defined?; end

  # --- const_get(name, inherit = true) -> object
  # 
  # name で指定される名前の定数の値を取り出します。
  # 
  # [[m:Module#const_defined?]] と違って [[c:Object]] を特別扱いすることはありません。
  # 
  # @param name 定数名。[[c:String]] か [[c:Symbol]] で指定します。
  #             完全修飾名を指定しなかった場合はモジュールに定義されている
  #             name で指定される名前の定数の値を取り出します。
  # 
  # @param inherit false を指定するとスーパークラスや include したモジュールで
  #        定義された定数は対象にはなりません。
  # 
  # @raise NameError 定数が定義されていないときに発生します。
  # 
  # //emlist[例][ruby]{
  # module Bar
  #   BAR = 1
  # end
  # class Object
  #   include Bar
  # end
  # # Object では include されたモジュールに定義された定数を見付ける
  # p Object.const_get(:BAR)   # => 1
  # 
  # class Baz
  #   include Bar
  # end
  # # Object以外でも同様
  # p Baz.const_get(:BAR)      # => 1
  # # 定義されていない定数
  # p Baz.const_get(:NOT_DEFINED) #=> raise NameError
  # # 第二引数に false を指定すると自分自身に定義された定数から探す
  # p Baz.const_get(:BAR, false) #=> raise NameError
  # # 完全修飾名を指定すると include や自分自身へ定義されていない場合でも参照できる
  # p Class.const_get("Bar::BAR") # => 1
  # //}
  def const_get; end

  # --- const_missing(name)
  # 定義されていない定数を参照したときに Ruby インタプリタが
  # このメソッドを呼びます。
  # 
  # @param name 参照した定数名の [[c:Symbol]]
  # 
  # @raise NameError このメソッドを呼び出した場合、デフォルトで発生する例外
  # 
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def Foo.const_missing(id)
  #     warn "undefined constant #{id.inspect}"
  #   end
  # 
  #   Bar
  # end
  # Foo::Bar
  # 
  # # => undefined constant :Bar
  # #    undefined constant :Bar
  # //}
  def const_missing; end

  # --- const_set(name, value) -> object
  # 
  # モジュールに name で指定された名前の定数を value とい
  # う値として定義し、value を返します。
  # 
  # そのモジュールにおいてすでにその名前の定数が定義されている場合、警
  # 告メッセージが出力されます。
  # 
  # @param name  [[c:Symbol]],[[c:String]] で定数の名前を指定します。
  # @param value セットしたい値を指定します。
  # 
  # //emlist[例][ruby]{
  # module Foo; end
  # 
  # # Symbolを指定した場合
  # Foo.const_set(:FOO, 123)
  # Foo::FOO # => 123
  # 
  # # Stringを指定した場合
  # Foo.const_set('BAR', 'abc')
  # Foo::BAR # => "abc"
  # 
  # # 既に定義されている定数の名前を指定した場合
  # Foo.const_set('BAR', '123')
  # # warning: already initialized constant Foo::BAR
  # # warning: previous definition of BAR was here
  # # => "123"
  # 
  # # 不適切な定数名を指定した場合
  # Foo.const_set('foo', 1) # => NameError: wrong constant name foo
  # //}
  def const_set; end

  # --- constants(inherit = true) -> [Symbol]
  # 
  # そのモジュール(またはクラス)で定義されている定数名の配列を返します。
  # 
  # inherit に真を指定すると
  # スーパークラスやインクルードしているモジュールの定数も含みます。
  # [[c:Object]] のサブクラスの場合、Objectやそのスーパークラスで定義されている
  # 定数は含まれません。 Object.constants とすると Object クラスで定義された
  # 定数の配列が得られます。
  # 
  # 得られる定数の順序は保証されません。
  # 
  # @param inherit true を指定するとスーパークラスや include したモジュールで
  #        定義された定数が対象にはなります。false を指定した場合 対象にはなりません。
  # 
  # @see [[m:Module.constants]], [[m:Kernel.#local_variables]], [[m:Kernel.#global_variables]], [[m:Object#instance_variables]], [[m:Module#class_variables]]
  # 
  # //emlist[Module.constants と Module#constants の違い][ruby]{
  # # 出力の簡略化のため起動時の定数一覧を取得して後で差し引く
  # $clist = Module.constants
  # 
  # class Foo
  #   FOO = 1
  # end
  # class Bar
  #   BAR = 1
  # 
  #   # Bar は BAR を含む
  #   p constants                         # => [:BAR]
  #   # 出力に FOO は含まれない
  #   p Module.constants - $clist         # => [:BAR, :Bar, :Foo]
  #   class Baz
  #     # Baz は定数を含まない
  #     p constants                       # => []
  # 
  #     # ネストしたクラスでは、外側のクラスで定義した定数は
  #     # 参照可能なので、BAR は、Module.constants には含まれる
  #     # (クラス Baz も Bar の定数なので同様)
  #     p Module.constants - $clist       # => [:BAR, :Baz, :Foo, :Bar]
  #   end
  # end
  # //}
  def constants; end

  # --- define_method(name, method) -> Symbol
  # --- define_method(name) { ... } -> Symbol
  # 
  # インスタンスメソッド name を定義します。
  # 
  # ブロックを与えた場合、定義したメソッドの実行時にブロックが
  # レシーバクラスのインスタンスの上で [[m:BasicObject#instance_eval]] されます。
  # 
  # @param name メソッド名を [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @param method [[c:Proc]]、[[c:Method]] あるいは [[c:UnboundMethod]] の
  #        いずれかのインスタンスを指定します。
  # 
  # @return メソッド名を表す [[c:Symbol]] を返します。
  # 
  # @raise TypeError method に同じクラス、サブクラス、モジュール以外のメソッ
  #                  ドを指定した場合に発生します。
  # 
  #   class Foo
  #     def foo() p :foo end
  #     define_method(:bar, instance_method(:foo))
  #   end
  #   Foo.new.bar    # => :foo
  def define_method; end

  # --- deprecate_constant(*name) -> self
  # 
  # name で指定した定数を deprecate に設定します。
  # deprecate に設定した定数を参照すると警告メッセージが表示されます。
  # 
  # 
  # @param name 0 個以上の [[c:String]] か [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しない定数を指定した場合に発生します。
  # 
  # @return self を返します。
  # 
  # //emlist[例][ruby]{
  # FOO = 123
  # Object.deprecate_constant(:FOO) # => Object
  # 
  # FOO
  # # warning: constant ::FOO is deprecated
  # # => 123
  # 
  # Object.deprecate_constant(:BAR)
  # # NameError: constant Object::BAR not defined
  # //}
  def deprecate_constant; end

  # --- extend_object(obj) -> object
  # 
  # [[m:Object#extend]] の実体です。オブジェクトにモジュールの機能を追加します。
  # 
  # [[m:Object#extend]] は、Ruby で書くと以下のように定義できます。
  # 
  # //emlist[例][ruby]{
  # def extend(*modules)
  #   modules.reverse_each do |mod|
  #     # extend_object や extended はプライベートメソッドなので
  #     # 直接 mod.extend_object(self) などとは書けない
  #     mod.__send__(:extend_object, self)
  #     mod.__send__(:extended, self)
  #   end
  # end
  # //}
  # 
  # extend_object のデフォルトの実装では、self に定義されて
  # いるインスタンスメソッドを obj の特異メソッドとして追加します。
  # 
  # @param obj self の機能を追加するオブジェクトを指定します。
  # 
  # @return obj で指定されたオブジェクトを返します。
  # 
  # @see [[m:Module#extended]]
  def extend_object; end

  # --- extended(obj) -> ()
  # 
  # self が他のオブジェクト に [[m:Object#extend]] されたときに
  # 呼ばれます。引数には extend を行ったオブジェクトが渡されます。
  # 
  # @param obj [[m:Object#extend]] を行ったオブジェクト
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   def self.extended(obj)
  #     p "#{obj} extend #{self}"
  #   end
  # end
  # 
  # Object.new.extend Foo
  # 
  # # => "#<Object:0x401cbc3c> extend Foo"
  # //}
  # 
  # @see [[m:Module#extend_object]]
  def extended; end

  # --- freeze -> self
  # 
  # モジュールを凍結（内容の変更を禁止）します。
  # 
  # 凍結したモジュールにメソッドの追加など何らかの変更を加えようとした場合に
  # [[c:FrozenError]]
  # が発生します。
  # 
  # @see [[m:Object#freeze]]
  # 
  # //emlist[例][ruby]{
  # module Foo; end
  # Foo.freeze
  # 
  # module Foo
  #   def foo; end
  # end # => FrozenError: can't modify frozen module
  # //}
  def freeze; end

  # --- include(*mod) -> self
  # 
  # モジュール mod をインクルードします。
  # 
  # @param mod [[c:Module]] のインスタンス( [[c:Enumerable]] など)を指定します。
  # 
  # @raise ArgumentError 継承関係が循環してしまうような include を行った場合に発生します。
  # 
  #   module M
  #   end
  #   module M2
  #     include M
  #   end
  #   module M
  #     include M2
  #   end
  # 
  # 実行結果:
  # 
  #   -:3:in `append_features': cyclic include detected (ArgumentError)
  #           from -:3:in `include'
  #           from -:3
  # 
  # 
  # インクルードとは、指定されたモジュールの定義
  # (メソッド、定数) を引き継ぐことです。
  # インクルードは多重継承の代わりに用いられており、 mix-in とも呼びます。
  # 
  #   class C
  #     include FileTest
  #     include Math
  #   end
  # 
  #   p C.ancestors
  # 
  #   # => [C, Math, FileTest, Object, Kernel]
  # 
  # モジュールの機能追加は、クラスの継承関係の間にそのモジュールが挿入
  # されることで実現されています。従って、メソッドの探索などは
  # スーパークラスよりもインクルードされたモジュールのほうが
  # 先に行われます
  # (上の例の [[m:Module#ancestors]] の結果がメソッド探索の順序です)。
  # 
  # 同じモジュールを二回以上 include すると二回目以降は無視されます。
  # 
  #   module M
  #   end
  #   class C1
  #     include M
  #   end
  #   class C2 < C1
  #     include M   # この include は無視される
  #   end
  # 
  #   p C2.ancestors  # => [C2, C1, M, Object, Kernel]
  # 
  # 引数に複数のモジュールを指定した場合、
  # 最後の引数から順にインクルードします。
  def include; end

  # --- include?(mod) -> bool
  # 
  # self かその親クラス / 親モジュールがモジュール mod を
  # インクルードしていれば true を返します。
  # 
  # @param mod [[c:Module]] を指定します。
  # 
  # //emlist[例][ruby]{
  # module M
  # end
  # class C1
  #   include M
  # end
  # class C2 < C1
  # end
  # 
  # p C1.include?(M)   # => true
  # p C2.include?(M)   # => true
  # //}
  def include?; end

  # --- included(class_or_module) -> ()
  # 
  # self が [[m:Module#include]] されたときに対象のクラスまたはモジュー
  # ルを引数にしてインタプリタがこのメソッドを呼び出します。
  # 
  # @param class_or_module [[m:Module#include]] を実行したオブジェクト
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   def self.included(mod)
  #     p "#{mod} include #{self}"
  #   end
  # end
  # class Bar
  #   include Foo
  # end
  # # => "Bar include Foo"
  # //}
  # 
  # @see [[m:Module#append_features]]
  def included; end

  # --- included_modules -> [Module]
  # 
  # self にインクルードされているモジュールの配列を返します。
  # 
  # //emlist[例][ruby]{
  # module Mixin
  # end
  # 
  # module Outer
  #   include Mixin
  # end
  # 
  # Mixin.included_modules   #=> []
  # Outer.included_modules   #=> [Mixin]
  # //}
  # 
  # @see [[m:Module#ancestors]]
  def included_modules; end

  # --- name -> String | nil
  # --- to_s -> String
  # --- inspect -> String
  # 
  # モジュールやクラスの名前を文字列で返します。
  # 
  # このメソッドが返す「モジュール / クラスの名前」とは、
  # より正確には「クラスパス」を指します。
  # クラスパスとは、ネストしているモジュールすべてを
  # 「::」を使って表示した名前のことです。
  # クラスパスの例としては「CGI::Session」「Net::HTTP」が挙げられます。
  # 
  # @return 名前のないモジュール / クラスに対しては、name は nil を、それ以外はオブジェクト ID の文字列を返します。
  # 
  # //emlist[例][ruby]{
  # module A
  #   module B
  #   end
  # 
  #   p B.name  #=> "A::B"
  # 
  #   class C
  #   end
  # end
  # 
  # p A.name    #=> "A"
  # p A::B.name #=> "A::B"
  # p A::C.name #=> "A::C"
  # 
  # # 名前のないモジュール / クラス
  # p Module.new.name   #=> nil
  # p Class.new.name    #=> nil
  # p Module.new.to_s   #=> "#<Module:0x00007f90b09112c8>"
  # p Class.new.to_s    #=> "#<Class:0x00007fa5c40b41b0>"
  # //}
  def inspect; end

  # --- instance_method(name) -> UnboundMethod
  # 
  # self のインスタンスメソッド name をオブジェクト化した [[c:UnboundMethod]] を返します。
  # 
  # @param name メソッド名を [[c:Symbol]] または [[c:String]] で指定します。
  # 
  # @raise NameError self に存在しないメソッドを指定した場合に発生します。
  # 
  # @see [[m:Module#public_instance_method]], [[m:Object#method]]
  # 
  # //emlist[例][ruby]{
  # class Interpreter
  #   def do_a() print "there, "; end
  #   def do_d() print "Hello ";  end
  #   def do_e() print "!\n";     end
  #   def do_v() print "Dave";    end
  #   Dispatcher = {
  #     "a" => instance_method(:do_a),
  #     "d" => instance_method(:do_d),
  #     "e" => instance_method(:do_e),
  #     "v" => instance_method(:do_v)
  #   }
  #   def interpret(string)
  #     string.each_char {|b| Dispatcher[b].bind(self).call }
  #   end
  # end
  # 
  # interpreter = Interpreter.new
  # interpreter.interpret('dave')
  # # => Hello there, Dave!
  # //}
  def instance_method; end

  # --- instance_methods(inherited_too = true) -> [Symbol]
  # 
  # そのモジュールで定義されている public および protected メソッド名
  # の一覧を配列で返します。
  # 
  # @param inherited_too false を指定するとそのモジュールで定義されているメソッドのみ返します。
  # 
  # @see [[m:Object#methods]]
  # 
  # //emlist[例1][ruby]{
  # class Foo
  #   private;   def private_foo()   end
  #   protected; def protected_foo() end
  #   public;    def public_foo()    end
  # end
  # 
  # # あるクラスのインスタンスメソッドの一覧を得る
  # p Foo.instance_methods(false)
  # p Foo.public_instance_methods(false)
  # p Foo.private_instance_methods(false)
  # p Foo.protected_instance_methods(false)
  # 
  # class Bar < Foo
  # end
  # //}
  # 
  # 実行結果
  # 
  #      [:protected_foo, :public_foo]
  #      [:public_foo]
  #      [:private_foo]
  #      [:protected_foo]
  # 
  # //emlist[例2][ruby]{
  # class Bar
  #   private;   def private_foo()   end
  #   protected; def protected_foo() end
  #   public;    def public_foo()    end
  # end
  # 
  # # あるクラスのインスタンスメソッドの一覧を得る。
  # # 親のクラスのインスタンスメソッドも含めるため true を指定して
  # # いるが、Object のインスタンスメソッドは一覧から排除している。
  # p Bar.instance_methods(true)           - Object.instance_methods(true)
  # p Bar.public_instance_methods(true)    - Object.public_instance_methods(true)
  # p Bar.private_instance_methods(true)   - Object.private_instance_methods(true)
  # p Bar.protected_instance_methods(true) - Object.protected_instance_methods(true)
  # //}
  # 
  # 実行結果
  # 
  #      [:protected_foo, :public_foo]
  #      [:public_foo]
  #      [:private_foo]
  #      [:protected_foo]
  def instance_methods; end

  # --- method_added(name) -> ()
  # 
  # メソッド name が追加された時にインタプリタがこのメソッドを呼び出します。
  # 
  # 特異メソッドの追加に対するフックには
  # [[m:BasicObject#singleton_method_added]]
  # を使います。
  # 
  # @param name 追加されたメソッドの名前が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def Foo.method_added(name)
  #     puts "method \"#{name}\" was added"
  #   end
  # 
  #   def foo
  #   end
  #   define_method :bar, instance_method(:foo)
  # end
  # 
  # # => method "foo" was added
  # #    method "bar" was added
  # //}
  def method_added; end

  # --- method_defined?(name, inherit=true) -> bool
  # 
  # モジュールにインスタンスメソッド name が定義されており、
  # かつその可視性が public または protected であるときに
  # true を返します。
  # 
  # @param name [[c:Symbol]] か [[c:String]] を指定します。
  # @param inherit 真を指定するとスーパークラスや include したモジュールで
  #        定義されたメソッドも対象になります。
  # 
  # @see [[m:Module#public_method_defined?]], [[m:Module#private_method_defined?]], [[m:Module#protected_method_defined?]]
  # 
  # //emlist[例][ruby]{
  # module A
  #   def method1()  end
  #   def protected_method1()  end
  #   protected :protected_method1
  # end
  # class B
  #   def method2()  end
  #   def private_method2()  end
  #   private :private_method2
  # end
  # class C < B
  #   include A
  #   def method3()  end
  # end
  # 
  # A.method_defined? :method1              #=> true
  # C.method_defined? "method1"             #=> true
  # C.method_defined? "method2"             #=> true
  # C.method_defined? "method2", true       #=> true
  # C.method_defined? "method2", false      #=> false
  # C.method_defined? "method3"             #=> true
  # C.method_defined? "protected_method1"   #=> true
  # C.method_defined? "method4"             #=> false
  # C.method_defined? "private_method2"     #=> false
  # //}
  def method_defined?; end

  # --- method_removed(name) -> ()
  # 
  # メソッドが [[m:Module#remove_method]] により削除
  # された時にインタプリタがこのメソッドを呼び出します。
  # 
  # 特異メソッドの削除に対するフックには
  # [[m:BasicObject#singleton_method_removed]]
  # を使います。
  # 
  # @param name 削除されたメソッド名が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def Foo.method_removed(name)
  #     puts "method \"#{name}\" was removed"
  #   end
  # 
  #   def foo
  #   end
  #   remove_method :foo
  # end
  # 
  # # => method "foo" was removed
  # //}
  def method_removed; end

  # --- method_undefined(name) -> ()
  # 
  # このモジュールのインスタンスメソッド name が
  # [[m:Module#undef_method]] によって削除されるか、
  # undef 文により未定義にされると、インタプリタがこのメソッドを呼び出します。
  # 
  # 特異メソッドの削除をフックするには
  # [[m:BasicObject#singleton_method_undefined]]
  # を使います。
  # 
  # @param name 削除/未定義にされたメソッド名が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class C
  #   def C.method_undefined(name)
  #     puts "method C\##{name} was undefined"
  #   end
  # 
  #   def foo
  #   end
  #   def bar
  #   end
  # 
  #   undef_method :foo
  #   undef bar
  # end
  # //}
  # 
  # 実行結果:
  # 
  #   method C#foo was undefined
  #   method C#bar was undefined
  def method_undefined; end

  # --- module_function(*name) -> self
  # 
  # メソッドをモジュール関数にします。
  # 
  # 引数が与えられた時には、
  # 引数で指定されたメソッドをモジュール関数にします。
  # 引数なしのときは今後このモジュール定義文内で
  # 新しく定義されるメソッドをすべてモジュール関数にします。
  # 
  # モジュール関数とは、プライベートメソッドであると同時に
  # モジュールの特異メソッドでもあるようなメソッドです。
  # 例えば [[c:Math]] モジュールのメソッドはすべてモジュール関数です。
  # 
  # self を返します。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を 0 個以上指定します。
  # 
  # === 注意
  # module_function はメソッドに「モジュール関数」という属性をつけるメ
  # ソッドではなく、プライベートメソッドとモジュールの特異メソッドの 2
  # つを同時に定義するメソッドです。
  # そのため、以下のように書いてもモジュール関数の別名は定義できません。
  # 
  # //emlist[例][ruby]{
  # module M
  #   def foo
  #     p "foo"
  #   end
  #   module_function :foo
  #   alias bar foo
  # end
  # 
  # M.foo   # => "foo"
  # M.bar   # => undefined method `bar' for Foo:Module (NoMethodError)
  # //}
  # 
  # このコードでは、モジュール関数 foo と
  # プライベートインスタンスメソッド bar を定義してしまいます。
  # 
  # 正しくモジュール関数に別名を付けるには、
  # 以下のように、先に別名を定義してから
  # それぞれをモジュール関数にしなければいけません。
  # 
  # //emlist[例][ruby]{
  # module M
  #   def foo
  #     p "foo"
  #   end
  # 
  #   alias bar foo
  #   module_function :foo, :bar
  # end
  # 
  # M.foo   # => "foo"
  # M.bar   # => "foo"
  # //}
  def module_function; end

  # --- prepend(*modules) -> self
  # 指定したモジュールを self の継承チェインの先頭に「追加する」ことで
  # self の定数、メソッド、モジュール変数を「上書き」します。
  # 
  # 継承チェイン上で、self のモジュール/クラスよりも「手前」に
  # 追加されるため、結果として self で定義されたメソッドは
  # override されます。
  # 
  # modules で指定したモジュールは後ろから順に処理されるため、
  # modules の先頭が最も優先されます。
  # 
  # また、継承によってこの「上書き」を処理するため、prependの引数として
  # 渡したモジュールのインスタンスメソッドでsuperを呼ぶことで
  # self のモジュール/クラスのメソッドを呼び出すことができます。
  # 
  # 実際の処理は modules の各要素の prepend_features を後ろから順に呼びだすだけです。
  # [[m:Module#prepend_features]] が継承チェインの改変を実行し、結果として上のような
  # 処理が実現されます。そのため、prepend_features を override することで
  # prepend の処理を追加/変更できます。
  # 
  # 
  # @param modules prepend する [[c:Module]] を指定します
  # @see [[m:Module#prepend_features]], [[m:Module#prepended]]
  # 
  #   # super と prepend の組み合わせの例
  #   module X
  #     def foo
  #       puts "X1" # (1x)
  #       super # (2x)
  #       puts "X2" # (3x)
  #     end
  #   end
  # 
  #   class A
  #     prepend X
  # 
  #     def foo
  #       puts "A" #(1a)
  #     end
  #   end
  # 
  #   A.new.foo
  #   # (1x) (2x)(ここの super で A#foo を呼びだす) (1a) (3x) の順に実行される
  #   # >> X1
  #   # >> A
  #   # >> X2
  # 
  #   # 2つのモジュールを X, Y を prepend X, Y という順で指定したもの
  #   module Y
  #     def foo
  #       puts "Y1" #(1y)
  #       super #(2y)
  #       puts "Y2" #(3y)
  #     end
  #   end
  # 
  #   class B
  #     prepend X, Y
  #     def foo
  #       puts "B" # (1b)
  #     end
  #   end
  # 
  #   B.new.foo
  #   # (1x) (2x) (1y) (2y) (1b) (3y) (3x) の順に実行される
  #   # X#foo のほうが Y#foo より継承チェインの手前側にあり、そちらが優先される
  #   # >> X1
  #   # >> Y1
  #   # >> B
  #   # >> Y2
  #   # >> X2
  #   # prepend Y, X とすると Y1 X1 B X2 Y2 の順で表示される
  def prepend; end

  # --- prepend_features(mod) -> self
  # [[m:Module#prepend]] から呼び出されるメソッドで、
  # prepend の処理の実体です。このメソッド自体は mod で指定した
  # モジュール/クラスの継承チェインの先頭に self を追加します。
  # 
  # このメソッドを上書きすることで、prepend の処理を変更したり
  # 追加したりすることができます。
  # 
  # @param mod prepend を呼び出したモジュール
  # @return mod が返されます
  # 
  # //emlist[例][ruby]{
  # class Recorder
  #   RECORDS = []
  # end
  # 
  # module X
  #   def self.prepend_features(mod)
  #     Recorder::RECORDS << mod
  #   end
  # end
  # 
  # class A
  #   prepend X
  # end
  # 
  # class B
  #   include X
  # end
  # 
  # class C
  #   prepend X
  # end
  # 
  # Recorder::RECORDS # => [A, C]
  # //}
  # 
  # @see [[m:Module#prepend]], [[m:Module#prepended]]
  def prepend_features; end

  # --- prepended(class_or_module) -> ()
  # 
  # self が [[m:Module#prepend]] されたときに対象のクラスまたはモジュールを
  # 引数にしてインタプリタがこのメソッドを呼び出します。
  # 
  # @param class_or_module [[m:Module#prepend]] を実行したオブジェクト
  # 
  # //emlist[例][ruby]{
  # module A
  #   def self.prepended(mod)
  #     puts "#{self} prepended to #{mod}"
  #   end
  # end
  # module Enumerable
  #   prepend A
  # end
  # # => "A prepended to Enumerable"
  # //}
  # 
  # @see [[m:Module#included]], [[m:Module#prepend]], [[m:Module#prepend_features]]
  def prepended; end

  # --- private(*name) -> self
  # 
  # メソッドを private に設定します。
  # 
  # 引数なしのときは今後このクラスまたはモジュール定義内で新規に定義さ
  # れるメソッドを関数形式でだけ呼び出せるように(private)設定します。
  # 
  # 引数が与えられた時には引数によって指定されたメソッドを private に
  # 設定します。
  # 
  # 可視性については [[ref:d:spec/def#limit]] を参照して下さい。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しないメソッド名を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def foo1() 1 end      # デフォルトでは public
  #   private               # 可視性を private に変更
  #   def foo2() 2 end      # foo2 は private メソッド
  # end
  # 
  # foo = Foo.new
  # p foo.foo1          # => 1
  # p foo.foo2          # => private method `foo2' called for #<Foo:0x401b7628> (NoMethodError)
  # //}
  def private; end

  # --- private_class_method(*name) -> self
  # 
  # name で指定したクラスメソッド (クラスの特異メソッド) の
  # 可視性を private に変更します。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   def self.foo; end
  # end
  # 
  # Foo.singleton_class.private_method_defined?(:foo) # => false
  # Foo.private_class_method(:foo) # => Foo
  # Foo.singleton_class.private_method_defined?(:foo) # => true
  # //}
  def private_class_method; end

  # --- private_constant(*name) -> self
  # 
  # name で指定した定数の可視性を private に変更します。
  # 
  # @param name 0 個以上の [[c:String]] か [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しない定数を指定した場合に発生します。
  # 
  # @return self を返します。
  # 
  # @see [[m:Module#public_constant]], [[m:Object#untrusted?]]
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   BAR = 'bar'
  #   class Baz; end
  #   QUX = 'qux'
  #   class Quux; end
  # 
  #   private_constant :QUX
  #   private_constant :Quux
  # end
  # 
  # Foo::BAR  # => "bar"
  # Foo::Baz  # => Foo::Baz
  # Foo::QUX  # => NameError: private constant Foo::QUX referenced
  # Foo::Quux # => NameError: private constant Foo::Quux referenced
  # //}
  def private_constant; end

  # --- private_instance_methods(inherited_too = true) -> [Symbol]
  # 
  # そのモジュールで定義されている private メソッド名
  # の一覧を配列で返します。
  # 
  # @param inherited_too false を指定するとそのモジュールで定義されているメソッドのみ返します。
  # 
  # @see [[m:Object#private_methods]], [[m:Module#instance_methods]]
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   def foo; end
  #   private def bar; end
  # end
  # 
  # module Bar
  #   include Foo
  # 
  #   def baz; end
  #   private def qux; end
  # end
  # 
  # Bar.private_instance_methods # => [:qux, :bar]
  # Bar.private_instance_methods(false) # => [:qux]
  # //}
  def private_instance_methods; end

  # --- private_method_defined?(name, inherit=true) -> bool
  # 
  # インスタンスメソッド name がモジュールに定義されており、
  # しかもその可視性が private であるときに true を返します。
  # そうでなければ false を返します。
  # 
  # @param name [[c:Symbol]] か [[c:String]] を指定します。
  # @param inherit 真を指定するとスーパークラスや include したモジュールで
  #        定義されたメソッドも対象になります。
  # 
  # @see [[m:Module#method_defined?]], [[m:Module#public_method_defined?]], [[m:Module#protected_method_defined?]]
  # 
  # //emlist[例][ruby]{
  # module A
  #   def method1()  end
  # end
  # class B
  #   private
  #   def method2()  end
  # end
  # class C < B
  #   include A
  #   def method3()  end
  # end
  # 
  # A.method_defined? :method1                   #=> true
  # C.private_method_defined? "method1"          #=> false
  # C.private_method_defined? "method2"          #=> true
  # C.private_method_defined? "method2", true    #=> true
  # C.private_method_defined? "method2", false   #=> false
  # C.method_defined? "method2"                  #=> false
  # //}
  def private_method_defined?; end

  # --- protected(*name) -> self
  # 
  # メソッドを protected に設定します。
  # 
  # 引数なしのときは今後このクラスまたはモジュール定義内で新規に定義さ
  # れるメソッドを protected に設定します。
  # 
  # 引数が与えられた時には引数によって指定されたメソッドを protected
  # に設定します。
  # 
  # 可視性については [[ref:d:spec/def#limit]] を参照して下さい。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しないメソッド名を指定した場合に発生します。
  # 
  # 
  # @see [[m:Module#protected_method_defined?]]
  def protected; end

  # --- protected_instance_methods(inherited_too = true) -> [Symbol]
  # 
  # そのモジュールで定義されている protected メソッド名
  # の一覧を配列で返します。
  # 
  # @param inherited_too false を指定するとそのモジュールで定義されているメソッドのみ返します。
  # 
  # 
  # @see [[m:Object#protected_methods]], [[m:Module#instance_methods]]
  def protected_instance_methods; end

  # --- protected_method_defined?(name, inherit=true) -> bool
  # 
  # インスタンスメソッド name がモジュールに定義されており、
  # しかもその可視性が protected であるときに true を返します。
  # そうでなければ false を返します。
  # 
  # @param name [[c:Symbol]] か [[c:String]] を指定します。
  # @param inherit 真を指定するとスーパークラスや include したモジュールで
  #        定義されたメソッドも対象になります。
  # 
  # @see [[m:Module#method_defined?]], [[m:Module#public_method_defined?]], [[m:Module#private_method_defined?]]
  # 
  # //emlist[例][ruby]{
  # module A
  #   def method1()  end
  # end
  # class B
  #   protected
  #   def method2()  end
  # end
  # class C < B
  #   include A
  #   def method3()  end
  # end
  # 
  # A.method_defined? :method1                    #=> true
  # C.protected_method_defined? "method1"         #=> false
  # C.protected_method_defined? "method2"         #=> true
  # C.protected_method_defined? "method2", true   #=> true
  # C.protected_method_defined? "method2", false  #=> false
  # C.method_defined? "method2"                   #=> true
  # //}
  def protected_method_defined?; end

  # --- public(*name) -> self
  # 
  # メソッドを public に設定します。
  # 
  # 引数なしのときは今後このクラスまたはモジュール定義内で新規に定義さ
  # れるメソッドをどんな形式でも呼び出せるように(public)設定します。
  # 
  # 引数が与えられた時には引数によって指定されたメソッドを public に設
  # 定します。
  # 
  # 可視性については [[ref:d:spec/def#limit]] を参照して下さい。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しないメソッド名を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo() 1 end
  # p foo             # => 1
  # # the toplevel default is private
  # p self.foo        # => private method `foo' called for #<Object:0x401c83b0> (NoMethodError)
  # 
  # def bar() 2 end
  # public :bar       # visibility changed (all access allowed)
  # p bar             # => 2
  # p self.bar        # => 2
  # //}
  def public; end

  # --- public_class_method(*name) -> self
  # 
  # name で指定したクラスメソッド (クラスの特異メソッド) の
  # 可視性を public に変更します。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def self.foo
  #     "foo"
  #   end
  # 
  #   private_class_method :foo
  # end
  # 
  # Foo.foo # NoMethodError: private method `foo' called for Foo:Class
  # 
  # Foo.public_class_method(:foo) # => Foo
  # Foo.foo # => "foo"
  # //}
  def public_class_method; end

  # --- public_constant(*name) -> self
  # 
  # name で指定した定数の可視性を public に変更します。
  # 
  # @param name 0 個以上の [[c:String]] か [[c:Symbol]] を指定します。
  # 
  # @raise NameError 存在しない定数を指定した場合に発生します。
  # 
  # @return self を返します。
  # 
  # //emlist[例][ruby]{
  # module SampleModule
  #   class SampleInnerClass
  #   end
  # 
  #   # => 非公開クラスであることを明示するために private にする
  #   private_constant :SampleInnerClass
  # end
  # 
  # begin
  #   SampleModule::SampleInnerClass
  # rescue => e
  #   e # => #<NameError: private constant SampleModule::SampleInnerClass referenced>
  # end
  # 
  # module SampleModule
  #   # => 非公開クラスであることは承知で利用するために public にする
  #   public_constant :SampleInnerClass
  # end
  # 
  # SampleModule::SampleInnerClass # => SampleModule::SampleInnerClass
  # //}
  # 
  # @see [[m:Module#private_constant]], [[m:Object#untrusted?]]
  def public_constant; end

  # --- public_instance_method(name) -> UnboundMethod
  # 
  # self の public インスタンスメソッド name をオブジェクト化した [[c:UnboundMethod]] を返します。
  # 
  # @param name メソッド名を [[c:Symbol]] または [[c:String]] で指定します。
  # 
  # @raise NameError 定義されていないメソッド名や、
  #        protected メソッド名、 private メソッド名を引数として与えると発生します。
  # 
  # //emlist[例][ruby]{
  # Kernel.public_instance_method(:object_id) #=> #<UnboundMethod: Kernel#object_id>
  # Kernel.public_instance_method(:p)         #   method `p' for module `Kernel' is private (NameError)
  # //}
  # 
  # @see [[m:Module#instance_method]],[[m:Object#public_method]]
  def public_instance_method; end

  # --- public_instance_methods(inherited_too = true) -> [Symbol]
  # 
  # そのモジュールで定義されている public メソッド名
  # の一覧を配列で返します。
  # 
  # @param inherited_too false を指定するとそのモジュールで定義されているメソッドのみ返します。
  # 
  # 
  # @see [[m:Object#public_methods]], [[m:Module#instance_methods]]
  def public_instance_methods; end

  # --- public_method_defined?(name, inherit=true) -> bool
  # 
  # インスタンスメソッド name がモジュールに定義されており、
  # しかもその可視性が public であるときに true を返します。
  # そうでなければ false を返します。
  # 
  # @param name [[c:Symbol]] か [[c:String]] を指定します。
  # @param inherit 真を指定するとスーパークラスや include したモジュールで
  #        定義されたメソッドも対象になります。
  # 
  # @see [[m:Module#method_defined?]], [[m:Module#private_method_defined?]], [[m:Module#protected_method_defined?]]
  # 
  # //emlist[例][ruby]{
  # module A
  #   def method1()  end
  # end
  # class B
  #   protected
  #   def method2()  end
  # end
  # class C < B
  #   include A
  #   def method3()  end
  # end
  # 
  # A.method_defined? :method1                 #=> true
  # C.public_method_defined? "method1"         #=> true
  # C.public_method_defined? "method1", true   #=> true
  # C.public_method_defined? "method1", false  #=> true
  # C.public_method_defined? "method2"         #=> false
  # C.method_defined? "method2"                #=> true
  # //}
  def public_method_defined?; end

  # --- rake_extension(method){ ... } -> ()
  # 
  # 与えられたブロック内で既に存在するメソッドを再定義しようとした場合に
  # 警告を表示します。この場合、ブロックは評価されません。
  # 
  # @param method ブロック内で再定義する予定のメソッド名を指定します。
  # 
  # 例:
  #    class String
  #      rake_extension("xyz") do
  #        def xyz
  #          ...
  #        end
  #      end
  #    end
  def rake_extension; end

  # --- refine(klass) { ... } -> Module
  # 
  # 引数 klass で指定したクラスまたはモジュールだけに対して、ブロックで指定した機能を提供で
  # きるモジュールを定義します。定義した機能は Module#refine を使用せずに直
  # 接 klass に対して変更を行う場合と異なり、限られた範囲のみ有効にできます。
  # そのため、既存の機能を局所的に修正したい場合などに用いる事ができます。
  # 
  # refinements 機能の詳細については以下を参照してください。
  # 
  #  * [[url:https://magazine.rubyist.net/articles/0041/0041-200Special-refinement.html]]
  #  * [[url:https://docs.ruby-lang.org/en/master/doc/syntax/refinements_rdoc.html]]
  # 
  # 定義した機能は [[m:main.using]], [[m:Module#using]] を実行した場合のみ
  # 有効になります。
  # 
  # @param klass 拡張する対象のクラスまたはモジュールを指定します。
  # 
  # @return ブロックで指定した機能を持つ無名のモジュールを返します。
  # 
  # 
  # //emlist[例][ruby]{
  # class C
  #   def foo
  #     puts "C#foo"
  #   end
  # end
  # 
  # module M
  #   refine C do
  #     def foo
  #       puts "C#foo in M"
  #     end
  #   end
  # end
  # 
  # x = C.new
  # x.foo # => "C#foo"
  # 
  # using M
  # 
  # x = C.new
  # x.foo # => "C#foo in M"
  # //}
  # 
  # @see [[m:main.using]]
  def refine; end

  # --- remove_class_variable(name) -> object
  # 
  # 引数で指定したクラス変数を取り除き、そのクラス変数に設定さ
  # れていた値を返します。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @return 引数で指定されたクラス変数に設定されていた値を返します。
  # 
  # @raise NameError 引数で指定されたクラス変数がそのモジュールやクラスに定義されていない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   @@foo = 1
  #   remove_class_variable(:@@foo)   # => 1
  #   p @@foo   # => uninitialized class variable @@foo in Foo (NameError)
  # end
  # //}
  # 
  # @see [[m:Module#remove_const]], [[m:Object#remove_instance_variable]]
  def remove_class_variable; end

  # --- remove_const(name) -> object
  # 
  # name で指定した定数を取り除き、その定数に設定されていた値を
  # 返します。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @return 引数で指定された定数に設定されていた値を返します。
  # 
  # @raise NameError 引数で指定された定数がそのモジュールやクラスに定義されていない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   FOO = 1
  #   p remove_const(:FOO)    # => 1
  #   p FOO     # => uninitialized constant FOO at Foo (NameError)
  # end
  # //}
  # 
  # 組み込みクラス/モジュールを設定している定数や [[m:Kernel.#autoload]] を指定した(まだロードしてない)定数を含めて削除する事ができます。
  # 
  # 取り除かれた定数は参照できなくなりますが、消える訳ではないので注意して
  # 使用してください。
  # 
  # @see [[m:Module#remove_class_variable]], [[m:Object#remove_instance_variable]]
  def remove_const; end

  # --- remove_method(*name) -> self
  # 
  # インスタンスメソッド name をモジュールから削除します。
  # 
  # Ruby 1.8.0 以降は複数のメソッド名を指定して一度に削除できます。
  # 
  # @param name 0 個以上の [[c:String]] か [[c:Symbol]] を指定します。
  # 
  # @raise NameError 指定したメソッドが定義されていない場合に発生します。
  # 
  #   class C
  #     def foo
  #     end
  # 
  #     remove_method :foo
  #     remove_method :no_such_method   # 例外 NameError が発生
  #   end
  # 
  # @see [[m:Module#undef_method]]
  def remove_method; end

  # --- singleton_class? -> bool
  # 
  # self が特異クラスの場合に true を返します。そうでなければ false を返し
  # ます。
  # 
  # //emlist[例][ruby]{
  # class C
  # end
  # C.singleton_class?                  # => false
  # C.singleton_class.singleton_class?  # => true
  # //}
  def singleton_class?; end

  # --- undef_method(*name) -> self
  # 
  # このモジュールのインスタンスメソッド name を未定義にします。
  # 
  # @param name 0 個以上の [[c:String]] か [[c:Symbol]] を指定します。
  # 
  # @raise NameError 指定したインスタンスメソッドが定義されていない場合に発生します。
  # 
  # === 「未定義にする」とは
  # このモジュールのインスタンスに対して name という
  # メソッドを呼び出すことを禁止するということです。
  # スーパークラスの定義が継承されるかどうかという点において、
  # 「未定義」は「メソッドの削除」とは区別されます。
  # 以下のコード例を参照してください。
  # 
  #   class A
  #     def ok
  #       puts 'A'
  #     end
  #   end
  #   class B < A
  #     def ok
  #       puts 'B'
  #     end
  #   end
  # 
  #   B.new.ok   # => B
  # 
  #   # undef_method の場合はスーパークラスに同名のメソッドがあっても
  #   # その呼び出しはエラーになる
  #   class B
  #     undef_method :ok
  #   end
  #   B.new.ok   # => NameError
  # 
  #   # remove_method の場合はスーパークラスに同名のメソッドがあると
  #   # それが呼ばれる
  #   class B
  #     remove_method :ok
  #   end
  #   B.new.ok   # => A
  # 
  # また、undef 文と undef_method の違いは、
  # メソッド名を [[c:String]] または [[c:Symbol]] で与えられることです。
  # 
  #   module M1
  #     def foo
  #     end
  #     def self.moo
  #       undef foo
  #     end
  #   end
  #   M1.instance_methods false #=> ["foo"]
  #   M1.moo
  #   M1.instance_methods false #=> []
  #   module M2
  #     def foo
  #     end
  #     def self.moo
  #       undef_method :foo
  #     end
  #   end
  #   M2.instance_methods false #=> ["foo"]
  #   M2.moo
  #   M2.instance_methods false #=> []
  def undef_method; end

  # --- using(module) -> self
  # 
  # 引数で指定したモジュールで定義された拡張を現在のクラス、モジュールで有
  # 効にします。
  # 
  # 有効にした拡張の有効範囲については以下を参照してください。
  # 
  #  * [[url:https://docs.ruby-lang.org/en/master/doc/syntax/refinements_rdoc.html#label-Scope]]
  # 
  # @param module 有効にするモジュールを指定します。
  # 
  # @see [[m:Module#refine]], [[m:main.using]]
  def using; end

  # --- constants -> [Symbol]
  # 
  # このメソッドを呼び出した時点で参照可能な定数名の配列を返します。
  # 
  # //emlist[例][ruby]{
  # class C
  #   FOO = 1
  # end
  # p Module.constants   # => [:RUBY_PLATFORM, :STDIN, ..., :C, ...]
  #                      # 出力中に :FOO は現われない
  # //}
  # 
  # @see [[m:Module#constants]], [[m:Kernel.#local_variables]], [[m:Kernel.#global_variables]], [[m:Object#instance_variables]], [[m:Module#class_variables]]
  def constants; end

  # --- nesting -> [Class, Module]
  # 
  # このメソッドを呼び出した時点でのクラス/モジュールのネスト情
  # 報を配列に入れて返します。
  # 
  # //emlist[例][ruby]{
  # module Foo
  #   module Bar
  #     module Baz
  #       p Module.nesting   # => [Foo::Bar::Baz, Foo::Bar, Foo]
  #     end
  #   end
  # end
  # //}
  def nesting; end

  # --- new -> Module
  # --- new {|mod| ... } -> Module
  # 
  # 名前の付いていないモジュールを新しく生成して返します。
  # 
  # ブロックが与えられると生成したモジュールをブロックに渡し、
  # モジュールのコンテキストでブロックを実行します。
  # 
  # //emlist[例][ruby]{
  # mod = Module.new
  # mod.module_eval {|m|
  #   # ...
  # }
  # mod
  # //}
  # 
  # と同じです。
  # ブロックの実行は Module#initialize が行います。
  # 
  # ブロックを与えた場合も生成したモジュールを返します。
  # 
  # このメソッドで生成されたモジュールは、
  # 最初に名前が必要になったときに名前が決定します。
  # モジュールの名前は、
  # そのモジュールが代入されている定数名のいずれかです。
  # 
  # //emlist[例][ruby]{
  # m = Module.new
  # p m               # => #<Module 0lx40198a54>
  # p m.name          # => nil   # まだ名前は未定
  # Foo = m
  # # m.name          # ここで m.name を呼べば m の名前は "Foo" に確定する
  # Bar = m
  # m.name            # "Foo" か "Bar" のどちらかに決まる
  # //}
  def new; end

  # --- used_modules -> [Module]
  # 
  # 現在のスコープで using されているすべてのモジュールを配列で返します。
  # 配列内のモジュールの順番は未定義です。
  # 
  # //emlist[例][ruby]{
  # module A
  #   refine Object do
  #   end
  # end
  # 
  # module B
  #   refine Object do
  #   end
  # end
  # 
  # using A
  # using B
  # p Module.used_modules
  # #=> [B, A]
  # //}
  def used_modules; end

end
