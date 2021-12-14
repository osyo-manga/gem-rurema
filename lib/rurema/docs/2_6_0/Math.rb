module Math
  # --- acos(x) -> Float
  # 
  # x の逆余弦関数の値をラジアンで返します。
  # 
  # @param x -1.0 <= x <= 1 の範囲内の実数
  # 
  # @return 返される値の範囲は [0, +π] です。
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.acos(0) == Math::PI/2  # => true
  # //}
  def acos; end

  # --- acosh(x) -> Float
  # 
  # x の逆双曲線余弦関数の値を返します。
  # 
  # === 定義
  # 
  #     acosh(x) = log(x + sqrt(x * x - 1)) [x >= 1]
  # 
  # @param x x >= 1 の範囲の実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def acosh; end

  # --- asin(x) -> Float
  # 
  # x の逆正弦関数の値をラジアンで返します。
  # 
  # @param x -1.0 <= x <= 1 の範囲内の実数
  # 
  # @return 返される値の範囲は[-π/2, +π/2] です。
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.asin(1) == Math::PI/2  # => true
  # //}
  def asin; end

  # --- asinh(x) -> Float
  # 
  # x の逆双曲線正弦関数の値を返します。
  # 
  # === 定義
  # 
  #     asinh(x) = log(x + sqrt(x * x + 1))
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def asinh; end

  # --- atan(x) -> Float
  # 
  # x の逆正接関数の値をラジアンで返します。
  # 
  # @param x 実数
  # 
  # @return 返される値の範囲は [-π/2, +π/2] です。
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.atan(0) # => 0.0
  # //}
  def atan; end

  # --- atan2(y, x) -> Float
  # 
  # y / x の逆正接関数の値を返します。
  # 
  # @param y 実数
  # @param x 実数
  # 
  # @return 返される値の範囲は [-π, π] です。
  # 
  # 
  # //emlist[例][ruby]{
  # Math.atan2(1,0)   #=>  1.5707963267949
  # Math.atan2(-1,0)  #=> -1.5707963267949
  # //}
  # 
  # @raise TypeError y, x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError y, x に実数以外の数値を指定した場合に発生します。
  def atan2; end

  # --- atanh(x) -> Float
  # 
  # x の逆双曲線正接関数の値を返します。
  # 
  # === 定義
  # 
  #     atanh(x) = log((1+x)/(1-x)) / 2     [-1 < x < 1]
  # 
  # @param x -1 < x < 1 の実数
  # 
  # @return 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def atanh; end

  # --- cbrt(x) -> Float
  # 
  # x の立方根を返します。
  # 
  # @param x 実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # -9.upto(9) {|x|
  #   p [x, Math.cbrt(x), Math.cbrt(x)**3]
  # }
  # # => [-9, -2.0800838230519, -9.0]
  # #   [-8, -2.0, -8.0]
  # #   [-7, -1.91293118277239, -7.0]
  # #   [-6, -1.81712059283214, -6.0]
  # #   [-5, -1.7099759466767, -5.0]
  # #   [-4, -1.5874010519682, -4.0]
  # #   [-3, -1.44224957030741, -3.0]
  # #   [-2, -1.25992104989487, -2.0]
  # #   [-1, -1.0, -1.0]
  # #   [0, 0.0, 0.0]
  # #   [1, 1.0, 1.0]
  # #   [2, 1.25992104989487, 2.0]
  # #   [3, 1.44224957030741, 3.0]
  # #   [4, 1.5874010519682, 4.0]
  # #   [5, 1.7099759466767, 5.0]
  # #   [6, 1.81712059283214, 6.0]
  # #   [7, 1.91293118277239, 7.0]
  # #   [8, 2.0, 8.0]
  # #   [9, 2.0800838230519, 9.0]
  # //}
  def cbrt; end

  # --- cos(x) -> Float
  # 
  # x の余弦関数の値を返します。
  # 
  # @param x 実数（ラジアンで与えます）
  # 
  # @return [-1, 1] の実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.cos(Math::PI) # => -1.0
  # //}
  def cos; end

  # --- cosh(x) -> Float
  # 
  # x の双曲線余弦関数の値を返します。
  # 
  # === 定義
  # 
  #     cosh(x) = (exp(x) + exp(-x)) / 2
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def cosh; end

  # --- erf(x) -> Float
  # x の誤差関数の値を返します。
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.erf(0) # => 0.0
  # //}
  def erf; end

  # --- erfc(x) -> Float
  # x の相補誤差関数の値を返します。
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.erfc(0) # => 1.0
  # //}
  def erfc; end

  # --- exp(x) -> Float
  # 
  # x の指数関数の値を返します。
  # 
  # すなわち e の x 乗の値を返します( e は自然対数の底)。
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.exp(0)       # => 1.0
  # Math.exp(1)       # => 2.718281828459045
  # Math.exp(1.5)     # => 4.4816890703380645
  # //}
  # 
  # @see [[man:exp(3)]]
  def exp; end

  # --- frexp(x) -> [Float, Integer]
  # 
  # 実数 x の仮数部と指数部の配列を返します。
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # fraction, exponent = Math.frexp(1234)   # => [0.6025390625, 11]
  # fraction * 2**exponent                  # => 1234.0
  # //}
  def frexp; end

  # --- gamma(x) -> Float
  # 
  # x のガンマ関数の値を返します。
  # 
  # @param x 実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に負の整数、もしくは -∞ を渡した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def fact(n) (1..n).inject(1) {|r,i| r*i } end
  # 1.upto(26) {|i| p [i, Math.gamma(i), fact(i-1)] }
  # # => [1, 1.0, 1]
  # #   [2, 1.0, 1]
  # #   [3, 2.0, 2]
  # #   [4, 6.0, 6]
  # #   [5, 24.0, 24]
  # #   [6, 120.0, 120]
  # #   [7, 720.0, 720]
  # #   [8, 5040.0, 5040]
  # #   [9, 40320.0, 40320]
  # #   [10, 362880.0, 362880]
  # #   [11, 3628800.0, 3628800]
  # #   [12, 39916800.0, 39916800]
  # #   [13, 479001600.0, 479001600]
  # #   [14, 6227020800.0, 6227020800]
  # #   [15, 87178291200.0, 87178291200]
  # #   [16, 1307674368000.0, 1307674368000]
  # #   [17, 20922789888000.0, 20922789888000]
  # #   [18, 355687428096000.0, 355687428096000]
  # #   [19, 6.402373705728e+15, 6402373705728000]
  # #   [20, 1.21645100408832e+17, 121645100408832000]
  # #   [21, 2.43290200817664e+18, 2432902008176640000]
  # #   [22, 5.109094217170944e+19, 51090942171709440000]
  # #   [23, 1.1240007277776077e+21, 1124000727777607680000]
  # #   [24, 2.5852016738885062e+22, 25852016738884976640000]
  # #   [25, 6.204484017332391e+23, 620448401733239439360000]
  # #   [26, 1.5511210043330954e+25, 15511210043330985984000000]
  # //}
  def gamma; end

  # --- hypot(x, y) -> Float
  # 
  # sqrt(x*x + y*y) を返します。
  # 
  # この値は x, y を直交する 2 辺とする直角三角形の斜辺（hypotenuse）の長さです。
  # 
  # @param x 実数
  # @param y 実数
  # 
  # @raise TypeError 引数のどちらかに数値以外を指定した場合に発生します。
  # 
  # @raise RangeError 引数のどちらかに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.hypot(3, 4) #=> 5.0
  # //}
  def hypot; end

  # --- ldexp(x, exp) -> Float
  # 
  # 実数 x に 2 の exp 乗をかけた数を返します。
  # 
  # @param x 実数
  # @param exp 整数。小数点以下切捨て。
  # 
  # @raise TypeError 引数のどちらかに数値以外を指定した場合に発生します。
  # 
  # @raise RangeError 引数のどちらかに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # fraction, exponent = Math.frexp(1234)
  # Math.ldexp(fraction, exponent)   # => 1234.0
  # //}
  def ldexp; end

  # --- lgamma(x) -> [Float, Integer]
  # 
  # log(|gamma(x)|) と、gamma(x) の符号を返します。
  # 
  # 符号は +1 もしくは -1 で返されます。
  # 
  # @param x 実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に -∞ を渡した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.lgamma(0) # => [Infinity, 1]
  # //}
  # 
  # @see [[m:Math.#gamma]]
  def lgamma; end

  # --- log(x) -> Float
  # --- log(x, b) -> Float
  # 
  # x の対数を返します。
  # 
  # 引数 x, b の両方に 0 を指定した場合は [[m:Float::NAN]] を返します。
  # 
  # @param x 正の実数を指定します。
  # 
  # @param b 底を指定します。省略した場合は自然対数を計算します。
  # 
  # @raise TypeError 引数のどちらかに数値以外を指定した場合に発生します。
  # 
  # @raise RangeError 引数のどちらかに実数以外の数値を指定した場合に発生します。
  # 
  # @raise DomainError 引数のどちらかに負の数を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.log(0)          # => -Infinity
  # Math.log(1)          # => 0.0
  # Math.log(Math::E)    # => 1.0
  # Math.log(Math::E**3) # => 3.0
  # Math.log(12, 3)      # => 2.2618595071429146
  # //}
  def log; end

  # --- log10(x) -> Float
  # 
  # x の常用対数を返します。
  # 
  # @param x 正の実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.log10(1)       # => 0.0
  # Math.log10(10)      # => 1.0
  # Math.log10(10**100) # => 100.0
  # //}
  def log10; end

  # --- log2(x) -> Float
  # 
  # 2 を底とする x の対数 (binary logarithm) を返します。
  # 
  # @param x 正の実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.log2(1)      # => 0.0
  # Math.log2(2)      # => 1.0
  # Math.log2(32768)  # => 15.0
  # Math.log2(65536)  # => 16.0
  # //}
  def log2; end

  # --- sin(x) -> Float
  # 
  # x の正弦関数の値を返します。
  # 
  # @param x 実数（ラジアンで与えます）
  # 
  # @return [-1, 1] の実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.sin(Math::PI/2) # => 1.0
  # //}
  def sin; end

  # --- sinh(x) -> Float
  # 
  # x の双曲線正弦関数の値を返します。
  # 
  # === 定義
  # 
  #     sinh(x) = (exp(x) - exp(-x)) / 2
  # 
  # @param x 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def sinh; end

  # --- sqrt(x) -> Float
  # 
  # x の平方根を返します。
  # 
  # @param x 正の実数
  # 
  # @raise TypeError xに数値以外を指定した場合に発生します。
  # 
  # @raise Math::DomainError x に範囲外の実数を指定した場合に発生します。
  # 
  # @raise RangeError xに実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # 0.upto(10) {|x|
  #   p [x, Math.sqrt(x), Math.sqrt(x)**2]
  # }
  # # => [0, 0.0, 0.0]
  # #   [1, 1.0, 1.0]
  # #   [2, 1.4142135623731, 2.0]
  # #   [3, 1.73205080756888, 3.0]
  # #   [4, 2.0, 4.0]
  # #   [5, 2.23606797749979, 5.0]
  # #   [6, 2.44948974278318, 6.0]
  # #   [7, 2.64575131106459, 7.0]
  # #   [8, 2.82842712474619, 8.0]
  # #   [9, 3.0, 9.0]
  # #   [10, 3.16227766016838, 10.0]
  # //}
  # 
  # @see [[m:Integer.sqrt]]
  def sqrt; end

  # --- tan(x) -> Float
  # 
  # x の正接関数の値を返します。
  # 
  # @param x 実数（ラジアンで与えます）
  # 
  # @return 実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Math.tan(0) # => 0.0
  # //}
  def tan; end

  # --- tanh(x) -> Float
  # 
  # x の双曲線正接関数の値を返します。
  # 
  # === 定義
  # 
  #     tanh(x) = sinh(x) / cosh(x)
  # 
  # @param x 実数
  # 
  # @return [-1, 1] の範囲の実数
  # 
  # @raise TypeError x に数値以外を指定した場合に発生します。
  # 
  # @raise RangeError x に実数以外の数値を指定した場合に発生します。
  def tanh; end

  # --- E -> Float
  # 
  # 自然対数の底
  # 
  # //emlist[例][ruby]{
  # p Math::E
  # # => 2.718281828
  # //}
  def E; end

  # --- PI -> Float
  # 
  # 円周率
  # 
  # //emlist[例][ruby]{
  # p Math::PI
  # # => 3.141592654
  # //}
  def PI; end

end
