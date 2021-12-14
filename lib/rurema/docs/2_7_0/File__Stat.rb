class File::Stat
  # --- <=>(o) -> Integer | nil
  # 
  # ファイルの最終更新時刻を比較します。self が other よりも
  # 新しければ正の数を、等しければ 0 を古ければ負の数を返します。
  # 比較できない場合は nil を返します。
  # 
  # @param o [[c:File::Stat]] のインスタンスを指定します。
  # 
  # //emlist[][ruby]{
  # require 'tempfile' # for Tempfile
  # 
  # fp1 = Tempfile.open("first")
  # fp1.print "古い方\n"
  # sleep(1)
  # fp2 = Tempfile.open("second")
  # fp2.print "新しい方\n"
  # 
  # p File::Stat.new(fp1.path) <=> File::Stat.new(fp2.path) #=> -1
  # p File::Stat.new(fp2.path) <=> File::Stat.new(fp1.path) #=>  1
  # p File::Stat.new(fp1.path) <=> fp2.path #=> nil
  # //}
  def <=>; end

  # --- atime -> Time
  # 最終アクセス時刻を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.atime.to_a  #=> [45, 5, 21, 5, 9, 2007, 3, 248, false, "\223\214\213\236 (\225W\217\200\216\236) "]
  # //}
  # 
  # @see [[c:Time]]
  def atime; end

  # --- birthtime -> Time
  # 
  # 作成された時刻を返します。
  # 
  # @raise NotImplementedError  Windows のような birthtime のない環境で発生します。
  # 
  # //emlist[][ruby]{
  # File.write("testfile", "foo")
  # sleep 10
  # File.write("testfile", "bar")
  # sleep 10
  # File.chmod(0644, "testfile")
  # sleep 10
  # File.read("testfile")
  # File.stat("testfile").birthtime   #=> 2014-02-24 11:19:17 +0900
  # File.stat("testfile").mtime       #=> 2014-02-24 11:19:27 +0900
  # File.stat("testfile").ctime       #=> 2014-02-24 11:19:37 +0900
  # File.stat("testfile").atime       #=> 2014-02-24 11:19:47 +0900
  # //}
  def birthtime; end

  # --- blksize -> Integer
  # 望ましいI/Oのブロックサイズを返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.blksize #=> nil
  # //}
  def blksize; end

  # --- blockdev? -> bool
  # ブロックスペシャルファイルの時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/dev/*") {|bd|
  #   if File::Stat.new(bd).blockdev?
  #     puts bd
  #   end
  # }
  # #例
  # #...
  # #=> /dev/hda1
  # #=> /dev/hda3
  # #...
  # //}
  def blockdev?; end

  # --- blocks -> Integer
  # 割り当てられているブロック数を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.blocks  #=> nil
  # //}
  def blocks; end

  # --- chardev? -> bool
  # キャラクタスペシャルファイルの時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/dev/*") {|bd|
  #   if File::Stat.new(bd).chardev?
  #     puts bd
  #   end
  # }
  # #例
  # #...
  # #=> /dev/tty1
  # #=> /dev/stderr
  # #...
  # //}
  def chardev?; end

  # --- ctime -> Time
  # 最終状態変更時刻を返します。
  # (状態の変更とは chmod などによるもので、Unix では i-node の変更を意味します)
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.ctime.to_f   #=> 1188719843.0
  # //}
  # 
  # 
  # @see [[c:Time]]
  def ctime; end

  # --- dev -> String
  # デバイス番号(ファイルシステム)を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # p fs.dev
  # #例
  # #=> 2
  # //}
  def dev; end

  # --- dev_major -> Integer
  # dev の major 番号部を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # p fs.dev_major
  # #例
  # #=> nil #この場合ではシステムでサポートされていないため
  # //}
  def dev_major; end

  # --- dev_minor -> Integer
  # dev の minor 番号部を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # p fs.dev_minor
  # #例
  # #=> nil
  # //}
  def dev_minor; end

  # --- directory? -> bool
  # ディレクトリの時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).directory? #=> false
  # //}
  # 
  # @see [[m:FileTest.#directory?]]
  def directory?; end

  # --- executable? -> bool
  # 実効ユーザ/グループIDで実行できる時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).executable?
  # # 例
  # #=> true
  # //}
  def executable?; end

  # --- executable_real? -> bool
  # 実ユーザ/グループIDで実行できる時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).executable_real?
  # #例
  # #=> true
  # //}
  def executable_real?; end

  # --- file? -> bool
  # 通常ファイルの時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).file? #=> true
  # //}
  def file?; end

  # --- ftype -> String
  # ファイルのタイプを表す文字列を返します。
  # 
  # 文字列は以下のうちのいずれかです。
  # 
  #   "file"
  #   "directory"
  #   "characterSpecial"
  #   "blockSpecial"
  #   "fifo"
  #   "link"
  #   "socket"
  # 
  #   "unknown"
  # 
  # 
  # //emlist[例][ruby]{
  # fs = File::Stat.new($0)
  # p fs.ftype #=> "file"
  # p File::Stat.new($:[0]).ftype #=> "directory"
  # //}
  # 
  # 
  # 1.8 以降では、属性メソッドがシステムでサポートされていない場合 nil が返ります。
  # なお、1.7 以前では 0 が返っていました。
  def ftype; end

  # --- gid -> Integer
  # オーナーのグループIDを返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.gid      #=> 0
  # //}
  def gid; end

  # --- grpowned? -> bool
  # グループIDが実効グループIDと等しい時に真を返します。
  # 
  # 補助グループIDは考慮されません。
  # 
  # //emlist[][ruby]{
  # printf "%s %s\n", $:[0], File::Stat.new($:[0]).grpowned?
  # #例
  # #=> /usr/local/lib/site_ruby/1.8 false
  # printf "%s %s\n", $0, File::Stat.new($0).grpowned?
  # #例
  # #=> filestat.rb true
  # //}
  def grpowned?; end

  # --- ino -> Integer
  # i-node 番号を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.ino      #=> 0
  # //}
  def ino; end

  # --- mode -> Integer
  # ファイルモードを返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # printf "%o\n", fs.mode
  # #例
  # #=> 100644
  # //}
  def mode; end

  # --- mtime -> Time
  # 最終更新時刻を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.mtime   #=> Wed Sep 05 20:42:18 +0900 2007
  # //}
  # 
  # @see [[c:Time]]
  def mtime; end

  # --- nlink -> Integer
  # ハードリンクの数を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.nlink    #=> 1
  # //}
  def nlink; end

  # --- owned? -> bool
  # 自分のものである時に真を返します。
  # 
  # //emlist[][ruby]{
  # printf "%s %s\n", $:[0], File::Stat.new($:[0]).owned?
  # #例
  # #=> /usr/local/lib/site_ruby/1.8 false
  # //}
  def owned?; end

  # --- pipe? -> bool
  # 無名パイプおよび名前つきパイプ(FIFO)の時に真を返します。
  # 
  # //emlist[][ruby]{
  # system("mkfifo /tmp/pipetest")
  # p File::Stat.new("/tmp/pipetest").pipe? #=> true
  # //}
  def pipe?; end

  # --- rdev -> Integer
  # デバイスタイプ(スペシャルファイルのみ)を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.rdev     #=> 2
  # //}
  def rdev; end

  # --- rdev_major -> Integer
  # rdev の major 番号部を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.rdev_major #=> nil
  # //}
  def rdev_major; end

  # --- rdev_minor -> Integer
  # rdev の minor 番号部を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.rdev_minor #=> nil
  # //}
  def rdev_minor; end

  # --- readable? -> bool
  # 読み込み可能な時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).readable? #=> true
  # //}
  def readable?; end

  # --- readable_real? -> bool
  # 実ユーザ/実グループによって読み込み可能な時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).readable_real? #=> true
  # //}
  def readable_real?; end

  # --- setgid? -> bool
  # setgidされている時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/usr/sbin/*") {|bd|
  #   if File::Stat.new(bd).setgid?
  #     puts bd
  #   end
  # }
  # #例
  # #...
  # #=> /usr/sbin/postqueue
  # #...
  # //}
  def setgid?; end

  # --- setuid? -> bool
  # setuidされている時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/bin/*") {|bd|
  #   if File::Stat.new(bd).setuid?
  #     puts bd
  #   end
  # }
  # #例
  # #...
  # #=> /bin/ping
  # #=> /bin/su
  # #...
  # //}
  def setuid?; end

  # --- size -> Integer
  # ファイルサイズ(バイト単位)を返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.size    #=> 1548
  # //}
  def size; end

  # --- size? -> Integer | nil
  # サイズが0の時にはnil、それ以外の場合はファイルサイズを返します。
  # 
  # //emlist[][ruby]{
  # require 'tempfile'
  # 
  # fp = Tempfile.new("temp")
  # p fp.size #=> 0
  # p File::Stat.new(fp.path).size? #=> nil
  # fp.print "not 0 "
  # fp.close
  # p FileTest.exist?(fp.path) #=> true
  # p File::Stat.new(fp.path).size? #=> 6
  # //}
  def size?; end

  # --- socket? -> bool
  # ソケットの時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/tmp/*"){|file|
  #   if File::Stat.new(file).socket?
  #     printf "%s\n", file
  #   end
  # }
  # #例
  # #=> /tmp/uimhelper-hogehoge
  # #...
  # //}
  def socket?; end

  # --- sticky? -> bool
  # stickyビットが立っている時に真を返します。
  # 
  # //emlist[][ruby]{
  # Dir.glob("/usr/bin/*") {|bd|
  #   begin
  #     if File::Stat.new(bd).sticky?
  #       puts bd
  #     end
  #   rescue
  #   end
  # }
  # #例
  # #...
  # #=> /usr/bin/emacs-21.4
  # #...
  # //}
  def sticky?; end

  # --- symlink? -> false
  # シンボリックリンクである時に真を返します。
  # ただし、File::Statは自動的にシンボリックリンクをたどっていくので
  # 常にfalseを返します。
  # 
  # //emlist[][ruby]{
  # require 'fileutils'
  # outfile = $0 + ".ln"
  # FileUtils.ln_s($0, outfile)
  # p File::Stat.new(outfile).symlink? #=> false
  # p File.lstat(outfile).symlink?     #=> true
  # p FileTest.symlink?(outfile)       #=> true
  # //}
  # 
  # @see [[m:File.lstat]]
  def symlink?; end

  # --- uid -> Integer
  # オーナーのユーザIDを返します。
  # 
  # //emlist[][ruby]{
  # fs = File::Stat.new($0)
  # #例
  # p fs.uid    #=> 0
  # //}
  def uid; end

  # --- world_readable? -> Integer | nil
  # 
  # 全てのユーザから読めるならば、そのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # //emlist[][ruby]{
  # m = File.stat("/etc/passwd").world_readable?  # => 420
  # sprintf("%o", m)                              # => "644"
  # //}
  def world_readable?; end

  # --- world_writable? -> Integer | nil
  # 
  # 全てのユーザから書き込めるならば、そのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # //emlist[][ruby]{
  # m = File.stat("/tmp").world_writable?         # => 511
  # sprintf("%o", m)                              # => "777"
  # //}
  def world_writable?; end

  # --- writable? -> bool
  # 書き込み可能な時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).writable? #=> true
  # //}
  def writable?; end

  # --- writable_real? -> bool
  # 実ユーザ/実グループによって書き込み可能な時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).writable_real? #=> true
  # //}
  def writable_real?; end

  # --- zero? -> bool
  # サイズが0である時に真を返します。
  # 
  # //emlist[][ruby]{
  # p File::Stat.new($0).zero? #=> false
  # //}
  def zero?; end

  # --- new(path)    -> File::Stat
  # 
  # path に関する File::Stat オブジェクトを生成して返します。
  # [[m:File.stat]] と同じです。
  # 
  # @param path ファイルのパスを指定します。
  # 
  # @raise Errno::ENOENT pathに該当するファイルが存在しない場合発生します。
  # 
  # //emlist[][ruby]{
  # p $:[0]
  # #=> 例
  # # "C:/Program Files/ruby-1.8/lib/ruby/site_ruby/1.8"
  # p File::Stat.new($:[0])
  # #=> 例
  # #<File::Stat dev=0x2, ino=0, mode=040755, nlink=1, uid=0, gid=0, rdev=0x2, size=0, blksize=nil, blocks=nil, atime=Sun Sep 02 14:15:20 +0900 2007, mtime=Tue Apr 24 23:03:44 +0900 2007, ctime=Tue Apr 24 23:03:37 +0900 2007>
  # //}
  def new; end

end
