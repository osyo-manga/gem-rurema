class OpenStruct
  # --- ==(other) -> bool
  # 
  # 自身と比較対象のオブジェクトが等しい場合に真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param other 比較対象のオブジェクトを指定します。
  def ==; end

  # --- [](name) -> object
  # 
  # 引数 name で指定した要素に対応する値を返します。
  # 
  # @param name 要素の名前を文字列か [[c:Symbol]] オブジェクトで指定します。
  # 
  # 例:
  # 
  #   require 'ostruct'
  #   person = OpenStruct.new('name' => 'John Smith', 'age' => 70)
  #   person[:age] # => 70, person.age と同じ
  def []; end

  # --- []=(name, value)
  # 
  # 引数 name で指定した要素に対応する値に value をセットします。
  # 
  # @param name 要素の名前を文字列か [[c:Symbol]] オブジェクトで指定します。
  # 
  # @param value セットする値を指定します。
  # 
  # 例:
  # 
  #   require 'ostruct'
  #   person = OpenStruct.new('name' => 'John Smith', 'age' => 70)
  #   person[:age] = 42 # person.age = 42 と同じ
  #   person.age # => 42
  def []=; end

  # --- delete_field(name) -> object
  # 
  # nameで指定された要素を削除します。
  # 
  # その後その要素を参照したら nil が返ります。
  # 
  # @param name 削除する要素を文字列かシンボルで指定します。
  # @return 削除前の要素の値を返します。
  def delete_field; end

  # --- dig(key, ...) -> object | nil
  # 
  # self 以下のネストしたオブジェクトを dig メソッドで再帰的に参照して返し
  # ます。途中のオブジェクトが nil であった場合は nil を返します。
  # 
  # @param key キーを任意個指定します。
  # 
  #   require 'ostruct'
  #   address = OpenStruct.new('city' => "Anytown NC", 'zip' => 12345)
  #   person = OpenStruct.new('name' => 'John Smith', 'address' => address)
  #   person.dig(:address, 'zip')          # => 12345
  #   person.dig(:business_address, 'zip') # => nil
  # 
  # @see [[m:Array#dig]], [[m:Hash#dig]], [[m:Struct#dig]]
  def dig; end

  # --- each_pair                  -> Enumerator
  # --- each_pair { |key, value| } -> self
  # 
  # self の各要素の名前と要素を引数としてブロックを評価します。
  # 
  # ブロックを指定した場合は self を返します。そうでない場合は
  # [[c:Enumerator]] を返します。
  # 
  # 例:
  # 
  #   require 'ostruct'
  #   data = OpenStruct.new("country" => "Australia", :population => 20_000_000)
  #   data.each_pair.to_a  # => [[:country, "Australia"], [:population, 20000000]]
  def each_pair; end

  # --- eql?(other) -> bool
  # 
  # self と other が等しい場合に true を返します。そうでない場合は false を
  # 返します。
  # 
  # 具体的には other が [[c:OpenStruct]] オブジェクトかそのサブクラスでかつ、
  # self の各要素を保持した内部の [[c:Hash]] が eql? で比較して等しい場合に
  # true を返します。
  # 
  # @param other 比較対象のオブジェクトを指定します。
  def eql?; end

  # --- hash -> Integer
  # 
  # self のハッシュ値を返します。
  def hash; end

  # --- inspect -> String
  # --- to_s -> String
  # 
  # オブジェクトを人間が読める形式に変換した文字列を返します。
  # 
  # @see [[m:Object#inspect]]
  def inspect; end

  # --- modifiable -> Hash
  # 
  # このメソッドは内部的に使用されます。
  # 
  # 自身が [[m:Object#freeze]] されている場合にこのメソッドを呼び出すと例外が発生します。
  # 
  # @raise TypeError 自身が [[m:Object#freeze]] されている場合に発生します。
  def modifiable; end

  # --- new_ostruct_member(name) -> Symbol
  # 
  # 与えられた名前のアクセサメソッドを自身に定義します。
  # 
  # @param name 文字列かシンボルで定義するアクセサの名前を指定します。
  def new_ostruct_member; end

  # --- to_h -> { Symbol => object }
  # --- to_h {|name, value| block } -> Hash
  # 
  # self を各要素の名前をキー([[c:Symbol]])、要素が値のハッシュに変換して返
  # します。
  # 
  # ブロックを指定すると各ペアでブロックを呼び出し、
  # その結果をペアとして使います。
  # 
  # //emlist[例][ruby]{
  # require 'ostruct'
  # data = OpenStruct.new("country" => "Australia", :capital => "Canberra")
  # data.to_h   # => {:country => "Australia", :capital => "Canberra" }
  # data.to_h {|name, value| [name.to_s, value.upcase] }
  #             # => {"country" => "AUSTRALIA", "capital" => "CANBERRA" }
  # //}
  def to_h; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数はそのまま [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] に渡されます。
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- json_create(hash) -> OpenStruct
  # 
  # JSON のオブジェクトから [[c:OpenStruct]] のオブジェクトを生成して返します。
  # 
  # @param hash [[m:OpenStruct.new]] に指定可能な値をキー 't' もしくは :t に持つハッシュを指定します。
  def json_create; end

  # --- new(hash = nil) -> OpenStruct
  # 
  # OpenStruct オブジェクトを生成します。
  # 
  # ハッシュが与えられたとき、それぞれのキーを生成したオブジェクトの要素にし、値をセットします。
  # 
  # @param hash 設定する要素とその値を指定します。
  #        hash には [[c:Hash]] クラスのインスタンス、または each_pair メソッ
  #        ドを持つオブジェクトを用いる事ができます。
  # @raise NoMethodError hash のキーが to_sym メソッドを持たないときに発生します。
  # 
  #   require 'ostruct'
  #   some1 = OpenStruct.new({:a =>"a",:b =>"b"}) # => #<OpenStruct b="b", a="a">
  def new; end

  # --- InspectKey -> :__inspect_key__
  # 
  # 内部的に使用する定数です。
  def InspectKey; end

end
