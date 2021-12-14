class FrozenError
  # --- receiver -> object
  # 
  # self が発生した時のレシーバオブジェクトを返します。
  # 
  # @raise ArgumentError レシーバが設定されていない時に発生します。
  # 
  # //emlist[][ruby]{
  # begin
  #   [1, 2, 3].freeze << 4
  # rescue FrozenError => err
  #   p err.receiver  # => [1, 2, 3]
  # end
  # //}
  def receiver; end

  # --- new(error_message = "") -> FrozenError
  # --- new(error_message = "", receiver:) -> FrozenError
  # 
  # 例外オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列です
  # 
  # @param receiver 原因となったメソッド呼び出しのレシーバです
  # 
  # //emlist[][ruby]{
  # err = FrozenError.new("message")
  # p err       # => #<FrozenError: message>
  # //}
  def new; end

end
