module File::Constants
  # --- APPEND -> Integer
  # 追記モードでファイルを開くときに指定します。
  # [[m:File.open]]で使用します。
  def APPEND; end

  # --- BINARY -> Integer
  # ファイルをバイナリとして開きます。
  # open(2) で O_BINARYが指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def BINARY; end

  # --- CREAT -> Integer
  # ファイルがなければ作成するよう指定します。
  # [[m:File.open]]で使用します。
  def CREAT; end

  # --- DIRECT -> Integer
  # このファイルに対する I/O のキャッシュの効果を最小化しようとする。 
  # 
  # このフラグを使うと、一般的に性能が低下する。 しかしアプリケーションが独自に
  # キャッシングを行っているような 特別な場合には役に立つ。 ファイルの I/O
  # はユーザー空間バッファに対して直接行われる。 [[m:File::Constants::DIRECT]] フラグ自身はデー
  # タを同期で転送しようとはするが、 [[m:File::Constants::SYNC]] のようにデータと必要なメタデー
  # タの転送が保証されるわけではない。 同期 I/O を保証するためには、
  # [[m:File::Constants::DIRECT]] に加えて [[m:File::Constants::SYNC]] を使用しなければならない。
  # 
  # [[m:File.open]]で使用します。
  def DIRECT; end

  # --- DSYNC -> Integer
  # ファイルをデータ同期モードで開きます。
  # open(2) で O_DSYNC が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def DSYNC; end

  # --- EXCL -> Integer
  # CREATと併用し、もしファイルが既にある場合には失敗します。
  # [[m:File.open]]で使用します。
  def EXCL; end

  # --- FNM_CASEFOLD -> Integer
  # アルファベットの大小文字を区別せずにパターンマッチを行います。
  # [[m:File.fnmatch]], [[m:Dir.glob]]で使用します。
  def FNM_CASEFOLD; end

  # --- FNM_DOTMATCH -> Integer
  # ワイルドカード `*', `?', `[]' が先頭の `.' にマッチするようになります。
  # [[m:File.fnmatch]], [[m:Dir.glob]]で使用します。
  def FNM_DOTMATCH; end

  # --- FNM_EXTGLOB -> Integer
  # {} 内のコンマで区切られた文字列の組合せにマッチするようになります。
  # [[m:File.fnmatch]] で使用します。
  def FNM_EXTGLOB; end

  # --- FNM_NOESCAPE -> Integer
  # エスケープ文字 `\' を普通の文字とみなします。
  # [[m:File.fnmatch]], [[m:Dir.glob]]で使用します。
  def FNM_NOESCAPE; end

  # --- FNM_PATHNAME -> Integer
  # ワイルドカード `*', `?', `[]' が `/' にマッチしなくなります。
  # シェルのパターンマッチにはこのフラグが使用されています。
  # [[m:File.fnmatch]], [[m:Dir.glob]]で使用します。
  def FNM_PATHNAME; end

  # --- FNM_SYSCASE -> Integer
  # case hold なファイルシステムの場合、FNM_CASEFOLD の値になり、そうでなければゼロの値になります。
  # [[m:File.fnmatch]], [[m:Dir.glob]]で使用します。
  def FNM_SYSCASE; end

  # --- LOCK_EX -> Integer
  # 排他ロック。同時にはただひとつのプロセスだけがロックを保持できます。
  # [[m:File#flock]] で使用します。
  def LOCK_EX; end

  # --- LOCK_NB -> Integer
  # ロックの際にブロックしない。他の指定と or することで指定します。
  # [[m:File#flock]] で使用します。
  def LOCK_NB; end

  # --- LOCK_SH -> Integer
  # 共有ロック。複数のプロセスが同時にロックを共有できます。
  # [[m:File#flock]] で使用します。
  def LOCK_SH; end

  # --- LOCK_UN -> Integer
  # アンロック。[[m:File#flock]] で使用します。
  def LOCK_UN; end

  # --- NOATIME -> Integer
  # ファイル読み込み時に atime を更新しません。
  # open(2) で O_ATIME が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  # 
  # atime が更新されないのは確実ではないということに注意してください。
  # これは性能のためのオプションです。
  def NOATIME; end

  # --- NOCTTY -> Integer
  # 自身がTTY制御しないようにTTYを開きます。
  # [[m:File.open]]で使用します。
  def NOCTTY; end

  # --- NOFOLLOW -> Integer
  # ファイルがシンボリックリンクであった場合に
  # 例外を発生させます。
  # open(2) で O_NOFOLLOW が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def NOFOLLOW; end

  # --- NONBLOCK -> Integer
  # ファイルが利用可能じゃなくてもブロックしません。
  # [[m:File.open]]で使用します。
  def NONBLOCK; end

  # --- NULL -> String
  # NULLデバイスのファイル名です。
  def NULL; end

  # --- RDONLY -> Integer
  # 読み込みのみのモードでファイルを開くときに指定します。
  # [[m:File.open]]で使用します。
  def RDONLY; end

  # --- RDWR -> Integer
  # 読み書き両方のモードでファイルを開くときに指定します。
  # [[m:File.open]]で使用します。
  def RDWR; end

  # --- RSYNC -> Integer
  # ファイルを読み込み時同期モードで開きます。
  # open(2) で O_RSYNC が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def RSYNC; end

  # --- SHARE_DELETE -> Integer
  # ファイルを開いたままの状態でも削除できるように指定して開きます。
  # O_SHARE_DELETE が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  # 
  # 2.3.0 現在はファイルをバイナリとして開いた場合のみ有効です。
  def SHARE_DELETE; end

  # --- SYNC -> Integer
  # ファイルを同期モードで開きます。
  # open(2) で O_SYNCが指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def SYNC; end

  # --- TMPFILE -> Integer
  # 
  # 名前なしの一時ファイルを作成します。
  # open(2) で O_TMPFILE が指定できる場合に使えます。
  # [[m:File.open]]で使用します。
  def TMPFILE; end

  # --- TRUNC -> Integer
  # もしファイルが存在するなら、中身を抹消してサイズをゼロにします。
  # [[m:File.open]]で使用します。
  def TRUNC; end

  # --- WRONLY -> Integer
  # 書き込みのみのモードでファイルを開くときに指定します。
  # [[m:File.open]]で使用します。
  def WRONLY; end

end
