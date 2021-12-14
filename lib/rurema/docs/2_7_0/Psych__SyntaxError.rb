class Psych::SyntaxError
  # --- column -> Integer
  # エラーが生じた行内の位置を返します。
  def column; end

  # --- context -> String
  # エラーが生じたコンテキストを文字列で返します。
  def context; end

  # --- file -> String|nil
  # エラーが生じたファイルの名前を返します。
  # 
  # [[m:Psych.load_file]] で指定したファイルの名前や
  # [[m:Psych.load]] の第2引数で指定した名前が返されます。
  # パース時にファイル名を指定しなかった場合は nil が返されます。
  def file; end

  # --- line -> Integer
  # エラーが生じた行番号を返します。
  def line; end

  # --- offset -> Integer
  # エラーが生じた位置の offset をバイト数で
  # 返します。
  # 
  # offset とは、
  # [[m:Psych::SyntaxError#line]], [[m:Psych::SyntaxError#column]] 
  # で指示される位置からの相対位置です。
  # この位置から 0 バイトの位置でエラーが発生することが多いため、
  # このメソッドはしばしば 0 を返します。
  def offset; end

  # --- problem -> String
  # 生じたエラーの中身を文字列で返します。
  def problem; end

end
