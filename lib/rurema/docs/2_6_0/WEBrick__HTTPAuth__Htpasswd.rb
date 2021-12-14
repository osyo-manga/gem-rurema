class WEBrick::HTTPAuth::Htpasswd
  # --- delete_passwd(realm, user) -> String
  # 
  # ユーザのパスワードを削除します。realm は無視されます。
  # 
  # @param realm レルムは無視されます。
  # 
  # @param user ユーザ名を指定します。
  def delete_passwd; end

  # --- each{|user, pass| ...} -> Hash
  # 
  # ユーザ名とパスワードをブロックに与えて評価します。
  def each; end

  # --- flush(path = nil)
  # ファイルに書き込みます。ファイル名を与えた場合は、そこに書き込みます。
  # 
  # @param path ファイル名を指定します。
  def flush; end

  # --- get_passwd(realm, user, reload_db) -> String
  # 
  # ユーザのパスワードの crypt された文字列を取得します。
  # 
  # @param realm レルムは無視されます。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param reload_db 真を指定すると [[m:WEBrick::HTTPAuth::Htpasswd#reload]] を呼んでから値を返します。
  def get_passwd; end

  # --- reload
  # ファイルから再度読み込みます。
  def reload; end

  # --- set_passwd(realm, user, pass)
  # 与えられた情報をもとに、パスワードをハッシュ化して保存します。
  # 
  # @param realm レルムは無視されます。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param pass パスワードを指定します。
  def set_passwd; end

  # --- new(path) -> WEBrick::HTTPAuth::Htpasswd
  # 
  # Htpasswd オブジェクトを生成します。
  # 
  # @param path パスワードを保存するファイルのパスを与えます。
  def new; end

end
