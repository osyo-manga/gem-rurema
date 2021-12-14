class Net::IMAP::MailboxQuota
  # --- mailbox -> String
  # quota が設定されているメールボックスの名前を返します。
  def mailbox; end

  # --- quota -> Integer
  # メールボックスに指定されている上限値を返します。
  def quota; end

  # --- usage -> Integer
  # 現在のメールボックス内の使用量を返します。
  def usage; end

end
