class Psych::Nodes::Sequence
  # --- anchor -> String|nil
  # sequence に付加された anchor を返します。
  # 
  # @see [[m:Psych::Nodes::Sequence#anchor=]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def anchor; end

  # --- anchor=(a)
  # sequence に付加する anchor を設定します。
  # 
  # @param a 設定する anchor
  # @see [[m:Psych::Nodes::Sequence#anchor]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def anchor=; end

  # --- implicit -> bool
  # sequence が implicit に開始されたかどうかを真偽値で返します。
  # 
  # @see [[m:Psych::Nodes::Sequence#implicit=]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def implicit; end

  # --- implicit=(bool)
  # sequence が implicit に開始されたかどうかを真偽値で設定します。
  # 
  # @param bool 設定値
  # 
  # @see [[m:Psych::Nodes::Sequence#implicit]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def implicit=; end

  # --- style -> Integer
  # sequence の style を返します。
  # 
  # @see [[m:Psych::Nodes::Sequence#style=]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def style; end

  # --- style=(sty)
  # sequence の style を設定します。
  # 
  # @param sty 設定する style 
  # 
  # @see [[m:Psych::Nodes::Sequence#style]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def style=; end

  # --- tag -> String|nil
  # sequence に付加された tag を返します。
  # 
  # @see [[m:Psych::Nodes::Sequence#tag=]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def tag; end

  # --- tag=(t)
  # sequence に付加する tag を設定します。
  # 
  # @param t 設定する tag
  # @see [[m:Psych::Nodes::Sequence#anchor=]],
  #      [[m:Psych::Nodes::Sequence.new]]
  def tag=; end

  # --- new(anchor=nil, tag=nil, implicit=true, style=BLOCK) -> Psych::Nodes::Sequence
  # 
  # 新たな sequence オブジェクトを生成します。
  # 
  # anchor には sequence に付加されている anchor を文字列で指定します。
  # anchor を付けない場合には nil を指定します。
  # 
  # tag には sequence に付加されている tag を文字列で指定します。
  # tag を付けない場合には nil を指定します。
  # 
  # implicit には sequence が implicit に開始されたかどうかを
  # 真偽値で指定します。
  # 
  # style には YAML ドキュメント上の style を整数で指定します。以下のいずれ
  # かを指定できます。
  #   * [[m:Psych::Nodes::Sequence::ANY]]
  #   * [[m:Psych::Nodes::Sequence::BLOCK]]
  #   * [[m:Psych::Nodes::Sequence::FLOW]]
  # 
  # @param anchor sequence に付加された anchor
  # @param tag sequence に付加された tag
  # @param implicit sequence が implicit に開始されたかどうか
  # @param style YAML ドキュメント上の style
  def new; end

  # --- ANY -> Integer
  # 「任意」のスタイルを意味します。
  # 
  # emitter が適当に style を決めます。
  # 
  # @see [[m:Psych::Nodes::Sequence.new]],
  #      [[m:Psych::Nodes::Sequence#style]],
  #      [[m:Psych::Handler#start_sequence]]
  def ANY; end

  # --- BLOCK -> Integer
  # block style を表します。
  # 
  # @see [[m:Psych::Nodes::Sequence.new]],
  #      [[m:Psych::Nodes::Sequence#style]],
  #      [[m:Psych::Handler#start_sequence]]
  def BLOCK; end

  # --- FLOW -> Integer
  # flow style を表します。
  # 
  # @see [[m:Psych::Nodes::Sequence.new]],
  #      [[m:Psych::Nodes::Sequence#style]]
  def FLOW; end

end
