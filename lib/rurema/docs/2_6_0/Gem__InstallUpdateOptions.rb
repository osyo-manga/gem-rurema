module Gem::InstallUpdateOptions
  # --- add_install_update_options
  # 
  # インストールとアップデートに関するオプションを追加します。
  def add_install_update_options; end

  # --- install_update_defaults_str -> String
  # 
  # Gem コマンドの install サブコマンドに渡されるデフォルトのオプションを返します。
  # 
  # デフォルトのオプションは以下の通りです。
  #   --rdoc --no-force --no-test --wrappers
  def install_update_defaults_str; end

end
