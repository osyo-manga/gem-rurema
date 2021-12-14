class Numeric
  # --- modulo(other)    -> Numeric
  # --- %(other)         -> Numeric
  # 
  # self を other で割った余り r を返します。
  # 
  # ここで、商 q と余り r は、
  # 
  #   * self == other * q + r  
  # と
  #   * other > 0 のとき  0 <= r < other
  #   * other < 0 のとき other < r <= 0
  #   * q は整数
  # 
  # をみたす数です。
  # 余り r は、other と同じ符号になります。
  # 商  q は、[[m:Numeric#div]] (あるいは 「/」)で求められます。
  # modulo はメソッド % の呼び出しとして定義されています。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # p 13.modulo(4)       #=>  1
  # p (11.5).modulo(3.5) #=> 1.0
  # p 13.modulo(-4)      #=> -3
  # p (-13).modulo(4)    #=>  3
  # p (-13).modulo(-4)   #=> -1
  # p (-11).modulo(3.5)  #=> 3.0
  # //}
  # 
  # @see [[m:Numeric#divmod]], [[m:Numeric#remainder]]
  def %; end

  # --- +@    -> self
  # 
  # 単項演算子の + です。
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # + 10            # => 10
  # + (-10)           # => -10
  # + 0.1           # => 0.1
  # + (3r) # => (3/1)
  # + (1+3i)        # => (1+3i)
  # //}
  def +@; end

  # --- -@    -> Numeric
  # 
  # 単項演算子の - です。
  # self の符号を反転させたものを返します。
  # 
  # このメソッドは、二項演算子 - で 0 - self によって定義されています。
  # 
  # 
  # @see [[m:Integer#-@]]、[[m:Float#-@]]、[[m:Rational#-@]]、[[m:Complex#-@]]
  def -@; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # 自身が other より大きい場合に 1 を、等しい場合に 0 を、小さい場合には -1 をそれぞれ返します。
  # 自身と other が比較できない場合には nil を返します。
  # 
  # Numeric のサブクラスは、上の動作を満たすよう このメソッドを適切に再定義しなければなりません。
  # 
  # @param other 自身と比較したい数値を指定します。
  # 
  # //emlist[例][ruby]{
  # 1 <=> 0   #=> 1
  # 1 <=> 1   #=> 0
  # 1 <=> 2   #=> -1
  # 1 <=> "0" #=> nil
  # //}
  def <=>; end

  # --- abs        -> Numeric
  # --- magnitude  -> Numeric
  # 
  # 自身の絶対値を返します。
  # 
  # //emlist[例][ruby]{
  # 12.abs         #=> 12
  # (-34.56).abs   #=> 34.56
  # -34.56.abs     #=> 34.56
  # //}
  def abs; end

  # --- abs2 -> Numeric
  # 
  # 自身の絶対値の 2 乗を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # 2.abs2    # => 4
  # -2.abs2   # => 4
  # 2.0.abs2  # => 4
  # -2.0.abs2 # => 4
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  def abs2; end

  # --- arg   -> 0 | Math::PI
  # --- angle -> 0 | Math::PI
  # --- phase -> 0 | Math::PI
  # 
  # 自身の偏角(正の数なら 0、負の数なら [[m:Math::PI]])を返します。
  # 
  # //emlist[例][ruby]{
  # 1.arg  # => 0
  # -1.arg # => 3.141592653589793
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # @see [[m:Complex#arg]]
  def angle; end

  # --- ceil   -> Integer
  # 
  # 自身と等しいかより大きな整数のうち最小のものを返します。
  # 
  # //emlist[例][ruby]{
  # 1.ceil        #=> 1
  # 1.2.ceil      #=> 2
  # (-1.2).ceil   #=> -1
  # (-1.5).ceil   #=> -1
  # //}
  # 
  # @see [[m:Numeric#floor]], [[m:Numeric#round]], [[m:Numeric#truncate]]
  def ceil; end

  # --- coerce(other)    -> [Numeric]
  # 
  # 自身と other が同じクラスになるよう、自身か other を変換し [other, self] という配列にして返します。
  # 
  # デフォルトでは self と other を [[c:Float]] に変換して [other, self] という配列にして返します。
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 以下は [[c:Rational]] の coerce のソースです。other が自身の知らない数値クラスであった場合、
  # super を呼んでいることに注意して下さい。
  # 
  # 
  # //emlist[例][ruby]{
  # # lib/rational.rb より
  # 
  # def coerce(other)
  #   if other.kind_of?(Float)
  #     return other, self.to_f
  #   elsif other.kind_of?(Integer)
  #     return Rational.new!(other, 1), self
  #   else
  #     super
  #   end
  # end
  # //}
  # 
  # 数値クラスの算術演算子は通常自分と演算できないクラスをオペランドとして受け
  # 取ると coerce を使って自分とオペランドを変換した上で演算を行います。
  # 以下は [[c:Rational]] の + メソッドを一部省略したものです。
  # 引数が自身の知らない数値クラスである場合、引数の coerce により自身を変換してから
  # + 演算子を呼んでいます。
  # 
  # //emlist[例][ruby]{
  # # lib/rational.rb より
  # 
  # def + (a)
  #   if a.kind_of?(Rational)
  #     # 長いので省略
  #   elsif a.kind_of?(Integer)
  #     # 長いので省略
  #   elsif a.kind_of?(Float)
  #     Float(self) + a
  #   else
  #     x, y = a.coerce(self)
  #     x + y
  #   end
  # end
  # //}
  # 
  # @param other オペランドを数値で指定します。
  def coerce; end

  # --- conj      -> Numeric
  # --- conjugate -> Numeric
  # 
  # 常に self を返します。
  # 
  # 自身が [[c:Complex]] かそのサブクラスのインスタンスの場合は、自身の共役複素数(実数の場合は常に自身)を返します。
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # 
  # //emlist[例][ruby]{
  # 10.conj       # => 10
  # 0.1.conj      # => 0.1
  # (2/3r).conj   # => (2/3)
  # //}
  # 
  # @see [[m:Complex#conj]]
  def conj; end

  # --- denominator -> Integer
  # 
  # 自身を [[c:Rational]] に変換した時の分母を返します。
  # 
  # @return 分母を返します。
  # 
  # 
  # @see [[m:Numeric#numerator]]、[[m:Integer#denominator]]、[[m:Float#denominator]]、[[m:Rational#denominator]]、[[m:Complex#denominator]]
  def denominator; end

  # --- div(other)    -> Integer
  # 
  # self を other で割った整数の商 q を返します。
  # 
  # ここで、商 q と余り r は、それぞれ
  # 
  #   * self == other * q + r  
  # と
  #   * other > 0 のとき:  0     <= r < other
  #   * other < 0 のとき:  other <  r <= 0
  #   * q は整数
  # をみたす数です。
  # 商に対応する余りは [[m:Numeric#modulo]] で求められます。
  # div はメソッド / を呼びだし、floorを取ることで計算されます。
  # 
  # メソッド / の定義はサブクラスごとの定義を用います。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # p 3.div(2) # => 1
  # p (-3).div(2) # => -2
  # p (-3.0).div(2) # => -2
  # //}
  def div; end

  # --- divmod(other)    -> [Numeric]
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
  # divmod が返す商は [[m:Numeric#div]] と同じです。
  # また余りは、[[m:Numeric#modulo]] と同じです。
  # このメソッドは、メソッド / と % によって定義されています。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # 11.divmod(3)         #=> [3, 2]
  # (11.5).divmod(3.5)   #=> [3, 1.0]
  # 11.divmod(-3)        #=> [-4, -1]
  # 11.divmod(3.5)       #=> [3, 0.5]
  # (-11).divmod(3.5)    #=> [-4, 3.0]
  # //}
  # 
  # @see [[m:Numeric#div]], [[m:Numeric#modulo]]
  def divmod; end

  # --- eql?(other) -> bool
  # 
  # 自身と other のクラスが等しくかつ == メソッドで比較して等しい場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # Numeric のサブクラスは、eql? で比較して等しい数値同士が同じハッシュ値を返すように
  # hash メソッドを適切に定義する必要があります。
  # 
  # @param other 自身と比較したい数値を指定します。
  # 
  # //emlist[例][ruby]{
  # p 1.eql?(1)    #=> true
  # p 1.eql?(1.0)  #=> false
  # p 1 == 1.0     #=> true
  # //}
  # 
  # @see [[m:Object#equal?]], [[m:Object#eql?]], [[m:Object#==]], [[m:Object#===]]
  def eql?; end

  # --- fdiv(other)   -> Float | Complex
  # 
  # self を other で割った商を [[c:Float]] で返します。
  # ただし [[c:Complex]] が関わる場合は例外です。
  # その場合も成分は Float になります。
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # 1.fdiv(3)            #=> 0.3333333333333333
  # Complex(1, 1).fdiv 1 #=> (1.0+1.0i)
  # 1.fdiv Complex(1, 1) #=> (0.5-0.5i)
  # //}
  # 
  # @see [[m:Numeric#quo]]
  def fdiv; end

  # --- finite? -> bool
  # 
  # self の絶対値が有限値の場合に true を、そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # 10.finite?                      # => true
  # Rational(3).finite?             # => true
  # 
  # Float::INFINITY.finite?         # => false
  # Float::INFINITY.is_a?(Numeric)  # => true
  # //}
  # 
  # @see [[m:Numeric#infinite?]]
  def finite?; end

  # --- floor(ndigits = 0) -> Integer
  # 
  # 自身と等しいかより小さな整数のうち最大のものを返します。
  # 
  # @param ndigits 10進数での小数点以下の有効桁数を整数で指定します。
  #                負の整数を指定した場合、小数点位置から左に少なくとも n 個の 0 が並びます。
  # 
  # //emlist[例][ruby]{
  # 1.floor        #=> 1
  # 1.2.floor      #=> 1
  # (-1.2).floor   #=> -2
  # (-1.5).floor   #=> -2
  # //}
  # 
  # @see [[m:Numeric#ceil]], [[m:Numeric#round]], [[m:Numeric#truncate]]
  # @see [[m:Integer#floor]]
  def floor; end

  # --- i    -> Complex
  # 
  # Complex(0, self) を返します。
  # 
  # ただし、[[c:Complex]] オブジェクトでは利用できません。
  # 
  # //emlist[例][ruby]{
  # 10.i             # => (0+10i)
  # -10.i            # => (0-10i)
  # (0.1).i          # => (0+0.1i)
  # Rational(1, 2).i # => (0+(1/2)*i)
  # //}
  def i; end

  # --- imag      -> 0
  # --- imaginary -> 0
  # 
  # 常に 0 を返します。
  # 
  # //emlist[例][ruby]{
  # 12.imag     # => 0
  # -12.imag    # => 0
  # 1.2.imag    # => 0
  # -1.2.imag   # => 0
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # @see [[m:Numeric#real]]、[[m:Complex#imag]]
  def imag; end

  # --- infinite? -> nil
  # 
  # 常に nil を返します。
  # 自身が [[c:Float]] か[[c:Complex]]、もしくはそのサブクラスのインスタンスの場合は、self の絶対値が負の無限大の場合に-1を、正の無限大の場合に1を、有限値の場合に nil を返します。
  # 
  # //emlist[例][ruby]{
  # 10.infinite?     # => nil
  # (3r).infinite?   # => nil
  # //}
  # 
  # @see [[m:Numeric#finite?]]、[[m:Float#infinite?]]、[[m:Complex#infinite?]]
  def infinite?; end

  # --- integer?    -> bool
  # 
  # 自身が [[c:Integer]] かそのサブクラスのインスタンスの場合にtrue を返し
  # ます。そうでない場合に false を返します。
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # //emlist[例][ruby]{
  # (1.0).integer? #=> false
  # (1).integer?   #=> true
  # //}
  # 
  # @see [[m:Numeric#real?]]
  def integer?; end

  # --- negative? -> bool
  # 
  # self が 0 未満の場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # -1.negative?   # => true
  # 0.negative?    # => false
  # 1.negative?    # => false
  # //}
  # 
  # @see [[m:Numeric#positive?]]
  def negative?; end

  # --- nonzero?    -> self | nil
  # 
  # 自身がゼロの時 nil を返し、非ゼロの時 self を返します。
  # 
  # //emlist[例][ruby]{
  # p 10.nonzero?              #=> 10
  # p 0.nonzero?               #=> nil
  # p 0.0.nonzero?             #=> nil
  # p Rational(0, 2).nonzero?  #=> nil
  # //}
  # 
  # 非ゼロの時に self を返すため、自身が 0 の時に他の処理をさせたい場合に以
  # 下のように記述する事もできます。
  # 
  #   a = %w( z Bb bB bb BB a aA Aa AA A )
  #   b = a.sort {|a,b| (a.downcase <=> b.downcase).nonzero? || a <=> b }
  #   b   #=> ["A", "a", "AA", "Aa", "aA", "BB", "Bb", "bB", "bb", "z"]
  # 
  # @see [[m:Numeric#zero?]]
  def nonzero?; end

  # --- numerator -> Integer
  # 
  # 自身を [[c:Rational]] に変換した時の分子を返します。
  # 
  # @return 分子を返します。
  # 
  # 
  # @see [[m:Numeric#denominator]]、[[m:Integer#numerator]]、[[m:Float#numerator]]、[[m:Rational#numerator]]、[[m:Complex#numerator]]
  def numerator; end

  # --- polar -> [Numeric, Numeric]
  # 
  # 自身の絶対値と偏角を配列にして返します。正の数なら [self, 0]、負の数な
  # ら [-self, [[m:Math::PI]]] を返します。
  # 
  # //emlist[例][ruby]{
  # 1.0.polar  # => [1.0, 0]
  # 2.0.polar  # => [2.0, 0]
  # -1.0.polar # => [1.0, 3.141592653589793]
  # -2.0.polar # => [2.0, 3.141592653589793]
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # @see [[m:Complex#polar]]
  def polar; end

  # --- positive? -> bool
  # 
  # self が 0 より大きい場合に true を返します。そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # 1.positive?    # => true
  # 0.positive?    # => false
  # -1.positive?   # => false
  # //}
  # 
  # @see [[m:Numeric#negative?]]
  def positive?; end

  # --- quo(other)    -> Rational | Float | Complex
  # 
  # self を other で割った商を返します。
  # 整商を得たい場合は [[m:Numeric#div]] を使ってください。
  # 
  # [[m:Numeric#fdiv]] が結果を [[c:Float]] で返すメソッドなのに対して quo はなるべく正確な数値を返すことを意図しています。
  # 具体的には有理数の範囲に収まる計算では [[c:Rational]] の値を返します。
  # [[c:Float]] や [[c:Complex]] が関わるときはそれらのクラスになります。
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # 1.quo(3)      #=> (1/3)
  # 1.0.quo(3)    #=> 0.3333333333333333
  # 1.quo(3.0)    #=> 0.3333333333333333
  # 1.quo(0.5)    #=> 2.0
  # 
  # Complex(1, 1).quo(1)  #=> ((1/1)+(1/1)*i)
  # 1.quo(Complex(1, 1))  #=> ((1/2)-(1/2)*i)
  # //}
  # 
  # @see [[m:Numeric#fdiv]]
  def quo; end

  # --- real     -> Numeric
  # 
  # 自身を返します。
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # //emlist[例][ruby]{
  # 10.real               # => 10
  # -10.real              # => -10
  # 0.1.real              # => 0.1
  # Rational(2, 3).real   # => (2/3)
  # //}
  # 
  # @see [[m:Numeric#imag]]、[[m:Complex#real]]
  def real; end

  # --- real?    -> bool
  # 
  # 常に true を返します。([[c:Complex]] またはそのサブクラスではないことを意味します。)
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # //emlist[例][ruby]{
  # 10.real?               # => true
  # -10.real?              # => true
  # 0.1.real?              # => true
  # Rational(2, 3).real?   # => true
  # //}
  # 
  # @see [[m:Numeric#integer?]]、[[m:Complex#real?]]
  def real?; end

  # --- rect        -> [Numeric, Numeric]
  # --- rectangular -> [Numeric, Numeric]
  # 
  # [self, 0] を返します。
  # 
  # //emlist[例][ruby]{
  # 1.rect    # => [1, 0]
  # -1.rect   # => [-1, 0]
  # 1.0.rect  # => [1.0, 0]
  # -1.0.rect # => [-1.0, 0]
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  # 
  # @see [[m:Complex#rect]]
  def rect; end

  # --- remainder(other)    -> Numeric
  # 
  # self を other で割った余り r を返します。
  # 
  # ここで、商 q と余り r は、
  # 
  #   * self == other * q + r  
  # と
  # 
  #   * self > 0 のとき  0 <= r < |other|
  #   * self < 0 のとき -|other| < r <= 0
  #   * q は整数
  # 
  # をみたす数です。r の符号は self と同じになります。
  # 商 q を直接返すメソッドはありません。self.quo(other).truncate がそれに相当します。
  # 
  # @param other 自身を割る数を指定します。
  # 
  # //emlist[例][ruby]{
  # p 13.remainder(4)       #=>  1
  # p (11.5).remainder(3.5) #=> 1.0
  # p 13.remainder(-4)      #=>  1
  # p (-13).remainder(4)    #=> -1
  # p (-13).remainder(-4)   #=> -1
  # p (-11).remainder(3.5)  #=> -0.5
  # //}
  # 
  # @see [[m:Numeric#divmod]], [[m:Numeric#modulo]]
  def remainder; end

  # --- round   -> Integer
  # 
  # 自身ともっとも近い整数を返します。
  # 
  # 中央値 0.5, -0.5 はそれぞれ 1,-1 に切り上げされます。いわゆる四捨五入ですが、偶数丸めではありません。
  # 
  # //emlist[例][ruby]{
  # 1.round        #=> 1
  # 1.2.round      #=> 1
  # (-1.2).round   #=> -1
  # (-1.5).round   #=> -2
  # //}
  # 
  # @see [[m:Numeric#ceil]], [[m:Numeric#floor]], [[m:Numeric#truncate]]
  def round; end

  # --- step(limit, step = 1) {|n| ... }    -> self
  # --- step(limit, step = 1) -> Enumerator
  # --- step(limit, step = 1) -> Enumerator::ArithmeticSequence
  # --- step(by: 1, to: Float::INFINITY) {|n| ... } -> self
  # --- step(by: 1, to: Float::INFINITY) -> Enumerator
  # --- step(by: 1, to: Float::INFINITY) -> Enumerator::ArithmeticSequence
  # --- step(by:, to: -Float::INFINITY) {|n| ... } -> self
  # --- step(by:, to: -Float::INFINITY) -> Enumerator
  # --- step(by:, to: -Float::INFINITY) -> Enumerator::ArithmeticSequence
  # 
  # self からはじめ step を足しながら limit を越える
  # 前までブロックを繰り返します。step は負の数も指定できます。また、limit や step には [[c:Float]] なども
  # 指定できます。
  # 
  # @param limit ループの上限あるいは下限を数値で指定します。step に負の数が指定された場合は、
  #        下限として解釈されます。
  # 
  # @param step 各ステップの大きさを数値で指定します。負の数を指定することもできます。
  # 
  # @param to 引数limitと同じですが、省略した場合はキーワード引数byが正の
  #           数であれば [[m:Float::INFINITY]]、負の数であれば
  #           -[[m:Float::INFINITY]]を指定したとみなされます。
  # 
  # @param by 引数 step と同じです。
  # 
  # @return ブロックが指定された時は self を返します。
  # @return ブロックが指定されなかった時は [[c:Enumerator]] を返します。
  # @return 特に limit (または to) と step の両方が Numeric または nil の時は
  #         [[c:Enumerator::ArithmeticSequence]] を返します。
  # 
  # @raise ArgumentError step に 0 を指定した場合に発生します。
  # 
  # 
  # //emlist[例][ruby]{
  # 2.step(5){|n| p n}
  # 2
  # 3
  # 4
  # 5
  # 
  # 1.1.step(1.5, 0.1) {|n| p n}
  # 1.1
  # 1.2
  # 1.3
  # 1.4
  # 1.5
  # 
  # 10.step(6, -1){|n| p n}
  # 10
  # 9
  # 8
  # 7
  # 6
  # 
  # 3.step(by:2, to:10){|n| p n}
  # 3
  # 5
  # 7
  # 9
  # //}
  # 
  # 注：浮動小数点数の 0.1 は 2進数では正確な表現ができない(2進数で
  # 0.1は 0.00011001100....となる)ので、以下のようなループでは誤差が
  # 生じて意図した回数ループしないことがある。step はこの誤差を考慮し
  # て実装されている。
  # 
  # //emlist[例][ruby]{
  # i = 1.1
  # while i <= 1.5
  #   p i
  #   i += 0.1
  # end
  # # => 1.1
  # #    1.2
  # #    1.3
  # #    1.4   <- 1.5 が表示されない
  # //}
  # 
  # @see [[m:Integer#downto]]
  def step; end

  # --- to_c -> Complex
  # 
  # 自身を複素数 ([[c:Complex]]) に変換します。Complex(self, 0) を返します。
  # 
  # //emlist[例][ruby]{
  # 1.to_c              # => (1+0i)
  # -1.to_c             # => (-1+0i)
  # 1.0.to_c            # => (1.0+0i)
  # Rational(1, 2).to_c # => ((1/2)+0i)
  # //}
  # 
  # Numeric のサブクラスは、このメソッドを適切に再定義しなければなりません。
  def to_c; end

  # --- to_int    -> Integer
  # 
  # self.to_i と同じです。
  # 
  # //emlist[例][ruby]{
  # (2+0i).to_int        # => 2
  # Rational(3).to_int   # => 3
  # //}
  def to_int; end

  # --- truncate   -> Integer
  # 
  # 0 から 自身までの整数で、自身にもっとも近い整数を返します。
  # 
  # //emlist[例][ruby]{
  # 1.truncate        #=> 1
  # 1.2.truncate      #=> 1
  # (-1.2).truncate   #=> -1
  # (-1.5).truncate   #=> -1
  # //}
  # 
  # @see [[m:Numeric#ceil]], [[m:Numeric#floor]], [[m:Numeric#round]]
  def truncate; end

  # --- zero?    -> bool
  # 
  # 自身がゼロの時、trueを返します。そうでない場合は false を返します。
  # 
  # //emlist[例][ruby]{
  # p 10.zero?              #=> false
  # p 0.zero?               #=> true
  # p 0.0.zero?             #=> true
  # //}
  # 
  # @see [[m:Numeric#nonzero?]]
  def zero?; end

end
