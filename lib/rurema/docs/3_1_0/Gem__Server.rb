class Gem::Server
  # --- Marshal(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def Marshal; end

  # --- latest_specs(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def latest_specs; end

  # --- quick(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def quick; end

  # --- root(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def root; end

  # --- run -> ()
  # 
  # サーバを実行します。
  def run; end

  # --- specs(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def specs; end

  # --- yaml(request, response) -> ()
  # 
  # メソッド名に対応する URI に対するリクエストを処理するメソッドです。
  # 
  # @param request  [[c:WEBrick::HTTPRequest]] オブジェクトが自動的に指定されます。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] オブジェクトが自動的に指定されます。
  def yaml; end

  # --- new(gem_dirs, port, daemon, addresses = nil) -> Gem::Server
  # 
  # サーバーを初期化します。
  # 
  # @param gem_dirs Gem を格納しているディレクトリを指定します。
  # @param gem_dir Gem を格納しているディレクトリを指定します。
  # 
  # @param port リッスンするポートを指定します。
  # 
  # @param daemon 真を指定するとデーモンとして起動します。
  # 
  # @param addresses 
  def new; end

  # --- run(options) -> Gem::Server
  # 
  # 与えられたオプションを使用してサーバを起動します。
  # 
  # @param options オプションを表すハッシュを指定します。含まれるキーは :gemdir, :port, :daemon です。
  # 
  # @see [[m:Gem::Server.new]]
  def run; end

  # --- DOC_TEMPLATE -> String
  # 
  # ドキュメントのテンプレートを表す文字列です。
  def DOC_TEMPLATE; end

  # --- RDOC_CSS -> String
  # 
  # RDoc のための CSS を表す文字列です。
  def RDOC_CSS; end

end
