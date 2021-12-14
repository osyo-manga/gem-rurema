class Rake::GemPackageTask
  # --- define
  # 
  # タスクを定義します。
  # 
  # [[m:GemPackageTask.new]] にブロックが与えられている場合に、自動的に呼び出されます。
  def define; end

  # --- gem_file -> String
  # 
  # Gem パッケージの名前を返します。
  def gem_file; end

  # --- gem_spec -> Gem::Specification
  # 
  # package ターゲットで使用する gemspec を返します。
  # 
  # gemspec にはパッケージ名、バージョン、パッケージに含まれるファイルなどが定義
  # されているので、それらを明示的に指定する必要はありません。
  def gem_spec; end

  # --- gem_spec=(gem_spec)
  # 
  # gemspec をセットします。
  # 
  # @param gem_spec [[c:Gem::Specification]] のインスタンスを指定します。
  def gem_spec=; end

  # --- init(gem_spec)
  # 
  # 自身の各属性に初期値をセットします。
  def init; end

  # --- new(gem_spec){|t| ... } -> Rake::GemPackageTask
  # 
  # 自身を初期化してタスクを定義します。
  # 
  # ブロックが与えられた場合は、自身をブロックパラメータとして
  # ブロックを評価します。
  # 
  # @param gem_spec [[c:Gem::Specification]] のインスタンスを指定します。
  def new; end

end
