class Gem::RemoteFetcher
  # --- connection_for(uri) -> Net::HTTP
  # 
  # HTTP コネクションを生成して返します。
  # 
  # 既に接続している URI であれば、生成済みのコネクションを返します。
  # また、必要があればプロキシを使用します。
  # 
  # @param uri 接続先の URI を指定します。
  def connection_for; end

  # --- download(spec, source_uri, install_dir = Gem.dir) -> String
  # 
  # source_uri から取得した Gem パッケージをキャッシュディレクトリに配置します。
  # 
  # 既に Gem パッケージが存在する場合は、ファイルを置き換えませんが source_uri が
  # ローカルパス (file://) である場合は常にファイルを置き換えます。
  # 
  # @param spec [[c:Gem::Specification]] のインスタンスを指定します。
  # 
  # @param source_uri 取得先の URI を指定します。
  # 
  # @param install_dir ダウンロードしたファイルの配置先を指定します。
  # 
  # @return ローカルにコピーした Gem ファイルのパスを返します。
  # 
  # @raise Gem::RemoteFetcher::FetchError 
  def download; end

  # --- escape(str) -> String
  # 
  # URI 文字列をエンコードした文字列を返します。
  # 
  # @param str 文字列を指定します。
  # 
  # @see [[m:URI.escape]]
  def escape; end

  # --- fetch_path(uri, mtime = nil, head = false) -> String | Hash
  # 
  # 与えられた URI からダウンロードしたデータを文字列として返します。
  # 
  # ヘッダ情報のみ取得した場合はハッシュを返します。
  # 
  # @param uri データ取得先の URI を指定します。
  # 
  # @param mtime 更新時刻を指定します。
  # 
  # @param head 真を指定するとヘッダ情報のみ取得します。
  def fetch_path; end

  # --- fetch_size(uri) -> Integer
  # 
  # 与えられた URI からダウンロードするデータのサイズを返します。
  # 
  # @param uri データ取得先の URI を指定します。
  def fetch_size; end

  # --- file_uri?(uri) -> bool
  # 
  # "file://" で始まる文字列である場合は真を返します。そうでない場合は偽を返します。
  # 
  # @param uri URI を表す文字列を指定します。
  def file_uri?; end

  # --- get_file_uri_path(uri) -> String
  # 
  # 与えられた URI から "file://" を取り除いた文字列を返します。
  # 
  # @param uri URI を表す文字列を指定します。
  def get_file_uri_path; end

  # --- get_proxy_from_env -> URI | nil
  # 
  # 環境変数にセットされている HTTP proxy の情報を取得して返します。
  # 
  # ここでチェックしている環境変数は以下の通りです。
  # 
  #  * http_proxy
  #  * http_proxy_user
  #  * http_proxy_pass
  #  * HTTP_PROXY
  #  * HTTP_PROXY_USER
  #  * HTTP_PROXY_PASS
  def get_proxy_from_env; end

  # --- normalize_uri(uri) -> String
  # 
  # URI のスキーム部分が欠けている場合に "http://" を補って返します。
  # 
  # @param uri URI 文字列を指定します。
  def normalize_uri; end

  # --- open_uri_or_path(uri, last_modified = nil, head = false, depth = 0) -> StringIO | File
  # 
  # @param uri URI を指定します。
  # 
  # @param last_modified 最終更新時刻を指定します。
  # 
  # @param head 真を指定するとヘッダ情報のみ取得します。
  # 
  # @param depth 現在のリダイレクト回数を指定します。
  # 
  # @raise Gem::RemoteFetcher::FetchError デフォルトでは 11 回リダイレクトした場合に発生します。
  #        depth を指定すると 10 - depth 回より多くリダイレクトした場合にこの例外が発生するようになります。
  #        また HTTP のレスポンスが想定外のものの場合にも発生します。
  def open_uri_or_path; end

  # --- request(uri, request_class, last_modified = nil) -> Net::HTTPResponse
  # 
  # 与えられた URI に対してリクエストを実行し、[[c:Net::HTTPResponse]] を返します。
  # 
  # @param uri URI を指定します。
  # 
  # @param request_class [[c:Net::HTTP::Head]] か [[c:Net::HTTP::Get]] を指定します。
  # 
  # @param last_modified 最終更新時刻を指定します。
  # 
  # @see [[c:Net::HTTP]], [[c:Net::HTTP::Head]], [[c:Net::HTTP::Get]]
  def request; end

  # --- reset(connection) -> Net::HTTP
  # 
  # 与えられたコネクションをリセットします。
  # 
  # @param connection コネクションを指定します。
  def reset; end

  # --- unescape(str) -> String
  # 
  # URI 文字列をデコードした文字列を返します。
  # 
  # @param str 文字列を指定します。
  # 
  # @see [[m:URI.unescape]]
  def unescape; end

  # --- fetcher -> Gem::RemoteFetcher
  # 
  # このクラスの唯一のインスタンスを返します。
  def fetcher; end

  # --- fetcher=(fetcher)
  # 
  # テスト用のメソッドです。
  def fetcher=; end

end
