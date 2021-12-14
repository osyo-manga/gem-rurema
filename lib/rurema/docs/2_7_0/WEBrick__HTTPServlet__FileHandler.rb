class WEBrick::HTTPServlet::FileHandler
  # --- do_GET(request, response) -> ()
  # 
  # GET リクエストを処理します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::NotFound 対象となるパスが見つからなかった場合に発生します。
  def do_GET; end

  # --- do_OPTIONS(request, response) -> ()
  # 
  # OPTIONS リクエストを処理します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::NotFound 対象となるパスが見つからなかった場合に発生します。
  def do_OPTIONS; end

  # --- do_POST(request, response) -> ()
  # 
  # POST リクエストを処理します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::NotFound 対象となるパスが見つからなかった場合に発生します。
  def do_POST; end

  # --- service(request, response) -> ()
  # 
  # リクエストメソッドに応じて自身の do_* メソッドを呼び出します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::NotFound 対象となるパスが見つからなかった場合に発生します。
  def service; end

  # --- add_handler(suffix, handler)
  # 与えられた拡張子のファイルを処理するためのサーブレットを登録します。
  # 
  # @param suffix 拡張子を指定します。
  # 
  # @param handler サーブレットを指定します。
  def add_handler; end

  # --- new(server, root, options = {}, default = WEBrick::Config::FileHandler)
  # 
  # FileHandler サーブレットを生成します。ユーザが直接使うことはあまりあり
  # ません。
  # 
  # @param server [[c:WEBrick::GenericServer]] のサブクラスのインスタンスを
  #               指定します。
  # 
  # @param root サーブレットにルートディレクトリとして認識させる、
  #             ローカルのファイルシステムのディレクトリを文字列で与える。
  # 
  # @param options 設定を保存したハッシュ、
  # 
  # @param default デフォルトの設定を保存したハッシュを与える。
  def new; end

  # --- remove_handler(suffix) -> Class
  # 
  # 与えられた拡張子に対応するサーブレットを削除します。
  # 
  # @param suffix 拡張子を指定します。
  def remove_handler; end

  # --- HandlerTable -> Hash
  # 
  # 拡張子に対応するサーブレットを登録するためのハッシュです。
  def HandlerTable; end

end
