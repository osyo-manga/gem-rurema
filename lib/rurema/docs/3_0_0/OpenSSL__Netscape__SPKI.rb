class OpenSSL::Netscape::SPKI
  # --- challenge -> String
  # SPKI オブジェクトに設定されたチャレンジ文字列を返します。
  # 
  # @raise OpenSSL::Netscape::SPKIError 文字列が設定されていない場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#challenge=]]
  def challenge; end

  # --- challenge=(chg)
  # SPKI オブジェクトにチャレンジ文字列を設定します。
  # 
  # @param chg 設定する文字列
  # @raise OpenSSL::Netscape::SPKIError 文字列の設定に失敗した場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#challenge]]
  def challenge=; end

  # --- public_key -> OpenSSL::PKey::PKey
  # SPKI オブジェクトに設定された公開鍵を返します。
  # 
  # @raise OpenSSL::Netscape::SPKIError 公開鍵が設定されていない場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#public_key=]]
  def public_key; end

  # --- public_key=(pubkey)
  # SPKI オブジェクトに公開鍵を設定します。
  # 
  # @param pubkey 設定する公開鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @raise OpenSSL::Netscape::SPKIError 公開鍵の設定に失敗した場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#public_key]]
  def public_key=; end

  # --- sign(key, digest) -> self
  # SPKI オブジェクトに署名をします。
  # 
  # @param key 署名に使う秘密鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @param digest 署名に使うダイジェスト関数(文字列もしくは [[c:OpenSSL::Digest]] オブジェクト)
  # @raise OpenSSL::Netscape::SPKIError 署名に失敗した場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#verify]]
  def sign; end

  # --- to_der -> String
  # SPKI オブジェクトを DER 形式の文字列に変換します。
  def to_der; end

  # --- to_pem -> String
  # --- to_s -> String
  # SPKI オブジェクトを PEM 形式の文字列に変換します。
  # 
  # @raise OpenSSL::Netscape::SPKIError 変換に失敗した場合に発生します
  def to_pem; end

  # --- to_text -> String
  # SPKI オブジェクトを人間が読める形式の文字列に変換します。
  def to_text; end

  # --- verify(key) -> bool
  # 署名を検証します。
  # 
  # 検証に成功した場合は true を返し、失敗した場合は false を返します。
  # 
  # @param key 署名に使う公開鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @raise OpenSSL::Netscape::SPKIError 検証時にエラーが起きた場合に発生します
  # @see [[m:OpenSSL::Netscape::SPKI#sign]]
  def verify; end

  # --- new() -> OpenSSL::Netscape::SPKI
  # --- new(buf) -> OpenSSL::Netscape::SPKI
  # 
  # SPKI オブジェクトを生成します。
  # 
  # 文字列を渡すと、PEM 形式、もしくは DER 形式のデータとみなし、
  # その内容を読み込みます。
  # 
  # @param buf SPKI オブジェクトを生成するための文字列データ
  # @raise OpenSSL::Netscape::SPKIError オブジェクトの生成に失敗した場合に発生します
  def new; end

end
