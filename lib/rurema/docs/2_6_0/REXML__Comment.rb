class REXML::Comment
  # --- <=>(other) -> -1 | 0 | 1
  # other と内容([[m:REXML::Comment#string]])を比較します。
  def <=>; end

  # --- ==(other) -> bool
  # other と内容([[m:REXML::Comment#string]])が同じならば真を返します。
  def ==; end

  # --- clone -> REXML::Comment
  # 
  # 内容が複製された Comment オブジェクトを返します。
  # (親ノードの情報は複製されません)。
  def clone; end

  # --- node_type -> Symbol
  # シンボル :comment を返します。
  def node_type; end

  # --- string -> String
  # --- to_s -> String
  # 
  # コメント文字列を返します。
  def string; end

  # --- string=(value)
  # コメント文字列を設定します。
  # 
  # @param value 設定する文字列
  def string=; end

  # --- new(string, parent = nil) -> REXML::Comment
  # --- new(comment, parent = nil) -> REXML::Comment
  # 
  # Comment オブジェクトを生成します。
  # 
  # 引数に REXML::Comment オブジェクトを渡すとその内容が複製されます
  # (親ノードの情報は複製されません)。
  # 
  # @param string コメント文字列
  # @param comment REXML::Comment オブジェクト
  # @param parent 親ノード
  def new; end

end
