class Gem::Ext::ConfigureBuilder
  # --- build(extension, directory, dest_path, results) -> Array
  # @todo
  # 
  # Makefile が存在しない場合は、configure スクリプトを実行して
  # Makefile を作成してから make を実行します。
  # 
  # @param extension このメソッドでは使用しません。
  # 
  # @param directory
  # 
  # @param dest_path 
  # 
  # @param results コマンドの実行結果を格納します。破壊的に変更されます。
  # 
  # @see [[m:Gem::Ext::Builder.make]]
  def build; end

end
