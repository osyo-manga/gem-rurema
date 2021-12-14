class Socket
  # --- accept -> Array
  # 
  # 新しい接続を受け付けて、新しい接続に対するソケットとアドレスの
  # ペアを返します。[[man:accept(2)]] を参照。
  # 
  # たとえば IPv4 の TCP サーバソケットを生成し、accept でクライアントからの接続を受け付けるには以下のようにします。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   serv = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  #   sockaddr = Socket.sockaddr_in(8080, "0.0.0.0")
  #   serv.bind(sockaddr)
  #   serv.listen(5)
  #   sock = serv.accept
  def accept; end

  # --- accept_nonblock -> Array
  # 
  # ソケットをノンブロッキングモードに設定した後、
  # [[man:accept(2)]] を呼び出します。
  # 
  # 引数、返り値は [[m:Socket#accept]] と同じです。
  # 
  # [[man:accept(2)]] がエラーになった場合、
  # EAGAIN, EINTR を含め例外 [[c:Errno::EXXX]] が発生します。
  def accept_nonblock; end

  # --- bind(my_sockaddr) -> 0
  # 
  # ソケットを my_sockaddr に結合します。[[man:bind(2)]]
  # と同じ働きをします。
  # 
  # @param my_sockaddr ソケットアドレス構造体を pack した文字列[[ref:lib:socket#pack_string]]もしくは[[c:Addrinfo]]オブジェクトを指定します。
  # @return 0 を返します。
  def bind; end

  # --- connect(server_sockaddr) -> 0
  # 
  # [[man:connect(2)]] でソケットを接続します。
  # 
  # server_sockaddr は、
  # [[ref:lib:socket#pack_string]]
  # もしくは [[c:Addrinfo]] オブジェクト
  # です。
  # 
  # 0 を返します。
  # 
  # @param server_sockaddr 接続先アドレス
  # @raise Errno::EXXX [[man:connect(2)]] がエラーを報告した場合に発生します。詳しくは
  #        man を参照してください。
  # 
  # 
  # たとえば IPv4 の TCP ソケットを生成し、connect で www.ruby-lang.org:80 に接続するには以下のようにします。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  #   sockaddr = Socket.sockaddr_in(80, "www.ruby-lang.org")
  #   s.connect(sockaddr)
  #   s.write "GET / HTTP/1.0\r\n\r\n"
  #   print s.read
  def connect; end

  # --- connect_nonblock(server_sockaddr) -> 0
  # 
  # ソケットをノンブロッキングモードに設定した後、
  # [[man:connect(2)]] を呼び出します。
  # 
  # 引数、返り値は [[m:Socket#connect]] と同じです。
  # 
  # connect が EINPROGRESS エラーを報告した場合、その例外(Errno::EINPROGRESS)
  # には [[c:IO::WaitWritable]] が [[m:Object#extend]] されます。
  # これを connect_nonblock をリトライするために使うことができます。
  # 
  #   # Pull down Google's web page
  #   require 'socket'
  #   include Socket::Constants
  #   socket = Socket.new(AF_INET, SOCK_STREAM, 0)
  #   sockaddr = Socket.sockaddr_in(80, 'www.google.com')
  #   begin # emulate blocking connect
  #     socket.connect_nonblock(sockaddr)
  #   rescue IO::WaitWritable
  #     IO.select(nil, [socket]) # wait 3-way handshake completion
  #     begin
  #       socket.connect_nonblock(sockaddr) # check connection failure
  #     rescue Errno::EISCONN
  #     end
  #   end
  #   socket.write("GET / HTTP/1.0\r\n\r\n")
  #   results = socket.read
  # 
  # 
  # 
  # @param server_sockaddr 接続先アドレス
  # @raise Errno::EXXX [[man:connect(2)]] がエラーを報告した場合に発生します。詳しくは
  #        man を参照してください。
  def connect_nonblock; end

  # --- ipv6only! -> ()
  # ソケットの IPV6_V6ONLY オプションを有効にします。
  # 
  # IPV6_V6ONLY オプションが使えない場合はこのメソッドは何もしません。
  def ipv6only!; end

  # --- listen(backlog) -> 0
  # 
  # [[man:listen(2)]] と同じ働きをします。
  # 
  # 0 を返します。
  # 
  # @param backlog 接続を保留できる最大数
  # 
  # @return 0 を返します。
  def listen; end

  # --- recvfrom(maxlen, flags=0) -> [String, Addrinfo]
  # 
  # ソケットからデータを受け取ります。
  # 
  # [[m:Socket#recv]] と同様ですが、返り値として
  # データ文字列と相手ソケットのアドレスのペアが返されます。
  # 
  # flags には Socket::MSG_* という定数の bitwise OR を渡します。
  # 詳しくは [[man:recvfrom(2)]] を参照してください。
  # 
  # @param maxlen ソケットから受けとるデータの最大値
  # @param flags フラグ
  # @raise Errno::EXXX [[man:recvfrom(2)]] がエラーを報告した場合に発生します。詳しくは
  #        Errno と man を見てください。
  # 例:
  # 
  #   require 'socket'
  # 
  #   s1 = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM, 0)
  #   s2 = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM, 0)
  #   s1.bind(Socket.sockaddr_in(0, "0.0.0.0"))
  #   s2.send("foo", 0, s1.getsockname)
  #   mesg, sockaddr = s1.recvfrom(10)
  #   p mesg                                    #=> "foo"
  #   p sockaddr                                #=> "\002\000\200r\177\000\000\001\000\000\000\000\000\000\000\000"
  #   p Socket.unpack_sockaddr_in(sockaddr)     #=> [32882, "127.0.0.1"]
  def recvfrom; end

  # --- recvfrom_nonblock(maxlen, flags=0) -> [String, Addrinfo]
  # 
  # ソケットをノンブロッキングモードに設定した後、
  # [[man:recvfrom(2)]] を呼び出します。
  # 
  # 引数、返り値は [[m:Socket#recvfrom]] と同じです。
  # 
  # [[man:recvfrom(2)]] がエラーになった場合、
  # EAGAIN, EINTR を含め例外 [[c:Errno::EXXX]] が発生します。
  # Errno::EWOULDBLOCK、Errno::EAGAIN のような待ってからリトライすることが
  # 可能であることを意味する例外には、[[c:IO::WaitReadable]] が extend
  # されています。
  # 
  # @param maxlen ソケットから受けとるデータの最大値
  # @param flags フラグ
  # @raise Errno::EXXX [[man:recvfrom(2)]] がエラーを報告した場合に発生します。詳しくは
  #        man を参照してください
  def recvfrom_nonblock; end

  # --- sysaccept -> Array
  # 
  # 接続したクライアントのファイル記述子とアドレスのペアを返すことを除
  # けば [[m:Socket#accept]] と同じです。
  def sysaccept; end

  # --- accept_loop(sockets) {|sock, client_addrinfo| ...} -> ()
  # sockets でサーバソケットを受け取り、接続を待ち受け、
  # クライアントとの接続が確立するたびにブロックにその接続
  # ソケットを渡し呼び出します。
  # 
  # ブロックの引数はクライアントと接続したソケットオブジェクトと
  # [[c:Addrinfo]] オブジェクトです。
  # 
  # [[m:Socket.tcp_server_loop]] と同様、ブロックは
  # 逐次的に呼び出されます。つまりブロックか終了するまで
  # 次の接続は accept されません。
  # 並列に通信したい場合は
  # スレッドのような並列実行機構を使う必要があります。
  # 
  # @param sockets 待ち受けたいサーバソケットの配列
  # 
  # @see [[m:Socket.tcp_server_loop]], [[m:Socket.unix_server_loop]]
  def accept_loop; end

  # --- getaddrinfo(nodename, servname, family=nil, socktype=nil, protocol=nil, flags=nil) -> Array
  # 
  # [[RFC:2553]]で定義された
  # getaddrinfo() の機能を提供するクラスメソッド。この関数は
  # gethostbyname() や getservbyname() の代わりとして用意されており、
  # IP のバージョンに依存しないプログラムを書くための標準的な API です。
  # 
  # @param nodename ホスト名を指定します。 必須引数です。 ([[ref:lib:socket#host_format]]を参照)
  # 
  # @param servname サービス名を指定します。 必須引数です。 ([[ref:lib:socket#service_format]]を参照)
  # 
  # @param family アドレスファミリー。[[m:Socket::Constants::AF_INET]] など、AF_ で始まる定数を指定します。
  # 
  # @param socktype ソケットタイプ。 [[m:Socket::Constants::SOCK_STREAM]] など、 SOCK_ で始まる定数を指定します。
  # 
  # @param protocol プロトコル。[[m:Socket::Constants::IPPROTO_IP]] など、IPPROTO_ で始まる定数を指定します。
  # 
  # @param flags [[man:getaddrinfo(3)]] の第3引数に指定する addrinfo 構造体の ai_flags メンバに相当する整数。 Socket::AI_PASSIVEなど。
  # 
  # @return 7つの要素からなるアドレス情報に関する配列を返します。
  # @raise SocketError [[man:getaddrinfo(3)]]がエラーを返したときに発生する例外です
  # 
  # @see [[m:Addrinfo.getaddrinfo]]
  # 
  # 
  # === アドレス情報について
  # アドレス情報とは7つの要素からなる次の形の配列です。
  # 
  #   * 第0要素 - アドレスファミリー (String)
  #   * 第1要素 - ポート番号 (Integer)
  #   * 第2要素 - ホスト名 (String)
  #   * 第3要素 - アドレス (String)
  #   * 第4要素 - アドレスファミリーに対応する Integer
  #   * 第5要素 - ソケットタイプに対応する Integer
  #   * 第6要素 - プロトコルに対応する Integer
  # 
  # === 必須引数について
  # 必須引数の意味は以下の通りです。
  # 
  #   * nodename - ホスト名
  #     ([[ref:lib:socket#host_format]]を参照)
  #   * servname - サービス名
  #     ([[ref:lib:socket#service_format]]を参照)
  # 
  # === 省略可能な引数について
  # 残りの引数は省略可能です。
  # 
  #   * family - アドレスファミリー。
  #     [[m:Socket::Constants::AF_INET]] など、AF_ で始まる定数を指定します。
  #   * socktype - ソケットタイプ。
  #     [[m:Socket::Constants::SOCK_STREAM]] など、SOCK_ で始まる定数を指定
  #     します。
  #   * protocol - プロトコル。
  #     [[m:Socket::Constants::IPPROTO_IP]] など、IPPROTO_ で始まる定数を指
  #     定します。
  #   * flags - [[man:getaddrinfo(3)]] の第3引数に指定する addrinfo 構造体の
  #     ai_flags メンバに相当する Fixnum。
  #     Socket::AI_PASSIVE、
  #     Socket::AI_CANONNAME、
  #     Socket::AI_NUMERICHOST
  #     が用意されている場合があります。
  # 
  # === 定数の意味について
  # 引数に指定できる定数の意味については
  # [[man:getaddrinfo(3)]] を参照して下さい。
  # 
  # === 使用例
  # 例:
  # 
  # 
  #   require 'socket'
  # 
  #   p Socket.getaddrinfo(Socket.gethostname, "ftp")
  #   #=> [["AF_INET", 21, "helium.ruby-lang.org", "210.251.121.214", 2, 1, 6]]
  #   
  #   pp Socket.getaddrinfo(Socket.gethostname, nil)
  #   #=> [["AF_INET", 0, "helium.ruby-lang.org", "210.251.121.214", 2, 1, 6],
  #   #    ["AF_INET", 0, "helium.ruby-lang.org", "210.251.121.214", 2, 2, 17],
  #   #    ["AF_INET", 0, "helium.ruby-lang.org", "210.251.121.214", 2, 3, 0]]
  def getaddrinfo; end

  # --- gethostbyaddr(host, type = Socket::AF_INET) -> Array
  # 
  # sockaddr 構造体をパックした文字列からホスト情報を返します。
  # ホスト情報の構造は [[m:Socket.gethostbyname]] と同じです。
  # type には、アドレスタイプ(デフォルトは
  # Socket::AF_INET)を指定します。
  # 
  # @param host ホストを文字列で指定します。
  # 
  # @param type アドレスタイプ(デフォルトはSocket::AF_INET)を指定します。
  # 
  # @raise SocketError [[man:gethostbyaddr(3)]] の呼び出しにエラーがあった場合に発生します。
  def gethostbyaddr; end

  # --- gethostbyname(host) -> Array
  # 
  # ホスト名または IP アドレス(指定方法に関しては
  # [[ref:lib:socket#host_format]]を参照)
  # からホストの情報を返します。
  # 
  # @param host 文字列でホストを指定します。
  # 
  # @return ホスト情報を含んだ４要素の配列を返します。
  # 
  # === 返り値のホスト情報について
  # ホスト情報は以下の 4 要素の配列で表現されています。
  # 
  #   * ホスト名
  #   * ホストの別名の配列
  #   * ホストのアドレスタイプ (整数定数)
  #   * ホストのアドレス
  # 
  # 第四要素のホストのアドレスは、各アドレスタイプに対応する
  # C のアドレス構造体を pack した文字列として表現されています。
  # 例えばアドレスタイプが AF_INET (定数 2) ならば
  # Socket.unpack_sockaddr_in で unpack できます。
  # 
  # === 使用例
  # 
  #   irb(main):009:0> require 'socket'
  # 
  #   irb(main):009:0> Socket.gethostbyname("210.251.121.214")
  #   ["helium.ruby-lang.org", ["helium"], 2, "\322\373y\326"]
  #   
  #   irb(main):009:0> Socket.unpack_sockaddr_in(Socket.gethostbyname("210.251.121.214")[3])[1]
  #   "210.251.121.214"
  def gethostbyname; end

  # --- gethostname -> String
  # 
  # システムの標準のホスト名を取得します。
  # 
  # ホストの別名やアドレスなど他の情報を得るには
  # [[m:Socket.getaddrinfo]] を使ってください。
  # ただし、これは不可能な場合もあります。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   p Socket.gethostname   #=> "helium.ruby-lang.org"
  def gethostname; end

  # --- getifaddrs -> [Socket::Ifaddr]
  # 
  # インターフェイスのアドレスを [[c:Socket::Ifaddr]] の配列で返します。
  # 
  # 本メソッドはマルチキャスト通信が可能なインターフェイスを見つけるために使う事ができます。
  # 
  #   require 'socket'
  # 
  #   pp Socket.getifaddrs.reject {|ifaddr|
  #     !ifaddr.addr.ip? || (ifaddr.flags & Socket::IFF_MULTICAST == 0)
  #   }.map {|ifaddr| [ifaddr.name, ifaddr.ifindex, ifaddr.addr] }
  #   #=> [["eth0", 2, #<Addrinfo: 221.186.184.67>],
  #   #    ["eth0", 2, #<Addrinfo: fe80::216:3eff:fe95:88bb%eth0>]]
  # 
  # 例(GNU/Linux):
  # 
  #   require 'socket'
  # 
  #   pp Socket.getifaddrs
  #   #=> [#<Socket::Ifaddr lo UP,LOOPBACK,RUNNING,0x10000 PACKET[protocol=0 lo hatype=772 HOST hwaddr=00:00:00:00:00:00]>,
  #   #    #<Socket::Ifaddr eth0 UP,BROADCAST,RUNNING,MULTICAST,0x10000 PACKET[protocol=0 eth0 hatype=1 HOST hwaddr=00:16:3e:95:88:bb] broadcast=PACKET[protocol=0 eth0 hatype=1 HOST hwaddr=ff:ff:ff:ff:ff:ff]>,
  #   #    #<Socket::Ifaddr sit0 NOARP PACKET[protocol=0 sit0 hatype=776 HOST hwaddr=00:00:00:00]>,
  #   #    #<Socket::Ifaddr lo UP,LOOPBACK,RUNNING,0x10000 127.0.0.1 netmask=255.0.0.0>,
  #   #    #<Socket::Ifaddr eth0 UP,BROADCAST,RUNNING,MULTICAST,0x10000 221.186.184.67 netmask=255.255.255.240 broadcast=221.186.184.79>,
  #   #    #<Socket::Ifaddr lo UP,LOOPBACK,RUNNING,0x10000 ::1 netmask=ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>,
  #   #    #<Socket::Ifaddr eth0 UP,BROADCAST,RUNNING,MULTICAST,0x10000 fe80::216:3eff:fe95:88bb%eth0 netmask=ffff:ffff:ffff:ffff::>]
  # 
  # 例(FreeBSD):
  # 
  #   require 'socket'
  # 
  #   pp Socket.getifaddrs
  #   #=> [#<Socket::Ifaddr usbus0 UP,0x10000 LINK[usbus0]>,
  #   #    #<Socket::Ifaddr re0 UP,BROADCAST,RUNNING,MULTICAST,0x800 LINK[re0 3a:d0:40:9a:fe:e8]>,
  #   #    #<Socket::Ifaddr re0 UP,BROADCAST,RUNNING,MULTICAST,0x800 10.250.10.18 netmask=255.255.255.? (7 bytes for 16 bytes sockaddr_in) broadcast=10.250.10.255>,
  #   #    #<Socket::Ifaddr re0 UP,BROADCAST,RUNNING,MULTICAST,0x800 fe80:2::38d0:40ff:fe9a:fee8 netmask=ffff:ffff:ffff:ffff::>,
  #   #    #<Socket::Ifaddr re0 UP,BROADCAST,RUNNING,MULTICAST,0x800 2001:2e8:408:10::12 netmask=UNSPEC>,
  #   #    #<Socket::Ifaddr plip0 POINTOPOINT,MULTICAST,0x800 LINK[plip0]>,
  #   #    #<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST LINK[lo0]>,
  #   #    #<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST ::1 netmask=ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff>,
  #   #    #<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST fe80:4::1 netmask=ffff:ffff:ffff:ffff::>,
  #   #    #<Socket::Ifaddr lo0 UP,LOOPBACK,RUNNING,MULTICAST 127.0.0.1 netmask=255.?.?.? (5 bytes for 16 bytes sockaddr_in)>]
  def getifaddrs; end

  # --- getnameinfo(sa, flags = 0) -> Array
  # 
  # [[RFC:2553]] で定義された getnameinfo() の機能を提供するク
  # ラスメソッド。 gethostbyaddr() や getservbyport() の代
  # わりとして用意されています。IPのバージョンに依存しないプログラムを
  # 書くための標準的なAPIです。
  # 
  # @param sa 文字列か配列を与えます。
  # 
  # @param flags 省略可能な第2引数 flags には [[man:getnameinfo(3)]] の第7番目の引数に指定する flags に相当する [[c:Fixnum]] を与えます。
  # 
  # @return 配列を返し、その要素はアドレスとポートを表す文字列です。
  # 
  # @raise SocketError [[man:getnameinfo(3)]] がエラーを起こした場合に生じる例外
  # 
  # @see [[m:Addrinfo#getnameinfo]]
  # 
  # === 引数 sa について
  # 引数 sa には文字列か配列を与えます。文字列の場合は sockaddr 構造体
  # のパック文字列を与えます。具体的には [[m:BasicSocket#getsockname]]
  # の値が利用できます。配列を与える場合には、要素が3つの場合と4つの場合
  # があります。
  # 
  #   * 要素が3つの場合:
  #        [アドレスファミリー, サービス, ホスト]
  #   * 要素が4つの場合:
  #        [アドレスファミリー, サービス, 任意, アドレスを表す文字列]
  # 
  # アドレスファミリーには Socket::AF_INET 等の定数の他に文字列
  # で "AF_INET" もしくは "AF_INET6" もしくは nil が
  # 指定できます。ただしIPv6が使えないようにコンパイルされている場合は
  # "AF_INET6" は無効な指定となります。アドレスファミリーに
  # nil を指定することは Socket::AF_UNSPEC を指定すること
  # と等価です。
  # 
  # サービス、ホストの指定に関しては [[ref:lib:socket#service_format]]、
  # [[ref:lib:socket#host_format]]を参照してください。
  # 
  # 要素が3つの場合でも、ホストにはアドレスを指定できますが、要素が4つ
  # の場合には、最後の要素を名前解決しないことが保証されます。
  # 
  # === 引数flagsについて
  # 省略可能な第2引数 flags には [[man:getnameinfo(3)]]
  # の第7番目の引数に指定する flags に相当する [[c:Fixnum]] を与えます。
  # 
  # 引数flagsを構成するための定数として
  # Socket::NI_MAXHOST、
  # Socket::NI_MAXSERV、
  # Socket::NI_NOFQDN、
  # Socket::NI_NUMERICHOST、
  # Socket::NI_NAMEREQD、
  # Socket::NI_NUMERICSERV、
  # Socket::NI_DGRAM
  # が用意されている場合があります。
  # 
  # これらの定数の意味については [[man:getnameinfo(3)]]を参照
  # して下さい。
  # 
  # === 使用例
  # 
  #   require 'socket'
  # 
  #   Socket.getnameinfo(Socket.sockaddr_in('21','127.0.0.1'))
  #   #=> ["localhost", "ftp"]
  #   
  #   Socket.getnameinfo([nil, 21,'127.0.0.1'])
  #   #=> ["localhost", "ftp"]
  def getnameinfo; end

  # --- getservbyname(service, proto = "tcp") -> Integer
  # 
  # service, protoに対応するポート番号を返
  # します。protoの省略値は"tcp"です。
  # 
  # @param service サービス名を文字列で指定します。例えば、"ftp", "telnet" が相当します。
  # @param proto  プロトコル名を文字列で指定します。省略値は"tcp" です。
  # 
  # @return ポート番号を整数で返します。
  def getservbyname; end

  # --- getservbyport(port, protocol_name="tcp") -> String
  # 
  # ポート番号に対応するサービスの正式名を返します。
  # 
  # @param port ポート番号
  # @param protocol_name "tcp" や "udp" などのプロトコル名
  # @return サービスの正式名
  # 
  #    require 'socket'
  # 
  #    Socket.getservbyport(80)         #=> "www"
  #    Socket.getservbyport(514, "tcp") #=> "shell"
  #    Socket.getservbyport(514, "udp") #=> "syslog"
  def getservbyport; end

  # --- ip_address_list -> [Addrinfo]
  # ローカルの IP アドレスを配列で返します。
  def ip_address_list; end

  # --- open(domain, type, protocol=0) -> Socket
  # --- new(domain, type, protocol=0) -> Socket
  # 
  # 新しいソケットを生成します。domain、type、
  # protocol はインクルードファイルにある定数で指定しま
  # す。ほとんどの定数は Socket::AF_INET のように
  # Socket クラスの定数として定義されています。domain
  # とtype に関しては、"AF_INET",
  # "SOCK_STREAM" のように文字列でも指定できますが、文
  # 字列ですべての機能を指定できる保証はありません。
  # 
  # 例えば、IPv4 の TCP ソケットは以下のように生成されます。
  # 
  #   require 'socket'
  # 
  #   s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
  # 
  # なお、[[man:socket(2)]] の domain 引数において AF_ と PF_ のどちらの定数を使用するかについては混乱がありますが、
  # Stevens の「UNIX ネットワークプログラミング第2版 Vol.1」4.2節に述べられているように、
  # 現実的にはどちらでも問題なく、また、既存のコーディング習慣として AF_ が用いられることが多いため、
  # ここでは AF_ を使用しています。
  # 
  # @param domain 例えば、<sys/socket.h> のようなインクルードファイルに定義されている定数を指定します。
  # @param type   例えば、<sys/socket.h> のようなインクルードファイルに定義されている定数を指定します。
  # @param protocol プロトコルに使用する数値を指定します。
  def new; end

  # --- sockaddr_in(port, host) -> String
  # --- pack_sockaddr_in(port, host) -> String
  # 
  # 指定したアドレスを[[ref:lib:socket#pack_string]]
  # で返します。port は、ポート番号を表す [[c:Fixnum]] あるいは、ポート
  # 番号、サービス名を表す文字列です。
  # 
  # @param port  ポート番号を表す [[c:Fixnum]] あるいは、ポート番号、サービス名を表す文字列を指定します。
  # 
  # @param host ホストを文字列で指定します。
  # 
  # @return 指定したアドレスを返します。
  # 
  # 例:
  # 
  #   require 'socket'
  #   p Socket.sockaddr_in("echo", "localhost")
  #   => "\002\000\000\a\177\000\000\001\000\000\000\000\000\000\000\000"
  #   p Socket.sockaddr_in("echo", "::1")
  #   => "\n\000\000\a\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000"
  def pack_sockaddr_in; end

  # --- sockaddr_un(path) -> String
  # --- pack_sockaddr_un(path) -> String
  # 
  # 指定したアドレスを[[ref:lib:socket#pack_string]]
  # で返します。
  # 
  # @param path パスを文字列で指定します。
  # 
  # 例:
  # 
  #   require 'socket'
  #   p Socket.sockaddr_un("/tmp/.X11-unix/X0")
  #   => "\001\000/tmp/.X11-unix/X0\000...."
  def pack_sockaddr_un; end

  # --- pair(domain, type, protocol=0) -> Array
  # --- socketpair(domain, type, protocol=0) -> Array
  # 
  # 相互に結合されたソケットのペアを含む2要素の配列を返します。
  # 引数の指定は [[m:Socket.open]] と同じです。
  # 
  # @param domain [[m:Socket.open]] を参照してください。
  # 
  # @param type   [[m:Socket.open]] を参照してください。
  # 
  # @param protocol [[m:Socket.open]] を参照してください。
  # 
  # @see [[m:Socket.open]]
  def pair; end

  # --- tcp(host, port, local_host=nil, local_port=nil, connect_timeout: nil) -> Socket
  # --- tcp(host, port, local_host=nil, local_port=nil, connect_timeout: nil) {|socket| ... } -> object
  # TCP/IP で host:port に接続するソケットオブジェクトを作成します。
  # 
  # local_host や local_port を指定した場合、ソケットをそこにバインドします。
  # 
  # ブロックを渡すと、生成したソケットをそのブロックに渡し呼び出します。
  # ブロック終了時にソケットオブジェクトを閉じます。
  # 
  # @param host 接続先のホスト名
  # @param port 接続先のポート番号
  # @param local_host 接続元のホスト名
  # @param local_port 接続元のポート番号
  # @param connect_timeout タイムアウトまでの秒数
  # @return ブロック付きで呼ばれた場合はブロックが返した値です。
  #         ブロックなしで呼ばれた場合はソケットオブジェクトを返します。
  # 
  #   require 'socket'
  # 
  #   Socket.tcp("www.ruby-lang.org", 80) {|sock|
  #     sock.print "GET / HTTP/1.0\r\nHost: www.ruby-lang.org\r\n\r\n"
  #     sock.close_write
  #     puts sock.read
  #   }
  def tcp; end

  # --- tcp_server_loop(port){|sock,addr| ...} -> ()
  # --- tcp_server_loop(host, port){|sock,addr| ...} -> ()
  # TCP/IP で host:port で待ち受けるサーバ側のソケットを作成し、
  # 新しい接続を受け入れるごとにブロックを呼び出します。
  # 
  # ブロックには新しい接続を表すソケットオブジェクトと、
  # クライアントアドレスを表す [[c:Addrinfo]] オブジェクトが渡されます。
  # 
  # ブロックの実行が終わってもソケットは close されません。
  # アプリケーション側が明示的に close する必要があります。
  # 
  # このメソッドはブロックを逐次的に呼び出します。
  # つまりブロックからリターンするまで次のコネクションを受け入れません。
  # そのため、同時に複数のクライアントと通信したい場合は
  # スレッドのような並列機構を使う必要があります。
  # 
  # サーバのソケットアドレスを決めるために
  # [[m:Addrinfo.getaddrinfo]] が用いられることに注意してください。
  # [[m:Addrinfo.getaddrinfo]] は複数のアドレスを返す(IPv4 と IPv6 など)
  # 場合があり、その場合その全てが用いられます。つまり IPv4 と IPv6 の
  # 両方を待ち受けます。getaddrinfo が 0 個のアドレスを返す場合はエラー
  # になります。1つ以上を返した場合にそれが用いられます。
  # 
  #   # 逐次的な echo サーバ
  #   # 一度に一つのクライアントした取り扱えない
  #   require 'socket'
  # 
  #   Socket.tcp_server_loop(16807) {|sock, client_addrinfo|
  #     begin
  #       IO.copy_stream(sock, sock)
  #     ensure
  #       sock.close
  #     end
  #   }
  #   
  #   # スレッドを使った echo サーバ
  #   # 同時に複数のクライアントを取り扱える
  #   # 以下の例だと接続制限がない(つまり接続過剰になりえる)ことに注意
  #   require 'socket'
  # 
  #   Socket.tcp_server_loop(16807) {|sock, client_addrinfo|
  #     Thread.new {
  #       begin
  #         IO.copy_stream(sock, sock)
  #       ensure
  #         sock.close
  #       end
  #     }
  #   }
  # 
  # 内部的には [[m:Socket.tcp_server_sockets]] で
  # 生成したソケットを [[m:Socket.accept_loop]] で処理しています。
  # 
  # @param host 割り当てるホスト名
  # @param port 割り当てるポート番号
  # @see [[m:Socket.tcp_server_sockets]], [[m:Socket.accept_loop]]
  def tcp_server_loop; end

  # --- tcp_server_sockets(port) -> [Socket]
  # --- tcp_server_sockets(host, port) -> [Socket]
  # --- tcp_server_sockets(port){|sockets| ...}  -> object
  # --- tcp_server_sockets(host, port){|sockets| ...}  -> object
  # 
  # TCP/IP で host:port で待ち受けるサーバ側のソケットを
  # 作成します。
  # 
  # ブロックなしの場合は、ソケットオブジェクトの配列を返します。
  # 
  # ブロック付きの場合は、ソケットオブジェクトをそのブロックに
  # 渡して呼び出します。ブロック終了時にそれらのソケットを閉じます。
  # 返り値はブロックの評価値となります。
  # 
  # port が 0 の場合は、実際のポート番号は動的に選ばれます。
  # ただし返り値のソケットはすべて同じ番号を持ちます。
  # 
  #   require 'socket'
  # 
  #   # tcp_server_sockets returns は2つのソケットを返す
  #   sockets = Socket.tcp_server_sockets(1296)
  #   p sockets #=> [#<Socket:fd 3>, #<Socket:fd 4>]
  #   
  #   # それぞれは IPv4 と IPv6 のソケット
  #   sockets.each {|s| p s.local_address }
  #   #=> #<Addrinfo: [::]:1296 TCP>
  #   #   #<Addrinfo: 0.0.0.0:1296 TCP>
  #   
  #   # ポート番号を動的に選んでも IPv6 と IPv4 で同じポート番号を持つ
  #   sockets = Socket.tcp_server_sockets(0)
  #   sockets.each {|s| p s.local_address }
  #   #=> #<Addrinfo: [::]:53114 TCP>
  #   #   #<Addrinfo: 0.0.0.0:53114 TCP>
  #   
  #   # ブロックにソケットの配列が渡される
  #   Socket.tcp_server_sockets(0) {|sockets|
  #     p sockets #=> [#<Socket:fd 3>, #<Socket:fd 4>]
  #   }
  # 
  # 
  # @param host 割り当てるホスト名
  # @param port 割り当てるポート番号
  # @see [[m:Socket.tcp_server_loop]]
  def tcp_server_sockets; end

  # --- udp_server_loop(port) {|msg, msg_src| ... } -> ()
  # --- udp_server_loop(host, port) {|msg, msg_src| ... } -> ()
  # UDP のサーバを起動して、メッセージが来るごとに
  # ブロックを呼び出します。
  # 
  # ブロックに渡される引数は msg と msg_src の 2 つで、
  # msg は受け取ったメッセージ文字列で、 msg_src は 
  # 通信相手の [[c:Socket::UDPSource]] オブジェクトです。
  # 
  # @param host 割り当てるホスト名
  # @param port 割り当てるポート番号
  # @see [[m:Socket.udp_server_sockets]], [[m:Socket.udp_server_loop_on]]
  def udp_server_loop; end

  # --- udp_server_loop_on(sockets) {|msg, msg_src| ... } -> ()
  # 
  # sockets (UDP のソケット)に対し、通信を待ち受けます。
  # 
  # [[m:Socket.udp_server_sockets]] の返り値がこれの引数に適切です。
  # 
  # ソケットからメッセージを受け取るたびにブロックを呼び出します。
  # ブロックに渡される引数は msg と msg_src の 2 つで、
  # msg は受け取ったメッセージ文字列で、 msg_src は 
  # 通信相手の [[c:Socket::UDPSource]] オブジェクトです。
  # 
  # 無限ループ構造になっています。
  # 
  # @param sockets 通信を待ち受けるソケットの配列
  # @see [[m:Socket.udp_server_recv]], [[m:Socket.udp_server_loop]]
  def udp_server_loop_on; end

  # --- udp_server_recv(sockets){|msg, msg_src| ... } -> ()
  # socketsで与えられた各 UDP ソケットからデータを読み取ります。
  # 
  # 各ソケットからメッセージを読み取るごとにブロックを呼び出します。
  # ブロックに渡される引数は msg と msg_src の 2 つで、
  # msg は受け取ったメッセージ文字列で、 msg_src は 
  # 通信相手の [[c:Socket::UDPSource]] オブジェクトです。
  # 
  # [[m:Socket.udp_server_loop]] はこのメソッドの用いて以下のようにして
  # 実装できます。
  # 
  #   require 'socket'
  # 
  #   udp_server_sockets(host, port) {|sockets|
  #     loop {
  #       readable, _, _ = IO.select(sockets)
  #       udp_server_recv(readable) {|msg, msg_src| ... }
  #     }
  #   }
  # 
  # @param sockets 読み込むソケットの配列
  def udp_server_recv; end

  # --- udp_server_sockets(port) -> [Sockets]
  # --- udp_server_sockets(host, port) -> [Sockets]
  # --- udp_server_sockets(port) {|sockets| ... } -> object
  # --- udp_server_sockets(host, port) {|sockets| ... } -> object
  # 
  # UDP で host:port を待ち受けるサーバ側のソケットを作成します。
  # 
  # ブロックなしの場合は、ソケットオブジェクトの配列を返します。
  # 
  # ブロック付きの場合は、ソケットオブジェクトをそのブロックに
  # 渡して呼び出します。ブロック終了時にそれらのソケットを閉じます。
  # 
  # port が 0 の場合は、実際のポート番号は動的に選ばれます。
  # ただし返り値のソケットはすべて同じ番号を持ちます。
  # 
  #   # UDP/IP echo server
  #   require 'socket'
  # 
  #   Socket.udp_server_sockets(0) {|sockets|
  #     p sockets.first.local_address.ip_port     #=> 32963
  #     Socket.udp_server_loop_on(sockets) {|msg, msg_src|
  #       msg_src.reply msg
  #     }
  #   }
  # 
  # @param host 割り当てるホスト名
  # @param port 割り当てるポート番号
  def udp_server_sockets; end

  # --- unix(path) -> Socket
  # --- unix(path){|sock| ... } -> object
  # Unix クライアントソケットを生成します。
  # 
  # ブロックが省略されたときは、生成されたソケットが返されます。
  # 
  # ブロックが渡されたときは、生成されたソケットを
  # 引数としてブロックを呼び出します。メソッドの返り値は
  # ブロックの評価値となります。また、ブロックの終了後に
  # ソケットを [[m:IO#close]] します。
  # 
  #   require 'socket'
  # 
  #   # /tmp/sock と通信する
  #   Socket.unix("/tmp/sock") {|sock|
  #     t = Thread.new { IO.copy_stream(sock, STDOUT) }
  #     IO.copy_stream(STDIN, sock)
  #     t.join
  #   }
  # 
  # @param path 接続対象のパス(文字列)
  def unix; end

  # --- unix_server_loop(path) {|socket, client_addrinfo| ... } -> ()
  # Unix サーバソケットを生成し、
  # 新しい接続を受け入れるごとにブロックを呼び出します。
  # 
  # ブロックには新しい接続を表すソケットオブジェクトと、
  # クライアントアドレスを表す [[c:Addrinfo]] オブジェクトが渡されます。
  # 
  # ブロックの実行が終わってもソケットは close されません。
  # アプリケーション側が明示的に close する必要があります。
  # 
  # path という名前のファイルが既に存在するときは、
  # そのファイルのオーナである場合は先にそのファイルを削除してしまいます。
  # これは path が悪意あるユーザによって変更されない場合に限りは安全です。
  # つまり、 /tmp/malicious-users-directory/socket という名前のパスは
  # 使うべきではありません。
  # /tmp にスティッキービットが立っている場合、/tmp/socket や
  # /tmp/your-private-directory/socket というパス名は安全と考えて良いでしょう。
  # 
  # @param path 接続を待ち受けるパス(文字列)
  def unix_server_loop; end

  # --- unix_server_socket(path) -> Socket
  # --- unix_server_socket(path){|sock| ... } -> object
  # Unix サーバソケットを生成します。
  # 
  # ブロックが省略されたときは、生成されたソケットが返されます。
  # 
  # ブロックが渡されたときは、生成されたソケットを
  # 引数としてブロックを呼び出します。メソッドの返り値は
  # ブロックの評価値となります。また、ブロックの終了後に
  # ソケットを [[m:IO#close]] します。
  # 
  #   require 'socket'
  # 
  #   socket = Socket.unix_server_socket("/tmp/s")
  #   p socket                  #=> #<Socket:fd 3>
  #   p socket.local_address    #=> #<Addrinfo: /tmp/s SOCK_STREAM>
  #   
  #   Socket.unix_server_socket("/tmp/sock") {|s|
  #     p s                     #=> #<Socket:fd 3>
  #     p s.local_address       #=> # #<Addrinfo: /tmp/sock SOCK_STREAM>
  #   }
  # 
  # @param path 接続を待ち受けるパス(文字列)
  def unix_server_socket; end

  # --- unpack_sockaddr_in(sockaddr) -> Array
  # 
  # [[ref:lib:socket#pack_string]]を
  # unpack したアドレスを返します。返される値は [port, ipaddr]
  # の配列です。
  # 
  # @param sockaddr ソケットアドレス構造体を pack した文字列[[ref:lib:socket#pack_string]]を指定します。
  # 
  # 例:
  # 
  #   require 'socket'
  #   p Socket.unpack_sockaddr_in(Socket.sockaddr_in("echo", "localhost"))
  #   => [7, "127.0.0.1"]
  #   p Socket.unpack_sockaddr_in(Socket.sockaddr_in("echo", "::1"))
  #   => [7, "::1"]
  def unpack_sockaddr_in; end

  # --- unpack_sockaddr_un(sockaddr) -> String
  # 
  # [[ref:lib:socket#pack_string]]を
  # unpack したソケットパス名を返します。
  # 
  # @param sockaddr ソケットアドレス構造体を pack した文字列[[ref:lib:socket#pack_string]]を指定します。
  # 
  # 例:
  # 
  #   require 'socket'
  #   p Socket.unpack_sockaddr_un(Socket.sockaddr_un("/tmp/.X11-unix/X0"))
  #   => "/tmp/.X11-unix/X0"
  def unpack_sockaddr_un; end

  # --- AF_APPLETALK -> Integer
  # --- PF_APPLETALK -> Integer
  # 
  # Apple talk。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2linux)]], [[man:socket(2freebsd)]], [[man:ddp(7linux)]]
  def AF_APPLETALK; end

  # --- AF_ATM -> Integer
  # --- PF_ATM -> Integer
  # 
  # ATM。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def AF_ATM; end

  # --- AF_AX25 -> Integer
  # --- PF_AX25 -> Integer
  # 
  # ITU-T X.25 / ISO-8208。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2linux)]]
  def AF_AX25; end

  # --- AF_CCITT -> Integer
  # --- PF_CCITT -> Integer
  # @todo
  # CCITT プロトコル。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_CCITT; end

  # --- AF_CHAOS -> Integer
  # --- PF_CHAOS -> Integer
  # @todo
  # MIT CHAOS プロトコル。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_CHAOS; end

  # --- AF_CNT -> Integer
  # --- PF_CNT -> Integer
  # @todo
  # Computer Network Technology。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_CNT; end

  # --- AF_COIP -> Integer
  # --- PF_COIP -> Integer
  # @todo
  # connection-oriented IP。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_COIP; end

  # --- AF_DATAKIT -> Integer
  # --- PF_DATAKIT -> Integer
  # @todo
  # datakit protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_DATAKIT; end

  # --- AF_DEC -> Integer
  # --- PF_DEC -> Integer
  # @todo
  # DECnet protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_DEC; end

  # --- AF_DLI -> Integer
  # --- PF_DLI -> Integer
  # @todo
  # DEC Direct data link interface。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_DLI; end

  # --- AF_E164 -> Integer
  # @todo
  # CCITT E.164 recommendation。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_E164; end

  # --- AF_ECMA -> Integer
  # --- PF_ECMA -> Integer
  # @todo
  # European computer manufacturers。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_ECMA; end

  # --- AF_HYLINK -> Integer
  # --- PF_HYLINK -> Integer
  # @todo
  # NSC Hyperchannel。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_HYLINK; end

  # --- AF_IMPLINK -> Integer
  # --- PF_IMPLINK -> Integer
  # @todo
  # ARPANET IMP。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_IMPLINK; end

  # --- AF_INET -> Integer
  # --- PF_INET -> Integer
  # 
  # IPv4。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:socket(2freebsd)]], [[man:ip(7linux)]]
  def AF_INET; end

  # --- AF_INET6 -> Integer
  # --- PF_INET6 -> Integer
  # 
  # IPv6。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:socket(2freebsd)]], [[man:ipv6(7linux)]]
  def AF_INET6; end

  # --- AF_IPX -> Integer
  # --- PF_IPX -> Integer
  # 
  # IPX(Novell Internet Packet eXchange protocol)。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(3linux)]]
  def AF_IPX; end

  # --- AF_ISDN -> Integer
  # --- PF_ISDN -> Integer
  # @todo
  # Integrated Services Digital Network。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_ISDN; end

  # --- AF_ISO -> Integer
  # --- AF_OSI -> Integer
  # --- PF_ISO -> Integer
  # --- PF_OSI -> Integer
  # @todo
  # ISO Open Systems Interconnection protocols。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_ISO; end

  # --- AF_LAT -> Integer
  # --- PF_LAT -> Integer
  # @todo
  # Local Area Transport protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_LAT; end

  # --- AF_LINK -> Integer
  # --- PF_LINK -> Integer
  # @todo
  # Link layer interface。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_LINK; end

  # --- AF_LOCAL -> Integer
  # --- AF_UNIX -> Integer
  # --- PF_LOCAL -> Integer
  # --- PF_UNIX -> Integer
  # 
  # Unix domain socket。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:unix(7linux)]]
  def AF_LOCAL; end

  # --- AF_MAX -> Integer
  # 対象のプラットフォーム上でのアドレスファミリーの最大の数値。
  # 
  # @see [[m:Socket::Constants::PF_MAX]]
  def AF_MAX; end

  # --- AF_NATM -> Integer
  # --- PF_NATM -> Integer
  # @todo
  # Native ATM access。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_NATM; end

  # --- AF_NDRV -> Integer
  # --- PF_NDRV -> Integer
  # @todo
  # Network driver raw access。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_NDRV; end

  # --- AF_NETBIOS -> Integer
  # --- PF_NETBIOS -> Integer
  # @todo
  # NetBIOS。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_NETBIOS; end

  # --- AF_NETGRAPH -> Integer
  # --- PF_NETGRAPH -> Integer
  # 
  # Netgraph sockets。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def AF_NETGRAPH; end

  # --- AF_NS -> Integer
  # --- PF_NS -> Integer
  # @todo
  # XEROX NS protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_NS; end

  # --- AF_PACKET -> Integer
  # --- PF_PACKET -> Integer
  # 
  # デバイスレベルインターフェース。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2linux)]], [[man:packet(7linux)]]     
  def AF_PACKET; end

  # --- AF_PPP -> Integer
  # --- PF_PPP -> Integer
  # @todo
  # Point-to-Point Protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_PPP; end

  # --- AF_PUP -> Integer
  # --- PF_PUP -> Integer
  # 
  # PUP(PARC Universal Packet)。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def AF_PUP; end

  # --- AF_ROUTE -> Integer
  # --- PF_ROUTE -> Integer
  # @todo
  # Internal Routing protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @todo
  def AF_ROUTE; end

  # --- AF_SIP -> Integer
  # --- PF_SIP -> Integer
  # @todo
  # Simple Internet Protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_SIP; end

  # --- AF_SNA -> Integer
  # --- PF_SNA -> Integer
  # @todo
  # IBM SNA protocol。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_SNA; end

  # --- AF_SYSTEM -> Integer
  # --- PF_SYSTEM -> Integer
  # 
  # @todo
  # 
  # [[m:Socket.open]] の第一引数 domain に使用します。
  def AF_SYSTEM; end

  # --- AF_UNSPEC -> Integer
  # 
  # アドレスファミリー不定。
  # 
  # @see [[m:Socket.open]], [[man:sys/socket.h(header)]]
  def AF_UNSPEC; end

  # --- AI_ADDRCONFIG -> Integer
  # Accept only if any address is assigned。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_ADDRCONFIG; end

  # --- AI_ALL -> Integer
  # Allow all addresses。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_ALL; end

  # --- AI_CANONNAME -> Integer
  # Fill in the canonical name。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_CANONNAME; end

  # --- AI_DEFAULT -> Integer
  # Default flags for getaddrinfo。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getipnodebyname(3freebsd)]]
  def AI_DEFAULT; end

  # --- AI_MASK -> Integer
  # @todo
  def AI_MASK; end

  # --- AI_NUMERICHOST -> Integer
  # Prevent host name resolution。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_NUMERICHOST; end

  # --- AI_NUMERICSERV -> Integer
  # Prevent server name resolution。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_NUMERICSERV; end

  # --- AI_PASSIVE -> Integer
  # Get address to use with bind。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_PASSIVE; end

  # --- AI_V4MAPPED -> Integer
  # Accept IPv4-mapped IPv6 addresses。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getaddrinfo(3)]]
  def AI_V4MAPPED; end

  # --- AI_V4MAPPED_CFG -> Integer
  # Accept IPv4 mapped addresses if the kernel supports it。
  # 
  # [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getipnodebyname(3freebsd)]]
  def AI_V4MAPPED_CFG; end

  # --- EAI_ADDRFAMILY -> Integer
  # Address family for hostname not supported
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_ADDRFAMILY; end

  # --- EAI_AGAIN -> Integer
  # Temporary failure in name resolution
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_AGAIN; end

  # --- EAI_BADFLAGS -> Integer
  # Invalid flags
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_BADFLAGS; end

  # --- EAI_BADHINTS -> Integer
  # Invalid value for hints
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  def EAI_BADHINTS; end

  # --- EAI_FAIL -> Integer
  # Non-recoverable failure in name resolution
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_FAIL; end

  # --- EAI_FAMILY -> Integer
  # Address family not supported
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_FAMILY; end

  # --- EAI_MAX -> Integer
  # 
  # EAI_* 定数の最大値。
  def EAI_MAX; end

  # --- EAI_MEMORY -> Integer
  # Memory allocation failure
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_MEMORY; end

  # --- EAI_NODATA -> Integer
  # No address associated with hostname
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]]
  def EAI_NODATA; end

  # --- EAI_NONAME -> Integer
  # Hostname nor servname, or not known
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_NONAME; end

  # --- EAI_OVERFLOW -> Integer
  # Argument buffer overflow
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_OVERFLOW; end

  # --- EAI_PROTOCOL -> Integer
  # Resolved protocol is unknown
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_PROTOCOL; end

  # --- EAI_SERVICE -> Integer
  # Servname not supported for socket type
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_SERVICE; end

  # --- EAI_SOCKTYPE -> Integer
  # Socket type not supported
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを [[c:SocketError]] に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_SOCKTYPE; end

  # --- EAI_SYSTEM -> Integer
  # System error returned in errno
  # 
  # [[man:getaddrinfo(3)]], [[man:getnameinfo(3)]] などの
  # エラーコードです。
  # 対応する [[m:Socket.getaddrinfo]], [[m:Addrinfo.getaddrinfo]] などは
  # エラーを適当な例外に変換するため、この定数は直接は利用しません。
  # 
  # @see [[man:getaddrinfo(3linux)]], [[man:gai_strerror(3freebsd)]]
  def EAI_SYSTEM; end

  # --- IFF_802_1Q_VLAN
  # 
  # 802.1Q VLAN device
  def IFF_802_1Q_VLAN; end

  # --- IFF_ALLMULTI
  # 
  # receive all multicast packets
  def IFF_ALLMULTI; end

  # --- IFF_ALTPHYS
  # 
  # use alternate physical connection
  def IFF_ALTPHYS; end

  # --- IFF_AUTOMEDIA
  # 
  # auto media select active
  def IFF_AUTOMEDIA; end

  # --- IFF_BONDING
  # 
  # bonding master or slave
  def IFF_BONDING; end

  # --- IFF_BRIDGE_PORT
  # 
  # device used as bridge port
  def IFF_BRIDGE_PORT; end

  # --- IFF_BROADCAST
  # 
  # broadcast address valid
  def IFF_BROADCAST; end

  # --- IFF_CANTCHANGE
  # 
  # flags not changeable
  def IFF_CANTCHANGE; end

  # --- IFF_CANTCONFIG
  # 
  # unconfigurable using ioctl(2)
  def IFF_CANTCONFIG; end

  # --- IFF_DEBUG
  # 
  # turn on debugging
  def IFF_DEBUG; end

  # --- IFF_DISABLE_NETPOLL
  # 
  # disable netpoll at run-time
  def IFF_DISABLE_NETPOLL; end

  # --- IFF_DONT_BRIDGE
  # 
  # disallow bridging this ether dev
  def IFF_DONT_BRIDGE; end

  # --- IFF_DORMANT
  # 
  # driver signals dormant
  def IFF_DORMANT; end

  # --- IFF_DRV_OACTIVE
  # 
  # tx hardware queue is full
  def IFF_DRV_OACTIVE; end

  # --- IFF_DRV_RUNNING
  # 
  # resources allocated
  def IFF_DRV_RUNNING; end

  # --- IFF_DYING
  # 
  # interface is winding down
  def IFF_DYING; end

  # --- IFF_DYNAMIC
  # 
  # dialup device with changing addresses
  def IFF_DYNAMIC; end

  # --- IFF_EBRIDGE
  # 
  # ethernet bridging device
  def IFF_EBRIDGE; end

  # --- IFF_ECHO
  # 
  # echo sent packets
  def IFF_ECHO; end

  # --- IFF_ISATAP
  # 
  # ISATAP interface (RFC4214)
  def IFF_ISATAP; end

  # --- IFF_LINK0
  # 
  # per link layer defined bit 0
  def IFF_LINK0; end

  # --- IFF_LINK1
  # 
  # per link layer defined bit 1
  def IFF_LINK1; end

  # --- IFF_LINK2
  # 
  # per link layer defined bit 2
  def IFF_LINK2; end

  # --- IFF_LIVE_ADDR_CHANGE
  # 
  # hardware address change when it's running
  def IFF_LIVE_ADDR_CHANGE; end

  # --- IFF_LOOPBACK
  # 
  # loopback net
  def IFF_LOOPBACK; end

  # --- IFF_LOWER_UP
  # 
  # driver signals L1 up
  def IFF_LOWER_UP; end

  # --- IFF_MACVLAN_PORT
  # 
  # device used as macvlan port
  def IFF_MACVLAN_PORT; end

  # --- IFF_MASTER
  # 
  # master of a load balancer
  def IFF_MASTER; end

  # --- IFF_MASTER_8023AD
  # 
  # bonding master, 802.3ad.
  def IFF_MASTER_8023AD; end

  # --- IFF_MASTER_ALB
  # 
  # bonding master, balance-alb.
  def IFF_MASTER_ALB; end

  # --- IFF_MASTER_ARPMON
  # 
  # bonding master, ARP mon in use
  def IFF_MASTER_ARPMON; end

  # --- IFF_MONITOR
  # 
  # user-requested monitor mode
  def IFF_MONITOR; end

  # --- IFF_MULTICAST
  # 
  # supports multicast
  def IFF_MULTICAST; end

  # --- IFF_NOARP
  # 
  # no address resolution protocol
  def IFF_NOARP; end

  # --- IFF_NOTRAILERS
  # 
  # avoid use of trailers
  def IFF_NOTRAILERS; end

  # --- IFF_OACTIVE
  # 
  # transmission in progress
  def IFF_OACTIVE; end

  # --- IFF_OVS_DATAPATH
  # 
  # device used as Open vSwitch datapath port
  def IFF_OVS_DATAPATH; end

  # --- IFF_POINTOPOINT
  # 
  # point-to-point link
  def IFF_POINTOPOINT; end

  # --- IFF_PORTSEL
  # 
  # can set media type
  def IFF_PORTSEL; end

  # --- IFF_PPROMISC
  # 
  # user-requested promisc mode
  def IFF_PPROMISC; end

  # --- IFF_PROMISC
  # 
  # receive all packets
  def IFF_PROMISC; end

  # --- IFF_RENAMING
  # 
  # interface is being renamed
  def IFF_RENAMING; end

  # --- IFF_ROUTE
  # 
  # routing entry installed
  def IFF_ROUTE; end

  # --- IFF_RUNNING
  # 
  # resources allocated
  def IFF_RUNNING; end

  # --- IFF_SIMPLEX
  # 
  # can't hear own transmissions
  def IFF_SIMPLEX; end

  # --- IFF_SLAVE
  # 
  # slave of a load balancer
  def IFF_SLAVE; end

  # --- IFF_SLAVE_INACTIVE
  # 
  # bonding slave not the curr. active
  def IFF_SLAVE_INACTIVE; end

  # --- IFF_SLAVE_NEEDARP
  # 
  # need ARPs for validation
  def IFF_SLAVE_NEEDARP; end

  # --- IFF_SMART
  # 
  # interface manages own routes
  def IFF_SMART; end

  # --- IFF_STATICARP
  # 
  # static ARP
  def IFF_STATICARP; end

  # --- IFF_SUPP_NOFCS
  # 
  # sending custom FCS
  def IFF_SUPP_NOFCS; end

  # --- IFF_TEAM_PORT
  # 
  # used as team port
  def IFF_TEAM_PORT; end

  # --- IFF_TX_SKB_SHARING
  # 
  # sharing skbs on transmit
  def IFF_TX_SKB_SHARING; end

  # --- IFF_UNICAST_FLT
  # 
  # unicast filtering
  def IFF_UNICAST_FLT; end

  # --- IFF_UP
  # 
  # interface is up
  def IFF_UP; end

  # --- IFF_VOLATILE
  # 
  # volatile flags
  def IFF_VOLATILE; end

  # --- IFF_WAN_HDLC
  # 
  # WAN HDLC device
  def IFF_WAN_HDLC; end

  # --- IFF_XMIT_DST_RELEASE
  # 
  # dev_hard_start_xmit() is allowed to release skb->dst
  def IFF_XMIT_DST_RELEASE; end

  # --- IFNAMSIZ -> Integer
  # --- IF_NAMESIZE -> Integer
  # 
  # インターフェース名文字列の最大長さ。
  # 
  # @see [[man:net/if.h(header)]]
  def IFNAMSIZ; end

  # --- INADDR_ALLHOSTS_GROUP -> Integer
  # Multicast group for all systems on this subset。
  # IPv4の 244.0.0.1 に対応する整数です。
  # 
  # @see [[url:http://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml]], [[RFC:5771]]
  def INADDR_ALLHOSTS_GROUP; end

  # --- INADDR_ANY -> Integer
  # A socket bound to INADDR_ANY receives packets from 
  # all interfaces and sends from the default IP address。
  # IPv4アドレスの 0.0.0.0 に対応する整数です。
  # 
  # @see [[man:netinet/in.h(header)]], [[man:ip(7linux)]], [[man:ip(4freebsd)]]
  def INADDR_ANY; end

  # --- INADDR_BROADCAST -> Integer
  # The network broadcast address。
  # IPv4のブロードキャストアドレス 255.255.255.255 に対応する整数です。
  # 
  # @see [[man:netinet/in.h(header)]], [[man:ip(7linux)]], [[man:ip(4freebsd)]]
  def INADDR_BROADCAST; end

  # --- INADDR_LOOPBACK -> Integer
  # The loopback address。
  # IPv4のループバックアドレス 127.0.0.1 に対応する整数です。
  # 
  # @see [[man:ip(7linux)]], [[man:ip(4freebsd)]]
  def INADDR_LOOPBACK; end

  # --- INADDR_MAX_LOCAL_GROUP -> Integer
  # The last local network multicast group。
  # IPv4の 244.0.0.255 に対応する整数です。
  # 
  # @see [[url:http://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml]], [[RFC:5771]]
  def INADDR_MAX_LOCAL_GROUP; end

  # --- INADDR_NONE -> Integer
  # A bitmask for matching no valid IP address。
  # エラーを表すアドレス値です。
  def INADDR_NONE; end

  # --- INADDR_UNSPEC_GROUP -> Integer
  # The reserved multicast group。
  # IPv4の 244.0.0.0 に対応する整数です。
  # 
  # @see [[url:http://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml]], [[RFC:5771]]
  def INADDR_UNSPEC_GROUP; end

  # --- INET6_ADDRSTRLEN -> Integer
  # IPv6アドレス文字列の最大長。
  # 
  # @see [[man:netinet/in.h(header)]]
  def INET6_ADDRSTRLEN; end

  # --- INET_ADDRSTRLEN -> Integer
  # IPv4アドレス文字列の最大長。
  # 
  # @see [[man:netinet/in.h(header)]]
  def INET_ADDRSTRLEN; end

  # --- IPPORT_RESERVED -> Integer
  # 利用法が予約されているポート番号の最大値。
  def IPPORT_RESERVED; end

  # --- IPPORT_USERRESERVED -> Integer
  # ユーザが自由に利用して良いポート番号の最小値。
  def IPPORT_USERRESERVED; end

  # --- IPPROTO_AH -> Integer
  # IPv6 auth header。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_AH; end

  # --- IPPROTO_BIP -> Integer
  # @todo
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_BIP; end

  # --- IPPROTO_DSTOPTS -> Integer
  # IPv6 destination option。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_DSTOPTS; end

  # --- IPPROTO_EGP -> Integer
  # @todo
  # Exterior Gateway Protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_EGP; end

  # --- IPPROTO_EON -> Integer
  # @todo
  # ISO cnlp。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_EON; end

  # --- IPPROTO_ESP -> Integer
  # IPv6 Encapsulated Security Payload。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_ESP; end

  # --- IPPROTO_FRAGMENT -> Integer
  # IPv6 fragmentation header。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_FRAGMENT; end

  # --- IPPROTO_GGP -> Integer
  # @todo
  # Gateway to Gateway Protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_GGP; end

  # --- IPPROTO_HELLO -> Integer
  # @todo
  # "hello" routing protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_HELLO; end

  # --- IPPROTO_HOPOPTS -> Integer
  # IPv6 hop-by-hop options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_HOPOPTS; end

  # --- IPPROTO_ICMP -> Integer
  # Control message protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:icmp(4freebsd)]], [[man:icmp(7linux)]]
  def IPPROTO_ICMP; end

  # --- IPPROTO_ICMPV6 -> Integer
  # Internet Control Message Protocol for IPv6。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:icmp6(4freebsd)]], [[rfc:2292]]
  #      
  def IPPROTO_ICMPV6; end

  # --- IPPROTO_IDP -> Integer
  # @todo
  # XNS IDP。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_IDP; end

  # --- IPPROTO_IGMP -> Integer
  # @todo
  # Group Management Protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_IGMP; end

  # --- IPPROTO_IP -> Integer
  # Internet protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IPPROTO_IP; end

  # --- IPPROTO_IPV6 -> Integer
  # Internet Protocol Version 6。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]]
  #      [[rfc:2292]]
  def IPPROTO_IPV6; end

  # --- IPPROTO_MAX -> Integer
  # IPPROTO 定数の最大値。
  def IPPROTO_MAX; end

  # --- IPPROTO_ND -> Integer
  # @todo
  # Sun net disk protocol
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_ND; end

  # --- IPPROTO_NONE -> Integer
  # IP6 no next header。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_NONE; end

  # --- IPPROTO_PUP -> Integer
  # @todo
  # PARC Universal Packet protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_PUP; end

  # --- IPPROTO_RAW -> Integer
  # Raw IP packets protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:ip(4freebsd)]], [[man:raw(7linux)]]
  def IPPROTO_RAW; end

  # --- IPPROTO_ROUTING -> Integer
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[rfc:2292]]
  def IPPROTO_ROUTING; end

  # --- IPPROTO_TCP -> Integer
  # Transmission control protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:tcp(4freebsd)]], [[man:tcp(7linux)]]
  def IPPROTO_TCP; end

  # --- IPPROTO_TP -> Integer
  # @todo
  # ISO transport protocol class 4。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_TP; end

  # --- IPPROTO_UDP -> Integer
  # User Datagram Protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  # 
  # @see [[man:netinet/in.h(header)]]
  #      [[man:udp(4freebsd)]], [[man:udp(7linux)]]
  def IPPROTO_UDP; end

  # --- IPPROTO_XTP -> Integer
  # @todo
  # Xpress Transport Protocol。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]] の 
  # level 引数に使用します。
  # 
  # また、[[m:Socket.open]] の protocol 引数に渡す利用法もあります。
  def IPPROTO_XTP; end

  # --- IPV6_CHECKSUM -> Integer
  # Byte offset into a packet where the checksum is located.
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:ip6(4freebsd)]],
  #      [[RFC:3542]]
  def IPV6_CHECKSUM; end

  # --- IPV6_DONTFRAG -> Integer
  # Don't fragment packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_DONTFRAG; end

  # --- IPV6_DSTOPTS -> Integer
  # Destination options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3542]]
  def IPV6_DSTOPTS; end

  # --- IPV6_HOPLIMIT -> Integer
  # Hop limit。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3542]]
  def IPV6_HOPLIMIT; end

  # --- IPV6_HOPOPTS -> Integer
  # Hop-by-hop options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3542]]
  def IPV6_HOPOPTS; end

  # --- IPV6_JOIN_GROUP -> Integer
  # Join a multicast group。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_JOIN_GROUP; end

  # --- IPV6_LEAVE_GROUP -> Integer
  # Leave a multicast group。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_LEAVE_GROUP; end

  # --- IPV6_MULTICAST_HOPS -> Integer
  # IPv6 multicast hop limit。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_MULTICAST_HOPS; end

  # --- IPV6_MULTICAST_IF -> Integer
  # IP6 multicast interface。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_MULTICAST_IF; end

  # --- IPV6_MULTICAST_LOOP -> Integer
  # IP6 multicast loopback。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_MULTICAST_LOOP; end

  # --- IPV6_NEXTHOP -> Integer
  # Next hop address。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_NEXTHOP; end

  # --- IPV6_PATHMTU -> Integer
  # Retrieve current path MTU。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_PATHMTU; end

  # --- IPV6_PKTINFO -> Integer
  # Receive packet information with datagram。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3542]]
  def IPV6_PKTINFO; end

  # --- IPV6_RECVDSTOPTS -> Integer
  # Receive all IP6 options for response。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVDSTOPTS; end

  # --- IPV6_RECVHOPLIMIT -> Integer
  # Receive hop limit with datagram。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVHOPLIMIT; end

  # --- IPV6_RECVHOPOPTS -> Integer
  # Receive hop-by-hop options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVHOPOPTS; end

  # --- IPV6_RECVPATHMTU -> Integer
  # Receive current path MTU with datagram。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVPATHMTU; end

  # --- IPV6_RECVPKTINFO -> Integer
  # Receive destination IP address and incoming interface。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVPKTINFO; end

  # --- IPV6_RECVRTHDR -> Integer
  # Receive routing header。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVRTHDR; end

  # --- IPV6_RECVTCLASS -> Integer
  # Receive traffic class。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RECVTCLASS; end

  # --- IPV6_RTHDR -> Integer
  # Allows removal of sticky routing headers。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RTHDR; end

  # --- IPV6_RTHDRDSTOPTS -> Integer
  # Allows removal of sticky destination options header。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RTHDRDSTOPTS; end

  # --- IPV6_RTHDR_TYPE_0 -> Integer
  #  Routing header type 0。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_RTHDR_TYPE_0; end

  # --- IPV6_TCLASS -> Integer
  # Specify the traffic class。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_TCLASS; end

  # --- IPV6_UNICAST_HOPS -> Integer
  # IPv6 unicast hop limit。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_UNICAST_HOPS; end

  # --- IPV6_USE_MIN_MTU -> Integer
  # Use the minimum MTU size。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3542]]
  def IPV6_USE_MIN_MTU; end

  # --- IPV6_V6ONLY -> Integer
  # Only bind IPv6。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[man:netinet/in.h(header)]], [[man:ip6(4freebsd)]], [[man:ipv6(7linux)]],
  #      [[RFC:3493]]
  def IPV6_V6ONLY; end

  # --- IPX_TYPE -> Integer
  # @todo
  def IPX_TYPE; end

  # --- IP_ADD_MEMBERSHIP -> Integer
  # Add a multicast group membership
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  #      
  def IP_ADD_MEMBERSHIP; end

  # --- IP_ADD_SOURCE_MEMBERSHIP -> Integer
  # Add a multicast group membership。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_ADD_SOURCE_MEMBERSHIP; end

  # --- IP_BLOCK_SOURCE -> Integer
  # Block IPv4 multicast packets with a give source address。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_BLOCK_SOURCE; end

  # --- IP_DEFAULT_MULTICAST_LOOP -> Integer
  # @todo
  # Default multicast loopback
  def IP_DEFAULT_MULTICAST_LOOP; end

  # --- IP_DEFAULT_MULTICAST_TTL -> Integer
  # @todo
  # Default multicast TTL
  def IP_DEFAULT_MULTICAST_TTL; end

  # --- IP_DONTFRAG -> Integer
  # Don't fragment packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_DONTFRAG; end

  # --- IP_DROP_MEMBERSHIP -> Integer
  # Drop a multicast group membership。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_DROP_MEMBERSHIP; end

  # --- IP_DROP_SOURCE_MEMBERSHIP -> Integer
  # Drop a multicast group membership。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_DROP_SOURCE_MEMBERSHIP; end

  # --- IP_FREEBIND -> Integer
  # Allow binding to nonexistent IP addresses。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_FREEBIND; end

  # --- IP_HDRINCL -> Integer
  # Header is included with data。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_HDRINCL; end

  # --- IP_IPSEC_POLICY -> Integer
  # IPsec security policy。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]],
  #      [[url:http://netbsd.gw.com/cgi-bin/man-cgi?ip++NetBSD-current]]
  def IP_IPSEC_POLICY; end

  # --- IP_MAX_MEMBERSHIPS -> Integer
  # Maximum number multicast groups a socket can join。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_MAX_MEMBERSHIPS; end

  # --- IP_MINTTL -> Integer
  # Minimum TTL allowed for received packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_MINTTL; end

  # --- IP_MSFILTER -> Integer
  # @todo
  # Multicast source filtering
  def IP_MSFILTER; end

  # --- IP_MTU -> Integer
  # The Maximum Transmission Unit of the socket。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_MTU; end

  # --- IP_MTU_DISCOVER -> Integer
  # Path MTU discovery。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_MTU_DISCOVER; end

  # --- IP_MULTICAST_IF -> Integer
  # IP multicast interface。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_MULTICAST_IF; end

  # --- IP_MULTICAST_LOOP -> Integer
  # IP multicast loopback。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_MULTICAST_LOOP; end

  # --- IP_MULTICAST_TTL -> Integer
  # IP multicast TTL。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_MULTICAST_TTL; end

  # --- IP_ONESBCAST -> Integer
  # Force outgoing broadcast datagrams to have the undirected broadcast address。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_ONESBCAST; end

  # --- IP_OPTIONS -> Integer
  # IP options to be included in packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_OPTIONS; end

  # --- IP_PASSSEC -> Integer
  # @todo
  # Retrieve security context with datagram。
  def IP_PASSSEC; end

  # --- IP_PKTINFO -> Integer
  # Receive packet information with datagrams。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_PKTINFO; end

  # --- IP_PKTOPTIONS -> Integer
  # @todo
  # Receive packet options with datagrams
  def IP_PKTOPTIONS; end

  # --- IP_PMTUDISC_DO -> Integer
  # Always send DF frames。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_PMTUDISC_DO; end

  # --- IP_PMTUDISC_DONT -> Integer
  # Never send DF frames。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_PMTUDISC_DONT; end

  # --- IP_PMTUDISC_WANT -> Integer
  # Use per-route hints。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_PMTUDISC_WANT; end

  # --- IP_PORTRANGE -> Integer
  # Set the port range for sockets with unspecified port numbers。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_PORTRANGE; end

  # --- IP_RECVDSTADDR -> Integer
  # Receive IP destination address with datagram。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_RECVDSTADDR; end

  # --- IP_RECVERR -> Integer
  # Enable extended reliable error message passing。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_RECVERR; end

  # --- IP_RECVIF -> Integer
  # Receive interface information with datagrams。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_RECVIF; end

  # --- IP_RECVOPTS -> Integer
  # Receive IP destination address with datagram。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(7linux)]]
  def IP_RECVOPTS; end

  # --- IP_RECVRETOPTS -> Integer
  # @todo
  # Receive all IP options for response
  def IP_RECVRETOPTS; end

  # --- IP_RECVSLLA -> Integer
  # @todo
  # Receive link-layer address with datagrams
  def IP_RECVSLLA; end

  # --- IP_RECVTOS -> Integer
  # Receive TOS with incoming packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_RECVTOS; end

  # --- IP_RECVTTL -> Integer
  # Receive IP TTL with datagrams。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]], [[man:ip(4freebsd)]]
  def IP_RECVTTL; end

  # --- IP_RETOPTS -> Integer
  # IP options to be included in datagrams。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(7linux)]]
  def IP_RETOPTS; end

  # --- IP_ROUTER_ALERT -> Integer
  # Notify transit routers to more closely examine the contents of an IP packet。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(7linux)]]
  def IP_ROUTER_ALERT; end

  # --- IP_SENDSRCADDR -> Integer
  # ource address for outgoing UDP datagrams。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[man:ip(4freebsd)]]
  def IP_SENDSRCADDR; end

  # --- IP_TOS -> Integer
  # IP type-of-service。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_TOS; end

  # --- IP_TTL -> Integer
  # IP time-to-live。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]], [[man:ip(7linux)]]
  def IP_TTL; end

  # --- IP_UNBLOCK_SOURCE -> Integer
  # Unblock IPv4 multicast packets with a give source address。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], 
  #      [[man:ip(4freebsd)]]
  def IP_UNBLOCK_SOURCE; end

  # --- IP_XFRM_POLICY -> Integer
  # @todo
  def IP_XFRM_POLICY; end

  # --- LOCAL_CONNWAIT -> Integer
  # Retrieve peer credentials。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:ip(4freebsd)]]
  def LOCAL_CONNWAIT; end

  # --- LOCAL_CREDS -> Integer
  # Pass credentials to receiver。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:ip(4freebsd)]]
  def LOCAL_CREDS; end

  # --- LOCAL_PEERCRED -> Integer
  # Pass credentials to receiver。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:ip(4freebsd)]]
  def LOCAL_PEERCRED; end

  # --- MCAST_BLOCK_SOURCE -> Integer
  # Block multicast packets from this source
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_BLOCK_SOURCE; end

  # --- MCAST_EXCLUDE -> Integer
  # Exclusive multicast source filter
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_EXCLUDE; end

  # --- MCAST_INCLUDE -> Integer
  # Inclusive multicast source filter
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_INCLUDE; end

  # --- MCAST_JOIN_GROUP -> Integer
  # Join a multicast group
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_JOIN_GROUP; end

  # --- MCAST_JOIN_SOURCE_GROUP -> Integer
  # Join a multicast source group
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_JOIN_SOURCE_GROUP; end

  # --- MCAST_LEAVE_GROUP -> Integer
  # Leave a multicast group
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_LEAVE_GROUP; end

  # --- MCAST_LEAVE_SOURCE_GROUP -> Integer
  # Leave a multicast source group
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_LEAVE_SOURCE_GROUP; end

  # --- MCAST_MSFILTER -> Integer
  # @todo
  # Multicast source filtering
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_MSFILTER; end

  # --- MCAST_UNBLOCK_SOURCE -> Integer
  # Unblock multicast packets from this source
  # 
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_IP]], [[m:Socket::Constants::IPPROTO_IPV6]],
  #      [[RFC:3678]]
  def MCAST_UNBLOCK_SOURCE; end

  # --- MSG_COMPAT -> Integer
  # @todo
  # End of record
  def MSG_COMPAT; end

  # --- MSG_CONFIRM -> Integer
  # Confirm path validity
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]]
  # の flags 引数に用います。
  # 
  # @see [[man:send(2linux)]]
  def MSG_CONFIRM; end

  # --- MSG_CTRUNC -> Integer
  # Control data lost before delivery。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:send(2freebsd)]], [[man:recv(2freebsd)]]
  def MSG_CTRUNC; end

  # --- MSG_DONTROUTE -> Integer
  # Send without using the routing tables。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2linux)]]
  #      [[man:send(2freebsd)]]
  def MSG_DONTROUTE; end

  # --- MSG_DONTWAIT -> Integer
  # This message should be non-blocking。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:recv(2freebsd)]]
  def MSG_DONTWAIT; end

  # --- MSG_EOF -> Integer
  # Data completes connection。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:send(2freebsd)]]
  def MSG_EOF; end

  # --- MSG_EOR -> Integer
  # Data completes record。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2)]], [[man:sendto(2)]], [[man:sendmsg(2)]],
  #      [[man:recv(2)]], [[man:recvfrom(2)]], [[man:recvmsg(2)]],
  #      [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:send(2freebsd)]], [[man:recv(2freebsd)]]
  def MSG_EOR; end

  # --- MSG_ERRQUEUE -> Integer
  # Fetch message from error queue
  # 
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:recv(2linux)]]
  def MSG_ERRQUEUE; end

  # --- MSG_FIN -> Integer
  # @todo
  def MSG_FIN; end

  # --- MSG_FLUSH -> Integer
  # @todo
  # Start of a hold sequence.  Dumps to so_temp
  def MSG_FLUSH; end

  # --- MSG_HAVEMORE -> Integer
  # @todo
  # Data ready to be read
  def MSG_HAVEMORE; end

  # --- MSG_HOLD -> Integer
  # @todo
  # Hold fragment in so_temp
  def MSG_HOLD; end

  # --- MSG_MORE -> Integer
  # Sender will send more
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:send(2linux)]]
  def MSG_MORE; end

  # --- MSG_NOSIGNAL -> Integer
  # Do not generate SIGPIPE
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:send(2linux)]], [[man:send(2freebsd)]]
  def MSG_NOSIGNAL; end

  # --- MSG_OOB -> Integer
  # Process out-of-band data。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2)]], [[man:sendto(2)]], [[man:sendmsg(2)]],
  #      [[man:recv(2)]], [[man:recvfrom(2)]], [[man:recvmsg(2)]],
  #      [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:send(2freebsd)]], [[man:recv(2freebsd)]]
  def MSG_OOB; end

  # --- MSG_PEEK -> Integer
  # Peek at incoming message。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2)]], [[man:sendto(2)]], [[man:sendmsg(2)]],
  #      [[man:recv(2)]], [[man:recvfrom(2)]], [[man:recvmsg(2)]],
  #      [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:send(2freebsd)]], [[man:recv(2freebsd)]]
  def MSG_PEEK; end

  # --- MSG_PROXY -> Integer
  # @todo
  # Wait for full request
  def MSG_PROXY; end

  # --- MSG_RCVMORE -> Integer
  # @todo
  # Data remains in the current packet
  def MSG_RCVMORE; end

  # --- MSG_RST -> Integer
  # @todo
  def MSG_RST; end

  # --- MSG_SEND -> Integer
  # @todo
  # Send the packet in so_temp
  def MSG_SEND; end

  # --- MSG_SYN -> Integer
  # @todo
  def MSG_SYN; end

  # --- MSG_TRUNC -> Integer
  # Data discarded before delivery。
  # 
  # [[m:BasicSocket#send]], [[m:BasicSocket#sendmsg]],
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]]
  # の flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:send(2linux)]], [[man:recv(2linux)]],
  #      [[man:send(2freebsd)]], [[man:recv(2freebsd)]]
  def MSG_TRUNC; end

  # --- MSG_WAITALL -> Integer
  # Wait for full request or error
  # 
  # [[m:BasicSocket#recv]], [[m:BasicSocket#recvmsg]] の
  # flags 引数に用います。
  # 
  # @see [[man:sys/socket.h(header)]],
  #      [[man:recv(2)]], [[man:recvfrom(2)]], [[man:recvmsg(2)]],
  #      [[man:recv(2linux)]],
  #      [[man:recv(2freebsd)]]
  def MSG_WAITALL; end

  # --- NI_DGRAM -> Integer
  # The service specified is a datagram service (looks up UDP ports)。
  # 
  # [[m:Socket.getnameinfo]], [[m:Addrinfo#getnameinfo]] の引数 flags に渡す
  # 定数です。
  # 
  #   require 'socket'
  #   
  #   Socket.getnameinfo([ Socket::AF_INET, 514, "127.0.0.1"], Socket::NI_DGRAM)
  #   # => ["localhost", "syslog"]
  #   Socket.getnameinfo([ Socket::AF_INET, 514, "127.0.0.1"])
  #   # => ["localhost", "shell"]
  # 
  # @see [[man:getnameinfo(3)]]
  def NI_DGRAM; end

  # --- NI_MAXHOST -> Integer
  # 
  # [[man:getnameinfo(3)]] で用いるホスト名文字列の最大長さ。
  # 
  # @see [[man:getnameinfo(3linux)]]
  def NI_MAXHOST; end

  # --- NI_MAXSERV -> Integer
  # 
  # [[man:getnameinfo(3)]] で用いるサービス名文字列の最大長さ。
  # 
  # @see [[man:getnameinfo(3linux)]]
  def NI_MAXSERV; end

  # --- NI_NAMEREQD -> Integer
  # 
  # A name is required。名前解決できなかった場合にエラーを返すことを意味します。
  # 
  # [[m:Socket.getnameinfo]], [[m:Addrinfo#getnameinfo]] の引数 flags に渡す
  # 定数です。
  # 
  #   require 'socket'
  #   
  #   # ここでは 192.0.2.18 は名前解決できないアドレス
  #   Addrinfo.tcp("192.0.2.18", 514).getnameinfo()
  #   # =>["192.0.2.18", "shell"] 
  #   Addrinfo.tcp("192.0.2.18", 514).getnameinfo(Socket::NI_NAMEREQD)
  #   # SocketError が発生する
  # 
  # @see [[man:getnameinfo(3)]]
  def NI_NAMEREQD; end

  # --- NI_NOFQDN -> Integer
  # 
  # An FQDN is not required for local hosts, return only the local part.
  # 
  # [[m:Socket.getnameinfo]], [[m:Addrinfo#getnameinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getnameinfo(3)]]
  def NI_NOFQDN; end

  # --- NI_NUMERICHOST -> Integer
  # 
  # Return a numeric address.
  # 
  # [[m:Socket.getnameinfo]], [[m:Addrinfo#getnameinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getnameinfo(3)]]
  def NI_NUMERICHOST; end

  # --- NI_NUMERICSERV -> Integer
  # Return the service name as a digit string
  # 
  # [[m:Socket.getnameinfo]], [[m:Addrinfo#getnameinfo]] の引数 flags に渡す
  # 定数です。
  # 
  # @see [[man:getnameinfo(3)]]
  def NI_NUMERICSERV; end

  # --- PF_KEY -> Integer
  # Internal key-management function。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def PF_KEY; end

  # --- PF_MAX -> Integer
  # プロトコルファミリーの最大数。
  # 
  # @see [[m:Socket::Constants::AF_MAX]]
  def PF_MAX; end

  # --- PF_PIP -> Integer
  # Help Identify PIP packets。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def PF_PIP; end

  # --- PF_RTIP -> Integer
  # Help Identify RTIP packets。
  # [[m:Socket.open]] の第一引数 domain に使用します。
  # 
  # @see [[man:socket(2freebsd)]]
  def PF_RTIP; end

  # --- PF_UNSPEC -> Integer
  # プロトコルファミリー不定。
  # 
  # @see [[m:Socket::Constants::AF_UNSPEC]], [[m:Socket.open]]
  def PF_UNSPEC; end

  # --- PF_XTP -> Integer
  # @todo
  # eXpress Transfer Protocol。
  def PF_XTP; end

  # --- SCM_BINTIME -> Integer
  # Timestamp (bintime).
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], [[m:Socket::AncillaryData#timestamp]]
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]]
  def SCM_BINTIME; end

  # --- SCM_CREDENTIALS -> Integer
  # The sender's credentials
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], 
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]],
  #      [[man:unix(7linux)]]
  def SCM_CREDENTIALS; end

  # --- SCM_CREDS -> Integer
  # Process credentials
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], 
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]],
  #      [[man:unix(4freebsd)]]
  def SCM_CREDS; end

  # --- SCM_RIGHTS -> Integer
  # Access rights.
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], [[m:Socket::AncillaryData#unix_rights]]
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]],
  #      [[man:unix(7linux)]], [[man:unix(4freebsd)]],
  #      [[man:sys/socket.h(header)]]
  def SCM_RIGHTS; end

  # --- SCM_TIMESTAMP -> Integer
  # Timestamp (timeval).
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], [[m:Socket::AncillaryData#timestamp]]
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]]
  def SCM_TIMESTAMP; end

  # --- SCM_TIMESTAMPNS -> Integer
  # Timestamp (timespec).
  # 
  # [[c:Socket::AncillaryData]] の type として利用します。
  # 
  # @see [[c:Socket::AncillaryData]], [[m:Socket::AncillaryData#timestamp]]
  #      [[m:BasicSocket#sendmsg]], [[m:BasicSocket#recvmsg]]
  def SCM_TIMESTAMPNS; end

  # --- SCM_UCRED -> Integer
  # @todo
  # User credentials。
  def SCM_UCRED; end

  # --- SHUT_RD -> Integer
  # [[m:BasicSocket#shutdown]] の how 引数に使用します。
  def SHUT_RD; end

  # --- SHUT_RDWR -> Integer
  # [[m:BasicSocket#shutdown]] の how 引数に使用します。
  def SHUT_RDWR; end

  # --- SHUT_WR -> Integer
  # [[m:BasicSocket#shutdown]] の how 引数に使用します。
  def SHUT_WR; end

  # --- SOCK_DGRAM -> Integer
  # 
  # データグラム通信。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[man:socket(2)]], [[m:Socket.open]]
  def SOCK_DGRAM; end

  # --- SOCK_PACKET -> Integer
  # 
  # デバイスレベルインターフェース。Obsoleteであり使うべきではない。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[man:packet(7linux)]], [[m:Socket.open]]
  def SOCK_PACKET; end

  # --- SOCK_RAW -> Integer
  # 
  # RAW ソケット。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:socket(2linux)]], 
  #      [[man:raw(7linux)]], [[m:Socket.open]]
  def SOCK_RAW; end

  # --- SOCK_RDM -> Integer
  # 
  # 信頼性のあるデータグラム通信。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[man:socket(2linux)]], [[m:Socket.open]]
  def SOCK_RDM; end

  # --- SOCK_SEQPACKET -> Integer
  # 
  # 固定最大長を持つストリーム通信。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[m:Socket.open]], [[man:socket(2)]], [[man:socket(2linux)]],
  #      [[man:socket(2freebsd)]]
  def SOCK_SEQPACKET; end

  # --- SOCK_STREAM -> Integer
  # 
  # ストリーム通信。
  # [[m:Socket.open]] の第二引数 type に使用します。
  # 
  # @see [[m:Socket.open]], [[man:socket(2)]], [[man:socket(2linux)]],
  #      [[man:socket(2freebsd)]]
  def SOCK_STREAM; end

  # --- SOL_ATALK -> Integer
  # @todo
  # AppleTalk socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  def SOL_ATALK; end

  # --- SOL_AX25 -> Integer
  # @todo
  # AX.25 socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  def SOL_AX25; end

  # --- SOL_IP -> Integer
  # IP socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  # 
  # SOL_IP はポータブルではありません。 IPPROTO_IP のほうがよりポータブルです。
  # 
  # @see [[man:getsockopt(2)]], [[man:setsockopt(2)]], [[man:ip(7linux)]]
  #      [[m:Socket::Constants::IPPROTO_IP]]
  def SOL_IP; end

  # --- SOL_IPX -> Integer
  # @todo
  # IPX socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  def SOL_IPX; end

  # --- SOL_SOCKET -> Integer
  # Socket level options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  # 
  # @see [[man:getsockopt(2)]], [[man:setsockopt(2)]], 
  #      [[man:sys/socket.h(header)]], [[man:socket(7linux)]]
  #      [[man:getsockopt(2freebsd)]]
  def SOL_SOCKET; end

  # --- SOL_TCP -> Integer
  # TCP socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_TCP]]
  def SOL_TCP; end

  # --- SOL_UDP -> Integer
  # UDP socket options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第一引数(level)に使用します。
  # 
  # @see [[m:Socket::Constants::IPPROTO_UDP]]
  def SOL_UDP; end

  # --- SOMAXCONN -> Integer
  # [[m:Socket#listen]] の backlog の最大長。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:listen(2)]]
  def SOMAXCONN; end

  # --- SOPRI_BACKGROUND -> Integer
  # @todo
  # Background socket priority
  def SOPRI_BACKGROUND; end

  # --- SOPRI_INTERACTIVE -> Integer
  # @todo
  # Interactive socket priority
  def SOPRI_INTERACTIVE; end

  # --- SOPRI_NORMAL -> Integer
  # Normal socket priority
  # @todo
  def SOPRI_NORMAL; end

  # --- SO_ACCEPTCONN -> Integer
  # Socket has had listen() called on it。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_ACCEPTCONN; end

  # --- SO_ACCEPTFILTER -> Integer
  # set accept filter on listening socket。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:getsockopt(2freebsd)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_ACCEPTFILTER; end

  # --- SO_ALLZONES -> Integer
  # @todo
  # Bypass zone boundaries。
  def SO_ALLZONES; end

  # --- SO_ATTACH_FILTER -> Integer
  # Attach socket filter。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[url:http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/networking/filter.txt;hb=HEAD]],
  #      [[m:Socket::Constants::SOL_SOCKET]]
  def SO_ATTACH_FILTER; end

  # --- SO_BINDTODEVICE -> Integer
  # Bind this socket to a particular device。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_BINDTODEVICE; end

  # --- SO_BINTIME -> Integer
  # Timestamp (bintime)。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:getsockopt(2freebsd)]], [[m:Socket::Constants::SOL_SOCKET]]
  #      [[m:Socket::Constants::SO_TIMESTAMP]],
  #      [[m:Socket::AncillaryData#timestamp]]
  def SO_BINTIME; end

  # --- SO_BROADCAST -> Integer
  # Permit sending of broadcast messages。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_BROADCAST; end

  # --- SO_DEBUG -> Integer
  # Debug info recording。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_DEBUG; end

  # --- SO_DETACH_FILTER -> Integer
  # Detach socket filter。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[url:http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/networking/filter.txt;hb=HEAD]],
  #      [[m:Socket::Constants::SOL_SOCKET]]
  def SO_DETACH_FILTER; end

  # --- SO_DONTROUTE -> Integer
  # Send without using the routing tables。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_DONTROUTE; end

  # --- SO_DONTTRUNC -> Integer
  # @todo
  # Retain unread data
  def SO_DONTTRUNC; end

  # --- SO_ERROR -> Integer
  # Get socket error status。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_ERROR; end

  # --- SO_KEEPALIVE -> Integer
  # Keep connections alive。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_KEEPALIVE; end

  # --- SO_LINGER -> Integer
  # Linger on close if data is present。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]],[[m:Socket::Constants::SOL_SOCKET]]
  def SO_LINGER; end

  # --- SO_MAC_EXEMPT -> Integer
  # @todo
  # Mandatory Access Control exemption for unlabeled peers。
  def SO_MAC_EXEMPT; end

  # --- SO_NKE -> Integer
  # @todo
  # socket-level Network Kernel Extension。
  def SO_NKE; end

  # --- SO_NOSIGPIPE -> Integer
  # Don't SIGPIPE on EPIPE。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:getsockopt(2freebsd)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_NOSIGPIPE; end

  # --- SO_NO_CHECK -> Integer
  # @todo
  # Disable checksums。
  def SO_NO_CHECK; end

  # --- SO_NREAD -> Integer
  # @todo
  # Get first packet byte count。
  def SO_NREAD; end

  # --- SO_OOBINLINE -> Integer
  # Leave received out-of-band data in-line。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_OOBINLINE; end

  # --- SO_PASSCRED -> Integer
  # Receive SCM_CREDENTIALS messages。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[man:unix(7linux)]],
  #      [[m:Socket::Constants::SOL_SOCKET]]
  def SO_PASSCRED; end

  # --- SO_PEERCRED -> Integer
  # The credentials of the foreign process connected to this socket。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[man:unix(7linux)]], [[man:socketpair(2linux)]],
  #      [[m:Socket::Constants::SOL_SOCKET]]
  def SO_PEERCRED; end

  # --- SO_PEERNAME -> Integer
  # @todo
  # Name of the connecting user。
  def SO_PEERNAME; end

  # --- SO_PRIORITY -> Integer
  # The protocol-defined priority for all packets on this socket。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:socket(7linux)]], [[man:ip(7linux)]]
  def SO_PRIORITY; end

  # --- SO_RCVBUF -> Integer
  # Receive buffer size。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_RCVBUF; end

  # --- SO_RCVLOWAT -> Integer
  # Receive low-water mark。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_RCVLOWAT; end

  # --- SO_RCVTIMEO -> Integer
  # Receive timeout。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]]
  def SO_RCVTIMEO; end

  # --- SO_RECVUCRED -> Integer
  # @todo
  # Receive user credentials with datagram。
  def SO_RECVUCRED; end

  # --- SO_REUSEADDR -> Integer
  # Allow local address reuse。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[man:bind(2)]],
  #      [[m:Socket::Constants::SOL_SOCKET]]
  def SO_REUSEADDR; end

  # --- SO_REUSEPORT -> Integer
  # Allow local address and port reuse。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:getsockopt(2freebsd)]], [[m:Socket::Constants::SOL_SOCKET]]
  #      
  def SO_REUSEPORT; end

  # --- SO_SECURITY_AUTHENTICATION -> Integer
  # @todo
  def SO_SECURITY_AUTHENTICATION; end

  # --- SO_SECURITY_ENCRYPTION_NETWORK -> Integer
  # @todo
  def SO_SECURITY_ENCRYPTION_NETWORK; end

  # --- SO_SECURITY_ENCRYPTION_TRANSPORT -> Integer
  # @todo
  def SO_SECURITY_ENCRYPTION_TRANSPORT; end

  # --- SO_SNDBUF -> Integer
  # Send buffer size。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_SNDBUF; end

  # --- SO_SNDLOWAT -> Integer
  # Receive low-water mark。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_SNDLOWAT; end

  # --- SO_SNDTIMEO -> Integer
  # Send timeout。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_SNDTIMEO; end

  # --- SO_TIMESTAMP -> Integer
  # Receive timestamp with datagrams (timeval)。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  #      [[m:Socket::AncillaryData#timestamp]]
  def SO_TIMESTAMP; end

  # --- SO_TIMESTAMPNS -> Integer
  # @todo
  # Receive nanosecond timestamp with datagrams (timespec)。
  # 
  # @see [[m:Socket::Constants::SO_TIMESTAMP]],
  #      [[m:Socket::AncillaryData#timestamp]]
  def SO_TIMESTAMPNS; end

  # --- SO_TYPE -> Integer
  # Get the socket type。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:sys/socket.h(header)]], [[man:getsockopt(2freebsd)]],
  #      [[man:socket(7linux)]], [[m:Socket::Constants::SOL_SOCKET]]
  def SO_TYPE; end

  # --- SO_USELOOPBACK -> Integer
  # @todo
  # Bypass hardware when possible。
  def SO_USELOOPBACK; end

  # --- SO_WANTMORE -> Integer
  # @todo
  # Give a hint when more data is ready。
  def SO_WANTMORE; end

  # --- SO_WANTOOBFLAG -> Integer
  # @todo
  # OOB data is wanted in MSG_FLAG on receive。
  def SO_WANTOOBFLAG; end

  # --- TCP_CORK -> Integer
  # Don't send partial frames。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_CORK; end

  # --- TCP_DEFER_ACCEPT -> Integer
  # Don't notify a listening socket until data is ready。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_DEFER_ACCEPT; end

  # --- TCP_INFO -> Integer
  # Retrieve information about this socket。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]], [[man:tcp(7linux)]]
  def TCP_INFO; end

  # --- TCP_KEEPCNT -> Integer
  # Maximum number of keepalive probes allowed before dropping a connection。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_KEEPCNT; end

  # --- TCP_KEEPIDLE -> Integer
  # Idle time before keepalive probes are sent。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_KEEPIDLE; end

  # --- TCP_KEEPINTVL -> Integer
  # Time between keepalive probes。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_KEEPINTVL; end

  # --- TCP_LINGER2 -> Integer
  # Lifetime of orphaned FIN_WAIT2 sockets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_LINGER2; end

  # --- TCP_MAXSEG -> Integer
  # Set maximum segment size。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]], [[man:tcp(7linux)]]
  def TCP_MAXSEG; end

  # --- TCP_MD5SIG -> Integer
  # Use MD5 digests (RFC2385)。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]], [[RFC:2385]]
  def TCP_MD5SIG; end

  # --- TCP_NODELAY -> Integer
  # Don't delay sending to coalesce packets。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]],
  #      [[man:tcp(7linux)]], [[man:netinet/tcp.h(header)]]
  def TCP_NODELAY; end

  # --- TCP_NOOPT -> Integer
  # Don't use TCP options。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]], [[man:tcp(7linux)]]
  def TCP_NOOPT; end

  # --- TCP_NOPUSH -> Integer
  # Don't push the last block of write。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(4freebsd)]], [[man:tcp(7linux)]]
  def TCP_NOPUSH; end

  # --- TCP_QUICKACK -> Integer
  # Enable quickack mode。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_QUICKACK; end

  # --- TCP_SYNCNT -> Integer
  # Number of SYN retransmits before a connection is dropped。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_SYNCNT; end

  # --- TCP_WINDOW_CLAMP -> Integer
  # Clamp the size of the advertised window。
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:tcp(7linux)]]
  def TCP_WINDOW_CLAMP; end

  # --- UDP_CORK -> Integer
  # Don't send partial frames
  # [[m:BasicSocket#getsockopt]], [[m:BasicSocket#setsockopt]]
  # の第2引数(optname)に使用します。
  # 
  # @see [[man:udp(7linux)]]
  def UDP_CORK; end

end
