module WEBrick::HTTPAuth::Authenticator
  # --- logger -> object
  # 
  # ロガーオブジェクトを返します。
  def logger; end

  # --- realm -> String
  # 
  # レルムを返します。
  def realm; end

  # --- userdb -> WEBrick::HTTPAuth::Htpasswd | WEBrick::HTTPAuth::Htdigest
  # 
  # 認証のためのユーザデータベースを返します。
  # 
  # @see [[c:WEBrick::HTTPAuth::BasicAuth]], [[c:WEBrick::HTTPAuth::Htdigest]]
  def userdb; end

  # --- AuthException -> Class
  # 
  # 認証失敗時に発生する例外のクラスです。
  def AuthException; end

  # --- AuthScheme -> nil
  # 
  # 認証方法を表わします。派生クラスで上書きしなければなりません。
  def AuthScheme; end

  # --- RequestField -> String
  # 
  # リクエストフィールドのキーの名前です。
  def RequestField; end

  # --- ResponseField -> String
  # 
  # レスポンスフィールドのキーの名前です。
  def ResponseField; end

  # --- ResponseInfoField -> String
  # 
  # レスポンスインフォフィールドのキーの名前です。
  def ResponseInfoField; end

end
