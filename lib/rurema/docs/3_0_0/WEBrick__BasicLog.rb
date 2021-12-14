class WEBrick::BasicLog
  # --- <<(obj)    -> ()
  # 
  # 指定された obj を to_s メソッドで文字列に変換してから、
  # ログレベル INFO でログに記録します。
  # 
  # @param obj 記録したいオブジェクトを指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  # 
  #   require 'webrick'
  #   logger = WEBrick::BasicLog.new() 
  #   logger << 'hoge'
  def <<; end

  # --- close    -> ()
  # 
  # 自身を閉じます。ログを取ることができなくなります。
  def close; end

  # --- debug(msg)    -> ()
  # 
  # ログレベル DEBUG で文字列 msg をログに記録します。
  # 自身の level が DEBUG より重要度が高い場合には記録しません。
  # 
  # 行頭に level を表す文字列が追加されます。
  # msg の終端が "\n" でない場合には "\n" を追加します。
  # 
  # @param msg 記録したい文字列を指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  def debug; end

  # --- debug?    -> bool
  # 
  # 自身のログレベルが DEBUG 以上の時に true を返します。
  # そうでない場合に false を返します。
  def debug?; end

  # --- error(msg)    -> ()
  # 
  # ログレベル ERROR で文字列 msg をログに記録します。
  # 自身の level が ERROR より重要度が高い場合には記録しません。
  # 
  # 行頭に level を表す文字列が追加されます。
  # msg の終端が "\n" でない場合には "\n" を追加します。
  # 
  # @param msg 記録したい文字列を指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  def error; end

  # --- error?    -> bool
  # 
  # 自身のログレベルが ERROR 以上の時に true を返します。
  # そうでない場合に false を返します。
  def error?; end

  # --- fatal(msg)    -> ()
  # 
  # ログレベル FATAL で文字列 msg をログに記録します。
  # 
  # 行頭に level を表す文字列が追加されます。
  # msg の終端が "\n" でない場合には "\n" を追加します。
  # 
  # @param msg 記録したい文字列を指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  # 
  #   require 'webrick'
  #   logger = WEBrick::BasicLog.new()
  #   logger.fatal('out of money')       #=> FATAL out of money   (標準エラー出力に出力)
  def fatal; end

  # --- fatal?    -> bool
  # 
  # 自身のログレベルが FATAL 以上の時に true を返します。
  # そうでない場合に false を返します。
  def fatal?; end

  # --- info(msg)    -> ()
  # 
  # ログレベル INFO で文字列 msg をログに記録します。
  # 自身の level が INFO より重要度が高い場合には記録しません。
  # 
  # 行頭に level を表す文字列が追加されます。
  # msg の終端が "\n" でない場合には "\n" を追加します。
  # 
  # @param msg 記録したい文字列を指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  def info; end

  # --- info?    -> bool
  # 
  # 自身のログレベルが INFO 以上の時に true を返します。
  # そうでない場合に false を返します。
  def info?; end

  # --- level        -> Integer
  # --- level=(lv)
  # 自身のログレベルを表すアクセサです。
  # 
  # @param lv ログレベルを定数で指定します。
  def level; end

  # --- log(level, msg)    -> ()
  # 
  # 指定された msg を指定されたログレベル level でログに記録します。
  # 
  # @param level 記録したい msg のレベルを FATAL, ERROR, WARN, INFO, DEBUG のいずれかの定数で指定します。
  # 
  # @param msg 記録したい文字列を指定します。
  def log; end

  # --- warn(msg)    -> ()
  # 
  # ログレベル WARN で文字列 msg をログに記録します。
  # 自身の level が WARN より重要度が高い場合には記録しません。
  # 
  # 行頭に level を表す文字列が追加されます。
  # msg の終端が "\n" でない場合には "\n" を追加します。
  # 
  # @param msg 記録したい文字列を指定します。文字列でない場合は to_s メソッドで文字列に変換します。
  def warn; end

  # --- warn?    -> bool
  # 
  # 自身のログレベルが WARN 以上の時に true を返します。
  # そうでない場合に false を返します。
  def warn?; end

  # --- new(log_file = nil, level = WEBrick::BasicLog::INFO)    -> WEBrick::BasicLog
  # 
  # WEBrick::BasicLog オブジェクトを生成して返します。
  # 
  # @param log_file ログを記録する先のオブジェクトを指定します。メソッド << が定義されている必要があります。
  #                 通常は [[c:String]] オブジェクトか [[c:IO]] オブジェクトです。nil
  #                 を指定した場合、標準エラー出力にログを出力します。
  # 
  # @param level ログレベルを定数で指定します。
  #              このログレベルと同じかより重要なレベルのデータのみを記録します。
  #              ログレベルは重要度の順に FATAL, ERROR, WARN, INFO, DEBUG の5段階があります。
  #              FATAL の重要度が一番高く DEBUG が一番低いです。
  # 
  #   require 'webrick'
  #   logger = WEBrick::BasicLog.new('testfile', WEBrick::BasicLog::FATAL)
  def new; end

  # --- DEBUG
  # 
  # ログレベルを表す定数です。重要度は5番です。
  def DEBUG; end

  # --- ERROR
  # 
  # ログレベルを表す定数です。重要度は2番です。
  def ERROR; end

  # --- FATAL
  # 
  # ログレベルを表す定数です。重要度は1番です。
  def FATAL; end

  # --- INFO
  # 
  # ログレベルを表す定数です。重要度は4番です。
  def INFO; end

  # --- WARN
  # 
  # ログレベルを表す定数です。重要度は3番です。
  def WARN; end

end
