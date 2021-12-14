module DRb
  # --- config -> { Symbol => Object }
  # カレントサーバの設定を返します。
  # 
  # カレントサーバが存在しない場合は、デフォルトの設定を返します。
  # 
  # @see [[m:DRb.#current_server]]
  def config; end

  # --- current_server -> DRb::DRbServer
  # 「カレントサーバ」を返します。
  # 
  # リモートメソッドが呼び出された場合、そのスレッドでは、その呼び出しを管理している
  # サーバがカレントサーバとなります。そうでない場合はプライマリサーバとなります。
  # 
  # 通常、カレントサーバとプライマリサーバは一致しますが、複数のサーバを
  # 異なる URI で起動した場合などにはこの2つが異なる場合があります。
  # 
  # @raise DRb::DRbServerNotFound カレントサーバが存在しない場合に発生します
  # @see [[m:DRb.#primary_server]]
  def current_server; end

  # --- front -> object
  # カレントサーバのフロントオブジェクトを返します。
  # 
  # @raise DRbServerNotFound カレントサーバが存在しない場合に発生します
  # @see [[m:DRb.#current_server]]
  def front; end

  # --- here?(uri) -> bool
  # uri がカレントサーバに紐付けられたものであれば真を返します。
  # 
  # @see [[m:DRb.#current_server]]
  def here?; end

  # --- install_acl(acl) -> ()
  # サーバ起動時の :acl オプションのデフォルト値を指定します。
  # 
  # 内部的には [[m:DRb::DRbServer.default_acl]] を呼び出すだけです。
  # 
  # @see [[c:ACL]]
  def install_acl; end

  # --- install_id_conv(idconv) -> ()
  # サーバ起動時の :id_conv オプションのデフォルト値を指定します。
  # 
  # 内部的には [[m:DRb::DRbServer.default_id_conv]] を呼び出すだけです。
  def install_id_conv; end

  # --- primary_server -> DRb::DRbServer|nil
  # ローカルプロセスのプライマリサーバーを返します。
  # 
  # プライマリサーバとは [[m:DRb.#start_service]] によって
  # 起動されるサーバです。
  # 
  # サーバが動いていない場合は nil を返します。
  # 
  # @see [[m:DRb.#stop_service]]
  def primary_server; end

  # --- primary_server=(server)
  # ローカルプロセスのプライマリサーバーを変更します。
  # 
  # 通常、プライマリサーバは [[m:DRb.#start_service]] などが
  # 設定するものであり、ユーザが変更すべきではありません。
  # このメソッドは dRuby の内部構造を良く理解した上で利用してください。
  def primary_server=; end

  # --- start_service(uri=nil, front=nil, config_or_acl=nil) -> ()
  # 
  # dRuby のサービス(サーバ)を起動します。
  # 
  # これで起動したサーバはプロセスのプライマリサーバとなります。
  # すでにプライマリサーバが存在する場合は上書きされます。
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
  # @see [[m:DRb.#primary_server]], [[m:DRb::DRbServer.new]]
  def start_service; end

  # --- stop_service -> ()
  # ローカルプロセス内の dRuby サーバ(プライマリサーバ)を停止します。
  # 
  # サーバが動いていない場合は何もしません。
  def stop_service; end

  # --- thread -> Thread|nil
  # プライマリサーバが動作しているスレッドを返します。
  # 
  # プライマリサーバが存在しない場合は nil を返します。
  # 
  # @see [[m:DRb.#primary_server]]
  def thread; end

  # --- uri -> String
  # カレントサーバに紐付けられた URI を返します。
  # 
  # @see [[m:DRb.#current_server]]
  def uri; end

end
