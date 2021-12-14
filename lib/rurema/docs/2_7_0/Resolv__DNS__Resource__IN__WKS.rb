class Resolv::DNS::Resource::IN::WKS
  # --- address -> Resolv::IPv4
  # IPv4アドレスを返します。
  def address; end

  # --- bitmap -> String
  # そのホストで利用可能なサービスのビットマップを返します。
  # 
  # 例えば [[m:Resolv::DNS::Resource::IN::WKS#protocol]] が 6 (TCP)
  # の場合、26番目のビットはポート25のサービス(SMTP)に対応しています。
  # このビットが立っているならば SMTP は利用可能であり、
  # そうでなければ利用できません。
  def bitmap; end

  # --- protocol -> Integer
  # IPプロトコル番号を返します。
  # 
  # 例えば 6 は TCP に対応します。
  def protocol; end

  # --- new(address, protocol, bitmap) -> Resolv::DNS::Resource::IN::WKS
  # Resolv::DNS::Resource::IN::WKS のインスタンスを生成します。
  # 
  # @param address IPv4アドレス
  # @param protocol IPプロトコル番号
  # @param bitmap ビットマップ
  def new; end

end
