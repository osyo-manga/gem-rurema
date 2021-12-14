class IRB::OutputMethod
  # --- pp(*objs) -> object
  # 
  # 各 obj を inspect した文字列を self に出力し、最後に改行を出力します。
  # 
  # @param objs 任意のオブジェクトを指定します。
  def pp; end

  # --- ppx(prefix, *objs) -> object
  # 
  # 引数 prefix + 各 obj を inspect した文字列を self に出力し、最後に改行
  # を出力します。
  # 
  # @param prefix 各 obj の先頭に追記する文字列を指定します。
  # 
  # @param objs 任意のオブジェクトを指定します。
  def ppx; end

  # --- print(*objs)
  # 
  # [[c:NotImplementedError]] が発生します。
  # 
  # @param objs 任意のオブジェクトを指定します。
  # 
  # @raise NotImplementedError 必ず発生します。
  def print; end

  # --- printn(*objs) -> nil
  # 
  # 各 obj を self に出力し、最後に改行を出力します。
  # 
  # @param objs 任意のオブジェクトを指定します。
  def printn; end

  # --- puts(*objs) -> object
  # 
  # 各 obj を self に出力し、それぞれの後に改行を出力します。
  # 
  # @param objs 任意のオブジェクトを指定します。
  def puts; end

end
