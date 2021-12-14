class BasicObject
  # --- ! -> bool
  # オブジェクトを真偽値として評価し、その論理否定を返します。
  # 
  # このメソッドは self が nil または false であれば真を、さもなくば偽を返します。
  # 主に論理式の評価に伴って副作用を引き起こすことを目的に
  # 再定義するものと想定されています。
  # 
  # このメソッドを再定義しても Ruby の制御式において nil や false 以外が偽として
  # 扱われることはありません。
  # 
  # @return オブジェクトが偽であれば真、さもなくば偽
  # 
  # //emlist[例][ruby]{
  # class NegationRecorder < BasicObject
  #   def initialize
  #     @count = 0
  #   end
  #   attr_reader :count
  #  
  #   def !
  #     @count += 1
  #     super
  #   end
  # end
  # 
  # recorder = NegationRecorder.new
  # !recorder
  # !!!!!!!recorder
  # puts 'hoge' if !recorder
  # 
  # puts recorder.count #=> 3
  # //}
  # 
  # //emlist[例][ruby]{
  # class AnotherFalse < BasicObject
  #   def !
  #     true
  #   end
  # end
  # another_false = AnotherFalse.new
  # 
  # # another_falseは*真*
  # puts "another false is a truth" if another_false
  # #=> "another false is a truth"
  # //}
  def !; end

  # --- !=(other) -> bool
  # オブジェクトが other と等しくないことを判定します。
  # 
  # デフォルトでは self == other を評価した後に結果を論理否定して返します。
  # このため、サブクラスで [[m:BasicObject#==]] を再定義しても != とは自動的に整合性が
  # とれるようになっています。
  # 
  # ただし、 [[m:BasicObject#!=]] 自身や [[m:BasicObject#!]] を再定義した際には、ユーザーの責任で
  # 整合性を保たなくてはなりません。
  # 
  # このメソッドは主に論理式の評価に伴って副作用を引き起こすことを目的に
  # 再定義するものと想定されています。
  # 
  # @param other 比較対象となるオブジェクト
  # @see [[m:BasicObject#==]], [[m:BasicObject#!]]
  # 
  # //emlist[例][ruby]{
  # class NonequalityRecorder < BasicObject
  #   def initialize
  #     @count = 0
  #   end
  #   attr_reader :count
  # 
  #   def !=(other)
  #     @count += 1
  #     super
  #   end
  # end
  # recorder = NonequalityRecorder.new
  # 
  # recorder != 1
  # puts 'hoge' if recorder != "str"
  # 
  # p recorder.count #=> 2
  # //}
  def !=; end

  # --- ==(other) -> bool
  # オブジェクトが other と等しければ真を、さもなくば偽を返します。
  # 
  # このメソッドは各クラスの性質に合わせて、サブクラスで再定義するべきです。
  # 多くの場合、オブジェクトの内容が等しければ真を返すように (同値性を判定するように) 再定義
  # することが期待されています。
  # 
  # デフォルトでは [[m:Object#equal?]] と同じオブジェクトの同一性になっています。
  # 
  # @param other 比較対象となるオブジェクト
  # @return other が self と同値であれば真、さもなくば偽
  # 
  # //emlist[例][ruby]{
  # class Person < BasicObject
  #   def initialize(name, age)
  #     @name = name
  #     @age = age
  #   end
  # end
  # 
  # tanaka1 = Person.new("tanaka", 24)
  # tanaka2 = Person.new("tanaka", 24)
  # 
  # tanaka1 == tanaka1    #=> true
  # tanaka1 == tanaka2    #=> false
  # //}
  # 
  # @see [[m:BasicObject#equal?]], [[m:Object#==]], [[m:Object#equal?]],
  #      [[m:Object#eql?]]
  def ==; end

  # --- __id__ -> Integer
  # 
  # 各オブジェクトに対して一意な整数を返します。あるオブジェクトに対し
  # てどのような整数が割り当てられるかは不定です。
  # 
  # [[m:Object#object_id]] と同じですが、#object_id は [[c:BasicObject]] に
  # はない事に注意してください。
  # 
  # //emlist[例][ruby]{
  # # frozen_string_literal: false
  # obj = Object.new
  # obj.object_id == obj.__id__              # => true
  # Object.new.__id__  == Object.new.__id__  # => false
  # (21 * 2).__id__    == (21 * 2).__id__    # => true
  # "hello".__id__     == "hello".__id__     # => false
  # "hi".freeze.__id__ == "hi".freeze.__id__ # => true
  # //}
  # 
  # @see [[m:Object#object_id]], [[ruby-dev:42840]]
  def __id__; end

  # --- __send__(name, *args) -> object
  # --- __send__(name, *args) { .... } -> object
  # オブジェクトのメソッド name を args を引数にして呼び出し、メソッドの結果を返します。
  # 
  # ブロック付きで呼ばれたときはブロックもそのまま引き渡します。
  # 
  # @param name 呼び出すメソッドの名前。 [[c:Symbol]] または文字列で指定します。
  # @param args メソッドに渡す任意個の引数
  # 
  # //emlist[例][ruby]{
  # class Mail
  #   def delete(*args)
  #     "(Mail#delete) - delete " + args.join(',')
  #   end
  #   def send(name, *args)
  #     "(Mail#send) - #{name} #{args.join(',')}"
  #   end
  # end
  # mail = Mail.new
  # mail.send :delete, "gentle", "readers"       # => "(Mail#send) - delete gentle,readers"
  # mail.__send__ :delete, "gentle", "readers"   # => "(Mail#delete) - delete gentle,readers"
  # //}
  # 
  # @see [[m:Object#send]]
  def __send__; end

  # --- equal?(other) -> bool
  # オブジェクトが other と同一であれば真を、さもなくば偽を返します。
  # 
  # このメソッドは2つのオブジェクトが同一のものであるかどうかを判定します。
  # 一般にはこのメソッドを決して再定義すべきでありません。
  # ただし、 [[c:BasicObject]] の位置づけ上、どうしても再定義が必要な用途もあるでしょう。
  # 再定義する際には自分が何をしているのかよく理解してから実行してください。
  # 
  # @param other 比較対象となるオブジェクト
  # @return other が self 自身であれば真、さもなくば偽
  # 
  # //emlist[例][ruby]{
  # original = "a"
  # copied = original.dup
  # substituted = original
  # 
  # original == copied          #=> true
  # original == substituted     #=> true
  # original.equal? copied      #=> false
  # original.equal? substituted #=> true
  # //}
  # 
  # @see [[m:Object#equal?]], [[m:Object#==]], [[m:Object#eql?]]
  def equal?; end

  # --- instance_eval(expr, filename = "(eval)", lineno = 1) -> object
  # --- instance_eval {|obj| ... }                           -> object
  # 
  # オブジェクトのコンテキストで文字列 expr またはオブジェクト自身をブロックパラメータとするブロックを
  # 評価してその結果を返します。
  # 
  # オブジェクトのコンテキストで評価するとは評価中の self をそのオブジェクトにして実行するということです。
  # また、文字列 expr やブロック中でメソッドを定義すればそのオブジェクトの特異メソッドが定義されます。
  # 
  # ただし、ローカル変数だけは、文字列 expr の評価では instance_eval の外側のスコープと、ブロックの評価ではそのブロックの外側のスコープと、共有します。
  # 
  # メソッド定義の中で instance_eval でメソッドを定義した場合は、囲むメソッドが実行されたときに
  # 初めて instance_eval 内のメソッドが定義されます。これはメソッド定義のネストと同じです。
  # [[ref:d:spec/def#nest_method]] を参照してください。
  # 
  # BasicObject を継承して作ったクラス内で instance_eval する場合はトップレベルの定数や Kernel モジュールに定義されているメソッドは見えません。
  # これは、トップレベルの定数が Object 以下に作成されるためです。
  # 
  # @param expr  評価する文字列です。
  # 
  # @param filename 文字列を指定します。ファイル filename に文字列 expr が
  #                 書かれているかのように実行されます。スタックトレースの
  #                 表示などを差し替えることができます。
  # 
  # @param lineno 整数を指定します。行番号 lineno から文字列 expr が書かれているかのように実行されます。
  #               スタックトレースの表示などを差し替えることができます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def initialize data
  #     @key = data
  #   end
  #   private
  #   def do_fuga
  #     p 'secret'
  #   end
  # end
  # 
  # some = Foo.new 'XXX'
  # some.instance_eval{p @key} #=> "XXX"
  # some.instance_eval{do_fuga } #=> "secret" # private メソッドも呼び出せる
  # 
  # some.instance_eval 'raise' # ..:10: (eval):1:  (RuntimeError)
  # messg = 'unknown'
  # some.instance_eval 'raise messg','file.rb',999 # file.rb:999: unknown (RuntimeError)
  # //}
  # 
  # //emlist[例][ruby]{
  # class Bar < BasicObject
  #   def call1
  #     instance_eval("::ENV.class")
  #   end
  #   def call2
  #     instance_eval("ENV.class")
  #   end
  # end
  # 
  # bar = Bar.new
  # bar.call1 # => Object
  # bar.call2 # raise NameError
  # //}
  # 
  # @see [[m:Module#module_eval]], [[m:Kernel.#eval]], [[m:BasicObject#instance_exec]]
  def instance_eval; end

  # --- instance_exec(*args) {|*vars| ... } -> object
  # 
  # 与えられたブロックをレシーバのコンテキストで実行します。
  # 
  # ブロック実行中は、 self がレシーバのコンテキストになるので
  # レシーバの持つインスタンス変数にアクセスすることができます。
  # 
  # @param args ブロックパラメータに渡す値です。
  # 
  # //emlist[例][ruby]{
  # class KlassWithSecret
  #   def initialize
  #     @secret = 99
  #   end
  # end
  # k = KlassWithSecret.new
  # # 以下で x には 5 が渡される
  # k.instance_exec(5) {|x| @secret + x }   #=> 104
  # //}
  # 
  # @see [[m:Module#class_exec]], [[m:Module#module_exec]], [[m:BasicObject#instance_eval]]
  def instance_exec; end

  # --- method_missing(name, *args) -> object
  # 
  # 呼びだされたメソッドが定義されていなかった時、Rubyインタプリタがこのメソッド
  # を呼び出します。
  # 
  # 呼び出しに失敗したメソッドの名前 ([[c:Symbol]]) が name に
  # その時の引数が第二引数以降に渡されます。
  # 
  # デフォルトではこのメソッドは例外 [[c:NoMethodError]] を発生させます。
  # 
  # 
  # @param name 未定義メソッドの名前（シンボル）です。
  # @param args 未定義メソッドに渡された引数です。
  # @return ユーザー定義の method_missing メソッドの返り値が未定義メソッドの返り値で
  #   あるかのように見えます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def initialize(data)
  #     @data = data
  #   end
  #   def method_missing(name, lang)
  #     if name.to_s =~ /\Afind_(\d+)_in\z/
  #       if @data[lang]
  #         p @data[lang][$1.to_i]
  #       else
  #         raise "#{lang} unknown"
  #       end
  #     else
  #       super
  #     end
  #   end
  # end
  # 
  # dic = Foo.new({:English => %w(zero one two), :Esperanto => %w(nulo unu du)})
  # dic.find_2_in :Esperanto #=> "du"
  # //}
  # 
  # [注意] このメソッドを override する場合は対象のメソッド名に対して
  # [[m:Object#respond_to?]] が真を返すようにしてください。
  # そのためには、[[m:Object#respond_to_missing?]] も同様に override する必
  # 要があります。
  # 
  # @see [[m:Object#respond_to?]], [[m:Object#respond_to_missing?]]
  def method_missing; end

  # --- singleton_method_added(name) -> object
  # 
  # 特異メソッドが追加された時にインタプリタから呼び出されます。
  # 
  # 通常のメソッドの追加に対するフックには
  # [[m:Module#method_added]]を使います。
  # 
  # @param name 追加されたメソッド名が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def singleton_method_added(name)
  #     puts "singleton method \"#{name}\" was added"
  #   end
  # end
  # 
  # obj = Foo.new
  # def obj.foo
  # end
  # 
  # #=> singleton method "foo" was added
  # //}
  # 
  # @see [[m:Module#method_added]],[[m:BasicObject#singleton_method_removed]],[[m:BasicObject#singleton_method_undefined]]
  def singleton_method_added; end

  # --- singleton_method_removed(name) -> object
  # 
  # 特異メソッドが [[m:Module#remove_method]] に
  # より削除された時にインタプリタから呼び出されます。
  # 
  # 通常のメソッドの削除に対するフックには
  # [[m:Module#method_removed]]を使います。
  # 
  # @param name 削除されたメソッド名が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def singleton_method_removed(name)
  #     puts "singleton method \"#{name}\" was removed"
  #   end
  # end
  # 
  # obj = Foo.new
  # def obj.foo
  # end
  # 
  # class << obj
  #   remove_method :foo
  # end
  # 
  # #=> singleton method "foo" was removed
  # //}
  # 
  # @see [[m:Module#method_removed]],[[m:BasicObject#singleton_method_added]],[[m:BasicObject#singleton_method_undefined]]
  def singleton_method_removed; end

  # --- singleton_method_undefined(name) -> object
  # 
  # 特異メソッドが [[m:Module#undef_method]] または
  # undef により未定義にされた時にインタプリタから呼び出されます。
  # 
  # 通常のメソッドの未定義に対するフックには
  # [[m:Module#method_undefined]] を使います。
  # 
  # @param name 未定義にされたメソッド名が [[c:Symbol]] で渡されます。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #   def singleton_method_undefined(name)
  #     puts "singleton method \"#{name}\" was undefined"
  #   end
  # end
  # 
  # obj = Foo.new
  # def obj.foo
  # end
  # def obj.bar
  # end
  # 
  # class << obj
  #   undef_method :foo
  # end
  # obj.instance_eval {undef bar}
  # 
  # #=> singleton method "foo" was undefined
  # #   singleton method "bar" was undefined
  # //}
  # 
  # @see [[m:Module#method_undefined]],[[m:BasicObject#singleton_method_added]],[[m:BasicObject#singleton_method_removed]] , [[ref:d:spec/def#undef]]
  def singleton_method_undefined; end

end
