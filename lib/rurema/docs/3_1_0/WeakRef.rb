class WeakRef
  # --- __getobj__ -> object
  # 
  # 自身の参照先のオブジェクトを返します。
  # 
  # @raise WeakRef::RefError GC 済みのオブジェクトを参照した場合に発生します。
  # 
  # @see [[lib:delegate]]
  def __getobj__; end

  # --- __setobj__(obj) -> ()
  # 
  # 与えられたオブジェクトを自身の参照先としてセットします。
  # 内部用のメソッドなので使わないでください。
  # 
  # @param obj 任意のオブジェクトを指定します。
  def __setobj__; end

  # --- weakref_alive? -> bool
  # 
  # 参照先のオブジェクトがまだ生きていれば真を返します。
  # GC されていれば偽を返します。
  def weakref_alive?; end

  # --- new(orig) -> WeakRef
  # 
  # 与えられたオブジェクトを使って自身を初期化します。
  # 
  # @param orig 任意のオブジェクトを指定します。
  def new; end

end
