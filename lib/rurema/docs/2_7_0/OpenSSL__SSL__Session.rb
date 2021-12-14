class OpenSSL::SSL::Session
  # --- ==(other) -> bool
  # otherと自身が同一のセッションであれば真を返します。
  def ==; end

  # --- id -> String
  # セッション ID を返します。
  # 
  # SSL/TLS はこのセッション ID でセッションを識別します。
  def id; end

  # --- time -> Time
  # セッションが確立された時刻を返します。
  # 
  # @see [[m:OpenSSL::SSL::Session#time=]],
  #      [[m:OpenSSL::SSL::Session#timeout]]
  def time; end

  # --- time=(t)
  # セッション確立時刻を [[c:Time]] オブジェクトで更新します。
  # 
  # これによってタイムアウト時刻が変更されます。
  # @param t 更新する時刻
  # @see [[m:OpenSSL::SSL::Session#time]],
  #      [[m:OpenSSL::SSL::Session#timeout]]
  def time=; end

  # --- timeout -> Integer
  # セッションタイムアウトの時間(秒数)を整数で返します。
  # 
  # デフォルト値は [[m:OpenSSL::SSL::SSLContext#timeout=]] 
  # で設定されます。
  # 
  # @see [[m:OpenSSL::SSL::Session#time]],
  #      [[m:OpenSSL::SSL::Session#timeout=]]
  def timeout; end

  # --- timeout=(t)
  # セッションタイムアウトの時間(秒数)を整数で設定します。
  # 
  # これによってタイムアウト時刻が変更されます。
  # @param t タイムアウト時間
  # @see [[m:OpenSSL::SSL::Session#time]],
  #      [[m:OpenSSL::SSL::Session#timeout]]
  def timeout=; end

  # --- to_der -> String
  # 自身を DER 形式に変換します。
  # 
  # これによってセッションキャッシュをディスク上に保持することができます。
  # 
  # @raise OpenSSL::SSL::Session::SessionError 変換に失敗した場合に発生します
  def to_der; end

  # --- to_pem -> String
  # 自身を PEM 形式に変換します。
  # 
  # これによってセッションキャッシュをディスク上に保持することができます。
  # 
  # @raise OpenSSL::SSL::Session::SessionError 変換に失敗した場合に発生します
  def to_pem; end

  # --- to_text -> String
  # 自身を可読な形式に変換します。
  # 
  # @raise OpenSSL::SSL::Session::SessionError 変換に失敗した場合に発生します
  def to_text; end

  # --- new(obj) -> OpenSSL::SSL::Session
  # 新しいセッションオブジェクトを生成します。
  # 
  # 引数に [[c:OpenSSL::SSL::SSLSocket]] が渡された場合は、
  # それに結び付けられたセッションを表すオブジェクトを返します。
  # [[m:OpenSSL::SSL::SSLSocket#session]] と同じ動作をします。
  # 
  # 引数が文字列の場合、 PEM 形式もしくは DER 形式で保存された
  # セッションデータであるとみなし、セッションオブジェクトを生成します。
  # 引数が [[c:IO]] オブジェクトである場合は、データを読みだし
  # PEM 形式もしくは DER 形式とみなしてセッションオブジェクトを生成します。
  # 
  # @param obj セッションオブジェクトの生成元オブジェクト
  # @raise OpenSSL::SSL::Session::SessionError オブジェクトの生成に
  #        失敗した場合に発生します
  def new; end

end
