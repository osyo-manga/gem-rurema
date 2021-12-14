class Net::IMAP::ResponseText
  # --- code -> Net::IMAP::ResponseCode | nil
  # レスポンスコードを返します。
  # 
  # 応答がレスポンスコードを含んでいない場合は nil を返します。
  # 
  # @see [[c:Net::IMAP::ResponseCode]]
  def code; end

  # --- text -> String
  # 応答のテキストを文字列で返します。
  def text; end

end
