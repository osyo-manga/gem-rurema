class Psych::ScalarScanner
  # --- parse_time(string) -> Time
  # 文字列を Time オブジェクトに変換します。
  # 
  # @param string 変換文字列
  def parse_time; end

  # --- tokenize(string) -> object
  # YAML の scalar である文字列を Ruby のオブジェクトに変換した
  # ものを返します。
  # 
  #   scanner = Psych::ScalarScanner.new
  #   p scanner.tokenize("yes") # => true
  #   p scanner.tokenize("year") # => "year"
  #   p scanner.tokenize("12") # =>  12
  # 
  # @param string 変換文字列
  def tokenize; end

  # --- new
  # 新たな ScalarScanner オブジェクトを生成します。
  def new; end

end
