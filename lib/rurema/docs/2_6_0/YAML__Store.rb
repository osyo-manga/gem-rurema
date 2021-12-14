class YAML::Store
  # --- new(file_name, yaml_opts = {})                      -> YAML::Store
  # --- new(file_name, thread_safe = false, yaml_opts = {}) -> YAML::Store
  # 
  # 自身を初期化します。
  # 
  # @param file_name 格納先のファイル名。ファイルがない場合は作成します。既
  #                  にファイルが存在する場合はその内容を読み込みます。
  # 
  # @param thread_safe 自身をスレッドセーフにして初期化するかどうか。
  # 
  # @param yaml_opts YAML 出力時のオプションを [[c:Hash]] で指定します。
  #                  詳しくは [[m:Psych.dump]] を参照してください。
  def new; end

end
