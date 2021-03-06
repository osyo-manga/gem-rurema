class IRB::MagicFile
  # --- ENCODING_SPEC_RE -> %r"coding\s*[=:]\s*([[:alnum:]\-_]+)"
  # 
  # マジックコメントにマッチする正規表現を返します。
  def ENCODING_SPEC_RE; end

  # --- open(path) -> File
  # --- open(path) { |io| ... } -> object
  # 
  # 引数 path で指定したファイルを開いて、ファイル中のマジックコメントをエ
  # ンコーディングに設定します。
  # 
  # ブロックを指定した場合はブロックの実行結果を返します。ブロックを指定し
  # なかった場合はエンコーディングが設定された [[c:File]] オブジェクトを返
  # します。
  # 
  # @param path パスを文字列で指定します。
  def open; end

end
