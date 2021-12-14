class Gem::Version
  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self と other を比較して、self が小さい時に -1、
  # 等しい時に 0、大きい時に 1 の整数を返します。
  # また、other が Gem::Version ではなく比較できないとき、 nil を返します。
  # 
  # //emlist[][ruby]{
  # p Gem::Version.new("3.9.0") <=>  Gem::Version.new("3.10.0") # => -1
  # p Gem::Version.new("3.0.0") <=>  Gem::Version.new("3.0.0")  # =>  0
  # p Gem::Version.new("3.0.0") <=>  Gem::Version.new("3.0")    # =>  0
  # 
  # p Gem::Version.new("3.9.0") <=> "3.9.0" # => nil
  # //}
  # 
  # @param other 比較対象の [[c:Gem::Version]] のインスタンスを指定します。
  def <=>; end

  # --- bump -> Gem::Version
  # 
  # 最後の一桁を切り上げた新しい [[c:Gem::Version]] のインスタンスを返します。
  # 
  # ただし、英字のプレリリースの部分は、無視されます。
  # 
  # //emlist[][ruby]{
  # p Gem::Version.new('5.3.1').bump     # => #<Gem::Version "5.4">
  # p Gem::Version.new('5.3.1.a.1').bump # => #<Gem::Version "5.4">
  # p Gem::Version.new('5.3.1.3.1').bump # => #<Gem::Version "5.3.1.4">
  # //}
  def bump; end

  # --- eql?(other) -> bool
  # 
  # self と other の [[m:Gem::Version#version]] のバージョンが等しいとき true を返します。
  # そうでなければ false を返します。
  # 
  # Comparable を include して作られた == と異なり、"1.0" と "1" は異なるものと判定します。
  # 
  # //emlist[][ruby]{
  # ver0 = Gem::Version.create('1.0')   # #<Gem::Version "1.0">
  # ver1 = Gem::Version.create('1.0')   # #<Gem::Version "1.0">
  # ver2 = Gem::Version.create('1')     # #<Gem::Version "1">
  # 
  # p ver0.eql?(ver1)     # => true
  # p ver1.eql?(ver2)     # => false
  # p ver1 == ver2        # => true
  # //}
  def eql?; end

  # --- marshal_dump -> Array
  # 
  # 完全なオブジェクトではなく、バージョン文字列のみダンプします。
  # 
  # //emlist[][ruby]{
  # p Gem::Version.new('1.2.0a').marshal_dump  # => ["1.2.0a"]
  # //}
  def marshal_dump; end

  # --- marshal_load(array) -> nil
  # 
  # ダンプされた情報をロードし、自身を破壊的に変更します。
  # 
  # //emlist[][ruby]{
  # version = Gem::Version.new('')
  # version.marshal_load(["1.2.0a"])
  # p version # => #<Gem::Version "1.2.0a">
  # //}
  # 
  # @param array バージョン情報を含む配列を指定します。
  def marshal_load; end

  # --- prerelease? -> bool
  # 
  # self がプレリリースと思われる文字を含むバージョンかどうかを返します。
  # 
  # //emlist[例][ruby]{
  # Gem::Version.new('1.2.0a').prerelease? # => true
  # Gem::Version.new('1.2.0').prerelease?  # => false
  # //}
  # 
  # @see [[m:Gem::Version#release]]
  def prerelease?; end

  # --- release -> Gem::Version
  # 
  # self をリリースバージョンにした [[c:Gem::Version]] オブジェクトを返します。
  # 
  # プレリリースではないバージョンであれば self を返します。
  # 
  # //emlist[例][ruby]{
  # Gem::Version.new('1.2.0a').release # => #<Gem::Version "1.2.0">
  # Gem::Version.new('1.2.0').release  # => #<Gem::Version "1.2.0">
  # //}
  # 
  # @see [[m:Gem::Version#prerelease?]]
  def release; end

  # --- version -> String
  # --- to_s -> String
  # 
  # バージョン情報を文字列として返します。
  # 
  # //emlist[][ruby]{
  # version = Gem::Version.new("1.2.3a")
  # p version.to_s     # => "1.2.3a"
  # p version.version  # => "1.2.3a"
  # //}
  def to_s; end

  # --- correct?(version) -> bool
  # 
  # version が正しいバージョンであれば true を返します。そうでなければ false を返します。
  # 
  # //emlist[][ruby]{
  # p Gem::Version.correct?("9.1")       # => true
  # p Gem::Version.correct?("incorrect") # => false
  # 
  # p Gem::Version.correct?(nil)         # => true
  # # nil versions are discouraged and will be deprecated in Rubygems 4
  # # version が nil のときは true を返しますが、推奨はされず、Ruby 2.6以降では警告がでます。
  # //}
  # 
  # @param version バージョンを文字列か数値で指定します。
  def correct?; end

  # --- create(input) -> Gem::Version | nil
  # 
  # [[c:Gem::Version]] のインスタンスを作成するためのファクトリメソッドです。
  # 
  # //emlist[][ruby]{
  # ver1 = Gem::Version.create('1.3.17')   # => #<Gem::Version "1.3.17">
  # ver2 = Gem::Version.create(ver1)       # => #<Gem::Version "1.3.17">
  # ver3 = Gem::Version.create(nil)        # => nil
  # //}
  # 
  # @param input [[c:Gem::Version]] のインスタンスか文字列を指定します。
  # 
  # @raise ArgumentError input がバージョンとして不正なオブジェクトである場合に発生します。
  # 
  # @see [[m:Gem::Version.correct?]]
  def create; end

  # --- new(version) -> Gem::Version
  # 
  # バージョンを表す文字列から、Gem::Version インスタンスを作成します。
  # 
  # 引数のバージョンを表す文字列とは、 数字かASCII文字の連続であり、ドットで区切られたものです。
  # 
  # //emlist[][ruby]{
  # p Gem::Version.new('1.2.0a') # => #<Gem::Version "1.2.0a">
  # 
  # # Ruby 2.4.1より、空白文字以外の文字がない場合、バージョンは "0" になります。
  # p Gem::Version.new(' ') #=> #<Gem::Version "0">
  # //}
  # 
  # @param version
  # @raise ArgumentError input がバージョンとして不正なオブジェクトである場合に発生します。
  #                      これは Gem::Version.correct? により、判定されます。
  def new; end

  # --- Requirement -> Class
  # 
  # [[c:Gem::Requirement]] のエイリアスです。
  # 
  # //emlist[][ruby]{
  # p Gem::Version::Requirement == Gem::Requirement  # => true
  # //}
  def Requirement; end

end
