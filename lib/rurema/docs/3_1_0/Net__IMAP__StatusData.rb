class Net::IMAP::StatusData
  # --- attr -> { String => Integer }
  # STATUS 応答の内容をハッシュで返します。
  # 
  # ハッシュのキーは
  # "MESSAGES", "RECENT", "UIDNEXT", "UIDVALIDITY", "UNSEEN"
  # などが使われます。
  # 
  # 詳しくは [[RFC:2060]] の 6.3.10、7.2.4 を見てください。
  def attr; end

  # --- mailbox -> String
  # メールボックス名を返します。
  def mailbox; end

end
