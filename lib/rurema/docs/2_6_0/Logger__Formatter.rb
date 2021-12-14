class Logger::Formatter
  # --- call(severity, time, progname, msg) -> String
  # 
  # ログ情報をフォーマットして返します。
  # 
  # @param severity ログレベル。
  # 
  # @param time 時間。[[c:Time]] クラスのオブジェクト。
  # 
  # @param progname プログラム名
  # 
  # @param msg メッセージ。
  def call; end

  # --- datetime_format -> String
  # 
  # ログの日時フォーマットを取得します。
  # 
  # 
  # @see [[m:Time#strftime]]
  def datetime_format; end

  # --- datetime_format=(format)
  # 
  # ログの日時フォーマットをセットします。
  # 
  # @param format 日時のフォーマット文字列。[[m:Time#strftime]] で使用するフォーマット文字列と
  #               同じものを使用できます。
  # 
  # //emlist[例][ruby]{
  # require 'logger'
  # 
  # formatter = Logger::Formatter.new
  # formatter.datetime_format # => nil
  # formatter.datetime_format = '%Y-%m-%d %H:%M:%S' # => "%Y-%m-%d %H:%M:%S"
  # formatter.datetime_format # => "%Y-%m-%d %H:%M:%S"
  # //}
  # 
  # @see [[m:Time#strftime]]
  def datetime_format=; end

  # --- Format -> String
  # 
  # フォーマット文字列。
  def Format; end

end
