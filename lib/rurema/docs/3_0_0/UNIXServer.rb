class UNIXServer
  # --- accept -> UnixSocket
  # 
  # クライアントからの接続要求を [[man:accept(2)]]で待ち受け、接続した
  # [[c:UNIXSocket]] のインスタンスを返します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     c = UNIXSocket.open("/tmp/s")
  #     s = serv.accept
  #     s.write "from server"
  #     c.write "from client"
  #     p c.recv(20)    #=> "from server"
  #     p s.recv(20)    #=> "from client"
  #   }
  def accept; end

  # --- accept_nonblock -> UnixSocket
  # ソケットをノンブロッキングモードに設定した後、
  # [[man:accept(2)]] を呼び出します。
  # 
  # 接続した
  # [[c:UNIXSocket]] のインスタンスを返します。
  # 
  # [[man:accept(2)]] がエラーになった場合、[[m:Socket#accept]] と同じ例外が
  # 発生します。
  # 
  # [[c:Errno::EWOULDBLOCK]], [[c:Errno::EAGAIN]], 
  # [[c:Errno::ECONNABORTED]], [[c:Errno::EPROTO]] のいずれかの例外が
  # 発生した場合は、その例外には [[c:IO::WaitReadable]] が extend
  # されます。それを利用してリトライ可能な例外を掴まえることができます。
  # 
  #   require 'socket'
  #   serv = UNIXServer.new("/tmp/sock")
  #   begin # emulate blocking accept
  #     sock = serv.accept_nonblock
  #   rescue IO::WaitReadable, Errno::EINTR
  #     IO.select([serv])
  #     retry
  #   end
  #   # sock is an accepted socket.
  # 
  # @see [[m:UNIXServer#accept]]
  def accept_nonblock; end

  # --- listen(backlog) -> 0
  # 
  # [[man:listen(2)]] を実行します。
  # ([[m:Socket#listen]]と同じ)
  # 
  # backlog は、クライアントからの接続要求を保留できる数です。
  # 
  # [[man:listen(2)]] が成功すれば 0 を返します。
  # 失敗すれば 例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @param backlog バックログの最大数(接続要求を保留できる数)
  def listen; end

  # --- sysaccept -> Integer
  # 接続したクライアントのソケットをファイル記述子で返すことを除けば
  # [[m:UNIXServer#accept]] と同じです。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     c = UNIXSocket.open("/tmp/s")
  #     p serv.sysaccept        #=> 6
  #   }
  def sysaccept; end

  # --- open(path) -> UNIXServer
  # --- new(path) -> UNIXServer
  # --- open(path){|sock| ...} -> object
  # --- new(path){|sock| ...} -> object
  # 
  # path で指定したパス名を用いて接続を受け付けるソケット
  # を作成します。
  # 
  # ブロックを省略すると作成したサーバソケットを返します。
  # 
  # ブロックを渡した場合は、作成したソケットを引数としてそのブロックを呼びだし、
  # ブロック終了時にソケットを閉じます。この場合には
  # ブロックの評価値を返り値として返します。
  # 
  # @param path 接続を受け付けるパス名文字列
  # 
  #   require 'socket'
  # 
  #   serv = UNIXServer.new("/tmp/sock")
  #   s = serv.accept
  #   p s.read
  def new; end

end
