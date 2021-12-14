module OpenSSL::X509
  # --- DEFAULT_CERT_AREA -> String
  # 証明書や設定ファイルなど OpenSSL 関連のデータを
  # 置いてあるディレクトリの名前を返します。
  def DEFAULT_CERT_AREA; end

  # --- DEFAULT_CERT_DIR -> String
  # デフォルトの CA 証明書ディレクトリ名です。
  # 
  # [[m:OpenSSL::X509::Store#set_default_paths]] で読み込まれます。
  # 
  # [[m:OpenSSL::X509::DEFAULT_CERT_DIR_ENV]] で得られる環境変数よって
  # 上書き可能です。
  # 
  # 証明書ディレクトリに含まれる証明書のファイル名は
  # ハッシュ名でなければなりません。
  def DEFAULT_CERT_DIR; end

  # --- DEFAULT_CERT_DIR_ENV -> String
  # CA 証明書ディレクトリ名を指定する環境変数名です。
  # 
  # 通常、"SSL_CERT_DIR" という文字列です。
  # この環境変数を設定しておくことによって
  # [[m:OpenSSL::X509::Store#set_default_paths]] で読み込まれる
  # 証明書ディレクトリを変更できます。
  # 
  # 証明書ディレクトリに含まれる証明書のファイル名は
  # ハッシュ名でなければなりません。
  # 
  # @see [[m:OpenSSL::X509::DEFAULT_CERT_DIR]]
  def DEFAULT_CERT_DIR_ENV; end

  # --- DEFAULT_CERT_FILE -> String
  # デフォルトの CA 証明書ファイル名です。
  # 
  # [[m:OpenSSL::X509::Store#set_default_paths]] で読み込まれます。
  # 
  # [[m:OpenSSL::X509::DEFAULT_CERT_FILE_ENV]] で得られる環境変数よって
  # 上書き可能です。
  def DEFAULT_CERT_FILE; end

  # --- DEFAULT_CERT_FILE_ENV -> String
  # CA 証明書ファイル名を指定する環境変数名です。
  # 
  # 通常、"SSL_CERT_FILE" という文字列です。
  # この環境変数を設定しておくことによって
  # [[m:OpenSSL::X509::Store#set_default_paths]] で読み込まれる
  # 証明書ファイル名を変更できます。
  # 
  # @see [[m:OpenSSL::X509::DEFAULT_CERT_FILE]]
  def DEFAULT_CERT_FILE_ENV; end

  # --- DEFAULT_PRIVATE_DIR -> String
  # デフォルトの秘密鍵ディレクトリ名です。
  def DEFAULT_PRIVATE_DIR; end

  # --- PURPOSE_ANY -> Integer
  # 証明書の目的を確認しないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定します。
  def PURPOSE_ANY; end

  # --- PURPOSE_CRL_SIGN -> Integer
  # 証明書が CRL の署名をするのに利用可能かを
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_CRL_SIGN; end

  # --- PURPOSE_NS_SSL_SERVER -> Integer
  # 証明書が 
  # Netscape SSL server の証明書として使えるか
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_NS_SSL_SERVER; end

  # --- PURPOSE_OCSP_HELPER -> Integer
  # OCSP関連でOpenSSLの内部的に利用されます。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # 確認します。
  def PURPOSE_OCSP_HELPER; end

  # --- PURPOSE_SMIME_ENCRYPT -> Integer
  # 証明書が
  # S/MIME の暗号化をするのに使えるか
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_SMIME_ENCRYPT; end

  # --- PURPOSE_SMIME_SIGN -> Integer
  # 証明書が
  # S/MIME の署名をするのに使えるか
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_SMIME_SIGN; end

  # --- PURPOSE_SSL_CLIENT -> Integer
  # 証明書が
  # SSL のクライアントサイドの証明書として使えるか
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_SSL_CLIENT; end

  # --- PURPOSE_SSL_SERVER -> Integer
  # 証明書が
  # SSL のサーバサイドの証明書として使えるか。
  # チェックすることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#purpose=]] や
  # [[m:OpenSSL::X509::StoreContext#purpose=]] で設定し、
  # [[m:OpenSSL::X509::Store#verify]] や
  # [[m:OpenSSL::X509::StoreContext#verify]] で
  # このことを確認します。
  def PURPOSE_SSL_SERVER; end

  # --- TRUST_COMPAT -> Integer
  # ルート CA 証明書が自分自身の秘密鍵で署名されています。
  def TRUST_COMPAT; end

  # --- TRUST_EMAIL -> Integer
  # @todo
  def TRUST_EMAIL; end

  # --- TRUST_OBJECT_SIGN -> Integer
  # @todo
  def TRUST_OBJECT_SIGN; end

  # --- TRUST_OCSP_REQUEST -> Integer
  # @todo
  def TRUST_OCSP_REQUEST; end

  # --- TRUST_OCSP_SIGN -> Integer
  # @todo
  def TRUST_OCSP_SIGN; end

  # --- TRUST_SSL_CLIENT -> Integer
  # @todo
  def TRUST_SSL_CLIENT; end

  # --- TRUST_SSL_SERVER -> Integer
  # @todo
  def TRUST_SSL_SERVER; end

  # --- V_ERR_AKID_ISSUER_SERIAL_MISMATCH -> Integer
  # 証明書の拡張領域の Authority Key Identifier のシリアルと
  # issuer の証明書のシリアルが一致しないことを意味します。
  def V_ERR_AKID_ISSUER_SERIAL_MISMATCH; end

  # --- V_ERR_AKID_SKID_MISMATCH -> Integer
  # 証明書の authorityKeyIdentifier 拡張領域の内容が
  # issuer(発行者)の証明書の subjectKeyIdentifier の内容と
  # 食い違っていることを意味します。
  def V_ERR_AKID_SKID_MISMATCH; end

  # --- V_ERR_APPLICATION_VERIFICATION -> Integer
  # アプリケーションが利用するエラーコードです。
  # 
  # OpenSSL のライブラリでは使われないので、
  # アプリケーションプログラマが自由に利用することが可能です。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Store#verify_callback=]],
  #      [[m:OpenSSL::X509::StoreContext#error=]]
  def V_ERR_APPLICATION_VERIFICATION; end

  # --- V_ERR_CERT_CHAIN_TOO_LONG -> Integer
  # 証明書チェインが長すぎることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#verify_depth=]]
  def V_ERR_CERT_CHAIN_TOO_LONG; end

  # --- V_ERR_CERT_HAS_EXPIRED -> Integer
  # 証明書が期限切れであることを意味します。
  # 
  # 期限は証明書チェイン全体に対し確認されます。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Certificate#not_after=]],
  #      [[m:OpenSSL::X509::Store#time=]]
  def V_ERR_CERT_HAS_EXPIRED; end

  # --- V_ERR_CERT_NOT_YET_VALID -> Integer
  # 証明書の開始時刻以前であることを意味します。
  # 
  # 開始時刻は証明書チェイン全体に対し確認されます。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Certificate#not_before=]],
  #      [[m:OpenSSL::X509::Store#time=]]
  def V_ERR_CERT_NOT_YET_VALID; end

  # --- V_ERR_CERT_REJECTED -> Integer
  # ルート CA 証明書に指定した目標に使ってはならないと
  # されていることを意味します。
  def V_ERR_CERT_REJECTED; end

  # --- V_ERR_CERT_REVOKED -> Integer
  # 証明書が CRL によって失効されられていることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[c:OpenSSL::X509::CRL]]
  def V_ERR_CERT_REVOKED; end

  # --- V_ERR_CERT_SIGNATURE_FAILURE -> Integer
  # 証明書になされた署名の検証に失敗したことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_CERT_SIGNATURE_FAILURE; end

  # --- V_ERR_CERT_UNTRUSTED -> Integer
  # ルート CA 証明書が指定した目的では信頼できないことを意味します。
  # 
  # @see [[m:OpenSSL::X509::Store#trust=]],
  #      [[m:OpenSSL::X509::StoreContext#trust=]]
  # 
  # 
  # @see [[m:OpenSSL::X509::Store#trust=]]
  def V_ERR_CERT_UNTRUSTED; end

  # --- V_ERR_CRL_HAS_EXPIRED -> Integer
  # CRL が期限切れであることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_CRL_HAS_EXPIRED; end

  # --- V_ERR_CRL_NOT_YET_VALID -> Integer
  # CRL の開始時刻がまだ来ていないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_CRL_NOT_YET_VALID; end

  # --- V_ERR_CRL_SIGNATURE_FAILURE -> Integer
  # CRL になされた署名の検証に失敗したことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_CRL_SIGNATURE_FAILURE; end

  # --- V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT -> Integer
  # 検証している証明書がルート CA (自己署名証明書)であり、
  # それが信頼されている証明書でないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Store#add_file]],
  #      [[m:OpenSSL::X509::Store#add_path]],
  #      [[m:OpenSSL::X509::Store#add_cert]],
  #      [[m:OpenSSL::X509::Store#set_default_paths]]
  def V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT; end

  # --- V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD -> Integer
  # 証明書の notAfter フィールドの値が不正である
  # ことを意味します。
  # 
  # これは notAfter フィールド(証明書の期限を表すデータ)
  # が不正なフォーマットであることを意味し
  # (そもそも時刻を表現していない場合や、1月32日であるなど)、
  # 証明書が期限切れであることを意味しません。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD; end

  # --- V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD -> Integer
  # 証明書の notBefore フィールドの値が不正である
  # ことを意味します。
  # 
  # これは notBefore フィールド(証明書の開始時刻を表すデータ)
  # が不正なフォーマットであることを意味し
  # (そもそも時刻を表現していない場合や、1月32日であるなど)、
  # 証明書の開始時刻にまだ到達していないことを意味しません。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD; end

  # --- V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD -> Integer
  # CRL の lastUpdate フィールドの値が不正である
  # ことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD; end

  # --- V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD -> Integer
  # CRL の nextUpdate フィールドの値が不正である
  # ことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD; end

  # --- V_ERR_INVALID_CA -> Integer
  # CA 証明書が不正であることを意味します。
  # 
  # 証明書が実は CA 用ではない場合は証明書の拡張がおかしい場合に
  # このエラーが発生します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_INVALID_CA; end

  # --- V_ERR_INVALID_PURPOSE -> Integer
  # 証明書が指定した目的で使えないことを意味します。
  # 
  # @see [[m:OpenSSL::X509::Store#purpose=]]
  def V_ERR_INVALID_PURPOSE; end

  # --- V_ERR_KEYUSAGE_NO_CERTSIGN -> Integer
  # 署名できない証明書で署名しようしとたことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_KEYUSAGE_NO_CERTSIGN; end

  # --- V_ERR_OUT_OF_MEM -> Integer
  # メモリが不足したことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_OUT_OF_MEM; end

  # --- V_ERR_PATH_LENGTH_EXCEEDED -> Integer
  # CA 証明書の basicConstraints 拡張領域の pathlen を
  # 越えている場合に発生します。
  def V_ERR_PATH_LENGTH_EXCEEDED; end

  # --- V_ERR_SELF_SIGNED_CERT_IN_CHAIN -> Integer
  # 証明書チェインのルート CA (自己署名証明書)が
  # 信頼されている証明書でないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Store#add_file]],
  #      [[m:OpenSSL::X509::Store#add_path]],
  #      [[m:OpenSSL::X509::Store#add_cert]],
  #      [[m:OpenSSL::X509::Store#set_default_paths]]
  def V_ERR_SELF_SIGNED_CERT_IN_CHAIN; end

  # --- V_ERR_SUBJECT_ISSUER_MISMATCH -> Integer
  # 証明書の issuer(発行者)名と上位の証明書のsubject(所有者)名が
  # 異なっていることを意味します。
  def V_ERR_SUBJECT_ISSUER_MISMATCH; end

  # --- V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY -> Integer
  # 証明書の SubjectPublicKeyInfo フィールドが読めなかった
  # ことを意味します。
  def V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY; end

  # --- V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE -> Integer
  # 証明書の署名が復号できないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE; end

  # --- V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE -> Integer
  # CRL の署名が復号できないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE; end

  # --- V_ERR_UNABLE_TO_GET_CRL -> Integer
  # CRL が見付からないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#flags=]] で CRL をチェックすることを
  # 指定したにもかかわらず、適切な CRL を
  # [[m:OpenSSL::X509::Store#add_crl]] で追加しなかった場合に
  # このエラーが生じます。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_ERR_UNABLE_TO_GET_CRL; end

  # --- V_ERR_UNABLE_TO_GET_ISSUER_CERT -> Integer
  # issuer(発行者)の証明書が
  # 信頼している証明書群の中から見付からない
  # ような証明書を、信頼している証明書群に含んでいることを意味します。
  # 
  # つまり、信頼している証明書群に issuer を親とする木構造を考えた場合、
  # その root(根) となるノードが自己署名されていないことを意味します。
  # 
  # これは、通常信頼している証明書のリストが不完全であることを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Store#add_file]],
  #      [[m:OpenSSL::X509::Store#add_path]],
  #      [[m:OpenSSL::X509::Store#add_cert]],
  #      [[m:OpenSSL::X509::Store#set_default_paths]]
  def V_ERR_UNABLE_TO_GET_ISSUER_CERT; end

  # --- V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY -> Integer
  # 証明書チェイン末尾の証明書の issuer(発行者)の証明書が
  # 信頼している証明書群の中から見付からないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  # 
  # @see [[m:OpenSSL::X509::Store#add_file]],
  #      [[m:OpenSSL::X509::Store#add_path]],
  #      [[m:OpenSSL::X509::Store#add_cert]],
  #      [[m:OpenSSL::X509::Store#set_default_paths]]
  def V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY; end

  # --- V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE -> Integer
  # 証明書チェインにある証明書がただ一つでその証明書が
  # 自己署名証明書でないことを意味します。
  def V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE; end

  # --- V_FLAG_CRL_CHECK -> Integer
  # 証明書の検証時に CRL をチェックすることを意味します。
  # 
  # このフラグのみを指定すると検証する証明書のみ CRL をチェックし、
  # CA の証明書チェーンには CRL のチェックがなされません。
  # 
  # 証明チェーン全体をチェックしたい場合は V_FLAG_CRL_CHECK と
  # [[m:OpenSSL::X509::V_FLAG_CRL_CHECK_ALL]] の両方を指定する
  # 必要があります。
  # 
  # [[m:OpenSSL::X509::Store#flags=]] で使います。
  def V_FLAG_CRL_CHECK; end

  # --- V_FLAG_CRL_CHECK_ALL -> Integer
  # 証明書チェーンすべてに CRL をチェックすることを意味します。
  # 
  # このフラグは [[m:OpenSSL::X509::V_FLAG_CRL_CHECK]] と共に
  # 指定する場合にのみ意味を持ちます。
  # 
  # [[m:OpenSSL::X509::Store#flags=]] で使います。
  def V_FLAG_CRL_CHECK_ALL; end

  # --- V_OK -> Integer
  # エラーが発生していないことを意味します。
  # 
  # [[m:OpenSSL::X509::Store#error]] や
  # [[m:OpenSSL::X509::StoreContext#error]] のエラーコードとして
  # 使われます。
  def V_OK; end

end
