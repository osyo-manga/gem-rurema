class REXML::Formatters::Default
  # --- write(node, output) -> ()
  # XML のノード node を output に出力します。
  # 
  # node には任意のXMLノードを指定できます。
  # 
  # @param node 出力するノード
  # @param output 出力先(IO など << で出力できるオブジェクト)
  def write; end

  # --- new(ie_hack=false) -> REXML::Formatter::Default
  # フォーマッタオブジェクトを生成して返します。
  # 
  # このフォーマッタによる出力は基本的にテキストの空白や改行を変化させません。
  # 
  # ie_hack に真を渡すと、空のタグを閉じる前で空白を挿入します。
  # これは特定のバージョンのIEのXMLパーサのバグを避けるための機能です。
  # 
  # @param ie_hack 空のタグを閉じる所にスペースを入れるかどうかを指定します
  def new; end

end
