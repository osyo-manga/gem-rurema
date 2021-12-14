class Zlib::GzipFile::Error
  # --- input -> String | nil
  # 
  # 読み込んだ文字列(gzip 形式で圧縮されたもの)を返します。
  def input; end

  # --- inspect -> String
  # 
  # self の情報を人間に読みやすい文字列にして返します。
  def inspect; end

end
