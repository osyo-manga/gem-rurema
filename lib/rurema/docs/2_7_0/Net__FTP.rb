class Net::FTP
  # --- abort -> String
  # データの転送を中止します。
  # 
  # @return サーバからの応答を文字列で返します。
  # 
  # @raise Net::FTPReplyError 応答コードが正しくない場合に発生します。
  def abort; end

  # --- acct(account) -> nil
  # 
  # サーバーに ACCT コマンドでアカウント情報を送ります。
  # 
  # @param account 送りたいアカウント情報を文字列で与えます。
  # 
  # @raise Net::FTPReplyError 応答コードが2yzでない場合に発生します。
  def acct; end

  # --- binary -> bool
  # [[m:Net::FTP#put]], [[m:Net::FTP#get]] による転送を
  # バイナリモード(IMAGE)で行うかどうかを返します。
  # 
  # デフォルトの値は true です。
  # 
  # 偽の場合、テキストモード(ASCII)が仮定されます。
  # 
  # EBCDIC や LOCAL など他の表現タイプはサポートされていません。
  # 
  # @see [[m:Net::FTP#binary=]]
  def binary; end

  # --- binary=(bool)
  # [[m:Net::FTP#put]], [[m:Net::FTP#get]] による転送を
  # バイナリモード(IMAGE)で転送するかどうかを指定します。
  # 
  # デフォルトの値は true です。
  # 
  # 偽の場合、テキストモード(ASCII)が仮定されます。
  # 
  # EBCDIC や LOCAL など他の表現タイプはサポートされていません。
  # 
  # @param bool 真ならばバイナリモードを on にします。
  # @see [[m:Net::FTP#binary]]
  def binary=; end

  # --- chdir(dirname) -> nil
  # リモートサーバでのカレントディレクトリを dirname に変更します。
  # 
  # @param dirname 変更先のディレクトリを与えます。
  # @raise Net::FTPReplyError 応答コードがエラーである場合に発生します。カレントディレクトリ変更に失敗した場合に発生します。
  def chdir; end

  # --- close -> ()
  # サーバとの接続を切ります。
  # 
  # 再び [[m:Net::FTP#connect]] で接続しない限り
  # 一切の操作が不可能になります。
  def close; end

  # --- closed? -> bool
  # 接続が切れている時に真を返します。
  def closed?; end

  # --- connect(host, port = FTP_PORT) -> ()
  # 
  # host で指定されたホストに接続します。
  # 
  # 環境変数 SOCKS_SERVER が指定されている場合、SOCKS プロクシを
  # 経由して接続します。
  # 
  # これを呼びだす前に通信をしようとすると、
  # [[c:Net::FTPConnectionError]] 例外が発生します。
  # 
  # @param host 接続するホスト名です。
  # @param port 接続するポート番号です。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def connect; end

  # --- debug_mode -> bool
  # デバッグモードであれば真を、そうでなければ偽を返します。
  # 
  # 値が真であるとき、送受信の記録と ABOR, STAT の結果が
  # [[m:$stdout]] に随時表示されます。
  # 
  # デフォルトは偽です。
  # @see [[m:Net::FTP#debug_mode=]]
  def debug_mode; end

  # --- debug_mode=(boolean)
  # 
  # デバッグモードの on/off を設定します。
  # 
  # @param boolean 真ならばデバッグモードを on にします。
  # @see [[m:Net::FTP#debug_mode]]
  def debug_mode=; end

  # --- delete(filename) -> nil
  # ファイルを削除します。
  # 
  # リモートサーバ上の fromname という名前のファイルを削除します。
  # 
  # 削除に失敗した場合には 例外が発生します。
  # 
  # @param filename 削除するファイルの名前を与えます。
  # 
  # @raise Net::FTPPermError 応答コードが 5yz であった場合に発生します。
  # @raise Net::FTPReplyError 応答コードが 5yz 以外で正しくない場合に発生します。
  def delete; end

  # --- list(*args) -> [String]
  # --- list(*args) {|line| ... } -> nil
  # --- ls(*args) -> [String] 
  # --- ls(*args) {|line| ... } -> nil
  # --- dir(*args) -> [String]
  # --- dir(*args) {|line| ...} -> nil
  # 
  # LIST コマンドを送信し、結果を返します。
  # 
  # ブロックとともに呼び出された場合は各行に対してブロックを
  # 実行します。ブロックなしの場合には文字列の配列で結果を返します。
  # 
  # @param args LIST の引数を文字列で渡します。複数渡すことができます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def dir; end

  # --- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil
  # --- get(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil
  # 
  # サーバ上のファイルを取得します。
  # 
  # [[m:Net::FTP#binary]] の値に従って
  # [[m:Net::FTP#getbinaryfile]] もしくは
  # [[m:Net::FTP#gettextfile]] を呼びだします。
  # 
  # binary が偽のとき、つまりテキストモードの
  # ときには blocksize は無視されます。
  # 
  # @param remotefile 取得対象のリモートのファイル名を与えます。
  # @param localfile 取得したデータを格納するローカルのファイル名を与えます。
  # @param blocksize データ転送の単位をバイト単位で与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def get; end

  # --- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE){|data| ...} -> nil
  # --- getbinaryfile(remotefile, localfile = File.basename(remotefile), blocksize = DEFAULT_BLOCKSIZE) -> nil
  # 
  # サーバ上のファイルをバイナリモードで取得します。
  # 
  # サーバー上にある remotefile という名前のファイルを取得し、
  # ローカルの localfile という名前のファイルに保存します。
  # 
  # localfile が nil である場合には保存はしません。
  # 
  # データの転送は blocksize バイト毎に行なわれます。
  # 
  # ブロックが指定された場合は
  # データを blocksize バイト受信するごとに、そのデータを
  # ブロックに渡します。
  # 
  # @param remotefile 取得対象のリモートのファイル名を与えます。
  # @param localfile 取得したデータを格納するローカルのファイル名を与えます。
  # @param blocksize データ転送の単位をバイト単位で与えます。
  # 
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def getbinaryfile; end

  # --- pwd -> String
  # --- getdir -> String
  # カレントディレクトリを返します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def getdir; end

  # --- gettextfile(remotefile, localfile = File.basename(remotefile)) -> nil
  # --- gettextfile(remotefile, localfile = File.basename(remotefile)){|line| ...} -> nil
  # 
  # サーバ上のファイルをテキストモードで取得します。
  # 
  # サーバー上にある remotefile という名前のファイルを取得し、
  # ローカルの localfile という名前のファイルに保存します。
  # 
  # localfile が nil である場合には保存はしません。
  # 
  # ブロックが指定された場合は
  # データを1行受信するごとに、その行をブロックに渡します。
  # 
  # @param remotefile 取得対象のリモートのファイル名を与えます。
  # @param localfile 取得したデータを格納するローカルのファイル名を与えます。
  # 
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def gettextfile; end

  # --- help(arg = nil) -> String
  # サーバからの help 情報を返します。
  # 
  # @param arg HELP コマンドのパラメータを指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  def help; end

  # --- last_response -> String
  # サーバからの最後の応答を文字列で返します。
  # 
  # 例えばログイン([[m:Net::FTP#login]])に成功した場合には
  # "230 Login successful.\n" を返します。
  # 
  # @see [[m:Net::FTP#last_response_code]]
  def last_response; end

  # --- lastresp -> String
  # --- last_response_code -> String
  # 
  # サーバからの最後の応答のコードを文字列で返します。
  # 
  # 例えばログイン([[m:Net::FTP#login]])に成功した場合には
  # "230" を返します。
  # 
  # 数字の意味は [[rfc:959]] 参照してください。
  # 
  # @see [[m:Net::FTP#last_response]]
  def last_response_code; end

  # --- login(user = "anonymous", passwd = nil, acct = nil) -> ()
  # ホストへのログイン処理を行ないます。
  # 
  # このメソッドはホストへの接続後にしか使えません。
  # 
  # user, passwd が省略された場合、ユーザ名
  # "anonymous", パスワード user@host となります。
  # 
  # acct を省略しなかった場合には、 ACCT コマンドを
  # acct で指定したパラメータで送ります。
  # 
  # @param user ログインに使うユーザ名を指定します。
  # @param passwd ログインに使うパスワードを指定します。
  # @param acct ログイン後に送る ACCT コマンドのパラメータを指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def login; end

  # --- mdtm(filename) -> String
  # MDTM コマンドを送信し、結果を返します。
  # 
  # @param filename コマンドを発行したいファイル名を文字列で指定します。
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  def mdtm; end

  # --- mkdir(dirname) -> String
  # リモートサーバ上にディレクトリを作成します。
  # 
  # 作成に失敗した場合には例外が発生します。
  # 
  # @param dirname 作成するディレクトリ名を文字列で指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def mkdir; end

  # --- mlsd(pathname = nil) -> [Net::FTP::MLSxEntry]
  # --- mlsd(pathname = nil) {|entry| ... } -> ()
  # 
  # pathname で指定したディレクトリに含まれているファイルの詳細な情報を得ます。
  # 
  # ディレクトリの各ファイルの情報が
  # [[c:Net::FTP::MLSxEntry]] のオブジェクトの配列として得られます。
  # どのような情報を取り出せるかは [[c:Net::FTP::MLSxEntry]]
  # を参照してください。
  # [[m:Net::FTP#list]] は
  # 結果が文字列で得られるため、それを適当に解釈する必要がありますが、
  # このコマンドの結果は適切に解釈された結果を直接得ることができます。
  # 
  # pathname を省略した場合はカレントディレクトリを指定したことになります。
  # 
  # ブロックを渡した場合にはディレクトリの各ファイルごとに
  # そのブロックを呼び出します。
  # 
  # FTP の MLST コマンド [[rfc:3659]] を使います。FTPのLISTコマンドは
  # その出力結果の標準化がなされていないため、標準的結果を得るコマンドとして
  # MLST/MLSD が定義されました。
  # 
  # @param pathname 情報を得るディレクトリ名
  # @see [[m:Net::FTP#mlst]]
  # 
  #   require 'net/ftp'
  #   
  #   Net::FTP.open("ftp.example.org") do |ftp|
  #     ftp.login("anonymous", "foobar@example.com")
  #     p ftp.mlsd("/")
  #     # =>
  #     #  [#<Net::FTP::MLSxEntry:0x00558fbfa379c0
  #     #    @facts=
  #     #    {"modify"=>2014-08-25 16:44:41 UTC,
  #     #    "perm"=>"fle",
  #     #    "type"=>"cdir",
  #     #    "unique"=>"801U1FE8E6",
  #     #    "unix.group"=>1042,
  #     #    "unix.mode"=>493,
  #     #    "unix.owner"=>106},
  #     #    @pathname => ".",
  #     #  #<Net::FTP::MLSxEntry:0x00558fbfa33e10
  #     #   @facts=
  #     #   {"modify"=>2004-12-22 08:56:36 UTC,
  #     #   "perm"=>"adfr",
  #     #   "size"=>1128,
  #     #   "type"=>"file",
  #     #   "unique"=>"801U1FEF97",
  #     #   "unix.group"=>0,
  #     #   "unix.mode"=>420,
  #     #   "unix.owner"=>106},
  #     #   @pathname="README.txt">,
  #     #      :
  #     #  ]
  #   end
  def mlsd; end

  # --- mlst(pathname = nil) -> Net::FTP::MLSxEntry
  # 
  # pathname で指定したファイル/ディレクトリの詳細な情報を得ます。
  # 
  # [[c:Net::FTP::MLSxEntry]] のインスタンスに得られた情報が
  # 保持されます。どのような情報を取り出せるかは [[c:Net::FTP::MLSxEntry]]
  # を参照してください。
  # [[m:Net::FTP#list]] は
  # 結果が文字列で得られるため、それを適当に解釈する必要がありますが、
  # このコマンドの結果は適切に解釈された結果を直接得ることができます。
  # 
  # pathname を省略した場合はカレントディレクトリを指定したことになります。
  # 
  # FTP の MLST コマンド [[rfc:3659]] を使います。
  # 
  # @param pathname 情報を得るファイルパス
  # @see [[m:Net::FTP#mlsd]]
  def mlst; end

  # --- mtime(filename, local = false) -> Time
  # 
  # filename の更新時刻を Time オブジェクトで返します。
  # 
  # local を真とすると、得られた更新時刻を地方時とみなします。
  # 偽の場合は更新時刻を協定世界時とみなします。
  # 
  # @param filename 更新時刻を得たいファイルの名前を文字列で与えます。
  # @param local 返り値の時刻を地方時とみなすかどうかを真偽値で与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def mtime; end

  # --- nlst(dir = nil) -> [String]
  # 
  # dir で指定したディレクトリのファイルの配列を返します。
  # 
  # dir を省略した場合カレントディレクトリが指定されます。
  # 
  # @param dir ディレクトリを文字列で指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def nlst; end

  # --- noop -> nil
  # NOOP コマンドを発行します。
  # 
  # サーバから応答が得られる他は何もしません。
  # 
  # @raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。
  def noop; end

  # --- open_timeout -> Numeric|nil
  # 接続時のタイムアウトの秒数を返します。
  # 
  # 制御用コネクションとデータ転送用コネクションの
  # 両方を開くときの共通のタイムアウト時間です。
  # 
  # この秒数たってもコネクションが
  # 開かなければ例外 [[c:Net::OpenTimeout]] を発生します。
  # 整数以外での浮動小数点数や分数を指定することができます。
  # デフォルトは nil(タイムアウトしない)です。
  # 
  # @see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout=]]
  def open_timeout; end

  # --- open_timeout=(seconds)
  # 接続時のタイムアウトの秒数を設定します。
  # 
  # 制御用コネクションとデータ転送用コネクションの
  # 両方を開くときの共通のタイムアウト時間です。
  # 
  # この秒数たってもコネクションが
  # 開かなければ例外 [[c:Net::OpenTimeout]] を発生します。
  # 整数以外での浮動小数点数や分数を指定することができます。
  # デフォルトは nil(タイムアウトしない)です。
  # 
  # 制御用コネクションを開く以下のメソッドで利用されます。
  # 
  #   * [[m:Net::FTP.open]]
  #   * [[m:Net::FTP.new]]
  #   * [[m:Net::FTP#connect]]
  # 
  # また、以下のデータ転送用コネクションを開くメソッドでも利用されます。
  # 
  #   * [[m:Net::FTP#retrbinary]]
  #   * [[m:Net::FTP#retrlines]]
  #   * [[m:Net::FTP#storbinary]]
  #   * [[m:Net::FTP#storlines]]
  # 
  # @param second 待つ秒数を指定します。
  # @see [[m:Net::HTTP#read_timeout]], [[m:Net::HTTP#open_timeout]]
  def open_timeout=; end

  # --- passive -> bool
  # passive モードであるならば真を、そうでなければ
  # 偽を返します。
  # 
  # デフォルトは偽です。
  # 
  # @see [[m:Net::FTP#passive=]]
  def passive; end

  # --- passive=(bool)
  # passive モードを設定します。
  # 
  # @see [[m:Net::FTP#passive]]
  def passive=; end

  # --- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
  # --- put(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) { |data| .... } -> nil
  # 
  # サーバへファイルを転送します。
  # 
  # [[m:Net::FTP#binary]] の値に従って
  # [[m:Net::FTP#putbinaryfile]] もしくは
  # [[m:Net::FTP#puttextfile]] を呼びだします。
  # 
  # binary が偽のとき、つまりテキストモードの
  # ときには blocksize は無視されます。
  # 
  # @param localfile 転送するローカルのファイル名を与えます。
  # @param remotefile 転送データを保存するリモートのファイル名を与えます。
  # @param blocksize データ転送の単位をバイト単位で与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def put; end

  # --- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) -> nil
  # --- putbinaryfile(localfile, remotefile = File.basename(localfile), blocksize = DEFAULT_BLOCKSIZE) {|data| ...} -> nil
  # 
  # サーバにファイルをバイナリモードで転送します。
  # 
  # ローカルの localfile という名前のファイルを読みだし、
  # サーバー上の remotefile という名前のファイルに保存します。
  # 
  # データの転送は blocksize バイト毎に行なわれます。
  # 
  # ブロックが指定された場合は
  # データを blocksize バイト転送するごとに、そのデータを
  # ブロックに渡します。
  # 
  # @param localfile 転送するローカルのファイル名を与えます。
  # @param remotefile 転送データを保存するリモートのファイル名を与えます。
  # @param blocksize データ転送の単位をバイト単位で与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def putbinaryfile; end

  # --- puttextfile(localfile, remotefile = File.basename(localfile)) -> nil
  # --- puttextfile(localfile, remotefile = File.basename(localfile)) {|line| ... } -> nil
  # サーバにファイルをテキストモードで転送します。
  # 
  # ローカルの localfile という名前のファイルを読みだし、
  # サーバー上の remotefile という名前のファイルに保存します。
  # 
  # ブロックが指定された場合は
  # データを1行転送するごとに、その行を
  # ブロックに渡します。
  # 
  # @param localfile 転送するローカルのファイル名を与えます。
  # @param remotefile 転送データを保存するリモートのファイル名を与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def puttextfile; end

  # --- quit -> nil
  # FTP のセッションからログアウトします。
  def quit; end

  # --- read_timeout -> Numeric|nil
  # 読み込み一回でブロックしてよい最大秒数
  # を返します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:Net::ReadTimeout]]
  # を発生します。整数以外での浮動小数点数や分数を指定することができます。
  # デフォルトは 60 (秒)です。
  # 
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout=]]
  def read_timeout; end

  # --- read_timeout=(seconds)
  # 
  # 読み込み一回でブロックしてよい最大秒数を
  # 設定します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:Net::ReadTimeout]]
  # を発生します。整数以外での浮動小数点数や分数を指定することができます。
  # デフォルトは 60 (秒)です。
  # 
  # このタイムアウト秒数は、サーバとやりとりする
  # ほとんどの [[c:Net::FTP]] のメソッドで有効です。
  # 
  # @param second 待つ秒数を指定します。
  # @see [[m:Net::HTTP#open_timeout]], [[m:Net::HTTP#read_timeout]]
  def read_timeout=; end

  # --- rename(fromname, toname) -> nil
  # ファイルをリネームします。
  # 
  # リモートサーバ上の fromname という名前のファイルを
  # toname という名前に変更します。
  # 
  # @param fromname 変更前のファイル名を与えます。
  # @param toname 変更後のファイル名を与えます。
  # 
  # @raise Net::FTPReplyError 応答コードが正しくない場合に発生します。リネームに失敗した場合に発生します。
  def rename; end

  # --- resume -> bool
  # 現在のリジュームモードの状態を返します。
  # 
  # リジュームモードが有効であるならば、
  # いくつかの転送メソッドにおいて
  # 転送が中断され不完全な転送しかできなかった場合に
  # 再開が可能になります。
  # 
  # デフォルトは false です。
  # 
  # 転送の中断と再開が可能なのは以下のメソッドです。
  #   * [[m:Net::FTP#get]]
  #   * [[m:Net::FTP#put]]
  #   * [[m:Net::FTP#getbinaryfile]]
  #   * [[m:Net::FTP#putbinaryfile]]
  # 
  # 転送が中断したかどうかは転送先に問題のファイルが存在するか
  # どうかで判定され、そのファイルサイズで再開する位置を
  # 決めます。
  # 
  # @see [[m:Net::FTP#resume=]]
  def resume; end

  # --- resume=(boolean)
  # 現在のリジュームモードを設定します。
  # 
  # @param boolean trueならばリジュームモードを on にします。
  # @see [[m:Net::FTP#resume]]
  def resume=; end

  # --- retrbinary(cmd, blocksize, rest_offset = nil) -> nil
  # --- retrbinary(cmd, blocksize, rest_offset = nil){|data| ...} -> nil
  # 
  # サーバーに cmd で指定されたコマンドを送り、バイナリデータを 
  # 取り寄せます。
  # 
  # blocksize で指定されたバイト単位でデータを
  # 読み込み、ブロックに渡します。
  # 
  # rest_offset が省略されなかった場合は、cmdを送る前に
  # REST コマンドを送り、指定したバイト数の位置から
  # 転送を開始します。
  # 
  # @param cmd コマンドを文字列で与えます。
  # @param blocksize 読み込み単位をバイト単位で与えます。
  # @param rest_offset REST コマンドに与えるオフセットを与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  # 
  # @see [[m:Net::FTP#getbinaryfile]]
  def retrbinary; end

  # --- retrlines(cmd){|line| ...} -> nil
  # サーバーに cmd で指定されたコマンドを送り、テキストデータを 
  # 取り寄せます。
  # 
  # 一行ずつテキストを読み込み、ブロックに渡します。
  # 
  # @param cmd コマンドを文字列で与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  # 
  # @see [[m:Net::FTP#gettextfile]]
  def retrlines; end

  # --- return_code -> String
  # このメソッドは obsolete です。使わないでください。
  # 
  # "\n" を返します。
  def return_code; end

  # --- return_code=(string)
  # このメソッドは obsolete です。使わないでください。
  def return_code=; end

  # --- rmdir(dirname) -> nil
  # リモートサーバ上のディレクトリを削除します。
  # 
  # @param dirname 削除するディレクトリ名を文字列で指定します。
  # 
  # @raise Net::FTPReplyError 応答コードが正しくない場合に発生します。削除に失敗した場合に発生します。
  def rmdir; end

  # --- sendcmd(cmd) -> String
  # cmd で指定されたコマンドをサーバーに送り、
  # サーバーからの応答を返します。
  # 
  # @param cmd コマンドを文字列で指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  def sendcmd; end

  # --- set_socket(sock, get_greeting = true) -> nil
  # FTP のコントロール接続の
  # ソケットを TCPSocket オブジェクト sock に設定します。
  # 
  # get_greeting に偽が与えられると、
  # set_socket は通信先を設定するだけで sock に対する操作を
  # 何も行ないません。
  # get_greeting が真ならば、通信先を sock に
  # 設定したあと、通常FTPサーバが接続時に送ってくるメッセージを読み込みます。
  # 
  # 通常このメソッドは使うべきではありません。このライブラリの
  # 実装を理解した上で必要な場合のみ利用してください。
  # 
  # @param sock コントロール接続に使うソケットを指定します。
  # @param get_greeting ソケットを設定した後接続時メッセージをソケットから読みこむかどうかを指定します。
  def set_socket; end

  # --- site(arg) -> nil
  # SITE コマンドを発行します。
  # 
  # @param arg SITEコマンドのパラメータを指定します。
  # 
  # @raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。
  def site; end

  # --- size(filename) -> Integer
  # リモートサーバ上のファイルのサイズを返します。
  # 
  # @param filename サイズを調べたいファイル名を与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合に発生します。
  def size; end

  # --- status -> String
  # 現在の状態を返します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  def status; end

  # --- storbinary(cmd, file, blocksize, rest_offset = nil) -> nil
  # --- storbinary(cmd, file, blocksize, rest_offset = nil){|data| ...} -> nil
  # サーバーに cmd で指定されたコマンドを送り、バイナリデータを 
  # 送ります。
  # 
  # 送るデータは [[c:IO]] のインスタンスを
  # file で指定します。
  # (実際には [[c:StringIO]] のような IO とメソッドレベルで
  # 互換するオブジェクトであればなんでもかまいません)。
  # 
  # blocksize で指定されたバイト単位で file からデータを読みこみ、
  # サーバに送ります。
  # 
  # rest_offset が省略されなかった場合は、cmdを送る前に
  # REST コマンドを送り、指定したバイト数の位置から
  # 転送を開始します。
  # 
  # ブロックが指定された場合には、転送するデータを blocksize ごとに
  # ブロックにも渡します。
  # 
  # @param cmd コマンドを文字列で与えます。
  # @param file 送るデータを与えます。
  # @param blocksize 読み込み単位をバイト単位で与えます。
  # @param rest_offset REST コマンドに与えるオフセットを与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  # 
  # @see [[m:Net::FTP#putbinaryfile]]
  def storbinary; end

  # --- storlines(cmd, file) -> nil
  # --- storlines(cmd, file){|line| ...} -> nil
  # サーバーに cmd で指定されたコマンドを送り、テキストデータを
  # 送ります。
  # 
  # 一行ずつで file からテキストを読み込み、サーバーに送ります。
  # 
  # 送るデータは [[c:IO]] のインスタンスを
  # file で指定します。
  # (実際には [[c:StringIO]] のような IO とメソッドレベルで
  # 互換するオブジェクトであればなんでもかまいません)。
  # 
  # ブロックが与えられた場合には各行をそのブロックに渡します。
  # 
  # @param cmd コマンドを文字列で与えます。
  # @param file 送るデータを与えます。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  # 
  # @see [[m:Net::FTP#puttextfile]]
  def storlines; end

  # --- system -> String
  # サーバーの OS のタイプを返します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外でエラーである場合に発生します。
  def system; end

  # --- voidcmd(cmd) -> nil
  # cmd で指定されたコマンドをサーバーに送ります。
  # 
  # @param cmd コマンドを文字列で指定します。
  # 
  # @raise Net::FTPReplyError 応答コードが 2yz 以外の場合に発生します。
  def voidcmd; end

  # --- welcome -> String
  # サーバのウェルカムメッセージを返します。
  # 
  # このメッセージはログイン([[m:Net::FTP#login]])時に
  # サーバから送られます。
  def welcome; end

  # --- default_passive -> bool
  # 
  # FTPの接続のグローバルなデフォルトモードが passive mode である場合に true を返します。
  def default_passive; end

  # --- default_passive=(on)
  # 
  # passive mode をFTPの接続のグローバルなデフォルトモードにするかどうかを設定します。
  # 
  # デフォルト値は true です。
  # 
  # @param on true ならばデフォルトを passive mode に、false ならばデフォルトを active mode にします
  def default_passive=; end

  # --- new(host = nil, user = nil, passwd = nil, acct = nil) -> Net::FTP
  # 
  # 新しい Net::FTP のインスタンスを生成します。
  # 
  # host が指定された場合、生成されたインスタンスに対して 
  # [[m:Net::FTP#connect]] を呼び出し、
  # さらに user が指定された場合は [[m:Net::FTP#login]] 
  # を呼び出します。
  # 
  # @param host 接続するホストを指定します。
  # @param user ログインに使うユーザ名を指定します。
  # @param passwd ログインに使うパスワードを指定します。
  # @param acct ログイン後に送る ACCT コマンドのパラメータを指定します。
  # 
  # @see [[m:Net::FTP.open]]
  def new; end

  # --- open(host, user = nil, passwd = nil, acct = nil) -> Net::FTP
  # --- open(host, user = nil, passwd = nil, acct = nil){|ftp| ... } -> object
  # 
  # 新しい Net::FTP インスタンスを生成します。
  # 
  # [[m:Net::FTP.new]] と異なり host を省略できません。
  # 
  # ブロックを与えた場合には、生成したインスタンスを
  # ブロックに渡して呼びだします。この場合、ブロック終了時に
  # [[m:Net::FTP#close]] を呼びだし、ブロックの値を
  # 返します。
  # 
  # ブロックを与えなかった場合には生成したインスタンスを返します。
  # 
  # user が指定された場合は [[m:Net::FTP#login]] 
  # を呼び出します。
  # 
  # @param host 接続するホストを指定します。
  # @param user ログインに使うユーザ名を指定します。
  # @param passwd ログインに使うパスワードを指定します。
  # @param acct ログイン後に送る ACCT コマンドのパラメータを指定します。
  # 
  # @raise Net::FTPTempError 応答コードが 4yz のときに発生します。
  # @raise Net::FTPPermError 応答コードが 5yz のときに発生します。
  # @raise Net::FTPProtoError 応答コードが RFC 的に正しくない場合に発生します。
  # @raise Net::FTPReplyError 応答コードが上の場合以外で正しくない場合(1xy, 3xyが来るべきでないときに来た場合など)に発生します。
  def open; end

  # --- DEFAULT_BLOCKSIZE -> Integer
  # get, put をするときのデフォルトのブロックサイズです。
  def DEFAULT_BLOCKSIZE; end

  # --- FTP_PORT -> Integer
  # FTPのデフォルトのポート番号(21)です。
  def FTP_PORT; end

end
