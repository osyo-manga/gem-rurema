class DRb::ExtServManager
  # --- service(name) -> DRb::ExtServ
  # name で指定したサービスに関連付けられた [[c:DRb::ExtServ]] 
  # オブジェクトを返します。
  # 
  # サービスを提供するプロセスが起動していない場合は、[[m:DRb::ExtServManager.command]] 
  # で指定したプロセスを起動し、そのプロセスが [[c:DRb::ExtServ]] オブジェクトが
  # [[m:DRb::ExtServ.new]] によって ExtServManager に登録されるのを待ちます。
  # その後、登録されたオブジェクトを返します。
  # 
  # すでにプロセスが起動していた場合は、登録されている DRb::ExtServ オブジェクトを
  # 返します。
  # 
  # [[c:DRb::ExtServ#stop_service]] でサービスを停止すると、登録されている
  # DRb::ExtServ は削除され、プロセスは停止します。
  # 
  # @param name サービス名文字列
  def service; end

  # --- uri -> String|nil
  # サービス起動時にプロセスを spawn する時に渡す URI を返します。
  # 
  # デフォルトは nil で、これは [[m:DRb.#uri]] を用いることを意味します。
  # 
  # @see [[m:DRb::ExtServManager#uri=]]
  def uri; end

  # --- uri=(uri)
  # サービス起動時にプロセスを spawn する時に渡す URI を設定します。
  # 
  # @see [[m:DRb::ExtServManager#uri]]
  def uri=; end

  # --- command -> { String => String|[String] }
  # 
  # サービスを起動するためのコマンドを指定するための [[c:Hash]] を
  # 返します。
  # 
  # Hash のキーがサービス名で、値がそのサービスを起動するためのコマンドです。
  # この Hash を変更することでサービスを定義します。
  # [[m:DRb::ExtServManager.command=]] で Hash 自体を
  # 変更することでも同じことができます。
  # 
  # コマンドは文字列、もしくは文字列の配列で指定します。
  # 文字列で指定した場合は [[m:Kernel.#spawn]] で
  # プロセスを起動する際に shell 経由で起動されます。
  # 文字列の配列で指定すると shell を経由せずに起動されます。
  def command; end

  # --- command=(cmd)
  # サービスを起動するためのコマンドを指定するための [[c:Hash]] を
  # 設定します。
  # 
  # @param cmd コマンドを設定した Hash
  # @see [[m:DRb::ExtServManager.command]]
  def command=; end

  # --- new -> DRb::ExtServManager
  # DRb::ExtServManager オブジェクトを生成して返します。
  # 
  # これで生成したオブジェクトの [[m:DRb::ExtServManager#service]] を
  # リモートプロセスから呼び出すことでサービスの仲介を実現します。
  def new; end

end
