class Rake::DefaultLoader
  # --- load(filename)
  # 
  # 与えられたファイルをロードします。
  # 
  # @param filename ロードするファイル名を指定します。
  # 
  # //emlist[][ruby]{
  # require 'rake'
  # 
  # loader = Rake::DefaultLoader.new
  # loader.load("path/to/Rakefile") # => true
  # //}
  def load; end

end
