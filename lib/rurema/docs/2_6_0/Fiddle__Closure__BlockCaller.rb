class Fiddle::Closure::BlockCaller
  # --- call(*args) -> object
  # 
  # wrap しているブロックを呼び出します。
  # 
  # そのブロックの返り値がこのメソッドの返り値となります。
  # 
  # @param args 引数
  def call; end

  # --- new(ret, args, abi=Fiddle::Function::DEFAULT){ ... } -> Fiddle::Closure::BlockCaller
  # 
  # Ruby のブロックを呼び出す Fiddle::Closure オブジェクトを返します。
  # 
  # 
  # args、ret で関数の引数と返り値の型を指定します。
  # 指定は [[m:Fiddle::Function.new]] と同様なので、そちら
  # を参照してください。
  # 
  # @param ret 返り値の型
  # @param args 引数の型を表す配列
  # @param abi 呼出規約
  def new; end

end
