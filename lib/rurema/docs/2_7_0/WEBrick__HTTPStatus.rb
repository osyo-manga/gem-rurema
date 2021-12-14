module WEBrick::HTTPStatus
  # --- client_error?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 4XX である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  def client_error?; end

  # --- error?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 4XX, 5xx である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  def error?; end

  # --- info?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 1XX である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数を指定します。
  def info?; end

  # --- reason_phrase(code)     -> String
  # 
  # 指定された整数が表すステータスコードに対応する reason phrase
  # を表す文字列を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  # 
  #   require 'webrick'
  #   p WEBrick::HTTPStatus.reason_phrase(304)   #=> "Not Modified"
  def reason_phrase; end

  # --- redirect?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 3XX である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  def redirect?; end

  # --- server_error?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 5XX である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  def server_error?; end

  # --- success?(code)    -> bool
  # 
  # 指定された整数が表すステータスコードが 2XX である場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param code HTTP のステータスコードを表す整数か文字列を指定します。
  def success?; end

  # --- [](code)    -> Class
  # 
  # 指定された整数が表すステータスコードに対応する WEBrick::HTTPStatus::Status
  # のサブクラスを返します。
  # 
  # @param code HTTP のステータスコードを表す整数を指定します。
  # 
  #   require 'webrick'
  #   p WEBrick::HTTPStatus[200]   #=> WEBrick::HTTPStatus::OK
  def []; end

  # --- RC_CONTINUE
  # --- RC_SWITCHING_PROTOCOLS
  # --- RC_OK
  # --- RC_CREATED
  # --- RC_ACCEPTED
  # --- RC_NON_AUTHORITATIVE_INFORMATION
  # --- RC_NO_CONTENT
  # --- RC_RESET_CONTENT
  # --- RC_PARTIAL_CONTENT
  # --- RC_MULTIPLE_CHOICES
  # --- RC_MOVED_PERMANENTLY
  # --- RC_FOUND
  # --- RC_SEE_OTHER
  # --- RC_NOT_MODIFIED
  # --- RC_USE_PROXY
  # --- RC_TEMPORARY_REDIRECT
  # --- RC_BAD_REQUEST
  # --- RC_UNAUTHORIZED
  # --- RC_PAYMENT_REQUIRED
  # --- RC_FORBIDDEN
  # --- RC_NOT_FOUND
  # --- RC_METHOD_NOT_ALLOWED
  # --- RC_NOT_ACCEPTABLE
  # --- RC_PROXY_AUTHENTICATION_REQUIRED
  # --- RC_REQUEST_TIMEOUT
  # --- RC_CONFLICT
  # --- RC_GONE
  # --- RC_LENGTH_REQUIRED
  # --- RC_PRECONDITION_FAILED
  # --- RC_REQUEST_ENTITY_TOO_LARGE
  # --- RC_REQUEST_URI_TOO_LARGE
  # --- RC_UNSUPPORTED_MEDIA_TYPE
  # --- RC_REQUEST_RANGE_NOT_SATISFIABLE
  # --- RC_EXPECTATION_FAILED
  # --- RC_INTERNAL_SERVER_ERROR
  # --- RC_NOT_IMPLEMENTED
  # --- RC_BAD_GATEWAY
  # --- RC_SERVICE_UNAVAILABLE
  # --- RC_GATEWAY_TIMEOUT
  # --- RC_HTTP_VERSION_NOT_SUPPORTED
  # 
  # HTTP のステータスコードを表す整数です。
  # 
  #   require 'webrick'
  #   p WEBrick::HTTPStatus::RC_INTERNAL_SERVER_ERROR   #=> 500
  def RC_ACCEPTED; end

end
