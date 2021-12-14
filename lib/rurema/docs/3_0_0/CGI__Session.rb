class CGI::Session
  # --- [](key) -> object
  # 
  # 指定されたキーの値を返します。
  # 値が設定されていなければ nil を返します。
  # 
  # @param key キーを指定します。
  def []; end

  # --- []=(key, val)
  # 
  # 指定されたキーの値を設定します。
  # 
  # @param key キーを指定します。
  # 
  # @param val 値を指定します。
  def []=; end

  # --- close -> ()
  # データベースクラスの close メソッドを呼び出して、
  # セッション情報をサーバに保存し、セッションストレージをクローズします。
  def close; end

  # --- delete -> ()
  # 
  # データベースクラスの delete メソッドを呼び出して、
  # セッションをストレージから削除します。
  # 
  # FileStore の場合はセッションファイルを削除します。
  # セッションファイルは明示的に削除しなければ残っています。
  def delete; end

  # --- new_session -> bool
  # 
  # 真であれば新しいセッション ID を生成します。
  def new_session; end

  # --- session_id -> String
  # 
  # セッション ID を返します。
  def session_id; end

  # --- update -> ()
  # データベースクラスの update メソッドを呼び出して、
  # セッション情報をサーバに保存します。
  # 
  # MemoryStore の場合は何もしません。
  def update; end

  # --- callback(dbman)
  def callback; end

  # --- new(request, option = {}) -> CGI::Session
  # 
  # セッションオブジェクトを新しく作成し返します。
  # 
  # @param request [[c:CGI]] のインスタンスを指定します。
  # 
  # @param option ハッシュを指定することができます。
  # 
  # 以下の文字列が option のキーとして認識されます。
  # 
  # : session_key
  #   クッキーと <FORM type=hidden> の name として使われます。
  #   (default: "_session_id")
  # 
  # : session_id
  #   セッション ID として使われます。
  #   デフォルトのデータベースである FileStore を用いる場合,
  #   値は英数字だけからなる文字列で無ければなりません。
  #   このオプションを指定するとリクエストにセッション ID が含まれても無視します。
  #   (default: ランダムに生成されます)
  # 
  # : new_session
  #     値が true のときは強制的に新しいセッションを始めます。
  #     値が false のときは、リクエストにセッション ID が含まれていない場合に
  #     例外 [[c:ArgumentError]] が発生します。
  #     値がないときは、リクエストにセッション ID が
  #     含まれている場合はそれを使用し、含まれていない場合は新しいセッションを始めます。
  #     (default: 偽)
  # 
  # : database_manager
  #   データベースクラスを指定します。
  #   組み込みで [[c:CGI::Session::FileStore]], [[c:CGI::Session::MemoryStore]],
  #   [[c:CGI::Session::PStore]] を提供しています。デフォルトは [[c:CGI::Session::FileStore]] です。
  # 
  # : session_expires
  #     セッションの有効期間。
  #     [[c:Time]] オブジェクトを与えると、セッションはその日時まで破棄されずに残ります。
  #     デフォルトでは、セッションはブラウザの終了と同時に破棄されます。
  # 
  # : session_domain
  #   セッションが有効となるドメインを指定します。
  #   デフォルトでは、CGI を実行しているサーバのホスト名になります。
  # 
  # : session_secure
  #   真を指定すると HTTPS の場合のみ有効になります。
  # 
  # : session_path
  #   クッキーの path として使われます。
  #   デフォルトは File.dirname(ENV["SCRIPT_NAME"]) です。
  #   つまり、スクリプトの URI の path 部の最後のスラッシュまでです。
  # 
  # : tmpdir
  #     [[c:CGI::Session::FileStore]] がセッションデータを作成するディレクトリの名前を指定します。
  #     デフォルトは [[m:Dir.tmpdir]] です。
  # 
  # : prefix
  #     [[c:CGI::Session::FileStore]] がセッションデータのファイル名に与えるプレフィックス。
  #     (default: "")
  # 
  # : suffix
  #     [[c:CGI::Session::FileStore]] がセッションデータのファイル名に与えるサフィックス。
  #     (default: "")
  # 
  # : no_hidden
  #   真を指定すると @output_hidden が nil になります。
  # 
  # : no_cookies
  #   真を指定すると @output_cookies が nil になります。
  # 
  # 例:
  # 
  #   CGI::Session.new(cgi, {"new_session" => true})
  def new; end

end
