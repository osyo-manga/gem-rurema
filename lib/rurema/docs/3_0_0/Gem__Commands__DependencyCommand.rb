class Gem::Commands::DependencyCommand
  # --- arguments -> String
  # 
  # 引数の説明を表す文字列を返します。
  def arguments; end

  # --- execute -> ()
  # 
  # コマンドを実行します。
  def execute; end

  # --- find_gems(name, source_index) -> Hash
  # 
  # 与えられた Gem の名前をインデックスから検索します。
  # 
  # @param name Gem の名前を指定します。
  # 
  # @param source_index [[c:Gem::SourceIndex]] のインスタンスを指定します。
  # 
  # @see [[m:Gem::SourceIndex#search]]
  def find_gems; end

  # --- find_reverse_dependencies(spec) -> Array
  # 
  # 与えられた Gem スペックに依存する Gem のリストを返します。
  # 
  # @param spec [[c:Gem::Specification]] のインスタンスを指定します。
  def find_reverse_dependencies; end

  # --- print_dependencies(spec, level = 0) -> String
  # 
  # 依存関係を表す文字列を返します。
  # 
  # @param spec [[c:Gem::Specification]] のインスタンスを指定します。
  # 
  # @param level 依存関係の深さを指定します。
  def print_dependencies; end

  # --- usage -> String
  # 
  # 使用方法を表す文字列を返します。
  def usage; end

end
