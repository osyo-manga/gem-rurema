class Net::HTTP
  # --- started? -> bool
  # --- active? -> bool
  # 
  # HTTP セッションが開始されていたら真を返します。
  # 
  # active? は時代遅れのメソッドです。
  def active?; end

  # --- address -> String
  # 
  # 接続するアドレスを返します。
  # 
  # @see [[m:Net::HTTP.new]]
  def address; end

  # --- ca_file -> String | nil
  # 信頼する CA 証明書ファイルのパスを返します。
  # 
  # @see [[m:Net::HTTP#ca_file=]], [[m:OpenSSL::SSL::SSLContext#ca_file]]
  def ca_file; end

  # --- ca_file=(path)
  # 信頼する CA 証明書ファイルのパスを文字列で設定します。
  # 
  # ファイルには複数の証明書を含んでいても構いません。
  # 詳しくは [[m:OpenSSL::SSL::SSLContext#ca_file=]] を見てください。
  # 
  # デフォルトは nil (指定なし)です。
  # 
  # @param path ファイルパス文字列
  # @see [[m:Net::HTTP#ca_file]], [[m:OpenSSL::SSL::SSLContext#ca_file=]]
  def ca_file=; end

  # --- ca_path -> String | nil
  # 信頼する CA 証明書ファイルが存在するディレクトリを設定します。
  # 
  # @see [[m:Net::HTTP#ca_path=]], [[m:OpenSSL::SSL::SSLContext#ca_path]]
  def ca_path; end

  # --- ca_path=(path)
  # 信頼する CA 証明書ファイルが存在するディレクトリを設定します。
  # 
  # ファイル名はハッシュ値の文字列にしなければなりません。
  # 詳しくは [[m:OpenSSL::SSL::SSLContext#ca_path=]] を見てください。
  # 
  # デフォルトは nil (指定なし)です。
  # 
  # @param path ディレクトリ名文字列
  # @see [[m:Net::HTTP#ca_path]], [[m:OpenSSL::SSL::SSLContext#ca_path=]]
  def ca_path=; end

  # --- cert -> OpenSSL::X509::Certificate | nil
  # クライアント証明書を返します。
  # 
  # @see [[m:Net::HTTP#cert=]], [[m:OpenSSL::SSL::SSLContext#cert]]
  def cert; end

  # --- cert=(certificate)
  # クライアント証明書を設定します。
  # 
  # デフォルトは nil (クライアント証明書による認証をしない)です。
  # 
  # @param certificate 証明書オブジェクト([[c:OpenSSL::X509::Certificate]])
  # @see [[m:Net::HTTP#cert]], [[m:OpenSSL::SSL::SSLContext#cert=]]
  def cert=; end

  # --- cert_store -> OpenSSL::X509::Store | nil
  # 接続相手の証明書の検証のために使う、信頼している CA 証明書を
  # 含む証明書ストアを返します。
  # 
  # @see [[m:Net::HTTP#cert_store]], [[m:OpenSSL::SSL::SSLContext#cert_store=]]
  def cert_store; end

  # --- cert_store=(store)
  # 接続相手の証明書の検証のために使う、信頼している CA 証明書を
  # 含む証明書ストアを設定します。
  # 
  # 通常は [[m:Net::HTTP#ca_file=]] や [[m:Net::HTTP#ca_path=]] で
  # 設定しますが、より詳細な設定をしたい場合にはこちらを用います。
  # 
  # デフォルトは nil (証明書ストアを指定しない)です。
  # 
  # @see [[m:Net::HTTP#cert_store=]], [[m:OpenSSL::SSL::SSLContext#cert_store]]
  def cert_store=; end

  # --- ciphers -> String | [String] | nil
  # [[m:Net::HTTP#ciphers]] で設定した値を返します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#ciphers]] が返す値とは
  # 異なるので注意してください。
  # 
  # @see [[m:Net::HTTP#ciphers=]]
  def ciphers; end

  # --- ciphers=(ciphers)
  # 利用可能な共通鍵暗号を設定します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#ciphers=]] と同じ形式で
  # 設定します。詳しくはそちらを参照してください。
  # 
  # @param ciphers 利用可能にする共通鍵暗号の種類
  # @see [[m:Net::HTTP#ciphers]]
  def ciphers=; end

  # --- close_on_empty_response -> bool
  # レスポンスがボディを持っていない場合にコネクションを
  # 閉じるかどうかを返します。
  # 
  # デフォルトでは偽(閉じない)です。
  # 
  # @see [[m:Net::HTTP#close_on_empty_response=]]
  def close_on_empty_response; end

  # --- close_on_empty_response=(bool)
  # レスポンスがボディを持っていない場合にコネクションを
  # 閉じるかどうかを設定します。
  # 
  # 
  # @param bool レスポンスがボディを持っていない場合にコネクションを
  #             閉じるかどうか指定します。
  # 
  # @see [[m:Net::HTTP#close_on_empty_response]]
  def close_on_empty_response=; end

  # --- continue_timeout -> Integer | nil
  # 「100 Continue」レスポンスを待つ秒数を返します。
  # 
  # この秒数待ってもレスポンスが来ない場合は
  # リクエストボディを送信します。
  # 
  # デフォルトは nil (待たない)です。
  # 
  # @see [[m:Net::HTTP#continue_timeout=]]
  def continue_timeout; end

  # --- continue_timeout=(seconds)
  # 「100 Continue」レスポンスを待つ秒数を指定します。
  # 
  # この秒数待ってもレスポンスが来ない場合は
  # リクエストボディを送信します。
  # 
  # デフォルトは nil (待たない)です。
  # 
  # @param seconds 秒数
  # @see [[m:Net::HTTP#continue_timeout]]
  def continue_timeout=; end

  # --- copy(path, initheader = nil) -> Net::HTTPResponse
  # サーバの path に COPY リクエストを
  # ヘッダを initheader として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Copy]]
  def copy; end

  # --- delete(path, initheader = nil) -> Net::HTTPResponse
  # サーバの path に DELETE リクエストを
  # ヘッダを initheader として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Delete]]
  def delete; end

  # --- finish -> ()
  # 
  # HTTP セッションを終了します。セッション開始前にこのメソッドが
  # 呼ばれた場合は例外 IOError を発生します。
  # 
  # @raise IOError セッション開始前に呼ぶと発生します。
  def finish; end

  # --- get(path, header = nil, dest = nil) -> Net::HTTPResponse
  # --- get(path, header = nil, dest = nil) {|body_segment| .... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティを取得し、
  # [[c:Net::HTTPResponse]] のインスタンスとして返します。
  # 
  # header が nil
  # でなければ、リクエストを送るときにその内容を HTTP ヘッダとして
  # 送ります。 header は { 'Accept' = > '*/*', ... } という
  # 形のハッシュでなければいけません。
  # 
  # ブロックと一緒に呼びだされたときは
  # エンティティボディを少しずつ文字列として
  # ブロックに与えます。このとき戻り値の 
  # [[c:Net::HTTPResponse]] オブジェクトは有効な body を
  # 持ちません。
  # 
  # dest は時代遅れの引数です。利用しないでください。
  # dest を指定した場合には
  # ボディを少しずつ取得して順次
  # 「dest << ボディの断片」を実行します。
  # 
  # @param path 取得するエンティティのパスを文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # @param dest 利用しないでください。
  # 
  # 1.1 互換モードの場合は、レスポンスに応じて例外が発生します。
  # また、返り値が [レスポンスオブジェクト, そのボディ] となります。
  # 
  #   # net/http version 1.1
  #   response, body = http.get( '/index.html' )
  #   
  #   # net/http version 1.2
  #   response = http.get('/index.html')
  #   
  #   # compatible in both version
  #   response , = http.get('/index.html')
  #   response.body
  #   
  #   # compatible, using block
  #   File.open('save.txt', 'w') {|f|
  #     http.get('/~foo/', nil) do |str|
  #       f.write str
  #     end
  #   }
  # 
  # @see [[m:Net::HTTP#request_get]]
  def get; end

  # --- request_get(path, header = nil) -> Net::HTTPResponse
  # --- request_get(path, header = nil) {|response| .... } -> Net::HTTPResponse
  # --- get2(path, header = nil) -> Net::HTTPResponse
  # --- get2(path, header = nil) {|response| .... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティを取得します。
  # [[c:Net::HTTPResponse]] オブジェクトを返します。
  # 
  # header が nil
  # でなければ、リクエストを送るときにその内容を HTTP ヘッダとして
  # 送ります。 header は { 'Accept' = > '*/*', ... } という
  # 形のハッシュでなければいけません。
  # 
  # ブロックとともに呼び出されたときは、
  # エンティティボディをソケットから読み出す前に、
  # 接続を維持した状態で [[c:Net::HTTPResponse]]
  # オブジェクトをブロックに渡します。
  # 大きなサイズのボディを一度に読みだすとまずく、
  # 小さなサイズに分けて取りだしたい場合にはこれを利用します。
  # 
  # @param path 取得するエンティティのパスを文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  #   # example
  #   response = http.request_get('/index.html')
  #   p response['content-type']
  #   puts response.body          # body is already read
  #   
  #   # using block
  #   http.request_get('/index.html') {|response|
  #     p response['content-type']
  #     response.read_body do |str|   # read body now
  #       print str
  #     end
  #   }
  # 
  # get2 は時代遅れなので使わないでください。
  # 
  # @see [[m:Net::HTTP#get]], [[m:Net::HTTPResponse#read_body]]
  def get2; end

  # --- head(path, header = nil) -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティのヘッダのみを取得します。
  # [[c:Net::HTTPResponse]] のインスタンスを返します。
  # 
  # header が nil
  # でなければ、リクエストを送るときにその内容を HTTP ヘッダとして
  # 送ります。 header は { 'Accept' = > '*/*', ... } という
  # 形のハッシュでなければいけません。
  # 
  # @param path 取得するエンティティのパスを文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  # 1.1 互換モードの場合は、レスポンスに応じて例外が発生します。
  # 
  #   require 'net/http'
  # 
  #   response = nil
  #   Net::HTTP.start('some.www.server', 80) {|http|
  #     response = http.head('/index.html')
  #   }
  #   p response['content-type']
  # 
  # @see [[m:Net::HTTP#request_head]]
  def head; end

  # --- request_head(path, header = nil) -> Net::HTTPResponse
  # --- request_head(path, header = nil) {|response| .... } -> Net::HTTPResponse
  # --- head2(path, header = nil) -> Net::HTTPResponse
  # --- head2(path, header = nil) {|response| .... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティのヘッダのみを取得します。
  # [[c:Net::HTTPResponse]] オブジェクトを返します。
  # 
  # header が nil
  # でなければ、リクエストを送るときにその内容を HTTP ヘッダとして
  # 送ります。 header は { 'Accept' = > '*/*', ... } という
  # 形のハッシュでなければいけません。
  # 
  # ブロックとともに呼び出されたときは、
  # [[m:Net::HTTP#request_get]] と同じ動作を
  # しますが、そもそもヘッダしか要求していないので
  # body は空です。そのためこの動作はそれほど意味はありません。
  # 
  # @param path ヘッダを取得するエンティティのパスを
  #             文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  # 
  # head2 は時代遅れなので使わないでください。
  # 
  #   response = http.request_head('/index.html')
  #   p response['content-type']
  # 
  # @see [[m:Net::HTTP#head]]
  def head2; end

  # --- keep_alive_timeout -> Integer
  # 以前のリクエストで使ったコネクションの再利用(keep-alive)を許可する秒数を
  # 返します。
  # 
  # デフォルトは2(秒)です。
  # 
  # @see [[m:Net::HTTP#keep_alive_timeout=]]
  def keep_alive_timeout; end

  # --- keep_alive_timeout=(seconds)
  # 以前のリクエストで使ったコネクションの再利用(keep-alive)を許可する秒数を
  # 設定します。
  # 
  # この秒数以内に同じホストに次のリクエストを送った場合、
  # ソケットを再利用します。
  # 
  # デフォルトは2(秒)です。これは一般的にサーバ側の keep-alive の秒数
  # が2秒である場合が多いからです。
  # 
  # @see [[m:Net::HTTP#keep_alive_timeout]]
  def keep_alive_timeout=; end

  # --- key -> OpenSSL::PKey::PKey | nil
  # クライアント証明書の秘密鍵を返します。
  # 
  # @see [[m:Net::HTTP#key=]], [[m:OpenSSL::SSL::SSLContext#key]]
  def key; end

  # --- key=(key)
  # クライアント証明書の秘密鍵を設定します。
  # 
  # [[c:OpenSSL::PKey::RSA]] オブジェクトか
  # [[c:OpenSSL::PKey::DSA]] オブジェクトを設定します。
  # 
  # デフォルトは nil (鍵なし)です。
  # 
  # @param key 設定する秘密鍵
  # @see [[m:Net::HTTP#key]],
  #      [[m:OpenSSL::SSL::SSLContext#key=]]
  def key=; end

  # --- local_host -> String | nil
  # 
  # 接続に用いるローカルホスト名を返します。
  # 
  # nil の場合システムが適当にローカルホストを
  # 決めます。
  # 
  # デフォルトは nil です。
  # 
  # 
  # @see [[m:Net::HTTP#local_host=]], [[m:Net::HTTP#local_port]]
  def local_host; end

  # --- local_host=(host)
  # 
  # 接続に用いるローカルホスト名を指定します。
  # 
  # nil の場合システムが適当にローカルホストを
  # 決めます。
  # 
  # デフォルトは nil です。
  # 
  # @param host ホスト名、もしくはアドレスを示す文字列
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # http = Net::HTTP.new("www.example.com")
  # http.local_host = "192.168.0.5"
  # http.local_port = "53043"
  # 
  # http.start do |h|
  #   p h.get("/").body
  # end
  # //}
  # 
  # @see [[m:Net::HTTP#local_host=]], [[m:Net::HTTP#local_port]]
  def local_host=; end

  # --- local_port -> nil | Integer | String
  # 接続に用いるローカルポートを返します。
  # 
  # nil の場合システムが適当にローカルポートを
  # 決めます。
  # 
  # デフォルトは nil です。
  # 
  # @see [[m:Net::HTTP#local_port=]], [[m:Net::HTTP#local_host]]
  def local_port; end

  # --- local_port=(port)
  # 接続に用いるローカルポートを設定します。
  # 
  # nil の場合システムが適当にローカルポートを
  # 決めます。
  # 
  # デフォルトは nil です。
  # 
  # @param port ローカルポート(数値、もしくはサービス名文字列)
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # http = Net::HTTP.new("www.example.com")
  # http.local_host = "192.168.0.5"
  # http.local_port = "53043"
  # 
  # http.start do |h|
  #   p h.get("/").body
  # end
  # //}
  # 
  # @see [[m:Net::HTTP#local_port=]], [[m:Net::HTTP#local_host]]
  # 
  # 
  # @see [[m:Net::HTTP.new]]
  def local_port=; end

  # --- lock(path, body, initheader = nil) -> Net::HTTPResponse
  # サーバの path に LOCK リクエストを
  # ヘッダを initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Lock]]
  def lock; end

  # --- mkcol(path, body, initheader = nil) -> Net::HTTPResponse
  # サーバの path に MKCOL リクエストを
  # ヘッダが initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Mkcol]]
  def mkcol; end

  # --- move(path, body, initheader = nil) -> Net::HTTPResponse
  # サーバの path に MOVE リクエストを
  # ヘッダが initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Move]]
  def move; end

  # --- open_timeout -> Integer|nil
  # 接続時に待つ最大秒数を返します。
  # 
  # この秒数たってもコネクションが
  # 開かなければ例外 [[c:Net::OpenTimeout]] を発生します。
  # 
  # デフォルトは60(秒)です。
  # 
  # @see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout=]]
  def open_timeout; end

  # --- open_timeout=(seconds)
  # 接続時に待つ最大秒数を設定します。
  # 
  # この秒数たってもコネクションが
  # 開かなければ例外 [[c:Net::OpenTimeout]] を発生します。
  # nilを設定するとタイムアウトしなくなります。
  # 
  # 以下のコネクションを開くメソッドで有効です。
  # 
  #   * [[m:Net::HTTP.open]]
  #   * [[m:Net::HTTP#start]]
  # 
  # 
  # @param second 待つ秒数を指定します。
  # @see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout]]
  def open_timeout=; end

  # --- options(path, initheader = nil) -> Net::HTTPResponse
  # サーバの path に OPTIONS リクエストを
  # ヘッダが initheader として送り、
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Options]]
  def options; end

  # --- patch(path, data, initheader=nil, dest=nil) -> Net::HTTPResponse
  # --- patch(path, data, initheader=nil, dest=nil) {|body_segment| ... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティに対し文字列 data を
  # PATCH リクエストで送ります。
  # 
  # 返り値は [[c:Net::HTTPResponse]] のインスタンスです。
  # 
  # ブロックと一緒に呼びだされたときはエンティティボディを少しずつ文字列として
  # ブロックに与えます。このとき戻り値の HTTPResponse オブジェクトは有効な body を
  # 持ちません。
  # 
  # 
  # Dest は時代遅れの引数です。利用しないでください。
  # dest を指定した場合には
  # ボディを少しずつ取得して順次
  # 「dest << ボディの断片」を実行します。
  # 
  # @param path POST先のパスを文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # @param dest 利用しないでください。
  def patch; end

  # --- peer_cert -> OpenSSL::X509::Certificate | nil
  # サーバの証明書を返します。
  # 
  # SSL/TLS が有効でなかったり、接続前である場合には nil
  # を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLSocket#peer_cert]]
  def peer_cert; end

  # --- port -> Integer
  # 
  # 接続するポート番号を返します。
  def port; end

  # --- post(path, data, header = nil, dest = nil) -> Net::HTTPResponse
  # --- post(path, data, header = nil, dest = nil) {|body_segment| .... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティに対し文字列 data を
  # POST で送ります。
  # 
  # 返り値は [[c:Net::HTTPResponse]] のインスタンスです。
  # 
  # ブロックと一緒に呼びだされたときはエンティティボディを少しずつ文字列として
  # ブロックに与えます。このとき戻り値の HTTPResponse オブジェクトは有効な body を
  # 持ちません。
  # 
  # POST する場合にはヘッダに Content-Type: を指定する必要があります。
  # もし header に指定しなかったならば、 Content-Type として
  # "application/x-www-form-urlencoded" を用います。
  # 
  # dest は時代遅れの引数です。利用しないでください。
  # dest を指定した場合には
  # ボディを少しずつ取得して順次
  # 「dest << ボディの断片」を実行します。
  # 
  # @param path POST先のパスを文字列で指定します。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # @param dest 利用しないでください。
  # 
  # 1.1 互換モードの場合は、レスポンスに応じて例外が発生します。
  # また、返り値が [レスポンスオブジェクト, そのボディ] となります。
  # 
  # 例:
  #   # net/http version 1.1
  #   response, body = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  #   
  #   # version 1.2
  #   response = http.post('/cgi-bin/search.rb', 'query=subject&target=ruby')
  #   
  #   # using block
  #   File.open('save.html', 'w') {|f|
  #     http.post('/cgi-bin/search.rb', 'query=subject&target=ruby') do |str|
  #       f.write str
  #     end
  #   }
  # 
  # @see [[m:Net::HTTP#request_post]]
  def post; end

  # --- request_post(path, data, header = nil) -> Net::HTTPResponse
  # --- request_post(path, data, header = nil) {|response| .... } -> Net::HTTPResponse
  # --- post2(path, data, header = nil) -> Net::HTTPResponse
  # --- post2(path, data, header = nil) {|response| .... } -> Net::HTTPResponse
  # 
  # サーバ上の path にあるエンティティに対し文字列 data を
  # POST で送ります。
  # 返り値は [[c:Net::HTTPResponse]] のインスタンスです。
  # 
  # header が nil
  # でなければ、リクエストを送るときにその内容を HTTP ヘッダとして
  # 送ります。 header は { 'Accept' = > '*/*', ... } という
  # 形のハッシュでなければいけません。
  # 
  # ブロックとともに呼び出されたときは、
  # エンティティボディをソケットから読み出す前に、
  # 接続を維持した状態で [[c:Net::HTTPResponse]]
  # オブジェクトをブロックに渡します。
  # 
  # POST する場合にはヘッダに Content-Type: を指定する必要があります。
  # もし header に指定しなかったならば、 Content-Type として
  # "application/x-www-form-urlencoded" を用います。
  # 
  # @param path POST先のエンティティのパスを文字列で指定します。
  # @param data POSTするデータを与えます。
  # @param header リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  # post2 は時代遅れなので使わないでください。
  # 
  #   # 例
  #   response = http.request_post('/cgi-bin/nice.rb', 'datadatadata...')
  #   p response.status
  #   puts response.body          # body is already read
  #   
  #   # using block
  #   http.request_post('/cgi-bin/nice.rb', 'datadatadata...') {|response|
  #     p response.status
  #     p response['content-type']
  #     response.read_body do |str|   # read body now
  #       print str
  #     end
  #   }
  # 
  # @see [[m:Net::HTTP#post]], [[m:Net::HTTPResponse#read_body]]
  def post2; end

  # --- propfind(path, body, initheader = {'Depth' => '0'}) -> Net::HTTPResponse
  # サーバの path に PROPFIND リクエストを
  # ヘッダを initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Propfind]]
  def propfind; end

  # --- proppatch(path, body, initheader = nil) -> Net::HTTPResponse
  # サーバの path に PROPPATCH リクエストを
  # ヘッダを initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Proppatch]]
  def proppatch; end

  # --- proxy? -> bool
  # 
  # プロクシを介して接続するなら真を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy?; end

  # --- proxy_address -> String|nil
  # --- proxyaddr -> String|nil
  # 
  # プロクシ経由で接続する HTTP オブジェクトならプロクシのアドレス
  # を返します。
  # 
  # そうでないなら nil を返します。
  # 
  # proxyaddr は時代遅れのメソッドです。
  # 
  # @see [[m:Net::HTTP#proxy_address=]], [[m:Net::HTTP#proxy_port]], [[m:Net::HTTP.new]]
  def proxy_address; end

  # --- proxy_address=(address)
  # 
  # プロクシのアドレス(ホスト名、IPアドレス)を指定します。
  # 
  # [[m:Net::HTTP#start]] で接続する前に設定する必要があります。
  # 
  # @param address プロクシのホスト名、もしくはIPアドレスを表す文字列
  # 
  # @see [[m:Net::HTTP#proxy_address=]], [[m:Net::HTTP#proxy_port]], [[m:Net::HTTP.new]]
  def proxy_address=; end

  # --- proxy_from_env=(boolean)
  # 
  # プロクシ情報を環境変数から得るかどうかを指定します。
  # 
  # [[m:Net::HTTP#start]] で接続する前に設定する必要があります。
  # 
  # @param boolean プロクシ情報を環境変数から得るかどうかを指定する真偽値
  # 
  # @see [[m:Net::HTTP#proxy_from_env?]] 
  def proxy_from_env=; end

  # --- proxy_from_env? -> bool
  # 
  # プロクシ情報を環境変数から得る場合に true を返します。
  # 
  # 基本的に [[m:Net::HTTP.new]] や [[m:Net::HTTP.start]] の proxy_address
  # 引数に :ENV を渡した場合に true になります。
  # 
  # 環境変数 http_proxy が定義されていなくともこの値は true を返します。
  # その場合にはプロクシは利用されず直接サーバに接続します。
  # 
  # @see [[m:Net::HTTP#proxy_from_env=]] 
  def proxy_from_env?; end

  # --- proxy_pass -> String|nil
  # プロクシ経由で接続し、さらにプロクシのユーザ認証を
  # する HTTP オブジェクトなら認証のパスワードを
  # を返します。
  # 
  # そうでないなら nil を返します。
  # @see [[m:Net::HTTP#proxy_pass=]], [[m:Net::HTTP#proxy_user]], [[m:Net::HTTP.new]]
  def proxy_pass; end

  # --- proxy_pass=(pass)
  # プロクシのユーザ認証のパスワードを設定します。
  # 
  # [[m:Net::HTTP#start]] で接続する前に設定する必要があります。
  # 
  # @param pass パスワード文字列
  # @see [[m:Net::HTTP#proxy_pass]], [[m:Net::HTTP#proxy_user]], [[m:Net::HTTP.new]]
  def proxy_pass=; end

  # --- proxy_port -> Integer|nil
  # --- proxyport -> Integer|nil
  # 
  # プロクシのポート番号を返します。
  # 
  # プロクシを使わない場合は nil を返します。
  # 
  # proxyport は時代遅れのメソッドです。
  # 
  # @see [[m:Net::HTTP#proxy_port=]], [[m:Net::HTTP#proxy_address]], [[m:Net::HTTP.new]]
  def proxy_port; end

  # --- proxy_port=(port)
  # 
  # プロクシのポート番号を設定します。
  # 
  # [[m:Net::HTTP#start]] で接続する前に設定する必要があります。
  # 
  # @param port ポート番号(整数、文字列)
  # @see [[m:Net::HTTP#proxy_port]], [[m:Net::HTTP#proxy_address]], [[m:Net::HTTP.new]]
  def proxy_port=; end

  # --- proxy_uri -> String|nil
  # 
  # このメソッドは内部用なので使わないでください。
  # 
  # 環境変数 http_proxy から得られるプロクシの URI を返します。
  def proxy_uri; end

  # --- proxy_user -> String|nil
  # プロクシ経由で接続し、さらにプロクシのユーザ認証を
  # する HTTP オブジェクトなら認証のユーザ名を
  # を返します。
  # 
  # そうでないなら nil を返します。
  # 
  # @see [[m:Net::HTTP#proxy_pass]], [[m:Net::HTTP#proxy_user=]], [[m:Net::HTTP.new]]
  def proxy_user; end

  # --- proxy_user=(user)
  # プロクシのユーザ認証のユーザ名を設定します。
  # 
  # [[m:Net::HTTP#start]] で接続する前に設定する必要があります。
  # 
  # @param user ユーザ名文字列
  # @see [[m:Net::HTTP#proxy_pass]], [[m:Net::HTTP#proxy_user]], [[m:Net::HTTP.new]]
  def proxy_user=; end

  # --- put(path, data, initheader = nil) -> Net::HTTPResponse
  # サーバ上の path にあるエンティティに対し文字列 data を
  # PUT で送ります。
  # 
  # 返り値は [[c:Net::HTTPResponse]] のインスタンスです。
  # 
  # @param path 取得するエンティティのパスを文字列で指定します。
  # @param data 送るデータを文字列で指定します。
  # @param initheader リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  # @see [[m:Net::HTTP#request_put]]
  # 
  # 1.1 互換モードの場合は、レスポンスに応じて例外が発生します。
  def put; end

  # --- request_put(path, data, initheader = nil) -> Net::HTTPResponse
  # --- request_put(path, data, initheader = nil) {|response| .... } -> Net::HTTPResponse
  # --- put2(path, data, initheader = nil) -> Net::HTTPResponse
  # --- put2(path, data, initheader = nil) {|response| .... } -> Net::HTTPResponse
  # サーバ上の path にあるエンティティに対し文字列 data を
  # PUT で送ります。
  # 
  # 返り値は [[c:Net::HTTPResponse]] のインスタンスです。
  # 
  # ブロックとともに呼び出されたときは、
  # ボディをソケットから読み出す前に、
  # 接続を維持した状態で [[c:Net::HTTPResponse]]
  # オブジェクトをブロックに渡します。
  # 
  # @param path 取得するエンティティのパスを文字列で指定します。
  # @param data 送るデータを文字列で指定します。
  # @param initheader リクエストの HTTP ヘッダをハッシュで指定します。
  # 
  # put2 は時代遅れなので使わないでください。
  # 
  # @see [[m:Net::HTTP#put]]
  def put2; end

  # --- read_timeout -> Integer|nil
  # 読みこみ([[man:read(2)]]) 一回でブロックしてよい最大秒数
  # を返します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:Net::ReadTimeout]]
  # を発生します。
  # 
  # nilはタイムアウトしないことを意味します。
  # 
  # デフォルトは 60 (秒)です。
  # 
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout=]]
  def read_timeout; end

  # --- read_timeout=(seconds)
  # 
  # 読みこみ([[man:read(2)]]) 一回でブロックしてよい最大秒数を
  # 設定します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:Net::ReadTimeout]]
  # を発生します。
  # 
  # nilを設定するとタイムアウトしなくなります。
  # 
  # このタイムアウト秒数はサーバとやりとりするメソッドで有効です。
  # 
  # デフォルトは 60 (秒)です。
  # 
  # @param second 待つ秒数を指定します。
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout]]
  def read_timeout=; end

  # --- request(request, data = nil) -> Net::HTTPResponse
  # --- request(request, data = nil) {|response| .... } -> Net::HTTPResponse
  # 
  # [[c:Net::HTTPRequest]] オブジェクト request をサーバに送信します。
  # 
  # POST/PUT の時は data も与えられます 
  # (GET/HEAD などで  data を与えると 
  # [[c:ArgumentError]] を発生します)。
  # 
  # ブロックとともに呼びだされたときは
  # ソケットからボディを読みこまずに [[c:Net::HTTPResponse]]
  # オブジェクトをブロックに与えます。
  # 
  # @param request リクエストオブジェクトを与えます。
  # @param data リクエストのボディを文字列で与えます。
  # 
  # @raise ArgumentError dataを与えるべきでないリクエストでdataを
  #                      与えた場合に発生します。
  # @see [[m:Net::HTTP#send_request]]
  def request; end

  # --- send_request(name, path, data = nil, header = nil) -> Net::HTTPResponse
  # HTTP リクエストをサーバに送り、そのレスポンスを
  # [[c:Net::HTTPResponse]] のインスタンスとして返します。
  # 
  # @param name リクエストのメソッド名を文字列で与えます。
  # @param path リクエストのパスを文字列で与えます。
  # @param data リクエストのボディを文字列で与えます。
  # @param header リクエストのヘッダをハッシュで与えます。
  # 
  #   response = http.send_request('GET', '/index.html')
  #   puts response.body
  # 
  # @see [[m:Net::HTTP#request]]
  def send_request; end

  # --- set_debug_output(io) -> ()
  # 
  # デバッグ出力の出力先を指定します。
  # このメソッドは深刻なセキュリティホールの原因
  # になるため、デバッグ以外では決して使わないでください。
  # 
  # io に nil を指定するとデバッグ出力を止めます。
  # 
  # @param io 出力先を指定します。このオブジェクトは 
  #           メソッド << を持っている必要があります。
  # 
  #   http.set_debug_output($stderr)
  def set_debug_output; end

  # --- ssl_timeout -> Integer | nil
  # SSL/TLS のタイムアウト秒数を返します。
  # 
  # 設定されていない場合は nil を返します。
  # 
  # @see [[m:Net::HTTP#ssl_timeout=]],
  #      [[m:OpenSSL::SSL::SSLContext#ssl_timeout]]
  def ssl_timeout; end

  # --- ssl_timeout=(sec)
  # 
  # SSL/TLS のタイムアウト秒数を設定します。
  # 
  # HTTP セッション開始時([[m:Net::HTTP#start]] など)に
  # [[m:OpenSSL::SSL::SSLContext#ssl_timeout=]] で
  # タイムアウトを設定します。
  # 
  # デフォルト値は [[m:OpenSSL::SSL::SSLContext#ssl_timeout=]] と
  # 同じで、OpenSSL のデフォルト値(300秒)を用います。
  # 
  # @param sec タイムアウト秒数
  # @see [[m:Net::HTTP#ssl_timeout]],
  #      [[m:OpenSSL::SSL::SSLContext#ssl_timeout=]]
  def ssl_timeout=; end

  # --- ssl_version -> String | Symbol | nil
  # 利用するプロトコルの種類を返します。
  # 
  # @see [[m:Net::HTTP#ssl_version=]]
  def ssl_version; end

  # --- ssl_version=(ver)
  # 利用するプロトコルの種類を指定します。
  # 
  # [[m:OpenSSL::SSL::SSLContext.new]] で指定できるものと同じです。
  # 
  # @param ver 利用するプロトコルの種類(文字列 or シンボル)
  # @see [[m:Net::HTTP#ssl_version]], [[m:OpenSSL::SSL::SSL#ssl_version=]]
  def ssl_version=; end

  # --- start -> self
  # --- start {|http| .... } -> object
  # 
  # TCP コネクションを張り、HTTP セッションを開始します。
  # すでにセッションが開始していたら例外 IOError を発生します。
  # 
  # ブロックを与えた場合には自分自身をそのブロックに
  # 渡し、ブロックが終わったときに接続を閉じます。このときは
  # ブロックの値を返り値とします。
  # 
  # ブロックを与えなかった場合には自分自身を返します。
  # 利用後にはこのオブジェクトを [[m:Net::HTTP#finish]] してください。
  # 
  # @raise IOError すでにセッションが開始していた場合に発生します。
  # @raise Net::OpenTimeout 接続がタイムアウトしたときに発生します
  def start; end

  # --- trace(path, initheader = nil) -> Net::HTTPResponse
  # サーバの path に TRACE リクエストを
  # ヘッダを initheader として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # 
  # @see [[c:Net::HTTP::Trace]]
  def trace; end

  # --- unlock(path, body, initheader = nil) -> Net::HTTPResponse
  # サーバの path に UNLOCK リクエストを
  # ヘッダを initheader, ボディを body として送ります。
  # 
  # レスポンスを [[c:Net::HTTPResponse]] のオブジェクト
  # で返します。
  # 
  # @param path リクエストを送るパスを文字列で与えます。
  # @param body リクエストのボディを文字列で与えます。
  # @param initheader リクエストのヘッダを「文字列=>文字列」の
  #                   ハッシュで与えます。
  # @see [[c:Net::HTTP::Unlock]]
  def unlock; end

  # --- use_ssl=(bool)
  # HTTP で SSL/TLS を使うかどうかを設定します。
  # 
  # HTTPS 使う場合は true を設定します。
  # セッションを開始する前に設定をしなければなりません。
  # 
  # デフォルトでは false です。
  # つまり SSL/TLS を有効にするには必ず use_ssl = true を呼ぶ必要があります。
  # 
  # @param bool SSL/TLS を利用するかどうか
  # @raise IOError セッション開始後に設定を変更しようとすると発生します
  def use_ssl=; end

  # --- use_ssl? -> bool
  # SSLを利用して接続する場合に真を返します。
  # 
  # @see [[lib:net/https]], [[lib:openssl]] 
  def use_ssl?; end

  # --- verify_callback -> Proc
  # 自身に設定されている検証をフィルタするコールバックを
  # 返します。
  # 
  # デフォルトのコールバックが設定されている場合には nil を返します。
  # 
  # @see [[m:Net::HTTP#verify_callback=]],
  #      [[m:OpenSSL::X509::Store#verify_callback]],
  #      [[m:OpenSSL::SSL::SSLContext#verify_callback]]
  def verify_callback; end

  # --- verify_callback=(proc)
  # 検証をフィルタするコールバックを設定します。
  # 
  # 詳しくは [[m:OpenSSL::X509::Store#verify_callback=]] や
  # [[m:OpenSSL::SSL::SSLContext#verify_callback=]] を見てください。
  # 
  # @param proc 設定する [[c:Proc]] オブジェクト
  # @see [[m:Net::HTTP#verify_callback]],
  #      [[m:OpenSSL::X509::Store#verify_callback=]],
  #      [[m:OpenSSL::SSL::SSLContext#verify_callback=]]
  def verify_callback=; end

  # --- verify_depth -> Integer
  # 証明書チェイン上の検証する最大の深さを返します。
  # 
  # @see [[m:Net::HTTP#verify_depth=]], [[m:OpenSSL::SSL::SSLContext#verify_depth]]
  def verify_depth; end

  # --- verify_depth=(depth)
  # 証明書チェイン上の検証する最大の深さを設定します。
  # 
  # デフォルトは nil で、この場合 OpenSSL のデフォルト値(9)が使われます。
  # 
  # @param depth 最大深さを表す整数
  # @see [[m:Net::HTTP#verify_depth]], [[m:OpenSSL::SSL::SSLContext#verify_depth=]]
  def verify_depth=; end

  # --- verify_mode -> Integer | nil
  # 検証モードを返します。
  # 
  # デフォルトは nil です。
  def verify_mode; end

  # --- verify_mode=(mode)
  # 検証モードを設定します。
  # 
  # 詳しくは [[m:OpenSSL::SSL::SSLContext#verify_mode]] を見てください。
  # クライアント側なので、
  # [[m:OpenSSL::SSL::VERIFY_NONE]] か [[m:OpenSSL::SSL::VERIFY_PEER]]
  # のいずれかを用います。
  # 
  # デフォルトは nil で、VERIFY_NONE を意味します。
  def verify_mode=; end

  # --- write_timeout -> Numeric|nil
  # 書き込み([[man:write(2)]]) 一回でブロックしてよい最大秒数
  # を返します。
  # 
  # この秒数たっても書き込めなければ例外 [[c:Net::WriteTimeout]]
  # を発生します。
  # 
  # Windows では Net::WriteTimeout は発生しません。
  # 
  # デフォルトは 60 (秒)です。
  # 
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#write_timeout=]]
  def write_timeout; end

  # --- write_timeout=(seconds)
  # 
  # 書き込み([[man:write(2)]]) 一回でブロックしてよい最大秒数を
  # 設定します。
  # 
  # Float や Rational も設定できます。
  # 
  # この秒数たっても書き込めなければ例外 [[c:Net::WriteTimeout]]
  # を発生します。
  # 
  # Windows では Net::WriteTimeout は発生しません。
  # 
  # デフォルトは 60 (秒)です。
  # 
  # @param second 待つ秒数を指定します。
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#write_timeout]]
  def write_timeout=; end

  # --- Proxy(address, port = 80) -> Class
  # 
  # Proxy 経由で http サーバに接続するためのクラスを作成し返します。
  # 
  # このクラスは Net::HTTP を継承しているので Net::HTTP と全く
  # 同じように使えます。指定されたプロクシを常に経由して http サーバ
  # に接続します。
  # 
  # address が nil のときは Net::HTTP クラスをそのまま返します。
  # 
  # 例1: [[m:Net::HTTP.new]] を使う
  #   require 'net/http'
  #   proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  #   http = proxy_class.new('www.example.org')
  #   http.start {|h|
  #     h.get('/ja/') # proxy.example.com 経由で接続します。
  #   }
  # 例2: [[m:Net::HTTP.start]] を使う
  #   require 'net/http'
  #   proxy_class = Net::HTTP::Proxy('proxy.example.com', 8080)
  #   proxy_class.start('www.example.org') {|h|
  #     h.get('/ja/') # proxy.example.com 経由で接続します。
  #   }
  # 
  # @param address プロクシのホスト名を文字列で与えます。
  # @param port プロクシのポート番号を与えます。
  def Proxy; end

  # --- http_default_port -> Integer
  # --- default_port -> Integer
  # HTTP のデフォルトポート (80) を返します。
  def default_port; end

  # --- get(uri) -> String
  # --- get(host, path, port = 80) -> String
  # 指定した対象に GET リクエストを送り、そのボディを
  # 文字列として返します。
  # 
  # 対象の指定方法は [[c:URI]] で指定するか、
  # (host, path, port) で指定するかのいずれかです。
  # 
  # @param uri データの取得対象を [[c:URI]] で指定します。
  # @param host 接続先のホストを文字列で指定します。
  # @param path データの存在するパスを文字列で指定します。
  # @param port 接続するポートを整数で指定します。
  # @see [[m:Net::HTTP#get]]
  def get; end

  # --- get_print(uri) -> ()
  # --- get_print(host, path, port = 80) -> ()
  # 指定した対象から HTTP でエンティティボディを取得し、
  # [[m:$stdout]] に出力します。
  # 
  # 対象の指定方法は [[c:URI]] で指定するか、
  # (host, path, port) で指定するかのいずれかです。
  # 
  # @param uri データの取得対象を [[c:URI]] で指定します。
  # @param host 接続先のホストを文字列で指定します。
  # @param path データの存在するパスを文字列で指定します。
  # @param port 接続するポートを整数で指定します。
  # @see [[m:Net::HTTP.get]]
  # 
  # === 例
  #   require 'net/http'
  #   require 'uri'
  #   Net::HTTP.get_print URI.parse('http://www.example.com/index.html')
  # もしくは
  #   require 'net/http'
  #   Net::HTTP.get_print 'www.example.com', '/index.html'
  def get_print; end

  # --- get_response(uri) -> Net::HTTPResponse
  # --- get_response(host, path = nil, port = nil) -> Net::HTTPResponse
  # 指定した対象に GET リクエストを送り、そのレスポンスを
  # [[c:Net::HTTPResponse]] として返します。
  # 
  # 対象の指定方法は [[c:URI]] で指定するか、
  # (host, path, port) で指定するかのいずれかです。
  # 
  # @param uri データの取得対象を [[c:URI]] で指定します。
  # @param host 接続先のホストを文字列で指定します。
  # @param path データの存在するパスを文字列で指定します。
  # @param port 接続するポートを整数で指定します。
  # @see [[m:Net::HTTP#get]]
  def get_response; end

  # --- https_default_port -> Integer
  # HTTPS のデフォルトポート (443) を返します。
  def https_default_port; end

  # --- version_1_1? -> false
  # --- is_version_1_1? -> false
  # 何もしません。互換性のために残されており、常に false を返します。
  # 
  # @see [[m:Net::HTTP.version_1_2]], [[m:Net::HTTP.version_1_2?]]
  def is_version_1_1?; end

  # --- version_1_2? -> true
  # --- is_version_1_2? -> true
  # 何もしません。互換性のために残されており、常に true を返します。
  # 
  # @see [[m:Net::HTTP.version_1_2]], [[m:Net::HTTP.version_1_1?]]
  def is_version_1_2?; end

  # --- new(address, port = 80, proxy_addr = :ENV, proxy_port = nil, proxy_user=nil, proxy_pass=nil, no_proxy=nil) -> Net::HTTP
  # 
  # 新しい [[c:Net::HTTP]] オブジェクトを生成します。
  # 
  # proxy_addr に :ENV を指定すると自動的に環境変数 http_proxy からプロクシの URI を
  # 取り出し利用します。この場合環境変数 http_proxy が定義されていない場合には
  # プロクシは利用せず直接接続します。
  # 詳しくは [[m:URI::Generic#find_proxy]] を参照してください。
  # 
  # 明示的にプロクシのホスト名とポート番号を指定してプロクシを利用することもできます。
  # このときには proxy_addr にホスト名もしくは IP アドレスを渡します。
  # このときに proxy_userを指定するとプロクシの認証が行われます。
  # no_proxy の文字列に address のホスト名やIPアドレスが含まれている場合はプロクシを利用せず
  # 直接接続します。
  # 
  # このメソッドは TCP コネクションを張りません。
  # 
  # 
  # @param address 接続するホスト名を文字列で指定します。
  # @param port 接続するポート番号を指定します。
  # @param proxy_addr プロクシのホスト名もしくはアドレスを文字列で指定します。:ENV を指定すると環境変数 http_proxy を利用してプロクシの設定をします。省略した場合には直接接続します。
  # @param proxy_port プロクシのポートを指定します。
  # @param proxy_user プロクシの認証のユーザ名を指定します。省略した場合には認証はなされません。
  # @param proxy_pass プロクシの認証のパスワードを指定します。
  # @param no_proxy プロクシを経由せずに接続するホストの名前/IPアドレスを文字列で指定します。
  def new; end

  # --- post_form(uri, params) -> Net::HTTPResponse
  # [[c:URI]] で指定した対象に フォームのデータを HTTP で 
  # POST します。
  # 
  # 送るデータは params に文字列から文字列への [[c:Hash]] として
  # 渡します。
  # 
  # @param uri POST する対象を [[c:URI]] で指定します。
  # @param params POST するデータです。
  def post_form; end

  # --- proxy_address -> String|nil
  # 自身が ([[m:Net::HTTP.Proxy]] によって作成された) 
  # プロクシ用のクラスならばプロクシのアドレスを返します。
  # 
  # そうでなければ nil を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy_address; end

  # --- proxy_class? -> bool
  # 
  # 自身が ([[m:Net::HTTP.Proxy]] によって作成された) プロクシ用のクラスならば真を返し、そうでなければ偽を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy_class?; end

  # --- proxy_pass -> String|nil
  # 自身が ([[m:Net::HTTP.Proxy]] によって作成された) 
  # プロクシ用のクラスならばプロクシ認証のパスワードを返します。
  # 
  # そうでなければ nil を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy_pass; end

  # --- proxy_port -> Integer|nil
  # 自身が ([[m:Net::HTTP.Proxy]] によって作成された) 
  # プロクシ用のクラスならばプロクシのポート番号を返します。
  # 
  # そうでなければ nil を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy_port; end

  # --- proxy_user -> String|nil
  # 自身が ([[m:Net::HTTP.Proxy]] によって作成された) 
  # プロクシ用のクラスで、かつプロクシの認証を利用する場合は
  # プロクシ認証のユーザ名を返します。
  # 
  # そうでなければ nil を返します。
  # 
  # @see [[m:Net::HTTP.Proxy]]
  def proxy_user; end

  # --- start(address, port = 80, proxy_addr = :ENV, proxy_port = nil, proxy_user=nil, proxy_pass=nil) -> Net::HTTP
  # --- start(address, port = 80, proxy_addr = :ENV, proxy_port = nil, proxy_user=nil, proxy_pass=nil) {|http| .... } -> object
  # 
  # 新しい [[c:Net::HTTP]] オブジェクトを生成し、
  # TCP コネクション、 HTTP セッションを開始します。
  # 
  # ブロックを与えた場合には生成したオブジェクトをそのブロックに
  # 渡し、ブロックが終わったときに接続を閉じます。このときは
  # ブロックの値を返り値とします。
  # 
  # ブロックを与えなかった場合には生成したオブジェクトを渡します。
  # 利用後にはこのオブジェクトを [[m:Net::HTTP#finish]] してください。
  # 
  # proxy_addr に :ENV を指定すると環境変数 http_proxy からプロクシの URI を
  # 取り出し利用します。環境変数 http_proxy が定義されていない場合には
  # プロクシは利用しません。
  # 
  # このメソッドは以下と同じです。
  # 
  #   require 'net/http'
  #   Net::HTTP.new(address, port, proxy_addr, proxy_port, proxy_user, proxy_pass).start(&block)
  # 
  # @param address 接続するホスト名を文字列で指定します。
  # @param port 接続するポート番号を指定します。
  # @param proxy_addr プロクシのホスト名もしくはアドレスを文字列で指定します。:ENV を指定すると環境変数 http_proxy を利用してプロクシの設定をします。省略した場合には直接接続します。
  # @param proxy_port プロクシのポートを指定します。
  # @param proxy_user プロクシの認証のユーザ名を指定します。省略した場合には認証はなされません。
  # @param proxy_pass プロクシの認証のパスワードを指定します。
  # @raise Net::OpenTimeout 接続がタイムアウトしたときに発生します
  # @see [[m:Net::HTTP.new]], [[m:Net::HTTP#start]]
  def start; end

  # --- version_1_2 -> true
  # 何もしません。互換性のために残されており、常に true を返します。
  # 
  # @see [[m:Net::HTTP.version_1_1?]], [[m:Net::HTTP.version_1_2?]]
  def version_1_2; end

end
