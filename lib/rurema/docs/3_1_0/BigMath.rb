module BigMath
  # --- E(prec) -> BigDecimal
  # 
  # 自然対数の底 e を prec で指定した精度で計算します。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise ArgumentError prec に 0 以下が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::E(2)  #=> 0.27e1
  # puts BigMath::E(4)  #=> 0.2718e1
  # puts BigMath::E(10) #=> 0.2718281828e1
  # //}
  def E; end

  # --- PI(prec) -> BigDecimal
  # 
  # 円周率を prec で指定した精度で計算します。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise ArgumentError prec に 0 以下が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::PI(2)  #=> 0.31415926535897932384671233672993238432e1
  # puts BigMath::PI(5)  #=> 0.31415926535897932384627534923029509162e1
  # puts BigMath::PI(10) #=> 0.3141592653589793238462643388813853786957412e1
  # //}
  def PI; end

  # --- atan(x, prec) -> BigDecimal
  # 
  # x の逆正接関数を prec で指定した精度で計算します。単位はラジアンです。
  # x に無限大や NaN を指定した場合には NaN を返します。
  # 
  # @param x 計算対象の BigDecimal オブジェクト。単位はラジアン。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise ArgumentError x の絶対値が1以上の場合に発生します。
  # 
  # @raise ArgumentError prec に 0 以下が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::atan(BigDecimal('0.5'), 10) #=> 0.463647609000806116214256237466868871528608e0
  # //}
  # 
  # === 注意
  # 
  # x の絶対値を 0.9999 のような 1 に近すぎる値にすると計算結果が収束しない
  # 可能性があります。
  def atan; end

  # --- cos(x, prec) -> BigDecimal
  # 
  # x の余弦関数を prec で指定した精度で計算します。単位はラジアンです。x
  # に無限大や NaN を指定した場合には NaN を返します。
  # 
  # @param x 計算対象の BigDecimal オブジェクト。単位はラジアン。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise ArgumentError prec に 0 以下が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::cos(BigDecimal('0.5'), 10) #=> 0.8775825618903727161162815826327690580439923e0
  # //}
  def cos; end

  # --- exp(x, prec) -> BigDecimal
  # 
  # x の指数関数を prec で指定した精度で計算します。
  # 
  # x に正の無限大を指定した場合は正の無限大を返します。負の無限大を指定し
  # た場合には 0 を返します。NaN を指定した場合には NaNを返します。
  # 
  # @param x 計算対象の数値を [[c:Integer]]、[[c:BigDecimal]]、
  #          [[c:Float]]、[[c:Rational]]オブジェクトのいずれかで指定します。
  # 
  # @param prec 計算結果の精度を指定します。
  # 
  # @raise ArgumentError x に [[c:Integer]]、[[c:BigDecimal]]、
  #                      [[c:Float]]、[[c:Rational]]以外のオブジェクトを指
  #                      定した場合に発生します。
  # 
  # @raise ArgumentError prec に 0 以下の数値が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::exp(BigDecimal('1'), 10) #=> 0.2718281828e1
  # //}
  def exp; end

  # --- log(x, prec) -> BigDecimal
  # 
  # x の自然対数を prec で指定した精度で計算します。
  # 
  # x に無限大を指定した場合は無限大を返します。NaN を指定した場合には NaN
  # を返します。
  # 
  # @param x 計算対象の数値を [[c:Integer]]、[[c:Float]]、
  #          [[c:Rational]]、[[c:BigDecimal]] オブジェクトのいずれかで指定
  #          します。
  # 
  # @param prec 計算結果の精度を指定します。
  # 
  # @raise Math::DomainError x に 0 以下の数値か [[c:Complex]] オブジェクト
  #                          が指定された場合に発生します。
  # 
  # @raise ArgumentError prec に 0 以下の数値が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::log(BigDecimal('2'), 10) #=> 0.693147180559945309417232112588603776354688e0
  # //}
  def log; end

  # --- sin(x, prec) -> BigDecimal
  # 
  # x の正弦関数を prec で指定した精度で計算します。単位はラジアンです。x
  # に無限大や NaN を指定した場合には NaN を返します。
  # 
  # @param x 計算対象の BigDecimal オブジェクト。単位はラジアン。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise ArgumentError prec に 0 以下が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::sin(BigDecimal('0.5'), 10) #=> 0.479425538604203000273287935689073955184741e0
  # //}
  def sin; end

  # --- sqrt(x, prec) -> BigDecimal
  # 
  # x の平方根を prec で指定した精度で計算します。
  # 
  # @param x 平方根を求める数。
  # 
  # @param prec 計算結果の精度。
  # 
  # @raise FloatDomainError x に 0 以下、もしくは NaN が指定された場合に発生します。
  # 
  # @raise ArgumentError prec に 0 未満が指定された場合に発生します。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal/math"
  # 
  # puts BigMath::sqrt(BigDecimal('2'), 10) #=> 0.1414213562373095048666666667e1
  # //}
  def sqrt; end

end
