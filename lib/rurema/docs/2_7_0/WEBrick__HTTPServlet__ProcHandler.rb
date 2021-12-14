class WEBrick::HTTPServlet::ProcHandler
  # --- do_GET(request, response) -> ()
  # --- do_POST(request, response) -> ()
  # 
  # GET, POST リクエストを処理します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  def do_GET; end

  # --- get_instance(server, *options) -> self
  # 
  # 何もせずに自身を返します。
  # 
  # @param server [[m:WEBrick::HTTPServer#mount]] 第3引数以降に指定された値がそのまま与えられます。
  # 
  # @param options [[m:WEBrick::HTTPServer#mount]] 第3引数以降に指定された値がそのまま与えられます。
  # 
  # @see [[m:WEBrick::HTTPServlet::AbstractServlet.get_instance]]
  def get_instance; end

  # --- new(proc) -> WEBrick::HTTPServlet::ProcHandler
  # 
  # 自身を初期化します。
  # 
  # @param proc [[c:Proc]] オブジェクトを与えます。クライアントからのリクエストがあった時、
  #             proc.call(request, response) のように呼び出されます。
  #             request, response はそれぞれ [[c:WEBrick::HTTPRequest]] オブジェクトと
  #             [[c:WEBrick::HTTPResponse]] オブジェクトです。
  def new; end

end
