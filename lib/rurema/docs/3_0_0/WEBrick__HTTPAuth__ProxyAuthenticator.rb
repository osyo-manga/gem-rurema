module WEBrick::HTTPAuth::ProxyAuthenticator
  # --- AuthException -> Class
  # 
  # [[c:WEBrick::HTTPStatus::ProxyAuthenticationRequired]] です。
  def AuthException; end

  # --- InfoField -> "Proxy-Authentication-Info"
  # 
  # キーの名前です。
  def InfoField; end

  # --- RequestField -> "Proxy-Authorization"
  # 
  # リクエストフィールドのキーの名前です。
  def RequestField; end

  # --- ResponseField -> "Proxy-Authenticate"
  # 
  # レスポンスフィールドのキーの名前です。
  def ResponseField; end

end
