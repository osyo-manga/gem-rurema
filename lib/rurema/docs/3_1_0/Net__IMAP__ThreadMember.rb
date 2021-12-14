class Net::IMAP::ThreadMember
  # --- children -> [Net::IMAP::ThreadMember]
  # スレッドの木構造における自身の下位の部分を返します。
  def children; end

  # --- seqno -> Integer | nil
  # メッセージの sequence number もしくは UID を返します。
  # 
  # root となるメッセージが存在しない場合しない木の場合は
  # nil を返します。
  def seqno; end

end
