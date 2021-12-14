class REXML::ExternalEntity
  # --- to_s -> String
  # 宣言を文字列化します。
  def to_s; end

  # --- write(output, indent) -> ()
  # output へ self を文字列化して出力します。
  # 
  # このメソッドは deprecated です。[[c:REXML::Formatter]] で
  # 出力してください。
  # 
  # @param output 出力先の IO オブジェクト
  # @param indent インデントの大きさ。無視されます。
  def write; end

  # --- new(src) -> REXML::ExternalEntity
  # 新たな ExternalEntity オブジェクトを生成します。
  # 
  # @param src 宣言文字列
  def new; end

end
