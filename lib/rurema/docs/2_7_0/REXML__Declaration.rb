class REXML::Declaration
  # --- to_s -> String
  # ノードを文字列化します。
  def to_s; end

  # --- write(output, indent) -> ()
  # output にノードを出力します。
  # 
  # このメソッドは deprecated です。[[c:REXML::Formatter]] で
  # 出力してください。
  # 
  # @param output 出力先の IO オブジェクト
  # @param indent インデントの大きさ。無視されます。
  def write; end

end
