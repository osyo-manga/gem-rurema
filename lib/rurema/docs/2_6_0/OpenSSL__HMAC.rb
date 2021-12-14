class OpenSSL::HMAC
  # --- <<(data) -> self
  # --- update(data) -> self
  # 入力文字列を追加し、内部状態を更新します。
  # 
  # @param data 入力文字列
  def <<; end

  # --- digest -> String
  # オブジェクトの内部状態から算出された HMAC を
  # バイナリ文字列で返します。
  def digest; end

  # --- hexdigest -> String
  # --- to_s -> String
  # --- inspect -> String
  # オブジェクトの内部状態から算出された HMAC を
  # 16進の文字列で返します。
  def hexdigest; end

  # --- reset -> self
  # 内部状態をリセットします。
  def reset; end

  # --- digest(digest, key, data) -> String
  # 渡された digest と key を用いて data の HMAC を計算し、
  # その値をバイナリ文字列として返します。
  # 
  # digest には利用するハッシュ関数を表す文字列("md5", "sha256" など)
  # を渡します。
  # 
  # @param digest 利用するハッシュ関数
  # @param key 利用する鍵の文字列
  # @param data HMAC を計算する文字列
  def digest; end

  # --- hexdigest(digest, key, data) -> String
  # 渡された digest と key を用いて data の HMAC を計算し、
  # その値を16進文字列で返します。
  # 
  # digest には利用するハッシュ関数を表す文字列("md5", "sha256" など)
  # を渡します。
  # 
  # @param digest 利用するハッシュ関数
  # @param key 利用する鍵の文字列
  # @param data HMAC を計算する文字列
  def hexdigest; end

  # --- new(key, digest) -> OpenSSL::HMAC
  # HMAC を計算するためのオブジェクトを生成します。
  # 
  # 生成されたオブジェクトの内部状態は入力なしの状態にリセットされます。
  # 
  # digest には利用するハッシュ関数を表す文字列("md5", "sha256" など)
  # を渡します。
  # 
  # @param key 利用する鍵の文字列
  # @param digest 利用するハッシュ関数
  def new; end

end
