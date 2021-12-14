module Observable
  # --- add_observer(observer, func=:update) -> Array
  # 
  # オブザーバを登録します。
  # 
  # オブザーバを登録し、登録されているオブザーバのリストを返します。
  # 
  # オブザーバは update メソッドを備えている必要があります。
  # 
  # observer が update メソッドを持たないときは
  # 例外 [[c:NoMethodError]] が発生します。
  # 
  # func を指定することで update 以外のメソッドを通知に用いることができます。
  # 
  # @param observer 更新の通知を受けるオブザーバ
  # @param func 更新の通知をするメソッド
  # @raise NoMethodError updateメソッドを持たないオブジェクトをオブザーバに指定した場合に発生します。
  def add_observer; end

  # --- changed(state = true) -> bool
  # 
  # 更新フラグを立てます。
  # 
  # 更新フラグを指定された内容へ変更し、変更後の更新フラグの状態を返します。
  # 明示的に引数を指定して、更新フラグを初期化することも出来ます。
  # 
  # @param state 更新フラグを立てる場合はtrueを、初期化する場合はfalseを指定します。
  def changed; end

  # --- changed? -> bool
  # 
  # 更新フラグの状態を返します。
  def changed?; end

  # --- count_observers -> Integer
  # 
  # 登録されているオブザーバの数を返します。
  def count_observers; end

  # --- delete_observer(observer) -> object | nil
  # 
  # オブザーバを削除します。
  # 
  # 指定されたオブジェクトがオブザーバとして登録されていた場合は、
  # リストからオブジェクトを削除し、取り除かれたオブジェクトを返します。
  # 登録されていなかった場合は、nil を返します。
  # 
  # @param observer 削除するオブザーバ
  def delete_observer; end

  # --- delete_observers -> Array
  # 
  # オブザーバをすべて削除します。
  # 
  # 登録されているオブザーバのリストから全てのオブジェクトを取り除き、
  # 空となったオブザーバのリストを返します。
  def delete_observers; end

  # --- notify_observers(*arg) -> nil
  # 
  # オブザーバへ更新を通知します。
  # 
  # 更新フラグが立っていた場合は、
  # 登録されているオブザーバの update メソッドを順次呼び出します。
  # 与えられた引数はその update メソッドに渡されます。
  # 与えられた引数の数と登録されているオブザーバのupdate メソッドの引数の数に違いがある場合は
  # 例外[[c:ArgumentError]]を発生します。
  # 全てのオブザーバの update メソッドを呼び出し後、更新フラグを初期化します。
  # 
  # @raise ArgumentError 与えられた引数の数と登録されているオブザーバのupdate メソッドの引数の数に違いがある場合に発生します。
  def notify_observers; end

end
