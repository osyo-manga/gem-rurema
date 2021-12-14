class ACL
  # --- allow_addr?(addr) -> bool
  # addr が ACL で許可されているならば真を返します。
  # 
  # @param addr 判定対象のアドレス
  def allow_addr?; end

  # --- allow_socket?(soc) -> bool
  # ソケットに関連付けられたアドレスが ACL で許可されているならば
  # 真を返します。
  # 
  # @param soc 判定対象のソケット
  def allow_socket?; end

  # --- install_list(list) -> ()
  # ACL に list で指定したエントリーを追加します。
  # 
  #   require "drb/acl"
  #   acl = ACL.new
  #   acl.install_list(["deny", "192.168.1.45"])
  # 
  # @param list 追加するエントリー
  def install_list; end

  # --- new(list=nil, order = DENY_ALLOW) -> ACL
  # 新たな ACL オブジェクトを返します。
  # 
  # list で許可/拒否するアドレスのリストを指定し、
  # order でデフォルトの挙動を指定します。
  # 
  # order に [[c:ACL::DENY_ALLOW]] を指定するとデフォルトで
  # すべてのアドレスを拒否します。[[c:ACL::ALLOW_DENY]] を指定すると
  # デフォルトですべてのアドレスを許可します。
  # 
  #   require "drb/acl"
  # 
  #   list = %w[
  #     deny all
  #     allow 192.168.1.1
  #     allow ::ffff:192.168.1.2
  #     allow 192.168.1.3
  #   ]
  #   
  #   acl = ACL.new(list, ACL::DENY_ALLOW)
  # 
  # @param list ACLに追加するエントリー
  # @param order デフォルトで全アドレスを許可/拒否するかを指定します
  def new; end

  # --- ALLOW_DENY -> Integer
  # デフォルトですべてのアドレスを許可することを意味します。
  # @see [[m:ACL.new]]
  def ALLOW_DENY; end

  # --- DENY_ALLOW -> Integer
  # デフォルトですべてのアドレスを拒否することを意味します。
  # 
  # @see [[m:ACL.new]]
  def DENY_ALLOW; end

  # --- VERSION -> [String]
  # ACL のバージョン。
  def VERSION; end

end
