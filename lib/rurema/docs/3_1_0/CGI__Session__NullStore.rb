class CGI::Session::NullStore
  # --- close -> ()
  # セッションの状態をファイルに保存してファイルを閉じます。
  # このクラスでは何もしません。
  def close; end

  # --- delete -> ()
  # 
  # セッションを削除します。
  # このクラスでは何もしません。
  def delete; end

  # --- restore -> Hash
  # 
  # セッションの状態を復元したハッシュを返します。
  # このクラスでは何もしません。
  def restore; end

  # --- update -> ()
  # 
  # セッションの状態を保存します。
  # このクラスでは何もしません。
  def update; end

  # --- new(session, option = nil) -> CGI::Session::NullStore
  # 
  # 自身を初期化します。
  # 
  # [[c:CGI::Session]] クラス内部で使用します。
  # ユーザが明示的に呼び出す必要はありません。
  # 
  # @param session [[c:CGI::Session]] のインスタンスを指定します。
  # 
  # @param option ハッシュを指定します。
  def new; end

end
