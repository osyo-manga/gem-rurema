module OpenSSL::PKCS5
  # --- pbkdf2_hmac(pass, salt, iter, keylen, digest) -> String
  # pass と salt から共通鍵暗号の鍵および IV(Initialization Vector)
  # を生成します。
  # 
  # [[m:OpenSSL::PKCS5.#pbkdf2_hmac_sha1]] と異なり任意の
  # ハッシュ関数を利用できます。
  # 
  # 返り値の文字列から鍵と IV に必要なバイト数を切り出して利用します。
  # 
  # この関数は OpenSSL 1.0.0 以降でなければ利用できません。
  # 
  # @param pass パスワード文字列
  # @param salt salt 文字列
  # @param iter 鍵および IV 生成時のハッシュ関数の繰り返し回数
  # @param keylen 結果の文字列のバイト数
  # @param digest ハッシュ関数を表す文字列もしくは [[c:OpenSSL::Digest]] のオブジェクト
  # @raise OpenSSL::PKCS5::PKCS5Error 鍵、IV の生成に失敗した場合に発生します
  # @see [[m:OpenSSL::PKCS5.#pbkdf2_hmac_sha1]]
  def pbkdf2_hmac; end

  # --- pbkdf2_hmac_sha1(pass, salt, iter, keylen) -> String
  # pass と salt から共通鍵暗号の鍵および IV(Initialization Vector)
  # を生成します。
  # 
  # iter は鍵生成時のハッシュ関数の繰り返し回数で、大きな値を指定するほど
  # 安全であることが期待されます。RFCでは少なくとも1000を
  # 指定することを推奨しています。
  # 
  # 返り値の文字列から鍵と IV に必要なバイト数を切り出して利用します。
  # 
  # ハッシュ関数には SHA1 を用います。
  # 
  # これは [[RFC:2898]](PKCS#5 v2.0)互換です。
  # 
  # @param pass パスワード文字列
  # @param salt salt 文字列
  # @param iter 鍵および IV 生成時のハッシュ関数の繰り返し回数
  # @param keylen 結果の文字列のバイト数
  # @raise OpenSSL::PKCS5::PKCS5Error 鍵、IV の生成に失敗した場合に発生します
  def pbkdf2_hmac_sha1; end

end
