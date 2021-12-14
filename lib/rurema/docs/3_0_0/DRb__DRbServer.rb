class DRb::DRbServer
  # --- alive? -> bool
  # サーバが生存しているならば真を返します。
  # 
  # @see [[m:DRb::DRbServer#stop_service]]
  def alive?; end

  # --- config  -> Hash
  # サーバの設定を返します。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def config; end

  # --- front -> object
  # サーバに設定されたフロントオブジェクトを返します。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def front; end

  # --- here?(uri) -> bool
  # uri がサーバに紐付けられたものであれば真を返します。
  # 
  # @param uri URI 文字列
  def here?; end

  # --- safe_level -> Integer
  # サーバのセーフレベルを返します。
  def safe_level; end

  # --- stop_service -> ()
  # サーバを停止します。
  # 
  # @see [[m:DRb::DRbServer#alive?]]
  def stop_service; end

  # --- thread -> Thread
  # サーバのメインスレッドを返します。
  # 
  # このスレッドはクライアントからの接続を受け付けるスレッドであって、
  # クライアントへの応答をするスレッドではありません。
  def thread; end

  # --- uri -> String|nil
  # サーバに紐付けられた URI を返します。
  def uri; end

  # --- verbose -> bool
  # サーバが verbose mode ならば真を返します。
  # 
  # @see [[m:DRb::DRbObject#verbose=]]
  def verbose; end

  # --- verbose=(on) 
  # サーバの verbose mode を真偽値で設定します。
  # 
  # verbose mode が on の場合は失敗したメソッド呼出のログが標準出力に出力
  # されます。
  # 
  # @param on 真を渡すと verbose mode が on になります
  # 
  # @see [[m:DRb::DRbObject#verbose]]
  def verbose=; end

  # --- default_acl(acl) -> ()
  # 
  # サーバ起動時の :acl オプションのデフォルト値を指定します。
  # 
  # 初期値は nil です。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]], [[c:ACL]]
  def default_acl; end

  # --- default_argc_limit(argc) -> ()
  # サーバ起動時の :argc_limit オプションのデフォルト値を指定します。
  # 
  # 初期値は 256 です。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def default_argc_limit; end

  # --- default_id_conv(idconv) -> ()
  # サーバ起動時の :id_conv オプションのデフォルト値を指定します。
  # 
  # 初期値は [[c:DRb::DRbIdConv]] のインスタンスです。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def default_id_conv; end

  # --- default_load_limit(sz) -> ()
  # サーバ起動時の :load_limit オプションのデフォルト値を指定します。
  # 
  # 初期値は25MBです。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def default_load_limit; end

  # --- default_safe_level(level) -> ()
  # サーバ起動時の :safe_level オプションのデフォルト値を指定します。
  # 
  # 初期値は0です。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def default_safe_level; end

  # --- new(uri=nil, front=nil, config_or_acl=nil) -> DRb::DRbServer
  # 
  # dRuby サーバを起動し、DRbServerのインスタンスを返します。
  # 
  # uri に URI を文字列で指定すると、それに起動したサービスを bind します。
  # 通常は 'druby://<hostname>:<port>' という形式の URI を指定します。
  # このときは TCP が通信手段として使われます。
  # 'drbunix:' のような他のプロトコルを指定することもできます。
  # 
  # front でフロントオブジェクト(URI に結び付けられるオブジェクト)を
  # 設定します。
  # 
  # config で Hash で設定を渡します。以下の項目が利用できます。
  # 
  # : :idconv 
  #   dRuby内部で識別子とオブジェクトを相互に変換するためのオブジェクト。
  #   デフォルトは [[c:DRb::DRbIdConv]] のインスタンス。
  # : :verbose 
  #   真を指定すると失敗したdRuby経由のメソッドのログを
  #   [[m:$stdout]] に出力します。デフォルトは false。
  # : :tcp_acl 
  #   サーバに設定する ACL(Access Control List)。詳しくは [[c:ACL]]
  #   を見てください。デフォルトは nil(設定しない)。
  # : :load_limit 
  #   サーバが受け付けるメッセージの最大バイト数。デフォルトは
  #   26214400(25MB)
  # : :argc_limit
  #   サーバが受け付けるリモートメソッド呼出の引数の最大個数。
  #   デフォルトは256。
  # : :auto_load
  #   真に設定すると、
  #   URIで指定されたプロトコルを取り扱うのに
  #   必要なDRbのサブライブラリが自動的にロードされます。デフォルトは true。
  # : :safe_level 
  #   リモートからのメソッド呼出しメッセージを受け取ったときに
  #   対応するローカルオブジェクトのメソッド呼出をする前に
  #   スレッドに設定されるセーフレベル([[m:$SAFE]])の値。
  #   デフォルト値は0。
  # 
  # デフォルト値は [[c:DRb::DRbServer]] の以下のクラスメソッドによって変更できます。
  #   * [[m:DRb::DRbServer.default_acl]]
  #   * [[m:DRb::DRbServer.default_argc_limit]]
  #   * [[m:DRb::DRbServer.default_id_conv]]
  #   * [[m:DRb::DRbServer.default_load_limit]]
  #   * [[m:DRb::DRbServer.default_safe_level]]
  #   * [[m:DRb::DRbServer.verbose=]]
  # 
  # config に Hash以外を渡すと、ACL(Access Control List)として取り扱われます。
  # 
  # 起動したサーバはただちに接続を待ち受けます。
  # 
  # @param uri 起動するサービスを bind する URI の文字列
  # @param front フロントオブジェクト
  # @param config オプション設定の [[c:Hash]]
  # 
  # @raise DRb::DRbBadURI URI の schema が不正(サポートされていないものである)場合に
  #        発生します
  # プライマリサーバが存在しない場合は、これで起動したサーバがプライマリ
  # サーバとなります。
  # 
  # @see [[m:DRb.#start_service]]
  def new; end

  # --- verbose -> bool
  # サーバ起動時の :verbose オプションのデフォルト値を返します。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]], 
  #      [[m:DRb::DRbServer.verbose=]]
  def verbose; end

  # --- verbose=(on)
  # サーバ起動時の :verbose オプションのデフォルト値を指定します。
  # 
  # 初期値は false です。
  # 
  # @see [[m:DRb::DRbServer.new]], [[m:DRb.#start_service]]
  def verbose=; end

  # --- INSECURE_METHOD -> [Symbol]
  # セキュアでないメソッドのリスト。
  # 
  # これに含まれるメソッドは dRuby 経由では呼び出せません。
  def INSECURE_METHOD; end

end
