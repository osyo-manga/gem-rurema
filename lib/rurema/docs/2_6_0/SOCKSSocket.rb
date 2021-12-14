class SOCKSSocket
  # --- close -> nil
  # 
  # ソケットを閉じます。
  def close; end

  # --- open(host, service) -> SOCKSSocket
  # --- new(host, service) -> SOCKSSocket
  # 
  # host で指定したホストの service で指定したポートと接続したソケッ
  # トを返します。host はホスト名、またはインターネットアドレスを
  # 示す文字列、service は /etc/services (または NIS) に登録されている
  # サービス名かポート番号です。
  # 
  # @param host  ホスト名、またはインターネットアドレスを示す文字列を指定します。
  # @param service /etc/services (または NIS) に登録されているサービス名かポート番号です。
  def new; end

  # --- new(host, serv) -> SOCKSSocket
  # [[m:SOCKSSocket.new]]のパラメータ host の名前解決に [[lib:resolv]] 
  # ライブラリを使います。
  # 
  # @param host ホスト名を文字列で指定します。
  # @param serv ホスト名を文字列で指定します。
  # @raise SocketError 名前解決に失敗した場合に発生します。
  def new; end

end
