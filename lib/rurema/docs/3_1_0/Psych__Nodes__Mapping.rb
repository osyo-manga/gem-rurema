class Psych::Nodes::Mapping
  # --- anchor -> String|nil
  # mapping に付加された anchor を返します。
  # 
  # @see [[m:Psych::Nodes::Mapping#anchor=]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def anchor; end

  # --- anchor=(a)
  # mapping に付加する anchor を設定します。
  # 
  # @param a 設定する anchor
  # @see [[m:Psych::Nodes::Mapping#anchor]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def anchor=; end

  # --- implicit -> bool
  # mapping が implicit に開始されたかどうかを真偽値で返します。
  # 
  # @see [[m:Psych::Nodes::Mapping#implicit=]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def implicit; end

  # --- implicit=(bool)
  # mapping が implicit に開始されたかどうかを真偽値で設定します。
  # 
  # @param bool 設定値
  # 
  # @see [[m:Psych::Nodes::Mapping#implicit]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def implicit=; end

  # --- style -> Integer
  # mapping の style を返します。
  # 
  # @see [[m:Psych::Nodes::Mapping#style=]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def style; end

  # --- style=(sty)
  # mapping の style を設定します。
  # 
  # @param sty 設定する style 
  # 
  # @see [[m:Psych::Nodes::Mapping#style]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def style=; end

  # --- tag -> String|nil
  # mapping に付加された tag を返します。
  # 
  # @see [[m:Psych::Nodes::Mapping#tag=]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def tag; end

  # --- tag=(t)
  # mapping に付加する tag を設定します。
  # 
  # @param t 設定する tag
  # @see [[m:Psych::Nodes::Mapping#anchor=]],
  #      [[m:Psych::Nodes::Mapping.new]]
  def tag=; end

  # --- new(anchor=nil, tag=nil, implicit=true, style=BLOCK) -> Psych::Nodes::Mapping
  # 
  # 新たな mapping オブジェクトを生成します。
  # 
  # anchor には mapping に付加されている anchor を文字列で指定します。
  # anchor を付けない場合には nil を指定します。
  # 
  # tag には mapping に付加されている tag を文字列で指定します。
  # tag を付けない場合には nil を指定します。
  # 
  # implicit には mapping が implicit に開始されたかどうかを
  # 真偽値で指定します。
  # 
  # style には YAML ドキュメント上の style を整数で指定します。以下のいずれ
  # かを指定できます。
  #   * [[m:Psych::Nodes::Mapping::ANY]]
  #   * [[m:Psych::Nodes::Mapping::BLOCK]]
  #   * [[m:Psych::Nodes::Mapping::FLOW]]
  # 
  # @param anchor mapping に付加された anchor
  # @param tag mapping に付加された tag
  # @param implicit mapping が implicit に開始されたかどうか
  # @param style YAML ドキュメント上の style
  def new; end

  # --- ANY -> Integer
  # 「任意」のスタイルを意味します。
  # 
  # emitter が適当に style を決めます。
  # 
  # @see [[m:Psych::Nodes::Mapping.new]],
  #      [[m:Psych::Nodes::Mapping#style]],
  #      [[m:Psych::Handler#start_mapping]]
  def ANY; end

  # --- BLOCK -> Integer
  # block style を表します。
  # 
  # @see [[m:Psych::Nodes::Mapping.new]],
  #      [[m:Psych::Nodes::Mapping#style]],
  #      [[m:Psych::Handler#start_mapping]]
  def BLOCK; end

  # --- FLOW -> Integer
  # flow style を表します。
  # 
  # @see [[m:Psych::Nodes::Mapping.new]],
  #      [[m:Psych::Nodes::Mapping#style]],
  #      [[m:Psych::Handler#start_mapping]]
  def FLOW; end

end
