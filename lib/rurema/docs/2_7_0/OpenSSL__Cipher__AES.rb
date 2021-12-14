class OpenSSL::Cipher::AES
  # --- new(bit, mode) -> OpenSSL::Cipher::AES
  # AES 共通鍵暗号オブジェクトを生成し、返します。
  # 
  # AES の鍵長を整数もしくは文字列(256 or "256") bit で、
  # モードを文字列 mode で指定します。
  # 
  # 指定可能な鍵数とモードは [[m:OpenSSL::Cipher.ciphers]] で
  # 取得できます。
  # 
  # @param bit 鍵長整数/文字列
  # @param mode モード文字列
  def new; end

end
