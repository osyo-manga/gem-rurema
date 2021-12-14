class Resolv::IPv4
  # --- address -> String
  # 4byte バイト列の IPv4 アドレスを返します。
  def address; end

  # --- to_name -> Resolv::DNS::Name
  # "x.y.z.w.in-addr.arpa." という形のドメイン名を返します。
  def to_name; end

  # --- to_s -> String
  # ドットで区切られた IPv4 アドレス文字列を返します。
  def to_s; end

  # --- create(address) -> Resolv::IPv4
  # 
  # "192.168.0.1" のように "." で区切られた IPv4 表記の文字列 address から
  # Resolv::IPv4 のインスタンスを生成します。
  # 
  # @param address IPv4 表記の文字列
  def create; end

  # --- new(address) -> Resolv::IPv4
  # 
  # 4 byte の文字列 address から Resolv::IPv4 のインスタンスを生成します。
  # 
  # @param address 4 byte のバイナリ列の IPv4 のアドレス
  # @see [[m:Resolv::IPv4.create]] 
  def new; end

  # --- Regex -> Regexp
  # IPv4 のアドレスの正規表現です。
  def Regex; end

end
