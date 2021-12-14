class WEBrick::HTTPServer
  # --- mount(dir, servlet, *options)    -> ()
  # 
  # サーバ上のディレクトリ dir にサーブレット servlet を対応させます。
  # 
  # @param dir ディレクトリをあらわす文字列を指定します。
  # 
  # @param servlet [[c:WEBrick::HTTPServlet::AbstractServlet]] のサブクラスのインスタンスを指定します。
  # 
  # @param options サーブレットのコンストラクタの引数を指定します。
  # 
  #   require 'webrick'
  #   include WEBrick
  #   srv = HTTPServer.new( { :BindAddress => '127.0.0.1', :Port => 10080 } )
  #   srv.mount('/img', WEBrick::HTTPServlet::FileHandler, '/home/username/images')
  def mount; end

  # --- mount_proc(dir, proc)             -> ()
  # --- mount_proc(dir){|req, res| ...}   -> ()
  # 
  # サーバ上のディレクトリ dir にリクエストを処理する [[c:Proc]] オブジェクト proc を対応させます。
  # 
  # @param dir ディレクトリをあらわす文字列を指定します。
  # 
  # @param proc リクエストを処理する [[c:Proc]] オブジェクトを指定します。
  #             [[c:WEBrick::HTTPResponse]] オブジェクトと [[c:WEBrick::HTTPRequest]] 
  #             オブジェクトを引数として proc.call(request, response) の引数の順で呼び出されます。
  # 
  # @raise WEBrick::HTTPServerError proc も指定されずブロックも与えられない場合に発生します。
  def mount_proc; end

  # --- unmount(dir)    -> ()
  # --- umount(dir)     -> ()
  # 
  # サーバ上のディレクトリ dir とサーブレットとの対応を解消します。
  # 
  # @param dir 対応を解消するディレクトリを指定します。
  # 
  #   srv.mount('/img')
  def umount; end

  # --- virtual_host(server)    -> ()
  # 
  # サーバの保持しているバーチャルホストのリストに HTTP サーバ server を加えます。
  # クライアントからのリクエストのうち server へのものは server に委譲されるようになります。
  # 
  # @param server バーチャルホストを表す WEBrick::HTTPServer オブジェクトを指定します。
  # 
  # 
  #   require 'webrick'
  #   include WEBrick
  #   srv1 = HTTPServer.new( { :Port => 1080, :ServerName => 'hoge.example.com' } )
  #   srv2 = HTTPServer.new( { :Port => 1080, :ServerName => 'foo.example.com' } )
  #   
  #   srv  = HTTPServer.new( { :Port => 1080 } )
  #   srv.virtual_host(srv1)
  #   srv.virtual_host(srv2)
  #   srv.start
  def virtual_host; end

  # --- new(config = {}, default = WEBrick::Config::HTTP)    -> WEBrick::HTTPServer
  # 
  # HTTPServer オブジェクトを生成して返します。
  # 
  # @param config 設定を保存したハッシュを指定します。有効なキー([[c:Symbol]] オブジェクト)と値は以下のとおりです。
  # : :RequestTimeout
  #   どれだけの時間 クライアントからの入力を待つかを整数か [[c:Float]] で指定します。
  #   単位は秒です。
  # : :HTTPVersion
  #   使用する HTTP のバージョンです。[[c:WEBrick::HTTPVersion]] オブジェクトで指定します。デフォルトは 1.1 です。
  # : :AccessLog
  #   アクセスログの出力先とフォーマットを [[io, format], [io, format], ...] のような
  #   配列で指定します。io は [[c:IO]] オブジェクトです。format は文字列です。デフォルトでは
  #   フォーマットの形式は Apache のそれに準拠し標準エラー出力に出力します。
  #   [[url:http://httpd.apache.org/docs/mod/mod_log_config.html#formats]]
  #   [[m:WEBrick::AccessLog::COMMON_LOG_FORMAT]] [[m:WEBrick::AccessLog::REFERER_LOG_FORMAT]]
  #   も参照して下さい。
  # : :MimeTypes
  #   拡張子と mime-type との対応をハッシュで指定します。デフォルトは
  #   [[m:WEBrick::HTTPUtils::DefaultMimeTypes]] です。
  # : :DirectoryIndex
  #   ディレクトリのインデックスとなるファイル名を配列で指定します。
  # : :DocumentRoot
  #   サーバ上のルートディレクトリに対応させる、ローカルのファイルシステムの
  #   ディレクトリを文字列で指定します。
  # : :DocumentRootOptions
  #   ルートディレクトリの処理を担当する [[c:WEBrick::HTTPServlet::FileHandler]] のコンストラクタに
  #   渡されるオプションをハッシュで指定します。デフォルトは { :FancyIndexing => true } ですので、
  #   ディレクトリにアクセスするとディレクトリの内容を適当な形式で表示します。
  # : :RequestCallback
  #   クライアントからのリクエストを受け付けた時に呼ばれる [[c:Proc]] オブジェクトを
  #   指定します。callback.call(req, res) のように [[c:WEBrick::HTTPRequest]] オブジェクトと
  #   [[c:WEBrick::HTTPResponse]] オブジェクトを引数として呼ばれます。
  # : :ServerAlias
  #   サーバのホスト名の別名を文字列の配列で指定します。
  # : :CGIInterpreter
  #   CGI を実行するインタプリタを文字列で指定します。
  # : :CGIPathEnv
  #   CGI に渡される PATH 環境変数を文字列で指定します。
  # : :Escape8bitURI
  #   この値が true の場合、クライアントからのリクエスト URI に含まれる 8bit 目が立った文字をエスケープします。
  #   デフォルトは false です。
  # 
  # @param default config で指定されなかった場合のデフォルトの設定を保存したハッシュを指定します。
  def new; end

end
