class Socket::Ifaddr
  # --- addr -> Addrinfo | nil
  # 
  # self のアドレスを [[c:Addrinfo]] オブジェクトで返します。
  # self が利用できない場合は nil を返します。
  def addr; end

  # --- broadaddr -> Addrinfo | nil
  # 
  # self のブロードキャストアドレスを [[c:Addrinfo]] オブジェクトで返します。
  # self.flags で [[m:Socket::IFF_BROADCAST]] が有効ではない場合は nil を返します。
  def broadaddr; end

  # --- dstaddr -> Addrinfo | nil
  # 
  # self の宛先アドレスを [[c:Addrinfo]] オブジェクトで返します。
  # self.flags で [[m:Socket::IFF_POINTOPOINT]] が有効ではない場合は nil を返します。
  def dstaddr; end

  # --- flags -> Integer
  # 
  # self に指定された flags の値を返します。
  def flags; end

  # --- ifindex -> Integer
  # 
  # self のインターフェイスのインデックスを返します。
  def ifindex; end

  # --- inspect -> String
  # 
  # self の情報を人間に読みやすい文字列にして返します。
  def inspect; end

  # --- name -> String
  # 
  # self のインターフェイス名を返します。
  def name; end

  # --- netmask -> Addrinfo | nil
  # 
  # self のネットマスクを [[c:Addrinfo]] オブジェクトで返します。
  # self が利用できない場合は nil を返します。
  def netmask; end

  # --- vhid -> Integer | nil
  # 
  # self のバーチャルホストIDを返します。
  # バーチャルホストIDがない場合は nil を返します。
  # 
  # サポートされていない環境ではメソッド自体が定義されていません。
  def vhid; end

end
