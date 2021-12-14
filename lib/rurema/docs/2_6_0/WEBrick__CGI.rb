class WEBrick::CGI
  # --- [](key)    -> object
  # 
  # 指定された key に対応した自身の設定値を返します。
  # 
  # @param key 設定名を Symbol オブジェクトで指定します。
  def []; end

  # --- config     -> Hash
  # 
  # 自身の設定を保持したハッシュを返します。
  # 
  # @see [[m:WEBrick::CGI.new]]
  def config; end

  # --- logger     -> WEBrick::BasicLog 
  # 
  # 設定されているログオブジェクトを返します。
  # 
  # デフォルトでは [[c:WEBrick::BasicLog]].new($stderr) です。
  def logger; end

  # --- service(req, res)     -> ()
  # 
  # 指定された [[c:WEBrick::HTTPRequest]] オブジェクト req の [[m:WEBrick::HTTPRequest#request_method]] に応じて、
  # 自身の do_GET, do_HEAD, do_POST, do_OPTIONS... いずれかのメソッドを req と res を引数として呼びます。
  # 
  # 特に理由が無い限り [[c:WEBrick::CGI]] のサブクラスがこのメソッドを定義する必要はありません。
  # 
  # @param req クライアントからのリクエストを表す [[c:WEBrick::HTTPRequest]] オブジェクトです。
  # 
  # @param res クライアントへのレスポンスを表す [[c:WEBrick::HTTPResponse]] オブジェクトです。
  # 
  # @raise WEBrick::HTTPStatus::MethodNotAllowed 指定された
  #        [[c:WEBrick::HTTPRequest]] オブジェクト req が自身に定義されてい
  #        ないHTTP のメソッドであった場合発生します。
  def service; end

  # --- start(env = ENV, stdin = $stdin, stdout = $stdout)     -> ()
  # 
  # 自身に定義されたサービスを実行します。
  # 
  # start メソッドは service メソッドを呼び出し、service メソッドはリクエストに応じて
  # do_XXX メソッドを呼び出します。このようにして CGI スクリプトは実行されます。
  # 
  # @param env CGI スクリプトが受け取った Meta-Variables (環境変数)を保持したハッシュか、
  #            それと同じ [] メソッドを持ったオブジェクトを指定します。
  # 
  # @param stdin リクエストデータの入力元を [[c:IO]] オブジェクトで指定します。
  # 
  # @param stdout レスポンスデータの出力先を [[c:IO]] オブジェクトで指定します。
  def start; end

  # --- new(config = {}, *options)    -> WEBrick::CGI
  # 
  # WEBrick::CGI オブジェクトを生成してかえします。
  # 
  # @param config 設定を保存したハッシュを指定します。
  # 
  # config で有効なキーとその値は以下のとおりです。
  # キーはすべて [[c:Symbol]] オブジェクトです。
  # 
  # : :ServerName     
  #  サーバ名を文字列で指定します。デフォルトでは ENV["SERVER_SOFTWARE"] が使われます。
  #  ENV["SERVER_SOFTWARE"] が nil の場合は "null" が使われます。
  # : :HTTPVersion
  #  HTTP バージョンを [[c:WEBrick::HTTPVersion]] オブジェクトで指定します。
  #  デフォルトでは ENV["SERVER_PROTOCOL"] の HTTP バージョンが使われます。 
  #  ENV["SERVER_PROTOCOL"] が nil の場合 HTTP バージョンは 1.0 です。
  # : :NPH            
  #  NPH スクリプトとして実行される場合に true を指定します。そうでない場合に false を指定します。
  #  デフォルトは false です。
  # : :Logger 
  #  ログを取るための [[c:WEBrick::BasicLog]] オブジェクトを指定します。デフォルトでは標準エラー出力に
  #  ログが出力されます。
  # : :RequestTimeout
  #  リクエストを読み込む時のタイムアウトを秒で指定します。デフォルトは 30 秒です。
  # : :Escape8bitURI
  #  この値が true の場合、クライアントからのリクエスト URI に含まれる 8bit 目が立った文字をエスケープします。
  #  デフォルトは false です。 
  # 
  # @param options ユーザがこのクラスを継承して作成したクラスで @options というインスタンス変数として使用できます。
  def new; end

end
