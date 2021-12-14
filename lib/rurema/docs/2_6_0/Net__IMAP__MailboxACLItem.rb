class Net::IMAP::MailboxACLItem
  # --- rights -> String
  # アクセス権限を文字列で返します。
  # 
  # [[m:Net::IMAP::MailboxACLItem#user]] で得られるユーザが
  # 持っている権限が返されます。
  # 
  # この文字列の意味については [[RFC:2086]] を参照してください。
  def rights; end

  # --- user -> String
  # ユーザ名を返します。
  # 
  # このユーザは
  # [[m:Net::IMAP#getacl]] で指定したメールボックスに
  # 対し何らかの権限を持っています。
  def user; end

end
