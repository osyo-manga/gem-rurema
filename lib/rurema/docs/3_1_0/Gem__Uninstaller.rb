class Gem::Uninstaller
  # --- ask_if_ok(spec) -> bool
  # 
  # アンインストール指定された Gem を削除すると依存関係を満たせなくなる場合に呼び出されます。
  # 
  # @param spec アンインストール指定されている Gem の [[c:Gem::Specification]] を指定します。
  def ask_if_ok; end

  # --- bin_dir -> String
  # 
  # Gem でインストールされたコマンドのあるディレクトリを返します。
  def bin_dir; end

  # --- dependencies_ok?(spec) -> bool
  # 
  # アンインストール指定された Gem を削除しても依存関係を満たすことができるか
  # どうかチェックします。
  # 
  # @param spec アンインストール指定されている Gem の [[c:Gem::Specification]] を指定します。
  def dependencies_ok?; end

  # --- gem_home -> String
  # 
  # Gem がインストールされているディレクトリを返します。
  def gem_home; end

  # --- path_ok?(spec) -> bool
  # 
  # アンインストール指定されている Gem がインストールされているパスをチェックします。
  # 
  # @param spec [[c:Gem::Specification]] を指定します。
  def path_ok?; end

  # --- remove(spec, list)
  # 
  # 指定された Gem を削除します。
  # 
  # @param spec アンインストール指定されている Gem の [[c:Gem::Specification]] を指定します。
  # 
  # @param list アンインストールする Gem のリストを指定します。
  #             このパラメータは破壊的に変更されます。
  # 
  # @raise Gem::DependencyRemovalException アンインストール指定された Gem を削除すると
  #                                        依存関係が壊れる場合に発生します。
  # 
  # @raise Gem::GemNotInHomeException アンインストール指定された Gem が所定の
  #                                   ディレクトリにそんないしない場合に発生します。
  def remove; end

  # --- remove_all(list)
  # 
  # list で与えられた Gem を全てアンインストールします。
  # 
  # @param list アンインストールする Gem のリストを指定します。
  def remove_all; end

  # --- remove_executables(gemspec)
  # 
  # 与えられた [[c:Gem::Specification]] に対応する実行ファイルを削除します。
  # 
  # @param gemspec アンインストール指定されている Gem の [[c:Gem::Specification]] を指定します。
  def remove_executables; end

  # --- spec -> Gem::Specification
  # 
  # [[m:Gem::Uninstaller#uninstall_gem]] の実行中のみセットされます。
  def spec; end

  # --- uninstall
  # 
  # Gem をアンインストールします。
  # 
  # スペックファイルやキャッシュも削除します。
  def uninstall; end

  # --- uninstall_gem(spec, specs)
  # 
  # 与えられた spec に対応する Gem をアンインストールします。
  # 
  # @param spec アンインストール指定されている Gem の [[c:Gem::Specification]] を指定します。
  # 
  # @param specs アンインストールする Gem のリストを指定します。
  #              このパラメータは破壊的に変更されます。
  def uninstall_gem; end

  # --- new(gem, options = {})
  # 
  # 自身を初期化します。
  # 
  # @param gem アンインストールする Gem を指定します。
  # 
  # @param options オプションを指定します。
  def new; end

end
