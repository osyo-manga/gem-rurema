class CGI::Session::PStore
  # --- close -> ()
  # セッションの状態をファイルに保存してファイルを閉じます。
  def close; end

  # --- delete -> ()
  # 
  # セッションを削除してファイルも削除します。
  def delete; end

  # --- restore -> Hash
  # 
  # セッションの状態をファイルから復元したハッシュを返します。
  def restore; end

  # --- update -> ()
  # 
  # セッションの状態をファイルに保存します。
  def update; end

  # --- new(session, option = {}) -> CGI::Session::FileStore
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
  # 以下の文字列をキーとして指定することができます。
  # 
  # : tmpdir
  #     セッションデータを作成するディレクトリの名前を指定します。
  #     デフォルトは [[m:Dir.tmpdir]] です。
  # 
  # : prefix
  #     セッションデータのファイル名に与えるプレフィックスを指定します。
  #     デフォルトは空文字列です。
  # 
  # @raise CGI::Session::NoSession セッションが初期化されていない場合に発生します。
  def new; end

end
