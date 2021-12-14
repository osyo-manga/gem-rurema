class Rake::TaskArguments
  # --- [](key) -> object
  # 
  # 与えられたパラメータ名に対応する値を返します。
  # 
  # @param key パラメータの名前を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   arguments["name1"] # => "value1"
  #   arguments["name2"] # => "value2"
  # end
  # //}
  def []; end

  # --- each{|key, val| ... } -> Hash
  # 
  # 自身に含まれるパラメータ名とそれに対応する値をブロックパラメータとしてブロックを評価します。
  # 
  # 
  # @see [[m:Hash#each]]
  def each; end

  # --- inspect -> String
  # --- to_s -> String
  # 
  # 自身を人間に読みやすい文字列にして返します。
  # 
  # 
  # @see [[m:Hash#inspect]]
  def inspect; end

  # --- lookup(name) -> object
  # 
  # 与えられた名前に対応する値を返します。
  # 
  # @param name パラメータ名を指定します。
  def lookup; end

  # --- names -> Array
  # 
  # パラメータ名のリストを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   arguments.names # => ["name1", "name2"]
  # end
  # //}
  def names; end

  # --- new_scope(names) -> Rake::TaskArguments
  # 
  # 与えられたパラメータ名のリストを使用して新しい [[c:Rake::TaskArguments]] を作成します。
  # 
  # @param names パラメータ名のリストを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   new_arguments = arguments.new_scope(["name3", "name4"])
  #   p new_arguments         # => #<Rake::TaskArguments >
  #   p new_arguments.names   # => ["name3", "name4"]
  # end
  # //}
  def new_scope; end

  # --- to_hash -> Hash
  # 
  # パラメータ名と対応する値を格納したハッシュを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   arguments.to_hash # => {:name1=>"value1", :name2=>"value2"}
  # end
  # //}
  def to_hash; end

  # --- with_defaults(defaults) -> Hash
  # 
  # パラメータにデフォルト値をセットします。
  # 
  # @param defaults デフォルト値として使用するキーと値を格納したハッシュを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   arguments.to_hash                                        # => {:name1=>"value1", :name2=>"value2"}
  #   arguments.with_defaults({ default_key: "default_value"}) # => {:default_key=>"default_value", :name1=>"value1", :name2=>"value2"}
  #   arguments.to_hash                                        # => {:default_key=>"default_value", :name1=>"value1", :name2=>"value2"}
  # end
  # //}
  def with_defaults; end

  # --- new(names, values, parent = nil)
  # 
  # 自身を初期化します。
  # 
  # @param names パラメータの名前のリストを指定します。
  # 
  # @param values パラメータの値のリストを指定します。
  # 
  # @param parent 親となる [[c:Rake::TaskArguments]] を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   arguments1 = Rake::TaskArguments.new(["name1", "name2"], ["value1", "value2"])
  #   arguments2 = Rake::TaskArguments.new(["name3", "name4"], ["value3", "value4"], arguments1)
  #   p arguments1 # => #<Rake::TaskArguments name1: value1, name2: value2>
  #   p arguments2 # => #<Rake::TaskArguments name3: value3, name4: value4>
  #   p arguments2["name1"] # => "value1"
  #   p arguments2["name3"] # => "value3"
  # end
  # //}
  def new; end

end
