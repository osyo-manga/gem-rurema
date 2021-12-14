class FrozenError
  # --- new(error_message = "") -> FrozenError
  # 
  # 例外オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列です
  # 
  # 
  # //emlist[][ruby]{
  # err = FrozenError.new("message")
  # p err       # => #<FrozenError: message>
  # //}
  def new; end

end
