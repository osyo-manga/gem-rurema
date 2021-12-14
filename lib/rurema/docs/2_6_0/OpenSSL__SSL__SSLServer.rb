class OpenSSL::SSL::SSLServer
  # --- accept -> OpenSSL::SSL::SSLSocket
  # クライアントからの接続を受け付け、接続した
  # SSLSocket オブジェクトを返します。
  # 
  # [[m:OpenSSL::SSL::SSLServer#start_immediately]] が真ならば、
  # SSLSocket#accept を呼び TLS/SSL ハンドシェイクを実行してから
  # SSLSocket オブジェクトを返します。
  def accept; end

  # --- close -> nil
  # 内部のサーバソケットを閉じます。
  def close; end

  # --- listen(backlog=5) -> 0
  # ラップしている [[c:TCPServer]] の [[m:TCPServer#listen]] 
  # を呼びだします。
  # 
  # 通常は TCPServer の初期化時に listen が呼びだされるため
  # 呼ぶ必要はないはずです。
  # 
  # @param backlog クライアントからの接続要求を保留できる数
  # @raise Errno::EXXX [[man:listen(2)]] が失敗すれば 例外 [[c:Errno::EXXX]] が発生します。
  def listen; end

  # --- shutdown(how=Socket::SHUT_RDWR) -> 0
  # ソケットの以降の接続を終了させます。
  # 
  # 詳しくは [[m:BasicSocket#shutdown]] を参照してください。
  # 
  # @param how 接続の終了の仕方を Socket::SHUT_RD, Socket::SHUT_WR, 
  #            Socket::SHUT_RDWR などで指定します。
  def shutdown; end

  # --- start_immediately -> bool
  # [[m:OpenSSL::SSL::SSLServer#accept]] で
  # accept したらすぐに TLS/SSL ハンドシェイクを実行するかどうかを返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLServer#start_immediately=]]
  def start_immediately; end

  # --- start_immediately=(bool)
  # [[m:OpenSSL::SSL::SSLServer#accept]] で
  # accept したらすぐに TLS/SSL ハンドシェイクを実行するかどうかを設定します。
  # 
  # これを真に設定した場合は、[[m:OpenSSL::SSL::SSLServer#accept]] で
  # 接続したソケットに対し [[m:OpenSSL::SSL::SSLSocket#accept]] を
  # 呼び、ハンドシェイクを実行します。
  # 
  # デフォルトでは true です。
  # 
  # @param bool 設定する真偽値。
  # @see [[m:OpenSSL::SSL::SSLServer#start_immediately]]
  def start_immediately=; end

  # --- to_io -> TCPServer
  # ラップしている [[c:TCPServer]] オブジェクトを返します。
  def to_io; end

  # --- new(svr, ctx) -> OpenSSL::SSL::SSLServer
  # [[c:TCPServer]] オブジェクトをラップする SSLServer オブジェクトを生成します。
  # 
  # svr にはラップする[[c:TCPServer]] オブジェクトを、
  # ctx には SSL サーバが用いる  [[c:OpenSSL::SSL::SSLContext]]
  # オブジェクトを生成します。
  # 
  # [[m:OpenSSL::SSL::SSLServer#listen]] や [[m:OpenSSL::SSL::SSLServer#accept]]
  # は内部で svr で渡されたオブジェクトの
  # [[m:TCPServer#listen]] や [[m:TCPServer#accept]] を呼び出します。
  # 
  # @param svr 利用する [[c:TCPServer]] オブジェクト
  # @param ctx SSL サーバとして用いる [[c:OpenSSL::SSL::SSLContext]] オブジェクト
  def new; end

end
