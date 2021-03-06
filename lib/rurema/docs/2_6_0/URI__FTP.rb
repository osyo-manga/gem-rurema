class URI::FTP
  # --- typecode      -> String | nil
  # 
  # ファイル転送のタイプを文字列で返します。"a" はテキスト、"i" はバイナリ、"d" はディレクトリを表します。
  # 設定されていない場合は nil を返します。
  def typecode; end

  # --- typecode=(t)
  # 
  # ファイル転送のタイプを文字列で指定します。
  # 
  # @param t ファイル転送のタイプを文字列で指定します。"a" はテキスト、"i" はバイナリ、"d" はディレクトリを表します。
  # 
  # @raise URI::InvalidComponentError 不正な引数 s に対して発生します。
  def typecode=; end

  # --- build(ary)     -> URI::FTP
  # --- build(hash)    -> URI::FTP
  # 
  # 引数で与えられた URI 構成要素から URI::FTP オブジェクトを生成します。
  # 引数の正当性を検査します。
  # 
  # 例:
  #   require 'uri'
  #   p URI::FTP.build([nil, "www.example.com", 10020, "/path",  'a'])
  #   #=> #<URI::FTP:0x201c4f9c URL:ftp://www.example.com:10020/path;type=a>
  #   
  #   p URI::FTP.build({:host => "www.example.com", :path => "/path",  :typecode => 'a'})
  #   #=> #<URI::FTP:0x201bd9cc URL:ftp://www.example.com/path;type=a>
  #   
  #   p URI::FTP.build([nil, 'example.com', nil, '/foo', 'i']).to_s
  #   #=> 'ftp://example.com/%2Ffoo;type=i'
  # 
  # @param ary 構成要素を表す文字列の配列を与えます。要素は
  # //emlist{
  #       [userinfo, host, port, path, typecode]
  # //}
  #            の順です。typecode は、"a"、"i" あるいは "d" です。"a" はテキスト、"i" はバイナリ、
  #            "d" はディレクトリを表します。"a" がテキストで、"i" がバイナリなのは、それぞれの
  #            データタイプがFTPのプロトコルで ASCII と IMAGE と呼ばれていたためです。
  # 
  # @param hash 構成要素を表すハッシュを与えます。ハッシュのキーは
  # //emlist{
  #  :scheme, :userinfo, :host, :port, :path, :typecode
  # //}
  #             のいずれかです。ハッシュの値は文字列です。typecode は、
  #             "a"、"i" あるいは "d" です。"a" はテキスト、"i" はバイナリ、
  #             "d" はディレクトリを表します。"a" がテキストで、"i" がバイナリなのは、
  #             それぞれのデータタイプがFTPのプロトコルで ASCII と IMAGE と呼ばれていたためです。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  # 
  # @raise ArgumentError typecode に定められた以外の文字を与えると発生します。
  def build; end

  # --- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment, arg_check = false)    -> URI::FTP
  # 
  # 汎用的な構成要素から URI::FTP オブジェクトを生成します。build
  # と異なり、デフォルトでは引数の正当性を検査しません。
  # 
  # 例:
  #   require 'uri'
  #   p ftp = URI.parse("ftp://ftp.ruby-lang.org/pub/ruby/;type=d")
  #   p ftp.typecode
  #   #=> #<URI::FTP:0x2010029c URL:ftp://ftp.ruby-lang.org/pub/ruby/;type=d>
  #   #=> "d"
  # 
  # @param scheme 構成要素を表す文字列を与えます。
  # 
  # @param userinfo 構成要素を表す文字列を与えます。
  # 
  # @param host 構成要素を表す文字列を与えます。
  # 
  # @param port 構成要素を表す文字列を与えます。
  # 
  # @param registry nil を与えます。
  # 
  # @param path 構成要素を表す文字列を与えます。
  # 
  # @param opaque 構成要素を表す文字列を与えます。
  # 
  # @param query 構成要素を表す文字列を与えます。
  # 
  # @param fragment 構成要素を表す文字列を与えます。
  # 
  # @param arg_check 真が与えられた場合は、各引数が字句規則に適合しているか否かを検査します。適合しな い場合は例外 URI::InvalidComponentError が起ります。
  # 
  # @raise URI::InvalidURIError registry に nil 以外を与えた時に発生します。引数の正当性は、これ以外 デフォルトでは検査しません。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  def new; end

  # --- new2(user, password, host, port, path, typecode = nil, arg_check = true)    -> URI::FTP
  # 
  # URI::FTP オブジェクトを生成して返します。
  # 引数の正当性を検査します。
  # 
  # @param user 構成要素を表す文字列を与えます。
  # 
  # @param password 構成要素を表す文字列を与えます。
  # 
  # @param host 構成要素を表す文字列を与えます。
  # 
  # @param port 構成要素を表す文字列を与えます。
  # 
  # @param path 構成要素を表す文字列を与えます。
  # 
  # @param typecode 構成要素を表す文字列を与えます。
  # 
  # @param arg_check 真が与えられた場合は、各引数が字句規則に適合しているか否かを検査します。適合しない場合は例外 URI::InvalidComponentError が起ります。
  # 
  # @raise ArgumentError typecode が正当でなかった場合に発生します。
  # 
  # @raise URI::InvalidURIError 引数が invalid な場合に発生します。
  def new2; end

end
