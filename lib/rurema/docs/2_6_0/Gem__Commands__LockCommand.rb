class Gem::Commands::LockCommand
  # --- complain(message) -> ()
  # 
  # 指定されたメッセージを表示します。--strict が有効な場合は例外が発生します。
  # 
  # @param message 表示するメッセージを指定します。
  # 
  # @raise Gem::Exception コマンドラインオプションに --strict が指定されている場合に発生します。
  def complain; end

  # --- spec_path(gem_full_name) -> String
  # 
  # 指定された Gem パッケージの gemspec ファイルのフルパスを返します。
  # 
  # @param gem_full_name Gem パッケージの名前を指定します。
  def spec_path; end

end
