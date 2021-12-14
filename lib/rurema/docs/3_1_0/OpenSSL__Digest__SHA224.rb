class OpenSSL::Digest::SHA224
  # --- digest(data) -> String
  # data のダイジェストを SHA224 で計算します。
  # 
  # @param data ダイジェストを計算する文字列
  def digest; end

  # --- hexdigest(data) -> String
  # data のダイジェストを SHA224 で計算し、16進文字列で返します。
  # 
  # @param data ダイジェストを計算する文字列
  def hexdigest; end

  # --- new(data=nil) -> OpenSSL::Digest::SHA224
  # 新しいダイジェストオブジェクトを生成します。
  # 
  # data に文字列を渡すとその内容で内部状態を更新します。
  # 
  # @param data 入力文字列
  def new; end

end
