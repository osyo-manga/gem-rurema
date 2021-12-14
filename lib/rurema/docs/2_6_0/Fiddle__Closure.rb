class Fiddle::Closure
  # --- args -> [Integer]
  # 引数の型を表す配列を返します。
  def args; end

  # --- ctype -> Integer
  # 返り値の型を返します。
  def ctype; end

  # --- to_i -> Integer
  # 
  # C の関数ポインタのアドレスを返します。
  def to_i; end

  # --- new(ret, args, abi=Fiddle::Function::DEFAULT) -> Fiddle::Closure
  # 
  # そのクラスの call メソッドを呼びだすような
  # Fiddle::Closure オブジェクトを返します。
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
