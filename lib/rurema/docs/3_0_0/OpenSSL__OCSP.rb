module OpenSSL::OCSP
  # --- NOCASIGN -> Integer
  # このフラグ定数は使われていません。
  def NOCASIGN; end

  # --- NOCERTS -> Integer
  # 署名時に署名データに証明書を含めないことを意味します。
  def NOCERTS; end

  # --- NOCHAIN -> Integer
  # 証明書チェインを使わないことを意味します。
  def NOCHAIN; end

  # --- NOCHECKS -> Integer
  # 署名の検証における追加的なチェックを省略することを意味します。
  def NOCHECKS; end

  # --- NODELEGATED -> Integer
  # delegated trust を許可しないことを意味します。
  # 
  # このフラグ定数は使われていません。
  def NODELEGATED; end

  # --- NOEXPLICIT -> Integer
  # 証明書ストア内の Root CA を信用しないことを意味します。
  def NOEXPLICIT; end

  # --- NOINTERN -> Integer
  # Request/Response の署名データに含まれている証明書から
  # 署名者の証明書を「探さない」ことを意味します。
  def NOINTERN; end

  # --- NOSIGS -> Integer
  # 署名の検証を行わないことを意味します。
  def NOSIGS; end

  # --- NOTIME -> Integer
  # OCSP 応答の生成時刻を正しく設定しないことを意味します。
  def NOTIME; end

  # --- NOVERIFY -> Integer
  # 署名に使った鍵の証明書の検証を行わないことを意味します。
  def NOVERIFY; end

  # --- RESPID_KEY -> Integer
  # OCSP レスポンダ の ID として公開鍵のハッシュ値を用いること
  # を意味します。
  # 
  # 詳しくは [[RFC:2560]] および X.509 を確認してください。
  def RESPID_KEY; end

  # --- RESPONSE_STATUS_INTERNALERROR -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # OCSP レスポンダの内部エラーにより妥当な応答を返せないことを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_INTERNALERROR; end

  # --- RESPONSE_STATUS_MALFORMEDREQUEST -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # リクエストの構文が正しくないことを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_MALFORMEDREQUEST; end

  # --- RESPONSE_STATUS_SIGREQUIRED -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # サーバがクライアントにリクエストへの署名を要求していることを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_SIGREQUIRED; end

  # --- RESPONSE_STATUS_SUCCESSFUL -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # 正しく応答したことを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_SUCCESSFUL; end

  # --- RESPONSE_STATUS_TRYLATER -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # レスポンダが一時的に応答できないことを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_TRYLATER; end

  # --- RESPONSE_STATUS_UNAUTHORIZED -> Integer
  # [[m:OpenSSL::OCSP::Response#status]] のステータスコードで 、
  # クライアントからサーバへの応答が認可されていないことを意味します。
  # 
  # 詳しくは [[RFC:2560]] 2.3 を見てください。
  def RESPONSE_STATUS_UNAUTHORIZED; end

  # --- REVOKED_STATUS_AFFILIATIONCHANGED -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 証明書の記載内容が変更されたことを意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_AFFILIATIONCHANGED; end

  # --- REVOKED_STATUS_CACOMPROMISE -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # CA が危殆化したことを意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_CACOMPROMISE; end

  # --- REVOKED_STATUS_CERTIFICATEHOLD -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 一時的な保留を意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_CERTIFICATEHOLD; end

  # --- REVOKED_STATUS_CESSATIONOFOPERATION -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 証明書の運用を止めたことを意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_CESSATIONOFOPERATION; end

  # --- REVOKED_STATUS_KEYCOMPROMISE -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 鍵が危殆化したことを意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_KEYCOMPROMISE; end

  # --- REVOKED_STATUS_NOSTATUS -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # BasicResponse にコードが含まれていないことを意味します。
  def REVOKED_STATUS_NOSTATUS; end

  # --- REVOKED_STATUS_REMOVEFROMCRL -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # CRL からの削除を意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_REMOVEFROMCRL; end

  # --- REVOKED_STATUS_SUPERSEDED -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 証明書が破棄されたことを意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_SUPERSEDED; end

  # --- REVOKED_STATUS_UNSPECIFIED -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] の失効理由コードで、
  # 未指定を意味します。
  # 
  # 詳しくは [[RFC:3280]] や X.509 を参照してください。
  def REVOKED_STATUS_UNSPECIFIED; end

  # --- TRUSTOTHER -> Integer
  # 明示的に渡した証明書を検証なしで信用することを意味します。
  def TRUSTOTHER; end

  # --- V_CERTSTATUS_GOOD -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] 
  # のステータスコードで証明書が有効であることを意味します。
  def V_CERTSTATUS_GOOD; end

  # --- V_CERTSTATUS_REVOKED -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] 
  # のステータスコードで証明書が失効していることを意味します。
  def V_CERTSTATUS_REVOKED; end

  # --- V_CERTSTATUS_UNKNOWN -> Integer
  # [[m:OpenSSL::OCSP::BasicResponse#status]] 
  # のステータスコードで証明書の有効性が不明であることを意味します。
  def V_CERTSTATUS_UNKNOWN; end

end
