class Net::IMAP::ResponseCode
  # --- data -> object | nil
  # レスポンスコードのデータを返します。
  # 
  # レスポンスコードの種類によって返すオブジェクトは異なります。
  # ない場合は nil を返します。
  def data; end

  # --- name -> String
  # レスポンスコードを表す文字列を返します。
  #  
  # "ALERT"、"PERMANENTFLAGS"、"UIDVALIDITY" などを返します。
  def name; end

end
