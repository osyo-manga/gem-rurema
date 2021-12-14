class Logger
  # --- <<(msg) -> Integer | nil
  # 
  # ログを出力します。
  # 
  # @param msg ログに出力するメッセージ。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # logger = Logger.new(STDOUT)
  # 
  # logger << "add message"
  # 
  # # => add message
  # //}
  def <<; end

  # --- add(severity, message = nil, progname = nil) -> true
  # --- add(severity, message = nil, progname = nil){ ... } -> true
  # --- log(severity, message = nil, progname = nil) -> true
  # --- log(severity, message = nil, progname = nil){ ... } -> true
  # 
  # メッセージをログに記録します。
  # 
  # ブロックを与えた場合はブロックを評価した返り値をメッセージとしてログに記録します。
  # ユーザがこのメソッドを直接使うことはあまりありません。
  # 
  # @param severity ログレベル。[[c:Logger]] クラスで定義されている定数を指定します。
  #                 この値がレシーバーに設定されているレベルよりも低い場合、
  #                 メッセージは記録されません。
  # 
  # @param message ログに出力するメッセージを文字列か例外オブジェクトを指定します。
  #                省略すると nil が用いられます。
  # 
  # @param progname ログメッセージと一緒に記録するプログラム名を指定します。
  #                 省略すると nil が使用されますが、実際には内部で保持されている値が使用されます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # 
  # logger.add(Logger::FATAL) { 'Fatal error!' }
  # # 通常はログレベルごとのメソッドを使えばいいので、 add は使わない
  # logger.fatal('Fatal error!')
  # 
  # # => F, [2019-03-11T00:34:18.037272 #1320] FATAL -- : Fatal error!
  # #    F, [2019-03-11T00:34:18.037272 #1320] FATAL -- : Fatal error!
  # //}
  def add; end

  # --- close -> nil
  # 
  # ログ出力に使用していた IO オブジェクトを閉じます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # 
  # logger.info("test") # => I, [2019-04-16T00:40:11.837898 #2795]  INFO -- : test
  # logger.close
  # logger.info("test") # => log writing failed. closed stream
  # //}
  def close; end

  # --- datetime_format -> String | nil
  # 
  # ログに記録する時の日付のフォーマットです。
  # 
  # デフォルトでは nil ですが、この値が nil の場合は日付のフォーマットとして
  # "%Y-%m-%dT%H:%M:%S.%06d " を使用します。
  # 
  # なお、"%06d" には [[m:Time#strftime]] ではなく、単に [[m:Time#usec]] の
  # 値を [[m:String#%]] でフォーマットしたものが入ります。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # 
  # logger.datetime_format # => nil
  # logger.debug("test")
  # logger.datetime_format = '%Y/%m/%dT%H:%M:%S.%06d'
  # logger.datetime_format # => "%Y/%m/%dT%H:%M:%S.%06d"
  # logger.debug("test")
  # 
  # # => D, [2019-03-12T22:52:13.674385 #17393] DEBUG -- : test
  # #    D, [2019/03/12T22:52:13.000012#17393] DEBUG -- : test
  # //}
  # 
  # @see [[m:Time#strftime]], [[m:Logger#datetime_format=]]
  def datetime_format; end

  # --- datetime_format=(format)
  # 
  # ログに記録する時の日付のフォーマットをセットします。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # 
  # logger.datetime_format # => nil
  # logger.debug("test")
  # logger.datetime_format = '%Y/%m/%dT%H:%M:%S.%06d' # => "%Y/%m/%dT%H:%M:%S.%06d"
  # logger.datetime_format # => "%Y/%m/%dT%H:%M:%S.%06d"
  # logger.debug("test")
  # 
  # # => D, [2019-03-13T23:52:13.674385 #17393] DEBUG -- : test
  # #    D, [2019/03/13T23:52:13.000012#17393] DEBUG -- : test
  # //}
  # 
  # @see [[m:Time#strftime]], [[m:Logger#datetime_format]]
  def datetime_format=; end

  # --- debug(progname = nil) -> true
  # --- debug(progname = nil){ ... } -> true
  # 
  # ログレベルが DEBUG のメッセージを出力します。
  # 
  # 現在の Logger のログレベルが DEBUG よりも高い場合、メッセージは出力されません。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # 例:
  # 
  #   logger.debug "Waiting for input from user"
  #   # ...
  #   logger.debug { "User typed #{input}" }
  # 
  #   logger.debug("MainApp") { "Received connection from #{ip}" }
  def debug; end

  # --- debug? -> bool
  # 
  # 現在の Logger オブジェクトが DEBUG 以上のログレベルのメッセージを記録するなら
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT, level: Logger::Severity::DEBUG)
  # logger.debug? # => true
  # logger = Logger.new(STDOUT, level: Logger::Severity::INFO)
  # logger.debug? # => false
  # //}
  def debug?; end

  # --- error(progname = nil){ ... } -> true
  # --- error(progname = nil) -> true
  # 
  # ERROR 情報を出力します。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.error("error1") # => E, [2019-03-15T22:54:37.925635 #14878] ERROR -- : error1
  # logger.error("MainApp") { "error2" } # => E, [2019-03-16T03:50:58.062094 #2172] ERROR -- MainApp: error2
  # logger.level = Logger::Severity::FATAL
  # # 出力されない
  # logger.error("error3")
  # //}
  # 
  # @see [[m:Logger#debug]]
  def error; end

  # --- error? -> bool
  # 
  # 現在の Logger オブジェクトが ERROR 以上のログレベルのメッセージを記録するなら
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.error? # => true
  # logger.level = Logger::Severity::FATAL
  # logger.error? # => false
  # //}
  def error?; end

  # --- fatal(progname = nil){ ... } -> true
  # --- fatal(progname = nil) -> true
  # 
  # FATAL 情報を出力します。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.fatal("fatal1")               # => F, [2019-03-17T22:36:43.042422 #4028] FATAL -- : fatal1
  # logger.fatal("MainApp") { "fatal2" } # => F, [2019-03-17T22:36:43.042462 #4028] FATAL -- MainApp: fatal2
  # //}
  # 
  # @see [[m:Logger#debug]]
  def fatal; end

  # --- fatal? -> bool
  # 
  # 現在の Logger オブジェクトが FATAL 以上のログレベルのメッセージを記録するなら
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT, level: Logger::Severity::FATAL)
  # logger.fatal? # => true
  # logger.level = 5
  # logger.fatal? # => false
  # //}
  def fatal?; end

  # --- formatter -> String
  # 
  # ログを出力する際に使用するフォーマッターを取得します。
  # 
  # このメソッドの返り値が持つ call メソッドは 4 つの引数 (severity, time, program name, message) を受けとります。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.formatter # => nil
  # logger.info("test")
  # # => I, [2019-05-09T22:13:56.509159 #13912]  INFO -- : test
  # 
  # ltsv_formatter = proc { |severity, timestamp, progname, msg|
  #   "time:#{timestamp}\tlevel:#{severity}\tprogname:#{progname}\tmessage:#{msg}\n"
  # }
  # logger.formatter = ltsv_formatter
  # logger.formatter # => #<Proc:0x00007fa3048b8e00@/path/to/file:8>
  # logger.info("MyApp") { "test" }
  # 
  # # => time:2019-05-09 22:13:56 +0900 level:INFO  progname:MyApp  message:test
  # //}
  def formatter; end

  # --- formatter=(formatter)
  # 
  # ログを出力する際に使用するフォーマッターをセットします。
  # 
  # @param formatter 4 つの引数 (severity, time, program name, message) を受け取る call メソッドを
  #                  持つオブジェクトを指定します。call メソッドの返り値は文字列にしてください。
  # 
  #   require 'logger'
  #   logger = Logger.new
  #   logger.formatter = proc{|severity, datetime, progname, message|
  #     "#{datetime}: #{message}\n"
  #   }
  def formatter=; end

  # --- info(progname = nil){ ... } -> true
  # --- info(progname = nil) -> true
  # 
  # INFO 情報を出力します。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.info("info1")               # => I, [2019-03-21T03:36:28.003418 #2533]  INFO -- : info1
  # logger.info("MainApp") { "info2" } # => I, [2019-03-21T03:36:28.003493 #2533]  INFO -- MainApp: info2
  # //}
  # 
  # @see [[m:Logger#debug]]
  def info; end

  # --- info? -> bool
  # 
  # 現在の Logger オブジェクトが INFO 以上のログレベルのメッセージを記録するなら
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.info? # => true
  # logger.level = Logger::Severity::ERROR
  # logger.info? # => false
  # //}
  def info?; end

  # --- level -> Integer
  # --- sev_threshold -> Integer
  # 
  # レシーバにセットされているログレベルを取得します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.level # => 0
  # logger.level = Logger::Severity::ERROR
  # logger.level # => 3
  # //}
  def level; end

  # --- level=(level)
  # --- sev_threshold=(level)
  # 
  # Logger オブジェクトのログレベルを設定します。ログレベルがこれより低いメッセージは
  # 出力されません。
  # 
  # @param level ログレベルを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.level # => 0
  # logger.level = Logger::Severity::ERROR # => 3
  # logger.level # => 3
  # //}
  def level=; end

  # --- progname -> String
  # 
  # ログに出力するプログラム名を取得します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.progname # => nil
  # logger.progname = "MyProgName"
  # logger.progname # => "MyProgName"
  # //}
  def progname; end

  # --- progname=(name)
  # 
  # ログに出力するプログラム名を設定します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.progname                          # => nil
  # logger.progname = "MyProgName"           # => "MyProgName"
  # logger.progname                          # => "MyProgName"
  # logger.info("info1")                     # => I, [2019-04-23T00:08:55.585459 #2823]  INFO -- MyProgName: info1
  # logger.info("OtherProgName") { "info2" } # => I, [2019-04-23T00:08:55.585500 #2823]  INFO -- OtherProgName: info2
  # //}
  def progname=; end

  # --- unknown(progname = nil){ ... } -> true
  # --- unknown(progname = nil) -> true
  # 
  # UNKNOWN 情報を出力します。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.unknown("unknown1")              # => A, [2019-03-28T00:26:42.850942 #2765]   ANY -- : unknown1
  # logger.unknown("MyApp") { "unknown2" }  # => A, [2019-03-28T00:26:42.851021 #2765]   ANY -- MyApp: unknown2
  # //}
  # 
  # @see [[m:Logger#debug]]
  def unknown; end

  # --- warn(progname = nil){ ... } -> true
  # --- warn(progname = nil) -> true
  # 
  # WARN 情報を出力します。
  # 
  # ブロックを与えなかった場合は、progname をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして
  # ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、progname をプログラム名、ブロックを評価した
  # 結果をメッセージとしてログを出力します。
  # 
  # @param progname ブロックを与えない場合は、メッセージとして文字列または例外オブジェクトを指定します。
  #                 ブロックを与えた場合は、プログラム名を文字列として与えます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.warn("warn1")              # => W, [2019-03-27T22:46:17.744243 #12744]  WARN -- : warn1
  # logger.warn("MyApp") { "warn2" }  # => W, [2019-03-27T22:46:17.744322 #12744]  WARN -- MyApp: warn2
  # logger.level = Logger::Severity::ERROR
  # # 出力されない
  # logger.warn("warn3")
  # //}
  # 
  # @see [[m:Logger#debug]]
  def warn; end

  # --- warn? -> bool
  # 
  # 現在の Logger オブジェクトが WARN 以上のログレベルのメッセージを記録するなら
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # logger = Logger.new(STDOUT)
  # logger.warn? # => true
  # logger.level = Logger::Severity::ERROR
  # logger.warn? # => false
  # //}
  def warn?; end

  # --- new(logdev, shift_age = 0, shift_size = 1048576, level: Logger::Severity::DEBUG, progname: nil, formatter: Formatter.new, datetime_format: nil, shift_period_suffix: '%Y%m%d') -> Logger
  # 
  # Logger オブジェクトを生成します。
  # 
  # @param logdev ログを書き込むファイル名か、 IO オブジェクト(STDOUT, STDERR など)を指定します。
  # 
  # @param shift_age ログファイルを保持する数か、ログファイルを切り替える頻度を指定します。
  #                  頻度には daily, weekly, monthly を文字列で指定することができます。
  #                  省略すると、ログの保存先を切り替えません。
  # 
  # @param shift_size shift_age を整数で指定した場合のみ有効です。
  #                   このサイズでログファイルを切り替えます。
  # 
  # @param level ログに記録する時のログレベルを指定します。省略した場合は
  #              [[m:Logger::Severity::DEBUG]] です。
  # 
  # @param progname ログに記録する時のプログラム名を指定します。省略した場合は nil です。
  # 
  # @param formatter ログに記録する時のログのフォーマッタを指定します。
  #                  省略した場合は [[c:Logger::Formatter]] インスタンスです。
  # 
  # @param datetime_format ログに記録する時の日時のフォーマットを指定します。
  #                        省略した場合は '%Y-%m-%d %H:%M:%S' です。
  # 
  # @param shift_period_suffix daily、weekly、monthlyでログファイルの切り替
  #                            えを行う時のログファイルの名の末尾に追加する
  #                            文字列のフォーマットを指定します。
  #                            省略した場合は '%Y%m%d' です。
  # 
  # 例:
  # 
  #   require 'logger'
  #   logger = Logger.new(STDERR)
  #   logger = Logger.new(STDOUT)
  #   logger = Logger.new('logfile.log')
  #   
  #   file = File.open('foo.log', File::WRONLY | File::APPEND | File::CREAT)
  #   logger = Logger.new(file, 'daily')
  #   logger = Logger.new(file, level: :info)
  #   logger = Logger.new(file, progname: 'progname')
  #   logger = Logger.new(file, formatter: formatter)
  #   logger = Logger.new(file, datetime_format: '%Y-%m-%d %H:%M:%S')
  def new; end

  # --- ProgName -> String
  # ログファイル作成時に使うプログラム名。
  def ProgName; end

  # --- SEV_LABEL -> Array
  # 
  # ログレベルのラベルを格納した配列。
  def SEV_LABEL; end

  # --- VERSION -> String
  # このライブラリのバージョンを表す文字列。
  def VERSION; end

end
