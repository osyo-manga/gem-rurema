class OpenSSL::SSL::SSLContext
  # --- ca_file -> String | nil
  # 接続相手の検証のために使う、信頼している CA 証明書ファイルのパスを返します。
  # 
  # 設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#ca_file=]]
  def ca_file; end

  # --- ca_file=(ca)
  # 接続相手の検証のために使う、信頼している CA 証明書ファイルのパスを
  # 設定します。
  # 
  # ファイルは以下のように複数の証明書を含んでいても構いません。
  # 
  #   (ここに証明書の説明)
  # 
  #   -----BEGIN CERTIFICATE-----
  #   ... (CA certificate in base64 encoding) ...
  #   -----END CERTIFICATE-----
  # 
  #   (ここに証明書の説明)
  # 
  #   -----BEGIN CERTIFICATE-----
  #   ... (CA certificate in base64 encoding) ...
  #   -----END CERTIFICATE-----
  # 
  # デフォルトは nil です。
  # 
  # @param ca CA証明書ファイルのパス文字列
  # @see [[m:OpenSSL::SSL::SSLContext#ca_file=]]
  def ca_file=; end

  # --- ca_path -> String | nil
  # 信頼している CA 証明書ファイルを含むディレクトリを返します。
  # 
  # 設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#ca_path=]]
  def ca_path; end

  # --- ca_path=(ca)
  # 接続相手の証明書の検証のために使う、
  # 信頼している CA 証明書ファイルを含むディレクトリを設定します。
  # 
  # そのディレクトリに含まれる
  # 証明書のファイル名は証明書のハッシュ値文字列でなければなりません。
  # 
  # @param ca CA 証明書ファイルを含むディレクトリ名文字列
  # @see [[m:OpenSSL::SSL::SSLContext#ca_path]]
  def ca_path=; end

  # --- cert -> OpenSSL::X509::Certificate
  # 自分自身を証明するための証明書を返します。
  # 
  # デフォルトは nil (証明書なし)です。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#cert=]]
  def cert; end

  # --- cert=(certificate)
  # 自分自身を証明するための証明書を設定します。
  # 
  # デフォルトは nil (証明書なし)です。
  # 
  # @param certificate 設定する証明書([[c:OpenSSL::X509::Certificate]] のインスタンス)
  # @see [[m:OpenSSL::SSL::SSLContext#cert]]
  def cert=; end

  # --- cert_store -> OpenSSL::X509::Store | nil
  # 接続相手の証明書の検証のために使う、信頼している CA 証明書を
  # 含む証明書ストアを返します。
  # 
  # デフォルトは nil です。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#cert_store=]]
  def cert_store; end

  # --- cert_store=(store) 
  # 接続相手の証明書の検証のために使う、信頼している CA 証明書を
  # 含む証明書ストアを設定します。
  # 
  # 通常は [[m:OpenSSL::SSL::SSLContext#ca_path=]] や
  # [[m:OpenSSL::SSL::SSLContext#ca_file=]] で証明書を設定しますが、
  # CRL を使いたいなど、より詳細な設定をしたい場合にはこれを使います。
  # 
  # デフォルトは nil (証明書ストアを指定しない)です。
  # 
  # @param store 設定する証明書ストア([[c:OpenSSL::X509::Store]] のインスタンス)
  # @see [[m:OpenSSL::SSL::SSLContext#cert_store]]
  def cert_store=; end

  # --- ciphers -> [[String, String, Integer, Integer]]
  # 利用可能な共通鍵暗号の種類を配列で返します。
  # 
  # 配列の各要素は以下のような配列です
  #   [暗号方式の名前の文字列, 利用可能なSSL/TLSのバージョン文字列, 鍵長(ビット数), アルゴリズムのビット長]
  # 例:
  #   require 'openssl'
  #   ctx = OpenSSL::SSL::SSLContext.new('TLSv1')
  #   ctx.ciphers
  #   # => [["DHE-RSA-AES256-SHA", "TLSv1/SSLv3", 256, 256], 
  #   #     ["DHE-DSS-AES256-SHA", "TLSv1/SSLv3", 256, 256], ... ]
  def ciphers; end

  # --- ciphers=(ciphers)
  # 利用可能な共通鍵暗号を設定します。
  # 
  # これによって、SSL コネクションにおいて
  # 特定の共通鍵暗号だけを利用可能にすることができます。
  # 
  # 指定の方法は2種類あります。1つは
  #   "ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH"
  # のような文字列で指定する方法で、もう一つは配列で
  #   ["ALL", "!ADH", "!LOW", "!EXP", "!MD5", "@STRENGTH"]
  # という配列で指定する方法です。上の2つの例は同じ
  # 内容を意味しています。
  # 詳しくは OpenSSL のマニュアルの
  # SSL_CTX_set_cipher_list の項を見てください。
  # 
  # @param ciphers 利用可能にする共通鍵暗号の種類
  # @raise OpenSSL::SSL::SSLError 設定に失敗した場合に発生します
  def ciphers=; end

  # --- client_ca -> [OpenSSL::X509::Certificate] | OpenSSL::X509::Certificate | nil
  # クライアント証明書を要求する時にクライアントに送る CA のリスト
  # を返します。
  # 
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#client_ca=]]
  def client_ca; end

  # --- client_ca=(ca)
  # クライアント証明書を要求する時にクライアントに送る CA 証明書のリスト
  # を設定します。
  # 
  # クライアントは提示した CA から利用可能(署名されている)な証明書を
  # 送り返します。
  # 
  # このメソッドはサーバ側でのみ意味を持ちます。
  # 
  # [[c:OpenSSL::X509::Certificate]] の配列を渡します。1つの場合は
  # [[c:OpenSSL::X509::Certificate]] オブジェクト自体を渡してもかまいません。
  # 
  # @param ca クライアント証明書を要求するときに提示する証明書の配列
  # @see [[m:OpenSSL::SSL::SSLContext#client_ca]]
  def client_ca=; end

  # --- client_cert_cb -> Proc | nil
  # [[m:OpenSSL::SSL::SSLContext#cert=]] でクライアント証明書を
  # セットしていなかった場合にサーバからクライアント証明書の要求が来たときに
  # 呼びだされるコールバックオブジェクトを返します。
  # 
  # デフォルトは nil (コールバックなし)です。
  # @see [[m:OpenSSL::SSL::SSLContext#client_cert_cb=]]
  def client_cert_cb; end

  # --- client_cert_cb=(cb)
  # [[m:OpenSSL::SSL::SSLContext#cert=]] でクライアント証明書を
  # セットしていなかった場合にサーバからクライアント証明書の要求が来たときに
  # 呼びだされるコールバックオブジェクトを設定します。
  # 
  # コールバックに渡される引数は以下のように
  #   proc{|sslsocket| ... }
  # 1つで、利用している [[c:OpenSSL::SSL::SSLSocket]]
  # オブジェクトが渡されます。そのオブジェクトから必要な証明書を見つけるのに
  # 必要な情報を取得します。
  # コールバックはクライアント証明書([[c:OpenSSL::X509::Certificate]])
  # とその秘密鍵([[c:OpenSSL::PKey::PKey]])のペアの配列を返さなければなりません。
  # 
  # 証明書と鍵が見付からない場合は nil を返してください。
  # また、このコールバック内で例外が発生すると、適当な証明書が見付からなかったと
  # 判断されます。このとき例外は OpenSSL のライブラリによって握り潰されて
  # しまいます。
  # 
  # デフォルトは nil で、コールバックなしを意味します。この場合は
  # クライアント証明書は利用されません。
  # 
  # このメソッドはクライアント側でのみ意味を持ちます。
  # 
  # 例
  #   require 'openssl'
  #   ctx = OpenSSL::SSL::SSLContext.new(ssl_method)
  #   ctx.client_cert_cb = proc{|sslsocket|
  #     # sslsocket からコネクションの情報を取り出し、
  #     # クライアント証明書(cert)とその秘密鍵(privkey)を探しだす
  #     [cert, privkey]
  #   }
  # 
  # @param cb コールバックオブジェクト([[c:Proc]]、[[c:Method]] など)
  # @see [[m:OpenSSL::SSL::SSLContext#client_cert_cb]]
  def client_cert_cb=; end

  # --- extra_chain_cert -> [OpenSSL::X509::Certificate] | nil
  # 自分自身を証明する証明書からルート CA までの証明書のリストです。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#extra_chain_cert=]]
  def extra_chain_cert; end

  # --- extra_chain_cert=(certificates)
  # 自分自身を証明する証明書からルート CA までの証明書のリストを配列で設定します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#cert]] で設定した証明書から相手が持っていると
  # 期待されるルート CA 証明書までのリストを渡します。
  # 
  # これによって接続相手はチェインを辿ることでその相手が信頼していない証明書の
  # 信頼性を順に確認し、自分自身を証明する証明書の信頼性を確認します。
  # 
  # @param certificates 設定する証明書チェイン([[c:OpenSSL::X509::Certificate]] の
  #        配列)
  # @see [[m:OpenSSL::SSL::SSLContext#extra_chain_cert]]
  def extra_chain_cert=; end

  # --- flush_sessions(time=nil) -> self
  # 自身が保持しているセッションキャッシュを破棄します。
  # 
  # time に nil を渡すと現在時刻で期限切れになっている
  # キャッシュを破棄します。
  # 
  # time に [[c:Time]] オブジェクトを渡すと、その
  # 時刻で時間切れになるキャッシュを破棄します。
  # 
  # @param time キャッシュ破棄の基準時刻
  # @see [[c:OpenSSL::SSL::SSLContext#session_cache_mode=]]
  def flush_sessions; end

  # --- key -> OpenSSL::PKey::PKey | nil
  # [[m:OpenSSL::SSL::SSLContext#cert]] で得られる自分自身を証明するための
  # 証明書の公開鍵に対応する秘密鍵を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#key=]]
  def key; end

  # --- key=(key)
  # [[m:OpenSSL::SSL::SSLContext#cert=]] で設定された自分自身を証明するための
  # 証明書の公開鍵に対応する秘密鍵を設定します。
  # 
  # デフォルトな nil です。
  # 
  # @param key 設定する秘密鍵([[c:OpenSSL::PKey::PKey]] のサブクラスのインスタンス)
  # @see [[m:OpenSSL::SSL::SSLContext#key]]
  def key=; end

  # --- options -> Integer | nil
  # 設定されているオプションフラグを返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#options=]]
  def options; end

  # --- options=(options)
  # オプションを設定します。
  # 
  # 以下の値の OR で指定します。
  #   * [[m:OpenSSL::SSL::OP_ALL]]
  #   * [[m:OpenSSL::SSL::OP_CIPHER_SERVER_PREFERENCE]]
  #   * [[m:OpenSSL::SSL::OP_EPHEMERAL_RSA]]
  #   * [[m:OpenSSL::SSL::OP_NETSCAPE_CA_DN_BUG]]
  #   * [[m:OpenSSL::SSL::OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG]]
  #   * [[m:OpenSSL::SSL::OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION]]
  #   * [[m:OpenSSL::SSL::OP_NO_SSLv2]]
  #   * [[m:OpenSSL::SSL::OP_NO_SSLv3]]
  #   * [[m:OpenSSL::SSL::OP_NO_TLSv1]]
  #   * [[m:OpenSSL::SSL::OP_NO_TICKET]]
  #   * [[m:OpenSSL::SSL::OP_PKCS1_CHECK_1]]
  #   * [[m:OpenSSL::SSL::OP_PKCS1_CHECK_2]]
  #   * [[m:OpenSSL::SSL::OP_SINGLE_DH_USE]]
  #   * [[m:OpenSSL::SSL::OP_SINGLE_ECDH_USE]]
  #   * [[m:OpenSSL::SSL::OP_TLS_ROLLBACK_BUG]]
  # 
  # @param options 設定するオプションフラグ(整数値)
  # @see [[m:OpenSSL::SSL::SSLContext#options]]
  def options=; end

  # --- renegotiation_cb -> nil | Proc
  # 
  # ハンドシェイク開始時に呼び出されるコールバックを得ます。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#renegotiation_cb=]]
  def renegotiation_cb; end

  # --- renegotiation_cb=(cb)
  # @todo
  # 
  # ハンドシェイク開始時に呼び出されるコールバックを設定します。
  # 
  # コールバックには [[c:OpenSSL::SSL::SSLSocket]] オブジェクトが
  # 渡されます。
  # 
  # このコールバック内で何らかの例外が生じた場合には
  # 以降のSSLの処理を停止します。
  # 
  # 再ネゴシエーションのたびにこのコールバックが呼び出されるため、
  # 何らかの理由で再ネゴシエーションを禁止したい場合などに利用できます。
  # 
  # nil を渡すとコールバックは無効になります。
  # 
  # 
  # 以下の例は再ネゴシエーションを一切禁止します。
  #   num_handshakes = 0
  #   ctx.renegotiation_cb = lambda do |ssl|
  #     num_handshakes += 1
  #     raise RuntimeError.new("Client renegotiation disabled") if num_handshakes > 1
  #   end
  # 
  # 
  # 
  # @param cb コールバック(Proc, Method など)もしくは nil
  # @see [[m:OpenSSL::SSL::SSLContext#renegotiation_cb]]
  def renegotiation_cb=; end

  # --- servername_cb -> Proc | nil
  # TLS の Server Name Indication(SNI) 拡張で
  # クライアント側からホスト名が伝えられてきた場合に
  # 呼びだされるコールバックを返します。
  # 
  # 詳しくは [[m:OpenSSL::SSL::SSLContext#servername_cb=]] を見てください。
  def servername_cb; end

  # --- servername_cb=(pr)
  # TLS の Server Name Indication(SNI) 拡張で
  # クライアント側からホスト名が伝えられてきた場合に
  # 呼びだされるコールバックを設定します。
  # 
  # このコールバックはハンドシェイク時に
  # クライアント側がサーバのホスト名を伝えてきた場合に
  # サーバ側で呼びだされます。このコールバック内でサーバ側に提示する証明書を
  # 調整したりします。
  # 
  # [[c:Proc]] や [[c:Method]] をコールバックオブジェクトとして
  # 渡します。コールバックに渡される引数は以下のように
  #   proc{|sslsocket, hostname| ... }
  # 2つで、1つ目は認証および暗号化通信に使われる [[c:OpenSSL::SSL::SSLSocket]]
  # オブジェクトで、2つ目がクライアント側から伝えられてきたホスト名です。
  # 
  # コールバックの返り値には認証と暗号化の設定を含んだ 
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクト、もしくは
  # nil を返さなければなりません。
  # これで得られたコンテキストオブジェクトが sslsocket に設定され、
  # コンテキストが持っている証明書などの各情報を用いてハンドシェイクを継続します。
  # コールバックが nil を返した場合には sslsocket が用いるコンテキストは
  # 変更されません。
  # 
  # @param pr コールバックオブジェクト
  # @see [[m:OpenSSL::SSL::SSLContext#servername_cb]]
  def servername_cb=; end

  # --- session_add(sess) -> bool
  # セッションを [[c:OpenSSL::SSL::SSLContext]] 内部のキャッシュ領域に
  # 追加します。
  # 
  # 成功時には真を返します。すでにキャッシュ領域にあるセッションを
  # 追加しようとした場合は追加されずに偽を返します。
  # 
  # @param sess 追加するセッション([[c:OpenSSL::SSL::Session]])
  def session_add; end

  # --- session_cache_mode -> Integer
  # セッションキャッシュのモードを返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]]
  def session_cache_mode; end

  # --- session_cache_mode=(mode)
  # セッションキャッシュのモードを指定します。
  # 
  # 以下の定数のORを引数として渡します。
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_OFF]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_CLIENT]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_SERVER]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_BOTH]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_AUTO_CLEAR]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_INTERNAL]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_INTERNAL_LOOKUP]]
  #   * [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_INTERNAL_STORE]]
  # 
  # デフォルト値は OpenSSL::SSL::SSLContext::SESSION_CACHE_SERVER です。
  # 
  # @param mode 設定するモード(整数値)
  # @see [[m:OpenSSL::SSL::SSLContext#session_cache_mode]]
  def session_cache_mode=; end

  # --- session_cache_size -> Integer
  # 自身が保持可能なセッションキャッシュのサイズを返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#session_cache_size=]]
  def session_cache_size; end

  # --- session_cache_size=(size)
  # 自身が保持可能なセッションキャッシュのサイズを指定します。
  # 
  # size に 0 を渡すと制限なしを意味します。
  # 
  # デフォルトは 1024*20 で、20000 セッションまでキャッシュを保持できます。
  # 
  # @param size セッションキャッシュのサイズ(整数値)
  # @see [[m:OpenSSL::SSL::SSLContext#session_cache_size]]
  def session_cache_size=; end

  # --- session_cache_stats -> {Symbol -> Integer}
  # セッションキャッシュの内部統計情報をハッシュテーブルで返します。
  # 
  # ハッシュテーブルの各キーとその意味は以下の通りです。
  #   * :cache_num  内部キャッシュに保持されているセッションの数
  #   * :connect クライアント側でハンドシェイクした回数
  #   * :connect_good クライアント側でハンドシェイクが成功した回数
  #   * :connect_renegotiate クライアント側で再ネゴシエイトした回数
  #   * :accept サーバ側でハンドシェイクした回数
  #   * :accept_good サーバ側でハンドシェイクが成功した回数
  #   * :accept_renegotiate サーバ側で再ネゴシエイトした回数
  #   * :cache_hits サーバ側で内部キャッシュにヒットした数
  #   * :cb_hits サーバ側で外部キャッシュにヒットした数
  #   * :cache_full キャッシュが満杯で破棄したセッションの数
  #   * :timeouts ヒットしたキャッシュがタイムアウトしてしまっていた回数
  def session_cache_stats; end

  # --- session_get_cb -> Proc | nil
  # セッションキャッシュを探索し、内部のキャッシュテーブルには
  # 見付からなかった場合に呼び出されるコールバックを返します。
  # 
  # 設定されていないときは nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#session_get_cb=]]
  def session_get_cb; end

  # --- session_get_cb=(cb)
  # セッションキャッシュを探索し、内部のキャッシュテーブルには
  # 見付からなかった場合に呼び出されるコールバックを設定します。
  # 
  # コールバックオブジェクトを call するときの引数は
  #   [ 接続オブジェクト(OpenSSL::SSL::SSLSocket), セッションID(文字列) ]
  # という配列です。このコールバックの返り値が
  # [[c:OpenSSL::SSL::Session]] オブジェクトならば、
  # それをキャッシュ値として利用します。それ以外を返したならば、
  # キャッシュは見つからなかったものとして取り扱われます。
  # 
  # セッションキャッシュについて詳しくは [[c:OpenSSL::SSL::Session]] を
  # 見てください。
  # 
  # @param cb コールバックオブジェクト([[c:Proc]] もしくは [[c:Method]])
  # @see [[m:OpenSSL::SSL::SSLContext#session_get_cb]]
  def session_get_cb=; end

  # --- session_id_context -> String | nil
  # セッション ID コンテキスト文字列を返します。
  # 
  # 設定されていない場合は nil を返します。
  # 
  # @see [[c:OpenSSL::SSL::Session]],
  #      [[m:OpenSSL::SSL::SSLContext#session_id_context=]]
  def session_id_context; end

  # --- session_id_context=(id_context)
  # セッション ID コンテキストを文字列で設定します。
  # 
  # セッション ID コンテキストは、セッションをグループ化するための
  # 識別子で、セッション ID コンテキストとセッション ID の両方が
  # 一致する場合に同一のセッションであると判別されます。
  # この [[c:OpenSSL::SSL::SSLContext]] オブジェクトで
  # 生成されたコネクション([[c:OpenSSL::SSL::SSLSocket]])に
  # 関連付けられたセッションはセッション ID コンテキスト
  # を共有します。
  # 
  # セッション ID コンテキストはセッションのグループを
  # 識別するための識別子であり、一方セッション ID は各セッションを
  # 識別するための識別子であり、この2つは異なる概念で
  # あることに注意してください。
  # 
  # クライアント側では意味を持ちません。
  # 
  # @param id_context セッション ID コンテキスト文字列(最大32バイト)
  # @see [[c:OpenSSL::SSL::Session]],
  #      [[m:OpenSSL::SSL::SSLContext#session_id_context]],
  #      [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]]
  def session_id_context=; end

  # --- session_new_cb -> Proc | nil
  # セッションが生成されたときに呼び出されるコールバックを返します。
  # 
  # 設定されていないときは nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#session_new_cb=]]
  def session_new_cb; end

  # --- session_new_cb=(cb)
  # 新たなセッションが作られたときに呼び出されるコールバックを
  # 指定します。
  # 
  # コールバックオブジェクトを call するときの引数は
  #   [ 接続オブジェクト(OpenSSL::SSL::SSLSocket), 新たなセッション(OpenSSL::SSL::Session)]
  # という配列です。
  # 
  # セッションキャッシュについて詳しくは [[c:OpenSSL::SSL::Session]] を
  # 見てください。
  # 
  # @param cb コールバックオブジェクト([[c:Proc]] もしくは [[c:Method]])
  # @see [[m:OpenSSL::SSL::SSLContext#session_new_cb]]
  def session_new_cb=; end

  # --- session_remove(sess) -> bool
  # セッションを [[c:OpenSSL::SSL::SSLContext]] 内部のキャッシュ領域から
  # 取り除きます。
  # 
  # 成功時には真を返します。キャッシュ領域に存在しないセッションを
  # 削除しようとした場合は偽を返します。
  # 
  # @param sess 削除するセッション([[c:OpenSSL::SSL::Session]])
  def session_remove; end

  # --- session_remove_cb -> Proc | nil
  # セッションが内部キャッシュから破棄されたときに呼び出される
  # コールバックを返します。
  # 
  # 設定されていないときは nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#session_remove_cb=]]
  def session_remove_cb; end

  # --- session_remove_cb=(cb)
  # セッションが内部キャッシュから破棄されたときに呼び出される
  # コールバックを設定します。
  # 
  # コールバックオブジェクトを call するときの引数は
  #   [ SSLContextオブジェクト(OpenSSL::SSL::SSLContext), 
  #     破棄されるセッション(OpenSSL::SSL::Session)]
  # という配列です。
  # 
  # セッションキャッシュについて詳しくは [[c:OpenSSL::SSL::Session]] を
  # 見てください。
  # 
  # 
  # @param cb コールバックオブジェクト([[c:Proc]] もしくは [[c:Method]])
  # @see [[m:OpenSSL::SSL::SSLContext#session_remove_cb]]
  def session_remove_cb=; end

  # --- set_params(params) -> Hash
  # パラメータをハッシュで設定します。
  # 
  # 渡すハッシュテーブルは { パラメータ名のシンボル => パラメータの値 } という
  # 形をしていなければなりません。
  # 
  # 以下のパラメータを設定できます。
  #   * :cert ([[m:OpenSSL::SSL::SSLContext#cert=]])
  #   * :key ([[m:OpenSSL::SSL::SSLContext#key=]])
  #   * :client_ca ([[m:OpenSSL::SSL::SSLContext#client_ca=]])
  #   * :ca_file ([[m:OpenSSL::SSL::SSLContext#ca_file=]])
  #   * :ca_path ([[m:OpenSSL::SSL::SSLContext#ca_path=]])
  #   * :timeout ([[m:OpenSSL::SSL::SSLContext#timeout=]])
  #   * :verify_mode ([[m:OpenSSL::SSL::SSLContext#verify_mode=]])
  #   * :verify_depth ([[m:OpenSSL::SSL::SSLContext#verify_depth=]])
  #   * :verify_callback ([[m:OpenSSL::SSL::SSLContext#verify_callback=]])
  #   * :options ([[m:OpenSSL::SSL::SSLContext#options=]])
  #   * :cert_store ([[m:OpenSSL::SSL::SSLContext#cert_store=]])
  #   * :extra_chain_cert ([[m:OpenSSL::SSL::SSLContext#extra_chain_cert=]])
  #   * :client_cert_cb ([[m:OpenSSL::SSL::SSLContext#client_cert_cb=]])
  #   * :tmp_dh_callback ([[m:OpenSSL::SSL::SSLContext#tmp_dh_callback=]])
  #   * :session_id_context ([[m:OpenSSL::SSL::SSLContext#session_id_context=]])
  #   * :session_get_cb ([[m:OpenSSL::SSL::SSLContext#session_get_cb=]])
  #   * :session_new_cb ([[m:OpenSSL::SSL::SSLContext#session_new_cb=]])
  #   * :session_remove_cb ([[m:OpenSSL::SSL::SSLContext#session_remove_cb=]])
  #   * :servername_cb ([[m:OpenSSL::SSL::SSLContext#servername_cb=]])
  # 指定されなかったパラメータは [[m:OpenSSL::SSL::SSLContext::DEFAULT_PARAMS]] 
  # の値で初期化されます。
  def set_params; end

  # --- timeout -> Integer | nil
  # --- ssl_timeout -> Integer | nil
  # 
  # このコンテキストから生成するセッションのタイムアウト秒数を返します。
  # 
  # デフォルト値は nil です。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#timeout=]]
  def ssl_timeout; end

  # --- timeout=(seconds)
  # --- ssl_timeout=(seconds)
  # 
  # このコンテキストから生成するセッションのタイムアウト秒数を設定します。
  # 
  # nil を指定すると OpenSSL のデフォルトのタイムアウト秒数(300秒)を用います。
  # 
  # @param seconds タイムアウト秒数(整数)
  # @see [[m:OpenSSL::SSL::Session#timeout]]
  def ssl_timeout=; end

  # --- ssl_version=(ver)
  # 利用するプロトコルの種類を文字列もしくは
  # シンボルで指定します。
  # 
  # [[m:OpenSSL::SSL::SSLContext.new]] で指定できるものと同じです。
  # 
  # @param ver 利用するプロトコルの種類
  def ssl_version=; end

  # --- tmp_dh_callback -> Proc | nil
  # 一時的 DH 鍵を生成するためのコールバックを返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#tmp_dh_callback=]]
  def tmp_dh_callback; end

  # --- tmp_dh_callback=(cb)
  # 一時的 DH 鍵を生成するためのコールバックを設定します。
  # 
  # コールバックには [[c:Proc]] や [[c:Method]] を渡します。
  # 
  # 暗号で一時的な DH 鍵を利用する場合にはこのコールバックが
  # 呼びだされ、呼びだされたブロックは適切な鍵パラメータを返さなければ
  # なりません。これで設定するブロックは
  #   proc{|sslsocket, is_export, keylen| ... }
  # という引数を取るようにします。それぞれの引数の意味は
  #   * sslsocket 通信に使われる [[c:OpenSSL::SSL::SSLSocket]] オブジェクト
  #   * is_export 輸出規制のある暗号を利用するかどうかを0か0以外かで指定
  #   * keylen 鍵長
  # となります。ブロックの返り値には適切な鍵パラメータを含む 
  # [[c:OpenSSL::PKey::DH]] オブジェクトを返します。鍵パラメータは
  # keylen で指定された鍵長に対応したものでなければなりません。
  # 
  # [[c:OpenSSL::PKey::DH]] は DH パラメータと DH 鍵対を
  # 保持していますが、これで返されるオブジェクトはパラメータしか
  # 用いられません。
  # 
  # cb に nil を指定するとデフォルトのパラメータが利用されます。
  # 
  # デフォルト値は nil です。
  # 
  # @param cb 設定するコールバック
  # @see [[m:OpenSSL::SSL::SSLContext#tmp_dh_callback]]
  def tmp_dh_callback=; end

  # --- verify_callback -> Proc | nil
  # オブジェクトに設定されている検証をフィルタするコールバックを
  # 返します。
  # 
  # デフォルトのコールバックが設定されている場合には nil を返します。
  # 
  # @see [[m:OpenSSL::X509::Store#verify_callback]],
  #      [[m:OpenSSL::SSL::SSLContext#verify_callback=]]
  def verify_callback; end

  # --- verify_callback=(proc)
  # 検証をフィルタするコールバックを設定します。
  # 
  # [[m:OpenSSL::X509::Store#verify_callback=]] と同じ働きをします。
  # 
  # コールバックには [[c:Proc]] や [[c:Method]] を渡します。
  # 
  # 渡されたコールバックオブジェクトは証明書チェインの検証時に
  # チェインに含まれる各証明書の署名を検証するたびに呼びだされます。
  # そのときに渡される引数は2つで、1つめは検証が成功したかの真偽値、
  # 2つめは検証後の状態を保存した
  # [[c:OpenSSL::X509::StoreContext]] オブジェクトです。
  # このコールバックには2つの役割があります。1つ目はコンテキストオブジェクト
  # を調べることで詳細なエラー情報を得ることです。2つ目は検証をカスタマイズ
  # することです。このコールバックが true を返すと、たとえ
  # OpenSSL が検証失敗と判定しても、検証が成功したものと判断し証明書チェイン
  # の検証を続けます。逆に false を返すと、検証が失敗したものとみなされ
  # 検証を停止し、検証メソッドは検証失敗を返します。詳細なエラー情報を
  # 得たいだけの場合はコールバックは第一引数をそのまま返すようにしてください。
  # 
  # nil を設定するとデフォルトのコールバック(単に第一引数をそのまま返すだけ)
  # が使われます。
  # 
  # 初期状態は nil です。
  # 
  # @param proc 設定する [[c:Proc]] オブジェクト
  # @see [[m:OpenSSL::SSL::SSLContext#verify_callback]],
  #      [[m:OpenSSL::X509::Store#verify_callback=]]
  def verify_callback=; end

  # --- verify_depth -> Integer | nil
  # 証明書チェイン上の検証する最大の深さを返します。
  # 
  # デフォルトは nil です。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#verify_depth=]]
  def verify_depth; end

  # --- verify_depth=(depth)
  # 証明書チェイン上の検証する最大の深さを設定します。
  # 
  # デフォルトは nil で、この場合 OpenSSL のデフォルト値(9)が使われます。
  # 
  # @param depth 最大深さを表す整数
  # @see [[m:OpenSSL::SSL::SSLContext#verify_depth]]
  def verify_depth=; end

  # --- verify_mode -> Integer | nil
  # 検証モードを返します。
  # 
  # デフォルトは nil です。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#verify_mode=]]
  def verify_mode; end

  # --- verify_mode=(mode)
  # 検証モードを設定します。
  # 
  # 以下の定数の OR を取って指定します。
  #   * [[m:OpenSSL::SSL::VERIFY_NONE]]
  #   * [[m:OpenSSL::SSL::VERIFY_PEER]]
  #   * [[m:OpenSSL::SSL::VERIFY_CLIENT_ONCE]]
  #   * [[m:OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT]]
  # これらの定数の意味はクライアントモードとサーバモードでは異なる
  # 意味を持ちます。
  # 
  # デフォルトは nil で、VERIFY_NONE を意味します。
  # 
  # @param mode 設定するモード(整数値)
  # @see [[m:OpenSSL::SSL::SSLContext#verify_mode]]
  def verify_mode=; end

  # --- new(ssl_method) -> OpenSSL::SSL::SSLContext
  # --- new -> OpenSSL::SSL::SSLContext
  # SSL コンテキストオブジェクトを生成します。
  # 
  # ssl_method で利用するプロトコルの種類を文字列もしくは
  # シンボルで指定します。以下のいずれかが利用可能です。
  #   * 'TLSv1'         TLSv1サーバクライアント両用
  #   * 'TLSv1_server'  TLSv1サーバ用
  #   * 'TLSv1_client'  TLSv1クライアント用
  #   * 'TLSv1_1'
  #   * 'TLSv1_1_server'
  #   * 'TLSv1_1_client'
  #   * 'TLSv1_2'
  #   * 'TLSv1_2_server'
  #   * 'TLSv1_2_client'
  #   * 'SSLv2'         SSLv2サーバクライアント両用
  #   * 'SSLv2_server'  SSLv2サーバ用
  #   * 'SSLv2_client'  SSLv2クライアント用
  #   * 'SSLv3'         SSLv3サーバクライアント両用
  #   * 'SSLv3_server'  SSLv3サーバ用
  #   * 'SSLv3_client'  SSLv3クライアント用
  #   * 'SSLv23'        SSLv2,3/TLSv1サーバクライアント両用
  #   * 'SSLv23_server' SSLv2,3/TLSv1サーバ用
  #   * 'SSLv23_client' SSLv2,3/TLSv1クライアント用
  # SSLv2 はプロトコル上の脆弱性が明らかにされているため使うべきではありません。
  # 
  # SSLv2 は無効化して SSLv3 と TLSv1 の両方を有効化するためには
  # 'SSLv23' を指定し、[[m:OpenSSL::SSL::SSLContext#options=]] で
  # [[m:OpenSSL::SSL::OP_NO_SSLv2]] を指定します。
  # 
  # @param ssl_method プロトコルを表す文字列もしくはシンボル
  # @see [[m:OpenSSL::SSL::SSLContext#ssl_version=]]
  def new; end

  # --- DEFAULT_CERT_STORE -> OpenSSL::X509::Store
  # [[m:OpenSSL::SSL::SSLContext#set_params]] で信頼する CA 証明書
  # (ca_file, ca_path, cert_store) を一切指定しなかった場合に
  # デフォルトで使われる証明書ストアです。
  # 
  # [[m:OpenSSL::X509::Store#set_default_paths]] でシステムが提供する
  # 証明書を利用するように設定されています。
  def DEFAULT_CERT_STORE; end

  # --- DEFAULT_PARAMS -> { Symbol -> object }
  # [[m:OpenSSL::SSL::SSLContext#set_params]] でデフォルト値として使われる
  # パラメータです。
  def DEFAULT_PARAMS; end

  # --- METHODS -> [Symbol]
  # 利用可能なメソッド(プロトコル)を [[c:Symbol]] の配列で返します。
  # 
  #   require 'openssl'
  #   OpenSSL::SSL::SSLContext::METHODS
  #   # => [:TLSv1, :TLSv1_server, :TLSv1_client, :SSLv2, :SSLv2_server, ...]
  def METHODS; end

  # --- SESSION_CACHE_BOTH -> Integer
  # サーバ側、クライアント側両方でセッションをキャッシュすることを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  # 
  # 実際には
  # [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_SERVER]] と
  # [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_CLIENT]] のビット論理和
  # を取った値です。
  def SESSION_CACHE_BOTH; end

  # --- SESSION_CACHE_CLIENT -> Integer
  # クライアント側セッションをキャッシュに追加することを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  # 
  # クライアント側においては、OpenSSL ライブラリがどのセッションを
  # 再利用するべきか確実に判定する方法はないので、再利用する場合は
  # [[m:OpenSSL::SSL::SSLSocket#session=]] によって明示的に
  # セッションを指定しなければなりません。
  def SESSION_CACHE_CLIENT; end

  # --- SESSION_CACHE_NO_AUTO_CLEAR -> Integer
  # [[c:OpenSSL::SSL::SSLContext]] 内部の
  # セッションキャッシュ領域を自動的にクリアしないことを意味します。
  # 
  # 通常では255コネクションごとにキャッシュを破棄しますが、この
  # フラグを有効にするとそれをしなくなります。
  # 代わりに適当なタイミングで
  # [[m:OpenSSL::SSL::SSLContext#flush_sessions]] を呼び
  # キャッシュを破棄しなければなりません。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  def SESSION_CACHE_NO_AUTO_CLEAR; end

  # --- SESSION_CACHE_NO_INTERNAL -> Integer
  # [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_INTERNAL_STORE]]
  # と
  # [[m:OpenSSL::SSL::SSLContext::SESSION_CACHE_NO_INTERNAL_LOOKUP]]
  # の両方を有効にすることを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  def SESSION_CACHE_NO_INTERNAL; end

  # --- SESSION_CACHE_NO_INTERNAL_LOOKUP -> Integer
  # サーバ側でセッションキャッシュが必要になった場合
  # [[c:OpenSSL::SSL::SSLContext]] が保持するキャッシュ領域
  # を探索しないことを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  # 
  # このフラグを ON にすると、キャッシュの探索が必要になった
  # 場合必ずコールバック([[c:OpenSSL::SSL::SSLContext#session_get_cb=]]
  # で設定したもの)を呼ぶようになります。
  def SESSION_CACHE_NO_INTERNAL_LOOKUP; end

  # --- SESSION_CACHE_NO_INTERNAL_STORE -> Integer
  # セッションキャッシュを [[c:OpenSSL::SSL::SSLContext]] 内部の
  # キャッシュ領域に保持しないことを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  # 
  # ハンドシェイクによってセッションが開始された場合には
  # そのセッションを [[c:OpenSSL::SSL::SSLContext]] 内部に
  # キャッシュとして保持しますが、
  # このフラグを有効にすると自動的にキャッシュされることは
  # なくなります。
  def SESSION_CACHE_NO_INTERNAL_STORE; end

  # --- SESSION_CACHE_OFF -> Integer
  # セッションをキャッシュしないことを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  def SESSION_CACHE_OFF; end

  # --- SESSION_CACHE_SERVER -> Integer
  # サーバ側でセッションをキャッシュすることを意味します。
  # 
  # [[m:OpenSSL::SSL::SSLContext#session_cache_mode=]] に
  # 渡すフラグとして用います。
  # 
  # このフラグが立っているとサーバ側の [[c:OpenSSL::SSL::SSLContext]] 
  # でセッションキャッシュの保持と管理、再利用が
  # 行われます。
  # 
  # このフラグはデフォルトで有効になっています。
  def SESSION_CACHE_SERVER; end

end
