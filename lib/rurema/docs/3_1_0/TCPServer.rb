class TCPServer
  # --- accept -> TCPSocket
  # 
  # クライアントからの接続要求を受け付け、接続した
  # [[c:TCPSocket]] のインスタンスを返します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   TCPServer.open("", 0) {|serv|
  #     c = TCPSocket.new(*serv.addr.values_at(3,1))
  #     s = serv.accept
  #     c.write "foo"
  #     p s.recv(10)  #=> "foo"
  #   }
  def accept; end

  # --- accept_nonblock -> TCPSocket
  # 
  # ソケットをノンブロッキングモードに設定した後、
  # [[man:accept(2)]] を呼び出します。
  # 
  # 返り値は [[m:TCPServer#accept]] と同じです。
  # 
  # [[man:accept(2)]] がエラーになった場合、
  # EAGAIN, EINTR を含め例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @raise Errno::EXXX [[man:accept(2)]] がエラーになった場合に発生します。
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
  # @param backlog backlog は、クライアントからの接続要求を保留できる数です。
  # 
  # @raise Errno::EXXX [[man:listen(2)]] が失敗すれば 例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @return [[man:listen(2)]] が成功すれば 0 を返します。
  def listen; end

  # --- sysaccept -> Integer
  # 
  # 接続したクライアントのソケットをファイル記述子で返すことを除けば
  # [[m:TCPServer#accept]] と同じです。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   TCPServer.open("", 0) {|serv|
  #     c = TCPSocket.new(*serv.addr.values_at(3,1))
  #     p serv.sysaccept        #=> 6
  #   }
  def sysaccept; end

  # --- new(host=nil, service) -> TCPServer
  # --- open(host=nil, service) -> TCPServer
  # 
  # 新しいサーバー接続をオープンします。service は
  # /etc/services (または NIS) に登録されているサービ
  # ス名かポート番号で指定します。host を指定した時は
  # 指定したホストに対しての接続だけを受け付けます。
  # 
  # 省略時は全てのホストへの接続要求を受け付けることになります。
  # new, open は内部では [[man:getaddrinfo(3)]] を呼び出しており、
  # 複数のアドレス構造体が検出された場合、
  # 最初に見つかったものを返します。
  # 実行環境によっては IPv4, IPv6 のどちらか専用の接続になる場合がありますが、
  # その場合、host を省略せず明示的に指定することで、接続を特定できます。
  # 
  # host に指定できる形式は[[ref:lib:socket#host_format]]を見てください。
  # 
  # @param host 接続したいホストを指定します。
  #             host に指定できる形式は[[ref:lib:socket#host_format]]を見てください。
  # 
  # @param service /etc/services (または NIS) に登録されているサービ
  #                ス名かポート番号で指定します。
  def new; end

end
