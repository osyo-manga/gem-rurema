module Fcntl
  # --- FD_CLOEXEC -> Integer
  # close-on-exec フラグの値です。
  def FD_CLOEXEC; end

  # --- F_DUPFD -> Integer
  # ファイルディスクリプタを複製します。
  # 
  # ただし、 close-on-exec はオフになります。
  # 
  # @see [[man:dup(2)]]
  def F_DUPFD; end

  # --- F_GETFD -> Integer
  # ファイルディスクリプタから close-on-exec フラグの値を読み出します。
  def F_GETFD; end

  # --- F_GETFL -> Integer
  # ファイル状態フラグを読み出します。
  # 
  # @see [[man:open(2)]]
  def F_GETFL; end

  # --- F_GETLK -> Integer
  # 与えられたファイルの範囲のロック状態を取得します。
  def F_GETLK; end

  # --- F_RDLCK -> Integer
  # 読み出しリースを取得します。
  def F_RDLCK; end

  # --- F_SETFD -> Integer
  # ファイルディスクリプタに close-on-exec フラグの値を設定します。
  def F_SETFD; end

  # --- F_SETFL -> Integer
  # ファイル状態フラグを設定します。
  # 
  # @see [[man:open(2)]]
  def F_SETFL; end

  # --- F_SETLK -> Integer
  # ファイルの範囲のロックを取得します。
  def F_SETLK; end

  # --- F_SETLKW -> Integer
  # ファイルの範囲のロックを取得します。必要があればロックを取得できるまで待ちます。
  def F_SETLKW; end

  # --- F_UNLCK -> Integer
  # そのファイルからリースを削除します。
  def F_UNLCK; end

  # --- F_WRLCK -> Integer
  # 書き込みリースを取得します。
  def F_WRLCK; end

  # --- O_ACCMODE -> Integer
  # ファイルアクセスモードのマスクです。
  def O_ACCMODE; end

  # --- O_APPEND -> Integer
  # ファイルを追記モードで開きます。
  def O_APPEND; end

  # --- O_CREAT -> Integer
  # ファイルが存在しない場合にファイルを作成します。
  def O_CREAT; end

  # --- O_EXCL -> Integer
  # ファイルが存在する場合に失敗します。[[m:Fcntl::O_CREAT]] と一緒に使用します。
  def O_EXCL; end

  # --- O_NONBLOCK -> Integer
  # --- O_NDELAY -> Integer
  # ファイルを non-blocking モードで開きます。
  def O_NDELAY; end

  # --- O_NOCTTY -> Integer
  # 開いたファイルが端末デバイスでも、制御端末にはなりません。
  def O_NOCTTY; end

  # --- O_RDONLY -> Integer
  # ファイルを読み込み専用で開きます。
  def O_RDONLY; end

  # --- O_RDWR -> Integer
  # ファイルを読み書きできるように開きます。
  def O_RDWR; end

  # --- O_TRUNC -> Integer
  # ファイルを開くときに中身を切り捨てます。
  def O_TRUNC; end

  # --- O_WRONLY -> Integer
  # ファイルを書き込み専用で開きます。
  def O_WRONLY; end

end
