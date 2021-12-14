class WEBrick::HTTPServer::MountTable
  # --- [](dir) -> WEBrick::HTTPServlet::AbstractServlet
  # 
  # 与えられたディレクトリに対応するサーブレットを返します。
  # 
  # @param dir ディレクトリを指定します。
  # 
  # @return [[c:WEBrick::HTTPServlet::AbstractServlet]] のサブクラスのインタンスを返します。
  def []; end

  # --- []=(dir, val)
  # 
  # 与えられたディレクトリに対応するサーブレットを登録します。
  # 
  # @param dir ディレクトリを指定します。
  # 
  # @param val サーブレットを指定します。
  def []=; end

  # --- delete(dir) -> WEBrick::HTTPServlet::AbstractServlet
  # 
  # ディレクトリとサーブレットの対応を削除してサーブレットを返します。
  # 
  # @param dir ディレクトリを指定します。
  # 
  # @return [[c:WEBrick::HTTPServlet::AbstractServlet]] のサブクラスのインタンスを返します。
  def delete; end

  # --- scan(path) -> Array
  # 与えられたパスをスクリプトの名前と PATH_INFO に分割します。
  # 
  # @param path パスを指定します。
  def scan; end

  # --- new -> WEBrick::HTTPServer::MountTable
  # 
  # 自身を初期化します。
  def new; end

end
