class Resolv::Hosts
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
  # ルックアップは /etc/hosts, DNS の順で行います。
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

  # --- new(hosts = DefaultFileName) -> Resolv::Hosts
  # hosts というファイル名のファイルを情報源とする
  # リゾルバを生成し、返します。
  # 
  # @param hosts ホスト情報が書かれたファイルの名前を文字列で与えます。
  def new; end

  # --- DefaultFileName -> String
  # 
  # システム標準の、
  # ホスト情報が書かれたファイルの名前です。
  def DefaultFileName; end

end
