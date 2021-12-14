class Net::IMAP::MailboxList
  # --- attr -> [Symbol]
  # メールボックスの属性をシンボルの配列で返します。
  # 
  # これで得られるシンボルは [[m:String#capitalize]] でキャピタライズ
  # されています。
  # 
  # この配列には例えば以下のような値を含んでいます。
  # 詳しくは [[RFC:2060]] 7.2.2 などを参照してください。
  # 以下のもの以外で、IMAP 関連 RFC で拡張された値を含んでいる
  # 場合もあります
  #   * :Noselect
  #   * :Noinferiors
  #   * :Marked
  #   * :Unmarked
  def attr; end

  # --- delim -> String|nil
  # 階層区切り文字列を返します。
  # 
  # まったく階層が存在しない場合は nil を返します。
  def delim; end

  # --- name -> String
  # メールボックスの名前を文字列で返します。
  def name; end

end
