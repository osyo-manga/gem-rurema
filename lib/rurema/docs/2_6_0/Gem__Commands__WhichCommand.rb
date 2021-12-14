class Gem::Commands::WhichCommand
  # --- find_paths(package_name, dirs) -> Array
  # 
  # dirs から package_name という名前を持つファイルを探索します。
  # 
  # 以下の拡張子を持つファイルが対象です。
  # 
  #   %w[.rb .rbw .so .dll .bundle]
  # 
  # @param package_name ファイルの名前を指定します。
  # 
  # @param dirs 探索するディレクトリを文字列の配列で指定します。
  def find_paths; end

  # --- gem_paths(spec) -> Array
  # 
  # 与えられた [[c:Gem::Specification]] のインスタンスからその Gem が
  # require するファイルのあるディレクトリをまとめて返します。
  # 
  # @param spec [[c:Gem::Specification]] のインスタンスを指定します。
  def gem_paths; end

  # --- EXT -> [String]
  # 
  # 拡張子を表す配列です。
  # 
  #   %w[.rb .rbw .so .dll .bundle]
  def EXT; end

end
