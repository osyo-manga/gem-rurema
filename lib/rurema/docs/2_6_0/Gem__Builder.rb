class Gem::Builder
  # --- build -> String
  # 
  # スペックから Gem を作成する。
  # 
  # @return 作成したファイル名を返します。
  def build; end

  # --- success -> String
  # 
  # Gem の作成に成功したときに表示するメッセージを返します。
  def success; end

  # --- new(spec) -> Gem::Builder
  # 
  # 与えられた [[c:Gem::Specification]] のインスタンスによって
  # [[c:Gem::Builder]] のインスタンスを生成します。
  # 
  # @param spec [[c:Gem::Specification]] のインスタンスを指定します。
  def new; end

end
