class BigDecimal
  # --- modulo(n) -> BigDecimal
  # --- %(n)      -> BigDecimal
  # 
  # self を n で割った余りを返します。
  # 
  # @param n self を割る数を指定します。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # x = BigDecimal((2**100).to_s)
  # ( x %  3).to_i # => 1
  # (-x %  3).to_i # => 2
  # ( x % -3).to_i # => -2
  # (-x % -3).to_i # => -1
  # //}
  # 
  # 戻り値は n と同じ符号になります。これは [[m:BigDecimal#remainder]] とは
  # 異なる点に注意してください。詳細は [[m:Numeric#%]]、
  # [[m:Numeric#remainder]] を参照して下さい。
  def %; end

  # --- *(other) -> BigDecimal
  # 
  # 積を計算します。
  # 
  # @param other self に掛ける数を指定します。
  # 
  # 計算結果の精度については[[ref:lib:bigdecimal#precision]]を参照してください。
  def *; end

  # --- power(n)       -> BigDecimal
  # --- power(n, prec) -> BigDecimal
  # --- **(n)          -> BigDecimal
  # 
  # self の n 乗を計算します。
  # 
  # 戻り値の有効桁数は self の有効桁数の n 倍以上になります。
  # 
  # @param n selfを other 乗する数を指定します。
  # 
  # @param prec 有効桁数を整数で指定します。
  # 
  # 
  # @see [[m:Integer#pow]]
  def **; end

  # --- +(other) -> BigDecimal
  # 
  # 和を計算します。
  # 
  # @param other self に足す数を指定します。
  # 
  # 計算結果の精度については[[ref:lib:bigdecimal#precision]]を参照してください。
  def +; end

  # --- +@ -> self
  # 
  # self を返します。
  def +@; end

  # --- -(other) -> BigDecimal
  # 
  # 差を計算します。
  # 
  # @param other self から引く数を指定します。
  # 
  # 計算結果の精度については[[ref:lib:bigdecimal#precision]]を参照してください。
  def -; end

  # --- -@ -> BigDecimal
  # 
  # self の符号を反転させたものを返します。
  def -@; end

  # --- div(other) -> BigDecimal
  # --- quo(other) -> BigDecimal
  # --- /(other)   -> BigDecimal
  # 
  # 商を計算します。
  # 
  # @param other self を割る数を指定します。
  # 
  # 詳細は [[m:Numeric#quo]] を参照して下さい。
  # 
  # 計算結果の精度については[[ref:lib:bigdecimal#precision]]を参照してください。
  def /; end

  # --- <(other) -> bool
  # 
  # self が other より小さい場合に true を、そうでない場合に false を返しま
  # す。
  def <; end

  # --- <=(other) -> bool
  # 
  # self が other より小さいか等しい場合に true を、そうでない場合に false
  # を返します。
  def <=; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self が other より大きい場合に 1 を、等しい場合に 0 を、小さい場合には
  # -1 をそれぞれ返します。
  # 
  # self と other が比較できない場合には nil を返します。
  def <=>; end

  # --- ==(other)   -> bool
  # --- ===(other)  -> bool
  # --- eql?(other) -> bool
  # 
  # self が other と等しい場合に true を、そうでない場合に false を返します。
  # 
  # それぞれの値は [[m:BigDecimal#coerce]] で変換して比較される場合があります。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # BigDecimal('1.0') == 1.0 # => true
  # //}
  def ==; end

  # --- >(other) -> bool
  # 
  # self が other より大きい場合に true を、そうでない場合に false を返しま
  # す。
  def >; end

  # --- >=(other) -> bool
  # 
  # self が other より大きいか等しい場合に true を、そうでない場合に false
  # を返します。
  def >=; end

  # --- _dump -> String
  # 
  # [[m:BigDecimal._load]] で復元可能な文字列を返します。
  # [[m:Marshal.#dump]] から呼び出されます。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # inf = BigDecimal('Infinity') # => Infinity
  # s = Marshal.dump(inf)        # => "\x04\bu:\x0FBigDecimal\x0F9:Infinity"
  # Marshal.load(s)              # => Infinity
  # //}
  # 
  # @see [[m:BigDecimal._load]], [[m:Marshal.#dump]], [[m:Marshal.#load]]
  def _dump; end

  # --- abs -> BigDecimal
  # 
  # self の絶対値を返します。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # BigDecimal('5').abs.to_i  # => 5
  # BigDecimal('-3').abs.to_i # => 3
  # //}
  def abs; end

  # --- add(other, n) -> BigDecimal
  # 
  # 和を計算します。
  # 
  # self + other を最大で n 桁まで計算します。計算結果の精度が n より大きい
  # ときは [[m:BigDecimal.mode]] で指定された方法で丸められます。
  # 
  # @param other self に足す数を指定します。
  # 
  # @param n 有効桁数を整数で指定します。0 を指定した場合は
  #          [[m:BigDecimal#+]] と同じ値を返します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # @see [[m:BigDecimal#+]]
  def add; end

  # --- ceil    -> Integer
  # --- ceil(n) -> BigDecimal
  # 
  # self 以上の整数のうち、最も小さい整数を計算し、その値を返します。
  # 
  # @param n 小数点以下の桁数を整数で指定します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").ceil   # => 2
  # BigDecimal("-1.23456").ceil  # => -1
  # //}
  # 
  # 以下のように引数を与えて、小数点以下 n+1 位の数字を操作することもできます。
  # n >= 0 なら、小数点以下 n + 1 位の数字を操作します
  # (小数点以下を、最大 n 桁にします)。
  # n が負のときは小数点以上 n 桁目を操作します
  # (小数点位置から左に少なくとも n 個の 0 が並びます)。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").ceil(4).to_f   # => 1.2346
  # BigDecimal("15.23456").ceil(-1).to_f # => 20.0
  # //}
  def ceil; end

  # --- clone -> self
  # 
  # self を返すように、BigDecimal で定義されています。
  def clone; end

  # --- coerce(other) -> Array
  # 
  # self と other が同じクラスになるよう、self か other を変換し [other,
  # self] という配列にして返します。
  # 
  # @param other 比較または変換するオブジェクト
  # 
  # [[m:BigDecimal#coerce]] は Ruby における強制型変換のための機能です。
  # [[c:BigDecimal]] オブジェクトとその他のオブジェクト間の各種の計算は
  # [[m:BigDecimal#coerce]] の結果を元に行われます。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # a = BigDecimal("1.0")
  # b = a / 2.0 # => 0.5e0
  # //}
  # 
  # other に [[c:Rational]] オブジェクトを指定した場合は self の有効桁数を
  # 用いて変換を行います。
  # 
  # 数値を表す文字列から [[c:BigDecimal]] オブジェクトに変換する機能はデフォ
  # ルトでは無効になっています。必要な場合は ENABLE_NUMERIC_STRING を有効に
  # して Ruby をコンパイルしてください。
  def coerce; end

  # --- div(other, n) -> BigDecimal
  # 
  # 商を計算します。
  # 
  # self / other を最大で n 桁まで計算します。計算結果の精度が n より大きい
  # ときは [[m:BigDecimal.mode]] で指定された方法で丸められます。
  # 
  # @param other self を割る数を指定します。
  # 
  # @param n 有効桁数を整数で指定します。省略するか 0 を指定した場合は
  #          [[m:BigDecimal#/]] と同じ値を返します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # @see [[m:BigDecimal#/]]
  def div; end

  # --- divmod(n) -> [BigDecimal, BigDecimal]
  # 
  # self を other で割った商 q と余り r を、 [q, r] という 2 要素の配列にし
  # て返します。
  # 
  # 商は負の無限大負方向に丸められます。
  # 
  # @param n self を割る数を指定します。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # 
  # a = BigDecimal("42")
  # b = BigDecimal("9")
  # 
  # a.divmod(b) # => [0.4e1, 0.6e1]
  # //}
  def divmod; end

  # --- dup -> BigDecimal
  # 
  # self を返すように、BigDecimal で定義されています。
  def dup; end

  # --- exponent -> Integer
  # 
  # self の指数部を整数値で返します。
  def exponent; end

  # --- finite? -> bool
  # 
  # self が ∞または NaN でないときに true を返します。それ以外のときに
  # false を返します。
  def finite?; end

  # --- fix -> BigDecimal
  # 
  # self の整数部分を新しい [[c:BigDecimal]] オブジェクトにして返します。
  def fix; end

  # --- floor    -> Integer
  # --- floor(n) -> BigDecimal
  # 
  # self 以下の最大整数を返します。
  # 
  # @param n 小数点以下の桁数を整数で指定します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").floor   # => 1
  # BigDecimal("-1.23456").floor  # => -2
  # //}
  # 
  # 以下のように引数 n を与えることもできます。
  # n >= 0 なら、小数点以下 n + 1 位の数字を操作します
  # (小数点以下を、最大 n 桁にします)。
  # n が負のときは小数点以上 n 桁目を操作します
  # (小数点位置から左に少なくとも n 個の 0 が並びます)。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").floor(4).to_f   # => 1.2345
  # BigDecimal("15.23456").floor(-1).to_f # => 10.0
  # //}
  def floor; end

  # --- frac -> BigDecimal
  # 
  # self の小数部分を新しい [[c:BigDecimal]] オブジェクトにして返します。
  def frac; end

  # --- hash -> Integer
  # 
  # self のハッシュ値を返します。
  # 
  # 符号、小数部、指数部が同じ場合に同じハッシュ値を返します。
  def hash; end

  # --- infinite? -> 1 | -1 | nil
  # 
  # self が +∞のときに 1 、-∞のときに-1、それ以外のときに nil を返します。
  def infinite?; end

  # --- inspect -> String
  # 
  # [[c:BigDecimal]] オブジェクトを表す文字列を返します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1234.5678").inspect
  # # => "0.12345678e4"
  # //}
  def inspect; end

  # --- mult(other, n) -> BigDecimal
  # 
  # 積を計算します。
  # 
  # self * other を最大で n 桁まで計算します。計算結果の精度が n より大きい
  # ときは [[m:BigDecimal.mode]] で指定された方法で丸められます。
  # 
  # @param other self に掛ける数を指定します。
  # 
  # @param n 有効桁数を整数で指定します。0 を指定した場合は
  #          [[m:BigDecimal#*]] と同じ値を返します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # @see [[m:BigDecimal#*]]
  def mult; end

  # --- nan? -> bool
  # 
  # self が NaN のときに true を返します。それ以外のときに false を返します。
  def nan?; end

  # --- nonzero? -> self | nil
  # 
  # self が 0 以外のときに self を返します。0 のときに nil を返します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("0").nonzero? # => nil
  # BigDecimal("1").nonzero? # => 0.1e1
  # //}
  def nonzero?; end

  # --- precs -> [Integer, Integer]
  # 
  # self の有効数字と最大有効数字の配列を返します。
  def precs; end

  # --- remainder(n) -> BigDecimal
  # 
  # self を n で割った余りを返します。
  # 
  # @param n self を割る数を指定します。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # x = BigDecimal((2**100).to_s)
  # x.remainder(3).to_i     # => 1
  # (-x).remainder(3).to_i  # => -1
  # x.remainder(-3).to_i    # => 1
  # (-x).remainder(-3).to_i # => -1
  # //}
  # 
  # 戻り値は self と同じ符号になります。これは [[m:BigDecimal#%]] とは異な
  # る点に注意してください。詳細は [[m:Numeric#%]]、
  # [[m:Numeric#remainder]] を参照して下さい。
  def remainder; end

  # --- round    -> Integer
  # --- round(n) -> BigDecimal
  # --- round(n, b) -> BigDecimal
  # 
  # クラスメソッド [[m:BigDecimal.mode]]([[m:BigDecimal::ROUND_MODE]],flag) で指定した
  # [[m:BigDecimal::ROUND_MODE]] に従って丸め操作を実行します。
  # 
  # @param n 小数点以下の桁数を整数で指定します。
  # 
  # @param b 丸め処理の方式として、[[m:BigDecimal.mode]] の第 1 引数と同じ
  #          値を指定します。
  # 
  # [[m:BigDecimal.mode]]([[m:BigDecimal::ROUND_MODE]],flag) で何も指定せず、
  # かつ、引数を指定しない場合は
  # 「小数点以下第一位の数を四捨五入して整数(BigDecimal 値)」にします。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").round   # => 1
  # BigDecimal("-1.23456").round  # => -1
  # //}
  # 
  # 以下のように引数を与えて、小数点以下 n+1 位の数字を操作することもできます。
  # n が正の時は、小数点以下 n+1 位の数字を丸めます(小数点以下を、最大 n 桁にします)。
  # n が負のときは小数点以上 n 桁目を丸めます(小数点位置から左に少なくとも n 個の 0 が並びます)。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").round(4).to_f    # => 1.2346
  # BigDecimal("15.23456").round(-1).to_f  # => 20.0
  # //}
  # 
  # 2番目の引数を指定すると、[[m:BigDecimal.mode]] の指定を無視して、指定さ
  # れた方法で丸め操作を実行します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").round(3,BigDecimal::ROUND_HALF_EVEN).to_f   # => 1.235
  # require "bigdecimal"
  # BigDecimal("1.23356").round(3,BigDecimal::ROUND_HALF_EVEN).to_f   # => 1.234
  # //}
  # 
  # @see [[m:BigDecimal.mode]]
  def round; end

  # --- save_exception_mode { ... } -> object
  # 
  # 例外処理に関する [[m:BigDecimal.mode]] の設定を保存してブロックを評価し
  # ます。ブロック中で変更した設定はブロックの評価後に復元されます。
  # 
  # ブロックの評価結果を返します。
  def save_exception_mode; end

  # --- save_limit { ... } -> object
  # 
  # 現在の [[m:BigDecimal.limit]] の設定を保存してブロックを評価します。ブ
  # ロック中で変更した設定はブロックの評価後に復元されます。
  # 
  # ブロックの評価結果を返します。
  def save_limit; end

  # --- save_rounding_mode { ... } -> object
  # 
  # 丸め処理に関する [[m:BigDecimal.mode]] の設定を保存してブロックを評価します。
  # ブロック中で変更した設定はブロックの評価後に復元されます。
  # 
  # ブロックの評価結果を返します。
  def save_rounding_mode; end

  # --- sign -> -3 | -2 | -1 | 0 | 1 | 2 | 3
  # 
  # 自身の符号等の性質に応じて、[[c:Integer]] を返します。
  # 
  # 符号が正であれば正の整数を返し、負であれば負の整数を返し、NaN であれば 0 を返します。
  # 
  #   NaN        であれば、 0。 BigDecimal::SIGN_NaN と同じです。
  #   +0         であれば、 1。 BigDecimal::SIGN_POSITIVE_ZERO と同じです。
  #   -0         であれば、-1。 BigDecimal::SIGN_NEGATIVE_ZERO と同じです。
  #   有限の正の値 であれば、 2。 BigDecimal::SIGN_POSITIVE_FINITE と同じです。
  #   有限の負の値 であれば、-2。 BigDecimal::SIGN_NEGATIVE_FINITE と同じです。
  #   +Infinity  であれば、 3。 BigDecimal::SIGN_POSITIVE_INFINITE と同じです。
  #   -Infinity  であれば、-3。 BigDecimal::SIGN_NEGATIVE_INFINITE と同じです。
  # 
  # BigDecimal は、 0 であっても、+ か - の符号を持つことに注意して下さい。
  # (「[[ref:lib:bigdecimal#internal_structure]]」を参照)
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # 
  # p BigDecimal("NaN").sign       # =>  0
  # p BigDecimal("0").sign         # =>  1
  # p BigDecimal("100").sign       # =>  2
  # p BigDecimal("Infinity").sign  # =>  3
  # p BigDecimal("-0").sign        # => -1
  # p BigDecimal("-5").sign        # => -2
  # p BigDecimal("-Infinity").sign # => -3
  # 
  # p BigDecimal("0").sign == BigDecimal::SIGN_POSITIVE_ZERO  # => true
  # //}
  def sign; end

  # --- split -> [Integer, String, Integer, Integer]
  # 
  # BigDecimal 値を 0.xxxxxxx*10**n と表現したときに、
  # 符号 (NaNのときは 0、それ以外は+1か-1になります)、
  # 仮数部分の文字列("xxxxxxx")と、基数(10)、更に指数 n を配列で返します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # a = BigDecimal("3.14159265")
  # f, x, y, z = a.split
  # //}
  # 
  # とすると、f = 1、x = "314159265"、y = 10、z = 1 になります。
  # 従って、以下のようにする事で [[c:Float]] に変換することができます。
  # 
  # //emlist[][ruby]{
  # s = "0."+x
  # b = f*(s.to_f)*(y**z)
  # //}
  # 
  # @see [[m:BigDecimal#to_f]]
  def split; end

  # --- sqrt(n) -> BigDecimal
  # 
  # self の有効桁 n 桁の平方根 (n の平方根ではありません) をニュートン法で
  # 計算します。
  # 
  # @param n 有効桁数を整数で指定します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  def sqrt; end

  # --- sub(other, n) -> BigDecimal
  # 
  # 差を計算します。
  # 
  # self - other を最大で n 桁まで計算します。計算結果の精度が n より大きい
  # ときは [[m:BigDecimal.mode]] で指定された方法で丸められます。
  # 
  # @param other self から引く数を指定します。
  # 
  # @param n 有効桁数を整数で指定します。0 を指定した場合は
  #          [[m:BigDecimal#-]] と同じ値を返します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  # 
  # @see [[m:BigDecimal#-]]
  def sub; end

  # --- to_d -> BigDecimal
  # 
  # 自身を返します。
  # 
  # @return [[c:BigDecimal]] オブジェクト
  def to_d; end

  # --- to_digits -> String
  # 
  # 自身を "1234.567" のような十進数の形式にフォーマットした文字列に変換し
  # ます。
  # 
  # @return 十進数の形式にフォーマットした文字列
  # 
  # 注意:
  # 
  # このメソッドは非推奨です。[[m:BigDecimal#to_s]]("F") を使用してください。
  def to_digits; end

  # --- to_f -> Float
  # 
  # self の近似値を表す [[c:Float]] オブジェクトに変換します。
  # 
  # 仮数部や指数部の情報が必要な場合は、[[m:BigDecimal#split]] メソッドを利
  # 用してください。
  # 
  # @see [[m:BigDecimal#split]]
  def to_f; end

  # --- to_i   -> Integer
  # --- to_int -> Integer
  # 
  # self の小数点以下を切り捨てて整数に変換します。
  # 
  # @raise FloatDomainError self が無限大や NaN であった場合に発生します。
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
  # require 'json/add/bigdecimal'
  # BigDecimal('0.123456789123456789').to_json # => "{\"json_class\":\"BigDecimal\",\"b\":\"36:0.123456789123456789e0\"}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_r -> Rational
  # 
  # self を [[c:Rational]] オブジェクトに変換します。
  def to_r; end

  # --- to_s    -> String
  # --- to_s(n) -> String
  # 
  # self を文字列に変換します (デフォルトは "0.xxxxxen" の形になります)。
  # 
  # @param n 出力の形式を [[c:Integer]] または [[c:String]] で指定します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").to_s  #  ==> "0.123456e1"
  # //}
  # 
  # 引数 n に正の整数が指定されたときは、小数点で分けられる左右部分を、
  # それぞれ n 桁毎に空白で区切ります。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("0.1234567890123456789").to_s(10)   # => "0.1234567890 123456789e0"
  # //}
  # 
  # 引数 n に正の整数を表す文字列を指定することもできます。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("0.1234567890123456789").to_s("10") # => "0.1234567890 123456789e0"
  # //}
  # 
  # 文字列の最初に '+' または ' ' を付けると、値が正の場合先頭に '+' または
  # ' ' が付きます。負の場合は常に '-' が付きます。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("0.123456").to_s(" 3") # => " 0.123 456e0"
  # BigDecimal("0.123456").to_s("+3") # => "+0.123 456e0"
  # BigDecimal("-0.123456").to_s("3") # => "-0.123 456e0"
  # //}
  # 
  # さらに文字列の最後に指数形式 ('E' または 'e') か指数を使わない形式
  # ('F' または 'f') かを指定出来ます。デフォルトは指数形式です。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("123.456").to_s("e")     # => "0.123456e3"
  # BigDecimal("123.456").to_s("E")     # => "0.123456e3"
  #                                     # (大文字で指定しても出力は 'e' になる)
  # BigDecimal("123.456").to_s("F")     # => "123.456"
  # BigDecimal("1234.5678").to_s("3F")  # => "123 4.567 8"
  # //}
  def to_s; end

  # --- truncate    -> Integer
  # --- truncate(n) -> BigDecimal
  # 
  # 小数点以下の数を切り捨てて整数にします。
  # 
  # @param n 小数点以下の桁数を整数で指定します。
  # 
  # 以下のように引数を与えて、小数点以下 n+1 位の数字を操作することもできます。
  # n が正の時は、小数点以下 n+1 位の数字を切り捨てます
  # (小数点以下を、最大 n 桁にします)。
  # n が負のときは小数点以上 n 桁目を操作します
  # (小数点位置から左に少なくとも n 個の 0 が並びます)。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1.23456").truncate(4).to_f    # => 1.2345
  # BigDecimal("15.23456").truncate(-1).to_f  # => 10.0
  # //}
  def truncate; end

  # --- zero? -> bool
  # 
  # self が 0 のときに true を返します。それ以外のときに false を返します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("0").zero? # => true
  # BigDecimal("1").zero? # => false
  # //}
  def zero?; end

  # --- _load(str) -> BigDecimal
  # 
  # 引数で指定された文字列を元に [[c:BigDecimal]] オブジェクトを復元します。
  # [[m:Marshal.#load]] から呼び出されます。
  # 
  # @param str 復元する値を表す文字列を指定します。
  # 
  # @raise TypeError 引数に不正な文字が含まれる場合に発生します。
  # 
  # @see [[m:BigDecimal#_dump]], [[m:Marshal.#dump]], [[m:Marshal.#load]]
  def _load; end

  # --- double_fig -> Integer
  # 
  # Ruby の [[c:Float]] クラスが保持できる有効数字の数を返します。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # p BigDecimal::double_fig  # ==> 16 (depends on the CPU etc.)
  # //}
  # 
  # double_figは以下の C プログラムの結果と同じです。
  # 
  #     double v = 1.0;
  #     int double_fig = 0;
  #     while (v + 1.0 > 1.0) {
  #        ++double_fig;
  #        v /= 10;
  #     }
  def double_fig; end

  # --- json_create(hash) -> BigDecimal
  # 
  # JSON のオブジェクトから [[c:BigDecimal]] のオブジェクトを生成して返します。
  # 
  # @param hash [[m:Marshal.#load]] 可能な値をキー 'b' に持つハッシュを指定します。
  def json_create; end

  # --- limit(n = nil) -> Integer
  # 
  # 生成されるBigDecimalオブジェクトの最大桁数をn桁に制限します。
  # n を指定しない、または n が nil の場合は、現状の最大桁数が返ります。
  # 
  # 戻り値は設定する前の値です。設定値のデフォルト値は0で、桁数無制限を表しています。
  # 
  # 計算を続行する間に、数字の桁数が無制限に増えてしまうような場合 limit で
  # 予め桁数を制限できます。この場合 [[m:BigDecimal.mode]] で指定された丸め処理が
  # 実行されます。ただし、インスタンスメソッド ([[m:BigDecimal#truncate]] /
  # [[m:BigDecimal#round]] / [[m:BigDecimal#ceil]] / [[m:BigDecimal#floor]] /
  # [[m:BigDecimal#add]]/ [[m:BigDecimal#sub]] / [[m:BigDecimal#mult]] /
  # [[m:BigDecimal#div]]) の桁数制限は limit より優先されます。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # n = 0 # デフォルト値
  # mf = BigDecimal::limit(n)
  # //}
  # 
  # @param n 新しい最大桁数を正の整数で指定します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  def limit; end

  # --- mode(s)    -> Integer | nil
  # --- mode(s, v) -> Integer | nil
  # 
  # [[c:BigDecimal]] の計算処理の制御方法を設定、確認します。
  # 
  # 第2引数を省略、または nil を指定すると現状の設定値を返します。
  # 
  # @param s 制御方法の設定、確認を行う項目を BigDecimal::EXCEPTION_*、
  #          [[m:BigDecimal::ROUND_MODE]] のいずれかで指定します。
  # 
  # @param v 引数 s が [[m:BigDecimal::ROUND_MODE]] の場合は
  #          [[m:BigDecimal::ROUND_MODE]] 以外の BigDecimal::_ROUND* のいず
  #          れかを指定します。指定した丸め処理が有効になります。
  #          それ以外の場合は、true、false、nil のいずれかを指定します。
  #          true を指定した場合は設定値が有効になり、false を指定した場合
  #          は設定値が無効になります。
  # 
  # @raise TypeError 引数 s に有効でない値を指定した場合に発生します。
  # 
  # @raise ArgumentError 引数 s に例外処理に関する値を指定し、引数 v に
  #                      true、false 以外の値を指定した場合に発生します。
  # 
  # 以下の使用方法が定義されています。
  # 
  # === 例外処理
  # 
  # 計算結果が非数(NaN)やゼロによる除算になったときの処理を定義することができます。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # flag = false # デフォルト値
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_NaN,flag)
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_INFINITY,flag)
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_UNDERFLOW,flag)
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_OVERFLOW,flag)
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_ZERODIVIDE,flag)
  # f = BigDecimal::mode(BigDecimal::EXCEPTION_ALL,flag)
  # //}
  # 
  #   * [[m:BigDecimal::EXCEPTION_NaN]] は結果が NaN になったときの指定です。
  #   * [[m:BigDecimal::EXCEPTION_INFINITY]] は結果が無限大(±Infinity)になったときの指定です。
  #   * [[m:BigDecimal::EXCEPTION_UNDERFLOW]] は指数部がアンダーフローするときの指定です。
  #   * [[m:BigDecimal::EXCEPTION_OVERFLOW]] は指数部がオーバーフローするときの指定です。
  #   * [[m:BigDecimal::EXCEPTION_ZERODIVIDE]] はゼロによる割り算を実行したときの指定です。
  #   * [[m:BigDecimal::EXCEPTION_ALL]] は、可能な全てに対して一括して設定するときに使用します。
  # 
  # flag が true のときは、指定した状態になったときに例外を発行するようになります。
  # flag が false(デフォルト)なら、例外は発行されません。計算結果は以下のようになります。
  # 
  #   * [[m:BigDecimal::EXCEPTION_NaN]] のとき、非数(NaN)
  #   * [[m:BigDecimal::EXCEPTION_INFINITY]] のとき、無限(+ or -Infinity)
  #   * [[m:BigDecimal::EXCEPTION_UNDERFLOW]] のとき、ゼロ
  #   * [[m:BigDecimal::EXCEPTION_OVERFLOW]] のとき、+Infinity か -Infinity
  #   * [[m:BigDecimal::EXCEPTION_ZERODIVIDE]] のとき、+Infinity か -Infinity
  # 
  # [[m:BigDecimal::EXCEPTION_INFINITY]]、[[m:BigDecimal::EXCEPTION_OVERFLOW]]、
  # [[m:BigDecimal::EXCEPTION_ZERODIVIDE]] は今のところ同じです。
  # 戻り値は、設定後の値です。「値」の意味は、例えば [[m:BigDecimal::EXCEPTION_NaN]]
  # と「値」の & が ゼロ以外ならば [[m:BigDecimal::EXCEPTION_NaN]]が設定されているという意味です。
  # 
  # === 丸め処理指定
  # 
  # 計算途中の丸め操作の指定ができます。
  # 
  # //emlist[][ruby]{
  # require 'bigdecimal'
  # flag = BigDecimal::ROUND_HALF_UP # デフォルト値
  # f = BigDecimal::mode(BigDecimal::ROUND_MODE,flag)
  # //}
  # 
  # の形式で指定します。
  # ここで、flag は以下(括弧内は対応するインスタンスメソッド)の一つを指定します。
  # 
  #   * [[m:BigDecimal::ROUND_UP]] 全て切り上げます。
  #   * [[m:BigDecimal::ROUND_DOWN]] 全て切り捨てます(truncate)。
  #   * [[m:BigDecimal::ROUND_HALF_UP]] 四捨五入します(デフォルト)。
  #   * [[m:BigDecimal::ROUND_HALF_DOWN]] 五捨六入します。
  #   * [[m:BigDecimal::ROUND_HALF_EVEN]] 四捨六入します。5の時は上位1桁が奇数の時のみ繰り上げます(Banker's rounding)。
  #   * [[m:BigDecimal::ROUND_CEILING]] 数値の大きい方に繰り上げます(ceil)。
  #   * [[m:BigDecimal::ROUND_FLOOR]] 数値の小さい方に繰り下げます(floor)。
  # 
  # 戻り値は指定後の flag の値です。第2引数に nil を指定すると、現状の設定値が返ります。 mode メソッドでは丸め操作の位置をユーザが指定することはできません。丸め操作と位置を自分で制御したい場合は BigDecimal::limit や truncate/round/ceil/floor、 add/sub/mult/div といったインスタンスメソッドを使用して下さい。
  def mode; end

  # --- new(s, exception: true)    -> BigDecimal | nil
  # --- new(s, n, exception: true) -> BigDecimal | nil
  # 
  # このメソッドは Ruby 2.5 から deprecated です。[[m:Kernel.#BigDecimal]] を使用してください。
  # 
  # 新しい BigDecimal オブジェクトを生成します。
  # 
  # 詳しくは [[m:Kernel.#BigDecimal]] を参照してください。
  def new; end

  # --- BASE -> Integer
  # 
  # ライブラリ内部で使用します。
  def BASE; end

  # --- EXCEPTION_ALL -> Integer
  # 
  # [[c:BigDecimal]] の計算において例外を発生させるかどうかを設定、確認する
  # 際の値を返します。
  # 
  # 以下の例外全てが対象です。
  # 
  #  * [[m:BigDecimal::EXCEPTION_INFINITY]]
  #  * [[m:BigDecimal::EXCEPTION_NaN]]
  #  * [[m:BigDecimal::EXCEPTION_OVERFLOW]]
  #  * [[m:BigDecimal::EXCEPTION_UNDERFLOW]]
  #  * [[m:BigDecimal::EXCEPTION_ZERODIVIDE]]
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_ALL; end

  # --- EXCEPTION_INFINITY -> Integer
  # 
  # [[c:BigDecimal]] の計算結果が無限大になった場合に例外を発生させるかどう
  # かを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_INFINITY; end

  # --- EXCEPTION_NaN -> Integer
  # 
  # [[c:BigDecimal]] の計算結果が NaN になった場合に例外を発生させるかどう
  # かを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_NaN; end

  # --- EXCEPTION_OVERFLOW -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の指数部がオーバーフローした場合に例外を発生
  # させるかどうかを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_OVERFLOW; end

  # --- EXCEPTION_UNDERFLOW -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の指数部がアンダーフローした場合に例外を発生
  # させるかどうかを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_UNDERFLOW; end

  # --- EXCEPTION_ZERODIVIDE -> Integer
  # 
  # [[c:BigDecimal]] に 0 による割り算を実行した場合に例外を発生させるかど
  # うかを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。
  def EXCEPTION_ZERODIVIDE; end

  # --- INFINITY -> BigDecimal
  # 
  # 正の無限大を表す [[c:BigDecimal]] オブジェクトを返します。
  def INFINITY; end

  # --- NAN -> BigDecimal
  # 
  # NaN を表す [[c:BigDecimal]] オブジェクトを返します。
  def NAN; end

  # --- ROUND_CEILING -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で数値の大きい方に繰り上げるかどう
  # かを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_CEILING; end

  # --- ROUND_DOWN -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で全て切り捨てるかどうかを設定、確
  # 認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_DOWN; end

  # --- ROUND_FLOOR -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で数値の小さい方に繰り下げるかどう
  # かを設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_FLOOR; end

  # --- ROUND_HALF_DOWN -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で五捨六入するかどうかを設定、確認
  # する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_HALF_DOWN; end

  # --- ROUND_HALF_EVEN -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で四捨六入するかどうかを設定、確認
  # する際の値を返します。5の時は上位1桁が奇数の時のみ繰り上げます
  # (Banker's rounding)。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_HALF_EVEN; end

  # --- ROUND_HALF_UP -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で四捨五入するかどうかを設定、確認
  # する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_HALF_UP; end

  # --- ROUND_MODE -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理を設定、確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 1 引数に指定します。詳細については
  # [[m:BigDecimal.mode]] を参照してください。
  def ROUND_MODE; end

  # --- ROUND_UP -> Integer
  # 
  # [[c:BigDecimal]] の計算結果の丸め処理で全て切り上げするかどうかを設定、
  # 確認する際の値を返します。
  # 
  # [[m:BigDecimal.mode]] の第 2 引数に指定します。
  def ROUND_UP; end

  # --- SIGN_NEGATIVE_FINITE -> Integer
  # 
  # 負の値に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_NEGATIVE_FINITE; end

  # --- SIGN_NEGATIVE_INFINITE -> Integer
  # 
  # 負の無限大に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_NEGATIVE_INFINITE; end

  # --- SIGN_NEGATIVE_ZERO -> Integer
  # 
  # 負の 0 に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_NEGATIVE_ZERO; end

  # --- SIGN_NaN -> Integer
  # 
  # NaN に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_NaN; end

  # --- SIGN_POSITIVE_FINITE -> Integer
  # 
  # 正の値に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_POSITIVE_FINITE; end

  # --- SIGN_POSITIVE_INFINITE -> Integer
  # 
  # 正の無限大に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_POSITIVE_INFINITE; end

  # --- SIGN_POSITIVE_ZERO -> Integer
  # 
  # 正の 0 に対応する [[m:BigDecimal#sign]] の値を返します。
  def SIGN_POSITIVE_ZERO; end

  # --- VERSION -> String
  # 
  # [[lib:bigdecimal]] ライブラリのバージョンを文字列で返します。
  def VERSION; end

end
