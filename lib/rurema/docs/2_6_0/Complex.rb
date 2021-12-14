class Complex
  # --- *(other) -> Complex
  # 
  # 積を計算します。
  # 
  # @param other 自身に掛ける数
  # 
  # //emlist[例][ruby]{
  # Complex(1, 2) * 2              # => (2+4i)
  # Complex(1, 2) * Complex(2, 3)  # => (-4+7i)
  # Complex(1, 2) * Rational(1, 2) # => ((1/2)+(1/1)*i)
  # //}
  def *; end

  # --- **(other) -> Complex
  # 
  # 冪(べき)乗を計算します。
  # 
  # @param other 自身を other 乗する数
  # 
  # //emlist[例][ruby]{
  # Complex('i') ** 2             # => (-1+0i)
  # //}
  def **; end

  # --- +(other) -> Complex
  # 
  # 和を計算します。
  # 
  # @param other 自身に足す数
  # 
  # //emlist[例][ruby]{
  # Complex(1, 2) + Complex(2, 3) # => (3+5i)
  # //}
  def +; end

  # --- -(other) -> Complex
  # 
  # 差を計算します。
  # 
  # @param other 自身から引く数
  # 
  # //emlist[例][ruby]{
  # Complex(1, 2) - Complex(2, 3) # => (-1-1i)
  # //}
  def -; end

  # --- -@ -> Complex
  # 
  # 自身の符号を反転させたものを返します。
  # 
  # //emlist[例][ruby]{
  # -Complex(1)     # => (-1+0i)
  # -Complex(-1, 1) # => (1-1i)
  # //}
  def -@; end

  # --- /(other)   -> Complex
  # --- quo(other) -> Complex
  # 
  # 商を計算します。
  # 
  # @param other 自身を割る数
  # 
  # //emlist[例][ruby]{
  # Complex(10.0) / 3  # => (3.3333333333333335+(0/1)*i)
  # Complex(10)   / 3  # => ((10/3)+(0/1)*i)
  # //}
  # 
  # @see [[m:Numeric#quo]]
  def /; end

  # --- <(other)    -> bool
  # 
  # @undef
  def <; end

  # --- <=(other)    -> bool
  # 
  # @undef
  def <=; end

  # --- ==(other) -> bool
  # 
  # 数値として等しいか判定します。
  # 
  # @param other 自身と比較する数値
  # 
  # //emlist[例][ruby]{
  # Complex(2, 1) == Complex(1) # => false
  # Complex(1, 0) == Complex(1) # => true
  # Complex(1, 0) == 1          # => true
  # //}
  def ==; end

  # --- >(other)    -> bool
  # 
  # @undef
  def >; end

  # --- >=(other)    -> bool
  # 
  # @undef
  def >=; end

  # --- abs       -> Numeric
  # --- magnitude -> Numeric
  # 
  # 自身の絶対値を返します。
  # 
  # 以下の計算の結果を [[c:Float]] オブジェクトで返します。
  # 
  #   sqrt(self.real ** 2 + self.imag ** 2)
  # 
  # //emlist[例][ruby]{
  # Complex(1, 2).abs         # => 2.23606797749979
  # Complex(3, 4).abs         # => 5.0
  # Complex('1/2', '1/2').abs # => 0.7071067811865476
  # //}
  # 
  # @see [[m:Complex#abs2]]
  def abs; end

  # --- abs2 -> Numeric
  # 
  # 自身の絶対値の 2 乗を返します。
  # 
  # 以下の計算の結果を返します。
  # 
  #   self.real ** 2 + self.imag ** 2
  # 
  # //emlist[例][ruby]{
  # Complex(1, 1).abs2         # => 2
  # Complex(1.0, 1.0).abs2     # => 2.0
  # Complex('1/2', '1/2').abs2 # => (1/2)
  # //}
  # 
  # @see [[m:Complex#abs]]
  def abs2; end

  # --- arg   -> Float
  # --- angle -> Float
  # --- phase -> Float
  # 
  # 自身の偏角を[-π,π]の範囲で返します。
  # 
  # //emlist[例][ruby]{
  # Complex.polar(3, Math::PI/2).arg # => 1.5707963267948966
  # //}
  # 
  # 非正の実軸付近での挙動に注意してください。以下の例のように虚部が 0.0 と
  # -0.0 では値が変わります。
  # 
  # //emlist[例][ruby]{
  # Complex(-1, 0).arg              #=>  3.141592653589793
  # Complex(-1, -0).arg             #=>  3.141592653589793
  # Complex(-1, -0.0).arg           #=> -3.141592653589793
  # 
  # Complex(0, 0.0).arg             #=>  0.0
  # Complex(0, -0.0).arg            #=> -0.0
  # Complex(-0.0, 0).arg            #=>  3.141592653589793
  # Complex(-0.0, -0.0).arg         #=> -3.141592653589793
  # //}
  # 
  # 
  # @see [[m:Numeric#arg]]
  def angle; end

  # --- between?(min, max)    -> bool
  # 
  # @undef
  def between?; end

  # --- clamp(range)     -> object
  # 
  # @undef
  def clamp; end

  # --- coerce(other) -> [Complex, Complex]
  # 
  # other を [[c:Complex]] に変換して [変換後の other, self] の配列を返します。
  # 
  # @raise TypeError 変換できないオブジェクトを指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Complex(1).coerce(2) # => [(2+0i), (1+0i)]
  # //}
  def coerce; end

  # --- conjugate -> Complex
  # --- conj      -> Complex
  # 
  # 自身の共役複素数を返します。
  # 
  # //emlist[例][ruby]{
  # Complex(1, 2).conj # => (1-2i)
  # //}
  def conj; end

  # --- denominator -> Integer
  # 
  # 分母を返します。
  # 
  # 以下のように、実部と虚部の分母の最小公倍数を整数で返します。
  # 
  #   1   2       3+4i  <-  numerator(分子)
  #   - + -i  ->  ----
  #   2   3        6    <-  denominator(分母)
  # 
  # //emlist[例][ruby]{
  # Complex('1/2+2/3i').denominator # => 6
  # Complex(3).numerator            # => 1
  # //}
  # 
  # @see [[m:Complex#numerator]]
  def denominator; end

  # --- fdiv(other) -> Complex
  # 
  # self を other で割った商を返します。
  # 実部と虚部が共に [[c:Float]] の値になります。
  # 
  # @param other 自身を割る数
  # 
  # //emlist[例][ruby]{
  # Complex(11, 22).fdiv(3) # => (3.6666666666666665+7.333333333333333i)
  # Complex(11, 22).quo(3)  # => ((11/3)+(22/3)*i)
  # //}
  # 
  # @see [[m:Complex#quo]]
  def fdiv; end

  # --- finite? -> bool
  # 
  # 実部と虚部の両方が有限値の場合に true を、そうでない場合に false を返します。
  # 
  # //emlist[例][ruby]{
  # (1 + 1i).finite?                 # => true
  # (Float::INFINITY + 1i).finite?   # => false
  # //}
  # 
  # @see [[m:Complex#infinite?]]
  def finite?; end

  # --- imag      -> Numeric
  # --- imaginary -> Numeric
  # 
  # 自身の虚部を返します。
  # 
  # //emlist[例][ruby]{
  # Complex(3, 2).imag # => 2
  # //}
  # 
  # @see [[m:Numeric#imag]]
  def imag; end

  # --- infinite? -> nil | 1
  # 
  # 実部と虚部のどちらも無限大ではない場合に nil を、そうでない場合に 1 を返します。
  # 
  # //emlist[例][ruby]{
  # (1+1i).infinite?                   # => nil
  # (Float::INFINITY + 1i).infinite?   # => 1
  # //}
  # 
  # @see [[m:Complex#finite?]]
  def infinite?; end

  # --- inspect -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # //emlist[例][ruby]{
  # Complex(2).inspect                       # => "(2+0i)"
  # Complex('-8/6').inspect                  # => "((-4/3)+0i)"
  # Complex('1/2i').inspect                  # => "(0+(1/2)*i)"
  # Complex(0, Float::INFINITY).inspect      # => "(0+Infinity*i)"
  # Complex(Float::NAN, Float::NAN).inspect  # => "(NaN+NaN*i)"
  # //}
  def inspect; end

  # --- marshal_dump -> Array
  # 
  # [[m:Marshal.#load]] のためのメソッドです。
  # Complex::compatible#marshal_load で復元可能な配列を返します。
  # 
  # 2.0 以降では [[m:Marshal.#load]] で 1.8 系の [[c:Complex]] オブジェクト
  # を保存した文字列も復元できます。
  # 
  # [注意] Complex::compatible は通常の方法では参照する事ができません。
  def marshal_dump; end

  # --- numerator -> Complex
  # 
  # 分子を返します。
  # 
  # //emlist[例][ruby]{
  # Complex('1/2+2/3i').numerator # => (3+4i)
  # Complex(3).numerator          # => (3+0i)
  # //}
  # 
  # @see [[m:Complex#denominator]]
  def numerator; end

  # --- polar -> [Numeric, Numeric]
  # 
  # 自身の絶対値と偏角を配列にして返します。
  # 
  # //emlist[例][ruby]{
  # Complex.polar(1, 2).polar # => [1, 2]
  # //}
  # 
  # @see [[m:Numeric#polar]]
  def polar; end

  # --- to_r             -> Rational
  # --- rationalize      -> Rational
  # --- rationalize(eps) -> Rational
  # 
  # 自身を [[c:Rational]] に変換します。
  # 
  # @param eps 許容する誤差。常に無視されます。
  # 
  # @raise RangeError 虚部が実数か、0 ではない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Complex(3).to_r    # => (3/1)
  # Complex(3, 2).to_r # => RangeError
  # //}
  def rationalize; end

  # --- real -> Numeric
  # 
  # 自身の実部を返します。
  # 
  # //emlist[例][ruby]{
  # Complex(3, 2).real # => 3
  # //}
  def real; end

  # --- real? -> false
  # 
  # 常に false を返します。
  # 
  # //emlist[例][ruby]{
  # (2+3i).real?   # => false
  # (2+0i).real?   # => false
  # //}
  # 
  # @see [[m:Numeric#real?]]
  def real?; end

  # --- rect        -> [Numeric, Numeric]
  # --- rectangular -> [Numeric, Numeric]
  # 
  # 実部と虚部を配列にして返します。
  # 
  # //emlist[例][ruby]{
  # Complex(3).rect    # => [3, 0]
  # Complex(3.5).rect  # => [3.5, 0]
  # Complex(3, 2).rect # => [3, 2]
  # //}
  # 
  # @see [[m:Numeric#rect]]
  def rect; end

  # --- to_c -> self
  # 
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # Complex(2).to_c      # => (2+0i)
  # Complex(-8, 6).to_c  # => (-8+6i)
  # //}
  def to_c; end

  # --- to_f -> Float
  # 
  # 自身を [[c:Float]] に変換します。
  # 
  # @raise RangeError 虚部が実数か、0 ではない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Complex(3).to_f    # => 3.0
  # Complex(3.5).to_f  # => 3.5
  # Complex(3, 2).to_f # => RangeError
  # //}
  def to_f; end

  # --- to_i -> Integer
  # 
  # 自身を整数に変換します。
  # 
  # @raise RangeError 虚部が実数か、0 ではない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Complex(3).to_i    # => 3
  # Complex(3.5).to_i  # => 3
  # Complex(3, 2).to_i # => RangeError
  # //}
  def to_i; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 使用しません。
  # 
  # //emlist[例][ruby]{
  # require 'json/add/complex'
  # Complex(2, 3).to_json # => "{\"json_class\":\"Complex\",\"r\":2,\"i\":3}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_s -> String
  # 
  # 自身を "実部 + 虚部i" 形式の文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # Complex(2).to_s                       # => "2+0i"
  # Complex('-8/6').to_s                  # => "-4/3+0i"
  # Complex('1/2i').to_s                  # => "0+1/2i"
  # Complex(0, Float::INFINITY).to_s      # => "0+Infinity*i"
  # Complex(Float::NAN, Float::NAN).to_s  # => "NaN+NaN*i"
  # //}
  def to_s; end

  # --- json_create(hash) -> Complex
  # 
  # JSON のオブジェクトから [[c:Complex]] のオブジェクトを生成して返します。
  # 
  # @param hash 実部をキー 'r'、虚部をキー 'i' に持つハッシュを指定します。
  def json_create; end

  # --- polar(r, theta = 0) -> Complex
  # 
  # 絶対値が r、偏角が theta である [[c:Complex]] クラスのオブジェクトを生成します。
  # 
  # @param r 生成する複素数の絶対値。
  # 
  # @param theta 生成する複素数の偏角。単位はラジアンです。省略した場合は 0 です。
  # 
  # //emlist[例][ruby]{
  # Complex.polar(2.0)            # => (2.0+0.0i)
  # Complex.polar(2.0, 0)         # => (2.0+0.0i)
  # Complex.polar(2.0, Math::PI)  # => (-2.0+2.4492127076447545e-16i)
  # //}
  def polar; end

  # --- rect(r, i = 0)        -> Complex
  # --- rectangular(r, i = 0) -> Complex
  # 
  # 実部が r、虚部が i である [[c:Complex]] クラスのオブジェクトを生成します。
  # 
  # @param r 生成する複素数の実部。
  # 
  # @param i 生成する複素数の虚部。省略した場合は 0 です。
  # 
  # //emlist[例][ruby]{
  # Complex.rect(1)           # => (1+0i)
  # Complex.rect(1, 2)        # => (1+2i)
  # Complex.rectangular(1, 2) # => (1+2i)
  # //}
  # 
  # @see [[m:Kernel.#Complex]]
  def rect; end

  # --- I -> Complex
  # 
  # 虚数単位です。(0+1i) を返します。
  def I; end

end
