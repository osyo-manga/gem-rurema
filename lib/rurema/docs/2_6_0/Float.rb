class Float
  # --- %(other) -> Float
  # --- modulo(other) -> Float
  # 算術演算子。剰余を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 剰余
  # 3.0 % 1.2   # => 0.6000000000000001
  # 3.0 % 0.0   # ZeroDivisionError
  # //}
  def %; end

  # --- *(other) -> Float
  # 算術演算子。積を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 積
  # 2.4 * 3   # => 7.2
  # //}
  def *; end

  # --- **(other) -> Float
  # 算術演算子。冪を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 冪
  # 1.2 ** 3.0  # => 1.7279999999999998
  # 3.0 + 4.5 - 1.3 / 2.4 * 3 % 1.2 ** 3.0 # => 5.875
  # 0.0 ** 0 # => 1.0
  # //}
  def **; end

  # --- +(other) -> Float
  # 算術演算子。和を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 和
  # 3.0 + 4.5 # => 7.5
  # //}
  def +; end

  # --- -(other) -> Float
  # 算術演算子。差を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 差
  # 4.5 - 1.3 # => 3.2
  # //}
  def -; end

  # --- -@    -> Float
  # 
  # 単項演算子の - です。
  # self の符号を反転させたものを返します。
  # 
  # //emlist[例][ruby]{
  # - 1.2   # => -1.2
  # - -1.2  # => 1.2
  # //}
  def -@; end

  # --- /(other) -> Float
  # 算術演算子。商を計算します。
  # 
  # @param other 二項演算の右側の引数(対象)
  # 
  # //emlist[例][ruby]{
  # # 商
  # 1.3 / 2.4 # => 0.541666666666667
  # 1.0 / 0   # => Infinity
  # //}
  def /; end

  # --- <(other)  -> bool
  # 比較演算子。数値として小さいか判定します。
  # 
  # @param other 比較対象の数値
  # @return      self よりも other が大きい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14 <  3.1415  # => true
  # 3.14 <= 3.1415  # => true
  # //}
  def <; end

  # --- <=(other) -> bool
  # 比較演算子。数値として等しいまたは小さいか判定します。
  # 
  # @param other 比較対象の数値
  # @return      self よりも other の方が大きい場合か、
  #              両者が等しい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14 <  3.1415  # => true
  # 3.14 <= 3.1415  # => true
  # //}
  def <=; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # self と other を比較して、self が大きい時に正、
  # 等しい時に 0、小さい時に負の整数を返します。
  # 比較できない場合はnilを返します
  # 
  # //emlist[例][ruby]{
  # 3.05 <=> 3.14     # => -1
  # 1.732 <=> 1.414   # => 1
  # 3.3 - 3.3 <=> 0.0 # => 0
  # 3.14 <=> "hoge"   # => nil
  # 3.14 <=> 0.0/0.0  # => nil
  # //}
  def <=>; end

  # --- ==(other) -> bool
  # 
  # 比較演算子。数値として等しいか判定します。
  # 
  # @param other 比較対象の数値
  # 
  # @return      self と other が等しい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14 == 3.14000 # => true
  # 3.14 == 3.1415  # => false
  # //}
  # 
  # NaNどうしの比較は、未定義です。
  # //emlist[例][ruby]{
  # Float::NAN == Float::NAN      # => false
  # [Float::NAN] == [Float::NAN]  # => true
  # [Float::NAN] == [0.0 / 0.0]   # => false
  # //}
  def ==; end

  # --- >(other)  -> bool
  # 比較演算子。数値として大きいか判定します。
  # 
  # @param other 比較対象の数値
  # @return      self よりも other の方が小さい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14 >  3.1415  # => false
  # 3.14 >= 3.1415  # => false
  # //}
  def >; end

  # --- >=(other) -> bool
  # 比較演算子。数値として等しいまたは大きいか判定します。
  # 
  # @param other 比較対象の数値
  # @return      self よりも other の方が小さい場合か、
  #              両者が等しい場合 true を返します。
  #              そうでなければ false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14 >  3.1415  # => false
  # 3.14 >= 3.1415  # => false
  # //}
  def >=; end

  # --- abs        -> Float
  # --- magnitude  -> Float
  # 
  # 自身の絶対値を返します。
  # 
  # //emlist[例][ruby]{
  # 34.56.abs      # => 34.56
  # -34.56.abs     # => 34.56
  # //}
  def abs; end

  # --- arg   -> 0 | Float
  # --- angle -> 0 | Float
  # --- phase -> 0 | Float
  # 
  # 自身の偏角(正の数なら 0、負の数なら [[m:Math::PI]])を返します。
  # 
  # //emlist[例][ruby]{
  # 1.arg  # => 0
  # -1.arg # => 3.141592653589793
  # //}
  # 
  # ただし、自身が NaN(Not a number) であった場合は、NaN を返します。
  def angle; end

  # --- ceil(ndigits = 0) -> Integer | Float
  # 
  # 自身と等しいかより大きな整数のうち最小のものを返します。
  # 
  # @param ndigits 10進数での小数点以下の有効桁数を整数で指定します。
  #                正の整数を指定した場合、[[c:Float]] を返します。
  #                小数点以下を、最大 n 桁にします。
  #                負の整数を指定した場合、[[c:Integer]] を返します。
  #                小数点位置から左に少なくとも n 個の 0 が並びます。
  # 
  # //emlist[例][ruby]{
  # 1.2.ceil      # => 2
  # 2.0.ceil      # => 2
  # (-1.2).ceil   # => -1
  # (-2.0).ceil   # => -2
  # 
  # 1.234567.ceil(2)   # => 1.24
  # 1.234567.ceil(3)   # => 1.235
  # 1.234567.ceil(4)   # => 1.2346
  # 1.234567.ceil(5)   # => 1.23457
  # 
  # 34567.89.ceil(-5)  # => 100000
  # 34567.89.ceil(-4)  # => 40000
  # 34567.89.ceil(-3)  # => 35000
  # 34567.89.ceil(-2)  # => 34600
  # 34567.89.ceil(-1)  # => 34570
  # 34567.89.ceil(0)   # => 34568
  # 34567.89.ceil(1)   # => 34567.9
  # 34567.89.ceil(2)   # => 34567.89
  # 34567.89.ceil(3)   # => 34567.89
  # //}
  # 
  # @see [[m:Float#floor]], [[m:Float#round]], [[m:Float#truncate]]
  def ceil; end

  # --- denominator -> Integer
  # 
  # 自身を [[c:Rational]] に変換した時の分母を返します。
  # 
  # @return 分母を返します。
  # 
  # //emlist[例][ruby]{
  # 2.0.denominator         # => 1
  # 0.5.denominator         # => 2
  # //}
  # 
  # @see [[m:Float#numerator]]
  def denominator; end

  # --- divmod(other) -> [Numeric]
  # 
  # self を other で割った商 q と余り r を、
  # [q, r] という 2 要素の配列にして返します。
  # 商 q は常に整数ですが、余り r は整数であるとは限りません。
  # 
  # ここで、商 q と余り r は、
  # 
  #   * self == other * q + r
  # と
  #   * other > 0 のとき:  0     <= r < other
  #   * other < 0 のとき:  other <  r <= 0
  #   * q は整数
  # をみたす数です。
  # このメソッドは、メソッド / と % によって定義されています。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # 11.divmod(3)         # => [3, 2]
  # (11.5).divmod(3.5)   # => [3, 1.0]
  # 11.divmod(-3)        # => [-4, -1]
  # 11.divmod(3.5)       # => [3, 0.5]
  # (-11).divmod(3.5)    # => [-4, 3.0]
  # //}
  # 
  # @see [[m:Numeric#div]], [[m:Numeric#modulo]]
  def divmod; end

  # --- eql?(other)   -> bool
  # 
  # 自身と other のクラスが等しくかつ == メソッドで比較して等しい場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # @param other 自身と比較したい数値を指定します。
  # 
  # //emlist[例][ruby]{
  # 1.0.eql?(1)   # => false
  # 1.0.eql?(1.0) # => true
  # //}
  def eql?; end

  # --- finite? -> bool
  # 
  # 数値が ∞, -∞, あるいは NaN でない場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14.finite? # => true
  # inf = 1.0/0
  # inf.finite? # => false
  # //}
  def finite?; end

  # --- floor(ndigits = 0) -> Integer | Float
  # 
  # 自身と等しいかより小さな整数のうち最大のものを返します。
  # 
  # @param ndigits 10進数での小数点以下の有効桁数を整数で指定します。
  #                正の整数を指定した場合、[[c:Float]] を返します。
  #                小数点以下を、最大 n 桁にします。
  #                負の整数を指定した場合、[[c:Integer]] を返します。
  #                小数点位置から左に少なくとも n 個の 0 が並びます。
  # 
  # //emlist[例][ruby]{
  # 1.2.floor      # => 1
  # 2.0.floor      # => 2
  # (-1.2).floor   # => -2
  # (-2.0).floor   # => -2
  # 
  # 1.234567.floor(2)   # => 1.23
  # 1.234567.floor(3)   # => 1.234
  # 1.234567.floor(4)   # => 1.2345
  # 1.234567.floor(5)   # => 1.23456
  # 
  # 34567.89.floor(-5)  # => 0
  # 34567.89.floor(-4)  # => 30000
  # 34567.89.floor(-3)  # => 34000
  # 34567.89.floor(-2)  # => 34500
  # 34567.89.floor(-1)  # => 34560
  # 34567.89.floor(0)   # => 34567
  # 34567.89.floor(1)   # => 34567.8
  # 34567.89.floor(2)   # => 34567.89
  # 34567.89.floor(3)   # => 34567.89
  # //}
  # 
  # @see [[m:Numeric#ceil]], [[m:Numeric#round]], [[m:Float#truncate]]
  def floor; end

  # --- hash -> Integer
  # ハッシュ値を返します。
  # 
  # //emlist[例][ruby]{
  # pi1 = 3.14
  # pi2 = 3.14
  # pi3 = 3.1415
  # 
  # pi1.hash # => 335364239
  # pi2.hash # => 335364239
  # pi3.hash # => 420540030
  # //}
  def hash; end

  # --- infinite? -> 1 | -1 | nil
  # 
  # 数値が +∞ のとき 1、-∞のとき -1 を返します。それ以外は nil を返
  # します。
  # 
  # //emlist[例][ruby]{
  # inf = 1.0/0
  # p inf            # => Infinity
  # p inf.infinite?  # => 1
  # 
  # inf = -1.0/0
  # p inf            # => -Infinity
  # p inf.infinite?  # => -1
  # //}
  def infinite?; end

  # --- to_s -> String
  # --- inspect -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # 固定小数点、浮動小数点の形式か、 "Infinity"、"-Infinity"、"NaN" のいず
  # れかを返します。
  # 
  # @return 文字列を返します。
  # 
  # //emlist[例][ruby]{
  # 0.00001.to_s             # => "1.0e-05"
  # 3.14.to_s                # => "3.14"
  # 10000_00000_00000.0.to_s # => "100000000000000.0"
  # 10000_00000_00000_00000.0.to_s # => "1.0e+19"
  # (1.0/0.0).to_s           # => "Infinity"
  # (0.0/0.0).to_s           # => "NaN"
  # //}
  def inspect; end

  # --- nan? -> bool
  # 
  # 数値が NaN(Not a number)のとき真を返します。
  # 
  # //emlist[例][ruby]{
  # nan = 0.0/0.0
  # p nan       # => NaN
  # p nan.nan?  # => true
  # //}
  def nan?; end

  # --- negative? -> bool
  # 
  # self が 0 未満の場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # -0.1.negative?   # => true
  # 0.0.negative?    # => false
  # 0.1.negative?    # => false
  # //}
  # 
  # @see [[m:Float#positive?]]
  def negative?; end

  # --- next_float -> Float
  # 
  # 浮動小数点数で表現可能な self の次の値を返します。
  # 
  # [[m:Float::MAX]].next_float、[[m:Float::INFINITY]].next_float は
  # [[m:Float::INFINITY]] を返します。[[m:Float::NAN]].next_float は
  # [[m:Float::NAN]] を返します。
  # 
  # //emlist[例][ruby]{
  # p 0.01.next_float  # => 0.010000000000000002
  # p 1.0.next_float   # => 1.0000000000000002
  # p 100.0.next_float # => 100.00000000000001
  # 
  # p 0.01.next_float - 0.01   # => 1.734723475976807e-18
  # p 1.0.next_float - 1.0     # => 2.220446049250313e-16
  # p 100.0.next_float - 100.0 # => 1.4210854715202004e-14
  # 
  # f = 0.01; 20.times { printf "%-20a %s\n", f, f.to_s; f = f.next_float }
  # # => 0x1.47ae147ae147bp-7 0.01
  # #    0x1.47ae147ae147cp-7 0.010000000000000002
  # #    0x1.47ae147ae147dp-7 0.010000000000000004
  # #    0x1.47ae147ae147ep-7 0.010000000000000005
  # #    0x1.47ae147ae147fp-7 0.010000000000000007
  # #    0x1.47ae147ae148p-7  0.010000000000000009
  # #    0x1.47ae147ae1481p-7 0.01000000000000001
  # #    0x1.47ae147ae1482p-7 0.010000000000000012
  # #    0x1.47ae147ae1483p-7 0.010000000000000014
  # #    0x1.47ae147ae1484p-7 0.010000000000000016
  # #    0x1.47ae147ae1485p-7 0.010000000000000018
  # #    0x1.47ae147ae1486p-7 0.01000000000000002
  # #    0x1.47ae147ae1487p-7 0.010000000000000021
  # #    0x1.47ae147ae1488p-7 0.010000000000000023
  # #    0x1.47ae147ae1489p-7 0.010000000000000024
  # #    0x1.47ae147ae148ap-7 0.010000000000000026
  # #    0x1.47ae147ae148bp-7 0.010000000000000028
  # #    0x1.47ae147ae148cp-7 0.01000000000000003
  # #    0x1.47ae147ae148dp-7 0.010000000000000031
  # #    0x1.47ae147ae148ep-7 0.010000000000000033
  # //}
  # 
  # @see [[m:Float#prev_float]]
  def next_float; end

  # --- numerator -> Integer
  # 
  # 自身を [[c:Rational]] に変換した時の分子を返します。
  # 
  # @return 分子を返します。
  # 
  # //emlist[例][ruby]{
  # 2.0.numerator           # => 2
  # 0.5.numerator           # => 1
  # //}
  # 
  # @see [[m:Float#denominator]]
  def numerator; end

  # --- positive? -> bool
  # 
  # self が 0 より大きい場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # 0.1.positive?   # => true
  # 0.0.positive?   # => false
  # -0.1.positive?  # => false
  # //}
  # 
  # @see [[m:Float#negative?]]
  def positive?; end

  # --- prev_float -> Float
  # 
  # 浮動小数点数で表現可能な self の前の値を返します。
  # 
  # (-[[m:Float::MAX]]).prev_float と (-[[m:Float::INFINITY]]).prev_float
  # は -[[m:Float::INFINITY]] を返します。[[m:Float::NAN]].prev_float は
  # [[m:Float::NAN]] を返します。
  # 
  # //emlist[例][ruby]{
  # p 0.01.prev_float  # => 0.009999999999999998
  # p 1.0.prev_float   # => 0.9999999999999999
  # p 100.0.prev_float # => 99.99999999999999
  # 
  # p 0.01 - 0.01.prev_float   # => 1.734723475976807e-18
  # p 1.0 - 1.0.prev_float     # => 1.1102230246251565e-16
  # p 100.0 - 100.0.prev_float # => 1.4210854715202004e-14
  # 
  # f = 0.01; 20.times { printf "%-20a %s\n", f, f.to_s; f = f.prev_float }
  # # => 0x1.47ae147ae147bp-7 0.01
  # #    0x1.47ae147ae147ap-7 0.009999999999999998
  # #    0x1.47ae147ae1479p-7 0.009999999999999997
  # #    0x1.47ae147ae1478p-7 0.009999999999999995
  # #    0x1.47ae147ae1477p-7 0.009999999999999993
  # #    0x1.47ae147ae1476p-7 0.009999999999999992
  # #    0x1.47ae147ae1475p-7 0.00999999999999999
  # #    0x1.47ae147ae1474p-7 0.009999999999999988
  # #    0x1.47ae147ae1473p-7 0.009999999999999986
  # #    0x1.47ae147ae1472p-7 0.009999999999999985
  # #    0x1.47ae147ae1471p-7 0.009999999999999983
  # #    0x1.47ae147ae147p-7  0.009999999999999981
  # #    0x1.47ae147ae146fp-7 0.00999999999999998
  # #    0x1.47ae147ae146ep-7 0.009999999999999978
  # #    0x1.47ae147ae146dp-7 0.009999999999999976
  # #    0x1.47ae147ae146cp-7 0.009999999999999974
  # #    0x1.47ae147ae146bp-7 0.009999999999999972
  # #    0x1.47ae147ae146ap-7 0.00999999999999997
  # #    0x1.47ae147ae1469p-7 0.009999999999999969
  # #    0x1.47ae147ae1468p-7 0.009999999999999967
  # //}
  # 
  # @see [[m:Float#next_float]]
  def prev_float; end

  # --- rationalize      -> Rational
  # --- rationalize(eps) -> Rational
  # 
  # 自身から eps で指定した許容誤差の範囲に収まるような [[c:Rational]] を返
  # します。
  # 
  # eps を省略した場合は誤差が最も小さくなるような [[c:Rational]] を返しま
  # す。
  # 
  # @param eps 許容する誤差
  # 
  # //emlist[例][ruby]{
  # 0.3.rationalize          # => (3/10)
  # 1.333.rationalize        # => (1333/1000)
  # 1.333.rationalize(0.01)  # => (4/3)
  # //}
  def rationalize; end

  # --- round(ndigits = 0)  -> Integer | Float
  # --- round(ndigits = 0, half: :up)  -> Integer | Float
  # 
  # 自身ともっとも近い整数もしくは実数を返します。
  # 
  # 中央値 0.5, -0.5 はそれぞれ 1,-1 に切り上げされます。
  # いわゆる四捨五入ですが、偶数丸めではありません。
  # 
  # @param ndigits 丸める位を指定します。
  #        ndigitsが0ならば、小数点以下を四捨五入し、整数を返します。
  #        ndigitsが0より大きいならば、小数点以下の指定された位で四捨五入されます。
  #        ndigitsが0より小さいならば、小数点以上の指定された位で四捨五入されます。
  # @param half ちょうど半分の値の丸め方を指定します。
  #        サポートされている値は以下の通りです。
  # 
  #  * :up or nil: 0から遠い方に丸められます。
  #  * :even: もっとも近い偶数に丸められます。
  #  * :down: 0に近い方に丸められます。
  # 
  # @return 指定された引数に応じて、整数もしくは実数を返します。
  #        ndigitsが0ならば、整数を返します。
  #        ndigitsが0より大きいならば、実数を返します。
  #        ndigitsが0より小さいならば、整数を返します。
  # 
  # @raise TypeError ndigits で指定されたオブジェクトが整数に変換できない場
  #                  合発生します。
  # 
  # //emlist[例][ruby]{
  # 1.0.round      # => 1
  # 1.2.round      # => 1
  # (-1.2).round   # => -1
  # (-1.5).round   # => -2
  # 
  # t = Math::PI # => 3.141592653589793
  # t.round(3)   # => 3.142
  # t.round(0)   # => 3
  # t.round(1)   # => 3.1
  # 
  # t = t**10      # => 93648.04747608298
  # t.round(-0)    # => 93648
  # t.round(-1)    # => 93650
  # t.round(-2)    # => 93600
  # t.round(-3)    # => 94000
  # t.round(-100)  # => 0
  # 
  # 2.5.round(half: :up)   # => 3
  # 2.5.round(half: :even) # => 2
  # 2.5.round(half: :down) # => 2
  # 3.5.round(half: :up)   # => 4
  # 3.5.round(half: :even) # => 4
  # 3.5.round(half: :down) # => 3
  # //}
  # 
  # @see [[m:Float#ceil]], [[m:Float#floor]], [[m:Float#truncate]]
  def round; end

  # --- to_d -> BigDecimal
  # --- to_d(prec) -> BigDecimal
  # 
  # 自身を [[c:BigDecimal]] に変換します。
  # 
  # @param prec 計算結果の精度。省略した場合は [[m:Float::DIG]] + 1 です。
  # 
  # @return [[c:BigDecimal]] に変換したオブジェクト
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # require 'bigdecimal/util'
  # 
  # p 1.0.to_d       # => 0.1e1
  # p (1.0 / 0).to_d # => Infinity
  # 
  # p (1.0 / 3).to_d / (2.0 / 3).to_d  # => 0.5e0
  # p ((1.0 / 3) / (2.0 / 3)).to_d     # => 0.5e0
  # //}
  # 
  # @raise ArgumentError prec に負の数を指定した場合に発生します。
  def to_d; end

  # --- to_f -> self
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # 3.14.to_f   # => 3.14
  # //}
  def to_f; end

  # --- to_i -> Integer
  # --- truncate(ndigits = 0) -> Integer | Float
  # 
  # 小数点以下を切り捨てて値を整数に変換します。
  # 
  # @param ndigits 10進数での小数点以下の有効桁数を整数で指定します。
  #                正の整数を指定した場合、[[c:Float]] を返します。
  #                小数点以下を、最大 n 桁にします。
  #                負の整数を指定した場合、[[c:Integer]] を返します。
  #                小数点位置から左に少なくとも n 個の 0 が並びます。
  # 
  # //emlist[例][ruby]{
  # 2.8.truncate           # => 2
  # (-2.8).truncate        # => -2
  # 1.234567.truncate(2)   # => 1.23
  # 34567.89.truncate(-2)  # => 34500
  # //}
  # 
  # @see [[m:Numeric#round]], [[m:Numeric#ceil]], [[m:Numeric#floor]]
  def to_i; end

  # --- to_r -> Rational
  # 
  # 自身を [[c:Rational]] に変換します。
  # 
  # //emlist[例][ruby]{
  # 0.5.to_r      # => (1/2)
  # //}
  def to_r; end

  # --- zero?  -> bool
  # 
  # 自身がゼロの時、trueを返します。そうでない場合は false を返します。
  # 
  # //emlist[例][ruby]{
  # 10.0.zero?            # => false
  # 0.zero?               # => true
  # 0.0.zero?             # => true
  # //}
  def zero?; end

  # --- DIG -> Integer
  # 
  # Float が表現できる最大の 10 進桁数です。
  # 
  # 通常はデフォルトで 15 です。
  def DIG; end

  # --- EPSILON -> Float
  # 
  # 1.0 + Float::EPSILON != 1.0 となる最小の正の値です。
  # 
  # 通常はデフォルトで 2.2204460492503131e-16 です。
  def EPSILON; end

  # --- INFINITY -> Float
  # 
  # 浮動小数点数における正の無限大です。
  # 
  # 負の無限大は -Float::INFINITY です。
  # 
  # @see [[m:Float#finite?]], [[m:Float#infinite?]]
  def INFINITY; end

  # --- MANT_DIG -> Integer
  # 
  # 仮数部の Float::RADIX 進法での桁数です。
  # 
  # 通常はデフォルトで 53 です。
  def MANT_DIG; end

  # --- MAX -> Float
  # 
  # Float が取り得る最大の有限の値です。
  # 
  # 通常はデフォルトで 1.7976931348623157e+308 です。
  # 
  # @see [[m:Float::MIN]]
  def MAX; end

  # --- MAX_10_EXP -> Integer
  # 
  # 最大の 10 進の指数です。
  # 
  # 通常はデフォルトで 308 です。
  # 
  # @see [[m:Float::MIN_10_EXP]]
  def MAX_10_EXP; end

  # --- MAX_EXP -> Integer
  # 
  # 最大の Float::RADIX 進の指数です。
  # 
  # 通常はデフォルトで 1024 です。
  # 
  # @see [[m:Float::MIN_EXP]]
  def MAX_EXP; end

  # --- MIN -> Float
  # 
  # Float が取り得る最小の正の値です。
  # 
  # 通常はデフォルトで 2.2250738585072014e-308 です。
  # 
  # Float が取り得る最小の有限の値は -[[m:Float::MAX]] です。
  # 
  # @see [[m:Float::MAX]]
  def MIN; end

  # --- MIN_10_EXP -> Integer
  # 
  # 最小の 10 進の指数です。
  # 
  # 通常はデフォルトで -307 です。
  # 
  # @see [[m:Float::MAX_10_EXP]]
  def MIN_10_EXP; end

  # --- MIN_EXP -> Integer
  # 
  # 最小の Float::RADIX 進の指数です。
  # 
  # 通常はデフォルトで -1021 です。
  # 
  # @see [[m:Float::MAX_EXP]]
  def MIN_EXP; end

  # --- NAN -> Float
  # 
  # 浮動小数点数における NaN(Not a number)です。
  # 
  # @see [[m:Float#nan?]]
  def NAN; end

  # --- RADIX -> Integer
  # 
  # 指数表現の基数です。
  def RADIX; end

  # --- ROUNDS -> Integer
  # 
  # この定数は Ruby 2.7 から deprecated です。使わないでください。
  # 
  # 
  # 丸めモード (-1: 不定、0: 0.0 の方向に丸め、1: 四捨五入、2:正の無限
  # 大の方向に丸め、3:負の無限大の方向に丸め)です。
  def ROUNDS; end

end
