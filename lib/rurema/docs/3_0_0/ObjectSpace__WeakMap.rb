class ObjectSpace::WeakMap
  # --- [](key) -> object | nil
  # 
  # 引数 key で指定されたオブジェクトが参照するオブジェクトを返します。
  # 
  # 参照先のオブジェクトが存在しない場合、GC されている場合、対象外のオブジェ
  # クトを参照している場合に nil を返します。
  # 
  # @param key 参照元のオブジェクトを指定します。
  def []; end

  # --- []=(key, value)
  # 
  # 引数 key から引数 value への参照を作成します。
  # 
  # @param key 参照元のオブジェクトを指定します。
  # 
  # @param value 参照先のオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # weak_map = ObjectSpace::WeakMap.new
  # key = "text"
  # weak_map[key] = "test" # => test
  # weak_map[key] # => test
  # //}
  def []=; end

end
