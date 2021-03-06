class UNIXSocket
  # --- addr -> [String, String]
  # 
  # ソケットの接続情報を表す配列を返します。配列の各要素は第1要
  # 素が文字列 "AF_UNIX"、第2要素がパスを表す文字列です。
  # 
  # クライアント側はパスを持たないため空文字列となります。
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     p serv.addr     #=> ["AF_UNIX", "/tmp/s"]
  #   }
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     c = UNIXSocket.open("/tmp/s")
  #     p c.peeraddr    #=> ["AF_UNIX", "/tmp/s"]
  #     p c.addr #=> ["AF_UNIX", ""]
  #   }
  # 
  # @see [[m:UNIXSocket#peeraddr]]
  def addr; end

  # --- path -> String
  # UNIX ソケットのパスを返します。
  # 
  # クライアント側はパスを持たないため空文字列となります。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     p serv.path     #=> "/tmp/s"
  #   }
  def path; end

  # --- peeraddr -> [String, String]
  # 
  # 接続相手先ソケットの情報を表す配列を返します。配列の各要素は第1要
  # 素が文字列 "AF_UNIX"、第2要素がパスを表す文字列です。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     c = UNIXSocket.open("/tmp/s")
  #     p c.peeraddr    #=> ["AF_UNIX", "/tmp/s"]
  #     p c.addr #=> ["AF_UNIX", ""]
  #   }
  # 
  # @see [[m:UNIXSocket#addr]]
  def peeraddr; end

  # --- recv_io(klass=IO, mode=nil) -> Integer|IO|object
  # 
  # ソケットの接続先からファイルディスクリプタを受け取ります。
  # 
  # klass が nil の場合、ファイルディスクリプタが Integer として
  # 返されます。
  # 
  # klass が nil でない場合、
  # klass.for_fd(fd[, mode]) が呼ばれ、その値が返されます。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   s1, s2 = UNIXSocket.pair
  #   s1.send_io STDOUT
  #   io = s2.recv_io
  #   p File.identical?(io, STDOUT)     #=> true
  # 
  # @param klass 受け取ったファイルディスクリプタを変換するためのクラス
  # @param mode for_fd に渡すファイルモード
  def recv_io; end

  # --- recvfrom(maxlen, flags = 0) -> [String [String, String]]
  # [[man:recvfrom(2)]] を用いてソケットからメッセージを受け取ります。
  # 
  # maxlen で受け取るメッセージの最大長をバイト数で指定します。
  # 
  # flags には Socket::MSG_* という名前の定数の bitwise OR を渡します。
  # 
  # 戻り値は文字列と相手ソケットのパスのペアです。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   UNIXServer.open("/tmp/s") {|serv|
  #     c = UNIXSocket.open("/tmp/s")
  #     s = serv.accept
  #     s.send "a", 0
  #     p c.recvfrom(10)[0]     #=> "a"
  #   }
  # 
  # @param maxlen 受け取るメッセージの最大長
  # @param flags フラグ
  def recvfrom; end

  # --- send_io(io) -> nil
  # 引数 io に対応するファイルディスクリプタをソケットの接続先に送ります。
  # 
  #   require 'socket'
  # 
  #   s1, s2 = UNIXSocket.pair
  #   
  #   s1.send_io STDOUT
  #   stdout = s2.recv_io
  #   
  #   p STDOUT.fileno #=> 1
  #   p stdout.fileno #=> 6
  #   
  #   stdout.puts "hello" # outputs "hello\n" to standard output.
  # 
  # @param io 送るファイルディスクリプタ(整数 or [[c:IO]]オブジェクト)
  def send_io; end

  # --- open(path) -> UNIXSocket
  # --- new(path)  -> UNIXSocket
  # --- open(path){|sock| ...} -> object
  # --- new(path){|sock| ...} -> object
  # 
  # path で指定したパス名を用いてソケットを接続します。
  # 
  # ブロックを省略すると接続したソケットを返します。
  # 
  # ブロックを渡した場合は、接続したソケットを引数としてそのブロックを呼びだし、
  # ブロック終了時にソケットを閉じます。この場合には
  # ブロックの評価値を返り値として返します。
  # 
  # @param path 接続先のパス名文字列
  # 
  #   require 'socket'
  # 
  #   s = UNIXSocket.new("/tmp/sock")
  #   s.send("hello", 0)
  def new; end

  # --- pair(type=Socket::SOCK_STREAM, protocol=0) -> [UNIXSocket, UNIXSocket]
  # --- socketpair(type=Socket::SOCK_STREAM, protocol=0) -> [UNIXSocket, UNIXSocket]
  # 
  # 相互に結合された UNIX ソケットのペアを含む2要素の配列を返します。
  # 
  # type にはソケットタイプを指定します。
  # Socket::SOCK_STREAM, Socket::SOCK_DGRAM, Socket::SOCK_RAW などの
  # 整数、:STREAM, :DGRAM, :RAW などのシンボル、
  # "STREAM" などの文字列が渡せます。
  # 
  # protocol には プロトコルを指定します。0 は Unix domain でのデフォルト値が
  # 使われます。
  # 
  #   require 'socket'
  # 
  #   s1, s2 = UNIXSocket.pair
  #   s1.send "a", 0
  #   s1.send "b", 0
  #   p s2.recv(10) #=> "ab"
  # 
  # @param type ソケットタイプ
  # @param protocol プトロコル
  def pair; end

end
