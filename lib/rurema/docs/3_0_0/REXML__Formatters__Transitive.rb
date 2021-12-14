class REXML::Formatters::Transitive
  # --- new(indentation=2, ie_hack=false) -> REXML::Formatter::Transitive
  # フォーマッタオブジェクトを生成して返します。
  # 
  # このフォーマッタによる出力は基本的にテキストの空白や改行を変化させないと
  # いう制約のもと、出力を整形します。
  # 
  # indentation でインデント幅を指定できます。
  # 
  # ie_hack に真を渡すと、空のタグを閉じる前で空白を挿入します。
  # これは特定のバージョンのIEのXMLパーサのバグを避けるための機能です。
  # 
  # @param indentation インデント幅
  # @param ie_hack 空のタグを閉じる所にスペースを入れるかどうかを指定します
  def new; end

end
