class Net::IMAP::UntaggedResponse
  # --- data -> object
  # 
  # レスポンスを解析した結果のオブジェクトを返します。
  # 
  # レスポンスによって異なるオブジェクトを返します。
  # [[c:Net::IMAP::MailboxList]] であったりフラグを表わす
  # シンボルの配列であったりします。
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
  #   * "BYE"
  #   * "PREAUTH"
  #   * "CAPABILITY"
  #   * "LIST"
  #   * "FLAGS"
  #   *  etc
  def name; end

  # --- raw_data -> String
  # 
  # レスポンス文字列を返します。
  # 
  # @see [[m:Net::IMAP::UntaggedResponse#data]]
  def raw_data; end

end
