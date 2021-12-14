class OpenSSL::OCSP::Response
  # --- basic -> OpenSSL::OCSP::BasicResponse | nil
  # Response オブジェクトが保持している BasicResponse オブジェクトを
  # 返します。
  # 
  # @see [[c:OpenSSL::OCSP::BasicResponse]]
  def basic; end

  # --- status  -> Integer
  # ステータスコードを整数で返します。
  # 
  # 以下のいずれかを返します。
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_SUCCESSFUL]]
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_MALFORMEDREQUEST]]
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_INTERNALERROR]]
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_TRYLATER]]
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_SIGREQUIRED]]
  #   * [[m:OpenSSL::OCSP::RESPONSE_STATUS_UNAUTHORIZED]]
  # 
  # @see [[m:OpenSSL::OCSP::Response#status_string]]
  def status; end

  # --- status_string -> String
  # レスポンスステータスを human-readable な文字列で返します。
  # 
  # @see [[m:OpenSSL::OCSP::Response#status]]
  def status_string; end

  # --- to_der -> String
  # Response オブジェクトを DER 形式の文字列に変換します。
  def to_der; end

  # --- create(status, basic_resp) -> OpenSSL::OCSP::Response
  # Response オブジェクトを [[c:OpenSSL::OCSP::BasicResponse]] オブジェクト
  # から生成します。
  # 
  # 
  # @param status ステータスコード(整数)
  # @param basic_resp [[c:OpenSSL::OCSP::BasicResponse]] オブジェクト
  # @see [[m:OpenSSL::OCSP::Response.new]]
  def create; end

  # --- new -> OpenSSL::OCSP::Response
  # --- new(der) -> OpenSSL::OCSP::Response
  # Response オブジェクトを生成します。
  # 
  # DER 形式の文字列を渡した場合はその内容を
  # ロードします。引数なしの場合は空のオブジェクトを返します。
  # 
  # @param der DER 形式の文字列
  # @see [[m:OpenSSL::OCSP::Response.create]]
  def new; end

end
