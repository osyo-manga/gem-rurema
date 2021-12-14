class IRB::Frame
  # --- bottom(n = 0) -> Binding
  # 
  # 下から n 番目のコンテキストを取り出します。
  # 
  # @param n 取り出すコンテキストを [[c:Integer]] で指定します。n は 0 が最
  #          下位になります。
  def bottom; end

  # --- top(n = 0) -> Binding
  # 
  # 上から n 番目のコンテキストを取り出します。
  # 
  # @param n 取り出すコンテキストを [[c:Integer]] で指定します。n は 0 が最
  #          上位になります。
  def top; end

  # --- trace_func(event, file, line, id, binding) -> Binding
  # 
  # ライブラリ内部で使用します。
  def trace_func; end

  # --- bottom(n = 0) -> Binding
  # 
  # 下から n 番目のコンテキストを取り出します。
  # 
  # @param n 取り出すコンテキストを [[c:Integer]] で指定します。n は 0 が最
  #          下位になります。
  def bottom; end

  # --- sender -> object
  # 
  # センダになっているオブジェクトを取り出します。
  # センダとは、そのメソッドを呼び出した側の self のことです。
  def sender; end

  # --- top(n = 0) -> Binding
  # 
  # 上から n 番目のコンテキストを取り出します。
  # 
  # @param n 取り出すコンテキストを [[c:Integer]] で指定します。n は 0 が最
  #          上位になります。
  def top; end

end
