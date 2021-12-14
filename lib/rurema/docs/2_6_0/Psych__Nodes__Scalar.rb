class Psych::Nodes::Scalar
  # --- anchor -> String|nil
  # scalar に付加された anchor を返します。
  # 
  # @see [[m:Psych::Nodes::Scalar#anchor=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def anchor; end

  # --- anchor=(a) 
  # scalar に付加された anchor を変更します。
  # 
  # @param a 設定する anchor
  # @see [[m:Psych::Nodes::Scalar#anchor]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def anchor=; end

  # --- plain -> bool
  # scalar が plain style であるかどうかを返します。
  # 
  # 
  # @see [[m:Psych::Nodes::Scalar#plain=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def plain; end

  # --- plain=(bool)
  # scalar が plain style であるかどうかを変更します。
  # 
  # @param bool 設定する真偽値
  # @see [[m:Psych::Nodes::Scalar#plain]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def plain=; end

  # --- quoted -> bool
  # scalar が quoted であるかどうかを返します。
  # 
  # @see [[m:Psych::Nodes::Scalar#quoted=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def quoted; end

  # --- quoted=(bool)
  # scalar が quoted であるかどうかを変更します。
  # 
  # @param bool 設定する真偽値
  # @see [[m:Psych::Nodes::Scalar#quoted]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def quoted=; end

  # --- style -> Integer
  # scalar の style を返します。
  # 
  # @see [[m:Psych::Nodes::Scalar#style=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def style; end

  # --- style=(sty)
  # scalar の style を変更します。
  # 
  # @param sty 設定する style
  # @see [[m:Psych::Nodes::Scalar#style=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def style=; end

  # --- tag -> String|nil
  # scalar に付加された tag を返します。
  # 
  # @see [[m:Psych::Nodes::Scalar#tag=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def tag; end

  # --- tag=(t)
  # scalar に付加された tag を変更します。
  # 
  # @param t 設定する tag
  # @see [[m:Psych::Nodes::Scalar#tag]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def tag=; end

  # --- value -> String
  # scalar の値を返します。
  # 
  # @see [[m:Psych::Nodes::Scalar#value=]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def value; end

  # --- value=(v)
  # scalar の値を設定します。
  # 
  # @param v 設定する値
  # @see [[m:Psych::Nodes::Scalar#value]],
  #      [[m:Psych::Nodes::Scalar.new]]
  def value=; end

  # --- new(value, anchor=nil, tag=nil, plain=true, quoted=false, style=ANY) -> Psych::Nodes:Scalar
  # 
  # Scalar オブジェクトを生成します。
  # 
  # value は scalar の値を文字列で指定します。
  # 
  # anchor には scalar に付加されている anchor を文字列で指定します。
  # anchor を付けない場合には nil を指定します。
  # 
  # tag には scalar に付加されている tag を文字列で指定します。
  # tag を付けない場合には nil を指定します。
  # 
  # plain は plain style であるかどうか、quoted は quoted style であるかどうか
  # を指定します。style には node の style を整数値で渡します。
  # style は次の値のいずれかです。
  #   * [[m:Psych::Nodes::Scalar::ANY]]
  #   * [[m:Psych::Nodes::Scalar::PLAIN]]
  #   * [[m:Psych::Nodes::Scalar::SINGLE_QUOTED]]
  #   * [[m:Psych::Nodes::Scalar::DOUBLE_QUOTED]]
  #   * [[m:Psych::Nodes::Scalar::LITERAL]]
  #   * [[m:Psych::Nodes::Scalar::FOLDED]]
  # 
  # @param value スカラー値
  # @param anchor 関連付けられた anchor の名前
  # @param tag タグ名
  # @param plain plain style であるかどうか
  # @param quoted quoted style であるかどうか
  # @param style スカラーのスタイル
  def new; end

  # --- ANY -> Integer
  # 「任意」のスタイルを意味します。
  # 
  # emitter が適当に style を決めます。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]]
  def ANY; end

  # --- DOUBLE_QUOTED -> Integer
  # double quoted style を表します。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]],
  #      [[m:Psych::Handler#scalar]]
  def DOUBLE_QUOTED; end

  # --- FOLDED -> Integer
  # folded style を表します。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]],
  #      [[m:Psych::Handler#scalar]]
  def FOLDED; end

  # --- LITERAL -> Integer
  # literal style を表します。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]],
  #      [[m:Psych::Handler#scalar]]
  def LITERAL; end

  # --- PLAIN -> Integer
  # plain scalar style を表します。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]],
  #      [[m:Psych::Handler#scalar]]
  def PLAIN; end

  # --- SINGLE_QUOTED -> Integer
  # single quoted style を表します。
  # 
  # @see [[m:Psych::Nodes::Scalar.new]],
  #      [[m:Psych::Nodes::Scalar#style]],
  #      [[m:Psych::Handler#scalar]]
  def SINGLE_QUOTED; end

end
