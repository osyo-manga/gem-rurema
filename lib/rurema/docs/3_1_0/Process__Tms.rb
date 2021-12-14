class Process::Tms
  # --- cstime -> Float
  # 終了した子プロセスのシステム CPU 時間の合計(秒)を返します。
  # 
  # Windows 上では常に 0 を返します。
  def cstime; end

  # --- cstime=(n)
  # 終了した子プロセスのシステム CPU 時間の合計(秒)をセットします。
  def cstime=; end

  # --- cutime -> Float
  # 終了した子プロセスのユーザー CPU 時間の合計(秒)を返します。
  # 
  # Windows 上では常に 0 を返します。
  def cutime; end

  # --- cutime=(n)
  # 終了した子プロセスのユーザー CPU 時間の合計(秒)をセットします。
  def cutime=; end

  # --- stime -> Float
  # システム CPU 時間を返します。
  def stime; end

  # --- stime=(n)
  # システム CPU 時間をセットします。
  def stime=; end

  # --- utime -> Float
  # ユーザー CPU 時間を返します。
  def utime; end

  # --- utime=(n)
  # ユーザー CPU 時間をセットします。
  def utime=; end

end
