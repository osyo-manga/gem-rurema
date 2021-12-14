class Struct
  # --- ==(other)    -> bool
  # 
  # self と other のクラスが同じであり、各メンバが == メソッドで比較して等しい場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other self と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # Dog = Struct.new(:name, :age)
  # dog1 = Dog.new("fred", 5)
  # dog2 = Dog.new("fred", 5)
  # 
  # p dog1 == dog2                #=> true
  # p dog1.eql?(dog2)             #=> true
  # p dog1.equal?(dog2)           #=> false
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # @see [[m:Struct#eql?]]
  def ==; end

  # --- [](member) -> object
  # 構造体のメンバの値を返します。
  # 
  # @param member [[c:Integer]] でメンバのインデックスを指定します。
  #               [[c:Symbol]], [[c:String]] でメンバの名前を指定します。
  # 
  # @raise IndexError member が整数で存在しないメンバを指定した場合に発生します。
  # 
  # @raise NameError member が [[c:String]], [[c:Symbol]] で存在しないメンバを指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # obj = Foo.new('FOO', 'BAR')
  # p obj[:foo]     # => "FOO"
  # p obj['bar']    # => "BAR"
  # # p obj[:baz]     # => in `[]': no member 'baz' in struct (NameError)
  # p obj[0]        # => "FOO"
  # p obj[1]        # => "BAR"
  # p obj[-1]       # => "BAR"    # Array のように負のインデックスも指定できます。
  # p obj[2]        # => in `[]': offset 2 too large for struct(size:2) (IndexError)
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def []; end

  # --- []=(member, value)
  # 構造体の member で指定されたメンバの値を value にして value を返します。
  # 
  # @param member [[c:Integer]] でメンバのインデックスを指定します。
  #               [[c:Symbol]], [[c:String]] でメンバの名前を指定します。
  # 
  # @param value メンバに設定する値を指定します。
  # 
  # @raise IndexError member が整数で存在しないメンバを指定した場合に発生します。
  # 
  # @raise NameError member が [[c:String]], [[c:Symbol]] で存在しないメンバを指定した場合に発生します。
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  # 
  # joe["name"] = "Luke"
  # joe[:zip]   = "90210"
  # 
  # joe.name   #=> "Luke"
  # joe.zip    #=> "90210"
  # //}
  def []=; end

  # --- dig(key, ...) -> object | nil
  # 
  # self 以下のネストしたオブジェクトを dig メソッドで再帰的に参照して返し
  # ます。途中のオブジェクトが nil であった場合は nil を返します。
  # 
  # @param key キーを任意個指定します。
  # 
  # //emlist[例][ruby]{
  # klass = Struct.new(:a)
  # o = klass.new(klass.new({b: [1, 2, 3]}))
  # 
  # o.dig(:a, :a, :b, 0)              # => 1
  # o.dig(:b, 0)                      # => nil
  # //}
  # 
  # @see [[m:Array#dig]], [[m:Hash#dig]], [[m:OpenStruct#dig]]
  def dig; end

  # --- each {|value| ... } -> self
  # --- each -> Enumerator
  # 構造体の各メンバに対して繰り返します。
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  # joe.each {|x| puts(x) }
  # 
  # # => Joe Smith
  # #    123 Maple, Anytown NC
  # #    12345
  # //}
  def each; end

  # --- each_pair {|member, value| ... } -> self
  # --- each_pair -> Enumerator
  # 構造体のメンバ名([[c:Symbol]])と値の組を引数にブロックを繰り返し実行します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # Foo.new('FOO', 'BAR').each_pair {|m, v| p [m,v]}
  # # => [:foo, "FOO"]
  # #    [:bar, "BAR"]
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def each_pair; end

  # --- eql?(other)    -> bool
  # 
  # self と other のクラスが同じであり、各メンバが eql? メソッドで比較して等しい場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other self と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # Dog = Struct.new(:name, :age)
  # dog1 = Dog.new("fred", 5)
  # dog2 = Dog.new("fred", 5)
  # 
  # p dog1 == dog2                #=> true
  # p dog1.eql?(dog2)             #=> true
  # p dog1.equal?(dog2)           #=> false
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # @see [[m:Struct#==]]
  def eql?; end

  # --- equal?(other)   -> bool
  # 
  # 指定された other が self 自身である場合のみ真を返します。
  # これは [[c:Object]] クラスで定義されたデフォルトの動作で
  # す。
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # 
  # @see [[m:Struct#eql?]], [[m:Struct#==]]
  def equal?; end

  # --- select {|i| ... } -> [object]
  # --- select -> Enumerator
  # --- filter {|i| ... } -> [object]
  # --- filter -> Enumerator
  # 
  # 構造体のメンバの値に対してブロックを評価した値が真であった要素を全て含
  # む配列を返します。真になる要素がひとつもなかった場合は空の配列を返しま
  # す。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # Lots = Struct.new(:a, :b, :c, :d, :e, :f)
  # l = Lots.new(11, 22, 33, 44, 55, 66)
  # l.select {|v| (v % 2).zero? }   #=> [22, 44, 66]
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # @see [[m:Enumerable#select]]
  def filter; end

  # --- hash    -> Integer
  # 
  # self が保持するメンバのハッシュ値を元にして算出した整数を返します。
  # self が保持するメンバの値が変化すればこのメソッドが返す値も変化します。
  # 
  # //emlist[例][ruby]{
  # Dog = Struct.new(:name, :age)
  # dog = Dog.new("fred", 5)
  # p dog.hash                    #=> 7917421
  # dog.name = "john"
  # p dog.hash                    #=> -38913223
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def hash; end

  # --- inspect -> String
  # --- to_s    -> String
  # 
  # self の内容を人間に読みやすい文字列にして返します。
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  # joe.inspect # => "#<struct Customer name=\"Joe Smith\", address=\"123 Maple, Anytown NC\", zip=12345>"
  # //}
  def inspect; end

  # --- length -> Integer
  # --- size -> Integer
  # 構造体のメンバの数を返します。
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # joe = Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  # joe.length   #=> 3
  # //}
  def length; end

  # --- members -> [Symbol]
  # 構造体のメンバの名前([[c:Symbol]])の配列を返します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # p Foo.new.members  # => [:foo, :bar]
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def members; end

  # --- values -> [object]
  # --- to_a -> [object]
  # 構造体のメンバの値を配列にいれて返します。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345).to_a
  # # => ["Joe Smith", "123 Maple, Anytown NC", 12345]
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def to_a; end

  # --- to_h -> Hash
  # --- to_h {|member, value| block } -> Hash
  # 
  # self のメンバ名([[c:Symbol]])と値の組を [[c:Hash]] にして返します。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345).to_h
  # # => {:name=>"Joe Smith", :address=>"123 Maple, Anytown NC", :zip=>12345}
  # //}
  # 
  # ブロックを指定すると各ペアでブロックを呼び出し、
  # その結果をペアとして使います。
  # //emlist[ブロック付きの例][ruby]{
  # Customer = Struct.new(:name, :address, :zip)
  # Customer.new("Joe Smith", "123 Maple, Anytown NC", 12345).to_h {|member, value|
  #   [member, value*2]
  # } # => {:name=>"Joe SmithJoe Smith", :address=>"123 Maple, Anytown NC123 Maple, Anytown NC", :zip=>24690}
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def to_h; end

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
  # Person = Struct.new(:name, :age)
  # Person.new("tanaka", 29).to_json # => "{\"json_class\":\"Person\",\"v\":[\"tanaka\",29]}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- values_at(*members) -> [object]
  # 引数で指定されたメンバの値の配列を返します。
  # 
  # @param members [[c:Integer]] か [[c:Range]] でメンバのインデックスを指定します。
  # 
  # @raise IndexError member が整数で存在しないメンバを指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar, :baz)
  # obj = Foo.new('FOO', 'BAR', 'BAZ')
  # p obj.values_at(0, 1, 2)    # => ["FOO", "BAR", "BAZ"]
  # //}
  # 
  # [注意] 本メソッドの記述は Struct の下位クラスのインスタンスに対して呼び
  # 出す事を想定しています。Struct.new は Struct の下位クラスを作成する点に
  # 注意してください。
  def values_at; end

  # --- new(*args, keyword_init: false)                  -> Class
  # --- new(*args, keyword_init: false) {|Class| block } -> Class
  # 
  # [[c:Struct]] クラスに新しいサブクラスを作って、それを返します。
  # 
  # サブクラスでは構造体のメンバに対するアクセスメソッドが定義されています。
  # 
  # //emlist[例][ruby]{
  # dog = Struct.new("Dog", :name, :age)
  # fred = dog.new("fred", 5)
  # fred.age = 6
  # printf "name:%s age:%d", fred.name, fred.age
  # #=> "name:fred age:6" を出力します
  # //}
  # 
  # 実装の都合により、クラス名の省略は後づけの機能でした。
  # メンバ名に [[c:String]] を指定できるのは後方互換性のためだと考えた方が良いでしょう。
  # したがって、メンバ名は [[c:Symbol]] で指定するのが無難です。
  # 
  # @param args 構造体を定義するための可変長引数。[[c:String]] または [[c:Symbol]] を指定します。
  # @param keyword_init true を指定すると、キーワード引数で初期化する構造体を定義します。
  # 
  # === 第一引数が String の場合
  # args[0] が [[c:String]] の場合、クラス名になるので、大文字で始まる必要
  # があります。つまり、以下のような指定はエラーになります。
  # 
  # //emlist[例][ruby]{
  # p Struct.new('foo', 'bar')
  # # => -:1:in `new': identifier foo needs to be constant (NameError)
  # //}
  # 
  # また args[1..-1] は、[[c:Symbol]] か [[c:String]] で指定します。
  # 
  # //emlist[例][ruby]{
  # p Struct.new("Foo", :foo, :bar)   # => Struct::Foo
  # //}
  # 
  # === 第一引数が Symbol の場合
  # args[0] が [[c:Symbol]] の場合、生成した構造体クラスは名前の無い
  # クラスになります。名前の無いクラスは最初に名前を求める際に代入され
  # ている定数名を検索し、見つかった定数名をクラス名とします。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # p Foo                             # => Foo
  # //}
  # 
  # === ブロックを指定した場合
  # 
  # Struct.new にブロックを指定した場合は定義した Struct をコンテキストにブ
  # ロックを評価します。また、定義した Struct はブロックパラメータにも渡さ
  # れます。
  # 
  # //emlist[例][ruby]{
  # Customer = Struct.new(:name, :address) do
  #   def greeting
  #     "Hello #{name}!"
  #   end
  # end
  # Customer.new("Dave", "123 Main").greeting # => "Hello Dave!"
  # //}
  # 
  # Structをカスタマイズする場合はこの方法が推奨されます。無名クラスのサブ
  # クラスを作成する方法でカスタマイズする場合は無名クラスが使用されなくなっ
  # てしまうことがあるためです。
  # 
  # @see [[m:Class.new]]
  # 
  # === keyword_init: true を指定した場合
  # 
  # キーワード引数で初期化することを想定した構造体になります。
  # 
  # //emlist[例][ruby]{
  # Point = Struct.new(:x, :y, keyword_init: true) # => Point(keyword_init: true)
  # Point.new(x: 1, y: 2) # => #<struct Point x=1, y=2>
  # Point.new(x: 1)       # => #<struct Point x=1, y=nil>
  # Point.new(y: 2)       # => #<struct Point x=nil, y=2>
  # Point.new(z: 3)       # ArgumentError (unknown keywords: z)
  # //}
  # 
  # --- new(*args) -> Struct
  # --- [](*args) -> Struct
  # (このメソッドは Struct の下位クラスにのみ定義されています)
  # 構造体オブジェクトを生成して返します。
  # 
  # @param args 構造体の初期値を指定します。メンバの初期値は指定されなければ nil です。
  # 
  # @return 構造体クラスのインスタンス。
  # 
  # @raise ArgumentError 構造体のメンバの数よりも多くの引数を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # foo = Foo.new(1)
  # p foo.values      # => [1, nil]
  # //}
  def []; end

  # --- json_create(hash) -> Struct
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- members -> [Symbol]
  # (このメソッドは Struct の下位クラスにのみ定義されています)
  # 構造体のメンバの名前([[c:Symbol]])の配列を返します。
  # 
  # //emlist[例][ruby]{
  # Foo = Struct.new(:foo, :bar)
  # p Foo.members      # => [:foo, :bar]
  # //}
  def members; end

end
