class OpenSSL::Digest
  # --- update(data) -> self
  # --- <<(data) -> self
  # data でダイジェストオブジェクトの内部状態を更新します。
  # 
  # @param data 入力文字列
  def <<; end

  # --- block_length -> Integer
  # ハッシュ関数のブロックサイズを返します。
  def block_length; end

  # --- digest_length -> Integer
  # ハッシュ値の長さ(バイト数)を返します。
  def digest_length; end

  # --- name -> String
  # ハッシュ関数の名前を返します。
  def name; end

  # --- reset -> self
  # ダイジェストオブジェクトの内部状態をリセットします。
  def reset; end

  # --- digest(name, data) -> String
  # data のダイジェストを計算します。
  # 
  # name でハッシュ関数を指定します。
  # 
  # @param name ハッシュ関数の種類を文字列("md5", "sha256" など)で指定
  # @param data ダイジェストを計算する文字列
  def digest; end

  # --- new(name, data=nil) -> OpenSSL::Digest
  # ダイジェストオブジェクトを生成します。
  # 
  # name でハッシュ関数の種類を選びます。
  # 
  # data に文字列を渡すと、その文字列でオブジェクトの内部状態を更新します。
  # 
  # @param name ハッシュ関数の種類を文字列("md5", "sha256" など)で指定
  # @param data 入力文字列
  # @raise RuntimeError サポートされていないアルゴリズムを指定した場合に発生します
  def new; end

end
