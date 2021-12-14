module WEBrick::AccessLog
  # --- escape(data) -> String
  # 
  # 与えられた文字列が汚染されている場合、制御文字を無効化します。
  # 
  # @param data エスケープする文字列を指定します。
  def escape; end

  # --- format(format_string, params) -> String
  # 
  # 与えられたフォーマット文字列とパラメータを使用してログを整形します。
  # 
  # @param format_string フォーマット文字列を指定します。
  # 
  # @param params パラメータを指定します。
  def format; end

  # --- setup_params(config, request, response) -> Hash
  # 
  # 与えられた引数を使用してログ出力に使用するパラメータを作成して返します。
  # 
  # @param config ハッシュを指定します。
  # 
  # @param request [[c:WEBrick::HTTPRequest]] のインスタンスを指定します。
  # 
  # @param response [[c:WEBrick::HTTPResponse]] のインスタンスを指定します。
  def setup_params; end

  # --- AGENT_LOG_FORMAT -> String
  # 
  # Apache のアクセスログで一般的に使われる User-Agent の形式を表す文字列です。
  # 
  # @return 以下の文字列を返します。
  # //emlist{{
  #   "%{User-Agent}i"
  # //}}
  def AGENT_LOG_FORMAT; end

  # --- COMMON_LOG_FORMAT -> String
  # --- CLF -> String
  # 
  # Apache のアクセスログで一般的に使われる形式を表す文字列です。
  # 
  # @return 以下の文字列を返します。
  # //emlist{{
  #   "%h %l %u %t \"%r\" %s %b"
  # //}}
  def CLF; end

  # --- CLF_TIME_FORMAT -> String
  # 
  # Apache のアクセスログと同じ時刻の形式を表す文字列です。
  # 
  # @return 以下の文字列を返します。
  # //emlist{{
  #   "[%d/%b/%Y:%H:%M:%S %Z]"
  # //}}
  def CLF_TIME_FORMAT; end

  # --- COMBINED_LOG_FORMAT -> String
  # 
  # Apache のアクセスログで一般的に使われる形式を表す文字列です。
  # 
  # @return 以下の文字列を返します。
  # //emlist{{
  #   "%h %l %u %t \"%r\" %s %b \"%{Referer}i\" \"%{User-agent}i\""
  # //}}
  def COMBINED_LOG_FORMAT; end

  # --- REFERER_LOG_FORMAT -> String
  # 
  # Apache のアクセスログで一般的に使われるリファラの形式を表す文字列です。
  # 
  # @return 以下の文字列を返します。
  # //emlist{{
  #   "%{Referer}i -> %U"
  # //}}
  def REFERER_LOG_FORMAT; end

end
