class Matrix::LUPDecomposition
  # --- det         -> Numeric
  # --- determinant -> Numeric
  # 元の行列の行列式の値を返します。
  # LUP 分解の結果を利用して計算します。
  # 
  # @see [[m:Matrix#determinant]]
  def det; end

  # --- l -> Matrix
  # LUP分解の下半行列部分を返します。
  def l; end

  # --- p -> Matrix
  # LUP分解の置換行列部分を返します。
  def p; end

  # --- pivots -> [Integer]
  # ピボッティングを表す配列を返します。
  def pivots; end

  # --- singular? -> bool
  # 元の行列が正方で特異なら true を、正則なら false を返します。
  # LUP 分解の結果を利用して判定します。
  # 
  # @see [[m:Matrix#singular?]]
  def singular?; end

  # --- solve(b) -> Vector | Matrix
  # self が正方行列 A の LUP 分解の時、一次方程式 Ax = b の解を返します。
  # b には [[c:Vector]], [[c:Matrix]], 数値の配列を指定出来ます。
  # 
  # それぞれベクトルのサイズ、行列の行数、配列のサイズが A の列数と一致していなければなりません。
  # 返り値は b が行列なら行列、それ以外はベクトルになります。
  # 
  # @param b 一次方程式の定数項を指定します。
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # 
  # lup = Matrix[[2, 1], [1, 2]].lup
  # 
  # lup.solve([1, -1])                  #=> Vector[(1/1), (-1/1)]
  # lup.solve(Vector[3, 0])             #=> Vector[(2/1), (-1/1)]
  # lup.solve(Matrix[[1, 3], [-1, 0]])  #=> Matrix[[(1/1), (2/1)], [(-1/1), (-1/1)]]
  # //}
  def solve; end

  # --- to_ary -> [Matrix, Matrix, Matrix]
  # --- to_a -> [Matrix, Matrix, Matrix]
  # 分解した行列を [下半行列, 上半行列, 置換行列] という3要素の配列で
  # 返します。
  def to_a; end

  # --- u -> Matrix
  # LUP分解の上半行列部分を返します。
  def u; end

end
