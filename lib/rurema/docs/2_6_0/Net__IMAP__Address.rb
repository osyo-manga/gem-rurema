class Net::IMAP::Address
  # --- host -> String | nil
  # メールアドレスのホスト名を返します。
  # 
  # nil は [[RFC:822]] のグループ文法に対応します。
  # これについては [[m:Net::IMAP::Address#mailbox]] も参照してください。
  # そうでない場合は [[RFC:822]] のドメイン名を表します。
  # 
  # 通常は、メールアドレスの「@」の後ろのドメイン名を返します。
  def host; end

  # --- mailbox -> String | nil
  # メールアドレスのメールボックス名を返します。
  # 
  # これが nil ならばそれは [[RFC:822]] group の終わりを意味します。
  # これが nil でなく、[[m:Net::IMAP::Address#mailbox]] が nil ならば、
  # [[RFC:822]] のグループ名を表します。
  # どれでもなければ、[[RFC:822]] の local-part を表します。
  # 
  # 通常は、メールアドレスの「@」の手前を返します。
  def mailbox; end

  # --- name -> String | nil
  # メールアドレスの [[RFC:822]] の個人名(personal name)を返します。
  # 
  # 個人名が存在しない場合は nil を返します。
  # 
  # 通常は nil を返します。
  def name; end

  # --- route -> String | nil
  # メールアドレスの SMTP at-domain-list を返します。
  # 
  # 存在しない場合は nil を返します。
  # 
  # 通常は nil を返します。
  def route; end

end
