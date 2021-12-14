class Benchmark::Job
  # --- item(label = ""){ ... } -> self
  # --- report(label = ""){ ... } -> self
  # 
  # 与えられたラベルとブロックをジョブリストに登録します。
  # 
  # @param label ラベル
  def item; end

  # --- list -> [String, Proc]
  # 
  # 登録されているジョブのリストを返します。
  # 
  # それぞれの要素は、ラベルとブロックからなる二要素の配列です。
  def list; end

  # --- width -> Integer
  # 
  # [[m:Benchmark::Job#list]] のサイズ。
  def width; end

  # --- new(width) -> Benchmark::Job
  # 
  # [[c:Benchmark::Job]] のインスタンスを初期化して返します。
  # 
  # 通常このメソッドがユーザーによって直接呼び出されることはありません。
  # 
  # @param width [[m:Benchmark::Job#list]] のサイズ。
  def new; end

end
