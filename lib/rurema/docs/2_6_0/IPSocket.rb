class IPSocket
  # --- addr -> Array
  # 
  # ソケットの接続情報を表す配列を返します。配列の各要素は第1要
  # 素が文字列 "AF_INET", "AF_INET6" など、第2要素が port 番号、第3要素がホストを表
  # す文字列、第4要素がホストの IP アドレスを表す文字列 (octet
  # decimal や hexadecimal) です。
  # 
  # @raise Errno::EXXX [[man:getsockname(2)]] が 0 未満の値を返した場合に発生します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   serv = TCPServer.new("localhost", 0)
  #   p serv.addr         #=> ["AF_INET", 46102, "localhost.localdomain", "127.0.0.1"]
  #   c = TCPSocket.new(*serv.addr.values_at(3,1))
  #   s = serv.accept
  def addr; end

  # --- peeraddr -> Array
  # 
  # 接続相手先ソケットの情報を表す配列を返します。配列の各要素は
  # [[m:IPSocket#addr]] メソッドが返す配列
  # と同じです。
  # 
  # @raise Errno::EXXX [[man:getpeername(2)]] が 0 未満の値を返した場合に発生します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   TCPSocket.open("localhost", "http") {|s|
  #     p s.peeraddr    #=> ["AF_INET", 80, "localhost.localdomain", "127.0.0.1"]
  #     p s.addr        #=> ["AF_INET", 52615, "localhost.localdomain", "127.0.0.1"]
  #   }
  def peeraddr; end

  # --- recvfrom(maxlen, flags = 0) -> Array
  # 
  # recv と同様にソケットからデータを受け取りますが、
  # 戻り値は文字列と相手ソケットのアドレス (形式は
  # [[m:IPSocket#addr]] 参照) のペアです。引数につ
  # いては [[m:BasicSocket#recv]] と同様です。
  # 
  # @param maxlen 受け取る文字列の最大の長さを指定します。
  # 
  # @param flags [[man:recv(2)]] を参照してください。
  # 
  # @raise IOError
  # 
  # @raise Errno::EXXX [[man:recvfrom(2)]] がエラーになった場合などに発生します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   s1 = UDPSocket.new
  #   s1.bind("0.0.0.0", 0) # 適当に空いている port を割り当てる
  #   s2 = UDPSocket.new
  #   s2.send("foo", 0, s1.getsockname)
  #   mesg, inet_addr = s1.recvfrom(100)
  #   p mesg            #=> "foo"
  #   p inet_addr       #=> ["AF_INET", 32876, "localhost.localdomain", "127.0.0.1"]
  def recvfrom; end

  # --- getaddress(host) -> String
  # 
  # ホスト名からホストのアドレスを返します。ホストのアドレスは文
  # 字列は octet decimal の文字列 (例: 127.0.0.1) です。
  # 
  # @param host ホスト名を文字列で指定します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   p IPSocket.getaddress("www.ruby-lang.org")        #=> "210.163.138.100"
  def getaddress; end

  # --- getaddress(host) -> String
  # [[m:IPSocket.getaddress]] を置きかえ、
  # [[lib:resolv]] ライブラリを使い名前解決します。
  # 
  # @param host ホスト名を指定します。
  # @raise SocketError 名前解決に失敗した場合に発生します。
  def getaddress; end

end
