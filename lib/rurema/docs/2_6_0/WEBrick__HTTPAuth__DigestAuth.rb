class WEBrick::HTTPAuth::DigestAuth
  # --- algorithm -> String
  # 
  # アルゴリズムを表す文字列を返します。
  def algorithm; end

  # --- authenticate(request, response) -> true
  # 
  # クライアントから送られてきたユーザ名とパスワードを認証します。
  # 認証に失敗した場合は challenge を呼びます。
  # 
  # @param request [[c:WEBrick::HTTPRequest]] のインスタンスを指定します。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] のインスタンスを指定します。
  # 
  # @raise WEBrick::HTTPStatus::Unauthorized 認証に失敗した場合に発生します。
  def authenticate; end

  # --- challenge(request, response, stale = false)
  # 
  # クライアントにパスワードを要求するためにレスポンスに WWW-Authenticate ヘッダを
  # 設定し、例外 WEBrick::HTTPStatus::Unauthorized を発生させます。
  # 
  # @param request [[c:WEBrick::HTTPRequest]] のインスタンスを指定します。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] のインスタンスを指定します。
  # 
  # @raise WEBrick::HTTPStatus::Unauthorized このメソッドを呼ぶと必ず発生します。
  def challenge; end

  # --- qop -> String
  # 
  # Qop キーの値を返します。
  def qop; end

  # --- make_passwd(realm, user, pass) -> String
  # 
  # 与えられた情報を使用してハッシュ化したパスワードを生成します。
  # 
  # @param realm レルムを指定します。
  # 
  # @param user ユーザ名を指定します。
  # 
  # @param pass パスワードを指定します。
  def make_passwd; end

  # --- new(config, default = WEBrick::Config::DigestAuth) -> WEBrick::HTTPAuth::DigestAuth
  # 
  # 自身を初期化します。
  # 
  # 認証を実行するために、リクエスト間で状態を保存し、複数のリクエストに対
  # して同一のインスタンスを使用してください。
  # 
  # @param config 設定を保持しているハッシュを指定します。
  #               :Realm と :UserDB は必ず指定しなければなりません。
  # 
  # @param default デフォルトは [[m:WEBrick::Config::DigestAuth]] です。
  # 
  # @see [[m:WEBrick::Config::DigestAuth]]
  def new; end

end
