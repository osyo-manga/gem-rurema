class Vector
  # --- *(other) -> Vector
  # 
  # self の各要素に数 other を乗じたベクトルを返します。
  # 
  # @param other self の各要素に掛ける [[c:Numeric]] オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a = [1, 2, 3.5, 100]
  # v1 = Vector.elements(a)
  # p v1.*(2)     # => Vector[2, 4, 7.0, 200]
  # p v1.*(-1.5)  # => Vector[-1.5, -3.0, -5.25, -150.0]
  # //}
  # 
  # --- *(m) -> Matrix
  # 
  # 自分自身を列ベクトル(行列)に変換して (実際には [[m:Matrix.column_vector]](self) を適用) から、行列 m を右から乗じた行列 ([[c:Matrix]] クラス) を返します。
  # 
  # @param m 右から乗算を行う行列
  # @raise ExceptionForMatrix::ErrDimensionMismatch 次元が合わない場合に発生します
  # 
  # === 注意
  # 
  # 引数の行列 m は自分自身を列ベクトルとした場合に乗算が定義できる行列である必要があります。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector[1, 2]
  # a = [4, 5, 6]
  # m = Matrix[a]
  # 
  # p v * m # => Matrix[[4, 5, 6], [8, 10, 12]]
  # //}
  def *; end

  # --- +(v) -> Vector | Matrix
  # 
  # self にベクトル v を加えたベクトルを返します。
  # 
  # v には column_size が 1 の [[c:Matrix]] オブジェクトも指定できます。
  # その場合は返り値も [[c:Matrix]] オブジェクトになります。
  # 
  # @param v 加算するベクトル。加算可能な行列やベクトルを指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  def +; end

  # --- +@ -> self
  # 
  # 単項演算子の + です。 self を返します。
  def +@; end

  # --- -(v) -> Vector | Matrix
  # 
  # self からベクトル v を減じたベクトルを返します。
  # 
  # v には column_size が 1 の [[c:Matrix]] オブジェクトも指定できます。
  # その場合は返り値も [[c:Matrix]] オブジェクトになります。
  # 
  # @param v 減算するベクトル。減算可能な行列やベクトルを指定します。
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  def -; end

  # --- -@ -> self
  # 
  # 単項演算子の - です。 各要素の符号を反転したベクトルを返します。
  def -@; end

  # --- /(other) -> Vector
  # 
  # self の各要素を数 other で割ったベクトルを返します。
  # 
  # @param other self の各要素を割る [[c:Numeric]] オブジェクトを指定します。
  # @raise ExceptionForMatrix::ErrOperationNotDefined other が Vector や Matrix
  #        の場合に発生します
  def /; end

  # --- ==(v) -> bool
  # --- eql?(v) -> bool
  # 
  # 自分自身と引数 v を比較し、true/false を返します。
  # 
  # @param v 比較対象ベクトル
  def ==; end

  # --- [](i) -> object | nil
  # --- element(i) -> object | nil
  # --- component(i) -> object | nil
  # i 番目の要素を返します。インデックスは 0 から開始します。
  # 要素が存在しないインデックスを指定した時には nil を返します。
  # 
  # @param i 取得する要素のインデックスを整数値で指定します。
  #          インデックスは 0 から始めます。
  def []; end

  # --- []=(index, value)
  # 
  # index 番目の要素を value に変更します。
  # 
  # @param index インデックスを整数で指定します。
  # @param value 設定したい要素の値を指定します。
  # @raise TypeError ベクトルの範囲外にある整数を指定したときに、発生します。
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # 
  # v = Vector[0, 0, 0, 0, 0]
  # 
  # v[1] = 2
  # p v #=> Vector[0, 2, 0, 0, 0]
  # 
  # v[-1] = 3
  # p v #=> Vector[0, 2, 0, 0, 3]
  # 
  # v[99] = 100
  # # IndexError: given index 99 is outside of -5...5
  # //}
  # 
  # --- []=(range, v)
  # 
  # [[c:Range]] オブジェクト range の範囲にある要素を v の内容に置換します。
  # 
  # @param range 設定したい配列の範囲を [[c:Range]] オブジェクトで指定します。
  # @param v range の範囲に設定したい要素を指定します。
  #          [[c:Vector]] や 1行の [[c:Matrix]] での指定もできます。
  # @raise TypeError ベクトルの範囲外にある range を指定したときに、発生します。
  # @raise ArgumentError 引数の個数が異なるときの他に、
  #                      v に [[c:Vector]] を指定し、range と v のサイズが一致しないときに発生します。
  # @raise Matrix::ErrDimensionMismatch v に [[c:Matrix]] を指定し、次元が合わないときに発生します。
  # 
  # //emlist[][ruby]{
  # require 'matrix'
  # 
  # v = Vector[0, 0, 0, 0, 0]
  # 
  # v[1..2] = 5
  # p v #=> Vector[0, 5, 5, 0, 0]
  # 
  # v[1..3] = Vector[2, 4, 8]
  # p v #=> Vector[0, 2, 4, 8, 0]
  # 
  # v[1..-2] = Matrix[[3, 6, 9]]
  # p v #=> Vector[0, 3, 6, 9, 0]
  # //}
  def []=; end

  # --- angle_with(v) -> Float
  # 
  # v と self がなす角度を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Vector[1, 0].angle_with(Vector[0, 1]) # => Math::PI/2
  # //}
  # 
  # @param v このベクトルと self とがなす角度を計算します
  # @raise ZeroVectorError self もしくは v のどちらかが零ベクトルである場合に
  #        発生します
  # @raise ExceptionForMatrix::ErrDimensionMismatch v と self の
  #        ベクトルの次元が異なる場合に発生します。
  def angle_with; end

  # --- collect {|x| ... } -> Vector
  # --- map {|x| ... } -> Vector
  # --- collect -> Enumerator
  # --- map -> Enumerator
  # 
  # ベクトルの各要素に対してブロックを評価した結果を、要素として持つベクトルを生成します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a = [1, 2, 3.5, -10]
  # v1 = Vector.elements(a)
  # p v1 # => Vector[1, 2, 3.5, -10]
  # v2 =  v1.map{|x|
  #   x * -1
  # }
  # p v2 # => Vector[-1, -2, -3.5, 10]
  # //}
  def collect; end

  # --- collect! {|element| ... } -> self
  # --- map! {|element| ... } -> self
  # --- collect! -> Enumerator
  # --- map! -> Enumerator
  # 
  # ベクトルの各要素を順番にブロックに渡して評価し、その結果で要素を置き換えます。
  # 
  # ブロックのない場合は、自身と map! から生成した [[c:Enumerator]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector[1, 2, 3]
  # p v.map!{ |el| el * 2 }  #=> Vector[2, 4, 6]
  # p v                      #=> Vector[2, 4, 6]
  # //}
  def collect!; end

  # --- collect2(v) {|x, y| ... } -> Array
  # --- collect2(v) -> Enumerator
  # 
  # ベクトルの各要素と引数 v の要素との組に対してブロックを評価し、その結果を要素として持つ配列を返します。
  # 
  # ベクトルの各要素と、それに対応するインデックスを持つ引数 v (ベクトル or 配列)の要素との組に対して (2引数の) ブロックを評価し、その結果を要素として持つ配列を返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param v ブロック内で評価される(ベクトル or 配列)
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  # 
  # @see [[m:Vector#map2]]
  # 
  # 次の例は、２つのベクトルの要素毎の積を要素とする配列を生成します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v1 = Vector[2, 3, 5]
  # v2 = Vector[7, 9, 11]
  # a = Array[7, 9, 11]
  # 
  # z = v1.collect2(v2){ |x, y| x * y }
  # p z # => [14, 27, 55]
  # 
  # z = v1.collect2(a) { |x, y| x * y } # Array でも OK
  # p z # => [14, 27, 55]
  # //}
  def collect2; end

  # --- covector -> Matrix
  # [[c:Matrix]] オブジェクトへ変換します。
  # 
  # 列ベクトル (行列)、すなわち、(n, 1) 型の行列に変換します。
  # 実際には [[m:Matrix.row_vector]](self) を適用します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector[2, 3, 5]
  # p v # => Vector[2, 3, 5]
  # m = v.covector
  # p m # => Matrix[[2, 3, 5]]
  # //}
  def covector; end

  # --- cross_product(*vs) -> Vector
  # --- cross(*vs) -> Vector
  # 
  # self とベクトル vs とのクロス積を返します。
  # 
  # self が3次元ベクトル空間のときは
  # 普通のクロス積です。
  # それ以外の場合は拡張されたクロス積で
  # n-1個のn次元ベクトルが張る空間と
  # 直交するベクトルを返します。
  # 
  # self の次元が n であるとき、 vs は n-2 個の
  # n次元ベクトルでなければなりません。
  # 
  # @param vs クロス積を取るベクトルの集合
  # @raise ExceptionForMatrix::ErrOperationNotDefined self の
  #         次元が1以下であるときに発生します。
  # @raise ArgumentError vs のベクトルの個数が n-2 以外である場合に発生します。
  def cross; end

  # --- inner_product(v) -> Float
  # --- dot(v) -> Float
  # 
  # ベクトル v との内積を返します。
  # 
  # @param v 内積を求めるベクトル
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  def dot; end

  # --- each{|e| ... } -> self
  # --- each -> Enumerator
  # ベクトルの各要素をブロックの引数として順にブロックを呼び出します。
  # 
  # このクラスは [[c:Enumerable]] を include しているため、
  # このメソッドを経由して Enumerable の各メソッドを使うことができます。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  def each; end

  # --- each2(v) {|x, y| ... } -> self
  # --- each2(v) -> Enumerator
  # 
  # ベクトルの各要素と、それに対応するインデックスを持つ引数 v の要素との組に対して (2引数の) ブロックを繰返し評価します。
  # 
  # v は配列互換(size メソッドと [] メソッドを持つ)オブジェクトです。
  # [[c:Vector]] も使えます。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param v 各要素と組を取るためのオブジェクト
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  # @see [[m:Array#zip]]
  def each2; end

  # --- elements_to_f -> Vector
  # ベクトルの各成分を[[c:Float]]に変換したベクトルを返します。
  # 
  # このメソッドは deprecated です。 map(&:to_f) を使ってください。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector.elements([2, 3, 5, 7, 9])
  # p v.elements_to_f
  # # => Vector[2.0, 3.0, 5.0, 7.0, 9.0]
  # //}
  def elements_to_f; end

  # --- elements_to_i -> Vector
  # ベクトルの各成分を[[c:Integer]]に変換したベクトルを返します。
  # 
  # このメソッドは deprecated です。 map(&:to_i) を使ってください。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # v = Vector.elements([2.5, 3.0, 5.01, 7])
  # p v.elements_to_i
  # # => Vector[2, 3, 5, 7]
  # //}
  def elements_to_i; end

  # --- elements_to_r -> Vector
  # ベクトルの各成分を[[c:Rational]]に変換したベクトルを返します。
  # 
  # このメソッドは deprecated です。 map(&:to_r) を使ってください。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector.elements([2.5, 3.0, 5.75, 7])
  # p v.elements_to_r
  # # => Vector[(5/2), (3/1), (23/4), (7/1)]
  # //}
  def elements_to_r; end

  # --- hash -> Integer
  # 
  # 自分自身のハッシュ値を返します。
  def hash; end

  # --- independent?(*vectors) -> bool
  # 
  # self とベクトルの列 vectors が線形独立であれば true を返します。
  # 
  #   require 'matrix'
  #   Vector.independent?(self, *vectors)
  # 
  # と同じです。
  # 
  # @param vectors 線形独立性を判定するベクトル列
  def independent?; end

  # --- inspect -> String
  # 
  # オブジェクトの内容を文字列化します。
  def inspect; end

  # --- r -> Float
  # --- magnitude -> Float
  # --- norm -> Float
  # 
  # ベクトルの大きさ（ノルム）を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Vector[3, 4].norm # => 5.0
  # Vector[Complex(0, 1), 0].norm # => 1.0
  # //}
  # 
  # @see [[m:Vector#normalize]]
  def magnitude; end

  # --- map2(v) {|x, y| ... } -> Vector
  # 
  # ベクトルの各要素と引数 v の要素との組に対してブロックを評価し、その結果を要素として持つベクトルを返します。
  # 
  # ベクトルの各要素と、それに対応するインデックスを持つ引数 (ベクトル or 配列) の要素との組に対して (2引数の) ブロックを評価した結果を、要素として持つベクトルを返します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param v ブロック内で評価される(ベクトル or 配列)
  # 
  # @raise ExceptionForMatrix::ErrDimensionMismatch 自分自身と引数のベクト
  #        ルの要素の数(次元)が異なっていたときに発生します。
  # 
  # @see [[m:Vector#collect2]]
  # 
  # 次の例は、２つのベクトルの要素毎の積を要素として持つベクトルを生成します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v1 = Vector[2, 3, 5]
  # v2 = Vector[7, 9, 11]
  # a = Array[7, 9, 11]
  # 
  # z = v1.map2(v2) { |x, y| x * y }
  # p z # => Vector[14, 27, 55]
  # 
  # z = v1.map2(a) { |x, y| x * y } # Array でも OK
  # p z # => Vector[14, 27, 55]
  # //}
  def map2; end

  # --- normalize -> Vector
  # 自身を [[m:Vector#norm]] で正規化したベクトルを返します。
  # 
  # @raise Vector::ZeroVectorError ベクトルが0である場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # v = Vector[2, 6, 9].normalize
  # # => Vector[0.18181818181818182, 0.5454545454545454, 0.8181818181818182]
  # v.norm # => 1.0
  # //}
  # 
  # @see [[m:Vector#norm]]
  def normalize; end

  # --- size -> Integer
  # 
  # ベクトルの要素数(次元)を返します。
  def size; end

  # --- to_a -> Array
  # 
  # ベクトル([[c:Vector]])から配列 ([[c:Array]]) に変換します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector[2, 3, 5, 7, 9]
  # p v.to_a
  # # => [2, 3, 5, 7, 9]
  # //}
  def to_a; end

  # --- to_s -> String
  # 
  # ベクトル([[c:Vector]])から文字列 ([[c:String]]) に変換します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # 
  # v = Vector[2, 3, 5, 7, 9]
  # p v.to_s
  # # => "Vector[2, 3, 5, 7, 9]"
  # //}
  def to_s; end

  # --- zero? -> bool
  # 
  # すべての要素がゼロであれば true を返します。
  def zero?; end

  # --- [](*a) -> Vector
  # 
  # 可変個引数を要素とするベクトルを生成します。
  # 
  # Vector[a1, a2, a3, ... ]としたとき、 引数a1, a2, a3, ... を要素とするベクトルを生成します。
  # 
  # @param a ベクトルの要素
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # v1 = Vector[1, 3, 5, 7]
  # v2 = Vector[5.25, 10.5]
  # p v1   # => Vector[1, 3, 5, 7]
  # p v2   # => Vector[5.25, 10.5]
  # //}
  def []; end

  # --- basis(size:, index:) -> Vector
  # 
  # size 次元ベクトル空間の index 番目の標準基底を返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Vector.basis(size: 3, index: 1) # => Vector[0, 1, 0]
  # //}
  # 
  # @param size ベクトルの次元
  # @param index 標準基底の何番目か。0 origin
  def basis; end

  # --- elements(a, copy = true) -> Vector
  # 
  # 配列 a を要素とするベクトルを生成します。
  # ただし、オプション引数 copy が偽 (false) ならば、複製を行いません。
  # 
  # @param a     [[c:Vector]]を生成する際の要素の配列
  # @param copy  引数の配列 a のコピーをするかどうかのフラグ
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # a = [1, 2, 3, 4]
  # v1 = Vector.elements(a, true)
  # v2 = Vector.elements(a, false)
  # p v1        # => Vector[1, 2, 3, 4]
  # p v2        # => Vector[1, 2, 3, 4]
  # a[0] = -1
  # p v1        # => Vector[1, 2, 3, 4]
  # p v2        # => Vector[-1, 2, 3, 4]
  # //}
  def elements; end

  # --- independent?(*vectors) -> bool
  # 
  # ベクトルの列 vectors が線形独立であれば true を返します。
  # 
  # @param vectors 線形独立性を判定するベクトル列
  def independent?; end

  # --- Vector.zero(size) -> Vector
  # 
  # 零ベクトルを返します。
  # 
  # //emlist[例][ruby]{
  # require 'matrix'
  # Vector.zero(3) # => Vector[0, 0, 0]
  # //}
  # 
  # @param size ベクトルの次元
  def zero; end

end
