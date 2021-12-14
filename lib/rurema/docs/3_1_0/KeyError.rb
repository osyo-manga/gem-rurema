class KeyError
  # --- key -> object
  # 
  # KeyError の原因となったメソッド呼び出しのキーを返します。
  # 
  # @raise ArgumentError キーが設定されていない時に発生します。
  # 
  # 例:
  # 
  #   h = Hash.new
  #   begin
  #     h.fetch('gumby'*20)
  #   rescue KeyError => e
  #     p e.message            # => "key not found: \"gumbygumbygumbygumbygumbygumbygumbygumbygumbygumbygumbygumbyg..."
  #     p 'gumby'*20 == e.key  # => true
  #   end
  def key; end

  # --- receiver -> object
  # 
  # KeyError の原因となったメソッド呼び出しのレシーバを返します。
  # 
  # @raise ArgumentError レシーバが設定されていない時に発生します。
  # 
  # 例:
  # 
  #   h = Hash.new
  #   begin
  #     h.fetch('gumby'*20)
  #   rescue KeyError => e
  #     p e.message             # => "key not found: \"gumbygumbygumbygumbygumbygumbygumbygumbygumbygumbygumbygumbyg..."
  #     p h.equal?(e.receiver)  # => true
  #   end
  def receiver; end

  # --- new(error_message = "")                   -> KeyError
  # --- new(error_message = "", receiver:)        -> KeyError
  # --- new(error_message = "", key:)             -> KeyError
  # --- new(error_message = "", receiver:, key:)  -> KeyError
  # 
  # 例外オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列です
  # 
  # @param receiver 原因となったメソッド呼び出しのレシーバ
  # @param key      原因となったメソッド呼び出しのキー
  # 
  # //emlist[例][ruby]{
  # h = {foo: 1}
  # err = KeyError.new("Message", receiver: h, key: :bar)
  # p err.message  # => "Message"
  # p err.receiver # => {:foo=>1}
  # p err.key      # => :bar
  # //}
  def new; end

end
