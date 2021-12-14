class Net::IMAP
  # --- add_response_handler(handler) -> ()
  # --- add_response_handler(handler){|resp| ...} -> ()
  # レスポンスハンドラを追加します。
  # 
  # レスポンスハンドラはサーバから応答を受け取るごとに
  # 呼びだされます。ハンドラには
  # [[c:Net::IMAP::TaggedResponse]] もしくは
  # [[c:Net::IMAP::UntaggedResponse]] オブジェクトが
  # 渡されます。
  # 
  # 主にサーバからの非同期的なイベントを受け取るため
  # に用います。例えば EXISTS 応答を受け取る
  # (メールボックスに新たなメールが追加されたタイミングで発生します)
  # ためなどに用いられます。
  # 
  # レスポンスハンドラはメインのスレッドとは別のスレッドで
  # 呼びだされることに注意してください。
  # 
  # 例:
  # 
  #   imap.add_response_handler do |resp|
  #     p resp
  #   end
  # 
  # @param handler 追加するハンドラ([[c:Proc]] や [[c:Method]] オブジェクト)
  # @see [[m:Net::IMAP#remove_response_handler]]
  def add_response_handler; end

  # --- append(mailbox, message, flags = nil, date_time = nil) -> Net::IMAP::TaggedResponse
  # 
  # APPEND コマンドを送ってメッセージをメールボックスの末尾に追加します。
  # 
  # 
  # 例:
  #   imap.append("inbox", <<EOF.gsub(/\n/, "\r\n"), [:Seen], Time.now)
  #   Subject: hello
  #   From: someone@example.com
  #   To: somebody@example.com
  #   
  #   hello world
  #   EOF
  # 
  # @param mailbox メッセージを追加するメールボックス名(文字列)
  # @param message メッセージ文字列
  # @param flags メッセージに付加するフラグ([[c:Symbol]] の配列)
  # @param date_time メッセージの時刻([[c:Time]] オブジェクト)。省略時は現在時刻が使われる
  # @raise Net::IMAP::NoResponseError メールボックスが存在しない場合に発生します
  def append; end

  # --- authenticate(auth_type, user, password) -> Net::IMAP::TaggedResponse
  # 
  # AUTHENTICATE コマンドを送り、クライアントを認証します。
  # 
  # auth_type で利用する認証方式を文字列で指定します。
  # 
  # 
  # 例:
  #   imap.authenticate('LOGIN', user, password)
  # 
  # auth_type としては以下がサポートされています。
  #   * "LOGIN"
  #   * "PLAIN"
  #   * "CRAM-MD5"
  #   * "DIGEST-MD5"
  # 
  # @param auth_type 認証方式を表す文字列
  # @param user ユーザ名文字列
  # @param password パスワード文字列
  # @see [[m:Net::IMAP#login]]
  def authenticate; end

  # --- capability -> [String]
  # CAPABILITY コマンドを送ってサーバがサポートしている
  # 機能(capabilities)のリストを文字列の配列として返します。
  # 
  # capability は IMAP に関連する RFC などで定義されています。
  # 
  #   imap.capability
  #   # => ["IMAP4REV1", "UNSELECT", "IDLE", "NAMESPACE", "QUOTA", ... ]
  def capability; end

  # --- check -> Net::IMAP::TaggedResponse
  # CHECK コマンドを送り、現在処理しているメールボックスの
  # チェックポイントを要求します。
  # 
  # チェックポイントの要求とは、サーバ内部で保留状態になっている
  # 操作を完了させることを意味します。例えばメモリ上にあるメールの
  # データをディスクに書き込むため、fsyncを呼んだりすることです。
  # 実際に何が行なわれるかはサーバの実装によりますし、何も行なわれない
  # 場合もあります。
  def check; end

  # --- client_thread -> Thread
  # このメソッドは obsolete です。使わないでください。
  def client_thread; end

  # --- client_thread=(th)
  # このメソッドは obsolete です。使わないでください。
  def client_thread=; end

  # --- close -> Net::IMAP::TaggedResponse
  # CLOSE コマンドを送り、処理中のメールボックスを閉じます。
  # 
  # このコマンドによって、どのメールボックスも選択されていない
  # 状態に移行します。
  # そして \Deleted フラグが付けられたメールがすべて削除されます。
  def close; end

  # --- copy(set, mailbox) -> Net::IMAP::TaggedResponse
  # COPY コマンドを送り、指定したメッセージを
  # 指定したメールボックスの末尾に追加します。
  # 
  # set でコピーするメッセージを指定します。
  # message sequence number(整数)、
  # message sequence numberの配列、もしくは [[c:Range]] で
  # 指定します。コピー元のメールボックスは
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したものを用います。
  # mailbox はコピー先のメールボックスです。
  # 
  # @param set コピーするメッセージの message sequence number
  # @param mailbox コピー先のメールボックス(文字列)
  # @see [[m:Net::IMAP#uid_copy]]
  def copy; end

  # --- create(mailbox) -> Net::IMAP::TaggedResponse
  # CREATE  コマンドを送り、新しいメールボックスを作ります。
  # 
  # @param mailbox 新しいメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError 指定した名前のメールボックスが作れなかった場合に発生します
  def create; end

  # --- delete(mailbox) -> Net::IMAP::TaggedResponse
  # DELETE コマンドを送り、指定したメールボックスを削除します。
  # 
  # @param mailbox 削除するメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError 指定した名前のメールボックスを削除できなかった場合
  #        に発生します。指定した名前のメールボックスが存在しない場合や、
  #        ユーザにメールボックスを削除する権限がない場合に発生します。
  def delete; end

  # --- disconnect -> nil
  # サーバとの接続を切断します。
  # 
  # @see [[m:Net::IMAP#disconnected?]]
  def disconnect; end

  # --- disconnected? -> bool
  # 
  # サーバとの接続が切断されていれば真を返します。
  # 
  # @see [[m:Net::IMAP#disconnect]]
  def disconnected?; end

  # --- examine(mailbox) -> Net::IMAP::TaggedResponse
  # EXAMINE コマンドを送り、指定したメールボックスを処理対象の
  # メールボックスにします。
  # 
  # [[m:Net::IMAP#select]] と異なりセッション中はメールボックスが
  # 読み取り専用となります。それ以外は select と同じです。
  # 
  # @param mailbox 処理対象としたいメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError mailboxが存在しない等の理由でコマンドの実行に失敗
  #        した場合に発生します。
  def examine; end

  # --- expunge -> [Integer] | nil
  # EXPUNGEコマンドを送り、:Deletedフラグをセットしたメッセージを
  # すべて処理中のメールボックスから削除します。
  # 
  # 削除したメッセージの message sequence number を配列で返します。
  # 
  # @raise Net::IMAP::NoResponseError メールボックスが read-only である場合に発生します
  def expunge; end

  # --- fetch(set, attr) -> [Net::IMAP::FetchData]
  # 
  # FETCH コマンドを送り、メールボックス内のメッセージに
  # 関するデータを取得します。
  # 
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したメールボックスを対象とします。
  # 
  # set で対象とするメッセージを指定します。
  # これには sequence number、sequence number の配列、もしくは
  # [[c:Range]] オブジェクトを渡します。
  # attr には取得するアトリビュートを文字列の配列で渡してください。
  # 指定可能なアトリビュートについては [[m:Net::IMAP::FetchData#attr]] 
  # を見てください。
  # 
  # 例:
  # 
  #   p imap.fetch(6..8, "UID")
  #   #=> [#<Net::IMAP::FetchData seqno=6, attr={"UID"=>98}>, #<Net::IMAP::FetchData seqno=7, attr={"UID"=>99}>, #<Net::IMAP::FetchData seqno=8, attr={"UID"=>100}>]
  #   p imap.fetch(6, "BODY[HEADER.FIELDS (SUBJECT)]")
  #   #=> [#<Net::IMAP::FetchData seqno=6, attr={"BODY[HEADER.FIELDS (SUBJECT)]"=>"Subject: test\r\n\r\n"}>]
  #   data = imap.uid_fetch(98, ["RFC822.SIZE", "INTERNALDATE"])[0]
  #   p data.seqno
  #   #=> 6
  #   p data.attr["RFC822.SIZE"]
  #   #=> 611
  #   p data.attr["INTERNALDATE"]
  #   #=> "12-Oct-2000 22:40:59 +0900"
  #   p data.attr["UID"]
  #   #=> 98
  # 
  # @param set 処理対象のメッセージの sequence number
  # @param attr アトリビュート(文字列配列)
  # @see [[m:Net::IMAP#uid_fetch]]
  def fetch; end

  # --- getacl(mailbox) -> [Net::IMAP::MailboxACLItem]
  # GETACL コマンドを送り、メールボックスの 
  # ACL(Access Control List) を取得します。
  # 
  # [[m:Net::IMAP#getacl]] で指定したメールボックスに
  # 対し何らかの権限を持つ各ユーザに対して
  # [[c:Net::IMAP::MailboxACLItem]] オブジェクトが
  # 作られ、その配列が返されます。
  # 
  # GETACL コマンドは [[RFC:2086]] で定義されています。
  # 詳しくはそちらを参照してください。
  # 
  # @param mailbox メールボックス名(文字列)
  # @see [[c:Net::IMAP::MailboxACLItem]]
  def getacl; end

  # --- getquota(mailbox) -> [Net::IMAP::MailboxQuota]
  # GETQUOTA コマンドを送って
  # 指定したメールボックスの quota の情報を返します。
  # 
  # quota の情報は [[c:Net::IMAP::MailboxQuota]] オブジェクトの配列で
  # 得られます。
  # 
  # 詳しくは [[RFC:2087]] を見てください。
  # このコマンドは [[m:Net::IMAP#capability]] の返り値を見ることで
  # 利用可能かどうか判断できます。
  # 
  # @param mailbox quota 情報を得たいメールボックス名
  # @raise Net::IMAP::NoResponseError 指定したメールボックスが quota root でない場合に発生します
  def getquota; end

  # --- getquotaroot(mailbox) -> [Net::IMAP::MailboxQuotaRoot | Net::IMAP::MailboxQuota]
  # GETQUOTAROOT コマンドを送って
  # 指定したメールボックスの quota root の一覧と、
  # 関連する quota の情報を返します。
  # 
  # quota root の情報は [[c:Net::IMAP::MailboxQuotaRoot]] のオブジェクトで、
  # 返り値の配列の中に唯一含まれています。
  # quota の情報はメールボックスに関連付けられた quota root ごとに
  # [[c:Net::IMAP::MailboxQuota]] オブジェクトで得られます。
  # 
  # 詳しくは [[RFC:2087]] を見てください。
  # このコマンドは [[m:Net::IMAP#capability]] の返り値を見ることで
  # 利用可能かどうか判断できます。
  # 
  # @param mailbox quota root を得たいメールボックス名(文字列)
  # @raise Net::IMAP::NoResponseError 指定したメールボックスが存在しない場合に発生します
  def getquotaroot; end

  # --- greeting -> Net::IMAP::UntaggedResponse
  # サーバから最初に送られてくるメッセージ(greeting message)
  # を返します。
  def greeting; end

  # --- idle {|resp| ...} -> Net::IMAP::TaggedResponse
  # IDLE 命令を送り、メールボックスの非同期的変化を待ち受けます。
  # 
  # このメソッドに渡したブロックは
  # [[m:Net::IMAP#add_response_handler]] によって
  # レスポンスハンドラとして用いられます。
  # また、このメソッドが終了する時点で
  # [[m:Net::IMAP#remove_response_handler]] で
  # ハンドラが削除されます。
  # 
  # レスポンスハンドラについては
  # [[m:Net::IMAP#add_response_handler]] を参照してください。
  # 
  # 別のスレッドが [[m:Net::IMAP#idle_done]] を呼びだすまで
  # このメソッドを呼びだしたスレッドは停止します。
  # 
  # この命令は [[RFC:2177]] で定義されています。詳しくはそちらを
  # 参照してください。
  def idle; end

  # --- idle_done -> ()
  # [[m:Net::IMAP#idle]] で
  # 停止しているスレッドを1つ起こします。
  def idle_done; end

  # --- list(refname, mailbox) -> [Net::IMAP::MailboxList] | nil
  # 
  # LIST コマンドを送り、クライアントから利用可能なメールボックス名の集合から
  # 引数にマッチするものすべてを返します。
  # 
  # 詳しくは  [[RFC:2060]] の 6.3.8 を参照してください。
  # 
  # 返り値は [[c:Net::IMAP::MailboxList]] の配列で返します。
  # 返り値が空集合である場合は空の配列でなく nil を返します。
  # 
  # @param refname 参照名(文字列)
  # @param mailbox 調べるメールボックスの名前(文字列)。ワイルドカードを含んでいてもかまいません。
  # 
  # 例:
  #   imap.create("foo/bar")
  #   imap.create("foo/baz")
  #   p imap.list("", "foo/%")
  #   #=> [#<Net::IMAP::MailboxList attr=[:Noselect], delim="/", name="foo/">, #<Net::IMAP::MailboxList attr=[:Noinferiors, :Marked], delim="/", name="foo/bar">, #<Net::IMAP::MailboxList attr=[:Noinferiors], delim="/", name="foo/baz">]
  def list; end

  # --- login(user, password) -> Net::IMAP::TaggedResponse
  # LOGIN コマンドを送り、平文でパスワードを送りクライアント
  # ユーザを認証します。
  # 
  # [[m:Net::IMAP#authenticate]] で "LOGIN" を使うのとは異なる
  # ことに注意してください。authenticate では AUTHENTICATE コマンドを
  # 送ります。
  # 
  # 認証成功時には
  # 認証成功レスポンスを返り値として返します。
  # 
  # 認証失敗時には例外が発生します。
  # 
  # @param user ユーザ名文字列
  # @param password パスワード文字列
  # @raise Net::IMAP::NoResponseError 認証に失敗した場合に発生します
  # @see [[m:Net::IMAP#authenticate]]
  def login; end

  # --- logout -> Net::IMAP::TaggedResponse
  # LOGOUT コマンドを送り、コネクションを切断することを
  # サーバに伝えます。
  def logout; end

  # --- lsub(refname, mailbox) -> [Net::IMAP::MailboxList]
  # 
  # LIST コマンドを送り、active/subscribed なメールボックス名の集合から
  # 引数にマッチするものすべてを返します。
  # 
  # 詳しくは  [[RFC:2060]] の 6.3.8 を参照してください。
  # 
  # 返り値は [[c:Net::IMAP::MailboxList]] の配列で返します。
  # 返り値が空集合である場合は空の配列でなく nil を返します。
  # 
  # @param refname 参照名(文字列)
  # @param mailbox 調べるメールボックスの名前(文字列)。ワイルドカードを含んでいてもかまいません。
  def lsub; end

  # --- move(set, mailbox) -> Net::IMAP::TaggedResponse
  # MOVEコマンドを送り、set で指定したメッセージを mailbox の
  # 末尾に移動させます。
  # 
  # set はmessage sequence number(整数)、
  # message sequence numberの配列、もしくは [[c:Range]] で
  # 指定します。
  # 
  # コピー元のメールボックスは
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したものを用います。
  # 
  # @param set 移動するメッセージの message sequence number(整数、整数の配列、整数の Range)
  # @param mailbox 移動先のメールボックス(文字列)
  # @see [[m:Net::IMAP#uid_move]], [[RFC:6851]]
  def move; end

  # --- noop -> Net::IMAP::TaggedResponse
  # NOOP コマンドを送ります。
  # 
  # このコマンドは何もしません。
  def noop; end

  # --- remove_response_handler(handler) -> ()
  # レスポンスハンドラを削除します。
  # 
  # @param handler 削除するハンドラ
  # @see [[m:Net::IMAP#add_response_handler]]
  def remove_response_handler; end

  # --- rename(mailbox, newname) -> Net::IMAP::TaggedResponse
  # RENAME コマンドを送り、指定したメールボックスをリネームします。
  # 
  # @param mailbox リネームするメールボックス(文字列)
  # @param newname リネーム後の名前(文字列)
  # @raise Net::IMAP::NoResponseError 指定した名前のメールボックスを
  #        リネームできなかった場合に発生します。
  #        指定した名前のメールボックスが存在しない場合や、
  #        リネーム後の名前を持つメールボックスが既に存在する
  #        場合に発生します。
  def rename; end

  # --- response_handlers -> Array
  # 設定されているレスポンスハンドラ全てを
  # 配列で返します。
  # 
  # @see [[m:Net::IMAP#add_response_handler]]
  def response_handlers; end

  # --- responses -> { String => [object] }
  # サーバから送られてきた untagged な応答の記録を返します。
  # 
  # untagged な応答は種類ごとに記録されます。
  # 応答の種類には "FLAGS", "OK", "UIDVALIDITY", "EXISTS" などがあり、
  # この文字列がハッシュテーブルのキーとなります。
  # そして各種類ごとに配列が用意され、untagged な応答を受信するたびに
  # その配列の末尾にその内容が記録されます。
  # 
  # 
  # 例:
  #   imap.select("inbox")
  #   p imap.responses["EXISTS"].last
  #   #=> 2
  #   p imap.responses["UIDVALIDITY"].last
  #   #=> 968263756
  def responses; end

  # --- search(keys, charset = nil) -> [Integer]
  # SEARCH コマンドを送り、条件に合うメッセージの message sequence number
  # を配列で返します。
  # 
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したメールボックスを検索対象とします。
  # 
  # 検索の条件は key に文字列の1次元配列もしくは文字列で渡します。
  # 
  # 検索条件は "SUBJECT", "FROM" などを用いることができます。
  # 詳しくは [[RFC:2060]] の 6.4.4 を見てください。
  # 
  # 例:
  #   p imap.search(["SUBJECT", "hello"])
  #   #=> [1, 6, 7, 8]
  #   p imap.search(["SUBJECT", "hello", "FROM", "foo@example.com"])
  #   #=> [6, 7]
  #   p imap.search('SUBJECT "hello"')
  #   #=> [1, 6, 7, 8]
  # 
  # @param key 検索キー(文字列の配列もしくは文字列)
  # @param charset 検索に用いるcharset
  # @see [[m:Net::IMAP#search]]
  def search; end

  # --- select(mailbox) -> Net::IMAP::TaggedResponse
  # SELECT コマンドを送り、指定したメールボックスを処理対象の
  # メールボックスにします。
  # 
  # このコマンドが成功すると、クライアントの状態が「selected」になります。
  # 
  # このコマンドを実行した直後に [[m:Net::IMAP#responses]]["EXISTS"].last
  # を調べると、メールボックス内のメールの数がわかります。
  # また、[[m:Net::IMAP#responses]]["RECENT"].lastで、
  # 最新のメールの数がわかります。
  # これらの値はセッション中に変わりうることに注意してください。
  # [[m:Net::IMAP#add_response_handler]] を使うとそのような更新情報を
  # 即座に取得できます。
  # 
  # @param mailbox 処理対象としたいメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError mailboxが存在しない等の理由でコマンドの実行に失敗
  #        した場合に発生します。
  def select; end

  # --- setacl(mailbox, user, rights)
  # 
  # SETACL コマンドを送り、指定したメールボックスに
  # 指定したユーザに関する権限を設定します。
  # 
  # rights には設定する権限を表す文字列を指定します。
  # どのような文字列を指定すべきかは [[RFC:2086]] を参照してください。
  # rights に nil を渡すと、空文字列を指定したのと同様、つまり
  # すべての権限を削除します。
  # 
  # @param mailbox 権限を設定するメールボックスの名前(文字列)
  # @param user 権限を設定するユーザの名前(文字列)
  # @param rights 権限を表す文字列
  def setacl; end

  # --- setquota(mailbox, quota) -> Net::IMAP::TaggedResponse
  # SETQUOTA コマンドを送り、指定したメールボックスに
  # quota を設定します。
  # 
  # quota が nil ならば、mailbox の quota を破棄します。
  # quota が整数なら STORAGE をその値に変更します。
  # 
  # 詳しくは [[RFC:2087]] を見てください。
  # このコマンドは [[m:Net::IMAP#capability]] の返り値を見ることで
  # 利用可能かどうか判断できます。
  # 
  # @param mailbox quota を設定するメールボックス名(文字列)
  # @param quota quotaの値(ストレージのサイズ、もしくは nil)
  # @raise Net::IMAP::NoResponseError 指定したメールボックスが quota root 
  #        でない場合、もしくは権限が存在しない場合に発生します。
  def setquota; end

  # --- sort(sort_keys, search_keys, charset) -> [Integer]
  # --- uid_sort(sort_keys, search_keys, charset) -> [Integer]
  # SORT コマンド送り、メールボックス内の
  # メッセージをソートした結果を返します。
  # 
  # SORT コマンドは [[RFC:5256]] で定義されています。
  # 詳しくはそちらを参照してください。
  # このコマンドは [[m:Net::IMAP#capability]] の返り値を見ることで
  # 利用可能かどうか判断できます。
  # 
  # sort_keys にはソート順を決めるキーを文字列の配列で指定します。
  # "ARRIVAL", "CC", "FROM", "TO", "SUBJECT" などが指定できます。
  # 詳しくは [[RFC:5265]] の BASE.6.4.SORT の所を見てください。
  # 
  # search_key には検索条件を渡します。[[m:Net::IMAP#search]] と
  # ほぼ同じです。この条件にマッチするメッセージのみがソートされます。
  # 
  # [[m:Net::IMAP#examine]] もしくは
  # [[m:Net::IMAP#select]] で指定したメールボックスを対象とします。
  # 
  # 返り値は message sequence number の配列を返します。
  # 
  # 例:
  #   p imap.sort(["FROM"], ["ALL"], "US-ASCII")
  #   #=> [1, 2, 3, 5, 6, 7, 8, 4, 9]
  #   p imap.sort(["DATE"], ["SUBJECT", "hello"], "US-ASCII")
  #   #=> [6, 7, 8, 1]
  # @param sort_key ソート順のキー(文字列配列)
  # @param search_key 検索条件(文字列配列)
  # @param charset 検索条件の解釈に用いるCHARSET名(文字列)
  def sort; end

  # --- starttls(options) -> Net::IMAP::TaggedResponse
  # --- starttls(certs, verify) -> Net::IMAP::TaggedResponse
  # 
  # STARTTLS コマンドを送って TLS のセッションを開始します。
  # 
  # options で [[lib:openssl]] に渡すオプションを指定します。
  # [[m:OpenSSL::SSL::SSLContext#set_params]] の引数と同じ意味です。
  # 
  # 互換性のため、certs で証明書or証明書ディレクトリのファイル名(文字列)、
  # verify で検証するかどうか([[m:Net::IMAP::VERIFY_PEER]]、
  # [[m:Net::IMAP::VERIFY_NONE]]に対応します)を
  # 指定することができます。
  # 
  # @param options SSL/TLS のオプション([[c:Hash]] オブジェクト)
  # @param certs 証明書ファイル名、もしくは証明書ディレクトリ名(文字列)
  # @param verify 真なら SSL/TLS 接続時に証明書を検証します
  def starttls; end

  # --- status(mailbox, attr) -> {String => Integer}
  # STATUS コマンドを送り、mailbox のステータスを得ます。
  # 
  # 問い合わせたいステータスは attr に文字列の配列で渡します。
  # 
  # 返り値は アトリビュート文字列をキーとするハッシュです。
  # 
  # 詳しくは [[RFC:2060]] の 6.3.10 を参考にしてください。
  # 
  # 例:
  #   p imap.status("inbox", ["MESSAGES", "RECENT"])
  #   #=> {"RECENT"=>0, "MESSAGES"=>44}
  # 
  # @param mailbox 問い合わせ対象のメールボックス(文字列)
  # @param attr 問合せたいアトリビュート名(文字列)の配列
  # @raise Net::IMAP::NoResponseError メールボックスが存在しない場合や、
  #        アトリビュート名が存在しない場合に発生します
  def status; end

  # --- store(set, attr, flags) -> [Net::IMAP::FetchData] | nil
  # STORE コマンドを送り、メールボックス内のメッセージを
  # 更新します。
  # 
  # set で更新するメッセージを指定します。
  # これには sequence number、sequence number の配列、もしくは
  # [[c:Range]] オブジェクトを渡します。
  # 
  # [[m:Net::IMAP#select]] で指定したメールボックスを対象とします。
  # 
  # attr で何をどのように変化させるかを指定します。
  # 以下を指定することができます。
  #   * "FLAGS"
  #   * "+FLAGS"
  #   * "-FLAGS"
  # それぞれメッセージのフラグの置き換え、追加、削除を意味します。
  # 詳しくは [[RFC:2060]] の 6.4.6 を参考にしてください。
  # 
  # flags には シンボルの配列で置き換え、追加もしくは削除される
  # フラグを指定します。
  # 
  # 返り値は更新された内容を [[c:Net::IMAP::FetchData]] オブジェクトの
  # 配列で返します。
  # 
  # 例:
  # 
  #   p imap.store(6..8, "+FLAGS", [:Deleted])
  #   #=> [#<Net::IMAP::FetchData seqno=6, attr={"FLAGS"=>[:Seen, :Deleted]}>, #<Net::IMAP::FetchData seqno=7, attr={"FLAGS"=>[:Seen, :Deleted]}>, #<Net::IMAP::FetchData seqno=8, attr={"FLAGS"=>[:Seen, :Deleted]}>]
  # 
  # @param set 更新するメッセージのsequence number
  # @param attr 更新方式(文字列)
  # @param flags 更新内容([[c:Symbol]] の配列)
  # @see [[m:Net::IMAP#uid_store]], [[m:Net::IMAP#fetch]]
  def store; end

  # --- subscribe(mailbox) -> Net::IMAP::TaggedResponse
  # SUBSCRIBE コマンドを送り、指定したメールボックスを
  # "active" もしくは "subscribe" なメールボックスの集合に
  # 追加します。
  # 
  # @param mailbox 追加するメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError 指定した名前のメールボックスを
  #        追加できなかった場合に発生します。
  #        指定した名前のメールボックスが存在しない場合などに
  #        生じます。
  def subscribe; end

  # --- thread(algorithm, search_keys, charset) -> [Net::IMAP::ThreadMember]
  # THREADコマンドを送り、メールボックスを検索した結果を
  # スレッド形式の木構造で返します。
  # 
  # THREAD コマンドは [[RFC:5256]] で定義されています。
  # 詳しくはそちらを参照してください。
  # このコマンドは [[m:Net::IMAP#capability]] の返り値を見ることで
  # 利用可能かどうか判断できます。
  # 
  # algorithm は木構造を決定するためのアルゴリズムを指定します。
  # 以下の2つが利用可能です。
  #   * "ORDEREDSUBJECT" subjectを使って平坦に区切るだけ
  #   * "REFERENCES" どのメッセージに返事をしているかを見て木構造を作る
  # 詳しくは [[RFC:5256]] を見てください。
  # 
  # search_key には検索条件を渡します。
  # [[m:Net::IMAP#search]] と同等です。
  # 
  # 
  # @param algorithm スレッド構造構築アルゴリズム名(文字列)
  # @param search_key 検索条件(文字列配列)
  # @param charset 検索条件の解釈に用いるCHARSET名(文字列)
  # @see [[c:Net::IMAP::ThreadMember]], [[m:Net::IMAP#uid_thread]]
  def thread; end

  # --- uid_copy(set, mailbox) -> Net::IMAP::TaggedResponse
  # UID COPY コマンドを送り、指定したメッセージを
  # 指定したメールボックスの末尾に追加します。
  # 
  # set でコピーするメッセージを指定します。
  # UID (整数)、
  # UID の配列、もしくは [[c:Range]] で
  # 指定します。コピー元のメールボックスは
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したものを用います。
  # mailbox はコピー先のメールボックスです。
  # 
  # @param set コピーするメッセージの UID
  # @param mailbox コピー先のメールボックス(文字列)
  # @see [[m:Net::IMAP#copy]]
  def uid_copy; end

  # --- uid_fetch(set, attr) -> [Net::IMAP::FetchData]
  # 
  # UID FETCH コマンドを送り、メールボックス内のメッセージに
  # 関するデータを取得します。
  # 
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したメールボックスを対象とします。
  # 
  # set で対象とするメッセージを指定します。
  # これには UID、UID の配列、もしくは
  # [[c:Range]] オブジェクトを渡します。
  # attr には取得するアトリビュートを文字列の配列で渡してください。
  # 指定可能なアトリビュートについては [[m:Net::IMAP::FetchData#attr]] 
  # を見てください。
  # 
  # @param set 処理対象のメッセージの UID
  # @param attr アトリビュート(文字列配列)
  # @see [[m:Net::IMAP#fetch]]
  def uid_fetch; end

  # --- uid_move(set, mailbox) -> Net::IMAP::TaggedResponse
  # MOVEコマンドを送り、set でUIDで指定したメッセージを mailbox の
  # 末尾に移動させます。
  # 
  # set には UID、UID の配列、もしくは
  # [[c:Range]] オブジェクトを渡します。
  # 
  # コピー元のメールボックスは
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したものを用います。
  # 
  # @param set 移動するメッセージのUID(整数、整数の配列、整数の Range)
  # @param mailbox 移動先のメールボックス(文字列)
  # @see [[m:Net::IMAP#move]], [[RFC:6851]]
  def uid_move; end

  # --- uid_search(keys, charset = nil) -> [Integer]
  # 
  # UID SEARCH コマンドを送り、条件に合うメッセージの UID
  # を配列で返します。
  # 
  # [[m:Net::IMAP#examine]] もしくは [[m:Net::IMAP#select]] で
  # 指定したメールボックスを検索対象とします。
  # 
  # 検索の条件は key に文字列の1次元配列もしくは文字列で渡します。
  # 
  # 検索条件は "SUBJECT", "FROM" などを用いることができます。
  # 詳しくは [[RFC:2060]] の 6.4.4 を見てください。
  # 
  # 例:
  #   p imap.uid_search(["SUBJECT", "hello"])
  #   #=> [1, 6, 7, 8]
  #   p imap.uid_search(["SUBJECT", "hello", "FROM", "foo@example.com"])
  #   #=> [6, 7]
  #   p imap.uid_search('SUBJECT "hello"')
  #   #=> [1, 6, 7, 8]
  # 
  # @param key 検索キー(文字列の配列もしくは文字列)
  # @param charset 検索に用いるcharset
  # @see [[m:Net::IMAP#uid_search]]
  def uid_search; end

  # --- uid_store(set, attr, flags) -> [Net::IMAP::FetchData] | nil
  # 
  # UID STORE コマンドを送り、メールボックス内のメッセージを
  # 更新します。
  # 
  # set で更新するメッセージを指定します。
  # これには UID、UID の配列、もしくは
  # [[c:Range]] オブジェクトを渡します。
  # 
  # [[m:Net::IMAP#select]] で指定したメールボックスを対象とします。
  # 
  # attr で何をどのように変化させるかを指定します。
  # 以下を指定することができます。
  #   * "FLAGS"
  #   * "+FLAGS"
  #   * "-FLAGS"
  # それぞれメッセージのフラグの置き換え、追加、削除を意味します。
  # 詳しくは [[RFC:2060]] の 6.4.6 を参考にしてください。
  # 
  # 返り値は更新された内容を [[c:Net::IMAP::FetchData]] オブジェクトの
  # 配列で返します。
  # 
  # @param set 更新するメッセージの UID
  # @param attr 更新方式(文字列)
  # @param flags 更新内容([[c:Symbol]] の配列)
  # 
  # @see [[m:Net::IMAP#store]], [[m:Net::IMAP#uid_fetch]]
  def uid_store; end

  # --- uid_thread(algorithm, search_keys, charset)  -> [Net::IMAP::ThreadMember]
  # THREADコマンドを送り、メールボックスを検索した結果を
  # スレッド形式の木構造で返します。
  # 
  # ほぼ [[m:Net::IMAP#thread]] と同じですが、返ってくるオブジェクトの
  # [[m:Net::IMAP::ThreadMember#seqno]] の内容が message sequence number
  # ではなく UID となります。
  # 
  # @param algorithm スレッド構造構築アルゴリズム名(文字列)
  # @param search_key 検索条件(文字列配列)
  # @param charset 検索条件の解釈に用いるCHARSET名(文字列)
  # @see [[c:Net::IMAP::ThreadMember]], [[m:Net::IMAP#thread]]
  def uid_thread; end

  # --- unsubscribe(mailbox) -> Net::IMAP::TaggedResponse
  # UNSUBSCRIBE コマンドを送り、指定したメールボックスを
  # "active" もしくは "subscribe" なメールボックスの集合から
  # 削除します。
  # 
  # @param mailbox 削除するするメールボックスの名前(文字列)
  # @raise Net::IMAP::NoResponseError 指定した名前のメールボックスを
  #        削除できなかった場合に発生します。
  #        指定した名前のメールボックスが active/subscribe でなかった
  #        場合などに発生します。
  def unsubscribe; end

  # --- xlist(refname, mailbox) -> [Net::IMAP::MailboxList]
  # 
  # XLISTコマンドを送り、クライアントから利用可能なメールボックス名の集合から
  # 引数にマッチするものすべてを返します。
  # 
  # [[m:Net::IMAP#list]] とほぼ同様ですが、
  # 「:Sent」などの拡張されたフラグを含むことが異なります。
  # 
  # 詳しくは
  # [[url:http://code.google.com/apis/gmail/imap/]]
  # を参照してください。
  # 
  # @param refname 参照名(文字列)
  # @param mailbox 調べるメールボックスの名前(文字列)。ワイルドカードを含んでいてもかまいません。
  # 
  # 例:
  #   imap.create("foo/bar")
  #   imap.create("foo/baz")
  #   p imap.xlist("", "foo/%")
  #   #=> [#<Net::IMAP::MailboxList attr=[:Noselect], delim="/", name="foo/">, \\
  #   #    #<Net::IMAP::MailboxList attr=[:Noinferiors, :Marked], delim="/", name="foo/bar">, \\
  #   #    #<Net::IMAP::MailboxList attr=[:Noinferiors], delim="/", name="foo/baz">]
  def xlist; end

  # --- add_authenticator(auth_type, authenticator) -> ()
  # [[m:Net::IMAP#authenticate]] で使う 
  # 認証用クラスを設定します。
  # 
  # imap ライブラリに新たな認証方式を追加するために用います。
  # 
  # 通常は使う必要はないでしょう。もしこれを用いて
  # 認証方式を追加する場合は net/imap.rb の
  # Net::IMAP::LoginAuthenticator などを参考にしてください。
  # 
  # @param auth_type 認証の種類(文字列)
  # @param authenticator 認証クラス(Class オブジェクト)
  def add_authenticator; end

  # --- debug -> bool
  # 
  # デバッグモードが on になっていれば真を返します。
  # 
  # @see [[m:Net::IMAP#debug=]]
  def debug; end

  # --- debug=(val)
  # デバッグモードの on/off をします。
  # 
  # 真を渡すと on になります。
  # 
  # @param val 設定するデバッグモードの on/off の真偽値
  # @see [[m:Net::IMAP#debug]]
  def debug=; end

  # --- decode_utf7(str) -> String
  # modified UTF-7 の文字列を UTF-8 の文字列に変換します。
  # 
  # modified UTF-7 は IMAP のメールボックス名に使われるエンコーディングで、
  # UTF-7 を修正したものです。
  # 
  # 詳しくは [[RFC:2060]] の 5.1.3 を参照してください。
  # 
  # Net::IMAP ではメールボックス名のエンコードを自動的変換「しない」
  # ことに注意してください。必要があればユーザが変換すべきです。
  # 
  # @param str 変換対象の modified UTF-7 でエンコードされた文字列
  # @see [[m:Net::IMAP.encode_utf7]]
  def decode_utf7; end

  # --- default_port -> Integer
  # --- default_imap_port -> Integer
  # 
  # デフォルトの IMAP のポート番号(143)を返します。
  # 
  # @see [[m:Net::IMAP.default_tls_port]]
  def default_imap_port; end

  # --- default_tls_port -> Integer
  # --- default_imaps_port -> Integer
  # --- default_ssl_port -> Integer
  # 
  # デフォルトの IMAPS のポート番号(993)を返します。
  # 
  # @see [[m:Net::IMAP.default_port]]
  def default_imaps_port; end

  # --- encode_utf7(str) -> String
  # UTF-8 の文字列を modified UTF-7 の文字列に変換します。
  # 
  # modified UTF-7 は IMAP のメールボックス名に使われるエンコーディングで、
  # UTF-7 を修正したものです。
  # 
  # 詳しくは [[m:Net::IMAP.encode_utf7]] を見てください。
  # 
  # @param str 変換対象の UTF-8 でエンコードされた文字列
  # @see [[m:Net::IMAP.decode_utf7]]
  def encode_utf7; end

  # --- format_date(time) -> String
  # 時刻オブジェクトを IMAP の日付フォーマットでの文字列に変換します。
  # 
  #   require 'net/imap'
  # 
  #   Net::IMAP.format_date(Time.new(2011, 6, 20))
  #   # => "20-Jun-2011"
  # 
  # @param time 変換する時刻オブジェクト
  def format_date; end

  # --- format_datetime(time) -> String
  # 時刻オブジェクトを IMAP の日付時刻フォーマットでの文字列に変換します
  # 
  #   require 'net/imap'
  # 
  #   Net::IMAP.format_datetime(Time.new(2011, 6, 20, 13, 20, 1))
  #   # => "20-Jun-2011 13:20 +0900"
  # 
  # @param time 変換する時刻オブジェクト
  def format_datetime; end

  # --- max_flag_count -> Integer
  # サーバからのレスポンスに含まれる flag の上限を返します。
  # 
  # これを越えた flag がレスポンスに含まれている場合は、
  # [[c:Net::IMAP::FlagCountError]] 例外が発生します。
  # 
  # @see [[m:Net::IMAP.max_flag_count=]]
  def max_flag_count; end

  # --- max_flag_count=(count)
  # サーバからのレスポンスに含まれる flag の上限を設定します。
  # 
  # これを越えた flag がレスポンスに含まれている場合は、
  # [[c:Net::IMAP::FlagCountError]] 例外が発生します。
  # 
  # デフォルトは 10000 です。通常は変える必要はないでしょう。
  # 
  # @param count 設定する最大値の整数
  # @see [[m:Net::IMAP.max_flag_count]]
  def max_flag_count=; end

  # --- new(host, port = 143, usessl = false, certs = nil, verify = true) -> Net::IMAP
  # --- new(host, options) -> Net::IMAP
  # 
  # 新たな Net::IMAP オブジェクトを生成し、指定したホストの
  # 指定したポートに接続し、接続語の IMAP オブジェクトを返します。
  # 
  # usessl が真ならば、サーバに繋ぐのに SSL/TLS を用います。
  # SSL/TLS での接続には OpenSSL と [[lib:openssl]] が使える必要があります。
  # certs は利用する証明書のファイル名もしくは証明書があるディレクトリ名を
  # 文字列で渡します。
  # certs に nil を渡すと、OpenSSL のデフォルトの証明書を使います。
  # verify は接続先を検証するかを真偽値で設定します。
  # 真が [[m:OpenSSL::SSL::VERIFY_PEER]] に、
  # 偽が [[m:OpenSSL::SSL::VERIFY_NONE]] に対応します。
  # 
  # パラメータは Hash で渡すこともできます。以下のキーを使うことができます。
  #   * :port ポート番号
  #     省略時は SSL/TLS 使用時→993 不使用時→143 となります。
  #   * :ssl OpenSSL に渡すパラメータをハッシュで指定します。
  #     省略時は SSL/TLS を使わず接続します。
  #     これで渡せるパラメータは
  #     [[m:OpenSSL::SSL::SSLContext#set_params]] と同じです。
  # これの :ssl パラメータを使うことで、OpenSSL のパラメータを詳細に
  # 調整できます。
  # 
  # 
  # 例
  #   require 'net/imap'
  # 
  #   imap = Net::IMAP.new('imap.example.com', :port => 993,
  #                        :ssl => { :verify_mode => OpenSSL::SSL::VERIFY_PEER,
  #                                  :timeout => 600 } )
  # 
  # @param host 接続するホスト名の文字列
  # @param port 接続するポート番号
  # @param usessl 真でSSL/TLSを使う
  # @param certs 証明書のファイル名/ディレクトリ名の文字列
  # @param verify 真で接続先を検証する
  # @param options 各種接続パラメータのハッシュ
  def new; end

  # --- ANSWERED -> Symbol
  # 「:Answered」というシンボルを返します。
  # 
  # そのメッセージに返答したことを意味します。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def ANSWERED; end

  # --- DELETED -> Symbol
  # 「:Deleted」というシンボルを返します。
  # 
  # メッセージが削除されていることを意味します。
  # EXPUNGE で完全に除去されます。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def DELETED; end

  # --- DRAFT -> Symbol
  # 「:Draft」というシンボルを返します。
  # 
  # メッセージが草稿であることを意味します。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def DRAFT; end

  # --- FLAGGED -> Symbol
  # 「:Flagged」というシンボルを返します。
  # 
  # そのメッセージに特別なフラグを立てていることを意味します。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def FLAGGED; end

  # --- MARKED -> Symbol
  # 「:Marked」というシンボルを返します。
  # 
  # メールボックスが「interesting」であるとサーバによって
  # 印付けられていることを意味します。通常メールボックスに
  # 新しいメールが届いていることを意味します。
  # 
  # LIST応答の属性
  # ([[m:Net::IMAP#list]]、[[m:Net::IMAP::MailboxList#attr]])
  # として用いられます。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def MARKED; end

  # --- NOINFERIORS -> Symbol
  # 「:Noinferiors」というシンボルを返します。
  # 
  # このメールボックスの
  # 下に子レベルの階層が存在不可能であることを意味します。
  # 
  # LIST応答の属性
  # ([[m:Net::IMAP#list]]、[[m:Net::IMAP::MailboxList#attr]])
  # として用いられます。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def NOINFERIORS; end

  # --- NOSELECT -> Symbol
  # 「:Noselect」というシンボルを返します。
  # 
  # メールボックスが選択可能でないことを意味します。
  # 
  # LIST応答の属性
  # ([[m:Net::IMAP#list]]、[[m:Net::IMAP::MailboxList#attr]])
  # として用いられます。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def NOSELECT; end

  # --- RECENT -> Symbol
  # 「:Recent」というシンボルを返します。
  # 
  # メッセージが「最近」メールボックスに到着したことを意味します。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def RECENT; end

  # --- SEEN -> Symbol
  # 「:Seen」というシンボルを返します。
  # 
  # そのメッセージが既に読まれていることを意味します。
  # 
  # フラグメッセージ属性として用いられます
  # ([[m:Net::IMAP::FetchData#attr]])。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def SEEN; end

  # --- UNMARKED -> Symbol
  # 「:Unmarked」というシンボルを返します。
  # 
  # メールボックスが
  # 印付けられていないことを意味します。
  # メールボックスに新しいメールが届いていないことを意味します。
  # 
  # LIST応答の属性
  # ([[m:Net::IMAP#list]]、[[m:Net::IMAP::MailboxList#attr]])
  # として用いられます。
  # 
  # 詳しくは [[RFC:2060]] を参照してください。
  def UNMARKED; end

end
