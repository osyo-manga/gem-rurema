class Resolv
  # --- each_address(name) {|name| ...} -> ()
  # ホスト名 name の IP アドレスをルックアップし、
  # 各ルックアップ結果のアドレスに対してブロックを評価します。
  # 
  # @param name ホスト名を文字列で与えます。
  def each_address; end

  # --- each_name(address) {|name| ...} -> ()
  # IP アドレス address のホスト名をルックアップし、
  # 各ルックアップ結果のホスト名に対してブロックを評価します。
  # 
  # @param address IPアドレスを文字列で与えます。
  def each_name; end

  # --- getaddress(name) -> String
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果の最初のアドレスを返します。
  # 
  # @param name ホスト名を文字列で与えます。
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getaddress; end

  # --- getaddresses(name) -> [String]
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果のアドレスリストを返します。
  # 
  # ルックアップに失敗した場合は空の配列が返されます。
  # 
  # @param name ホスト名を文字列で与えます。
  def getaddresses; end

  # --- getname(address) -> String
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果の最初のホスト名を文字列で返します。
  # 
  # @param address IPアドレスを文字列で与えます。
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getname; end

  # --- getnames(address) -> [String]
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果のホスト名リストを返します。
  # 
  # @param address IPアドレスを文字列で与えます。
  def getnames; end

  # --- each_address(name) {|address| ...} -> ()
  # ホスト名 name の IP アドレスをルックアップし、
  # 各ルックアップ結果のアドレスに対してブロックを評価します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # 
  # @param name ホスト名を文字列で与えます。
  def each_address; end

  # --- each_name(address) {|name| ...} -> ()
  # IP アドレス address のホスト名をルックアップし、
  # 各ルックアップ結果のホスト名に対してブロックを評価します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # 
  # @param address IPアドレスを文字列で与えます。
  def each_name; end

  # --- getaddress(name) -> String
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果の最初のアドレスを返します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # 
  # //emlist[][ruby]{
  # require "resolv"
  # Resolv.getaddress("localhost") #=> "127.0.0.1"
  # Resolv.getaddress("www.ruby-lang.org") #=> "221.186.184.68"
  # //}
  # 
  # @param name ホスト名を文字列で与えます。
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getaddress; end

  # --- getaddresses(name) -> [String]
  # ホスト名 name の IP アドレスをルックアップし、
  # ルックアップ結果のアドレスリストを返します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # ルックアップに失敗した場合は空の配列が返されます。
  # 
  # @param name ホスト名を文字列で与えます。
  def getaddresses; end

  # --- getname(address) -> String
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果の最初のホスト名を文字列で返します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # 
  # //emlist[][ruby]{
  # require "resolv"
  # Resolv.getname("221.186.184.68") #=> "carbon.ruby-lang.org"
  # //}
  # 
  # @param address IPアドレスを文字列で与えます。
  # @raise Resolv::ResolvError ルックアップに失敗したときに発生します。
  def getname; end

  # --- getnames(address) -> [String]
  # IP アドレス address のホスト名をルックアップし、
  # ルックアップ結果のホスト名リストを返します。
  # 
  # ルックアップは /etc/hosts, DNS の順で行います。
  # 
  # @param address IPアドレスを文字列で与えます。
  def getnames; end

  # --- new(resolvers = [Hosts.new, DNS.new]) -> Resolv
  # resolvers に与えたリゾルバの配列を先頭から順に
  # 名前解決を試すような、新しいリゾルバオブジェクトを返します。
  # 
  # resolvers の各要素は each_address と each_name という
  # メソッドを持っていなければなりません。
  # 
  # @param resolvers リゾルバの配列
  def new; end

  # --- AddressRegex -> Regexp
  # IPアドレスにマッチする正規表現です。
  def AddressRegex; end

  # --- DefaultResolver -> Resolv
  # [[c:Resolv]] の各クラスメソッドを呼びだしたときに
  # 利用されるリゾルバです。
  def DefaultResolver; end

end
