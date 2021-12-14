class WEBrick::HTTPServlet::CGIHandler
  # --- do_GET(request, response) -> ()
  # --- do_POST(request, response) -> ()
  # 
  # GET, POST リクエストを処理します。
  # 
  # @param request [[c:WEBrick::HTTPRequest]] のインスタンスを指定します。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] のインスタンスを指定します。
  def do_GET; end

  # --- new(server, name) -> WEBrick::HTTPServlet::CGIHandler
  # 
  # 自身を初期化します。
  # 
  # @param server [[c:WEBrick::GenericServer]] のサブクラスのインスタンスを
  #               指定します。
  # 
  # @param name 実行したい CGI のファイルを文字列で与えます。
  def new; end

  # --- CGIRunner -> String
  # 
  # CGI を実行するためのコマンドを返します。
  def CGIRunner; end

  # --- Ruby -> String
  # 
  # Ruby のパスを返します。
  def Ruby; end

end
