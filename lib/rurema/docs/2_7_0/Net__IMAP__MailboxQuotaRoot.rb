class Net::IMAP::MailboxQuotaRoot
  # --- mailbox -> String
  # 問い合わせしたメールボックスの名前を返します。
  def mailbox; end

  # --- quotaroots -> [String]
  # 問い合わせしたメールボックスの quota root 名を配列で返します。
  # 
  # 空の場合もありえます。
  def quotaroots; end

end
