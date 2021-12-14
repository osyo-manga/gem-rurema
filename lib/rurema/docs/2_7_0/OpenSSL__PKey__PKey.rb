class OpenSSL::PKey::PKey
  # --- sign(digest, data) -> String
  # 秘密鍵で data に署名し、署名の文字列を返します。
  # 
  # digest は利用するハッシュ関数の名前を "sha256" や "md5" 
  # といった文字列で指定します。
  # 
  # DSA で署名をする場合はハッシュ関数には "dss1" を指定してください。
  # 
  # @param digest 利用するハッシュ関数の名前
  # @param data 署名する文字列
  # @raise OpenSSL::PKey::PKeyError 署名時にエラーが起きた場合に発生します
  def sign; end

  # --- verify(digest, sign, data) -> bool
  # data を秘密鍵で署名したその署名文字列が sign 
  # であることを公開鍵を使って検証し、検証に成功すれば true
  # を返します。
  # 
  # digest は利用するハッシュ関数の名前を "sha256" や "md5" 
  # といった文字列で指定します。
  # 
  # DSA で検証をする場合はハッシュ関数には "dss1" を指定してください。
  # 
  # 検証に失敗した、つまり署名時と異なるハッシュ関数を使った、
  # sign が正しい署名でなかった場合などは false を返します。
  # 
  # @param digest 利用するハッシュ関数の名前
  # @param sign 検証に利用する署名文字列
  # @param data 検証対象の文字列
  # @raise OpenSSL::PKey::PKeyError 検証時にエラーが起きた場合に発生します。
  #        正しい署名でなかった場合など、検証に失敗した場合はこの
  #        例外は発生しないことに注意してください
  def verify; end

end
