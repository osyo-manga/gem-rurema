module CGI::QueryExtension
  # --- [](key) -> Array
  # 
  # 文字列 key に対応するパラメータを配列で返します。
  # key に対応するパラメータが見つからなかった場合は、nil を返します。（[[m:CGI#params]]と等価です）
  # 
  # フォームから入力された値や、URL に埋め込まれた QUERY_STRING のパース結果の取得などに使用します。
  # 
  # @param key キーを文字列で指定します。
  def []; end

  # --- accept -> String
  # 
  # ENV['HTTP_ACCEPT'] を返します。
  def accept; end

  # --- accept_charset -> String
  # 
  # ENV['HTTP_ACCEPT_CHARSET'] を返します。
  def accept_charset; end

  # --- accept_encoding -> String
  # 
  # ENV['HTTP_ACCEPT_ENCODING'] を返します。
  def accept_encoding; end

  # --- accept_language -> String
  # 
  # ENV['HTTP_ACCEPT_LANGUAGE'] を返します。
  def accept_language; end

  # --- auth_type -> String
  # 
  # ENV['AUTH_TYPE'] を返します。
  def auth_type; end

  # --- cache_control -> String
  # 
  # ENV['HTTP_CACHE_CONTROL'] を返します。
  def cache_control; end

  # --- content_length -> Integer
  # 
  # ENV['CONTENT_LENGTH'] を返します。
  def content_length; end

  # --- content_type -> String
  # 
  # ENV['CONTENT_TYPE'] を返します。
  def content_type; end

  # --- cookies -> Hash
  # 
  # クッキーの名前と値をペアにした要素を持つハッシュを返します。
  def cookies; end

  # --- cookies=(value)
  # 
  # クッキーをセットします。
  # 
  # @param value クッキーの名前と値をペアにした要素を持つハッシュを指定します。
  def cookies=; end

  # --- create_body(is_large) -> StringIO | Tempfile
  def create_body; end

  # --- files -> Hash
  # 
  # アップロードされたファイルの名前とその内容を表すオブジェクトをペアとする要素を持つハッシュを返します。
  def files; end

  # --- from -> String
  # 
  # ENV['HTTP_FROM'] を返します。
  def from; end

  # --- gateway_interface -> String
  # 
  # ENV['GATEWAY_INTERFACE'] を返します。
  def gateway_interface; end

  # --- has_key?(*args) -> bool
  # --- key?(*args) -> bool
  # --- include?(*args) -> bool
  # 
  # 与えられたキーがクエリに含まれている場合は、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param args キーを一つ以上指定します。
  def has_key?; end

  # --- host -> String
  # 
  # ENV['HTTP_HOST'] を返します。
  def host; end

  # --- keys(*args) -> [String]
  # 
  # すべてのパラメータのキーを配列として返します。
  def keys; end

  # --- multipart? -> bool
  # 
  # マルチパートフォームの場合は、真を返します。
  # そうでない場合は、偽を返します。
  # 
  #        例：
  #        cgi = CGI.new
  #        if cgi.multipart?
  #          field1=cgi['field1'].read
  #        else
  #          field1=cgi['field1']
  #        end
  def multipart?; end

  # --- negotiate -> String
  # 
  # ENV['HTTP_NEGOTIATE'] を返します。
  def negotiate; end

  # --- params -> Hash
  # 
  # パラメータを格納したハッシュを返します。
  # 
  # フォームから入力された値や、URLに埋め込まれた QUERY_STRING のパース結果の取得などに使用します。
  # 
  #       cgi = CGI.new
  #       cgi.params['developer']     # => ["Matz"] (Array)
  #       cgi.params['developer'][0]  # => "Matz"
  #       cgi.params['']              # => nil
  def params; end

  # --- params=(hash)
  # 
  # 与えられたハッシュをパラメータにセットします。
  # 
  # @param hash ハッシュを指定します。
  def params=; end

  # --- path_info -> String
  # 
  # ENV['PATH_INFO'] を返します。
  def path_info; end

  # --- path_translated -> String
  # 
  # ENV['PATH_TRANSLATED'] を返します。
  def path_translated; end

  # --- pragma -> String
  # 
  # ENV['HTTP_PRAGMA'] を返します。
  def pragma; end

  # --- query_string -> String
  # 
  # ENV['QUERY_STRING'] を返します。
  def query_string; end

  # --- raw_cookie -> String
  # 
  # ENV["HTTP_COOKIE"] を返します。
  def raw_cookie; end

  # --- raw_cookie2 -> String
  # 
  # ENV["HTTP_COOKIE2"] を返します。
  def raw_cookie2; end

  # --- referer -> String
  # 
  # ENV['HTTP_REFERER'] を返します。
  def referer; end

  # --- remote_addr -> String
  # 
  # ENV['REMOTE_ADDR'] を返します。
  def remote_addr; end

  # --- remote_host -> String
  # 
  # ENV['REMOTE_HOST'] を返します。
  def remote_host; end

  # --- remote_ident -> String
  # 
  # ENV['REMOTE_IDENT'] を返します。
  def remote_ident; end

  # --- remote_user -> String
  # 
  # ENV['REMOTE_USER'] を返します。
  def remote_user; end

  # --- request_method -> String
  # 
  # ENV['REQUEST_METHOD'] を返します。
  def request_method; end

  # --- script_name -> String
  # 
  # ENV['SCRIPT_NAME'] を返します。
  def script_name; end

  # --- server_name -> String
  # 
  # ENV['SERVER_NAME'] を返します。
  def server_name; end

  # --- server_port -> Integer
  # 
  # ENV['SERVER_PORT'] を返します。
  def server_port; end

  # --- server_protocol -> String
  # 
  # ENV['SERVER_PROTOCOL'] を返します。
  def server_protocol; end

  # --- server_software -> String
  # 
  # ENV['SERVER_SOFTWARE'] を返します。
  def server_software; end

  # --- unescape_filename? -> bool
  def unescape_filename?; end

  # --- user_agent -> String
  # 
  # ENV['HTTP_USER_AGENT'] を返します。
  def user_agent; end

end
