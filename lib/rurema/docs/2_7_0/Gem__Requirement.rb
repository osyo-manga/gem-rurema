class Gem::Requirement
  # --- satisfied_by?(version) -> bool
  # --- ===(version) -> bool
  # --- =~(version) -> bool
  # 
  # 引数 version が自身に含まれる全ての必要条件を満たす場合に true を返します。
  # そうでなければ、false を返します。
  # 
  # @param version [[c:Gem::Version]] のインスタンスを指定します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new("~> 3.2.1")
  # 
  # p req.satisfied_by?(Gem::Version.new('3.2.9'))  # => true
  # p req.satisfied_by?(Gem::Version.new('3.3.0'))  # => false
  # //}
  def ===; end

  # --- as_list -> [String]
  # 
  # 必要条件を文字列の配列で返します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new("< 5.0", ">= 1.9")
  # p req.as_list  # => ["< 5.0", ">= 1.9"]
  # //}
  def as_list; end

  # --- concat(requirements) -> Array
  # 
  # 新しい条件(配列)を自身の条件に破壊的に加えます。
  # 
  # @param requirements 条件の配列を指定します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new("< 5.0")
  # req.concat(["= 1.9"])
  # puts req  # => < 5.0, = 1.9
  # //}
  def concat; end

  # --- exact? -> bool
  # 
  # 条件がちょうどのバージョンが指定されている場合は、true を返します。
  # 
  # //emlist[][ruby]{
  # p Gem::Requirement.new("= 3").exact?          # => true
  # p Gem::Requirement.new("= 3", "= 3").exact?   # => true
  # p Gem::Requirement.new("= 3", "= 5").exact?   # => false
  # p Gem::Requirement.new("= 3", ">= 3").exact?  # => false
  # p Gem::Requirement.new(">= 3").exact?         # => false
  # //}
  def exact?; end

  # --- none? -> bool
  # 
  # 自身が条件を持たない場合は、true を返します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new(">= 0")
  # p req.none?  # => true
  # //}
  def none?; end

  # --- prerelease? -> bool
  # 
  # 何らかのバージョンがプレリリースのものであれば、true を返します。
  # 
  # //emlist[][ruby]{
  # p Gem::Requirement.new("< 5.0").prerelease?   # => false
  # p Gem::Requirement.new("< 5.0a").prerelease?  # => true
  # //}
  def prerelease?; end

  # --- pretty_print(pp) -> String
  # 
  # わかりやすい形で、条件を表す文字列を返します。
  # pp メソッドで出力する際に、内部で用いられます。
  # 
  # @param PP [[c::PP]] オブジェクトを指定します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new(["< 5.0", ">= 1.9"])
  # pp req # => Gem::Requirement.new(["< 5.0", ">= 1.9"])
  # //}
  def pretty_print; end

  # --- specific? -> bool
  # 
  # 条件に上限のある指定で、最新のバージョンにマッチしない可能性のある場合は、true を返します。
  # 
  # //emlist[][ruby]{
  # p Gem::Requirement.new(">= 3").specific?  # => false
  # p Gem::Requirement.new("~> 3").specific?  # => true
  # p Gem::Requirement.new("=  3").specific?  # => true
  # //}
  def specific?; end

  # --- to_s -> String
  # 
  # 条件を表す文字列を返します。
  # 
  # //emlist[][ruby]{
  # req = Gem::Requirement.new(["< 5.0", ">= 1.9"])
  # p req.to_s # => "< 5.0, >= 1.9"
  # //}
  def to_s; end

  # --- create(input) -> Gem::Requirement
  # 
  # [[c:Gem::Requirement]] のインスタンスを作成するためのファクトリメソッドです。
  # 
  # @param input 文字列か配列か [[c:Gem::Requirement]], [[c:Gem::Version]] のインスタンス
  #              のいずれかを指定します。
  # 
  # @return 上記以外の値を input に指定するとデフォルト値を返します。
  # 
  # //emlist[][ruby]{
  # pp Gem::Requirement.create("~> 3.2.1")
  # # => Gem::Requirement.new(["~> 3.2.1"])
  # //}
  # 
  # @see [[m:Gem::Requirement.new]], [[m:Gem::Requirement.default]]
  def create; end

  # --- default -> Gem::Requirement
  # 
  # ゼロ以上 ( '>= 0' ) を指定して作成された [[c:Gem::Requirement]] のインスタンスを返します。
  # 
  # //emlist[][ruby]{
  # pp Gem::Requirement.default
  # # => Gem::Requirement.new([">= 0"])
  # //}
  def default; end

  # --- new(requirements) -> Gem::Requirement
  # 
  # [[c:Gem::Requirement]] のインスタンスを作成します。
  # 
  # @param requirements 文字列か配列か [[c:Gem::Version]] のインスタンスを指定します。
  # 
  # //emlist[][ruby]{
  # pp Gem::Requirement.new("~> 3.2.1")
  # # => Gem::Requirement.new(["~> 3.2.1"])
  # //}
  # 
  # @see [[m:Gem::Requirement#parse]], [[m:Gem::Requirement.create]]
  def new; end

  # --- parse(obj) -> Array
  # 
  # バージョンの必要上件をパースして比較演算子とバージョンを要素とする二要素の配列を返します。
  # 
  # @param obj 必要上件を表す文字列または [[c:Gem::Version]] のインスタンスを指定します。
  # @return 比較演算子と [[c:Gem::Version]] のインスタンスを要素とする二要素の配列を返します。
  # @raise ArgumentError obj に不正なオブジェクトを指定すると発生します。
  # 
  # //emlist[][ruby]{
  # p Gem::Requirement.parse("~> 3.2.1") # => ["~>", #<Gem::Version "3.2.1">]
  # //}
  def parse; end

  # --- OPS -> Hash
  # 
  # 比較演算子と対応する処理を格納したハッシュです。次の内容と等価です。
  # 
  # //emlist[][ruby]{
  # OPS = { #:nodoc:
  #   "="  =>  lambda {|v, r| v == r },
  #   "!=" =>  lambda {|v, r| v != r },
  #   ">"  =>  lambda {|v, r| v >  r },
  #   "<"  =>  lambda {|v, r| v <  r },
  #   ">=" =>  lambda {|v, r| v >= r },
  #   "<=" =>  lambda {|v, r| v <= r },
  #   "~>" =>  lambda {|v, r| v >= r && v.release < r.bump },
  # }.freeze
  # //}
  # 
  # 次のように、[[c:Gem::Version]] どうしを比較します。
  # 
  # //emlist[][ruby]{
  # p Gem::Requirement::OPS["="].call(Gem::Version.new('3.1'), Gem::Version.new('3.0'))   # => false
  # p Gem::Requirement::OPS["~>"].call(Gem::Version.new('3.1'), Gem::Version.new('3.0'))  # => true
  # //}
  def OPS; end

end
