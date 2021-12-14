module ERB::DefMethod
  # --- def_erb_method(methodname, erb) -> nil
  # 
  # self に erb のスクリプトをメソッドとして定義します。
  # 
  # メソッド名は methodname で指定します。
  # erb が文字列の時、そのファイルを読み込み ERB で変換したのち、メソッドとして定義します。
  # 
  # @param methodname メソッド名
  # 
  # @param erb ERBインスタンスもしくはERBソースファイル名
  # 
  # 例:
  # 
  #   require 'erb'
  #   class Writer
  #     extend ERB::DefMethod
  #     def_erb_method('to_html', 'writer.erb')
  #     ...
  #   end
  #   ...
  #   puts writer.to_html
  def def_erb_method; end

end
