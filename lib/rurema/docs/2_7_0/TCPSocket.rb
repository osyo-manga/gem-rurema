class TCPSocket
  # --- gethostbyname(host) -> Array
  # 
  # ホスト名または IP アドレス (整数または"127.0.0.1"
  # のような文字列)からホストの情報を返します。ホスト情報は、ホ
  # スト名、ホストの別名の配列、ホストのアドレスタイプ、ホストの
  # アドレスを各要素とする配列です。ホストのアドレスは octet
  # decimal の文字列 ("127.0.0.1"のような文字列) や IPv6
  # アドレス ("::1" のような文字列) です。
  # 
  # @param host ホスト名または IP アドレス (整数または"127.0.0.1" のような文字列)を指定します。
  # 
  # @return ホスト名、ホストの別名の配列、ホストのアドレスタイプ、ホストのアドレスを各要素とする配列を返します。
  # 
  # 例:
  # 
  #   require 'socket'
  # 
  #   p TCPSocket.gethostbyname("www.ruby-lang.org")
  #   #=> ["beryllium.ruby-lang.org", [], 2, "210.163.138.100"]
  def gethostbyname; end

  # --- open(host, service, local_host=nil, local_service=nil) -> TCPSocket
  # --- new(host, service, local_host=nil, local_service=nil) -> TCPSocket
  # 
  # host で指定したホストの service で指定したポートと接続したソケッ
  # トを返します。host はホスト名、またはインターネットアドレスを
  # 示す文字列、service は /etc/services (または NIS) に登録されている
  # サービス名かポート番号です。
  # 
  # 引数 local_host, local_service を指定した場合、そのアドレス
  # に対して [[man:bind(2)]] します。
  # 
  # @param host           ホスト名、またはインターネットアドレスを示す文字列を指定します。
  # @param service        /etc/services (または NIS) に登録されているサービス名かポート番号を指定します。
  # @param local_host     ホスト名、またはインターネットアドレスを示す文字列を指定します。
  # @param local_service  /etc/services (または NIS) に登録されているサービス名かポート番号を指定します。
  def new; end

  # --- open(host, serv, local_host=nil, local_service=nil) -> TCPSocket
  # --- new(host, serv, local_host=nil, local_service=nil) -> TCPSocket
  # [[m:TCPSocket.new]] のパラメータ host と local_host 
  # の名前解決に [[lib:resolv]] ライブラリを使います。
  # 
  # @param host           ホスト名、またはインターネットアドレスを示す文字列を指定します。
  # @param service        /etc/services (または NIS) に登録されているサービス名かポート番号を指定します。
  # @param local_host     ホスト名、またはインターネットアドレスを示す文字列を指定します。
  # @param local_service  /etc/services (または NIS) に登録されているサービス名かポート番号を指定します。
  # @raise SocketError 名前解決に失敗した場合に発生します。
  def new; end

end
