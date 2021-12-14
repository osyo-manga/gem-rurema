class Gem::Commands::BuildCommand
  # --- arguments -> String
  # 
  # 引数の説明を表す文字列を返します。
  def arguments; end

  # --- execute -> ()
  # 
  # コマンドを実行します。
  def execute; end

  # --- load_gemspecs(filename) -> Array
  # 
  # gemspec ファイルをロードします。
  # 
  # @param filename ファイル名を指定します。
  def load_gemspecs; end

  # --- usage -> String
  # 
  # 使用方法を表す文字列を返します。
  def usage; end

  # --- yaml?(filename) -> bool
  # 
  # 与えられたファイル名を持つファイルが yaml ファイルである場合に真を返します。
  # 
  # @param filename ファイル名を指定します。
  def yaml?; end

end
