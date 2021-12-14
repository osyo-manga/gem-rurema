class Rational
  # --- *(other) -> Rational | Float
  # 
  # 積を計算します。
  # 
  # @param other 自身に掛ける数
  # 
  # other に [[c:Float]] を指定した場合は、計算結果を [[c:Float]] で返しま
  # す。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # r * 2                # => (3/2)
  # r * 4                # => (3/1)
  # r * 0.5              # => 0.375
  # r * Rational(1, 2)   # => (3/8)
  # //}
  def *; end

  # --- **(other) -> Rational | Float
  # 
  # 冪(べき)乗を計算します。
  # 
  # @param other 自身を other 乗する数
  # 
  # other に [[c:Float]] を指定した場合は、計算結果を [[c:Float]] で返しま
  # す。other が有理数であっても、計算結果が無理数だった場合は [[c:Float]]
  # を返します。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # r ** Rational(2, 1)  # => (9/16)
  # r ** 2               # => (9/16)
  # r ** 2.0             # => 0.5625
  # r ** Rational(1, 2)  # => 0.866025403784439
  # //}
  def **; end

  # --- +(other) -> Rational | Float
  # 
  # 和を計算します。
  # 
  # @param other 自身に足す数
  # 
  # other に [[c:Float]] を指定した場合は、計算結果を [[c:Float]] で返しま
  # す。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # r + Rational(1, 2)     # => (5/4)
  # r + 1                  # => (7/4)
  # r + 0.5                # => 1.25
  # //}
  def +; end

  # --- -(other) -> Rational | Float
  # 
  # 差を計算します。
  # 
  # @param other 自身から引く数
  # 
  # other に [[c:Float]] を指定した場合は、計算結果を [[c:Float]] で返しま
  # す。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # r - 1                # => (-1/4)
  # r - 0.5              # => 0.25
  # //}
  def -; end

  # --- -@ -> Rational
  # 
  # 単項演算子の - です。
  # self の符号を反転させたものを返します。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # - r           # => (-3/4)
  # //}
  def -@; end

  # --- /(other)   -> Rational | Float
  # --- quo(other) -> Rational | Float
  # 
  # 商を計算します。
  # 
  # @param other 自身を割る数
  # 
  # other に [[c:Float]] を指定した場合は、計算結果を [[c:Float]] で返します。
  # 
  # //emlist[例][ruby]{
  # r = Rational(3, 4)
  # r / 2                # => (3/8)
  # r / 2.0              # => 0.375
  # r / 0.5              # => 1.5
  # r / Rational(1, 2)   # => (3/2)
  # r / 0                # => ZeroDivisionError
  # //}
  # 
  # @raise ZeroDivisionError other が 0 の時に発生します。
  # 
  # @see [[m:Numeric#quo]]
  def /; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self と other を比較して、self が大きい時に 1、等しい時に 0、小さい時に
  # -1 を返します。比較できない場合はnilを返します。
  # 
  # @param other 自身と比較する数値
  # 
  # @return      -1 か 0 か 1 か nil を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(2, 3)  <=> Rational(2, 3)  # => 0
  # Rational(5)     <=> 5               # => 0
  # Rational(2, 3)  <=> Rational(1,3)   # => 1
  # Rational(1, 3)  <=> 1               # => -1
  # Rational(1, 3)  <=> 0.3             # => 1
  # Rational(1, 3)  <=> nil             # => nil
  # //}
  def <=>; end

  # --- ==(other) -> bool
  # 
  # 数値として等しいか判定します。
  # 
  # @param other 自身と比較する数値
  # 
  # @return      self と other が等しい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(2, 3)  == Rational(2, 3)   # => true
  # Rational(5)     == 5                # => true
  # Rational(0)     == 0.0              # => true
  # Rational('1/3') == 0.33             # => false
  # Rational('1/2') == '1/2'            # => false
  # //}
  def ==; end

  # --- abs       -> Rational
  # --- magnitude -> Rational
  # 
  # 自身の絶対値を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(1, 2).abs     # => (1/2)
  # Rational(-1, 2).abs    # => (1/2)
  # //}
  def abs; end

  # --- ceil(precision = 0) -> Integer | Rational
  # 
  # 自身と等しいかより大きな整数のうち最小のものを返します。
  # 
  # @param precision 計算結果の精度
  # 
  # @raise TypeError precision に整数以外のものを指定すると発生します。
  # 
  # //emlist[例][ruby]{
  # Rational(3).ceil      # => 3
  # Rational(2, 3).ceil   # => 1
  # Rational(-3, 2).ceil  # => -1
  # //}
  # 
  # precision を指定した場合は指定した桁数の数値と、上述の性質に最も近い整
  # 数か [[c:Rational]] を返します。
  # 
  # //emlist[例][ruby]{
  # Rational('-123.456').ceil(+1)       # => (-617/5)
  # Rational('-123.456').ceil(+1).to_f  # => -123.4
  # Rational('-123.456').ceil(0)        # => -123
  # Rational('-123.456').ceil(-1)       # => -120
  # //}
  # 
  # @see [[m:Rational#floor]], [[m:Rational#round]], [[m:Rational#truncate]]
  def ceil; end

  # --- coerce(other) -> Array
  # 
  # 自身と other が同じクラスになるよう、自身か other を変換し [other, self] という
  # 配列にして返します。
  # 
  # @param other 比較または変換するオブジェクト
  # 
  # //emlist[例][ruby]{
  # Rational(1).coerce(2)   # => [(2/1), (1/1)]
  # Rational(1).coerce(2.2) # => [2.2, 1.0]
  # //}
  def coerce; end

  # --- convert(*arg) -> Rational
  # 
  # 引数を有理数([[c:Rational]])に変換した結果を返します。
  # 
  # @param arg 変換対象のオブジェクトです。
  # 
  # [[m:Kernel.#Rational]] の本体です。
  # 
  # @see [[m:Kernel.#Rational]]
  def convert; end

  # --- denominator -> Integer
  # 
  # 分母を返します。常に正の整数を返します。
  # 
  # @return 分母を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(7).denominator       # => 1
  # Rational(7, 1).denominator    # => 1
  # Rational(9, -4).denominator   # => 4
  # Rational(-2, -10).denominator # => 5
  # //}
  # 
  # @see [[m:Rational#numerator]]
  def denominator; end

  # --- fdiv(other) -> Float
  # 
  # self を other で割った商を [[c:Float]] で返します。
  # other に虚数を指定することは出来ません。
  # 
  # @param other 自身を割る数
  # 
  # //emlist[例][ruby]{
  # Rational(2, 3).fdiv(1)   # => 0.6666666666666666
  # Rational(2, 3).fdiv(0.5) # => 1.3333333333333333
  # Rational(2).fdiv(3)      # => 0.6666666666666666
  # 
  # Rational(1).fdiv(Complex(1, 0))  # => 1.0
  # Rational(1).fdiv(Complex(0, 1))  # => RangeError
  # //}
  def fdiv; end

  # --- floor(precision = 0) -> Integer | Rational
  # 
  # 自身と等しいかより小さな整数のうち最大のものを返します。
  # 
  # @param precision 計算結果の精度
  # 
  # @raise TypeError precision に整数以外のものを指定すると発生します。
  # 
  # //emlist[例][ruby]{
  # Rational(3).floor     # => 3
  # Rational(2, 3).floor  # => 0
  # Rational(-3, 2).floor # => -2
  # //}
  # 
  # [[m:Rational#to_i]] とは違う結果を返す事に注意してください。
  # 
  # //emlist[例][ruby]{
  # Rational(+7, 4).to_i  # => 1
  # Rational(+7, 4).floor # => 1
  # Rational(-7, 4).to_i  # => -1
  # Rational(-7, 4).floor # => -2
  # //}
  # 
  # precision を指定した場合は指定した桁数の数値と、上述の性質に最も近い整
  # 数か [[c:Rational]] を返します。
  # 
  # //emlist[例][ruby]{
  # Rational('-123.456').floor(+1)       # => (-247/2)
  # Rational('-123.456').floor(+1).to_f  # => -123.5
  # Rational('-123.456').floor(0)        # => -124
  # Rational('-123.456').floor(-1)       # => -130
  # //}
  # 
  # @see [[m:Rational#ceil]], [[m:Rational#round]], [[m:Rational#truncate]]
  def floor; end

  # --- hash -> Integer
  # 
  # 自身のハッシュ値を返します。
  # 
  # @return ハッシュ値を返します。
  # 
  # 
  # @see [[m:Object#hash]]
  def hash; end

  # --- inspect -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # "(3/5)", "(-17/7)" のように10進数の表記を返します。
  # 
  # @return 有理数の表記にした文字列を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(5, 8).inspect  # => "(5/8)"
  # Rational(2).inspect     # => "(2/1)"
  # Rational(-8, 6).inspect # => "(-4/3)"
  # Rational(0.5).inspect   # => "(1/2)"
  # //}
  # 
  # @see [[m:Rational#to_s]]
  def inspect; end

  # --- marshal_dump -> Array
  # 
  # [[m:Marshal.#load]] のためのメソッドです。
  # Rational::compatible#marshal_load で復元可能な配列を返します。
  # 
  # [注意] Rational::compatible は通常の方法では参照する事ができません。
  def marshal_dump; end

  # --- negative? -> bool
  # 
  # self が 0 未満の場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(1, 2).negative?  # => false
  # Rational(-1, 2).negative? # => true
  # //}
  # 
  # @see [[m:Rational#positive?]]
  def negative?; end

  # --- numerator -> Integer
  # 
  # 分子を返します。
  # 
  # @return 分子を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(7).numerator       # => 7
  # Rational(7, 1).numerator    # => 7
  # Rational(9, -4).numerator   # => -9
  # Rational(-2, -10).numerator # => 1
  # //}
  # 
  # @see [[m:Rational#denominator]]
  def numerator; end

  # --- positive? -> bool
  # 
  # self が 0 より大きい場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(1, 2).positive?  # => true
  # Rational(-1, 2).positive? # => false
  # //}
  # 
  # @see [[m:Rational#negative?]]
  def positive?; end

  # --- rationalize(eps = 0) -> Rational
  # 
  # 自身から eps で指定した許容誤差の範囲に収まるような [[c:Rational]] を返
  # します。
  # 
  # eps を省略した場合は self を返します。
  # 
  # @param eps 許容する誤差
  # 
  # //emlist[例][ruby]{
  # r = Rational(5033165, 16777216)
  # r.rationalize                   # => (5033165/16777216)
  # r.rationalize(Rational(0.01))   # => (3/10)
  # r.rationalize(Rational(0.1))    # => (1/3)
  # //}
  def rationalize; end

  # --- round(precision = 0) -> Integer | Rational
  # 
  # 自身ともっとも近い整数を返します。
  # 
  # 中央値 0.5, -0.5 はそれぞれ 1,-1 に切り上げされます。
  # 
  # @param precision 計算結果の精度
  # 
  # @raise TypeError precision に整数以外のものを指定すると発生します。
  # 
  # //emlist[例][ruby]{
  # Rational(3).round     # => 3
  # Rational(2, 3).round  # => 1
  # Rational(-3, 2).round # => -2
  # //}
  # 
  # precision を指定した場合は指定した桁数の数値と、上述の性質に最も近い整
  # 数か [[c:Rational]] を返します。
  # 
  # //emlist[例][ruby]{
  # Rational('-123.456').round(+1)      # => (-247/2)
  # Rational('-123.456').round(+1).to_f # => -123.5
  # Rational('-123.456').round(0)       # => -123
  # Rational('-123.456').round(-1)      # => -120
  # Rational('-123.456').round(-2)      # => -100
  # //}
  # 
  # @see [[m:Rational#ceil]], [[m:Rational#floor]], [[m:Rational#truncate]]
  def round; end

  # --- to_d(nFig)     -> BigDecimal
  # 
  # 自身を [[c:BigDecimal]] に変換します。
  # 
  # nFig 桁まで計算を行います。
  # 
  # @param nFig 計算を行う桁数
  # 
  # @return [[c:BigDecimal]] に変換したオブジェクト
  # 
  # @raise ArgumentError nFig に 0 以下を指定した場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # require "bigdecimal/util"
  # p Rational(1, 3).to_d(3)  # => 0.333e0
  # p Rational(1, 3).to_d(10) # => 0.3333333333e0
  # //}
  def to_d; end

  # --- to_f -> Float
  # 
  # 自身の値を最も良く表現する [[c:Float]] に変換します。
  # 
  # 絶対値が極端に小さい、または大きい場合にはゼロや無限大が返ることがあります。
  # 
  # @return [[c:Float]] を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(2).to_f             # => 2.0
  # Rational(9, 4).to_f          # => 2.25
  # Rational(-3, 4).to_f         # => -0.75
  # Rational(20, 3).to_f         # => 6.666666666666667
  # Rational(1, 10**1000).to_f   # => 0.0
  # Rational(-1, 10**1000).to_f  # => -0.0
  # Rational(10**1000).to_f      # => Infinity
  # Rational(-10**1000).to_f     # => -Infinity
  # //}
  def to_f; end

  # --- to_i -> Integer
  # --- truncate(precision = 0) -> Rational | Integer
  # 
  # 小数点以下を切り捨てて値を整数に変換します。
  # 
  # @param precision 計算結果の精度
  # 
  # @raise TypeError precision に整数以外のものを指定すると発生します。
  # 
  # //emlist[例][ruby]{
  # Rational(2, 3).to_i   # => 0
  # Rational(3).to_i      # => 3
  # Rational(300.6).to_i  # => 300
  # Rational(98, 71).to_i # => 1
  # Rational(-31, 2).to_i # => -15
  # //}
  # 
  # precision を指定した場合は指定した桁数で切り捨てた整数か
  # [[c:Rational]] を返します。
  # 
  # //emlist[例][ruby]{
  # Rational('-123.456').truncate(+1)       # => (-617/5)
  # Rational('-123.456').truncate(+1).to_f  # => -123.4
  # Rational('-123.456').truncate(0)        # => -123
  # Rational('-123.456').truncate(-1)       # => -120
  # //}
  # 
  # @see [[m:Rational#ceil]], [[m:Rational#floor]]
  def to_i; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数はそのまま [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  #             に渡されます。
  # 
  # //emlist[例][ruby]{
  # require 'json/add/rational'
  # Rational(1, 3).to_json # => "{\"json_class\":\"Rational\",\"n\":1,\"d\":3}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_r -> Rational
  # 
  # 自身を返します。
  # 
  # @return 自身を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(3, 4).to_r  # => (3/4)
  # Rational(8).to_r     # => (8/1)
  # //}
  def to_r; end

  # --- to_s -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # "3/5", "-17/7" のように10進数の表記を返します。
  # 
  # @return 有理数の表記にした文字列を返します。
  # 
  # //emlist[例][ruby]{
  # Rational(3, 4).to_s  # => "3/4"
  # Rational(8).to_s     # => "8/1"
  # Rational(-8, 6).to_s # => "-4/3"
  # Rational(0.5).to_s   # => "1/2"
  # //}
  # 
  # @see [[m:Rational#inspect]]
  def to_s; end

  # --- json_create(hash) -> Rational
  # 
  # JSON のオブジェクトから [[c:Rational]] のオブジェクトを生成して返します。
  # 
  # @param hash 分子をキー 'n'、分母をキー 'd' に持つハッシュを指定します。
  def json_create; end

end
