class Net::IMAP::ResponseError
  # --- response -> Net::IMAP::TaggedResponse | Net::IMAP::UntaggedResponse
  # エラーとなったレスポンスを表すオブジェクトを返します。
  def response; end

  # --- response=(resp)
  # エラーとなったレスポンスを表すオブジェクトを設定します。
  # 
  # @param resp 設定するレスポンスオブジェクト
  def response=; end

end
