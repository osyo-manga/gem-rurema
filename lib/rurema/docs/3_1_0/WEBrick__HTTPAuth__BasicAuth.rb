class WEBrick::HTTPAuth::BasicAuth
  # --- authenticate(request, response) -> bool
  # クライアントから送られてきたユーザ名とパスワードを認証します。
  # 認証に失敗した場合は challenge を呼びます。
  # 
  # @param request [[c:WEBrick::HTTPRequest]] のインスタンスを指定します。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] のインスタンスを指定します。
  # 
  # @raise WEBrick::HTTPStatus::Unauthorized 認証に失敗した場合に発生します。
  def authenticate; end

  # --- challenge(request, response) -> ()
  # 
  # クライアントにパスワードを要求するためにレスポンスに WWW-Authenticate ヘッダを
  # 設定し、例外 WEBrick::HTTPStatus::Unauthorized を投げます。
  # 
  # @raise WEBrick::HTTPStatus::Unauthorized このメソッドを呼ぶと必ず発生します。
  def challenge; end

  # --- logger -> object
  # 
  # ロガーオブジェクトを返します。
  def logger; end

  # --- realm -> String
  # 
  # realm を文字列で返します。
  def realm; end

  # --- userdb -> WEBrick::HTTPAuth::Htpasswd
  # 
  # ユーザ名とパスワードを保存した [[c:WEBrick::HTTPAuth::Htpasswd]] オブジェクトを返します。
  def userdb; end

  # --- make_passwd(realm, user, pass) -> String
  # pass をランダムなソルトで crypt した文字列を返します。
  # 
  # @param realm レルムを指定します。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param pass パスワードを指定します。
  def make_passwd; end

  # --- new(config, default = Config::BasicAuth) -> WEBrick::HTTPAuth::BasicAuth
  # 
  # BasicAuth オブジェクトを生成します。config は設定を保存したハッシュです。
  # 
  # config で有効なハッシュキーは以下の通りです。
  # 
  #  :Realm            =>
  #  :UserDB           =>
  #  :Logger           =>
  #  :AutoReloadUserDB =>
  # 
  # realm を表す文字列 :Realm には与えます。:UserDB
  # には [[c:WEBrick::HTTPAuth::Htpasswd]] オブジェクトを与えます。:Logger には
  # ロガーオブジェクトを与えます。また、:AutoReloadUserDB には
  # [[m:WEBrick::HTTPAuth::Htpasswd#get_passwd]] の
  # reload_db に渡す引数を与えます。
  # 
  # @param config 設定を保持しているハッシュを指定します。
  # 
  # @param default デフォルトは [[m:WEBrick::Config::BasicAuth]] です。
  def new; end

end
