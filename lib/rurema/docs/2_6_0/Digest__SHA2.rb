class Digest::SHA2
  # --- block_length -> Integer
  # 
  # ダイジェストのブロック長を返します。
  def block_length; end

  # --- digest_length -> Integer
  # 
  # ダイジェストのハッシュ値のバイト長を返します。
  def digest_length; end

  # --- new(bitlen = 256) -> Digest::SHA2
  # 
  # 与えられた bitlen に対応する SHA2 ハッシュを生成するためのオブジェクト
  # を内部で設定して自身を初期化します。
  # 
  # @param bitlen ハッシュの長さを指定します。256, 384, 512 が指定可能です。
  # 
  # @raise ArgumentError bitlen に 256, 384, 512 以外の値を指定した場合に発生します。
  def new; end

end
