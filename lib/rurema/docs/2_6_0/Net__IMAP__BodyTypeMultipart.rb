class Net::IMAP::BodyTypeMultipart
  # --- disposition -> Net::IMAP::ContentDisposition | nil
  # Content-Dispotition の値を返します。
  # 
  # [[c:Net::IMAP::ContentDisposition]] オブジェクトを返します。
  # 
  # @see [[RFC:1806]], [[RFC:2183]]
  def disposition; end

  # --- extension -> Array | nil
  # メッセージの拡張データを返します。
  def extension; end

  # --- language -> String | [String] | nil
  # [[RFC:1766]] で定義されているボディ言語を表わす
  # 文字列もしくは文字列の配列を返します。
  def language; end

  # --- subtype -> String
  # --- media_subtype -> String
  # MIME のメディアタイプのサブタイプを返します。
  #  
  # media_subtype は obsolete です。
  # 
  # @see [[RFC:2045]], [[m:Net::IMAP::BodyTypeText#media_type]]
  def media_subtype; end

  # --- media_type -> String
  # MIME のメディアタイプを返します。
  # 
  # "MULTIPART" を返します。
  # 
  # @see [[m:Net::IMAP::BodyTypeMultipart#subtype]]
  def media_type; end

  # --- multipart? -> bool
  # マルチパートかどうかを返します。
  # true を返します。
  def multipart?; end

  # --- param -> { String => String }
  # MIME のボディパラメータをハッシュテーブルで返します。
  # 
  # ハッシュテーブルのキーがパラメータ名となります。
  # 
  # @see [[RFC:2045]]
  def param; end

  # --- parts -> [Net::IMAP::BodyTypeBasic | Net::IMAP::BodyTypeText | Net::IMAP::BodyTypeMessage | Net::IMAP::BodyTypeMultipart]
  # 
  # マルチパートの各部分を返します。
  def parts; end

end
