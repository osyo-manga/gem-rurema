class Gem::Commands::UpdateCommand
  # --- do_rubygems_update(version)
  # 
  # RubyGems 自体を更新します。
  def do_rubygems_update; end

  # --- which_to_update(highest_installed_gems, gem_names) -> Array
  # 
  # 更新が必要な Gem のリストを返します。
  def which_to_update; end

end
