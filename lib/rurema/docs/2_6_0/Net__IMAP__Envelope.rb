class Net::IMAP::Envelope
  # --- bcc -> [Net::IMAP::Address] | nil
  # Bcc を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def bcc; end

  # --- cc -> [Net::IMAP::Address] | nil
  # Cc を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def cc; end

  # --- date -> String | nil
  # 日付の文字列を返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def date; end

  # --- from -> [Net::IMAP::Address] | nil
  # From を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def from; end

  # --- in_reply_to -> String | nil
  # In-reply-to の内容を文字列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def in_reply_to; end

  # --- message_id -> String | nil
  # message_id を文字列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def message_id; end

  # --- reply_to -> [Net::IMAP::Address] | nil
  # Reply-To を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def reply_to; end

  # --- sender -> [Net::IMAP::Address] | nil
  # Sender を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def sender; end

  # --- subject -> String | nil
  # メッセージのサブジェクトを返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def subject; end

  # --- to -> [Net::IMAP::Address] | nil
  # To を [[c:Net::IMAP::Address]] オブジェクトの配列で返します。
  # 
  # エンベロープに存在しないときは nil を返します。
  def to; end

end
