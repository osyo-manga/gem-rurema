class CGI
  # --- accept_charset -> String
  # 
  # 受けとることができるキャラクタセットを文字列で返します。
  # デフォルトは UTF-8 です。
  # 
  # @see [[m:CGI.accept_charset]], [[m:CGI.accept_charset=]]
  def accept_charset; end

  # --- header(options = "text/html") -> String
  # 
  # HTTP ヘッダを options に従って生成します。 [[m:CGI#out]] と違い、標準出力には出力しません。
  # [[m:CGI#out]] を使わずに自力で HTML を出力したい場合などに使います。
  # このメソッドは文字列エンコーディングを変換しません。
  # 
  # ヘッダのキーとしては以下が利用可能です。
  # 
  # : type
  #   Content-Type ヘッダです。デフォルトは "text/html" です。
  # : charset
  #   ボディのキャラクタセットを Content-Type ヘッダに追加します。
  # : nph
  #   真偽値を指定します。真ならば、HTTP のバージョン、ステータスコード、
  #   Date ヘッダをセットします。また Server と Connection の各ヘッダにもデフォルト値をセットします。
  #   偽を指定する場合は、これらの値を明示的にセットしてください。
  # : status
  #   HTTP のステータスコードを指定します。
  #   このリストの下に利用可能なステータスコードのリストがあります。
  # : server
  #   サーバソフトウェアの名称指定します。Server ヘッダに対応します。
  # : connection
  #   接続の種類を指定します。Connection ヘッダに対応します。
  # : length
  #   送信するコンテンツの長さを指定します。Content-Length ヘッダに対応します。
  # : language
  #   送信するコンテンツの言語を指定します。Content-Language ヘッダに対応します。
  # : expires
  #   送信するコンテンツの有効期限を [[c:Time]] のインスタンスで指定します。
  #   Expires ヘッダに対応します。
  # : cookie
  #   クッキーとして文字列か [[c:CGI::Cookie]] のインスタンス、またはそれらの配列かハッシュを指定します。
  #   一つ以上の Set-Cookie ヘッダに対応します。
  # 
  # status パラメータには以下の文字列が使えます。
  # 
  #         "OK"                  --> "200 OK"
  #         "PARTIAL_CONTENT"     --> "206 Partial Content"
  #         "MULTIPLE_CHOICES"    --> "300 Multiple Choices"
  #         "MOVED"               --> "301 Moved Permanently"
  #         "REDIRECT"            --> "302 Found"
  #         "NOT_MODIFIED"        --> "304 Not Modified"
  #         "BAD_REQUEST"         --> "400 Bad Request"
  #         "AUTH_REQUIRED"       --> "401 Authorization Required"
  #         "FORBIDDEN"           --> "403 Forbidden"
  #         "NOT_FOUND"           --> "404 Not Found"
  #         "METHOD_NOT_ALLOWED"  --> "405 Method Not Allowed"
  #         "NOT_ACCEPTABLE"      --> "406 Not Acceptable"
  #         "LENGTH_REQUIRED"     --> "411 Length Required"
  #         "PRECONDITION_FAILED" --> "412 Rrecondition Failed"
  #         "SERVER_ERROR"        --> "500 Internal Server Error"
  #         "NOT_IMPLEMENTED"     --> "501 Method Not Implemented"
  #         "BAD_GATEWAY"         --> "502 Bad Gateway"
  #         "VARIANT_ALSO_VARIES" --> "506 Variant Also Negotiates"
  # 
  # @param options [[c:Hash]] か文字列で HTTP ヘッダを生成するための情報を指定します。
  # 
  # 例：
  #         header
  #           # Content-Type: text/html
  # 
  #         header("text/plain")
  #           # Content-Type: text/plain
  # 
  #         header({"nph"        => true,
  #                 "status"     => "OK",  # == "200 OK"
  #                   # "status"     => "200 GOOD",
  #                 "server"     => ENV['SERVER_SOFTWARE'],
  #                 "connection" => "close",
  #                 "type"       => "text/html",
  #                 "charset"    => "iso-2022-jp",
  #                   # Content-Type: text/html; charset=iso-2022-jp
  #                 "language"   => "ja",
  #                 "expires"    => Time.now + 30,
  #                 "cookie"     => [cookie1, cookie2],
  #                 "my_header1" => "my_value",
  #                 "my_header2" => "my_value"})
  # 
  # 例：
  #         cgi = CGI.new('html3')
  #         print cgi.header({"charset" => "shift_jis", "status" => "OK"})
  #         print "<html><head><title>TITLE</title></head>\r\n"
  #         print "<body>BODY</body></html>\r\n"
  # 
  # @see [[ruby-list:35911]]
  def header; end

  # --- nph? -> bool
  def nph?; end

  # --- out(options = "text/html") { .... }
  # 
  # HTTP ヘッダと、ブロックで与えられた文字列を標準出力に出力します。
  # 
  # HEADリクエスト (REQUEST_METHOD == "HEAD") の場合は HTTP ヘッダのみを出力します。
  # 
  # charset が "iso-2022-jp"・"euc-jp"・"shift_jis" のいずれかで
  # ある場合は文字列エンコーディングを自動変換し、language を "ja"にします。
  # 
  # @param options [[c:Hash]] か文字列で HTTP ヘッダを生成するための情報を指定します。
  # 
  # 例：
  #         cgi = CGI.new
  #         cgi.out{ "string" }
  #           # Content-Type: text/html
  #           # Content-Length: 6
  #           #
  #           # string
  # 
  #         cgi.out("text/plain"){ "string" }
  #           # Content-Type: text/plain
  #           # Content-Length: 6
  #           #
  #           # string
  # 
  #         cgi.out({"nph"        => true,
  #                  "status"     => "OK",  # == "200 OK"
  #                  "server"     => ENV['SERVER_SOFTWARE'],
  #                  "connection" => "close",
  #                  "type"       => "text/html",
  #                  "charset"    => "iso-2022-jp",
  #                    # Content-Type: text/html; charset=iso-2022-jp
  #                  "language"   => "ja",
  #                  "expires"    => Time.now + (3600 * 24 * 30),
  #                  "cookie"     => [cookie1, cookie2],
  #                  "my_header1" => "my_value",
  #                  "my_header2" => "my_value"}){ "string" }
  # 
  # @see [[m:CGI#header]]
  def out; end

  # --- print(*strings)
  # @todo
  # 
  # 引数の文字列を標準出力に出力します。
  # cgi.print は $DEFAULT_OUTPUT.print と等価です。
  # 
  # 例：
  #        cgi = CGI.new
  #        cgi.print "This line is a part of content body.\r\n"
  def print; end

  # --- accept_charset -> String
  # 
  # 受けとることができるキャラクタセットを文字列で返します。
  # デフォルトは UTF-8 です。
  def accept_charset; end

  # --- accept_charset=(charset)
  # 
  # 受けとることができるキャラクタセットを設定します。
  # 
  # @param charset 文字列でキャラクタセットの名前を指定します。
  # 
  # @see [[d:spec/m17n]]
  def accept_charset=; end

  # --- escape(string) -> String
  # 
  # 与えられた文字列を URL エンコードした文字列を新しく作成し返します。
  # 
  # @param string URL エンコードしたい文字列を指定します。
  # 
  # 例:
  #         require "cgi"
  # 
  #         p CGI.escape('@##')   #=> "%40%23%23"
  # 
  #         url = "http://www.example.com/register?url=" + 
  #           CGI.escape('http://www.example.com/index.rss')
  #         p url
  #         #=> "http://www.example.com/register?url=http%3A%2F%2Fwww.example.com%2Findex.rss"
  def escape; end

  # --- escapeElement(string, *elements) -> String
  # --- escape_element(string, *elements) -> String
  # 第二引数以降に指定したエレメントのタグだけを実体参照に置換します。
  # 
  # @param string 文字列を指定します。
  # 
  # @param elements HTML タグの名前を一つ以上指定します。文字列の配列で指定することも出来ます。
  # 
  # 例：
  #         require "cgi"
  # 
  #         p CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
  #              # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"
  # 
  #         p CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
  #              # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"
  def escapeElement; end

  # --- escapeHTML(string) -> String
  # --- escape_html(string) -> String
  # 
  # 与えられた文字列中の '、&、"、<、> を実体参照に置換した文字列を新しく作成し返します。
  # 
  # @param string 文字列を指定します。
  # 
  #         require "cgi"
  # 
  #         p CGI.escapeHTML("3 > 1")   #=> "3 &gt; 1"
  # 
  #         print('<script type="text/javascript">alert("警告")</script>')
  # 
  #         p CGI.escapeHTML('<script type="text/javascript">alert("警告")</script>')
  #         #=> "&lt;script type=&quot;text/javascript&quot;&gt;alert(&quot;警告&quot;)&lt;/script&gt;"
  def escapeHTML; end

  # --- parse(query) -> Hash
  # 
  # 与えられたクエリ文字列をパースします。
  # 
  # @param query クエリ文字列を指定します。
  # 
  # 例：
  #         require "cgi"
  # 
  #         params = CGI.parse("query_string")
  #           # {"name1" => ["value1", "value2", ...],
  #           #  "name2" => ["value1", "value2", ...], ... }
  def parse; end

  # --- pretty(string, shift = "  ") -> String
  # 
  # HTML を人間に見やすく整形した文字列を返します。
  # 
  # @param string HTML を指定します。
  # 
  # @param shift インデントに使用する文字列を指定します。デフォルトは半角空白二つです。
  # 
  # 例：
  #         require "cgi"
  # 
  #         print CGI.pretty("<HTML><BODY></BODY></HTML>")
  #           # <HTML>
  #           #   <BODY>
  #           #   </BODY>
  #           # </HTML>
  # 
  #         print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
  #           # <HTML>
  #           #         <BODY>
  #           #         </BODY>
  #           # </HTML>
  def pretty; end

  # --- rfc1123_date(time) -> String
  # 
  # 与えられた時刻を [[RFC:1123]] フォーマットに準拠した文字列に変換します。
  # 
  # @param time [[c:Time]] のインスタンスを指定します。
  # 
  # 例：
  #         require "cgi"
  # 
  #         CGI.rfc1123_date(Time.now)
  #           # => Sat, 1 Jan 2000 00:00:00 GMT
  def rfc1123_date; end

  # --- unescape(string) -> String
  # 
  # 与えられた文字列を URL デコードした文字列を新しく作成し返します。
  # 
  # @param string URL エンコードされている文字列を指定します。
  # 
  #         require "cgi"
  # 
  #         p CGI.unescape('%40%23%23')   #=> "@##"
  # 
  #         p CGI.unescape("http%3A%2F%2Fwww.example.com%2Findex.rss")
  #         #=> "http://www.example.com/index.rss"
  def unescape; end

  # --- unescapeElement(string, *elements) -> String
  # --- unescape_element(string, *elements) -> String
  # 
  # 特定の要素だけをHTMLエスケープから戻す。
  # 
  # @param string 文字列を指定します。
  # 
  # @param elements HTML タグの名前を一つ以上指定します。文字列の配列で指定することも出来ます。
  # 
  # 例：
  #         require "cgi"
  # 
  #         print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', "A", "IMG")
  #           # => "&lt;BR&gt;<A HREF="url"></A>"
  # 
  #         print CGI.unescapeElement('&lt;BR&gt;&lt;A HREF="url"&gt;&lt;/A&gt;', %w(A IMG))
  #           # => "&lt;BR&gt;<A HREF="url"></A>"
  def unescapeElement; end

  # --- unescapeHTML(string) -> String
  # --- unescape_html(string) -> String
  # 与えられた文字列中の実体参照のうち、&amp; &gt; &lt; &quot;
  # と数値指定がされているもの (&#0ffff など) を元の文字列に置換します。
  # 
  # @param string 文字列を指定します。
  # 
  #         require "cgi"
  # 
  #         p CGI.unescapeHTML("3 &gt; 1")   #=> "3 > 1"
  def unescapeHTML; end

  # --- CR -> String
  # 
  # キャリッジリターンを表す文字列です。
  def CR; end

  # --- EOL -> String
  # 
  # 改行文字です。
  def EOL; end

  # --- HTTP_STATUS -> Hash
  # 
  # HTTP のステータスコードを表すハッシュです。
  def HTTP_STATUS; end

  # --- LF -> String
  # 
  # ラインフィードを表す文字列です。
  def LF; end

  # --- MAX_MULTIPART_COUNT -> Integer
  # 
  # Maximum number of request parameters when multipart
  def MAX_MULTIPART_COUNT; end

  # --- MAX_MULTIPART_LENGTH -> Integer
  # 
  # Maximum content length of multipart data
  def MAX_MULTIPART_LENGTH; end

  # --- NEEDS_BINMODE -> bool
  # 
  # ファイルを開くときにバイナリモードが必要かどうかを表す定数です。
  # プラットフォーム依存の定数です。
  def NEEDS_BINMODE; end

  # --- PATH_SEPARATOR -> Hash
  # 
  # パスの区切り文字を格納します。
  def PATH_SEPARATOR; end

  # --- RFC822_DAYS -> [String]
  # 
  # [[rfc:822]] で定義されている曜日の略称を返します。
  # 
  # @see [[rfc:822]]
  def RFC822_DAYS; end

  # --- RFC822_MONTHS -> [String]
  # 
  # [[rfc:822]] で定義されている月名の略称を返します。
  # 
  # @see [[rfc:822]]
  def RFC822_MONTHS; end

  # --- TABLE_FOR_ESCAPE_HTML__ -> Hash
  # 
  # HTML 上でエスケープする文字列の変換テーブルを返します。
  # 
  #   {
  #     "'" => '&#39;',
  #     '&' => '&amp;',
  #     '"' => '&quot;',
  #     '<' => '&lt;',
  #     '>' => '&gt;',
  #   }
  def TABLE_FOR_ESCAPE_HTML__; end

end
