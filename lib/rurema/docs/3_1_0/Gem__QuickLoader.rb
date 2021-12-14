module Gem::QuickLoader
  # --- calculate_integers_for_gem_version
  # 
  # prelude.c で定義されている内部用のメソッドです。
  def calculate_integers_for_gem_version; end

  # --- const_missing
  # 
  # prelude.c で定義されている内部用のメソッドです。
  def const_missing; end

  # --- method_missing
  # 
  # prelude.c で定義されている内部用のメソッドです。
  def method_missing; end

  # --- push_all_highest_version_gems_on_load_path
  # 
  # prelude.c で定義されている内部用のメソッドです。
  def push_all_highest_version_gems_on_load_path; end

  # --- push_gem_version_on_load_path
  # 
  # prelude.c で定義されている内部用のメソッドです。
  def push_gem_version_on_load_path; end

  # --- load_full_rubygems_library
  # prelude.c で定義されている内部用のメソッドです。
  def load_full_rubygems_library; end

  # --- GemPaths -> Hash
  # 
  # prelude.c で定義されている内部用の定数です。
  def GemPaths; end

  # --- GemVersions -> Hash
  # 
  # prelude.c で定義されている内部用の定数です。
  def GemVersions; end

end
