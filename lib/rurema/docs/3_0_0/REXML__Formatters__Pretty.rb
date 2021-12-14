class REXML::Formatters::Pretty
  # --- compact -> bool
  # 出力をコンパクトにするかどうかを返します。
  # 
  # これが真の場合、出力の空白をできる限り削除しようとします。
  # 
  # デフォルト値は false です。
  # 
  # @see [[m:REXML::Formatters::Pretty#compact=]]
  def compact; end

  # --- compact=(c)
  # 出力をコンパクトにするかどうかを設定します。
  # 
  # @param c コンパクトな出力をするかどうかを指定します。
  # @see [[m:REXML::Formatters::Pretty#compact]]
  def compact=; end

  # --- width -> Integer
  # 出力のページ幅を返します。
  # 
  # デフォルトは80です。
  # 
  # @see [[m:REXML::Formatters::Pretty#width=]]
  def width; end

  # --- width=(w)
  # 出力のページ幅を設定します。
  # 
  # @param w ページ幅の設定値
  # @see [[m:REXML::Formatters::Pretty#width]]
  def width=; end

  # --- new(indentation=2, ie_hack=false) -> REXML::Formatter::Pretty
  # フォーマッタオブジェクトを生成して返します。
  # 
  # このフォーマッタによる出力はテキストの空白や改行を調整し、
  # 適切なインデントを挿入して読みやすいXMLを出力します。
  # 
  # indentation でインデント幅を(空白の数で)指定します。
  # 
  # ie_hack に真を渡すと、空のタグを閉じる前で空白を挿入します。
  # これは特定のバージョンのIEのXMLパーサのバグを避けるための機能です。
  # 
  # @param indentation 出力のインデント幅
  # @param ie_hack 空のタグを閉じる所にスペースを入れるかどうか
  def new; end

end
