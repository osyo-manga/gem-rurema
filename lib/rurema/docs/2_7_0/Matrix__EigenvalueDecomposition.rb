class Matrix::EigenvalueDecomposition
  # --- eigenvalue_matrix -> Matrix
  # --- d -> Matrix
  # 固有値を対角成分に並べた行列を返します。
  def d; end

  # --- eigenvalues -> [Float]
  # 固有値を配列で返します。
  def eigenvalues; end

  # --- eigenvector_matrix -> Matrix
  # --- v  -> Matrix
  # 右固有ベクトルを横に並べた行列を返します。
  def eigenvector_matrix; end

  # --- eigenvector_matrix_inv  -> Matrix
  # --- v_inv  -> Matrix
  # 左固有ベクトルを縦に並べた行列を返します。
  # 
  # これは [[m:Matrix::EigenvalueDecomposition#v]] の逆行列です
  def eigenvector_matrix_inv; end

  # --- eigenvectors -> [Vector]
  # 右固有ベクトルを配列で返します。
  def eigenvectors; end

  # --- to_ary -> [Matrix, Matrix, Matrix]
  # --- to_a -> [Matrix, Matrix, Matrix]
  # 
  # [[m:Matrix::EigenvalueDecomposition#v]],
  # [[m:Matrix::EigenvalueDecomposition#d]],
  # [[m:Matrix::EigenvalueDecomposition#v_inv]]
  # をこの順に並べた配列を返します。
  def to_a; end

end
