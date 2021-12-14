class Net::POP3
  # --- started? -> bool
  # --- active? -> bool
  # POP3 セッションが開始されていたら真を返します。
  # 
  # active? は obsolete です。
  def active?; end

  # --- address -> String
  # 接続するアドレスです。
  def address; end

  # --- apop? -> bool
  # このインスタンスが APOP を使ってサーバに接続するなら true を返します。
  def apop?; end

  # --- auth_only(account, password) -> ()
  # POP セッションを開き、認証だけを行って接続を切ります。
  # 
  # 主に POP before SMTP のために用意されています。
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   pop = Net::POP3.new('pop.example.com')
  #   pop.auth_only 'YourAccount', 'YourPassword'
  # 
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @raise IOError セッションが既に開始されている場合に発生します
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def auth_only; end

  # --- delete_all -> ()
  # --- delete_all {|popmail| .... } -> ()
  # サーバ上のメールを全て消去します。
  # 
  # ブロックを与えられたときは消去する前に各メールを引数としてブロックを呼びだします。
  # メールは [[c:Net::POPMail]] のインスタンスとして渡されます。
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   n = 1
  #   pop.delete_all do |m|
  #     File.open("inbox/#{n}") {|f| f.write m.pop }
  #     n += 1
  #   end
  def delete_all; end

  # --- disable_ssl -> ()
  # このインスタンスが SSL による通信を利用しないように設定します。
  # 
  # @see [[m:Net::POP3#enable_ssl]], [[m:Net::POP3#disable_ssl]], [[m:Net::POP3#use_ssl?]], [[m:Net::POP3.enable_ssl]]
  def disable_ssl; end

  # --- each_mail {|popmail| .... } -> [Net::POPMail]
  # --- each {|popmail| .... } -> [Net::POPMail]
  # サーバ上の各メールを引数としてブロックを呼びだします。
  # 
  # メールは [[c:Net::POPMail]] のインスタンスとして渡されます。
  # 
  # pop3.mails.each と同じです。
  # 
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPError サーバがエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def each; end

  # --- enable_ssl(verify_or_params={}, certs=nil) -> ()
  # このインスタンスが SSL による通信を利用するように設定します。
  # 
  # verify_or_params にハッシュを渡した場合には、接続時に生成される
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクトの
  # [[m:OpenSSL::SSL::SSLContext#set_params]] に渡されます。
  # certs は無視されます。
  # 
  # verify_or_params がハッシュでない場合には、接続時に生成される
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクトの
  # [[m:OpenSSL::SSL::SSLContext#set_params]] に
  #   { :verify_mode => verify_or_params, :ca_path => certs }
  # というハッシュが渡されます。
  # 
  # @param verify_or_params SSLの設定のハッシュ、もしくは SSL の設定の verify_mode
  # @param certs SSL の設定の ca_path
  # 
  # @see [[m:Net::POP3.enable_ssl]], [[m:Net::POP3#disable_ssl]], [[m:Net::POP3#use_ssl?]]
  def enable_ssl; end

  # --- finish -> ()
  # POP3 セッションを終了し、接続を閉じます。
  # 
  # @raise IOError セッション開始前にこのメソッドを呼ぶと発生します
  def finish; end

  # --- mails -> [Net::POPMail]
  # サーバ上の全てのメールを、[[c:Net::POPMail]]オブジェクトの配列として返します。
  # 
  # この配列はメールを最初に取得しようとしたときに生成され、セッションの間
  # キャッシュされます。
  # 
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPError サーバがエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def mails; end

  # --- n_bytes -> Integer
  # サーバにあるメールの総バイト数を返します。
  # 
  # @see [[m:Net::POP3#n_mails]]
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPError サーバがエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def n_bytes; end

  # --- n_mails -> Integer
  # サーバにあるメールの数を返します。
  # 
  # @see [[m:Net::POP3#n_bytes]]
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPError サーバがエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def n_mails; end

  # --- open_timeout -> Integer
  # 接続時に待つ最大秒数を返します。
  # 
  # この秒数たってもコネクションが開かないときは例外 [[c:Net::OpenTimeout]] を発生します。
  # 
  # デフォルトは30秒です。
  # 
  # @see [[m:Net::POP3#open_timeout=]]
  def open_timeout; end

  # --- open_timeout=(n)
  # 接続時に待つ最大秒数を設定します。
  # 
  # @param n タイムアウトまでの秒数
  # @see [[m:Net::POP3#open_timeout]]
  def open_timeout=; end

  # --- port -> Integer
  # 接続するポート番号です。
  def port; end

  # --- read_timeout -> Integer
  # 読み込みでブロックしてよい最大秒数を返します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:ReadTimeout]] を発生します。
  # 
  # デフォルトは60秒です。
  # 
  # @see [[m:Net::POP3#read_timeout=]]
  def read_timeout; end

  # --- read_timeout=(n)
  # 読み込みでブロックしてよい最大秒数を設定します。
  # 
  # この秒数たっても読みこめなければ例外 [[c:ReadTimeout]] を発生します。
  # 
  # @param n タイムアウトまでの秒数
  # @see [[m:Net::POP3#read_timeout]]
  def read_timeout=; end

  # --- reset -> ()
  # セッションをリセットします。
  # 
  # リセットによって [[m:Net::POPMail#delete]] で付けた削除マークがすべて
  # 取り除かれます。
  # 
  # POP3 ではメール一個だけを復活する方法はありません。
  def reset; end

  # --- set_debug_output(f) -> ()
  # デバッグ用の出力 f をセットします。
  # 
  # このメソッドは深刻なセキュリティホールの原因となりえます。
  # デバッグ以外の用途では使わないでください。
  # 
  # f は << メソッドを持っているオブジェクトでなければなりません。
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   pop = Net::POP3.new('pop.example.com', 110)
  #   pop.set_debug_output $stderr
  #   pop.start('YourAccount', 'YourPassword') {
  #     p pop.n_bytes
  #   }
  # 
  # 実行結果:
  # 
  #   POP session started: pop.example.com:110 (POP)
  #   -> "+OK popd <1162042773.26346.155555a1861c@pop.example.com>\r\n"
  #   <- "APOP YourAccount XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n"
  #   -> "+OK\r\n"
  #   <- "STAT\r\n"
  #   -> "+OK 37 339936\r\n"
  #   339936
  #   <- "QUIT\r\n"
  #   -> "+OK\r\n"
  def set_debug_output; end

  # --- start(account, password) -> self
  # --- start(account, password) {|pop| .... } -> object
  # サーバへ接続し、POP3のセッションを開始します。
  # 
  # ブロックが渡された場合にはセッション開始後
  # そのオブジェクト自身を引数としてブロックが呼びだされます。
  # ブロック終了時にセッションを終了させます。
  # 
  # ブロックが渡されなかった場合にはそのオブジェクト自身を返します。
  # この場合セッションを終了させるのはユーザの責任となります。
  # 
  # 
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @raise IOError セッションが既に開始されている場合に発生します
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def start; end

  # --- use_ssl? -> bool
  # このインスタンスが SSL を使って接続するなら真を返します。
  # 
  # @see [[m:Net::POP3#enable_ssl]], [[m:Net::POP3#disable_ssl]]
  def use_ssl?; end

  # --- APOP(is_apop) -> Class
  # bool が真なら [[c:Net::APOP]] クラス、偽なら [[c:Net::POP3]] クラスを返します。
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   pop = Net::POP3::APOP($isapop).new(addr, port)
  #   pop.start(account, password) {
  #     ....
  #   }
  # 
  # @param is_apop 真の場合に Net::APOP を返します。
  def APOP; end

  # --- auth_only(address, port = nil, account, password, isapop=false)
  # POP セッションを開き、認証だけを行って接続を切ります。
  # 
  # 主に POP before SMTP のために用意されています。
  # 
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   Net::POP3.auth_only('pop.example.com', nil,     # using default port (110)
  #                       'YourAccount', 'YourPassword')
  # 
  # @param address POP3サーバのホスト名文字列
  # @param port 接続するPOP3サーバのポート番号
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @param isapop 真でAPOPを利用します
  # 
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  def auth_only; end

  # --- certs -> String|nil
  # SSL のパラメータの ca_file (なければ ca_path) を返します。
  # 
  # どちらも設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#ca_file]], [[m:OpenSSL::SSL::SSLContext#ca_path]]
  def certs; end

  # --- default_port -> Integer
  # --- default_pop3_port -> Integer
  # POP3 のデフォルトのポート番号(110)を返します。
  def default_pop3_port; end

  # --- default_pop3s_port -> Integer
  # デフォルトのPOP3Sのポート番号(995)を返します。
  def default_pop3s_port; end

  # --- delete_all(address, port = nil, account, password, isapop=false) -> ()
  # --- delete_all(address, port = nil, account, password, isapop=false) {|mail| .... } -> ()
  # POP セッションを開始し、サーバ上のメールを全て消去します。
  # 
  # ブロックを与えられたときは消去する前に各メールを引数としてブロックを呼びだします。
  # メールは [[c:Net::POPMail]] のインスタンスとして渡されます。
  # 
  # port に nil を渡すと、適当なポート(通常は110、SSL利用時には 995)を
  # 使います。
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   Net::POP3.delete_all(addr, nil, 'YourAccount', 'YourPassword') do |m|
  #     puts m.pop
  #   end
  # 
  # @param address POP3サーバのホスト名文字列
  # @param port 接続するPOP3サーバのポート番号
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @param isapop 真でAPOPを利用します
  # 
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  # @see [[m:Net::POP3.start]], [[m:Net::POP3#delete_all]]
  def delete_all; end

  # --- disable_ssl -> ()
  # 新しく生成する [[c:Net::POP3]] オブジェクトが
  # SSL を利用しないように設定します。
  # 
  # @see [[m:Net::POP3.enable_ssl]], [[m:Net::POP3.use_ssl?]]
  def disable_ssl; end

  # --- enable_ssl(verify_or_params={}, certs=nil) -> ()
  # 新しく生成する [[c:Net::POP3]] オブジェクトが
  # SSL による通信利用するように設定します。
  # 
  # verify_or_params にハッシュを渡した場合には、接続時に生成される
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクトの
  # [[m:OpenSSL::SSL::SSLContext#set_params]] に渡されます。
  # certs は無視されます。
  # 
  # verify_or_params がハッシュでない場合には、接続時に生成される
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクトの
  # [[m:OpenSSL::SSL::SSLContext#set_params]] に
  #   { :verify_mode => verify_or_params, :ca_path => certs }
  # というハッシュが渡されます。
  # 
  # @param verify_or_params SSLの設定のハッシュ、もしくは SSL の verify_mode
  # @param certs SSL の ca_path
  # 
  # @see [[m:Net::POP3.disable_ssl]], [[m:Net::POP3.use_ssl?]]
  def enable_ssl; end

  # --- foreach(address, port = nil, account, password, isapop=false) {|mail| .... } -> ()
  # POP セッションを開始し、
  # サーバ上のすべてのメールを取りだし、
  # 個々のメールを引数としてブロックを呼びだします。
  # 
  # 個々のメールは [[c:Net::POPMail]] のインスタンスで渡されます。
  # 
  # port に nil を渡すと、適当なポート(通常は110、SSL利用時には 995)を
  # 使います。
  # 
  # 以下のコードと同様の処理をします。
  #   require 'net/pop'
  # 
  #   Net::POP3.start(address, port, account, password, isapop=false) {|pop|
  #     pop.each_mail do |m|
  #       yield m
  #     end
  #   }
  #   
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   Net::POP3.foreach('pop.example.com', 110,
  #                     'YourAccount', 'YourPassword') do |m|
  #     file.write m.pop
  #     m.delete if $DELETE
  #   end
  # 
  # @param address POP3サーバのホスト名文字列
  # @param port 接続するPOP3サーバのポート番号
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @param isapop 真でAPOPを利用します
  # 
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  # @see [[m:Net::POP3.start]], [[m:Net::POP3#each_mail]]
  def foreach; end

  # --- new(address, port = nil, apop = false) -> Net::POP3
  # [[c:Net::POP3]] オブジェクトを生成します。
  # 
  # このメソッドではサーバの接続は行いません。
  # apop が真のときは APOP 認証を行うオブジェクトを生成します。
  # 
  # port に nil を渡すと、適当なポート(通常は110、SSL利用時には 995)を
  # 使います。
  # 
  # @param address POP3サーバのホスト名文字列
  # @param port 接続するPOP3サーバのポート番号
  # @param apop 真の場合にはAPOPで認証します
  # 
  # @see [[m:Net::POP3#start]]
  def new; end

  # --- socket_type -> Class
  # 
  # このメソッドは obsolete です。
  # 使わないでください。
  def socket_type; end

  # --- ssl_params -> Hash|nil
  # SSL での接続を有効にしている場合には、
  # SSL の設定のハッシュを返します。
  # 
  # このハッシュは、接続時に生成される
  # [[c:OpenSSL::SSL::SSLContext]] オブジェクトの
  # [[m:OpenSSL::SSL::SSLContext#set_params]] に渡されます。
  # このハッシュを変更することで、利用されるパラメータが
  # 変更されます。
  # 
  # SSL を有効にしていない場合には nil を返します。
  def ssl_params; end

  # --- start(address, port = nil, account=nil, password=nil, isapop=false) -> Net::POP3
  # --- start(address, port = nil, account=nil, password=nil, isapop=false) {|pop| .... } -> object
  # 
  # [[c:Net::POP3]] オブジェクトを生成し、サーバへ接続します。
  # 
  # ブロックを与えない場合には生成したオブジェクトを返します。
  # 
  # ブロックを与えた場合には、生成した [[c:Net::POP3]] オブジェクトが
  # ブロックに渡され、ブロックが終わったときにセッションを終了させます。
  # この場合返り値はブロックの返り値となります。
  # 
  # port に nil を渡すと、適当なポート(通常は110、SSL利用時には 995)を
  # 使います。
  # 
  # 以下のコードと同じ動作をします。
  #   require 'net/pop'
  # 
  #   Net::POP3.new(address, port, isapop).start(account, password)
  # 
  # 使用例:
  # 
  #   require 'net/pop'
  # 
  #   Net::POP3.start(addr, port, account, password) {|pop|
  #     pop.each_mail do |m|
  #       file.write m.pop
  #       m.delete
  #     end
  #   }
  # 
  # @param address POP3サーバのホスト名文字列
  # @param port 接続するPOP3サーバのポート番号
  # @param account アカウント名文字列
  # @param password パスワード文字列
  # @param isapop 真でAPOPを利用します
  # 
  # @raise TimeoutError 接続がタイムアウトした場合に発生します
  # @raise Net::POPAuthenticationError 認証に失敗した、もしくはAPOPを利用しようとしたがサーバがAPOPを提供していない場合に発生します
  # @raise Net::POPError サーバが認証失敗以外のエラーを報告した場合に発生します
  # @raise Net::POPBadResponse サーバからの応答がプロトコル上不正であった場合に発生します
  # 
  # @see [[m:Net::POP3#start]]
  def start; end

  # --- use_ssl? -> bool
  # 新しく生成する [[c:Net::POP3]] オブジェクトが
  # SSL による通信利用するならば真を返します。
  def use_ssl?; end

  # --- verify -> Integer|nil
  # SSL のパラメータの verify_mode を返します。
  # 
  # 設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::SSL::SSLContext#verify_mode]]
  def verify; end

  # --- Revision -> String
  # ライブラリ(ファイル)のリビジョンです。
  # 使わないでください。
  def Revision; end

end
