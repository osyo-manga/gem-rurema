class Hash
  # --- <(other) -> bool
  # 
  # self が other のサブセットである場合に真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # h1 = {a:1, b:2}
  # h2 = {a:1, b:2, c:3}
  # h1 < h2    # => true
  # h2 < h1    # => false
  # h1 < h1    # => false
  # //}
  # 
  # @see [[m:Hash#<=]], [[m:Hash#>=]], [[m:Hash#>]]
  def <; end

  # --- <=(other) -> bool
  # 
  # self が other のサブセットか同じである場合に真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # h1 = {a:1, b:2}
  # h2 = {a:1, b:2, c:3}
  # h1 <= h2   # => true
  # h2 <= h1   # => false
  # h1 <= h1   # => true
  # //}
  # 
  # @see [[m:Hash#<]], [[m:Hash#>=]], [[m:Hash#>]]
  def <=; end

  # --- ==(other) -> bool
  # --- ===(other) -> bool
  # --- eql?(other) -> bool
  # 
  # 自身と other が同じ数のキーを保持し、キーが eql? メソッドで比較して全て等しく、
  # 値が == メソッドで比較して全て等しい場合に真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # #(出力関数は省略)
  # { 1 => :a } == { 1 => :a }               #=> true
  # { 1 => :a } == { 1 => :a, 2 => :b }      #=> false
  # { 1 => :a } == { 1.0 => :a }             #=> false  ( 1.eql?(1.0) は false なので)
  # 
  # { :x => 1 } == { :x => 1.0 }             #=> true   ( 1 == 1.0 は true なので)
  # //}
  # 
  # @see [[m:Hash#equal?]]
  def ==; end

  # --- >(other) -> bool
  # 
  # other が self のサブセットである場合に真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # h1 = {a:1, b:2}
  # h2 = {a:1, b:2, c:3}
  # h1 > h2    # => false
  # h2 > h1    # => true
  # h1 > h1    # => false
  # //}
  # 
  # @see [[m:Hash#<=]], [[m:Hash#<]], [[m:Hash#>=]]
  def >; end

  # --- >=(other) -> bool
  # 
  # other が self のサブセットか同じである場合に真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # h1 = {a:1, b:2}
  # h2 = {a:1, b:2, c:3}
  # h1 >= h2   # => false
  # h2 >= h1   # => true
  # h1 >= h1   # => true
  # //}
  # 
  # @see [[m:Hash#<=]], [[m:Hash#<]], [[m:Hash#>]]
  def >=; end

  # --- [](key) -> object | nil
  # key に関連づけられた値を返します。
  # 
  # 該当するキーが登録されていない時には、デフォルト値を返します。
  # 
  # デフォルト値と値としての nil を区別する必要が
  # ある場合は [[m:Hash#fetch]] または [[m:Hash#key?]] を使ってください。
  # 
  # @param key 探索するキーを指定します。
  # 
  # //emlist[例][ruby]{
  # h = {:ab => "some" , :cd => "all"}
  # p h[:ab]             #=> "some"
  # p h[:ef]             #=> nil
  # 
  # h1 = Hash.new("default value")
  # p h1[:non]             #=> "default value"
  # 
  # h2 = Hash.new {|*arg| arg}
  # p h2[:non]             #=> [{}, :non]
  # //}
  # 
  # @see [[m:Hash.new]], [[m:Hash#fetch]],[[m:Hash#values_at]],[[m:Hash#key?]], [[m:Hash#default]], [[m:Hash#default_proc]]
  def []; end

  # --- []=(key, value)
  # --- store(key, value) -> object
  # 
  # key に対して value を関連づけます。value を返し
  # ます。
  # 
  # @param key キーを指定します。
  # @param value 値を指定します。
  # 
  # 
  # //emlist[例][ruby]{
  # h = {}
  # 
  # h[:key] = "value"
  # p h #=>{:key => "value"}
  # //}
  # 
  # @see [[m:Hash#[] ]]
  def []=; end

  # --- assoc(key)   ->  Array | nil
  # 
  # ハッシュが key をキーとして持つとき、見つかった要素のキーと値のペア
  # を配列として返します。
  # 
  # キーの同一性判定には eql? メソッドではなく == メソッドを使います。
  # key が見つからなかった場合は、nil を返します。
  # 
  # @param key 検索するキー
  # 
  # //emlist[例][ruby]{
  # h = {"colors"  => ["red", "blue", "green"],
  #      "letters" => ["a", "b", "c" ]}
  # h.assoc("letters")  #=> ["letters", ["a", "b", "c"]]
  # h.assoc("foo")      #=> nil
  # //}
  # 
  # 
  # 
  # @see [[m:Array#assoc]]
  def assoc; end

  # --- clear -> self
  # 
  # ハッシュの中身を空にします。
  # 
  # 空にした後のselfを返します。
  # デフォルト値の設定はクリアされません。
  # 
  # //emlist[例][ruby]{
  # h = Hash.new("default value")
  # h[:some] = "some"
  # p h #=> {:some=>"some"}
  # 
  # h.clear
  # 
  # p h #=> {}
  # p h.default #=> "default value"
  # //}
  def clear; end

  # --- clone -> Hash
  # --- dup -> Hash
  # 
  # selfと同じ内容を持つ新しいハッシュを返します。
  # 
  # clone は frozen tainted singleton-class の情報も含めてコピーしますが、 dup は内容だけをコピーします。
  # またどちらのメソッドも要素それ自体のコピーはしません。つまり参照しているオブジェクトが
  # 変わらない「浅い(shallow)」コピーを行います。
  # 
  # //emlist[例][ruby]{
  # h1 = {"have" => "have a","as" => "as a" }
  # h2 = h1.dup
  # 
  # h2["have"] = "has"
  # p h2 #=> {"have"=>"has", "as"=>"as a"}
  # p h1 #=> {"have"=>"have a", "as"=>"as a"}
  # 
  # h2["as"].upcase!
  # p h2 #=> {"have"=>"has", "as"=>"AS A"}
  # p h1 #=> {"have"=>"have a", "as"=>"AS A"}
  # //}
  # 
  # @see [[m:Object#clone]]
  def clone; end

  # --- compact -> Hash
  # --- compact! -> self | nil
  # 
  # compact は自身から value が nil のもの取り除いた Hash を生成して返します。 compact! は自身から破壊的に value が nil のものを取り除き、変更が行われた場合は self を、そうでなければ nil を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # hash = {a: 1, b: nil, c: 3}
  # p hash.compact  #=> {:a=>1, :c=>3}
  # p hash          #=> {:a=>1, :b=>nil, :c=>3}
  # hash.compact!
  # hash            #=> {:a=>1, :c=>3}
  # p hash.compact! #=>  nil
  # //}
  # 
  # @see [[m:Array#compact]]
  def compact; end

  # --- compare_by_identity -> self
  # 
  # ハッシュのキーの一致判定をオブジェクトの同一性で判定するように変更します。
  # 
  # デフォルトでは、キーのオブジェクトによっては内容が同じならキーが一致しているとみなされますが、より厳密に
  # [[m:Object#object_id]]が一致しているかどうかを条件とするようにselfを変更します。
  # 
  # selfが変化する破壊的メソッドです。
  # 
  # @return selfを返します。
  # 
  # //emlist[例][ruby]{
  # h1 = { "a" => 100, "b" => 200, :c => "c" }
  # p h1.compare_by_identity? #=> false
  # p h1["a"]        #=> 100
  # 
  # h1.compare_by_identity
  # 
  # p h1.compare_by_identity? #=> true
  # p h1["a"]        #=> nil  # この"a"と最初の"a"とは違うオブジェクト
  # p h1[:c]         #=> "c"  # 同じ内容のシンボルはすべて同一
  # //}
  # 
  # @see [[m:Hash#compare_by_identity?]]
  def compare_by_identity; end

  # --- compare_by_identity? -> bool
  # 
  # ハッシュがキーの一致判定をオブジェクトの同一性を用いて行っているならば真を返します。
  # 
  # //emlist[例][ruby]{
  # h1 = {}
  # p h1.compare_by_identity? #=> false
  # 
  # h1.compare_by_identity
  # 
  # p h1.compare_by_identity? #=> true
  # //}
  # 
  # @see [[m:Hash#compare_by_identity]]
  def compare_by_identity?; end

  # --- default -> object | nil
  # --- default(key) -> object | nil
  # ハッシュのデフォルト値を返します。
  # 
  # ハッシュのデフォルト値がブロックで与えられている場合、 1 番目の形式だと
  # 返り値が nil になることに注意してください。この場合、ハッシュのデフォルト値に
  # ついて調べるには 2 番目の形式か [[m:Hash#default_proc]] を使ってください。
  # 
  # 2 番目の形式はハッシュがデフォルト値としてブロックを持つ場合に、
  # self と引数 key をブロックに渡して評価し、その結果を返します。
  # 
  # @param key デフォルトのブロックにキーとして渡されます。
  # 
  # //emlist[例][ruby]{
  # h = Hash.new("default")
  # p h.default        #=> "default"
  # p h.default(:some) #=> "default"
  # p h #=>{}
  # 
  # h = Hash.new{|hash, key| hash[key] ="default" }
  # p h.default        #=> nil
  # p h.default(:some) #=> "default"
  # p h                #=> {:some=>"default"}
  # 
  # h = Hash.new
  # p h.default        #=> nil
  # p h.default(:some) #=> nil
  # p h                #=> {}
  # //}
  # 
  # @see [[m:Hash#default=]], [[m:Hash#default_proc]]
  def default; end

  # --- default=(value)
  # 
  # ハッシュのデフォルト値を value に変更します。対応する値が存
  # 在しないキーで検索した時にはこの値を返すようになります。
  # 
  # デフォルト値（ブロックを含む）が既に設定してあった場合も value で上書きします。
  # 
  # @param value 設定するデフォルト値です。
  # @return value を返します。
  # 
  # //emlist[例][ruby]{
  # h = {}
  # p h.default #=>nil
  # 
  # h.default = "default"
  # p h.default #=>"default"
  # //}
  # 
  # @see [[m:Hash#default]]
  def default=; end

  # --- default_proc -> Proc | nil
  # 
  # ハッシュのデフォルト値を返す [[c:Proc]] オブジェクトを返します。
  # ハッシュがブロック形式のデフォルト値を持たない場合 nil を返します。
  # 
  # //emlist[例][ruby]{
  # h = Hash.new {|hash, key| "The #{key} not exist in #{hash.inspect}"}
  # p h.default              #=> nil
  # p block = h.default_proc #=> #<Proc:0x0x401a9ff4>
  # p block.call({},:foo)    #=> "The foo not exist in {}"
  # 
  # h = Hash.new("default")
  # p h.default              #=> "default"
  # p h.default_proc         #=> nil
  # //}
  # 
  # @see [[m:Hash#default]]
  def default_proc; end

  # --- default_proc=(pr)
  # 
  # ハッシュのデフォルト値を返す [[c:Proc]] オブジェクトを
  # 変更します。
  # 
  # 以前のデフォルトは値([[m:Hash#default]])の場合も
  # Proc の場合([[m:Hash#default_proc]])でも上書きされます。
  # 
  # 引数には to_proc で [[c:Proc]] オブジェクトに変換できる
  # オブジェクトも受け付けます。
  # 
  # nil を指定した場合は現在の [[m:Hash#default_proc]] をクリアします。
  # 
  # @param pr デフォルト値を返す手続きオブジェクト
  # 
  # //emlist[例][ruby]{
  # h = {}
  # h.default_proc = proc do |hash, key|
  #   hash[key] = case
  #               when (key % 15).zero?
  #                 "FizzBuzz"
  #               when (key % 5).zero?
  #                  "Buzz"
  #               when (key % 3).zero?
  #                  "Fizz"
  #               else
  #                  key
  #               end
  # end
  # p h[1]  # => 1
  # p h[2]  # => 2
  # p h[3]  # => "Fizz"
  # p h[5]  # => "Buzz"
  # p h[15] # => "FizzBuzz"
  # 
  # h.default_proc = nil
  # p h[16] # => nil
  # # default_proc が nil になったので `16=>16 が追加されていない`
  # p h     # => {1=>1, 2=>2, 3=>"Fizz", 5=>"Buzz", 15=>"FizzBuzz"}
  # //}
  # 
  # @see [[m:Hash#default_proc]], [[m:Hash#default]]
  def default_proc=; end

  # --- delete(key) -> object | nil
  # --- delete(key) {|key| ... } -> object
  # 
  # key に対応する要素を取り除きます。
  # 
  # @param key 取り除くキーを指定します。
  # 
  # @return 取り除かれた要素の値を返します。
  #         key に対応する要素が存在しない時には nil を返します。
  # 
  #         与えられたブロックは key にマッチする要素がなかった時に評価され、その結果を返します。
  # 
  # //emlist[例][ruby]{
  # h = {:ab => "some" , :cd => "all"}
  # 
  # p h.delete(:ab) #=> "some"
  # p h.delete(:ef) #=> nil
  # p h.delete(:ef){|key|"#{key} Nothing"} #=> "ef Nothing"
  # 
  # p h #=> {:cd=>"all"}
  # //}
  # 
  # @see [[m:Hash#delete_if]]
  def delete; end

  # --- delete_if -> Enumerator
  # --- reject!   -> Enumerator
  # --- delete_if {|key, value| ... } -> self
  # --- reject! {|key, value| ... } -> self|nil
  # 
  # キーと値を引数としてブロックを評価した結果が真であ
  # るような要素を self から削除します。
  # 
  # delete_if は常に self を返します。
  # reject! は、要素を削除しなかった場合には nil を返し、
  # そうでなければ self を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # h = { 2 => "8" ,4 => "6" ,6 => "4" ,8 => "2" }
  # 
  # p h.reject!{|key, value| key.to_i < value.to_i }   #=> { 6 => "4", 8 => "2" }
  # p h                                                #=> { 6 => "4", 8 => "2" }
  # 
  # p h.delete_if{|key, value| key.to_i < value.to_i } #=> { 6 => "4", 8 => "2" }
  # p h.reject!{|key, value| key.to_i < value.to_i }   #=> nil
  # //}
  # 
  # @see [[m:Hash#reject]],[[m:Hash#delete]]
  # @see [[m:Hash#keep_if]],[[m:Hash#select!]]
  def delete_if; end

  # --- dig(key, ...) -> object | nil
  # 
  # self 以下のネストしたオブジェクトを dig メソッドで再帰的に参照して返し
  # ます。途中のオブジェクトが nil であった場合は nil を返します。
  # 
  # @param key キーを任意個指定します。
  # 
  # //emlist[例][ruby]{
  # h = { foo: {bar: {baz: 1}}}
  # 
  # h.dig(:foo, :bar, :baz)      # => 1
  # h.dig(:foo, :zot, :xyz)      # => nil
  # 
  # g = { foo: [10, 11, 12] }
  # g.dig(:foo, 1)               # => 11
  # //}
  # 
  # @see [[m:Array#dig]], [[m:Struct#dig]], [[m:OpenStruct#dig]]
  def dig; end

  # --- each {|key, value| ... } -> self
  # --- each_pair {|key, value| ... } -> self
  # --- each      -> Enumerator
  # --- each_pair -> Enumerator
  # 
  # ハッシュのキーと値を引数としてブロックを評価します。
  # 
  # 反復の際の評価順序はキーが追加された順です。
  # ブロック付きの場合 self を、
  # 無しで呼ばれた場合 [[c:Enumerator]] を返します。
  # 
  # each_pair は each のエイリアスです。
  # 
  # //emlist[例][ruby]{
  # {:a=>1, :b=>2}.each {|a| p a}
  # #=> [:a, 1]
  # #   [:b, 2]
  # 
  # {:a=>1, :b=>2}.each {|k, v| p [k, v]}
  # #=> [:a, 1]
  # #   [:b, 2]
  # 
  # p({:a=>1, :b=>2}.each_pair)  # => #<Enumerator: {:a=>1, :b=>2}:each_pair>
  # //}
  # 
  # @see [[m:Hash#each_key]],[[m:Hash#each_value]]
  def each; end

  # --- each_key {|key| ... } -> self
  # --- each_key -> Enumerator
  # 
  # ハッシュのキーを引数としてブロックを評価します。
  # 
  # 反復の際の評価順序はキーが追加された順です。
  # ブロック付きの場合selfを、
  # 無しで呼ばれた場合[[c:Enumerator]]を返します。
  # 
  # //emlist[例][ruby]{
  # {:a=>1, :b=>2}.each_key {|k| p k}
  # #=> :a
  # #   :b
  # 
  # p({:a=>1, :b=>2}.each_key)  # => #<Enumerator: {:a=>1, :b=>2}:each_key>
  # //}
  # 
  # @see [[m:Hash#each_pair]],[[m:Hash#each_value]]
  def each_key; end

  # --- each_value {|value| ... } -> self
  # --- each_value -> Enumerator
  # 
  # ハッシュの値を引数としてブロックを評価します。
  # 
  # 反復の際の評価順序はキーが追加された順です。
  # ブロック付きの場合selfを、
  # 無しで呼ばれた場合 [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # {:a=>1, :b=>2}.each_value {|v| p v}
  # #=> 1
  # #   2
  # 
  # p({:a=>1, :b=>2}.each_value)  # => #<Enumerator: {:a=>1, :b=>2}:each_value>
  # //}
  # 
  # @see [[m:Hash#each_pair]],[[m:Hash#each_key]]
  def each_value; end

  # --- empty? -> bool
  # 
  # ハッシュが空の時、真を返します。
  # 
  # //emlist[例][ruby]{
  # puts({}.empty?) #=> true
  # //}
  def empty?; end

  # --- equal?(other) -> bool
  # 
  # 指定された other が self 自身である場合のみ真を返します。
  # 
  # @param other 自身と比較したい Hash オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # p({}.equal?({}))     #=> false
  # a = {}
  # p a.equal?(a)        #=> true
  # //}
  # 
  # @see [[m:Hash#==]]
  def equal?; end

  # --- fetch(key, default = nil) {|key| ... } -> object
  # 
  # key に関連づけられた値を返します。該当するキーが登録されてい
  # ない時には、引数 default が与えられていればその値を、ブロッ
  # クが与えられていればそのブロックを評価した値を返します。
  # 
  # fetchはハッシュ自身にデフォルト値が設定されていても単に無視します（挙動に変化がありません）。
  # 
  # @param key 探索するキーを指定します。
  # @param default 該当するキーが登録されていない時の返り値を指定します。
  # @raise  KeyError   引数defaultもブロックも与えられてない時、キーの探索に失敗すると発生します。
  # 
  # //emlist[例][ruby]{
  # h = {one: nil}
  # p h[:one],h[:two]                        #=> nil,nil これではキーが存在するのか判別できない。
  # p h.fetch(:one)                          #=> nil
  # p h.fetch(:two)                          # エラー key not found (KeyError)
  # p h.fetch(:two,"error")                  #=> "error"
  # p h.fetch(:two){|key|"#{key} not exist"} #=> "two not exist"
  # p h.fetch(:two, "error"){|key|           #=> "two not exist"
  #     "#{key} not exist"                   #  warning: block supersedes default value argument
  #   }                                      #  警告が表示される。
  # 
  # h.default = "default"
  # p h.fetch(:two)                          # エラー key not found (KeyError)
  # //}
  # 
  # @see [[m:Hash#[] ]]
  def fetch; end

  # --- fetch_values(key, ...)               -> [object]
  # --- fetch_values(key, ...) { |key| ... } -> [object]
  # 
  # 引数で指定されたキーに関連づけられた値の配列を返します。
  # 
  # 該当するキーが登録されていない時には、ブロックが与えられていればそのブ
  # ロックを評価した値を返します。ブロックが与えられていない時は
  # [[c:KeyError]] が発生します。
  # 
  # self にデフォルト値が設定されていても無視されます（挙動に変化がありません）。
  # 
  # @param key 探索するキーを任意個指定します。
  # 
  # @raise KeyError ブロックが与えられてない時にキーの探索に失敗すると発生します。
  # 
  # //emlist[例][ruby]{
  # h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
  # 
  # h.fetch_values("cow", "cat")                   # => ["bovine", "feline"]
  # h.fetch_values("cow", "bird")                  # raises KeyError
  # h.fetch_values("cow", "bird") { |k| k.upcase } # => ["bovine", "BIRD"]
  # //}
  # 
  # @see [[m:Hash#values_at]], [[m:Hash#fetch]]
  def fetch_values; end

  # --- select                       -> Enumerator
  # --- select {|key, value| ... }   -> Hash
  # --- filter                       -> Enumerator
  # --- filter {|key, value| ... }   -> Hash
  # 
  # key, value のペアについてブロックを評価し，真となるペアだけを含む
  # ハッシュを生成して返します。
  # 
  # ブロックが与えられなかった場合は、自身と select から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[][ruby]{
  # h = { "a" => 100, "b" => 200, "c" => 300 }
  # h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
  # h.select {|k,v| v < 200}  #=> {"a" => 100}
  # //}
  # 
  # 
  # @see [[m:Hash#select!]], [[m:Hash#reject]]
  def filter; end

  # --- keep_if -> Enumerator
  # --- keep_if {|key, value| ... } -> self
  # --- select! -> Enumerator
  # --- select! {|key, value| ... } -> self | nil
  # --- filter! -> Enumerator
  # --- filter! {|key, value| ... }   -> self | nil
  # 
  # キーと値を引数としてブロックを評価した結果が真であるような要素を self
  # に残します。
  # 
  # keep_if は常に self を返します。
  # filter! と select! はオブジェクトが変更された場合に self を、
  # されていない場合に nil を返します。
  # 
  # ブロックが与えられなかった場合は、自身と keep_if から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # h1 = {}
  # c = ("a".."g")
  # c.each_with_index {|e, i| h1[i] = e }
  # 
  # h2 = h1.dup
  # h1.select!  # => #<Enumerator: {0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g"}:select!>
  # 
  # h1.select! { |k, v| k % 3 == 0 }  # => {0=>"a", 3=>"d", 6=>"g"}
  # h1.select! { |k, v| true }        # => nil
  # h2.keep_if { |k, v| k % 3 == 0 }  # => {0=>"a", 3=>"d", 6=>"g"}
  # h2.keep_if { |k, v| true }        # => {0=>"a", 3=>"d", 6=>"g"}
  # //}
  # 
  # @see [[m:Hash#select]], [[m:Hash#delete_if]], [[m:Hash#reject!]]
  def filter!; end

  # --- flatten(level = 1) -> Array
  # 
  # 自身を平坦化した配列を生成して返します。
  # 
  # 全てのキーと値を新しい配列の要素として展開します。
  # [[m:Array#flatten]] と違って、デフォルトではこのメソッドは自身を
  # 再帰的に平坦化しません。level を指定すると指定されたレベルまで
  # 再帰的に平坦化します。
  # 
  # @param level 展開するレベル
  # 
  # //emlist[例][ruby]{
  # a =  {1=> "one", 2 => [2,"two"], 3 => "three"}
  # a.flatten     #=> [1, "one", 2, [2, "two"], 3, "three"]
  # a.flatten(1)  #=> [1, "one", 2, [2, "two"], 3, "three"]
  # a.flatten(2)  #=> [1, "one", 2, 2, "two", 3, "three"]
  # a.flatten(0)  #=> [[1, "one"], [2, [2, "two"]], [3, "three"]]
  # a.flatten(-1) #=> [1, "one", 2, 2, "two", 3, "three"]
  # //}
  # 
  # @see [[m:Array#flatten]]
  def flatten; end

  # --- has_key?(key) -> bool
  # --- include?(key) -> bool
  # --- key?(key)     -> bool
  # --- member?(key)  -> bool
  # 
  # ハッシュが key をキーとして持つ時真を返します。
  # 
  # @param key 探索するキーを指定します。
  # 
  # //emlist[][ruby]{
  # p({1 => "one"}.key?(1)) # => true
  # p({1 => "one"}.key?(2)) # => false
  # //}
  # 
  # @see [[m:Hash#value?]]
  def has_key?; end

  # --- has_value?(value) -> bool
  # --- value?(value)     -> bool
  # 
  # ハッシュが value を値として持つ時真を返します。
  # 値の一致判定は == で行われます。
  # 
  # @param value 探索する値を指定します。
  # 
  # //emlist[][ruby]{
  # p({1 => "one"}.value?("one")) #=> true
  # p({1 => "one"}.value?("two")) #=> false
  # //}
  # 
  # @see [[m:Hash#key?]]
  def has_value?; end

  # --- hash    -> Integer
  # 
  # 自身が保持するキーと値のハッシュ値を元にして算出した整数を返します。
  # 自身が保持するキーや値が変化すればこのメソッドが返す値も変化します。
  # 
  # //emlist[例][ruby]{
  # a = {}
  # p a.hash     #=> 0
  # a[1] = :x
  # p a.hash     #=> 329543
  # //}
  def hash; end

  # --- key(val) -> object
  # --- index(val) -> object
  # 
  # 値 val に対応するキーを返します。対応する要素が存在しない時には
  # nil を返します。
  # 
  # 該当するキーが複数存在する場合、どのキーを返すかは不定です。
  # 
  # Hash#index は obsolete です。
  # 使用すると警告メッセージが表示されます。
  # 
  # @param val 探索に用いる値を指定します。
  # 
  # //emlist[例][ruby]{
  # h = {:ab => "some" , :cd => "all" , :ef => "all"}
  # 
  # p h.key("some") #=> :ab
  # p h.key("all") #=> :cd
  # p h.key("at") #=> nil
  # //}
  # 
  # @see [[m:Hash#invert]]
  def index; end

  # --- to_s     -> String
  # --- inspect  -> String
  # 
  # ハッシュの内容を人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # h = { "c" => 300, "a" => 100, "d" => 400  }
  # h.inspect   # => "{\"c\"=>300, \"a\"=>100, \"d\"=>400}"
  # //}
  def inspect; end

  # --- invert -> Hash
  # 
  # 値からキーへのハッシュを作成して返します。
  # 
  # 異なるキーに対して等しい値が登録されている場合、最後に定義されている値が使用されます。
  # 
  # //emlist[例][ruby]{
  # h = { "a" => 0, "b" => 100, "c" => 200, "d" => 300, "e" => 300 }
  # p h.invert   #=> {0=>"a", 100=>"b", 200=>"c", 300=>"e"}
  # //}
  # 
  # === 参考
  # 値が重複していたときに備えて、変換後の値を配列として保持するには、次のようにします。
  # 
  # //emlist[][ruby]{
  # def safe_invert(orig_hash)
  #   orig_hash.each_key.group_by do |key|
  #     orig_hash[key]
  #   end
  # end
  # p safe_invert({"a"=>1, "b"=>1, "c"=>3}) # => {1=>["a", "b"], 3=>["c"]}
  # //}
  # 
  # @see [[m:Hash#key]]
  def invert; end

  # --- keys -> [object]
  # 
  # 全キーの配列を返します。
  # 
  # //emlist[例][ruby]{
  # h1 = { "a" => 100, 2 => ["some"], :c => "c" }
  # p h1.keys           #=> ["a", 2, :c]
  # //}
  # 
  # @see [[m:Hash#values]],[[m:Hash#to_a]]
  def keys; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # ハッシュの要素の数を返します。
  # 
  # //emlist[][ruby]{
  # h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }
  # h.length        #=> 4
  # h.size          #=> 4
  # h.delete("a")   #=> 200
  # h.length        #=> 3
  # h.size          #=> 3
  # //}
  def length; end

  # --- merge(*others) -> Hash
  # --- merge(*others) {|key, self_val, other_val| ... } -> Hash
  # 
  # selfとothersのハッシュの内容を順番にマージ(統合)した結果を返します。
  # デフォルト値はselfの設定のままです。
  # 
  # self と others に同じキーがあった場合はブロック付きか否かで
  # 判定方法が違います。ブロック付きのときはブロックを呼び出して
  # その返す値を重複キーに対応する値にします。ブロック付きでない
  # 場合は常に others の値を使います。
  # 
  # othersがハッシュではない場合、othersのメソッドto_hashを使って暗黙の変換を試みます。
  # 
  # @param others マージ用のハッシュまたはメソッド to_hash でハッシュに変換できるオブジェクトです。
  # @return マージした結果を返します
  # 
  # //emlist[][ruby]{
  # h1 = { "a" => 100, "b" => 200 }
  # h2 = { "b" => 246, "c" => 300 }
  # h3 = { "b" => 357, "d" => 400 }
  # h1.merge          #=> {"a"=>100, "b"=>200}
  # h1.merge(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
  # h1.merge(h2, h3)  #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
  # h1.merge(h2) {|key, oldval, newval| newval - oldval}
  #                   #=> {"a"=>100, "b"=>46,  "c"=>300}
  # h1.merge(h2, h3) {|key, oldval, newval| newval - oldval}
  #                   #=> {"a"=>100, "b"=>311, "c"=>300, "d"=>400}
  # h1                #=> {"a"=>100, "b"=>200}
  # //}
  # 
  # //emlist[][ruby]{
  # foo = {1 => 'a', 2 => 'b', 3 => 'c'}
  # bar = {2 => 'B', 3 => 'C', 4 => 'D'}
  # 
  # p foo.merge(bar)
  #        # => {1=>"a", 2=>"B", 3=>"C", 4=>"D"}
  # p foo  # => {1=>"a", 2=>"b", 3=>"c"}
  # 
  # p foo.merge!(bar) {|key, foo_val, bar_val| foo_val + bar_val }
  #        # => {1=>"a", 2=>"bB", 3=>"cC", 4=>"D"}
  # p foo  # => {1=>"a", 2=>"bB", 3=>"cC", 4=>"D"}
  # //}
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_hash
  #     {:Australia => 'Sydney',
  #      :France => 'Paris'
  #      }
  #   end
  # end
  # 
  # h = {:Germany => 'Berlin',
  #      :Australia => 'Canberra',
  #      :France => 'Paris'
  #      }
  # 
  # # 暗黙の変換
  # p h.merge(Foo.new) # => {:Germany=>"Berlin", :Australia=>"Sydney", :France=>"Paris"}
  # //}
  # 
  # @see [[m:Hash#update]],[[m:Hash#replace]]
  def merge; end

  # --- merge!(*others) -> self
  # --- merge!(*others) {|key, self_val, other_val| ... } -> self
  # --- update(*others) -> self
  # --- update(*others) {|key, self_val, other_val| ... } -> self
  # 
  # selfとothersのハッシュの内容を順番にマージ(統合)します。
  # 
  # デフォルト値はselfの設定のままです。
  # 
  # self と others に同じキーがあった場合はブロック付きか否かで
  # 判定方法が違います。ブロック付きのときはブロックを呼び出して
  # その返す値を重複キーに対応する値にします。ブロック付きでない
  # 場合は常に others の値を使います。
  # 
  # othersがハッシュではない場合、othersのメソッドto_hashを使って暗黙の変換を試みます。
  # 
  # @param others マージ用のハッシュまたはメソッド to_hash でハッシュに変換できるオブジェクトです。
  # @return マージ後のselfを返します。
  # 
  # //emlist[][ruby]{
  # h1 = { "a" => 100, "b" => 200 }
  # h1.merge!          #=> {"a"=>100, "b"=>200}
  # h1                 #=> {"a"=>100, "b"=>200}
  # //}
  # 
  # //emlist[][ruby]{
  # h1 = { "a" => 100, "b" => 200 }
  # h2 = { "b" => 246, "c" => 300 }
  # h1.merge!(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
  # h1                 #=> {"a"=>100, "b"=>246, "c"=>300}
  # //}
  # 
  # //emlist[][ruby]{
  # h1 = { "a" => 100, "b" => 200 }
  # h2 = { "b" => 246, "c" => 300 }
  # h3 = { "b" => 357, "d" => 400 }
  # h1.merge!(h2, h3)  #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
  # h1                 #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
  # //}
  # 
  # //emlist[][ruby]{
  # h1 = { "a" => 100, "b" => 200 }
  # h2 = { "b" => 246, "c" => 300 }
  # h3 = { "b" => 357, "d" => 400 }
  # h1.merge!(h2, h3) {|key, v1, v2| v1 }
  #                    #=> {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
  # h1                 #=> {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
  # //}
  # 
  # //emlist[][ruby]{
  # foo = {1 => 'a', 2 => 'b', 3 => 'c'}
  # bar = {2 => 'B', 3 => 'C', 4 => 'D'}
  # 
  # p foo.update(bar) #=> {1=>"a", 2=>"B", 3=>"C", 4=>"D"}
  # p foo  #=> {1=>"a", 2=>"B", 3=>"C", 4=>"D"}
  # 
  # p foo.update(bar) {|key, foo_val, bar_val| foo_val + bar_val } # => {1=>"a", 2=>"BB", 3=>"CC", 4=>"DD"}
  # p foo  # => {1=>"a", 2=>"BB", 3=>"CC", 4=>"DD"}
  # //}
  # 
  # @see [[m:Hash#merge]],[[m:Hash#replace]]
  def merge!; end

  # --- rassoc(value) -> Array | nil
  # 
  # ハッシュ内を検索して，引数 value と 一致する値を探します。
  # 
  # 比較は == メソッドを使用して行われます。一致する値があれば，
  # 該当するキーとその値とを要素とするサイズ 2 の配列を返します。
  # ない場合には nil を返します。
  # 
  # @param value 探索する値。
  # 
  # //emlist[例][ruby]{
  # a = {1=> "one", 2 => "two", 3 => "three", "ii" => "two"}
  # a.rassoc("two")    #=> [2, "two"]
  # a.rassoc("four")   #=> nil
  # //}
  # 
  # @see [[m:Hash#assoc]], [[m:Array#rassoc]]
  def rassoc; end

  # --- rehash -> self
  # 
  # キーのハッシュ値を再計算します。
  # 
  # キーになっているオブジェクトの内容が変化した時など、
  # ハッシュ値が変わってしまった場合はこのメソッドを使ってハッシュ値を再計算しない
  # 限り、そのキーに対応する値を取り出すことができなくなります。
  # 
  # @raise RuntimeError [[m:Hash#each]]などのイテレータの評価途中でrehashすると発生します。
  # @return selfを返します。
  # 
  # //emlist[例][ruby]{
  # a = [ "a", "b" ]
  # h = { a => 100 }
  # 
  # p h[a]       #=> 100
  # 
  # a[0] = "z"
  # p h[a]       #=> nil
  # 
  # h.rehash
  # p h[a]       #=> 100
  # //}
  # 
  # @see [[m:Object#hash]]
  def rehash; end

  # --- reject {|key, value| ... } -> Hash
  # --- reject                     -> Enumerator
  # 
  # self を複製して、ブロックを評価した値が真になる要
  # 素を削除したハッシュを返します。
  # 
  # ハッシュを返すことを除けば
  # [[m:Enumerable#reject]] とほぼ同じです。
  # selfを破壊的に変更したい場合はかわりに[[m:Hash#delete_if]]か[[m:Hash#reject!]]を使います。
  # 
  # //emlist[例][ruby]{
  # h = { 2 =>"8" ,4 =>"6" ,6 =>"4" ,8 =>"2" }
  # 
  # p h.reject{|key, value| key.to_i < value.to_i} #=> {6=>"4", 8=>"2"}
  # //}
  # 
  # @see [[m:Hash#delete_if]],[[m:Hash#delete]],[[m:Enumerable#reject]]
  def reject; end

  # --- replace(other) -> self
  # 
  # ハッシュの内容を other の内容で置き換えます。
  # 
  # デフォルト値の設定もotherの内容になります。
  # otherがハッシュではない場合、otherのメソッドto_hashを使って暗黙の変換を試みます。
  # 
  # self = other.to_hash.dup と同じです。
  # 
  # @param other ハッシュまたはメソッド to_hash でハッシュに変換できるオブジェクトです。
  # @return self を返します。
  # 
  # //emlist[例][ruby]{
  # foo = {1 => 'a', 2 => 'b'}
  # bar = {2 => 'B', 3 => 'C'}
  # 
  # foo.replace(bar)
  # p foo  #=> {2=>"B", 3=>"C"}
  # 
  # zoo = {}
  # zoo = bar.dup
  # p zoo  #=> {2=>"B", 3=>"C"}
  # 
  # class Foo
  #   def to_hash
  #     {:japan => 'kyoto'}
  #   end
  # end
  # 
  # h = Hash.new
  # h.replace(Foo.new) #暗黙の変換
  # p h #=> {:japan=>"kyoto"}
  # //}
  # 
  # @see [[m:Hash#dup]],[[m:Hash#merge]],[[m:Object#to_hash]]
  def replace; end

  # --- shift -> [object, object] | nil
  # 
  # ハッシュからキーが追加された順で先頭の要素をひとつ取り除き、
  # [key, value]という配列として返します。
  # 
  # shiftは破壊的メソッドです。selfは要素を取り除かれた残りのハッシュに変更されます。
  # 
  # ハッシュが空の場合、デフォルト値（[[m:Hash#default]]または[[m:Hash#default_proc]]のブロックの値か、どちらもnilならばnil）
  # を返します(このとき、[key,value] という形式の値を返すわけではないことに注意)。
  # 
  # 将来のバージョン(Ruby 3.2を予定)ではデフォルト値に関わらず nil になる予定なので、デフォルト値を設定しているハッシュで
  # shift を使う場合は注意してください。([[bug:16908]])
  # 
  # //emlist[例][ruby]{
  # h = {:ab => "some" , :cd => "all"}
  # p h.shift               #=> [:ab, "some"]
  # p h.shift               #=> [:cd, "all"]
  # p h                     #=> {}
  # p h.shift               #=> nil
  # 
  # h1 = Hash.new("default value")
  # p h1                    #=> {}
  # p h1.shift              #=> "default value"
  # 
  # h2 = Hash.new {|*arg| arg}
  # p h2                    #=> {}
  # p h2.shift              #=> [{}, nil]
  # //}
  # 
  # @see [[m:Array#shift]]
  def shift; end

  # --- slice(*keys) -> Hash
  # 
  # 引数で指定されたキーとその値だけを含む Hash を返します。
  # 
  # //emlist[例][ruby]{
  # h = { a: 100, b: 200, c: 300 }
  # h.slice(:a)           # => {:a=>100}
  # h.slice(:c, :b)       # => {:c=>300, :b=>200}
  # h.slice(:b, :c, :d)   # => {:b=>200, :c=>300}
  # //}
  # 
  # @see [[m:ENV.slice]]
  def slice; end

  # --- to_a -> [Array]
  # 
  # キーと値からなる 2 要素の配列を並べた配列を生成して返します。
  # 
  # //emlist[例][ruby]{
  # h1 = { "a" => 100, 2 => ["some"], :c => "c" }
  # p h1.to_a           #=> [["a", 100], [2, ["some"]], [:c, "c"]]
  # //}
  # 
  # @see [[m:Hash#keys]],[[m:Hash#values]]
  def to_a; end

  # --- to_h -> self | Hash
  # --- to_h {|key, value| block } -> Hash
  # 
  # self を返します。[[c:Hash]] クラスのサブクラスから呼び出した場合は
  # self を [[c:Hash]] オブジェクトに変換します。
  # 
  # //emlist[例][ruby]{
  # hash = {}
  # p hash.to_h      # => {}
  # p hash.to_h == hash # => true
  # 
  # class MyHash < Hash;end
  # my_hash = MyHash.new
  # p my_hash.to_h        # => {}
  # p my_hash.class       # => MyHash
  # p my_hash.to_h.class  # => Hash
  # //}
  # 
  # ブロックを指定すると各ペアでブロックを呼び出し、
  # その結果をペアとして使います。
  # //emlist[ブロック付きの例][ruby]{
  # hash = { "a" => 97, "b" => 98 }
  # hash.to_h {|key, value| [key.upcase, value-32] } # => {"A"=>65, "B"=>66}
  # //}
  # 
  # @see [[m:Enumerable#map]]
  def to_h; end

  # --- to_hash -> self
  # 
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # hash = {}
  # p hash.to_hash         # => {}
  # p hash.to_hash == hash # => true
  # //}
  # 
  # @see [[m:Object#to_hash]], [[m:Hash#to_h]]
  def to_hash; end

  # --- to_proc -> Proc
  # 
  # self のキーに対応する値を返す [[c:Proc]] オブジェクトを返します。
  # 
  # //emlist[][ruby]{
  # h = {1 => 10, 2 => 20, 3 => 30}
  # [1, 2, 3].map(&h) # => [10, 20, 30]
  # //}
  def to_proc; end

  # --- transform_keys {|key| ... } -> Hash
  # --- transform_keys              -> Enumerator
  # 
  # すべてのキーに対してブロックを呼び出した結果で置き換えたハッシュを返します。
  # 値は変化しません。
  # 
  # 
  # //emlist[例][ruby]{
  # h = { a: 1, b: 2, c: 3 }
  # h.transform_keys {|k| k.to_s }   # => {"a"=>1, "b"=>2, "c"=>3}
  # h.transform_keys(&:to_s)         # => {"a"=>1, "b"=>2, "c"=>3}
  # h.transform_keys.with_index {|k, i| "#{k}.#{i}" }
  #                                  # => {"a.0"=>1, "b.1"=>2, "c.2"=>3}
  # //}
  # 
  # @see [[m:Hash#transform_keys!]]
  # @see [[m:Hash#transform_values]]
  # @see [[m:Hash#transform_values!]]
  def transform_keys; end

  # --- transform_keys! {|key| ... } -> self
  # --- transform_keys!                -> Enumerator
  # 
  # すべての値に対してブロックを呼び出した結果でハッシュのキーを変更します。
  # 値は変化しません。
  # 
  # @return transform_keys! は常に self を返します。
  #         ブロックが与えられなかった場合は、[[c:Enumerator]] オブジェクトを
  #         返します。
  # 
  # 
  # //emlist[例][ruby]{
  # h = { a: 1, b: 2, c: 3 }
  # h.transform_keys! {|k| k.to_s }   # => {"a"=>1, "b"=>2, "c"=>3}
  # h.transform_keys!(&:to_sym)       # => {:a=>1, :b=>2, :c=>3}
  # h.transform_keys!.with_index {|k, i| "#{k}.#{i}" }
  #                                   # => {"a.0"=>1, "b.1"=>2, "c.2"=>3}
  # //}
  # 
  # @see [[m:Hash#transform_keys]]
  # @see [[m:Hash#transform_values]]
  # @see [[m:Hash#transform_values!]]
  def transform_keys!; end

  # --- transform_values {|value| ... } -> Hash
  # --- transform_values                -> Enumerator
  # 
  # すべての値に対してブロックを呼び出した結果で置き換えたハッシュを返します。
  # キーは変化しません。
  # 
  # @return 置き換えたハッシュを返します。
  #         ブロックが与えられなかった場合は、[[c:Enumerator]] オブジェクトを
  #         返します。
  # 
  # //emlist[例][ruby]{
  # h = { a: 1, b: 2, c: 3 }
  # h.transform_values {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
  # h.transform_values(&:to_s)           #=> { a: "1", b: "2", c: "3" }
  # h.transform_values.with_index {|v, i| "#{v}.#{i}" }
  #                                      #=> { a: "1.0", b: "2.1", c: "3.2" }
  # //}
  # 
  # @see [[m:Hash#transform_values!]]
  # @see [[m:Hash#transform_keys]]
  # @see [[m:Hash#transform_keys!]]
  def transform_values; end

  # --- transform_values! {|value| ... } -> self
  # --- transform_values!                -> Enumerator
  # 
  # すべての値に対してブロックを呼び出した結果でハッシュの値を変更します。
  # キーは変化しません。
  # 
  # @return transform_values! は常に self を返します。
  #         ブロックが与えられなかった場合は、[[c:Enumerator]] オブジェクトを
  #         返します。
  # 
  # //emlist[例][ruby]{
  # h = { a: 1, b: 2, c: 3 }
  # h.transform_values! {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
  # h.transform_values!(&:to_s)           #=> { a: "2", b: "5", c: "10" }
  # h.transform_values!.with_index {|v, i| "#{v}.#{i}" }
  #                                       #=> { a: "2.0", b: "5.1", c: "10.2" }
  # //}
  # 
  # @see [[m:Hash#transform_values]]
  # @see [[m:Hash#transform_keys]]
  # @see [[m:Hash#transform_keys!]]
  def transform_values!; end

  # --- values -> [object]
  # 
  # ハッシュの全値の配列を返します。
  # 
  # //emlist[例][ruby]{
  # h1 = { "a" => 100, 2 => ["some"], :c => "c" }
  # p h1.values         #=> [100, ["some"], "c"]
  # //}
  # 
  # @see [[m:Hash#keys]],[[m:Hash#to_a]]
  def values; end

  # --- values_at(*keys) -> [object]
  # 
  # 引数で指定されたキーに対応する値の配列を返します。
  # 
  # キーに対応する要素がなければデフォルト値が使用されます。
  # 
  # @param keys キーを 0 個以上指定します。
  # 
  # @return 引数で指定されたキーに対応する値の配列を返します。
  #         引数が指定されなかった場合は、空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # h = {1=>"a", 2=>"b", 3=>"c"}
  # 
  # p h.values_at(1,3,4)               #=> ["a", "c", nil]
  # # [h[1], h[3] ,h[4]] と同じ
  # //}
  # 
  # @see [[m:Hash#[] ]], [[m:Hash.new]], [[m:Hash#default]], [[m:Hash#default_proc]], [[m:Array#values_at]]
  def values_at; end

  # --- [](other) -> Hash
  # 
  # 新しいハッシュを生成します。
  # 引数otherと同一のキーと値を持つ新たなハッシュを生成して返します。
  # 
  # 引数otherがハッシュではない場合、otherのメソッドto_hashを使って暗黙の変換を試みます。
  # 
  # デフォルト値はコピーしません。生成されたハッシュのデフォルト値は nil です。
  # 
  # 引数otherと生成したハッシュは同じオブジェクトを参照することになるので、
  # 一方でキーや値に破壊的操作を行うともう片方にも影響します。
  # 
  # @param other 生成元となるハッシュまたはメソッド to_hash でハッシュに変換できるオブジェクトです。
  # 
  # //emlist[][ruby]{
  # h = {1 => "value"}
  # h.default = "none"
  # 
  # g = Hash[h]
  # p g #=> {1=>"value"}
  # 
  # p h[:no] #=> "none"
  # p g[:no] #=> nil
  # 
  # h[:add] = "some"
  # p h #=> {1=>"value", :add=>"some"}
  # p g #=> {1=>"value"}
  # 
  # h[1] << 'plus' #破壊的操作
  # p h #=> {1=>"valueplus", :add=>"some"}
  # p g #=> {1=>"valueplus"}
  # //}
  # 
  # --- [](*key_and_value)  -> Hash
  # 
  # 新しいハッシュを生成します。
  # 引数は必ず偶数個指定しなければなりません。奇数番目がキー、偶数番目が値になります。
  # 
  # このメソッドでは生成するハッシュにデフォルト値を指定することはできません。
  # [[m:Hash.new]]を使うか、[[m:Hash#default=]]で後から指定してください。
  # 
  # @param key_and_value 生成するハッシュのキーと値の組です。必ず偶数個(0を含む)指定しなければいけません。
  # @raise ArgumentError 奇数個の引数を与えたときに発生します。
  # 
  # 以下は配列からハッシュを生成する方法の例です。
  # 
  # (1) [キー, 値, ...] の配列からハッシュへ
  # 
  # //emlist[][ruby]{
  # ary = [1,"a", 2,"b", 3,["c"]]
  # p Hash[*ary]  # => {1=>"a", 2=>"b", 3=>["c"]}
  # //}
  # 
  # (2) キーと値のペアの配列からハッシュへ
  # 
  # //emlist[][ruby]{
  # alist = [[1,"a"], [2,"b"], [3,["c"]]]
  # p alist.flatten(1) # => [1, "a", 2, "b", 3, ["c"]]
  # p Hash[*alist.flatten(1)]  # => {1=>"a", 2=>"b", 3=>["c"]}
  # //}
  # 
  # (3) キーと値の配列のペアからハッシュへ
  # 
  # //emlist[][ruby]{
  # keys = [1, 2, 3]
  # vals = ["a", "b", ["c"]]
  # alist = keys.zip(vals)     # あるいは alist = [keys,vals].transpose
  # p alist # => [[1, "a"], [2, "b"], [3, ["c"]]]
  # p Hash[alist]  # => {1=>"a", 2=>"b", 3=>["c"]}
  # //}
  # 
  # (4) キーや値が配列の場合
  # 
  # //emlist[][ruby]{
  # alist = [[1,["a"]], [2,["b"]], [3,["c"]], [[4,5], ["a", "b"]]]
  # hash = Hash[alist] # => {1=>["a"], 2=>["b"], 3=>["c"], [4, 5]=>["a", "b"]}
  # //}
  def []; end

  # --- new(ifnone = nil) -> Hash
  # 
  # 空の新しいハッシュを生成します。ifnone はキーに対
  # 応する値が存在しない時のデフォルト値です。設定したデフォルト値は[[m:Hash#default]]で参照できます。
  # 
  # ifnoneを省略した Hash.new は {} と同じです。
  # 
  # デフォルト値として、毎回同一のオブジェクトifnoneを返します。
  # それにより、一箇所のデフォルト値の変更が他の値のデフォルト値にも影響します。
  # 
  # //emlist[][ruby]{
  # h = Hash.new([])
  # h[0] << 0
  # h[1] << 1
  # p h.default #=> [0, 1]
  # //}
  # 
  # これを避けるには、破壊的でないメソッドで再代入する必要が有ります。
  # また、このようなミスを防ぐためにもifnoneは freeze して破壊的操作を禁止しておくのが無難です。
  # 
  # 
  # @param ifnone キーに対応する値が存在しない時のデフォルト値です。
  # 
  # //emlist[例][ruby]{
  # h = Hash.new([])
  # 
  # p h[1]                  #=> []
  # p h[1].object_id        #=> 6127150
  # p h[1] << "bar"         #=> ["bar"]
  # p h[1]                  #=> ["bar"]
  # 
  # p h[2]                  #=> ["bar"]
  # p h[2].object_id        #=> 6127150
  # 
  # p h                     #=> {}
  # 
  # 
  # h = Hash.new([].freeze)
  # h[0] += [0] #破壊的でないメソッドはOK
  # h[1] << 1
  # # エラー: can't modify frozen Array (FrozenError)
  # //}
  # 
  # --- new {|hash, key| ... } -> Hash
  # 空の新しいハッシュを生成します。ブロックの評価結果がデフォルト値になりま
  # す。設定したデフォルト値は[[m:Hash#default_proc]]で参照できます。
  # 
  # 値が設定されていないハッシュ要素を参照するとその都度ブロックを
  # 実行し、その結果を返します。
  # ブロックにはそのハッシュとハッシュを参照したときのキーが渡されます。
  # 
  # @raise ArgumentError ブロックと通常引数を同時に与えると発生します。
  # 
  # //emlist[例][ruby]{
  # # ブロックではないデフォルト値は全部同一のオブジェクトなので、
  # # 破壊的変更によって他のキーに対応する値も変更されます。
  # h = Hash.new("foo")
  # 
  # p h[1]                  #=> "foo"
  # p h[1].object_id        #=> 6127170
  # p h[1] << "bar"         #=> "foobar"
  # p h[1]                  #=> "foobar"
  # 
  # p h[2]                  #=> "foobar"
  # p h[2].object_id        #=> 6127170
  # 
  # p h                     #=> {}
  # 
  # # ブロックを与えると、対応する値がまだ無いキーが呼び出される度に
  # # ブロックを評価するので、全て別のオブジェクトになります。
  # h = Hash.new {|hash, key| hash[key] = "foo"}
  # 
  # p h[1]                  #=> "foo"
  # p h[1].object_id        #=> 6126900
  # p h[1] << "bar"         #=> "foobar"
  # p h[1]                  #=> "foobar"
  # 
  # p h[2]                  #=> "foo"
  # p h[2].object_id        #=> 6126840
  # 
  # p h                     #=> {1=>"foobar", 2=>"foo"}
  # 
  # # 値が設定されていないときに(fetchのように)例外をあげるようにもできる
  # h = Hash.new {|hash, key|
  #                 raise(IndexError, "hash[#{key}] has no value")
  #              }
  # h[1]
  # # エラー hash[1] has no value (IndexError)
  # //}
  # 
  # @see [[m:Hash#default=]],[[m:Hash#default]],[[m:Hash#default_proc]]
  def new; end

  # --- try_convert(obj) -> Hash | nil
  # 
  # to_hash メソッドを用いて obj をハッシュに変換しようとします。
  # 
  # 何らかの理由で変換できないときには nil を返します。
  # このメソッドは引数がハッシュであるかどうかを調べるために使えます。
  # 
  # //emlist[][ruby]{
  # Hash.try_convert({1=>2})   # => {1=>2}
  # Hash.try_convert("1=>2")   # => nil
  # //}
  def try_convert; end

end
