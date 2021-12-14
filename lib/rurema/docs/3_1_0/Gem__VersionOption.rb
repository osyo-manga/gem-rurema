module Gem::VersionOption
  # --- add_platform_option(task = command, *wrap)
  # 
  # option parser に対して --platform オプションを追加します。
  # 
  # @param task コマンド名を指定します。デフォルト値はインクルードされる側のクラスで指定されます。
  # 
  # @param wrap [[m:Gem::Command#add_option]] に渡すその他のオプションを指定します。
  def add_platform_option; end

  # --- add_version_option(task = command, *wrap)
  # 
  # option parser に対して --version オプションを追加します。
  # 
  # @param task コマンド名を指定します。デフォルト値はインクルードされる側のクラスで指定されます。
  # 
  # @param wrap [[m:Gem::Command#add_option]] に渡すその他のオプションを指定します。
  def add_version_option; end

end
