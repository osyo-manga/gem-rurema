class Gem::Platform
  # --- ==(other) -> bool
  # 
  # 自身と other が同じプラットフォームである場合に真を返します。
  # そうでない場合は偽を返します。
  # 
  # 同じプラットフォームであるとは、二つのプラットフォームの
  # CPU, OS, バージョンが同じであるということです。
  # 
  # @param other 比較対象のオブジェクトです。
  def ==; end

  # --- ===(other) -> bool
  # 
  # 自身と other のプラットフォームが一致する場合に真を返します。
  # そうでない場合は、偽を返します。
  # 
  # プラットフォームが一致するとは、以下の条件を満たすことです。
  # 
  #   * 同じ CPU であること、または、どちらか一方が 'universal' であること
  #   * 同じ OS であること
  #   * 同じバージョンであること、または、どちらか一方がバージョンを持たないこと
  # 
  # @param other 比較対象のオブジェクトです。
  def ===; end

  # --- =~(other) -> bool
  # 
  # 自身と other のプラットフォームが一致する場合に真を返します。
  # そうでない場合は、偽を返します。
  # 
  # other が文字列の場合は、まず [[c:Gem::Platform]] に変換してから比較を行います。
  # other が文字列でも [[c:Gem::Platform]] でもない場合は nil を返します。
  # 
  # @param other 比較対象のオブジェクトです。
  # 
  # @see [[m:Gem::Platform#===]]
  def =~; end

  # --- cpu -> String
  # 
  # CPU のアーキテクチャを返します。
  def cpu; end

  # --- cpu=(cpu)
  # 
  # CPU のアーキテクチャをセットします。
  # 
  # @param cpu CPU のアーキテクチャを指定します。
  def cpu=; end

  # --- os -> String
  # 
  # OS の種類を返します。
  def os; end

  # --- os=(os)
  # 
  # OS の種類をセットします。
  # 
  # @param os OS の種類を指定します。
  def os=; end

  # --- to_a -> Array
  # 
  # 自身にセットされている CPU, OS, バージョンを配列として返します。
  def to_a; end

  # --- to_s -> String
  # 
  # 自身にセットされている CPU, OS, バージョンを文字列として返します。
  def to_s; end

  # --- version -> String
  # 
  # プラットフォームのバージョンを返します。
  def version; end

  # --- version=(version)
  # 
  # プラットフォームのバージョンをセットします。
  # 
  # @param version プラットフォームのバージョンを指定します。
  def version=; end

  # --- local -> Gem::Platform
  # @todo ???
  def local; end

  # --- match(platform) -> bool
  # @todo ???
  def match; end

  # --- new(arch)-> Gem::Platform
  # 
  # 自身を初期化します。
  # 
  # @param arch アーキテクチャを指定します。
  def new; end

  # --- CURRENT -> String
  # 
  # 特定のプラットフォーム向けの Gem をビルドするときに使用します。
  def CURRENT; end

  # --- RUBY -> String
  # 
  # Pure Ruby の Gem はバイナリファイルをビルドするために [[m:Gem::Specification#extensions]]
  # を使用する可能性があります。
  def RUBY; end

end
