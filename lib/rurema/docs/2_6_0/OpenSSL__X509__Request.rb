class OpenSSL::X509::Request
  # --- add_attribute(attr) -> OpenSSL::X509::Attribute
  # 新たな attribute を CSR に追加します。
  # 
  # @param attr 追加する attribute([[c:OpenSSL::X509::Attribute]] の
  #        インスタンス)
  # @return 渡した attribute オブジェクトを返します
  # @see [[m:OpenSSL::X509::Request#attribute]], 
  #      [[m:OpenSSL::X509::Request#attribute=]]
  def add_attribute; end

  # --- attributes -> [OpenSSL::X509::Attribute]
  # CSR が保持している attribute を [[c:OpenSSL::X509::Attribute]] 
  # の配列で返します。
  # 
  # attribute とは X.509 証明書署名要求 に含まれる申請者に関する
  # 追加的な情報です。必須ではありません。X.509v3 拡張領域を
  # CSR に含めるときは "reqExt" という oid の attribute を追加
  # します。
  # 
  # @see [[m:OpenSSL::X509::Request#attribute=]], 
  #      [[m:OpenSSL::X509::Request#add_attribute]]
  def attributes; end

  # --- attributes=(attrs)
  # CSR の attribute をクリアして新しい attribute を設定します。
  # 
  # 
  # @param attrs 新たに設定する attribute([[c:OpenSSL::X509::Attribute]] の
  #        インスタンス)の配列
  # @see [[m:OpenSSL::X509::Request#attribute]]
  #      [[m:OpenSSL::X509::Request#add_attribute]]
  def attributes=; end

  # --- public_key -> OpenSSL::PKey::PKey
  # 申請者の公開鍵を返します。
  # 
  # 実際には [[c:OpenSSL::PKey::PKey]] 自体のインスタンスでなく、
  # そのサブクラスを返します。
  # 
  # @raise OpenSSL::X509::RequestError 公開鍵の取得に失敗した場合に発生します
  # @raise OpenSSL::PKey::PKeyError 鍵の形式が不正であった場合に発生します
  def public_key; end

  # --- public_key=(pkey)
  # 申請者の公開鍵を設定します。
  # 
  # @param pkey 設定する公開鍵を [[c:OpenSSL::PKey::PKey]] のサブクラスのインスタンスで渡します
  # @raise OpenSSL::X509::RequestError 公開鍵の設定に失敗した場合に発生します
  def public_key=; end

  # --- sign(key, digest) -> self
  # 証明書署名要求に秘密鍵で署名をします。
  # 
  # 通常、証明書署名要求は申請者の秘密鍵で署名されます。
  # 
  # @param key 秘密鍵([[c:OpenSSL::PKey::PKey]] のサブクラスのオブジェクト)
  # @param digest ハッシュ関数を表す文字列("sha1" など)
  # @raise OpenSSL::X509::RequestError 署名に失敗した場合に発生します
  # @see [[m:OpenSSL::X509::Request#verify]]
  def sign; end

  # --- signature_algorithm -> String
  # 証明書署名要求の署名に使われているアルゴリズム名を文字列で返します。
  def signature_algorithm; end

  # --- subject -> OpenSSL::X509::Name
  # 証明書署名要求の申請者名を返します。
  # 
  # @raise OpenSSL::X509::RequestError 名前の取得に失敗した場合に発生します
  # @see [[m:OpenSSL::X509::Request#subject=]]
  def subject; end

  # --- subject=(subject)
  # 証明書署名要求の申請者名を設定します。
  # 
  # @param subject 設定する名前を [[c:OpenSSL::X509::Name]] で渡します
  # @raise OpenSSL::X509::RequestError 名前の設定に失敗した場合に発生します
  # @see [[m:OpenSSL::X509::Request#subject]]
  def subject=; end

  # --- to_der -> String
  # DER 形式の文字列に変換して返します。
  # 
  # @raise OpenSSL::X509::RequestError 変換に失敗した場合に発生します
  def to_der; end

  # --- to_pem -> String
  # --- to_s -> String
  # PEM 形式の文字列に変換して返します。
  # 
  # @raise OpenSSL::X509::RequestError 変換に失敗した場合に発生します
  def to_pem; end

  # --- to_text -> String
  # 人間が読める形式の文字列に変換して返します。
  # 
  # @raise OpenSSL::X509::RequestError 変換に失敗した場合に発生します
  def to_text; end

  # --- verify(key) -> bool
  # 署名を検証します。
  # 
  # 検証に成功した場合には true を、失敗した場合には false を返します。
  # 
  # @param key 検証に利用する公開鍵([[c:OpenSSL::PKey::PKey]] のサブクラスのインスタンス)
  # @raise OpenSSL::X509::RequestError 検証時にエラーが生じた場合に発生します
  # @see [[m:OpenSSL::X509::Request#sign]]
  def verify; end

  # --- version -> Integer
  # バージョンを返します。
  # 
  # PKCS#10 v1.7([[RFC:2986]])では0を返します。
  # 
  # @see [[m:OpenSSL::X509::Request#version=]]
  def version; end

  # --- version=(version)
  # バージョンを設定します。
  # 
  # @param version 設定するバージョンの整数
  # @see [[m:OpenSSL::X509::Request#version]]
  def version=; end

  # --- new -> OpenSSL::X509::Request
  # --- new(obj) -> OpenSSL::X509::Request
  # 新しい OpenSSL::X509::Request オブジェクトを生成します。
  # 
  # 引数なしの場合は空の OpenSSL::X509::Request オブジェクトを生成します。
  # 
  # 引数が文字列の場合は、PEM 形式もしくは DER 形式であると
  # みなしてオブジェクトを生成します。
  # 
  # 引数が [[c:IO]] オブジェクトである場合は、そのファイルの中身から
  # オブジェクトを生成します。
  # 
  # 引数が OpenSSL::X509::Request である場合には、その内容を
  # コピーしたオブジェクトを生成します。
  # 
  # 引数が to_der メソッドを持つ場合は、そのメソッドによって
  # DER 形式の文字列に変換してからオブジェクトを生成します。
  # 
  # @param obj CSR のデータ
  # @raise OpenSSL::X509::RequestError CSR のフォーマットが不正であるなど、読み込みに失敗した場合に発生します
  def new; end

end
