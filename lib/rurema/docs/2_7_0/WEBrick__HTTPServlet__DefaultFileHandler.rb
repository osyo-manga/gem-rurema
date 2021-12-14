class WEBrick::HTTPServlet::DefaultFileHandler
  # --- do_GET(request, response) -> ()
  # 
  # GET リクエストを処理します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::NotModified 自身に関連付けられたファイルが変更されていない場合に発生します。
  # 
  # @raise WEBrick::HTTPStatus::PartialContent 部分的 GET リクエストを処理した場合に発生します。
  def do_GET; end

  # --- make_partial_content(request, response, filename, filesize)
  # 
  # 部分的 GET リクエストのためのレスポンスを作成します。
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @param filename ファイル名を指定します。
  # 
  # @param filesize ファイルサイズを指定します。
  # 
  # @raise WEBrick::HTTPStatus::BadRequest リクエストが不正である場合に発生します。
  # 
  # @raise WEBrick::HTTPStatus::RequestRangeNotSatisfiable レスポンスボディが空になる場合などに発生します。
  def make_partial_content; end

  # --- not_modified?(request, response, mtime, etag) -> bool
  # 
  # 自身に関連付けられたファイルが更新されていなければ、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # 
  # @param request クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param response クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @param mtime 自身に関連付けられたファイルの最終修正時刻を指定します。
  # 
  # @param etag ETag の値を指定します。
  def not_modified?; end

  # --- prepare_range(range, filesize) -> [Integer, Integer]
  # 
  # [[m:WEBrick::HTTPServlet::DefaultFileHandler#make_partial_content]] で利用する範囲情報を生成して返します。
  # 
  # @param range 2 要素の配列を指定します。
  # 
  # @param filesize ファイルサイズを指定します。
  def prepare_range; end

  # --- new(server, local_path) -> WEBrick::HTTPServlet::DefaultFileHandler
  # 
  # DefaultFileHandler サーブレットを生成します。ユーザが直接使うことはあま
  # りありません。
  # 
  # @param server [[c:WEBrick::GenericServer]] のサブクラスのインスタンスを
  #               指定します。
  # 
  # @param local_path 処理するファイルのパスを指定します。
  def new; end

end
