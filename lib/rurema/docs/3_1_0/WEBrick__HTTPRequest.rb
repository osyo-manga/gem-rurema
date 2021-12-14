class WEBrick::HTTPRequest
  # --- [](header_name)    -> String
  # 
  # リクエストのヘッダの該当する内容を文字列で返します。
  # 
  # @param header_name ヘッダー名を文字列で指定します。大文字と小文字を区別しません。
  def []; end

  # --- accept    -> [String]
  # 
  # Accept ヘッダの内容をメディアタイプを表す文字列の配列で返します。
  # 配列は品質係数(qvalue)でソートされています。
  def accept; end

  # --- accept_charset    -> [String]
  # 
  # Accept-Charset  ヘッダの内容を文字セットを表す文字列の配列で返します。
  # 配列は品質係数(qvalue)でソートされています。
  def accept_charset; end

  # --- accept_encoding    -> [String]
  # 
  # Accept-Encoding  ヘッダの内容をコーディングを表す文字列の配列で返します。
  # 配列は品質係数(qvalue)でソートされています。
  def accept_encoding; end

  # --- accept_language    -> [String]
  # 
  # Accept-Language  ヘッダの内容を自然言語を表す文字列の配列で返します。
  # 配列は品質係数(qvalue)でソートされています。
  def accept_language; end

  # --- addr    -> Array
  # 
  # クライアントと接続されているソケットの [[m:IPSocket#addr]] を返します。
  def addr; end

  # --- attributes    -> Hash
  # @todo ???
  def attributes; end

  # --- body                 -> String | nil
  # --- body {|chunk| ... }  -> String | nil
  # 
  # クライアントからエンティティボディを読み込み返します。
  # リクエストにエンティティボディが含まれない場合は nil を返します。
  # 
  # リクエストが chunked 形式であっても返り値はデコードされて返されます。
  # 2回目の呼び出し以降は最初に読み込んだエンティティボディを返します。
  # ブロックを指定された場合、クライアントからデータを読み込むたびにそのデータ(文字列)
  # を引数としてブロックを実行します。リクエストが chunked 形式であっても引数はデコードされています。
  def body; end

  # --- cipher -> Array
  # 
  # 現在実際に使われている暗号の情報を配列で返します。 
  # 
  # @see [[m:OpenSSL::SSL::SSLSocket#cipher]]
  def cipher; end

  # --- client_cert -> OpenSSL::X509::Certificate
  # 
  # クライアント証明書を表すオブジェクトを返します。
  # 
  # @see [[m:OpenSSL::X509::Certificate]]
  def client_cert; end

  # --- content_length    -> Integer
  # 
  # リクエストの Content-Length ヘッダの値を整数で返します。リクエストに Content-Length ヘッダ
  # が含まれていない場合は 0 を返します。
  def content_length; end

  # --- content_type    -> String | nil
  # 
  # リクエストの Content-Type ヘッダを文字列で返します。
  def content_type; end

  # --- continue
  # @todo 1.9.3
  # Generate HTTP/1.1 100 continue response if the client expects it,
  # otherwise does nothing.
  def continue; end

  # --- cookies    -> [WEBrick::Cookie]
  # 
  # リクエストに含まれる Cookie ヘッダの値を [[c:WEBrick::Cookie]] の配列として返します。
  def cookies; end

  # --- each {|key, val| ... }
  # 
  # リクエストの各ヘッダ名を key、内容を val としてブロックを評価します。
  def each; end

  # --- fixup    -> ()
  # 
  # リクエストの残りのエンティティボディを読み込みます。
  def fixup; end

  # --- header    -> Hash
  # 
  # ヘッダ名をキー、内容をその値とするハッシュを返します。キーも値も文字列です。
  def header; end

  # --- host    -> String
  # 
  # リクエスト URI の host を文字列で返します。
  def host; end

  # --- http_version     -> WEBrick::HTTPVersion
  # 
  # リクエストの HTTP バージョンを表す [[c:WEBrick::HTTPVersion]] オブジェクトを返します。
  def http_version; end

  # --- keep_alive     -> bool
  # --- keep_alive?    -> bool
  # 
  # リクエストが Keep-Alive を要求しているかを真偽で返します。
  # http_version が 1.1 より小さい場合は Keep-Alive を要求していても無視して
  # false となります。
  def keep_alive; end

  # --- meta_vars    -> Hash
  # 
  # メタ変数を返します。
  # 
  # メタ変数は「The WWW Common Gateway Interface Version 1.1」のバージョン
  # 3 で定義されています。
  # 
  # @see [[url:http://Web.Golux.Com/coar/cgi/]]
  def meta_vars; end

  # --- meta_vars -> Hash
  # 
  # メタ変数を返します。
  def meta_vars; end

  # --- parse(socket = nil)    -> ()
  # 
  # 指定された socket からクライアントのリクエストを読み込み、
  # 自身のアクセサなどを適切に設定します。
  # 
  # @param socket クライアントに接続された IO オブジェクトを指定します。
  def parse; end

  # --- parse(socket = nil) -> ()
  # 
  # 指定された socket からクライアントのリクエストを読み込み、
  # 自身のアクセサなどを適切に設定します。
  # 
  # @param socket クライアントに接続された IO オブジェクトを指定します。
  def parse; end

  # --- path    -> String
  # 
  # リクエスト URI のパスを表す文字列を返します。
  def path; end

  # --- path_info          -> String
  # 
  # リクエスト URI のパスを文字列で返します。デフォルトは path と同じです。
  def path_info; end

  # --- path_info=(value)
  # 
  # リクエスト URI のパスをセットします。
  # 
  # @param value リクエスト URI のパスを指定します。
  def path_info=; end

  # --- peeraddr    -> Array
  # 
  # クライアントと接続されているソケットの [[m:IPSocket#peeraddr]] を返します。
  def peeraddr; end

  # --- port    -> String
  # 
  # サーバのポートを文字列で返します。
  def port; end

  # --- query    -> Hash
  # 
  # リクエストのクエリーあるいはクライアントがフォームへ入力した値を表すハッシュを返します。
  # 
  # ハッシュのキーも値も unescape されています。ただし multipart/form-data なフォームデータの場合には
  # ユーザが content-transfer-encoding ヘッダを見て適切に処理する必要があります。
  # 
  # ハッシュの値は正確には文字列ではなく String クラスのサブクラスである [[c:WEBrick::HTTPUtils::FormData]]
  # クラスのインスタンスです。
  # 
  # multipart/form-data なフォームデータであってもサイズの制限なく、通常のフォームデータと
  # 同じように扱われることに注意してください。クライアントからの入力によっては巨大な文字列が
  # 生成されてしまいます。
  # 
  # 例:
  # 
  #   h = req.query
  #   p h['q']                       #=>  "ruby rails session"  
  #   p h['upfile']['content-type']  #=>  "plain/text"
  #   p h['upfile'].filename         #=>  "my_file.txt"
  #   p h['upfile']                  #=>  "hoge hoge hoge"
  def query; end

  # --- query_string          -> String
  # 
  # リクエスト URI のクエリーを文字列で表すアクセサです。
  # デフォルトは request_uri.query です。
  def query_string; end

  # --- query_string=(value)
  # 
  # リクエスト URI のクエリーを文字列で表すアクセサです。
  # デフォルトは request_uri.query です。
  # 
  # @param value クエリーを表す文字列を指定します。
  def query_string=; end

  # --- raw_header -> String
  # 生のヘッダを返します。
  def raw_header; end

  # --- request_line -> String
  # 
  # クライアントのリクエストの最初の行(GET / HTTP/1.1)を文字列で返します。
  def request_line; end

  # --- request_method     -> String
  # 
  # クライアントのリクエストの HTTP メソッド(GET, POST,...)を文字列で返します。
  def request_method; end

  # --- request_time    -> Time
  # 
  # リクエストされた時刻を [[c:Time]] オブジェクトで返します。
  def request_time; end

  # --- request_uri -> URI
  # 
  # リクエスト URI を表す [[c:URI]] オブジェクトを返します。
  def request_uri; end

  # --- script_name          -> String
  # 
  # CGI での環境変数 SCRIPT_NAME を文字列で表すアクセサです。
  def script_name; end

  # --- script_name=(value)
  # 
  # CGI での環境変数 SCRIPT_NAME を文字列で表すアクセサです。
  # 
  # @param value SCRIPT_NAME を文字列で指定します。
  def script_name=; end

  # --- server_cert -> OpenSSL::X509::Certificate
  # 
  # サーバ証明書を表すオブジェクトを返します。
  # 
  # @see [[c:OpenSSL::X509::Certificate]]
  def server_cert; end

  # --- server_name -> String
  # 
  # サーバの名前を返します。
  def server_name; end

  # --- ssl? -> bool
  # 
  # リクエスト URI のスキームが https であれば真を返します。
  # そうでない場合は偽を返します。
  def ssl?; end

  # --- to_s    -> String
  # 
  # リクエストのヘッダとボディをまとめて文字列として返します。
  def to_s; end

  # --- unparsed_uri    -> String
  # 
  # リクエストの URI を文字列で返します。
  def unparsed_uri; end

  # --- user          -> String
  # 
  # REMOTE_USER を文字列として返します。
  def user; end

  # --- user=(value)
  # 
  # REMOTE_USER を文字列で表したものに値をセットします。
  # 
  # @param value ユーザ名を文字列で指定します。
  def user=; end

  # --- new(config) -> WEBrick::HTTPRequest
  # 
  # WEBrick::HTTPRequest を生成して返します。
  # 
  # @param config 設定を保持したハッシュを指定します。
  def new; end

end
