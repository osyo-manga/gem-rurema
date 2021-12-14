class Resolv::DNS
  # --- close -> ()
  # 
  # DNSリゾルバを閉じます。
  def close; end

  # --- each_address(name) {|name| ...} -> ()
  # ホスト名 name の IP アドレスをルックアップし、
  # 各ルックアップ結果のアドレスに対してブロックを評価します。
  # 
  # @param name ホスト名を文字列もしくは[[c:Resolv::DNS::Name]]のインスタンスで与えます。
  def each_address; end

  # --- each_name(address) {|name| ...} -> ()
  # IP アドレス address のホスト名をルックアップし、
  # 各ルックアップ結果のホスト名に対してブロックを評価します。
  # 
  # @param address IPアドレスを文字列、 Resolv::IPv4 のインスタンス、
  #                Resolv::IPv6 のインスタンス、のいずれか与えます。
  def each_name; end

  # --- each_resource(name, typeclass) {|resource| ...} -> ()
  # 
  # nameに対応するDNSリソースレコードを取得します。
  # 見つかったリソースをひとつずつブロックに渡します。
  # 
  # typeclass は以下のいずれかです。
  #   * [[c:Resolv::DNS::Resource::IN::ANY]]
  #   * [[c:Resolv::DNS::Resource::IN::NS]]
  #   * [[c:Resolv::DNS::Resource::IN::CNAME]]
  #   * [[c:Resolv::DNS::Resource::IN::SOA]]
  #   * [[c:Resolv::DNS::Resource::IN::HINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MX]]
  #   * [[c:Resolv::DNS::Resource::IN::TXT]]
  #   * [[c:Resolv::DNS::Resource::IN::A]]
  #   * [[c:Resolv::DNS::Resource::IN::WKS]]
  #   * [[c:Resolv::DNS::Resource::IN::PTR]]
  #   * [[c:Resolv::DNS::Resource::IN::AAAA]]
  #   * [[c:Resolv::DNS::Resource::IN::SRV]]
  # 
  # ルックアップ結果は Resolv::DNS::Resource （のサブクラス）のインスタンスとなります。
  # typeclass に Resolv::DNS::Resource::IN::ANY 以外を指定した場合には
  # そのクラスのインスタンスを返します。
  # 
  # @param name ルックアップ対象となる名前を [[c:Resolv::DNS::Name]] または String で指定します。
  # @param typeclass レコード種別を指定します。
  def each_resource; end

  # --- getaddress(name) -> Resolv::IPv4 | Resolv::IPv6
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果の最初のアドレスを返します。
  # 
  # @param name ホスト名を文字列もしくは[[c:Resolv::DNS::Name]]のインスタンスで与えます。
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getaddress; end

  # --- getaddresses(name) -> [Resolv::IPv4 | Resolv::IPv6]
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果のアドレスリストを返します。
  # 
  # ルックアップに失敗した場合は空の配列が返されます。
  # 
  # @param name ホスト名を文字列もしくは[[c:Resolv::DNS::Name]]のインスタンスで与えます。
  def getaddresses; end

  # --- getname(address) -> Resolv::DNS::Name
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果の最初のホスト名を返します。
  # 
  # @param address IPアドレスを文字列、 Resolv::IPv4 のインスタンス、
  #                Resolv::IPv6 のインスタンス、のいずれか与えます。
  #                
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getname; end

  # --- getnames(address) -> [Resolv::DNS::Name]
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果のホスト名リストを返します。
  # 
  # @param address IPアドレスを文字列、 Resolv::IPv4 のインスタンス、
  #                Resolv::IPv6 のインスタンス、のいずれか与えます。
  def getnames; end

  # --- getresource(name, typeclass) -> Resolv::DNS::Resource
  # nameに対応するDNSリソースレコードを取得します。
  # 最初に見つかったリソースを返します。
  # 
  # typeclass は以下のいずれかです。
  #   * [[c:Resolv::DNS::Resource::IN::ANY]]
  #   * [[c:Resolv::DNS::Resource::IN::NS]]
  #   * [[c:Resolv::DNS::Resource::IN::CNAME]]
  #   * [[c:Resolv::DNS::Resource::IN::SOA]]
  #   * [[c:Resolv::DNS::Resource::IN::HINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MX]]
  #   * [[c:Resolv::DNS::Resource::IN::TXT]]
  #   * [[c:Resolv::DNS::Resource::IN::A]]
  #   * [[c:Resolv::DNS::Resource::IN::WKS]]
  #   * [[c:Resolv::DNS::Resource::IN::PTR]]
  #   * [[c:Resolv::DNS::Resource::IN::AAAA]]
  #   * [[c:Resolv::DNS::Resource::IN::SRV]]
  # 
  # ルックアップ結果は Resolv::DNS::Resource （のサブクラス）のインスタンスとなります。
  # typeclass に Resolv::DNS::Resource::IN::ANY 以外を指定した場合には
  # そのクラスのインスタンスを返します。
  # 
  # @param name ルックアップ対象となる名前を [[c:Resolv::DNS::Name]] または String で指定します。
  # @param typeclass レコード種別を指定します。
  # @raise Resolv::ResolvError ルックアップに失敗した場合に発生します。
  def getresource; end

  # --- getresources(name, typeclass) -> [Resolv::DNS::Resource]
  # nameに対応するDNSリソースレコードを取得します。
  # 見つかったリソース全てを配列にして返します。
  # 
  # typeclass は以下のいずれかです。
  #   * [[c:Resolv::DNS::Resource::IN::ANY]]
  #   * [[c:Resolv::DNS::Resource::IN::NS]]
  #   * [[c:Resolv::DNS::Resource::IN::CNAME]]
  #   * [[c:Resolv::DNS::Resource::IN::SOA]]
  #   * [[c:Resolv::DNS::Resource::IN::HINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MINFO]]
  #   * [[c:Resolv::DNS::Resource::IN::MX]]
  #   * [[c:Resolv::DNS::Resource::IN::TXT]]
  #   * [[c:Resolv::DNS::Resource::IN::A]]
  #   * [[c:Resolv::DNS::Resource::IN::WKS]]
  #   * [[c:Resolv::DNS::Resource::IN::PTR]]
  #   * [[c:Resolv::DNS::Resource::IN::AAAA]]
  #   * [[c:Resolv::DNS::Resource::IN::SRV]]
  # 
  # ルックアップ結果は Resolv::DNS::Resource （のサブクラス）のインスタンスとなります。
  # typeclass に Resolv::DNS::Resource::IN::ANY 以外を指定した場合には
  # そのクラスのインスタンスを返します。
  # 
  # @param name ルックアップ対象となる名前を [[c:Resolv::DNS::Name]] または String で指定します。
  # @param typeclass レコード種別を指定します。
  def getresources; end

  # --- timeouts=(values)
  # 
  # DNSリゾルバのタイムアウト時間を設定します。
  # 
  # //emlist[][ruby]{
  # dns.timeouts = 3
  # //}
  # 
  # @param values タイムアウト時間(秒)を数値か数値の配列で指定します。配列
  #               を指定した場合は応答を受信するまでの再試行時のタイムアウト
  #               時間も含めて順に設定します。nil を指定した場合はデフォル
  #               ト値
  #               ([ 5, second = 5 * 2 / nameserver_count, 2 * second, 4 * second ])
  #               を使用します。
  def timeouts=; end

  # --- new(resolv_conf = nil) -> Resolv::DNS
  # 
  # 新しい DNS リゾルバを生成します。
  # 
  # resolv_conf が nil の場合は
  # /etc/resolv.conf もしくはプラットフォーム固有の
  # DNS設定を利用します。
  # resolv_conf が文字列の場合は /etc/resolv.conf と
  # 同じフォーマットのファイルを設定に利用します。
  # resolv_conf がハッシュの場合は、:nameserver, :search, :ndots
  # というキーが利用可能です。
  # それぞれの意味は [[man:resolv.conf(5)]] を参照してください。
  # また、:nameserver_portでアドレスとポートを指定できます。
  # 
  # //emlist[][ruby]{
  # require "resolv"
  # Resolv::DNS.new(:nameserver => ['210.251.121.21'],
  #                 :search => ['ruby-lang.org'],
  #                 :ndots => 1)
  # 
  # Resolv::DNS.new(:nameserver_port => [['8.8.8.8', 53], ['8.8.4.4', 53]],
  #                 :search => ['ruby-lang.org'],
  #                 :ndots => 1)
  # //}
  # 
  # @param resolv_conf DNSの設定を与えます。
  def new; end

  # --- open(*args) -> Resolv::DNS
  # --- open(*args){|dns| ...} -> object
  # 
  # 新しい DNS リゾルバを生成します。
  # ブロックを与えた場合は生成したリゾルバでブロックを呼びだし、
  # ブロック終了時にリゾルバを閉じます。
  # 
  # ブロックを与えなかった場合は [[m:Resolv::DNS.new]] と
  # 同じです。
  # 
  # @param args DNSの設定を与えます。意味は [[m:Resolv::DNS.new]] 
  #             の引数と同じです。
  # @return ブロックを与えた場合はブロックの返す値を返し、
  #         与えなかった場合は生成したリゾルバを返します。
  def open; end

  # --- Port -> Integer
  # 
  # デフォルトの DNS ポート番号です。
  def Port; end

  # --- UDPSize -> Integer
  # 
  # デフォルトの UDP パケットサイズです。
  def UDPSize; end

end
