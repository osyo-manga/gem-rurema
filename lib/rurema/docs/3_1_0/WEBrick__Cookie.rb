class WEBrick::Cookie
  # --- comment         -> String
  # --- comment=(value)
  # 
  # コメントを文字列で表すアクセサです。
  # 
  # @param value コメントを文字列で指定します。
  def comment; end

  # --- domain         -> String
  # --- domain=(value)
  # 
  # ドメイン名を文字列で表すアクセサです。
  # 
  # @param value ドメイン名を表す文字列を指定します。
  def domain; end

  # --- expires    -> Time
  # --- expires=(value)
  # 
  # 有効期限を [[c:Time]]オブジェクトで表すアクセサです。
  # 
  # @param value 有効期限を [[c:Time]] オブジェクトまたは文字列を指定します。
  def expires; end

  # --- max_age          -> Integer
  # --- max_age=(value)
  # 
  # クッキーの寿命を整数(単位は秒)で表すアクセサです。
  # 
  # @param value クッキーの寿命を正の整数で指定します。0 は直ちに破棄される事を意味する。
  def max_age; end

  # --- name   -> String
  # 
  # Cookie の名前を文字列で返します。
  def name; end

  # --- path          -> String
  # --- path=(value)
  # 
  # パス名を文字列で表すアクセサです。
  # 
  # @param value パス名を文字列で指定します。
  def path; end

  # --- secure         -> bool
  # --- secure=(value)
  # 
  # クッキーのSecure属性を真偽値で表すアクセサです。
  # 
  # @param value クッキーのSecure属性を真偽値で指定します。
  def secure; end

  # --- to_s    -> String
  # 
  # クッキーを文字列にして返します。
  def to_s; end

  # --- value       -> String
  # --- value=(str)
  # 
  # クッキーの値を文字列で表すアクセサです。
  # 
  # @param str クッキーの値を文字列で指定します。
  def value; end

  # --- version           -> Integer
  # --- version=(value)
  # 
  # Cookie のバージョン番号を整数で表すアクセサです。
  # 
  # @param value Cookie のバージョン番号を整数で指定します。
  def version; end

  # --- new(name, value)    -> WEBrick::Cookie
  # 
  # 新しい [[c:WEBrick::Cookie]] オブジェクトを生成して返します。
  # name にクッキーの名前を、value にクッキーで保持する値を与える。
  # 
  # @param name Cookie の名前を文字列で指定します。
  # 
  # @param value Cookie の値を文字列で指定します。
  def new; end

  # --- parse(str)    -> [WEBrick::Cookie]
  # 
  # ユーザーエージェントから送られてきた Cookie ヘッダの値 str をパースし、
  # 新しく [[c:WEBrick::Cookie]] オブジェクトを生成しその配列を返します。
  # 各属性の形式が仕様に準拠しているかを確認しません。
  # 
  # @param str Cookie を表す文字列を指定します。
  # 
  #   require 'webrick'
  #   include WEBrick
  #   c = Cookie.parse('$Version="1"; Customer="WILE"; $Path="/foo"; P_Number="Rocket"; $Path="/foo/hoge"')
  #   p c[1].name, c[1].path
  #  
  #   #=> 
  #   "P_Number"
  #   "/foo/hoge"
  def parse; end

  # --- parse_set_cookie(str)    -> WEBrick::Cookie
  # 
  # サーバから送られてくる Set-Cookie ヘッダの値 str をパースし、
  # 新しく [[c:WEBrick::Cookie]] オブジェクトを生成し返します。
  # 
  # @param str Set-Cookie ヘッダの値を文字列で指定します。
  # 
  #   require 'webrick'
  #   include WEBrick
  #   c = Cookie.parse_set_cookie('Shipping="FedEx"; Version="1"; Path="/acme"')
  #   p c.name, c.value
  #   
  #   #=>
  #   "Shipping"
  #   "FedEx"
  def parse_set_cookie; end

  # --- parse_set_cookies(str)    -> [WEBrick::Cookie]
  # 
  # サーバから送られてくる Set-Cookie ヘッダの値 str をパースし、
  # 新しく [[c:WEBrick::Cookie]] オブジェクトの配列を生成し返します。
  # 
  # @param str Set-Cookie ヘッダの値を文字列で指定します。
  def parse_set_cookies; end

end
