module WEBrick::HTTPUtils
  # --- dequote(str) -> String
  # 
  # 与えられた文字列からダブルクオートとバックスラッシュを削除して返します。
  # 
  # @param str 文字列を指定します。
  def dequote; end

  # --- escape(str) -> String
  # 
  # 与えられた文字列を数値参照文字列に変換します。
  # 
  # 以下の正規表現を使用して変換します。
  # 
  #   control  = (0x0..0x1f).collect{|c| c.chr }.join + "\x7f"
  #   space    = " "
  #   delims   = '<>#%"'
  #   unwise   = '{}|\\^[]`'
  #   nonascii = (0x80..0xff).collect{|c| c.chr }.join
  #   /[#{Regexp.escape(control + space + delims + unwise + nonascii)}]/n
  # 
  # @param str 文字列を指定します。
  def escape; end

  # --- escape8bit(str) -> String
  # 
  # 与えられた文字列を数値参照文字列に変換します。
  # 
  # @param str 文字列を指定します。
  def escape8bit; end

  # --- escape_path(str) -> String
  # 
  # 与えられた文字列を数値参照文字列に変換します。
  # 
  # 以下の正規表現を使用して変換します。
  # 
  #   num      = '0123456789'
  #   lowalpha = 'abcdefghijklmnopqrstuvwxyz'
  #   upalpha  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  #   mark     = '-_.!~*\'()'
  #   unreserved = num + lowalpha + upalpha + mark
  #   /[^#{Regexp.escape(unreserved + ":@&=+$,")}]/n
  # 
  # @param str 文字列を指定します。
  def escape_path; end

  # --- load_mime_types(file)    -> Hash
  # 
  # Apache の mime.types ファイル形式の file を読み込み
  # 拡張子をキー、MIME タイプを値とするハッシュを返します。キーも値も文字列です。
  # 
  # @param file Apache の mime.types ファイル形式のファイルの名前を文字列で指定します。
  # 
  #   require 'webrick'
  #   p WEBrick::HTTPUtils.load_mime_types('/etc/mime.types')
  #   # => {"htm"=>"text/html", "rpm"=>"application/x-rpm", ... }
  def load_mime_types; end

  # --- mime_type(filename, mime_tab)    -> String
  # 
  # ファイル名 filename の拡張子をもとにその MIME タイプを指定された mime_tab 
  # から探して文字列として返します。MIME タイプが見つからない場合は "application/octet-stream"
  # を返します。
  # 
  # @param filename ファイル名を文字列で指定します。
  # 
  # @param mime_tab 拡張子をキー、MIME タイプを値とするハッシュを指定します。
  # 
  #   require 'webrick'
  #   include WEBrick::HTTPUtils
  #   p mime_type('index.html', DefaultMimeTypes)     #=> "text/html"
  #   p mime_type('index.html.ja', DefaultMimeTypes)  #=> "text/html"
  #   p mime_type('index.hoge', DefaultMimeTypes)     #=> "application/octet-stream"
  def mime_type; end

  # --- parse_header(raw) -> Hash
  # 
  # HTTP ヘッダをパースして結果をハッシュに格納して返します。
  # 
  # @param raw 生のヘッダを表す文字列を指定します。
  def parse_header; end

  # --- parse_range_header(ranges_specifier)
  # @todo ???
  # 
  # @param ranges_specifier 
  def parse_range_header; end

  # --- quote(str) -> String
  # 
  # 与えられた文字列をダブルクオートでクオートします。
  # 
  # 与えられた文字列に含まれているダブルクオートはバックスラッシュでエスケー
  # プします。
  # 
  # @param str 文字列を指定します。
  def quote; end

  # --- split_header_value(str) -> Array
  # 
  # HTTP ヘッダの値を分割して返します。
  # 
  # @param str HTTP ヘッダの値を返します。
  def split_header_value; end

  # --- unescape(str) -> String
  # 
  # 与えられた文字列を数値参照文字列から元の文字列に変換します。
  # 
  # @param str 文字列を指定します。
  def unescape; end

  # --- DefaultMimeTypes -> Hash
  # 
  # ファイルの拡張子をキー、 MIME Type を値とする要素を持つハッシュです。
  def DefaultMimeTypes; end

end
