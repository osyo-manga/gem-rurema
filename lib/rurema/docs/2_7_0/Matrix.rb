class Matrix
  # --- *(m) -> Matrix | Vector
  # 
  # self に行列またはベクトル m を右から乗じた行列を返します。
  # 
  # m が [[c:Vector]] オブジェクトなら返り値も [[c:Vector]] オブジェクトになります。
  # 
  # @param m 右からの乗算が定義可能な行列やベクトルを指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 次元が合わない場合に発生します
  # 
  # --- *(other) -> Matrix
  # 
  # self の各成分に数 other を掛けた行列を返します。
  # 
  # @param other self の各成分に掛ける [[c:Numeric]] オブジェクトを指定します。
  def *; end

  # --- **(n) -> Matrix
  # 
  # self の n 乗を返します。
  # 
  # @param n べき数の指定
  # @raise ExceptionForMatrix::ErrNotRegular n が 0 以下で、行列が正則でない場合に発生します
  def **; end

  # --- +(m) -> Matrix
  # 
  # self に行列 m を加算した行列を返します。
  # self の column_size が 1 なら [[c:Vector]] オブジェクトも指定出来ます。
  # 
  # @param m 加算する行列。加算可能な行列やベクトルを指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 次元が合わない場合に発生します
  def +; end

  # --- +@ -> self
  # 
  # 単項 +。self を返します。
  def +@; end

  # --- -(m) -> Matrix
  # 
  # self から行列mを減算した行列を返します。
  # self の column_size が 1 なら [[c:Vector]] オブジェクトも指定出来ます。
  # 
  # @param m 減算する行列。減算可能な行列やベクトルを指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 次元が合わない場合に発生します
  def -; end

  # --- -@ -> Matrix
  # 
  # 単項 -。各要素の符号を反転させた行列を返します。
  def -@; end

  # --- /(m) -> Matrix
  # 
  # self に行列 m の逆行列を右から乗じた行列を返します。
  # 
  # @param m 逆行列を右から乗算する行列。可逆行列でselfと乗算可能な行列を指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 次元が合わない場合に発生します
  # @raise ExceptionForMatrix::ErrNotRegular m が正則でない場合に発生します
  # 
  # --- /(other) -> Matrix
  # 
  # self の各成分を数 other で割った行列を返します。
  # 
  # @param other self の各成分を割る [[c:Numeric]] オブジェクトを指定します。
  def /; end

  # --- ==(other) -> bool
  # --- eql?(other) -> bool
  # 
  # 自分自身と other を比較し、同値であれば真(true)を返します。
  # 
  # @param other 比較対象のオブジェクト
  def ==; end

  # --- [](i, j) -> ()
  # --- element(i, j) -> ()
  # --- component(i, j) -> ()
  # 
  # (i,j)要素を返します。
  # 行列の範囲外の値を指定した場合には nil を返します。
  # 
  # @param i 要素の行成分を0オリジンで指定します。
  # @param j 要素の列成分を0オリジンで指定します。
  # 
  # 
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # a1 = [1, 2, 3]
  # a2 = [10, 15, 20]
  # a3 = [-1, 2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m[0, 0] # => 1
  # p m[1, 1] # => 15
  # p m[1, 2] # => 20
  # p m[1, 3] # => nil
  # //}
  def []; end

  # --- []=(row, col, v)
  # 
  # 行が row、列が col である範囲を v に変更する。
  # 
  # @param row  self の変更する行の範囲を [[c:Integer]] か [[c:Range]] で指定します。
  # @param col  self の変更する列の範囲を [[c:Integer]] か [[c:Range]] で指定します。
  # @param v  セットする要素を指定します。
  #           v が [[c:Vector]] のとき、変更の対象範囲は [[c:Integer]] と [[c:Range]] で指定し、
  #                                   サイズが同じである必要があります。
  #           v が [[c:Matrix]] のとき、変更の対象範囲と行数・列数が同じである必要があります。
  #           v が上記以外のとき、変更の対象範囲の全ての要素を v に変更します。
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # 
  # m = Matrix[[0, 0], [0, 0]]
  # m[0, 1] = 6
  # m[-1, -1] = 9
  # p m  # => Matrix[[0, 6], [0, 9]]
  # 
  # m = Matrix[[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  # m[0, 0..-1] = 5
  # m[1, 0..1] = Vector[2, 4]
  # m[2, 0..2] = Matrix[[3, 6, 9]]
  # p m #=> Matrix[[5, 5, 5], [2, 4, 0], [3, 6, 9]]
  # 
  # m = Matrix[[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  # m[0..2, 0..1] = 9
  # p m  # => Matrix[[9, 9, 0], [9, 9, 0], [9, 9, 0]]
  # m[1..-1, 0..1] = Matrix[[1, 2], [3, 4]]
  # p m  # => Matrix[[9, 9, 0], [1, 2, 0], [3, 4, 0]]
  # //}
  def []=; end

  # --- adjugate -> Matrix
  # 余因子行列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[7,6],[3,9]].adjugate # => Matrix[[9, -6], [-3, 7]]
  # //}
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方でない場合に発生します。
  # @see [[m:Matrix#cofactor]]
  def adjugate; end

  # --- antisymmetric? -> bool
  # --- skew_symmetric? -> bool
  # 
  # 行列が反対称行列 (交代行列、歪〔わい〕対称行列とも) ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # 
  # Matrix[[0, -2, Complex(1, 3)], [2, 0, 5], [-Complex(1, 3), -5, 0]].antisymmetric? # => true
  # Matrix.empty.antisymmetric? # => true
  # 
  # Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]].antisymmetric? # => false
  # # 対角要素が違う
  # Matrix[[1, -2, 3], [2, 0, 6], [-3, -6, 0]].antisymmetric? # => false
  # # 符号が違う
  # Matrix[[0, 2, -3], [2, 0, 6], [-3, 6, 0]].antisymmetric? # => false
  # //}
  def antisymmetric?; end

  # --- coerce(other) -> Array
  # 他の数値オブジェクトとの変換を行います。
  # 
  # 他の数値オブジェクトを[[c:Matrix::Scalar]]のオブジェクトに変換し、selfとの組を配列として返します。
  # 
  # @param other 変換する数値オブジェクト
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [1, 2]
  # a2 = [-1.25, 2.2]
  # m = Matrix[a1, a2]
  # r = Rational(1, 2)
  # p m.coerce(r) #=> [#<Matrix::Scalar:0x832df18 @value=(1/2)>, Matrix[[1, 2], [-1.25, 2.2]]]
  # //}
  def coerce; end

  # --- cofactor(row, column) -> Integer | Rational | Float
  # 
  # (row, column)-余因子を返します。
  # 
  # 各要素の型によって返り値が変わります。
  # 
  # @param row 行
  # @param column 列
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方でない場合に発生します。
  # @see [[m:Matrix#adjugate]]
  def cofactor; end

  # --- cofactor_expansion(row: nil, column: nil) -> object | Integer | Rational | Float
  # --- laplace_expansion(row: nil, column: nil) -> object | Integer | Rational | Float
  # 
  # row 行、もしくは column 列に関するラプラス展開をする。
  # 
  # 通常の行列に対してはこれは単に固有値を計算するだけです。かわりに[[m:Matrix#determinant]] を
  # 利用すべきです。
  # 
  # 変則的な形状の行列に対してはそれ以上の意味を持ちます。例えば
  # row行/column列が行列やベクトルである場合には
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # # Matrix[[7,6], [3,9]].laplace_expansion(column: 1) # => 45
  # Matrix[[Vector[1, 0], Vector[0, 1]], [2, 3]].laplace_expansion(row: 0) # => Vector[3, -2]
  # //}
  # 
  # @param row 行
  # @param column  列
  # @raise ArgumentError row と column を両方指定した、もしくは両方とも指定していない、場合に発生します
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方でない場合に発生します
  # @see [[m:Matrix#cofactor]]
  def cofactor_expansion; end

  # --- map(which = :all) {|x| ... } -> Matrix
  # --- collect(which = :all) {|x| ... } -> Matrix
  # --- map(which = :all) -> Enumerator
  # --- collect(which = :all) -> Enumerator
  # 
  # 行列の各要素に対してブロックの適用を繰り返した結果を、要素として持つ行列を生成します。
  # 
  # ブロックがない場合、 [[c:Enumerator]] を返します。
  # 
  # @param which  which に以下の [[c:Symbol]] を指定することで、
  #               引数として使われる要素を限定できます。
  #               デフォルトは、:all (全ての要素)です。
  #               指定できる [[c:Symbol]] の詳細は、 [[m:Matrix#each]] の項目を参照して下さい。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # m = Matrix[[1, 2], [3, 4]]
  # p m.map { |x| x + 100 } # => Matrix[[101, 102], [103, 104]]
  # p m.map(:diagonal) { |x| x * 10 } # => Matrix[[10, 2], [3, 40]]
  # //}
  # 
  # @see [[m:Matrix#each]], [[m:Matrix#map!]]
  def collect; end

  # --- map!(which = :all) {|element| ... } -> self
  # --- collect!(which = :all) {|element| ... } -> self
  # --- map!(which = :all) -> Enumerator
  # --- collect!(which = :all) -> Enumerator
  # 
  # 行列の各要素に対してブロックの適用を繰り返した結果で要素を置き換えます。
  # 
  # ブロックのない場合は、自身と map! から生成した [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param which  which に以下の [[c:Symbol]] を指定することで、
  #               引数として使われる要素を限定できます。
  #               デフォルトは、:all (全ての要素)です。
  #               指定できる [[c:Symbol]] の詳細は、 [[m:Matrix#each]] の項目を参照して下さい。
  # 
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # m = Matrix[[1, 2], [3, 4]]
  # 
  # p m.map! { |element| element * 10 } #=> Matrix[[10, 20], [30, 40]]
  # p m                                 #=> Matrix[[10, 20], [30, 40]]
  # //}
  # 
  # @see [[m:Matrix#each]], [[m:Matrix#map]]
  def collect!; end

  # --- column(j) -> Vector | nil
  # --- column(j) {|x| ... } -> self
  # 
  # j 番目の列を [[c:Vector]] オブジェクトで返します。
  # j 番目の列が存在しない場合は nil を返します。
  # ブロックが与えられた場合はその列の各要素についてブロックを繰り返します。
  # 
  # 
  # @param j 列の位置を指定します。
  #          先頭の列が 0 番目になります。j の値が負の時には末尾から
  #          のインデックスと見倣します。末尾の列が -1 番目になります。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # a1 = [ 1,  2,   3]
  # a2 = [10, 15,  20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m.column(1) # => Vector[2, 15, -2]
  # 
  # cnt = 0
  # m.column(-1) { |x|
  #   cnt = cnt + x
  # }
  # p cnt # => 24.5
  # //}
  def column; end

  # --- column_size -> Integer
  # --- column_count -> Integer
  # 
  # 行列の列数を返します。
  def column_count; end

  # --- column_vectors -> [Vector]
  # 
  # 自分自身を列ベクトルの配列として返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m.column_vectors # => [Vector[1, 10, -1], Vector[2, 15, -2], Vector[3, 20, 1.5]]
  # //}
  def column_vectors; end

  # --- combine(*matrices) {|*elements| ... } -> Matrix
  # 
  # 要素ごとにブロックを呼び出した結果を組み合わせた Matrix を返します。
  # 
  # Matrix.combine(self, *matrices) { ... } と同じです。
  # 
  # @see [[m:Matrix.combine]]
  def combine; end

  # --- conjugate -> Matrix
  # --- conj -> Matrix
  # 
  # 複素共役を取った行列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
  #   # => 1+2i   i  0
  #   #       1   2  3
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].conjugate
  #   # => 1-2i  -i  0
  #   #       1   2  3
  # //}
  def conj; end

  # --- determinant -> Numeric
  # --- det -> Numeric
  # 
  # 行列式 (determinant) の値を返します。
  # 
  # [[c:Float]] を使用すると、精度が不足するため、誤った結果が生じる可能性があることに注意してください。
  # 代わりに、[[c:Rational]] や [[c:BigDecimal]] などの正確なオブジェクトを使用することを検討してください。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 正方行列でない場合に発生します
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # p Matrix[[2, 1], [-1, 2]].det         #=> 5
  # p Matrix[[2.0, 1.0], [-1.0, 2.0]].det #=> 5.0
  # //}
  def det; end

  # --- determinant_e -> Rational | Float
  # --- det_e -> Rational | Float
  # 
  # このメソッドは deprecated です。
  # [[m:Matrix#determinant]] を代わりに使ってください。
  def det_e; end

  # --- diagonal? -> bool
  # 行列が対角行列ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def diagonal?; end

  # --- each(which = :all) {|e| ... } -> self
  # --- each(which = :all) -> Enumerator
  # 
  # 行列の各要素を引数としてブロックを呼び出します。
  # 
  # 0行目、1行目、…という順番で処理します。
  # which に以下の [[c:Symbol]] を指定することで
  # 引数として使われる要素を限定することができます。
  #   * :all - すべての要素(デフォルト)
  #   * :diagonal - 対角要素
  #   * :off_diagonal 対角要素以外
  #   * :lower 対角成分とそれより下側の部分
  #   * :upper対角成分とそれより上側の部分
  #   * :strict_lower 対角成分の下側
  #   * :strict_upper 対角成分の上側
  # 
  # ブロックを省略した場合、 [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[ [1,2], [3,4] ].each { |e| puts e }
  # # => prints the numbers 1 to 4
  # Matrix[ [1,2], [3,4] ].each(:strict_lower).to_a # => [3]
  # //}
  # 
  # @param which どの要素に対してブロックを呼び出すのかを [[c:Symbol]] で指定します
  # @see [[m:Matrix#each_with_index]], [[m:Matrix#map]]
  def each; end

  # --- each_with_index(which = :all) {|e, row, col| ... }  -> self
  # --- each_with_index(which = :all) -> Enumerator
  # 
  # 行列の各要素をその位置とともに引数としてブロックを呼び出します。
  # 
  # which で処理する要素の範囲を指定することができます。
  # [[m:Matrix#each]] と同じなのでそちらを参照してください。
  # 
  # ブロックを省略した場合、 [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[ [1,2], [3,4] ].each_with_index do |e, row, col|
  #   puts "#{e} at #{row}, #{col}"
  # end
  #   # => 1 at 0, 0
  #   # => 2 at 0, 1
  #   # => 3 at 1, 0
  #   # => 4 at 1, 1
  # //}
  # 
  # @param which どの要素に対してブロックを呼び出すのかを [[c:Symbol]] で指定します
  # @see [[m:Matrix#each]]
  def each_with_index; end

  # --- eigen -> Matrix::EigenvalueDecomposition
  # --- eigensystem -> Matrix::EigenvalueDecomposition
  # 行列の固有値と左右の固有ベクトルを保持したオブジェクトを返します。
  # 
  # [[c:Matrix::EigenvalueDecomposition]] は to_ary を定義しているため、
  # 多重代入によって3つの行列(右固有ベクトル、固有値行列、左固有ベクトル)
  # を得ることができます。
  # これを [V, D, W] と書くと、
  # (元の行列が対角化可能ならば)、
  # D は対角行列で、 self == V*D*W, V = W.inverse を満たします。
  # D のそれぞれの対角成分が行列の固有値です。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # m = Matrix[[1, 2], [3, 4]]
  # v, d, v_inv = m.eigensystem
  # d.diagonal? # => true
  # v.inv == v_inv # => true
  # (v * d * v_inv).round(5) == m # => true
  # //}
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  # @see [[c:Matrix::EigenvalueDecomposition]]
  def eigen; end

  # --- elements_to_f -> Matrix
  # 各要素を浮動小数点数 [[c:Float]] に変換した行列を返します。
  # 
  # このメソッドは deprecated です。 map(&:to_f) を使ってください。
  def elements_to_f; end

  # --- elements_to_i -> Matrix
  # 各要素を整数 [[c:Integer]] に変換した行列を返します。
  # 
  # このメソッドは deprecated です。 map(&:to_i) を使ってください。
  def elements_to_i; end

  # --- elements_to_r -> Matrix
  # 各要素を有理数 [[c:Rational]] に変換した行列を返します。
  # 
  # このメソッドは deprecated です。 map(&:to_r) を使ってください。
  def elements_to_r; end

  # --- empty? -> bool
  # 行列が要素を持たないならば true を返します。
  # 
  # 要素を持たないとは、行数か列数のいずれかが0であることを意味します。
  # 
  # @see [[m:Matrix.empty]]
  def empty?; end

  # --- hadamard_product(m) -> Matrix
  # --- entrywise_product(m) -> Matrix
  # 
  # アダマール積(要素ごとの積)を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行や列の要素数が一致しない時に発生します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # Matrix[[1,2], [3,4]].hadamard_product(Matrix[[1,2], [3,2]]) # => Matrix[[1, 4], [9, 8]]
  # //}
  def entrywise_product; end

  # --- index(value, selector = :all) -> [Integer, Integer] | nil
  # --- index(selector = :all){|e| ... } -> [Integer, Integer] | nil
  # --- index(selector = :all) -> Enumerator
  # --- find_index(value, selector = :all) -> [Integer, Integer] | nil
  # --- find_index(selector = :all){|e| ... } -> [Integer, Integer] | nil
  # --- find_index(selector = :all) -> Enumerator
  # 
  # 指定した値と一致する要素の位置を [row, column] という配列で返します。
  # ブロックを与えた場合は各要素を引数としてブロックを呼び出し、
  # 返り値が真であった要素の位置を返します。
  # 
  # 複数の位置で値が一致する/ブロックが真を返す、場合は最初
  # に見つかった要素の位置を返します。
  # 
  # selector で行列のどの部分を探すかを指定します。この引数の意味は
  # [[m:Matrix#each]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[ [1,2], [3,4] ].index(&:even?) # => [0, 1]
  # Matrix[ [1,1], [1,1] ].index(1, :strict_lower) # => [1, 0]
  # //}
  # 
  # value を指定せず、さらにブロックを省略した場合、
  # [[c:Enumerator]] を返します。
  # 
  # @param value 探索する値
  # @param selector 探索範囲
  def find_index; end

  # --- first_minor(row, column) -> Matrix
  # 
  # self から第 row 行と第 column 列を取り除いた行列を返します。
  # 
  # @param row 行
  # @param column 列
  # @raise ArgumentError row, column が行列の行数/列数を越えている場合に発生します。
  def first_minor; end

  # --- hash -> Integer
  # 行列のHash値を返します。
  def hash; end

  # --- hermitian? -> bool
  # 行列がエルミートならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def hermitian?; end

  # --- hstack(*matrices) -> Matrix
  # 
  # 行列 self と matrices を横に並べた行列を生成します。
  # 
  # Matrix.hstack(self, *matrices) と同じです。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # x = Matrix[[1, 2], [3, 4]]
  # y = Matrix[[5, 6], [7, 8]]
  # x.hstack(y) # => Matrix[[1, 2, 5, 6], [3, 4, 7, 8]]
  # //}
  # 
  # @param matrices 並べる行列。すべての行列の行数がselfの行数と一致していなければならない
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行数の異なる行列がある場合に発生します
  # 
  # @see [[m:Matrix.hstack]], [[m:Matrix#vstack]]
  def hstack; end

  # --- imaginary -> Matrix
  # --- imag -> Matrix
  # 
  # 行列の虚部を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
  # #  => 1+2i  i  0
  # #        1  2  3
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].imaginary
  # #  =>   2i  i  0
  # #        0  0  0
  # //}
  def imag; end

  # --- inspect -> String
  # 自分自身を見やすい形式に文字列化し、その文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [1, 2]
  # a2 = [3, 4.5]
  # m = Matrix[a1, a2]
  # 
  # p m.inspect # => "Matrix[[1, 2], [3, 4.5]]"
  # //}
  def inspect; end

  # --- inverse -> Matrix
  # --- inv -> Matrix
  # 
  # 逆行列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # p Matrix[[2, 1], [3, 2]].inv         #=> Matrix[[(2/1), (-1/1)], [(-3/1), (2/1)]]
  # 
  # p Matrix[[2.0, 1.0], [3.0, 2.0]].inv #=> Matrix[[2.0000000000000004, -1.0000000000000002], [-3.000000000000001, 2.0000000000000004]]
  # //}
  def inv; end

  # --- lower_triangular? -> bool
  # 行列が下三角行列ならば true を返します。
  def lower_triangular?; end

  # --- lup -> Matrix::LUPDecomposition
  # --- lup_decomposition -> Matrix::LUPDecomposition
  # 行列の LUP 分解を保持したオブジェクトを返します。
  # 
  # [[c:Matrix::LUPDecomposition]] は to_ary を定義しているため、
  # 多重代入によって3つの行列(下三角行列、上三角行列、置換行列)
  # を得ることができます。これを [L, U, P] と書くと、
  # L*U = P*self を満たします。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a = Matrix[[1, 2], [3, 4]]
  # l, u, p = a.lup
  # l.lower_triangular? # => true
  # u.upper_triangular? # => true
  # p.permutation?      # => true
  # l * u == p * a      # => true
  # a.lup.solve([2, 5]) # => Vector[(1/1), (1/2)]
  # //}
  # 
  # @see [[c:Matrix::LUPDecomposition]]
  def lup; end

  # --- minor(from_row, row_size, from_col, col_size) -> Matrix
  # --- minor(from_row..to_row, from_col..to_col) -> Matrix
  # 
  # selfの部分行列を返します。
  # 
  # 自分自身の部分行列を返します。
  # ただし、パラメータは次の方法で指定します。
  #   (1) 開始行番号, 行の大きさ, 開始列番号, 列の大きさ
  #   (2) 開始行番号..終了行番号, 開始列番号..終了列番号
  # 
  # @param from_row 部分行列の開始行(0オリジンで指定)
  # @param row_size 部分行列の行サイズ
  # @param from_col 部分行列の開始列(0オリジンで指定)
  # @param col_size 部分行列の列サイズ
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [ 1,  2,  3,  4,  5]
  # a2 = [11, 12, 13, 14, 15]
  # a3 = [21, 22, 23, 24, 25]
  # a4 = [31, 32, 33, 34, 35]
  # a5 = [51, 52, 53, 54, 55]
  # m = Matrix[a1, a2, a3, a4, a5]
  # 
  # p m.minor(0, 2, 1, 2) # => Matrix[[2, 3], [12, 13]]
  # //}
  def minor; end

  # --- normal? -> bool
  # 行列が正規行列ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def normal?; end

  # --- orthogonal? -> bool
  # 行列が直交行列ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def orthogonal?; end

  # --- permutation? -> bool
  # 行列が置換行列ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def permutation?; end

  # --- rank -> Integer
  # 
  # 階数 (rank) を返します。
  # 
  # [[c:Float]] を使用すると、精度が不足するため、誤った結果が生じる可能性があることに注意してください。
  # 代わりに、[[c:Rational]] や [[c:BigDecimal]] などの正確なオブジェクトを使用することを検討してください。
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # m = Matrix[[2, 6], [1, 3]]
  # m.rank  # => 1
  # //}
  def rank; end

  # --- rank_e -> Integer
  # 
  # 階数 (rank) を返します。
  # 
  # このメソッドは deprecated です。
  # 代わりに [[m:Matrix#rank]] を使ってください。
  def rank_e; end

  # --- real -> Matrix
  # 
  # 行列の実部を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]]
  # #  => 1+2i  i  0
  # #        1  2  3
  # Matrix[[Complex(1,2), Complex(0,1), 0], [1, 2, 3]].real
  # #  =>    1  0  0
  # #        1  2  3
  # //}
  def real; end

  # --- real? -> bool
  # 行列の全要素が実([[m:Numeric#real?]])であれば true を返します。
  # 
  # Complexオブジェクトを要素に持つ場合は虚部が0でも偽を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[1, 0], [0, 1]].real? # => true
  # Matrix[[Complex(0, 1), 0], [0, 1]].real? # => false
  # # 要素が実数であっても Complex オブジェクトなら偽を返す。
  # Matrix[[Complex(1, 0), 0], [0, 1]].real? # => false
  # //}
  def real?; end

  # --- rectangular -> [Matrix, Matrix]
  # --- rect -> [Matrix, Matrix]
  # 行列を実部と虚部に分解したものを返します。
  # 
  # 
  # //emlist[例][ruby]{
  # m.rect == [m.real, m.imag]  # ==> true for all matrices m
  # //}
  # 
  # @see [[m:Matrix#imaginary]], [[m:Matrix#real]]
  def rect; end

  # --- regular? -> bool
  # 
  # 行列が正方で正則なら true を、特異なら false を返します。
  # 
  # 行列が正則であるとは、正方行列であり、かつ、その逆行列が存在することです。
  # 行列式が0でないことと同値です。
  # 
  # 正方行列でない場合には例外 ExceptionForMatrix::ErrDimensionMismatch を
  # 発生させます。
  # 
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # p m.regular? # => true
  # 
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, -3]
  # m = Matrix[a1, a2, a3]
  # p m.regular? # => false
  # 
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # a4 = [1, 1, 1]
  # m = Matrix[a1, a2, a3, a4]
  # p m.regular? # => raise ExceptionForMatrix::ErrDimensionMismatch
  # //}
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def regular?; end

  # --- round(ndigits = 0) -> Matrix
  # 行列の各要素を指定した桁数で丸めた行列を返します。
  # 
  # @see [[m:Float#round]]
  def round; end

  # --- row(i) -> Vector | nil
  # --- row(i) {|x| ... } -> self
  # 
  # i 番目の行を [[c:Vector]] オブジェクトで返します。
  # i 番目の行が存在しない場合は nil を返します。
  # ブロックが与えられた場合はその行の各要素についてブロックを繰り返します。
  # 
  # [[c:Vector]] オブジェクトは [[c:Matrix]] オブジェクトとの演算の際には列ベクトルとして扱われることに注意してください。
  # 
  # @param i 行の位置を指定します。
  #          先頭の行が 0 番目になります。i の値が負の時には末尾から
  #          のインデックスと見倣します。末尾の行が -1 番目になります。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [1, 2, 3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m.row(1) # => Vector[10, 15, 20]
  # 
  # cnt = 0
  # m.row(0) { |x|
  #   cnt = cnt + x
  # }
  # p cnt # => 6
  # //}
  def row; end

  # --- row_size -> Integer
  # --- row_count -> Integer
  # 
  # 行列の行数を返します。
  def row_count; end

  # --- row_vectors -> [Vector]
  # 
  # 自分自身を行ベクトルの配列として返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m.row_vectors # => [Vector[1, 2, 3], Vector[10, 15, 20], Vector[-1, -2, 1.5]]
  # //}
  def row_vectors; end

  # --- singular? -> bool
  # 
  # 行列が正方で特異なら true を、正則なら false を返します。
  # 
  # 行列が特異(singular)であるとは、正則でないことです。
  # 行列式が0であること同値です。
  # 
  # 正方行列でない場合には例外 ExceptionForMatrix::ErrDimensionMismatch を
  # 発生させます。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def singular?; end

  # --- square? -> bool
  # 
  # 正方行列であるなら、 true を返します。
  def square?; end

  # --- symmetric? -> bool
  # 行列が対称ならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def symmetric?; end

  # --- transpose -> Matrix
  # --- t -> Matrix
  # 
  # 転置行列 (transpose matrix) を返します。
  # 
  # self を [[c:Matrix]] のオブジェクトで、(m,n) 型行列としたとき a(j,i) を (i,j) 要素とする (n,m) 型行列を返します。
  def t; end

  # --- to_a -> Array
  # 
  # 自分自身を[[c:Array]]に変換したものを返します。
  # 
  # 行ベクトルを配列([[c:Array]])としたものの配列(つまり配列の配列)として返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [ 1,  2,  3]
  # a2 = [10, 15, 20]
  # a3 = [-1, -2, 1.5]
  # m = Matrix[a1, a2, a3]
  # 
  # p m.to_a # => [[1, 2, 3], [10, 15, 20], [-1, -2, 1.5]]
  # //}
  def to_a; end

  # --- to_s -> String
  # 行列を文字列化し、その文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a1 = [1, 2]
  # a2 = [3, 4.5]
  # m = Matrix[a1, a2]
  # 
  # p m.to_s # => "Matrix[[1, 2], [3, 4.5]]"
  # //}
  def to_s; end

  # --- trace -> Integer | Float | Rational | Complex
  # --- tr -> Integer | Float | Rational | Complex
  # 
  # トレース (trace) を返します。
  # 
  # 行列のトレース (trace) とは、対角要素の和です。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Matrix[[7,6], [3,9]].trace # => 16
  # //}
  # 
  # trace は正方行列でのみ定義されます。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def tr; end

  # --- unitary? -> bool
  # 行列がユニタリならば true を返します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行列が正方行列でない場合に発生します
  def unitary?; end

  # --- upper_triangular? -> bool
  # 行列が上三角行列ならば true を返します。
  def upper_triangular?; end

  # --- vstack -> Matrix
  # 
  # 行列 self と matrices を縦に並べた行列を生成します。
  # 
  # Matrix.vstack(self, *matrices) と同じです。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # x = Matrix[[1, 2], [3, 4]]
  # y = Matrix[[5, 6], [7, 8]]
  # x.vstack(y) # => Matrix[[1, 2], [3, 4], [5, 6], [7, 8]]
  # //}
  # 
  # @see [[m:Matrix.vstack]], [[m:Matrix#hstack]]
  def vstack; end

  # --- zero? -> bool
  # 行列が零行列ならば true を返します。
  def zero?; end

  # --- identity(n) -> Matrix
  # --- unit(n) -> Matrix
  # --- I(n) -> Matrix
  # 
  # n次の単位行列を生成します。
  # 
  # @param n 単位行列の次元
  # 
  # 単位行列とは、対角要素が全て1で非対角要素が全て0であるような行列のことです。
  def I; end

  # --- [](*rows) -> Matrix
  # 
  # rows[i] を第 i 行とする行列を生成します。
  # 
  # @param rows 行列の要素を数の配列の配列として渡します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # m = Matrix[[11, 12], [21, 22]]
  # p m  # => Matrix[[11, 12], [21, 22]]
  #      #    [11, 12]
  #      #    [21, 22]
  # //}
  def []; end

  # --- build(row_size, column_size = row_size) {|row, col| ... } -> Matrix
  # --- build(row_size, column_size = row_size) -> Enumerable
  # 
  # row_size×column_sizeの行列をブロックの返り値から生成します。
  # 
  # 行列の各要素の位置がブロックに渡され、それの返り値が行列の要素となります。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # m = Matrix.build(2, 4) {|row, col| col - row }
  #   # => Matrix[[0, 1, 2, 3], [-1, 0, 1, 2]]
  # m = Matrix.build(3) { rand }
  #   # => a 3x3 matrix with random elements
  # //}
  # 
  # @param row_size 行列の行数
  # @param column_size 行列の列数
  def build; end

  # --- column_vector(column) -> Matrix
  # 
  # 要素がcolumnの(n,1)型の行列(列ベクトル)を生成します。
  # 
  # @param column (n,1)型の行列として生成する[[c:Vector]] [[c:Array]] オブジェクト
  def column_vector; end

  # --- columns(columns) -> Matrix
  # 
  # 引数 columns を列ベクトルの集合とする行列を生成します。
  # 
  # @param columns 配列の配列を渡します。
  # 
  # === 注意
  # 
  # [[m:Matrix.rows]] との違いは引数として渡す配列の配列を列ベクトルの配列とみなして行列を生成します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # a1 = [1, 2, 3]
  # a2 = [4, 5, 6]
  # a3 = [-1, -2, -3]
  # 
  # # 配列を行ベクトルとして生成
  # m = Matrix.rows([a1, a2, a3], true)
  # p m # => Matrix[[1, 2, 3], [4, 5, 6], [-1, -2, -3]]
  #     # 行列としてのイメージ =>  [ 1,  2,  3]
  #     #                          [ 4,  5,  6]
  #     #                          [-1, -2, -3]
  # 
  # # 配列を列ベクトルとして生成
  # m = Matrix.columns([a1, a2, a3])
  # p m # => Matrix[[1, 4, -1], [2, 5, -2], [3, 6, -3]]
  #     # 行列としてのイメージ =>  [1, 4, -1]
  #     #                          [2, 5, -2]
  #     #                          [3, 6, -3]
  # //}
  def columns; end

  # --- combine(*matrices) {|*elements| ... } -> Matrix
  # --- combine(*matrices) -> Enumerator
  # 
  # 要素ごとにブロックを呼び出した結果を組み合わせた Matrix を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # x = Matrix[[6, 6], [4, 4]]
  # y = Matrix[[1, 2], [3, 4]]
  # Matrix.combine(x, y) {|a, b| a - b} # => Matrix[[5, 4], [1, 0]]
  # //}
  # 
  # @param matrices 並べる行列。すべての行列の行数と列数が一致していなければならない
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行や列の要素数が一致しない時に発生します
  # @see [[m:Matrix#combine]]
  def combine; end

  # --- diagonal(*values) -> Matrix
  # 
  # 対角要素がvaluesで、非対角要素が全て0であるような
  # 正方行列を生成します。
  # 
  # @param values 行列の対角要素
  # 
  # === 注意
  # 
  # valuesに一次元Arrayを1個指定すると、そのArrayを唯一の要素とした1×1の行列が生成されます。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # m = Matrix.diagonal(1, 2, 3)
  # p m # => Matrix[[1, 0, 0], [0, 2, 0], [0, 0, 3]]
  # a = [1,2,3]
  # m = Matrix.diagonal(a)
  # p m # => Matrix[[[1, 2, 3]]]
  # //}
  def diagonal; end

  # --- empty(row_size=0, column_size=0) -> Matrix
  # 要素を持たない行列を返します。
  # 
  # 「要素を持たない」とは、行数もしくは列数が0の行列のことです。
  # 
  # row_size 、 column_size のいずれか一方は0である必要があります。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # m = Matrix.empty(2, 0)
  # m == Matrix[ [], [] ]
  # # => true
  # n = Matrix.empty(0, 3)
  # n == Matrix.columns([ [], [], [] ])
  # # => true
  # m * n
  # # => Matrix[[0, 0, 0], [0, 0, 0]]
  # //}
  # 
  # @param row_size 行列の行数
  # @param column_size 行列の列数
  # @raise ArgumentError row_size, column_size が両方とも0でない場合に発生します
  def empty; end

  # --- hstack(*matrices) -> Matrix
  # 
  # 行列 matrices を横に並べた行列を生成します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # x = Matrix[[1, 2], [3, 4]]
  # y = Matrix[[5, 6], [7, 8]]
  # Matrix.hstack(x, y) # => Matrix[[1, 2, 5, 6], [3, 4, 7, 8]]
  # //}
  # 
  # @param matrices 並べる行列。すべての行列の行数が一致していなければならない
  # @raise ExceptionForMatrix::ErrDimensionMismatch 行数の異なる行列がある場合に発生します
  # @see [[m:Matrix.vstack]], [[m:Matrix#hstack]]
  def hstack; end

  # --- row_vector(row) -> Matrix
  # 
  # 要素がrowの(1,n)型の行列(行ベクトル)を生成します。
  # 
  # @param row (1,n)型の行列として生成する[[c:Vector]] [[c:Array]] オブジェクト
  def row_vector; end

  # --- rows(rows, copy = true) -> Matrix
  # 
  # 引数 rows を行ベクトルの列とする行列を生成します。
  # 
  # 引数 copy が偽(false)ならば、rows の複製を行いません。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # a1 = [1, 2, 3]
  # a2 = [10, 15, 20]
  # 
  # m = Matrix.rows([a1, a2], false) # 配列を複製せずに行列を生成
  # p m # => Matrix[[1, 2, 3], [10, 15, 20]]
  # a2[1] = 1000 # 配列のデータを変更
  # p m # => Matrix[[1, 2, 3], [10, 1000, 20]]
  # //}
  # 
  # @param rows 配列の配列
  # @param copy 配列を複製するかどうかを真偽値で指定
  def rows; end

  # --- scalar(n, value) -> Matrix
  # 
  # 対角要素が全てvalue(数)で、非対角要素が全て0であるようなn次の正方行列を生成します。
  # 
  # @param n     生成する行列の次元
  # @param value 生成する行列の対角要素の値
  # 
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # m = Matrix.scalar(3, 2.5)
  # p m # => Matrix[[2.5, 0, 0], [0, 2.5, 0], [0, 0, 2.5]]
  # //}
  def scalar; end

  # --- vstack(*matrices) -> Matrix
  # 
  # 行列 matrices を縦に並べた行列を生成します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # x = Matrix[[1, 2], [3, 4]]
  # y = Matrix[[5, 6], [7, 8]]
  # Matrix.vstack(x, y) # => Matrix[[1, 2], [3, 4], [5, 6], [7, 8]]
  # //}
  # 
  # @param matrices 並べる行列。すべての行列の列数が一致していなければならない
  # @raise ExceptionForMatrix::ErrDimensionMismatch 列数の異なる行列がある場合に発生します
  # @see [[m:Matrix.hstack]], [[m:Matrix#vstack]]
  def vstack; end

  # --- zero(n) -> Matrix
  # 
  # n × n の零行列（要素が全て 0 の行列）を生成して返します。
  # 
  # @param n 生成する正方零行列の次数
  def zero; end

end
