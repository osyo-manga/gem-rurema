class ENV
  # --- [](key) -> String
  # 
  # key に対応する環境変数の値を返します。該当する環境変数が存在
  # しない時には nil を返します。
  # 
  # @param key 環境変数名を指定します。文字列で指定します。文字列以外のオブ
  #            ジェクトを指定した場合は to_str メソッドによる暗黙の型変換
  #            を試みます。
  # 
  # //emlist[][ruby]{
  # ENV['PATH']           # => "/usr/local/bin:/usr/bin:/bin:/usr/X11/bin"
  # ENV['NON_EXIST_KEY']  # => nil
  # //}
  def []; end

  # --- []=(key, value)
  # --- store(key, value) -> String
  # 
  # key に対応する環境変数の値を value にします。
  # value が nil の時、key に対応する環境変数を取り除きます。
  # 
  # @param key   環境変数名を指定します。文字列で指定します。文字列以外のオ
  #              ブジェクトを指定した場合は to_str メソッドによる暗黙の型変
  #              換を試みます。
  # @param value 置き換えるべき値を指定します。文字列で指定します。文字列以
  #              外のオブジェクトを指定した場合は to_str メソッドによる暗黙
  #              の型変換を試みます。
  # 
  # @return value を返します。
  # 
  # //emlist[][ruby]{
  # ENV['NEW_KEY'] = 'some_value'
  # ENV['NEW_KEY'] # => 'some_value'
  # ENV.store('NEW_KEY', nil) # => nil
  # ENV.has_key?('NEW_KEY') # => false
  # //}
  def []=; end

  # --- assoc(key) -> Array | nil
  # 
  # 自身が与えられたキーに対応する要素を持つとき、見つかった要素のキーと値のペアを
  # 配列として返します。
  # 
  # @param key 検索するキーを指定します。
  # 
  # @see [[m:Hash#assoc]]
  def assoc; end

  # --- clear  -> self
  # 
  # 環境変数をすべてクリアします。self を返します。
  # 
  # //emlist[][ruby]{
  # ENV.clear
  # p ENV # => {}
  # //}
  def clear; end

  # --- clone(freeze: true) -> object
  # ENV オブジェクトの複製を作成して返します。
  # 
  # ENV は OS のプロセス全体で共有される環境変数を操作するラッパーオブジェクトなので、複製は有用ではありません。
  # そのため、3.1 からは複製で環境変数を操作するときに deprecated 警告がでます。
  # 
  # テスト実行中に環境変数を退避する用途には [[m:ENV.to_h]] を使用してください。
  # 
  # //emlist[][ruby]{
  # saved_env = ENV.to_h
  # # (テストなど)
  # ENV.replace(saved_env)
  # //}
  # 
  # @see [[m:Object#clone]]
  def clone; end

  # --- delete(key) -> String | nil
  # --- delete(key) {|key| ... } -> String | nil
  # 
  # key に対応する環境変数を取り除きます。取り除かれた環境変数の
  # 値を返しますが、key に対応する環境変数が存在しない時には
  # nil を返します。
  # 
  # ブロックが与えられた時には key にマッチするものがなかった時
  # に評価されます。
  # 
  # @param key 環境変数名を指定します。文字列で指定します。文字列で指定しま
  #            す。文字列以外のオブジェクトを指定した場合は to_str メソッド
  #            による暗黙の型変換を試みます。
  # 
  # //emlist[][ruby]{
  # ENV['TEST'] = 'foo'
  # ENV.delete('TEST')  # => "foo"
  # ENV.delete('TEST') { |key| puts "#{key} is not found in ENV" } # TEST is not found in ENV
  # //}
  def delete; end

  # --- delete_if {|key, value| ... } -> ENV
  # --- reject! {|key, value| ... }   -> ENV | nil
  # --- delete_if  -> Enumerator
  # --- reject!    -> Enumerator
  # 
  # key と value を引数としてブロックを評価した値が真であ
  # る時、環境変数を削除します。
  # 
  # reject! は要素に変化がなければ nil を返します。
  # 
  # //emlist[][ruby]{
  # ENV['FOO'] = 'bar'
  # ENV.delete_if { |key, value| key == 'FOO' && value == 'bar' } # => ENV
  # ENV.reject! { |key, value| key == 'FOO' && value == 'bar' } # => nil
  # //}
  def delete_if; end

  # --- each                          -> Enumerator
  # --- each_pair                     -> Enumerator
  # --- each {|key, value| ... }      -> self
  # --- each_pair {|key, value| ... } -> self
  # key と value を引数としてブロックを評価します。
  # 
  # //emlist[][ruby]{
  # ENV['FOO'] = 'bar'
  # ENV.each do |key, value|
  #   p "value is #{value}" if key == 'FOO' # => "value is bar"
  # end
  # # => ENV
  # //}
  def each; end

  # --- each_key              -> Enumerator
  # --- each_key {|key| ... } -> self
  # key を引数としてブロックを評価します。
  # 
  # //emlist[][ruby]{
  # ENV['FOO'] = 'bar'
  # ENV.each_key do |key|
  #   p "key #{key} detected" if key == 'FOO'
  # end
  # # "key FOO detected"
  # //}
  def each_key; end

  # --- each_value                -> Enumerator
  # --- each_value {|value| ... } -> self
  # value を引数としてブロックを評価します。
  def each_value; end

  # --- empty? -> bool
  # 
  # 環境変数がひとつも定義されていない時真を返します。
  def empty?; end

  # --- except(*keys) -> Hash
  # 
  # 引数で指定された以外のキーとその値だけを含む Hash を返します。
  # 
  # //emlist[][ruby]{
  # ENV                       #=> {"LANG"=>"en_US.UTF-8", "TERM"=>"xterm-256color", "HOME"=>"/Users/rhc"}
  # ENV.except("TERM","HOME") #=> {"LANG"=>"en_US.UTF-8"}
  # //}
  # 
  # @see [[m:Hash#except]], [[m:ENV.slice]]
  def except; end

  # --- fetch(key) -> String
  # --- fetch(key, default) -> String
  # --- fetch(key) {|key| ... } -> String
  # 
  # key に関連づけられた値を返します。該当するキーが登録されてい
  # ない時には、引数 default が与えられていればその値を、ブロッ
  # クが与えられていればそのブロックを評価した値を返します。そのいずれ
  # でもなければ例外が発生します。
  # 
  # @param key       環境変数の名前を指定します。 文字列で指定します。文字列
  #                  で指定します。文字列以外のオブジェクトを指定した場合は
  #                  to_str メソッドによる暗黙の型変換を試みます。
  # @param default   keyに対応する環境変数の値がないときにこの値を返します。 
  # @raise  KeyError   引数defaultもブロックも与えられてない時、キーの探索に失敗すると発生します。
  def fetch; end

  # --- select                      -> Enumerator
  # --- select {|key, value| ... }  -> Hash
  # --- filter                      -> Enumerator
  # --- filter {|key, value| ... }  -> Hash
  # 
  # 環境変数名と値についてブロックを評価し、真を返したものを集めたハッシュ
  # を返します。
  def filter; end

  # --- keep_if {|key, value| ... } -> ENV
  # --- select! {|key, value| ... } -> ENV | nil
  # --- filter! {|key, value| ... } -> ENV | nil
  # --- keep_if -> Enumerator
  # --- select! -> Enumerator
  # --- filter! -> Enumerator
  # 
  # キーと値を引数としてブロックを評価した結果が真であ
  # るような要素を環境変数に残します。
  # 
  # keep_if は常に self を返します。
  # select! と filter! はオブジェクトが変更された場合に self を、
  # されていない場合に nil を返します。
  # 
  # ブロックが省略された場合には [[c:Enumerator]] を返します。
  # 
  # @see [[m:ENV.delete_if]],[[m:ENV.reject!]], [[m:Hash#keep_if]], [[m:Hash#select!]],
  def filter!; end

  # --- freeze -> ()
  # ENV.freeze は環境変数の変更を禁止できないため、[[c:TypeError]]を発生させます。
  def freeze; end

  # --- has_key?(key) -> bool
  # --- include?(key) -> bool
  # --- key?(key)     -> bool
  # --- member?(key)  -> bool
  # 
  # key で指定される環境変数が存在する時、真を返します。
  # 
  # @param key 環境変数の名前を指定します。文字列で指定します。文字列で指定
  #            します。文字列以外のオブジェクトを指定した場合は to_str メソッ
  #            ドによる暗黙の型変換を試みます。
  def has_key?; end

  # --- has_value?(val) -> bool
  # --- value?(val)     -> bool
  # 
  # val を値として持つ環境変数が存在する時、真を返します。
  # 
  # @param val 値を指定します。文字列で指定します。文字
  #            列以外のオブジェクトを指定した場合は to_str メソッドによる暗
  #            黙の型変換を試みます。
  def has_value?; end

  # --- inspect -> String
  # 
  # ENV オブジェクトを文字列化します。 [[m:Hash#inspect]] と同じように動作します。
  def inspect; end

  # --- invert -> Hash
  # 
  # 環境変数の値をキー、名前を値とした [[c:Hash]] を生成して返します。
  def invert; end

  # --- key(val)   -> String | nil
  # 
  # val に対応するキーを返します。対応する要素が存在しない時には
  # nil を返します。
  # 
  # 
  # @param val 値を指定します。文字列で指定します。文字
  #            列以外のオブジェクトを指定した場合は to_str メソッドによる暗
  #            黙の型変換を試みます。
  def key; end

  # --- keys -> [String]
  # 
  # 全環境変数の名前の配列を返します。
  def keys; end

  # --- length -> Integer
  # --- size   -> Integer
  # 
  # 環境変数の数を返します。
  def length; end

  # --- rassoc(value) -> Array | nil
  # 
  # 自身が与えられた値に対応する要素を持つとき、見つかった要素のキーと値のペアを
  # 配列として返します。
  # 
  # @param value 検索する値を指定します。
  # 
  # @see [[m:Hash#rassoc]]
  def rassoc; end

  # --- rehash -> nil
  # 
  # 何もしません。nilを返します。
  def rehash; end

  # --- reject                     -> Enumerator
  # --- reject {|key, value| ... } -> Hash
  # 
  # 環境変数のうち、ブロックを評価した値が真であるものをとり除きます。
  # [[m:Enumerable#reject]] と異なり Hash を返します。また、とり除いた結果
  # は実際の環境変数に影響を与えません。
  # 
  # //emlist[][ruby]{
  # ENV['TEST'] = 'foo'
  # result = ENV.reject { |key, value| key == 'TEST' }
  # result['TEST'] # => nil
  # ENV['TEST'] # => "foo"
  # //}
  def reject; end

  # --- replace(hash) -> ENV
  # 
  # 環境変数を hash と同じ内容に変更します。 self を返します。
  # 
  # @param hash  キーと値の対応関係を指定します。 to_hash でハッシュに変換されます。
  def replace; end

  # --- shift -> [String, String]
  # 
  # 環境変数を一つ取り除いて、それを名前と値の組の配列で返します。
  # 環境変数が一つも設定されていなければ nil を返します。
  def shift; end

  # --- slice(*keys) -> Hash
  # 
  # 引数で指定されたキーとその値だけを含む Hash を返します。
  # 
  # //emlist[例][ruby]{
  # ENV["foo"] = "bar"
  # ENV["baz"] = "qux"
  # ENV["bar"] = "rab"
  # ENV.slice()             # => {}
  # ENV.slice("")           # => {}
  # ENV.slice("unknown")    # => {}
  # ENV.slice("foo", "baz") # => {"foo"=>"bar", "baz"=>"qux"}
  # //}
  # 
  # @see [[m:Hash#slice]], [[m:ENV.except]]
  def slice; end

  # --- to_a -> [[String, String]]
  # 
  # 環境変数から [変数名, 値] となる 2 要素の配列の配列を生成します。
  def to_a; end

  # --- to_h -> Hash
  # --- to_h {|name, value| block } -> Hash
  # 
  # 環境変数の名前をキーとし、対応する値をもつハッシュを返します。
  # 
  # ブロックを指定すると各ペアでブロックを呼び出し、
  # その結果をペアとして使います。
  # //emlist[ブロック付きの例][ruby]{
  # ENV.to_h {|name, value| [name, value.size] }
  # //}
  def to_h; end

  # --- to_hash -> Hash
  # 
  # 環境変数の名前をキーとし、対応する値をもつハッシュを返します。
  def to_hash; end

  # --- to_s -> String
  # 
  # 環境変数を文字列化します。 Hash#to_s と同じように動作します。
  def to_s; end

  # --- update(other) -> ENV
  # 
  # ハッシュ other の内容を環境変数にマージします。重複するキー
  # に対応する値は other の内容で上書きされます。
  # 
  # self を返します。
  # 
  # @param other  上書きするハッシュを指定します。
  def update; end

  # --- values -> [String]
  # 
  # 環境変数の全値の配列を返します。
  def values; end

  # --- values_at(*key) -> [String]
  # 
  # 引数で指定されたキー(環境変数名)に対応する値の配列を返します。存在
  # しないキーに対しては nil が対応します。
  # 
  # 例:
  # 
  #   ENV.update({'FOO' => 'foo', 'BAR' => 'bar'})
  #   p ENV.values_at(*%w(FOO BAR BAZ))   # => ["foo", "bar", nil]
  # 
  # @param key 環境変数名を指定します。文字列で指定します。
  #            文字列以外のオブジェクトを指定した場合は to_str メソッドによる暗黙の型変換を試みます。
  #            
  def values_at; end

end
