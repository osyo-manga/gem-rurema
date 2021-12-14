class Socket::UDPSource
  # --- local_address -> Addrinfo
  # ローカル側のアドレス情報を [[c:Addrinfo]] オブジェクトで返します。
  def local_address; end

  # --- remote_address -> Addrinfo
  # リモート側のアドレス情報を [[c:Addrinfo]] オブジェクトで返します。
  def remote_address; end

  # --- reply(msg) -> ()
  # msg をリモート側の端点へ送ります。
  # 
  # @param msg 送るメッセージ文字列
  def reply; end

  # --- new(remote_addr, local_addr) {|msg| ... } -> Socket::UDPSource
  # 
  # Socket::UDPSource オブジェクトを生成します。
  # 
  # このメソッドはユーザは直接使いません。[[m:Socket.udp_server_loop]] が
  # 内部で用います。
  # 
  # @param remote_addr リモートのアドレス([[c:Addrinfo]] オブジェクト)
  # @param local_addr ローカルのアドレス([[c:Addrinfo]] オブジェクト)
  def new; end

end
