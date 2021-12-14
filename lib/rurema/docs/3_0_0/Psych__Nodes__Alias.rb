class Psych::Nodes::Alias
  # --- anchor -> String
  # alias が指す先の anchor を返します。
  # 
  # @see [[m:Psych::Nodes::Alias#anchor=]],
  #      [[m:Psych::Nodes::Alias.new]]
  def anchor; end

  # --- anchor=(val)
  # alias が指す先の anchor を変更します。
  # 
  # @param val 設定する anchor 
  # @see [[m:Psych::Nodes::Alias#anchor]],
  #      [[m:Psych::Nodes::Alias.new]]
  def anchor=; end

  # --- new(anchor) -> Psych::Nodes::Alias
  # 新たな Alias オブジェクトを生成します。
  # 
  # anchor で指す先の anchor を指定します。
  # 
  # @param anchor 指す先の anchor
  def new; end

end
