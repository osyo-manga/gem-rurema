class Psych::Emitter
  # --- canonical -> bool
  # 
  # 出力の style が canonical であるならば真を返します。
  # 
  # @see [[m:Psych::Emitter#canonical=]]
  def canonical; end

  # --- canonical=(bool)
  # 
  # 出力の style が canonical である/ないを指定します。
  # 
  # @param bool canonicalであるかどうか
  # @see [[m:Psych::Emitter#canonical]]
  def canonical=; end

  # --- indentation -> Integer
  # インデントのレベルを返します。
  # 
  # 
  # @see [[m:Psych::Emitter#indentation=]]
  def indentation; end

  # --- indentation=(level)
  # インデントのレベルを指定します。
  # 
  # 1 から 9 までの整数で指定します。
  # 
  # @param level インデントレベル
  # @see [[m:Psych::Emitter#indentation]]
  def indentation=; end

  # --- line_width -> Integer
  # 「好ましい」行幅を返します。
  # 
  # @see [[m:Psych::Emitter#line_width=]]
  def line_width; end

  # --- line_width=(width)
  # 
  # 「好ましい」行幅を整数値で設定します。
  # 
  # @param width 好ましい行幅
  # @see [[m:Psych::Emitter#line_width]]
  def line_width=; end

  # --- new(io) -> Psych::Emitter
  # Emitter オブジェクトを生成して返します。
  # 
  # @param io 出力先の IO オブジェクト
  def new; end

end
