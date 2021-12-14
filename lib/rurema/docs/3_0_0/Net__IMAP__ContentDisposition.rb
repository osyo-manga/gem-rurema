class Net::IMAP::ContentDisposition
  # --- dsp_type -> String
  # Content-Disposition フィールドのタイプを文字列で返します。
  # 
  # "INLINE", "ATTACHMENT" などの文字列を返します。
  # 
  # 詳しくは [[RFC:2183]] などを見てください。
  def dsp_type; end

  # --- param -> { String => String } | nil
  # Content-Disposition フィールドのパラメータをハッシュテーブルで
  # 返します。
  # 
  # ハッシュテーブルのキーは以下のような値を取ります。詳しくは
  # [[RFC:2183]] などを見てください。
  #   * "FILENAME"
  #   * "CREATION-DATE"
  #   * "MODIFICATION-DATE"
  #   * "READ-DAT"
  #   * "SIZE"
  def param; end

end
