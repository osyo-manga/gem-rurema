class NoMethodError
  # --- args -> [object]
  # 
  # メソッド呼び出しに使われた引数を配列で返します。
  # 
  # 例:
  # 
  #   begin
  #     foobar(1,2,3)
  #   rescue NoMethodError
  #     p $!
  #     p $!.name
  #     p $!.args
  #   end
  #   
  #   # => #<NoMethodError: undefined method `foobar' for main:Object>
  #        :foobar
  #        [1, 2, 3]
  def args; end

  # --- private_call? -> bool
  # 
  # メソッド呼び出しが private なメソッドを呼び出せる形式
  # (関数形式(レシーバを省略した形式)) で呼ばれたかどうかを返します。
  def private_call?; end

  # --- new(error_message = "", name = nil, args = nil, priv = false) -> NoMethodError
  # --- new(error_message = "", name = nil, args = nil, priv = false, receiver:) -> NoMethodError
  # 
  # 例外オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列です
  # 
  # @param name 未定義だったシンボルです
  # 
  # @param args メソッド呼び出しに使われた引数です
  # 
  # @param priv private なメソッドを呼び出せる形式 (関数形式(レシーバを省略した形式)) で呼ばれたかどうかを指定します
  # @param receiver 原因となったメソッド呼び出しのレシーバです
  # 
  # 例:
  # 
  #   nom = NoMethodError.new("message", "foo", [1,2,3])
  #   p nom.name
  #   p nom.args
  #   
  #   # => "foo"
  #   [1, 2, 3]
  def new; end

end
