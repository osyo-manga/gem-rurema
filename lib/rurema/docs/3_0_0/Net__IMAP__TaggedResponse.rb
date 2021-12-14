class Net::IMAP::TaggedResponse
  # --- data -> Net::IMAP::ResponseText 
  # 
  # レスポンスを解析したオブジェクトを返します。
  # 
  # @see [[c:Net::IMAP::ResponseText]]
  def data; end

  # --- name -> String
  # 
  # レスポンスの名前(種類)を返します。
  # 
  # 例えば以下のような値を返します。これらの具体的な意味は
  # [[RFC:2060]] を参考にしてください。
  #   * "OK"
  #   * "NO"
  #   * "BAD"
  def name; end

  # --- raw_data -> String
  # 
  # レスポンス文字列を返します。
  # 
  # @see [[m:Net::IMAP::TaggedResponse#data]]
  def raw_data; end

  # --- tag -> String
  # 
  # レスポンスに対応付けられたタグを返します。
  def tag; end

end
