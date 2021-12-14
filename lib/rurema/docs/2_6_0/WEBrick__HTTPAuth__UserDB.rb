module WEBrick::HTTPAuth::UserDB
  # --- auth_type -> Class
  # 
  # [[c:WEBrick::HTTPAuth::BasicAuth]], [[c:WEBrick::HTTPAuth::DigestAuth]] のいずれかを返します。
  def auth_type; end

  # --- auth_type=(type)
  # 
  # 認証のタイプをセットします。
  # 
  # @param type [[c:WEBrick::HTTPAuth::BasicAuth]], [[c:WEBrick::HTTPAuth::DigestAuth]] のいずれかを指定します。
  def auth_type=; end

  # --- get_passwd(realm, user, reload_db = false) -> String
  # 
  # 与えられたレルムとユーザ名からパスワードのハッシュ値を取得して返します。
  # 
  # @param realm レルムを指定します。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param reload_db 無視されます。
  def get_passwd; end

  # --- make_passwd(realm, user, pass) -> String
  # 
  # [[m:WEBrick::HTTPAuth::UserDB#auth_type]] の make_passwd を呼び出します。
  # 
  # @param realm レルムを指定します。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param pass パスワードを指定します。
  # 
  # @see [[m:WEBrick::HTTPAuth::BasicAuth#make_passwd]], [[m:WEBrick::HTTPAuth::DigestAuth#make_passwd]]
  def make_passwd; end

  # --- set_passwd(realm, user, pass)
  # 与えられた情報をもとに、パスワードをハッシュ化して保存します。
  # 
  # @param realm レルムを指定します。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param pass パスワードを指定します。
  def set_passwd; end

end
