module WEBrick::Config
  # --- BasicAuth -> Hash
  # 
  # [[c:WEBrick::HTTPAuth::BasicAuth]] の設定のデフォルト値を保持したハッシュです。
  # 
  #     require 'webrick'
  #     WEBrick::Config::BasicAuth = {
  #       :AutoReloadUserDB     => true,
  #     }
  def BasicAuth; end

  # --- DigestAuth -> Hash
  # 
  # [[c:WEBrick::HTTPAuth::DigestAuth]] の設定のデフォルト値を保持したハッシュです。
  # 
  #     require 'webrick'
  #     WEBrick::Config::DigestAuth = {
  #       :Algorithm            => 'MD5-sess', # or 'MD5'
  #       :Domain               => nil,        # an array includes domain names.
  #       :Qop                  => [ 'auth' ], # 'auth' or 'auth-int' or both.
  #       :UseOpaque            => true,
  #       :UseNextNonce         => false,
  #       :CheckNc              => false,
  #       :UseAuthenticationInfoHeader => true,
  #       :AutoReloadUserDB     => true,
  #       :NonceExpirePeriod    => 30*60,
  #       :NonceExpireDelta     => 60,
  #       :InternetExplorerHack => true,
  #       :OperaHack            => true,
  #     }
  def DigestAuth; end

  # --- FileHandler -> Hash
  # 
  # [[c:WEBrick::HTTPServlet::FileHandler]] の設定のデフォルト値を保持したハッシュです。
  # 
  #     require 'webrick'
  #     WEBrick::Config::FileHandler = {
  #       :NondisclosureName => [".ht*", "*~"],
  #       :FancyIndexing     => false,
  #       :HandlerTable      => {},
  #       :HandlerCallback   => nil,
  #       :DirectoryCallback => nil,
  #       :FileCallback      => nil,
  #       :UserDir           => nil,  # e.g. "public_html"
  #       :AcceptableLanguages => []  # ["en", "ja", ... ]
  #     }
  # 
  # : :AcceptableLanguages
  # 
  # コンテンツの言語を選択するオプション。設定値は文字列の配列。
  # 
  # クライアントからのリクエストに含まれるAccept-Languageの内容がfrで、
  # かつ:AcceptableLanguagesには['ja', 'en']が設定されている場合、
  # WEBrick::HTTPServlet::FileHandlerは以下の順番でファイルを探す。
  #   (1) index.html
  #   (2) index.html.fr
  #   (3) index.html.ja
  #   (4) index.html.en
  # 
  # : :FancyIndexing
  # クライアントがディレクトリをリクエストしたが表示するファイルが無い場合の挙動を決める。
  # 値は真偽値。
  # 
  # trueならば、代わりにファイル一覧を表示する。
  # falseならばエラー(403 Forbidden)となる。
  # 
  # : :DirectoryCallback
  # : :FileCallback
  # : :HandlerCallback
  # : :HandlerTable
  # : :NondisclosureName
  # インデックスに表示したくないファイルの指定。値は文字列の配列。
  # 表示したくないファイルをワイルドカードで指定する。
  # 
  # : :UserDir
  # ユーザ毎のドキュメントルートのディレクトリ名。値は文字列。
  # 
  # ユーザfooのホームディレクトリが/home/fooで、:UserDirにpublic_htmlを設定した場合、
  # クライアントから/~foo/index.htmlがリクエストされると/home/foo/public_html/index.htmlの内容を表示される。
  # 
  # この設定を有効にするには以下の条件が必要。
  #   * [[lib:etc]]ライブラリが使える状態である。
  #   * 環境変数 SCRIPT_NAME が空(空文字列)である。
  def FileHandler; end

  # --- General -> Hash
  # 
  # [[c:WEBrick::GenericServer]] の設定のデフォルト値を保持したハッシュです。
  # 
  #   require 'webrick'
  #   WEBrick::Config::General = {
  #     :ServerName     => Utils.getservername,
  #     :BindAddress    => nil,   # "0.0.0.0" or "::" or nil
  #     :Port           => nil,   # users MUST specify this!!
  #     :MaxClients     => 100,   # maximum number of the concurrent connections
  #     :ServerType     => nil,   # default: WEBrick::SimpleServer
  #     :Logger         => nil,   # default: WEBrick::Log.new
  #     :ServerSoftware => "WEBrick/#{WEBrick::VERSION} " +
  #                        "(Ruby/#{RUBY_VERSION}/#{RUBY_RELEASE_DATE})",
  #     :TempDir        => ENV['TMPDIR']||ENV['TMP']||ENV['TEMP']||'/tmp',
  #     :DoNotListen    => false,
  #     :StartCallback  => nil,
  #     :StopCallback   => nil,
  #     :AcceptCallback => nil,
  #     :DoNotReverseLookup => true,
  #   }
  def General; end

  # --- General -> Hash
  # 
  # [[m:WEBrick::Config::SSL]] の内容がマージされます。
  def General; end

  # --- HTTP -> Hash
  # 
  # [[c:WEBrick::HTTPServer]] の設定のデフォルト値を保持したハッシュです。
  # 
  #   require 'webrick'
  #   WEBrick::Config::HTTP = {
  #     :ServerName     => Utils.getservername,
  #     :BindAddress    => nil,   # "0.0.0.0" or "::" or nil
  #     :Port           => 80,
  #     :MaxClients     => 100,   # maximum number of the concurrent connections
  #     :ServerType     => nil,   # default: WEBrick::SimpleServer
  #     :Logger         => nil,   # default: WEBrick::Log.new
  #     :ServerSoftware => "WEBrick/#{WEBrick::VERSION} " +
  #                        "(Ruby/#{RUBY_VERSION}/#{RUBY_RELEASE_DATE})",
  #     :TempDir        => ENV['TMPDIR']||ENV['TMP']||ENV['TEMP']||'/tmp',
  #     :DoNotListen    => false,
  #     :StartCallback  => nil,
  #     :StopCallback   => nil,
  #     :AcceptCallback => nil,
  #     :DoNotReverseLookup => true,
  # 
  #     :RequestTimeout => 30,
  #     :HTTPVersion    => HTTPVersion.new("1.1"),
  #     :AccessLog      => nil,
  #     :MimeTypes      => HTTPUtils::DefaultMimeTypes,
  #     :DirectoryIndex => ["index.html","index.htm","index.cgi","index.rhtml"],
  #     :DocumentRoot   => nil,
  #     :DocumentRootOptions => { :FancyIndexing => true },
  #     :RequestCallback => nil,
  #     :ServerAlias    => nil,
  # 
  #     :CGIInterpreter => nil,
  #     :CGIPathEnv     => nil,
  # 
  #     :Escape8bitURI  => false
  #   }
  def HTTP; end

  # --- HTTP -> Hash
  # 
  # [[m:WEBrick::Config::SSL]] の内容がマージされています。
  def HTTP; end

  # --- LIBDIR -> String
  # 
  # このファイルのあるディレクトリのパスを返します。
  def LIBDIR; end

  # --- SSL -> Hash
  # 
  # 以下のほとんどの項目はサーバが保持する [[c:OpenSSL::SSL::SSLContext]] オブジェクト
  # を設定するためのものです。詳しくは [[c:OpenSSL::SSL::SSLContext]] を参照して下さい。
  # 
  # : :ServerSoftware
  #   サーバソフト名を設定する。デフォルトでは
  #   "WEBrick/VERSION (Ruby/VERSION/RELEASE_DATE) OpenSSL/VERSION"。
  # : :SSLEnable
  #   ssl を有効にするかどうかを設定します。
  #   Ruby 1.8.2 まではデフォルトで true です。
  #   Ruby 1.8.3 以降はデフォルトで false です。
  # : :SSLCertificate
  #   サーバ証明書を設定します。[[c:OpenSSL::X509::Certificate]] オブジェクトです。
  #   nil の場合、WEBrick は自己署名証明書を自動的に生成します。
  # : :SSLPrivateKey
  #   サーバの秘密鍵を設定します。[[c:OpenSSL::PKey::PKey]] の
  #   サブクラスのインスタンスです。
  # : :SSLClientCA
  #   サーバがクライアント証明書を要求する時にクライアントに送る CA のリストです。
  #   [[m:OpenSSL::SSL::SSLContext#client_ca]] を参照してください。
  # : :SSLExtraChainCert
  #   証明書チェーンです。所有している証明書からルート CA までの証明書のリストです。
  #   [[m:OpenSSL::SSL::SSLContext#extra_chain_cert]] を参照してください。
  # : :SSLCACertificateFile
  #   接続相手の検証のために使う、信頼している CA 証明書ファイルのパスです。
  #   [[m:OpenSSL::SSL::SSLContext#ca_file]] を参照してください。
  # : :SSLCACertificatePath
  #   信頼している CA 証明書ファイルを含むディレクトリのパスです。
  #   [[m:OpenSSL::SSL::SSLContext#ca_path]] を参照してください。
  # : :SSLCertificateStore
  #   接続相手の証明書の検証のために使う、信頼している CA 証明書を
  #   含む証明書ストアです。
  #   [[m:OpenSSL::SSL::SSLContext#cert_store]] を参照してください。
  # : :SSLVerifyClient
  #   検証モードです。
  #   [[m:OpenSSL::SSL::SSLContext#verify_mode]] を参照してください。
  # : :SSLVerifyDepth
  #   証明書チェイン上の検証する最大の深さです。
  #   [[m:OpenSSL::SSL::SSLContext#verify_depth]] を参照してください。
  # : :SSLVerifyCallback
  #   オブジェクトに設定されている検証をフィルタするコールバックです。
  #   [[m:OpenSSL::SSL::SSLContext#verify_callback]] を参照してください。
  # : :SSLTimeout
  #   セッションのタイムアウト秒数です。
  #   [[m:OpenSSL::SSL::SSLContext#timeout]] を参照してください。
  # : :SSLOptions
  #   オプションフラグです。
  #   [[m:OpenSSL::SSL::SSLContext#options]] を参照してください。
  # : :SSLStartImmediately
  # : :SSLCertName
  #   自己署名証明書を作成する場合の証明書の CN を文字列で設定する。
  # : :SSLCertComment
  #   自己署名証明書を作成する場合の拡張領域の nsComment の値です。
  #   デフォルトは "Generated by Ruby/OpenSSL" です。
  def SSL; end

end
