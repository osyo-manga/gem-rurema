module SecureRandom
  # --- alphanumeric(n = nil)    -> String
  # 
  # ランダムな英数字を生成して返します。
  # 
  # @param n 生成される文字列のサイズを整数で指定します。
  #          nil を指定した場合 n として 16 が使われます。
  # @return A-Z, a-z, 0-9 からなる文字列が返されます。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  # //emlist[][ruby]{
  # require 'securerandom'
  # p SecureRandom.alphanumeric #=> "2BuBuLf3WfSKyQbR"
  # p SecureRandom.alphanumeric(10) #=> "i6K93NdqiH"
  # //}
  def alphanumeric; end

  # --- base64(n = nil)    -> String
  # 
  # ランダムな base64 文字列を生成して返します。
  # 
  # @param n 文字列の生成に使われるランダムネスのサイズを整数で指定します。
  #          生成される文字列のサイズではないことに注意して下さい。生成される文字列のサイズは
  #          n の約 4/3 倍になります。nil を指定した場合 n として 16 が使われます。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  #   require 'securerandom'
  #   p SecureRandom.base64(3)    #=> "4pYO"  (文字列のサイズは 3 でない)
  # 
  # @see [[rfc:3548]]
  def base64; end

  # --- hex(n = nil)    -> String
  # 
  # ランダムな hex 文字列を生成して返します。
  # 
  # @param n 文字列の生成に使われるランダムネスのサイズを整数で指定します。
  #          生成される文字列のサイズではないことに注意して下さい。生成される文字列のサイズは
  #          n の 2 倍になります。nil を指定した場合 n として 16 が使われます。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  #   require 'securerandom'
  #   p SecureRandom.hex(3)    #=> "f72233"   (文字列のサイズは 3 でない)
  def hex; end

  # --- random_bytes(n = nil)    -> String
  # 
  # ランダムなバイト列を生成して返します。
  # 
  # @param n 生成される文字列のサイズを整数で指定します。
  #          nil を指定した場合 n として 16 が使われます。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  #   require 'securerandom'
  #   p SecureRandom.random_bytes(3)    #=> "\321\020\203"
  def random_bytes; end

  # --- random_number(n = 0)     -> Integer | Float
  # 
  # ランダムな数値を生成して返します。
  # n が 1 以上の整数の場合、0 以上 n 未満の整数を返します。
  # n が 0 の場合、0.0 以上 1.0 未満の実数を返します。
  # 
  # @param n ランダムな数値の上限を数値で指定します。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  #   require 'securerandom'
  #   p SecureRandom.random_number(1 << 64)    #=> 4078466195356651249
  def random_number; end

  # --- urlsafe_base64(n = nil, padding = false)  -> String
  # 
  # ランダムで URL-safe な base64 文字列を生成して返します。
  # 
  # @param n 文字列の生成に使われるランダムネスのサイズを整数で指定します。
  #          生成される文字列のサイズはn の約 4/3 倍になります。
  #          nil を指定した場合 n として 16 が使われます。
  # 
  # @param padding 真を指定すると '=' でパディングを行います。
  #                偽を指定するとパディングを行いません。デフォルトは偽です。
  # 
  # @raise NotImplementedError  安全な乱数発生器が使えない場合に発生します。
  # 
  #    require 'securerandom'
  #    p SecureRandom.urlsafe_base64 #=> "b4GOKm4pOYU_-BOXcrUGDg"
  #    p SecureRandom.urlsafe_base64 #=> "UZLdOkzop70Ddx-IJR0ABg"
  #    p SecureRandom.urlsafe_base64(nil, true) #=> "i0XQ-7gglIsHGV2_BNPrdQ=="
  #    p SecureRandom.urlsafe_base64(nil, true) #=> "-M8rLhr7JEpJlqFGUMmOxg=="
  # 
  # @see [[m:SecureRandom.base64]],  [[rfc:3548]]
  def urlsafe_base64; end

  # --- uuid   -> String
  # 
  # バージョン 4 の UUID (Universally Unique IDentifier) を生成して返します。
  # 
  # version 4 の UUID は全くランダムです (バージョンを除いて)。
  # この UUID は MAC アドレスや時刻などのような意味のある情報を含みません。
  # 
  # @raise NotImplementedError 安全な乱数発生器が使えない場合に発生します。
  # 
  #    require 'securerandom'
  #    p SecureRandom.uuid #=> "2d931510-d99f-494a-8c67-87feb05e1594"
  #    p SecureRandom.uuid #=> "62936e70-1815-439b-bf89-8492855a7e6b"
  # 
  # @see [[rfc:4122]]
  def uuid; end

end
