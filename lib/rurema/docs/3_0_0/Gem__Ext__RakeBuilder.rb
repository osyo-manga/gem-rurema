class Gem::Ext::RakeBuilder
  # --- build(extension, directory, dest_path, results) -> Array
  # @todo
  # 
  # mkrf_conf が存在する場合は、それを実行してから Rake を実行します。
  # 
  # @param extension ファイル名を指定します。
  # 
  # @param directory このメソッドでは使用していません。
  # 
  # @param dest_path ???
  # 
  # @param results コマンドの実行結果を格納します。破壊的に変更されます。
  # 
  # @see [[m:Gem::Ext::Builder.make]]
  def build; end

end
