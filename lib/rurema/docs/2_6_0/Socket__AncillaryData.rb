class Socket::AncillaryData
  # --- cmsg_is?(level, type) -> bool
  # 自身の level と type が引数のものと一致している場合に真を返します。
  # 
  #   require 'socket'
  # 
  #   ancdata = Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "")
  #   ancdata.cmsg_is?(Socket::IPPROTO_IPV6, Socket::IPV6_PKTINFO) #=> true
  #   ancdata.cmsg_is?(:IPV6, :PKTINFO)       #=> true
  #   ancdata.cmsg_is?(:IP, :PKTINFO)         #=> false
  #   ancdata.cmsg_is?(:SOCKET, :RIGHTS)      #=> false
  # 
  # @param level 一致を確認する cmsg_level (文字列、シンボル、整数)
  # @param type 一致を確認する cmsg_type (文字列、シンボル、整数)
  # @see [[m:Socket::AncillaryData#level]], [[m:Socket::AncillaryData#type]]
  def cmsg_is?; end

  # --- data -> String
  # 自身が保持している cmsg data (データ) を返します。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").type
  #   #=> ""
  # 
  # @see [[m:Socket::AncillaryData.new]]
  def data; end

  # --- family -> Integer
  # 自身が保持している socket family を返します。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").family
  #   #=> 10
  # 
  # @see [[m:Socket::AncillaryData.new]]
  def family; end

  # --- int -> Integer
  # 自身が保持している cmsg data (データ) を整数の形で返します。
  # 
  # 整数データのサイズおよびエンディアンは実行するホストによって異なります。
  # 
  #   require 'socket'
  # 
  #   ancdata = Socket::AncillaryData.int(:UNIX, :SOCKET, :RIGHTS, STDERR.fileno)
  #   p ancdata.int #=> 2
  # 
  # @raise TypeError cmgs data のサイズが int のバイト数と異なる場合に発生します
  # @see [[m:Socket::AncillaryData.new]] [[m:Socket::AncillaryData.int]]
  def int; end

  # --- ip_pktinfo -> [Addrinfo, Integer, Addrinfo]
  # 自身の type が IP_PKTINFO である場合、保持しているデータ
  # (アドレス、インターフェースのインデックス、ローカルアドレス)
  # を3要素の配列で返します。
  # 
  # IP_PKTINFO は非標準的拡張であり、システムによっては使えない場合があります。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("127.0.0.1")
  #   ifindex = 0
  #   spec_dest = Addrinfo.ip("127.0.0.1")
  #   ancdata = Socket::AncillaryData.ip_pktinfo(addr, ifindex, spec_dest)
  #   p ancdata.ip_pktinfo
  #   #=> [#<Addrinfo: 127.0.0.1>, 0, #<Addrinfo: 127.0.0.1>]
  # 
  # @raise TypeError level, type が IPPROTO_IP, IP_PKTINFO でない場合に
  #        発生します。
  # @see [[m:Socket::AncillaryData.ip_pktinfo]],
  #      [[m:Socket::Constants::IP_PKTINFO]]
  def ip_pktinfo; end

  # --- ipv6_pktinfo -> [Addrinfo, Integer]
  # 自身の type が IPV6_PKTINFO である場合、保持しているデータ
  # (アドレス、インターフェースのインデックス)
  # を2要素の配列で返します。
  # 
  # IPV6_PKTINFO については [[RFC:3542]] を参照してください。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("::1")
  #   ifindex = 0
  #   ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
  #   p ancdata.ipv6_pktinfo #=> [#<Addrinfo: ::1>, 0]
  # 
  # @see [[m:Socket::AncillaryData.ipv6_pktinfo]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo_addr]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo_ifindex]],
  #      [[m:Socket::Constants::IPV6_PKTINFO]]
  def ipv6_pktinfo; end

  # --- ipv6_pktinfo_addr -> Addrinfo
  # 自身の type が IPV6_PKTINFO である場合、保持しているデータ
  # (アドレス、インターフェースのインデックス)
  # のアドレスを返します。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("::1")
  #   ifindex = 0
  #   ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
  #   p ancdata.ipv6_pktinfo_addr #=> #<Addrinfo: ::1>
  # 
  # @see [[m:Socket::AncillaryData.ipv6_pktinfo]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo_ifindex]],
  #      [[m:Socket::Constants::IPV6_PKTINFO]]
  def ipv6_pktinfo_addr; end

  # --- ipv6_pktinfo_ifindex -> Integer
  # 自身の type が IPV6_PKTINFO である場合、保持しているデータ
  # (アドレス、インターフェースのインデックス)
  # のインデックスを返します。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("::1")
  #   ifindex = 0
  #   ancdata = Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
  #   p ancdata.ipv6_pktinfo_ifindex #=> 0
  # 
  # @see [[m:Socket::AncillaryData.ipv6_pktinfo]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo]], 
  #      [[m:Socket::AncillaryData#ipv6_pktinfo_addr]],
  #      [[m:Socket::Constants::IPV6_PKTINFO]]
  def ipv6_pktinfo_ifindex; end

  # --- level -> Integer
  # 自身が保持している cmsg level (元プロトコル) を返します。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").level
  #   #=> 41
  # 
  # @see [[m:Socket::AncillaryData.new]]
  def level; end

  # --- timestamp -> Time
  # 
  # タイムスタンプ制御メッセージに含まれる時刻を [[c:Time]] オブジェクト
  # で返します。
  # 
  # "タイムスタンプ制御メッセージ" は以下のいずれかです。
  #   *  SOL_SOCKET/SCM_TIMESTAMP (micro second) GNU/Linux, FreeBSD, NetBSD, OpenBSD, Solaris, MacOS X
  #   *  SOL_SOCKET/SCM_TIMESTAMPNS (nano second) GNU/Linux
  #   *  SOL_SOCKET/SCM_BINTIME (2**(-64) second) FreeBSD
  # 
  #   require 'socket'
  # 
  #   Addrinfo.udp("127.0.0.1", 0).bind {|s1|
  #     Addrinfo.udp("127.0.0.1", 0).bind {|s2|
  #       s1.setsockopt(:SOCKET, :TIMESTAMP, true)
  #       s2.send "a", 0, s1.local_address
  #       ctl = s1.recvmsg.last
  #       p ctl    
  #       #=> #<Socket::AncillaryData: INET SOCKET TIMESTAMP 2009-02-24 17:35:46.775581>
  #       t = ctl.timestamp
  #       p t      #=> 2009-02-24 17:35:46 +0900
  #       p t.usec #=> 775581
  #       p t.nsec #=> 775581000
  #     }
  #   }
  # 
  # @see [[m:Socket::Constants::SCM_TIMESTAMP]],
  #      [[m:Socket::Constants::SCM_TIMESTAMPNS]],
  #      [[m:Socket::Constants::SCM_BINTIME]],
  #      [[m:Socket::Constants::SO_TIMESTAMP]],
  #      [[m:Socket::Constants::SO_TIMESTAMPNS]],
  #      [[m:Socket::Constants::SO_BINTIME]]
  def timestamp; end

  # --- type -> Integer
  # 自身が保持している cmsg type (種類) を返します。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "").type
  #   #=> 2
  # 
  # @see [[m:Socket::AncillaryData.new]]
  def type; end

  # --- unix_rights -> [IO] | nil
  # 
  # Unix domain socket の SCM_RIGHTS 制御メッセージに含まれる
  # ファイルディスクリプタを IO オブジェクトの配列として返します。
  # 
  # 得られる IO オブジェクトか [[c:IO]] か [[c:Socket]] です。
  # 
  # この配列は [[c:Socket::AncillaryData]] が初期化されたときに
  # 作られます。例えば [[m:BasicSocket#recvmsg]] を :scm_rights => true
  #  オプションを付けて呼びだし、
  # SCM_RIGHTS な 制御メッセージを受け取ったときに配列が作られます。
  # 適切なオプションを指定しなかった場合は配列は生成されず、
  # このメソッドは nil を返します。
  # 
  #   require 'socket'
  # 
  #   # recvmsg needs :scm_rights=>true for unix_rights
  #   s1, s2 = UNIXSocket.pair
  #   p s1                                         #=> #<UNIXSocket:fd 3>
  #   s1.sendmsg "stdin and a socket", 0, nil, Socket::AncillaryData.unix_rights(STDIN, s1)
  #   _, _, _, ctl = s2.recvmsg(:scm_rights=>true)
  #   p ctl
  #   #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 6 7>
  #   p ctl.unix_rights                            #=> [#<IO:fd 6>, #<Socket:fd 7>]
  #   p File.identical?(STDIN, ctl.unix_rights[0]) #=> true
  #   p File.identical?(s1, ctl.unix_rights[1])    #=> true
  #   
  #   # If :scm_rights=>true is not given, unix_rights returns nil
  #   s1, s2 = UNIXSocket.pair
  #   s1.sendmsg "stdin and a socket", 0, nil, Socket::AncillaryData.unix_rights(STDIN, s1)
  #   _, _, _, ctl = s2.recvmsg
  #   p ctl #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 6 7>
  #   p ctl.unix_rights #=> nil
  #   
  # 
  # @raise TypeError family/level/type が AF_UNIX/SOL_SOCKET/SCM_RIGHTS でない場合
  #        に発生します。
  # @see [[m:Socket::Constants::SCM_RIGHTS]]
  def unix_rights; end

  # --- int(family, cmsg_level, cmsg_type, integer) -> Socket::AncillaryData
  # 
  # データとして整数を保持する
  # Socket::AncillaryData オブジェクトを生成します。
  # 
  # 整数データのサイズおよびエンディアンは実行するホストによって異なります。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.int(:UNIX, :SOCKET, :RIGHTS, STDERR.fileno)
  #   #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 2>
  # 
  # @param family ソケットファミリー
  # @param cmsg_level プロトコル
  # @param cmsg_type 補助データの種類
  # @param integer データ内容
  # 
  # @see [[m:Socket::AncillaryData.new]]
  def int; end

  # --- ip_pktinfo(addr, ifindex, spec_dst=addr) -> Socket::AncillaryData
  # 
  # type が IP_PKTINFO である AncillaryData を生成します。
  # 
  # IP_PKTINFO は非標準的拡張であり、システムによっては使えない場合があります。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("127.0.0.1")
  #   ifindex = 0
  #   spec_dst = Addrinfo.ip("127.0.0.1")
  #   p Socket::AncillaryData.ip_pktinfo(addr, ifindex, spec_dst)
  #   #=> #<Socket::AncillaryData: INET IP PKTINFO 127.0.0.1 ifindex:0 spec_dst:127.0.0.1>
  # 
  # @param addr アドレス(文字列もしくは [[c:Addrinfo]])
  # @param ifindex インターフェースのインデックス(整数)
  # @param spec_dst パケットのローカルアドレス(文字列もしくは [[c:Addrinfo]])
  # 
  # @see [[m:Socket::AncillaryData#ip_pktinfo]],
  #      [[m:Socket::Constants::IP_PKTINFO]]
  def ip_pktinfo; end

  # --- ipv6_pktinfo(addr, ifindex) -> Socket::AncillaryData
  # 
  # type が IPV6_PKTINFO である AncillaryData を生成します。
  # 
  # IPV6_PKTINFO は [[RFC:3542]] で定義されています。
  # 
  #   require 'socket'
  # 
  #   addr = Addrinfo.ip("::1")
  #   ifindex = 0
  #   p Socket::AncillaryData.ipv6_pktinfo(addr, ifindex)
  #   #=> #<Socket::AncillaryData: INET6 IPV6 PKTINFO ::1 ifindex:0>
  # 
  # @param addr アドレス(文字列もしくは [[c:Addrinfo]])
  # @param ifindex インターフェースのインデックス(整数)
  # 
  # @see [[m:Socket::AncillaryData#ipv6_pktinfo]],
  #      [[m:Socket::Constants::IPV6_PKTINFO]]
  def ipv6_pktinfo; end

  # --- new(family, cmsg_level, cmsg_type, cmsg_data) -> Socket::AncillaryData
  # 
  # 新たな Socket::AncillaryData オブジェクトを生成します。
  # 
  # family はソケットファミリーを指定します。
  # 整数、文字列、シンボルを渡します。
  #  * Socket::AF_INET, "AF_INET", "INET", :AF_INET, :INET
  #  * Socket::AF_UNIX, "AF_UNIX", "UNIX", :AF_UNIX, :UNIX
  #  * など
  # 
  # cmsg_level にはメッセージの元となるプロトコルを指定します。
  # 整数、文字列、シンボルを渡します。
  #  * Socket::SOL_SOCKET, "SOL_SOCKET", "SOCKET", :SOL_SOCKET and :SOCKET
  #  * Socket::IPPROTO_IP, "IP" and :IP
  #  * Socket::IPPROTO_IPV6, "IPV6" and :IPV6
  #  * Socket::IPPROTO_TCP, "TCP" and :TCP
  #  * など
  # 
  # cmsg_type は補助データの種類を指定します。
  # cmsg_level で指定したプロトコルによってこの部分の解釈は異なります。
  # 整数、文字列、シンボルを渡します。
  #  * Socket::SCM_RIGHTS, "SCM_RIGHTS", "RIGHTS", :SCM_RIGHTS, :RIGHTS for SOL_SOCKET
  #  * Socket::IP_RECVTTL, "RECVTTL" and :RECVTTL for IPPROTO_IP
  #  * Socket::IPV6_PKTINFO, "PKTINFO" and :PKTINFO for IPPROTO_IPV6
  #  * など
  # 
  # cmsg_data には補助データの内容となる文字列を渡します
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.new(:INET, :TCP, :NODELAY, "")
  #   #=> #<Socket::AncillaryData: INET TCP NODELAY "">
  #   
  #   p Socket::AncillaryData.new(:INET6, :IPV6, :PKTINFO, "")
  #   #=> #<Socket::AncillaryData: INET6 IPV6 PKTINFO "">
  # 
  # @param family ソケットファミリー
  # @param cmsg_level プロトコル
  # @param cmsg_type 補助データの種類
  # @param cmsg_data データ内容
  def new; end

  # --- unix_rights(*ios) -> Socket::AncillaryData
  # ios で指定したファイルのファイルデスクリプタを
  # データとして持つ family=AF_UNIX, level=SOL_SOCKET, type=SCM_RIGHTS
  # という Socket::AncillaryData オブジェクトを生成して返します。
  # 
  #   require 'socket'
  # 
  #   p Socket::AncillaryData.unix_rights(STDERR)
  #   #=> #<Socket::AncillaryData: UNIX SOCKET RIGHTS 2>
  # 
  # @param ios IO オブジェクトの配列
  # @see [[m:Socket::AncillaryData#unix_rights]],
  #      [[m:Socket::Constants::SCM_RIGHTS]]
  def unix_rights; end

end
