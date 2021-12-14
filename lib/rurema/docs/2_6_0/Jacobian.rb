module Jacobian
  # --- dfdxi(f, fx, x, i) -> [Numeric]
  # 
  # 関数 f の 微分係数を計算します。ライブラリ内部で使用します。
  def dfdxi; end

  # --- isEqual(a, b, zero = 0.0, e = 1.0e-8) -> bool
  # 
  # 引数 a、b が等しいかどうかを返します。ライブラリ内部で使用します。
  def isEqual; end

  # --- jacobian(f, fx, x) -> [Numeric]
  # 
  # ヤコビ行列を計算します。
  # 
  # @param f ヤコビ行列を求めたい関数を表すオブジェクトを指定します。詳細は
  #          [[lib:bigdecimal/jacobian]] をご覧ください。
  # 
  # @param fx f.values(x) の結果を表すベクトルを数値の配列で指定します。
  # 
  # @param x ヤコビ行列を求める点 x にあたるベクトルを数値の配列で指定します。
  # 
  # @return ヤコビ行列を返します。(各要素を Row-major order で 1 次元の配列
  #         にしたオブジェクトを指定します)
  # 
  # @raise RuntimeError 計算結果が特異ヤコビ行列になった場合に発生します。
  def jacobian; end

end
