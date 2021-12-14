module OpenSSL::Random
  # --- egd(filename) -> true
  # EGD(Entropy Gathering Daemon) からエントロピーを得、
  # 乱数生成器に追加します。
  # 
  # filename で指定した Unix domain socket から EGD に問い合わせ、
  # 255 バイト分のエントロピーを取得します。
  # [[m:OpenSSL::Random.egd_bytes]](filename, 255) と同じです。
  # 
  # @param filename EGD のソケットのファイル名
  # @raise OpenSSL::Random::RandomError 
  def egd; end

  # --- egd_bytes(filename, length) -> true
  # EGD(Entropy Gathering Daemon) から length バイト分のエントロピーを得ます。
  # 
  # filename で指定した Unix domain socket から EGD に問い合わせ、
  # 指定した大きさのエントロピーを乱数生成器に追加します。
  # 
  # @param filename EGD のソケットのファイル名
  # @param length 読み込むバイト数
  # @raise OpenSSL::Random::RandomError 
  # 
  # 
  # @raise OpenSSL::Random::RandomError 
  def egd_bytes; end

  # --- load_random_file(filename) -> true
  # ファイルを読み込み、その内容をエントロピー源として
  # 乱数生成器に渡します。
  # 
  # エントロピーの推定量はファイルのバイト数と同じであると見なします。
  # 
  # OpenSSL::Random.seed(File.read(filename)) と同じです。
  # 
  # @param filename 読み込むファイル名
  # @raise OpenSSL::Random::RandomError ファイルの読み込みに失敗した場合に発生します
  # @raise OpenSSL::Random::RandomError 
  def load_random_file; end

  # --- pseudo_bytes(len) -> String
  # 暗号論的な予測不可能性を持たない(が高速な)
  # 乱数生成器によって、 len バイトの
  # ランダムなバイト列を返します。
  # 
  # @param len 必要なランダムバイト列の長さ
  def pseudo_bytes; end

  # --- random_add(str, entropy) -> self
  # 乱数生成器にエントロピーを追加します。
  # 
  # entropy には str が持っているエントロピーの予測値(の下限)を
  # バイト単位で渡します。
  # 
  # @param str 予測不可能な内容の文字列
  # @param entropy str が持っているエントロピーの予測値(バイト単位)の浮動小数点数
  def random_add; end

  # --- random_bytes(len) -> String
  # 暗号論的な予測不可能性を持つ乱数生成器によって、 len バイトの
  # ランダムなバイト列を返します。
  # 
  # @param len 必要なランダムバイト列の長さ
  def random_bytes; end

  # --- seed(str) -> str
  # 乱数生成器にエントロピーを
  # 「エントロピー予測値 = str のバイト数」として
  # 追加します。
  # 
  # OpenSSL::Random.random_add(str, str.size) と同じです。
  # 
  # @param str 予測不可能な内容の文字列
  # @see [[m:OpenSSL::Random.#random_add]]
  def seed; end

  # --- status? -> bool
  # 乱数生成器内のエントロピーが十分である場合に true を返します。
  def status?; end

  # --- write_random_file(filename) -> true
  # 乱数生成器で生成された 1024 バイトのランダムなバイト列を
  # ファイルに書き込みます。
  # 
  # これで出力したランダムなバイト列はあとで乱数生成器を初期化するの
  # に使えます。リブート直後などシステムからのエントロピーが少ない場合に
  # 利用できます。
  # 
  # このファイルは利用者以外には読めないように保存しなければなりません。
  # 部外者がこのファイルを読めることはセキュリティ上の問題を引き起します。
  # 
  # @param filename 書き込むファイルの名前
  # @raise OpenSSL::Random::RandomError ファイルの書き出しに失敗した場合に発生します
  #  
  def write_random_file; end

end
