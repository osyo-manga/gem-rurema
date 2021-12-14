module OpenURI::Meta
  # --- base_uri    -> URI
  # 
  # リソースの実際の URI を URI オブジェクトとして返します。
  # リダイレクトされた場合は、リダイレクトされた後のデータが存在する URI を返します。
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://www.ruby-lang.org/') {|f|
  #   p f.base_uri
  #   #=> #<URI::HTTP:0xb7043aa0 URL:http://www.ruby-lang.org/en/>
  # }
  # //}
  def base_uri; end

  # --- charset       -> String | nil
  # --- charset{ ... }  -> String
  # 
  # 対象となるリソースの文字コードを文字列で返します。Content-Type ヘッダの文字コード情報が使われます。
  # 文字列は小文字へと変換されています。
  # 
  # Content-Type ヘッダがない場合は、nil を返します。ただし、ブロックが与えられている場合は、
  # その結果を返します。また対象となる URI のスキームが HTTP であり、自身のタイプが text である場合は、
  # [[RFC:2616]] 3.7.1 で定められているとおり、文字列 "iso-8859-1" を返します。
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open("http://www.ruby-lang.org/en") {|f|
  #   p f.content_type  # => "text/html"
  #   p f.charset       # => "iso-8859-1"
  # }
  # //}
  def charset; end

  # --- content_encoding    -> [String]
  # 
  # 対象となるリソースの Content-Encoding を文字列の配列として返します。
  # Content-Encoding ヘッダがない場合は、空の配列を返します。
  # 
  # 例:
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://example.com/f.tar.gz') {|f|
  #   p f.content_encoding  #=> ["x-gzip"]
  # }
  # //}
  def content_encoding; end

  # --- content_type    -> String
  # 
  # 対象となるリソースの Content-Type を文字列の配列で返します。Content-Type ヘッダの情報が使われます。
  # Content-Type ヘッダがない場合は、"application/octet-stream" を返します。
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://www.ruby-lang.org/') {|f|
  #   p f.content_type  #=> "text/html"
  # }
  # //}
  def content_type; end

  # --- last_modified    -> Time | nil
  # 
  # 対象となる URI の最終更新時刻を [[c:Time]] オブジェクトで返します。
  # Last-Modified ヘッダがない場合は nil を返します。
  # 
  # 例:
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://www.rubyist.net/') {|f|
  #   p f.last_modified
  #   #=> Thu Feb 26 16:54:58 +0900 2004
  # }
  # //}
  def last_modified; end

  # --- meta    -> Hash
  # 
  # ヘッダを収録したハッシュを返します。
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://example.com/') {|f|
  #   p f.meta
  #   #=> {"date"=>"Sun, 04 May 2008 11:26:40 GMT",
  #   #    "content-type"=>"text/html;charset=utf-8",
  #   #    "server"=>"Apache/2.0.54 (Debian GNU/Linux) mod_ssl/2.0.54 OpenSSL/0.9.7e",
  #   #    "transfer-encoding"=>"chunked"}
  # }
  # //}
  def meta; end

  # --- status    -> [String]
  # 
  # 対象となるリソースのステータスコードと reason phrase を文字列の配列として返します。
  # 
  # //emlist[例][ruby]{
  # require 'open-uri'
  # open('http://example.com/') {|f|
  #   p f.status  #=> ["200", "OK"]
  # }
  # //}
  def status; end

end
