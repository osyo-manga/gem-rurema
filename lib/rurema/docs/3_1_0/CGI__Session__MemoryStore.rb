class CGI::Session::MemoryStore
  # --- close -> ()
  # セッションの状態をファイルに保存してファイルを閉じます。
  # このクラスでは何もしません。
  def close; end

  # --- delete -> ()
  # 
  # セッションを削除します。
  def delete; end

  # --- restore -> Hash
  # 
  # セッションの状態を復元したハッシュを返します。
  def restore; end

  # --- update -> ()
  # 
  # セッションの状態を保存します。
  # このクラスでは何もしません。
  def update; end

  # --- new(session, option = nil) -> CGI::Session::MemoryStore
  # 
  # 自身を初期化します。
  # 
  # [[c:CGI::Session]] クラス内部で使用します。
  # ユーザが明示的に呼び出す必要はありません。
  # 
  # @param session [[c:CGI::Session]] のインスタンスを指定します。
  # 
  # @param option ハッシュを指定します。
  # 
  # @raise CGI::Session::NoSession セッションが初期化されていない場合に発生します。
  def new; end

end
