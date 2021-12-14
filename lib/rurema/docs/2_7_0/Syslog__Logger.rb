class Syslog::Logger
  # --- add(severity, message = nil, progname = nil, &block) -> true
  # 
  # メッセージをログに記録します。[[m:Logger#add]] とほぼ同じ動作をします。
  # 
  # ブロックを与えた場合はブロックを評価した返り値をメッセージとしてログに
  # 記録します。 ユーザがこのメソッドを直接使うことはあまりありません。
  # 
  # @param severity ログレベル。Logger クラスで定義されている定数を指定しま
  #                 す。この値がレシーバーに設定されているレベルよりも低い
  #                 場合、メッセージは記録されません。
  # 
  # @param message ログに出力するメッセージを表すオブジェクトを指定します。
  #                省略すると nil が用いられます。
  # 
  # @param progname 無視されます。
  # 
  # @see [[m:Logger#add]]
  def add; end

  # --- debug(message = nil, &block) -> true
  # 
  # DEBUG 情報を出力します。syslog の DEBUG の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#debug]]
  def debug; end

  # --- debug? -> bool
  # 
  # self が DEBUG 以上の(syslog の debug)ログレベルのメッセージを記録する場
  # 合に true を返します。
  def debug?; end

  # --- error(message = nil, &block) -> true
  # 
  # ERROR 情報を出力します。syslog の warning の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#error]]
  def error; end

  # --- error? -> bool
  # 
  # self が ERROR 以上の(syslog の warning)ログレベルのメッセージを記録する
  # 場合に true を返します。
  def error?; end

  # --- fatal(message = nil, &block) -> true
  # 
  # FATAL 情報を出力します。syslog の err の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#fatal]]
  def fatal; end

  # --- fatal? -> bool
  # 
  # self が FATAL 以上の(syslog の err)ログレベルのメッセージを記録する場合
  # に true を返します。
  def fatal?; end

  # --- formatter -> Logger::Formatter | Proc
  # 
  # ログを出力する際に使用するフォーマッターを取得します。
  # 
  # デフォルトでは [[c:Logger::Formatter]] オブジェクトを返します。
  # 
  # @see [[m:Syslog::Logger#formatter=]]
  def formatter; end

  # --- formatter=(formatter)
  # 
  # ログを出力する際に使用するフォーマッターをセットします。
  # 
  # @param formatter 4 つの引数 (severity, time, program name, message) を
  #                  受け取る call メソッドを 持つオブジェクトを指定します。
  # 
  # 引数 formatter が持つ call メソッドは以下の 4 つの引数 (severity,
  # time, program name, message) を受けとります。
  # 
  # : severity
  # 
  #   このメッセージのログレベル([[c:Logger::Severity]] 参照)。
  # 
  # : time
  # 
  #   このメッセージが記録された時刻を表す [[c:Time]] オブジェクト。
  # 
  # : progname
  # 
  #   無視されます。互換性のために用意されています。
  # 
  # : message
  # 
  #   記録するメッセージ。
  # 
  # call メソッドは文字列を返す必要があります。
  # 
  # @see [[m:Syslog::Logger#formatter]]
  def formatter=; end

  # --- info(message = nil, &block) -> true
  # 
  # INFO 情報を出力します。syslog の info の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#info]]
  def info; end

  # --- info? -> bool
  # 
  # self が INFO 以上の(syslog の info)ログレベルのメッセージを記録する場合
  # に true を返します。
  def info?; end

  # --- level -> Integer
  # 
  # self に設定されたログレベルを返します。
  # 
  # ログレベルは [[c:Logger]] と互換性があります。
  # 
  # @see [[m:Syslog::Logger#level=]]
  def level; end

  # --- level=(val)
  # 
  # self のログレベルを引数 val で指定した値に設定します。
  # 
  # @param val ログレベルを指定します。
  # 
  # @see [[m:Syslog::Logger#level]]
  def level=; end

  # --- unknown(message = nil, &block) -> true
  # 
  # UNKNOWN 情報を出力します。syslog の alert の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#unknown]]
  def unknown; end

  # --- unknown? -> bool
  # 
  # self が UNKNOWN 以上の(syslog の alert)ログレベルのメッセージを記録する
  # 場合に true を返します。
  def unknown?; end

  # --- warn(message = nil, &block) -> true
  # 
  # WARN 情報を出力します。syslog の notice の情報として記録されます。
  # 
  # ブロックを与えなかった場合は、message をメッセージとしてログを出力します。
  # 
  # ブロックを与えた場合は、ブロックを評価した結果をメッセージとして ログを出力します。
  # 
  # 引数とブロックを同時に与えた場合は、message をメッセージとしてログを出
  # 力します(ブロックは評価されません)。
  # 
  # @see [[m:Syslog::Logger::LEVEL_MAP]], [[m:Logger#warn]]
  def warn; end

  # --- warn? -> bool
  # 
  # self が WARN 以上の(syslog の notice)ログレベルのメッセージを記録する場
  # 合に true を返します。
  def warn?; end

  # --- make_methods(meth)
  # 
  # ライブラリ内部で使用します。
  def make_methods; end

  # --- new(program_name = 'ruby') -> Syslog::Logger
  # 
  # [[c:Syslog::Logger]] オブジェクトを初期化します。
  # 
  # @param program_name [[c:Logger]] との互換性のために用意されています。
  #                     プログラム名を文字列で指定できますが、最初の
  #                     [[c:Syslog::Logger]] の初期化時のみ、指定した値がセッ
  #                     トされます(syslog の仕様で 1 つのプログラム名のみが
  #                     採用されます)。
  def new; end

  # --- syslog -> Syslog
  # 
  # 内部の [[c:Syslog]] オブジェクトを返します。
  # 
  # デフォルトでは、最初の [[c:Syslog::Logger]] オブジェクトの作成時に作ら
  # れたものを返します。
  def syslog; end

  # --- syslog=(syslog)
  # 
  # 内部の [[c:Syslog]] オブジェクトを引数 syslog で指定したものに設定します。
  # 
  # @param syslog [[c:Syslog]] オブジェクトを指定します。
  def syslog=; end

  # --- LEVEL_MAP -> {Integer => Integer}
  # 
  # [[c:Logger]] のログレベルと [[man:syslog(3)]] のログレベルのマッピング
  # を表す [[c:Hash]] オブジェクトです。
  # 
  # [[c:Syslog::Logger]] では、Ruby アプリケーションからのメッセージはシス
  # テム上の他のデーモンからの [[man:syslog(3)]] に記録されるメッセージと比
  # べて、ログレベルを 1 つ下げて記録されます
  # ([[m:Logger::Severity::DEBUG]] と [[m:Logger::Severity::INFO]] は除く)。
  # 例えば、[[m:Logger::Severity::FATAL]] として記録した場合、
  # [[m:Syslog::Level::LOG_ERR]] として処理されます。
  def LEVEL_MAP; end

  # --- VERSION -> '2.0'
  # 
  # [[c:Syslog::Logger]] のバージョンを表す文字列です。
  def VERSION; end

end
