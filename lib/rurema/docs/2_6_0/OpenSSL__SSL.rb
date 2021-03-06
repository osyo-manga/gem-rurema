module OpenSSL::SSL
  # --- OP_ALL -> Integer
  # SSL 通信で各種のバグ回避コードをすべて有効にするフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_ALL; end

  # --- OP_CIPHER_SERVER_PREFERENCE -> Integer
  # 暗号スイートの選択においてサーバ側の優先順位を優先するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  # 
  # このフラグを立てていない場合はクライアント側の優先順位を優先します。
  def OP_CIPHER_SERVER_PREFERENCE; end

  # --- OP_MICROSOFT_SESS_ID_BUG -> Integer
  # --- OP_NETSCAPE_CHALLENGE_BUG -> Integer
  # --- OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG -> Integer
  # --- OP_SSLREF2_REUSE_CERT_TYPE_BUG -> Integer
  # --- OP_MICROSOFT_BIG_SSLV3_BUFFER -> Integer
  # --- OP_MSIE_SSLV2_RSA_PADDING -> Integer
  # --- OP_SSLEAY_080_CLIENT_DH_BUG -> Integer
  # --- OP_TLS_D5_BUG -> Integer
  # --- OP_TLS_BLOCK_PADDING_BUG -> Integer
  # --- OP_DONT_INSERT_EMPTY_FRAGMENTS -> Integer
  # 
  # SSL 通信での各種バグ回避コードを有効にするフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  # 
  # 通常は [[c:OpenSSL::SSL::OP_ALL]] でこれらすべてを有効にします。
  # 特定のフラグのみ無効にしたい場合は例えば
  # 
  #   ctx.options = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
  # 
  # などとします。
  def OP_DONT_INSERT_EMPTY_FRAGMENTS; end

  # --- OP_EPHEMERAL_RSA -> Integer
  # RSA を使う場合に常に一時的 RSA 鍵を使うことを意味するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_EPHEMERAL_RSA; end

  # --- OP_NETSCAPE_CA_DN_BUG -> Integer
  # Netscape の CA の DN のエンコーディングバグを
  # 回避するコードを有効にします。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NETSCAPE_CA_DN_BUG; end

  # --- OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG -> Integer
  # @todo
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG; end

  # --- OP_NO_COMPRESSION
  # OpenSSL による通信の圧縮を禁止します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  # 
  # @see [[url:https://bugs.ruby-lang.org/issues/5183]]
  def OP_NO_COMPRESSION; end

  # --- OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION -> Integer
  # セッション再ネゴシエーションをした場合にサーバ側で
  # 常に新しいセッションを生成するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION; end

  # --- OP_NO_SSLv2 -> Integer
  # SSL v2 の使用を禁止するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_SSLv2; end

  # --- OP_NO_SSLv3 -> Integer
  # SSL v3 の使用を禁止するフラグです。
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_SSLv3; end

  # --- OP_NO_TICKET -> Integer
  # RFC4507bis チケットによる stateless session resumption を
  # 無効化します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_TICKET; end

  # --- OP_NO_TLSv1 -> Integer
  # TLS v1 の使用を禁止するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_TLSv1; end

  # --- OP_NO_TLSv1_1 -> Integer
  # TLS v1.1 の使用を禁止するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_TLSv1_1; end

  # --- OP_NO_TLSv1_2 -> Integer
  # TLS v1.2 の使用を禁止するフラグです。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_NO_TLSv1_2; end

  # --- OP_PKCS1_CHECK_1 -> Integer
  # @todo
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_PKCS1_CHECK_1; end

  # --- OP_PKCS1_CHECK_2 -> Integer
  # @todo
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_PKCS1_CHECK_2; end

  # --- OP_SINGLE_DH_USE -> Integer
  # 一時的 DH 鍵を使うとき毎回鍵を生成するフラグです。
  # 
  # このオプションは「安全でない」素数を使って DH パラメータを
  # 生成したときに「small subgroup attack」を防ぐために必要です。
  # 「安全な」素数を使った場合は必ずしも必要なオプションでは
  # ありませんが、このオプションを使うことは推奨されています。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_SINGLE_DH_USE; end

  # --- OP_SINGLE_ECDH_USE -> Integer
  # @todo
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  def OP_SINGLE_ECDH_USE; end

  # --- OP_TLS_ROLLBACK_BUG -> Integer
  # バージョンロールバック攻撃の検出を無効にします。
  # 
  # [[m:OpenSSL::SSL::SSLContext#options=]] で利用します。
  # 
  # 通常は使わないでください。
  # 
  # 鍵交換時に、クライアントとサーバで利用可能なプロトコルのバージョンを
  # やりとりします。クライアントによってはサーバが送った
  # バージョンを無視します。そのようなクライアントと通信する必要が
  # ある場合このオプションを有効にします。
  def OP_TLS_ROLLBACK_BUG; end

  # --- VERIFY_CLIENT_ONCE -> Integer
  # [[m:OpenSSL::SSL::SSLContext#verify_mode=]] で指定できるフラグです。
  # 
  # サーバーモードであるかクライアントモードであるかによって意味がことなります。
  # 
  # サーバーモード: 最初の TLS/SSL ハンドシェイクの時だけクライアント
  # に証明書を要求します。このフラグは VERIFY_PEER フラグとともに
  # 使われなければなりません。
  # 
  # クライアントモード: 無視されます。
  def VERIFY_CLIENT_ONCE; end

  # --- VERIFY_FAIL_IF_NO_PEER_CERT -> Integer
  # [[m:OpenSSL::SSL::SSLContext#verify_mode=]] で指定できるフラグです。
  # 
  # サーバーモードであるかクライアントモードであるかによって意味がことなります。
  # 
  # サーバーモード: クライアントが証明書を返さない場合に 
  # TLS/SSL ハンドシェイクを即座に終了させます。
  # このフラグは VERIFY_PEER フラグとともに使われなければなりません。
  # 
  # クライアントモード: 無視されます。
  def VERIFY_FAIL_IF_NO_PEER_CERT; end

  # --- VERIFY_NONE -> Integer
  # [[m:OpenSSL::SSL::SSLContext#verify_mode=]] で指定できるフラグです。
  # 
  # サーバーモードであるかクライアントモードであるかによって意味がことなります。
  # 
  # サーバーモード: クライアントに証明書を要求せず、クライアントは証明書を
  # 送り返しません。
  # 
  # クライアントモード: サーバから受け取った証明書は検証されますが、失敗しても
  # ハンドシェイクは継続します。
  # ハンドシェイクの結果は [[m:OpenSSL::SSL::SSLSocket#verify_result]] で
  # 取得できます。
  # 
  # このフラグは単独で用いられるべきです。
  def VERIFY_NONE; end

  # --- VERIFY_PEER -> Integer
  # [[m:OpenSSL::SSL::SSLContext#verify_mode=]] で指定できるフラグです。
  # 
  # サーバーモードであるかクライアントモードであるかによって意味がことなります。
  # 
  # サーバーモード: サーバーはクライアントに証明書を要求します。
  # 送られてきた証明書は検証されます。検証が失敗した場合、
  # TLS/SSL ハンドシェイクを即座に終了させます。
  # クライアントは要求を無視することも可能です。
  # [[m:OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT]] と同時に指定した場合は
  # クライアントが要求を無視した場合にはハンドシェイクを即座に停止します。
  # 
  # クライアントモード: サーバーの証明書を検証します。
  # 検証が失敗した場合、TLS/SSL ハンドシェイクを即座に終了させます。
  # サーバーが証明書を返さずに、anonymous cipher を用いる場合、
  # VERIFY_PEER は無視されます。ただし、anonymous cipher はデフォルトでは
  # 無効になっています。
  # 
  # anonymous cipher が有効であるかどうかは
  # [[m:OpenSSL::SSLContext#cipher=]] で設定できます。
  def VERIFY_PEER; end

end
