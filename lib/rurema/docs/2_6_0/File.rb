class File
  # --- atime    -> Time
  # 
  # 最終アクセス時刻を Time オブジェクトとして返します。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("testfile", "test")
  # File.open("testfile") { |f| f.atime } # => 2017-12-21 22:58:17 +0900
  # //}
  # 
  # @see [[m:File#lstat]], [[m:File#ctime]], [[m:File#mtime]], [[m:File#birthtime]]
  def atime; end

  # --- birthtime -> Time
  # 
  # 作成された時刻を Time オブジェクトとして返します。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # @raise NotImplementedError  Windows のような birthtime のない環境で発生します。
  # 
  #   File.new("testfile").birthtime   #=> Wed Apr 09 08:53:14 CDT 2003
  # 
  # @see [[m:File#lstat]], [[m:File#atime]], [[m:File#ctime]], [[m:File#mtime]]
  def birthtime; end

  # --- chmod(mode)    -> 0
  # 
  # ファイルのモードを指定された mode に変更します。
  # 
  # モードの変更に成功した場合は 0 を返します。失敗した場合は例外 [[c:Errno::EXXX]] が発生し
  # ます。
  # 
  # @param mode [[man:chmod(2)]] と同様に整数で指定します。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # f = File.new("out", "w");
  # f.chmod(0644)   #=> 0
  # //}
  def chmod; end

  # --- chown(owner, group)    -> 0
  # 
  # ファイルのオーナーとグループを変更します。
  # 
  # 適切な権限があればファイルのオーナーとグループを変更できます。
  # 所有者の変更に成功した場合は 0 を返します。変更に失敗した場合は
  # 例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @param owner [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、オーナーを現在のままにすることができます。
  # 
  # @param group [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、グループを現在のままにすることができます。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX 変更に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.open("testfile") { |f| f.chown(502, 1000) }  # => 0
  # File.stat("testfile").uid                         # => 502
  # File.stat("testfile").gid                         # => 1000
  # //}
  # 
  # @see [[m:File.chown]]
  def chown; end

  # --- ctime    -> Time
  # 
  # 状態が最後に変更された時刻を Time オブジェクトとして返します。状態の変更とは chmod などによるものです。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("testfile", "test")
  # File.open("testfile") { |f| f.ctime } # => 2017-12-21 22:58:17 +0900
  # //}
  # 
  # @see [[m:File#lstat]], [[m:File#atime]], [[m:File#mtime]], [[m:File#birthtime]]
  def ctime; end

  # --- flock(operation)    -> 0 | false
  # 
  # ファイルをロックします。
  # 
  # ロックを取得するまでブロックされます。
  # ロックの取得に成功した場合は 0 を返します。
  # File::LOCK_NB (ノンブロッキング) を指定すると、本来ならブロックされる場合に
  # ブロックされずに false を返すようになります。
  # 
  # @param operation ロックに対する操作の種類を示す定数を指定します。
  #                  どのような定数が利用可能かは以下を参照して下さい。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX operation に不正な整数を与えた場合などに発生します。
  # 
  # 引数 operation に有効な定数は以下の通りです。定数は [[c:File::Constants]] で定義されていますが、
  # [[c:File]] クラスの親クラスの IO が [[c:File::Constants]] をインクルードしているので、
  # これらの定数は File::LOCK_SH などとして参照可能です。
  # 
  # : LOCK_SH
  #  共有ロック。複数のプロセスが同時にロックを共有できます。
  #  システムによってはロック対象のファイルは読み込みモード
  #  ("r", "r+" など)でオープンされている必要があります。そのよ
  #  うなシステムでは読み込み可能でないファイルに対するロックは例外
  #  [[c:Errno::EXXX]] が発生するかもしれません。
  # : LOCK_EX
  #  排他ロック。同時にはただひとつのプロセスだけがロックを保持できます。
  #  システムによってはロック対象のファイルは書き込みモード
  #  ("w", "r+" など)でオープンされている必要があります。そのよ
  #  うなシステムでは書き込み可能でないファイルに対するロックは例外
  #  [[c:Errno::EXXX]] が発生するかもしれません。
  # : LOCK_UN
  #  アンロック。
  #  この明示的なアンロック以外に、ファイルのcloseやRubyインタプリタの終了
  #  (プロセスの終了)によっても自動的にロック状態は解除されます。
  # : LOCK_NB
  #  ノンブロックモード。
  #  File::LOCK_SH | File::LOCK_NB のように他の指定と or することで指
  #  定します。この指定がない場合、ブロックされる条件での flock
  #  の呼び出しはロックが解除されるまでブロックされます。
  # 
  # File::LOCK_NB の指定がある場合、ブロックされる条件での
  # flock は false を返します。
  # 
  # 「ブロックされる条件」とは以下のいずれかです。
  #   * 他のプロセスが排他ロックをすでに行っている場合にロックを行う
  #   * 他のプロセスがロックしている状態で排他ロックを行う
  # 
  # //emlist[例1:][ruby]{
  # # 書き込みロック(write lock)を使用してカウンタを更新。
  # # ロック前にファイルを切り詰めてしまうので、
  # # モードに"w"を使ってはいけません。
  # File.open("counter", File::RDWR|File::CREAT, 0644) {|f|
  #   f.flock(File::LOCK_EX)
  #   value = f.read.to_i + 1
  #   f.rewind
  #   f.write("#{value}\n")
  #   f.flush
  #   f.truncate(f.pos)
  # }
  # 
  # # 読み込みロック(read lock)を使用してカウンタを読み込み。
  # File.open("counter", "r") {|f|
  #   f.flock(File::LOCK_SH)
  #   p f.read
  # }
  # //}
  # 
  # //emlist[例2:][ruby]{
  # f = File.open("/tmp/foo", "w")
  # 
  # f.flock(File::LOCK_EX)
  # puts "locked by process1"
  # 
  # fork {
  #   f = File.open("/tmp/foo", "r")
  #   f.flock(File::LOCK_SH)
  #   puts "locked by process2"
  #   sleep 5
  #   puts "unlocked by process2"
  # }
  # 
  # sleep 5
  # 
  # f.flock(File::LOCK_UN)
  # puts "unlocked by process1"
  # sleep 1 # <- 子プロセスが確実に先にロックするための sleep
  # f.flock(File::LOCK_EX)
  # puts "re-locked by process1"
  # 
  # # => locked by process1
  # #    unlocked by process1
  # #    locked by process2
  # #    unlocked by process2
  # #    re-locked by process1
  # //}
  def flock; end

  # --- lstat    -> File::Stat
  # 
  # ファイルの状態を含む [[c:File::Stat]] オブジェクトを生成して返します。
  # シンボリックリンクに関してリンクそのものの情報を返します。
  # [[man:lstat(2)]] を実装していないシステムでは、[[m:IO#stat]]と同じです。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # # testlink は testfile のシンボリックリンク
  # File.open("testlink") do |f|
  #     p f.lstat == File.stat("testfile")  # => false
  #     p f.stat == File.stat("testfile")   # => true
  # end
  # //}
  # 
  # @see [[m:IO#stat]], [[m:File.stat]], [[m:File.lstat]]
  def lstat; end

  # --- mtime    -> Time
  # 
  # 最終更新時刻を Time オブジェクトとして返します。
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("testfile", "test")
  # File.open("testfile") { |f| f.mtime } # => 2017-12-21 22:58:17 +0900
  # //}
  # 
  # @see [[m:File#lstat]], [[m:File#atime]], [[m:File#ctime]], [[m:File#birthtime]]
  def mtime; end

  # --- path    -> String
  # --- to_path -> String
  # 
  # オープン時に使用したパスを文字列で返します。
  # 
  # パスは self に対応するファイルを指しているとは限りません。
  # たとえば、ファイルが移動されていたり、削除されていたりする場合です。
  # 
  # @raise IOError TMPFILE [[m:File::Constants::TMPFILE]]オプション付きで作成されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.open("testfile") {|f| f.path }                        #=> "testfile"
  # File.open("/tmp/../tmp/xxx", "w") {|f| f.path }            #=> "/tmp/../tmp/xxx"
  # File.open("/tmp", File::RDWR | File::TMPFILE){|f| f.path } # IOError: File is unnamed (TMPFILE?)
  # //}
  def path; end

  # --- size     -> Integer
  # 
  # ファイルのサイズを返します。
  # 
  # //emlist[例][ruby]{
  # File.open("/dev/null") do |f|
  #   f.size   #=> 0
  # end
  # //}
  # 
  # @raise IOError 自身が close されている場合に発生します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # @see [[m:File#lstat]]
  def size; end

  # --- truncate(length)    -> 0
  # 
  # ファイルのサイズを最大 length バイトにします。
  # 
  # サイズの変更に成功すれば 0 を返します。失敗した場合は例外
  # [[c:Errno::EXXX]] が発生します。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX サイズの変更に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "1234567890")
  # File.open("testfile", "a") do |f|
  #   f.truncate(5) # => 0
  #   f.size        # => 5
  # end
  # //}
  def truncate; end

  # --- absolute_path(file_name, dir_string=nil) -> String
  # 
  # file_name を絶対パスに変換した文字列を返します。
  # 
  # 相対パスの場合はカレントディレクトリを基準とします。
  # dir_string を渡した場合はそのディレクトリを基準とします。
  # 
  # [[m:File.expand_path]] と異なり、 file_name 先頭が "~" である場合
  # それは展開されません。普通のディレクトリ名として処理されます。
  # 
  # //emlist[例][ruby]{
  # p Dir.getwd                      #=> "/home/matz/work/bar"
  # p ENV["HOME"]                    #=> "/home/matz"
  # p File.absolute_path("..")         #=> "/home/matz/work"
  # p File.absolute_path("..", "/tmp") #=> "/"
  # p File.absolute_path("~")          #=> "/home/matz/work/bar/~"
  # p File.absolute_path("~foo")       #=> "/home/matz/work/bar/~foo"
  # //}
  # 
  # @see [[m:File.expand_path]]
  def absolute_path; end

  # --- atime(filename)    -> Time
  # 
  # 最終アクセス時刻を返します。
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.atime(__FILE__) # => 2017-11-28 22:38:44 +0900
  # //}
  def atime; end

  # --- basename(filename, suffix = "")     -> String
  # 
  # filename の一番後ろのスラッシュに続く要素を返します。もし、
  # 引数 suffix が与えられて、かつそれが filename の末尾に
  # 一致するなら、それを取り除いたものを返します。
  # 
  # //emlist[例][ruby]{
  # p File.basename("ruby/ruby.c")          #=> "ruby.c"
  # p File.basename("ruby/ruby.c", ".c")    #=> "ruby"
  # p File.basename("ruby/ruby.c", ".*")    #=> "ruby"
  # p File.basename("ruby/ruby.exe", ".*")  #=> "ruby"
  # p File.basename("ruby/y.tab.c", ".*")   #=> "y.tab"
  # //}
  # 
  # File.basename の動作は [[man:basename(3)]] 
  # に従います。
  # //emlist[例][ruby]{
  # p File.basename("foo/bar/")      # => "bar"
  # //}
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param suffix サフィックスを文字列で与えます。'.*' という文字列を与えた場合、'*' はワイルドカードとして働き
  #               '.' を含まない任意の文字列にマッチします。
  # 
  # @see [[m:File.dirname]], [[m:File.extname]]
  def basename; end

  # --- birthtime(filename) -> Time
  # 
  # 作成された時刻を返します。
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # @raise NotImplementedError  Windows のような birthtime のない環境で発生します。
  # 
  # //emlist[例][ruby]{
  # File.birthtime("testfile")   #=> Wed Apr 09 08:53:13 CDT 2003
  # //}
  def birthtime; end

  # --- blockdev?(path)    -> bool
  # 
  # [[m:FileTest.#blockdev?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  # 
  # 
  # @see [[m:FileTest.#blockdev?]]
  def blockdev?; end

  # --- chardev?(path)    -> bool
  # 
  # [[m:FileTest.#chardev?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def chardev?; end

  # --- chmod(mode, *filename)    -> Integer
  # 
  # ファイルのモードを mode に変更します。モードを変更したファイ
  # ルの数を返します。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param mode [[man:chmod(2)]] と同様に整数で指定します。
  # 
  # @raise Errno::EXXX モードの変更に失敗した場合に発生します。
  def chmod; end

  # --- chown(owner, group, *filename)    -> Integer
  # 
  # ファイルのオーナーとグループを変更します。スーパーユーザだけがファ
  # イルのオーナーとグループを変更できます。変更を行ったファイルの数を
  # 返します。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param owner [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、オーナーを現在のままにすることができます。
  # 
  # @param group [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、グループを現在のままにすることができます。
  # 
  # @raise Errno::EXXX 変更に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("test.txt", "test")
  # File.chown(502, 12, "test.txt")
  # File.stat("test.txt").uid # => 502
  # //}
  # 
  # @see [[m:File#chown]]
  def chown; end

  # --- ctime(filename)    -> Time
  # 
  # 状態が最後に変更された時刻を返します。
  # 状態の変更とは chmod などによるものです。
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("testfile", "test")
  # File.ctime("testfile") # => 2017-11-30 22:40:49 +0900
  # File.chmod(0755, "testfile")
  # File.ctime("testfile") # => 2017-11-30 22:42:12 +0900
  # //}
  def ctime; end

  # --- delete(*filename)    -> Integer
  # --- unlink(*filename)    -> Integer
  # 
  # ファイルを削除します。削除したファイルの数を返します。
  # 削除に失敗した場合は例外 [[c:Errno::EXXX]] が発生します。
  # 
  # このメソッドは通常ファイルの削除用で、ディレクトリの削除には
  # [[m:Dir.rmdir]] を使います。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("test.txt", "test")
  # p File.exist?("test.txt")  # => true
  # p File.delete("test.txt")   # => 1
  # p File.exist?("test.txt")  # => false
  # begin
  #   File.delete("test.txt")
  # rescue
  #   p $!  # => #<Errno::ENOENT: No such file or directory @ unlink_internal - test.txt>
  # end
  # //}
  def delete; end

  # --- directory?(path)    -> bool
  # 
  # [[m:FileTest.#directory?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def directory?; end

  # --- dirname(filename)    -> String
  # 
  # filename の一番後ろのスラッシュより前を文
  # 字列として返します。スラッシュを含まないファイル名に対しては
  # "."(カレントディレクトリ)を返します。
  # 
  # //emlist[例][ruby]{
  # p File.dirname("dir/file.ext")    # => "dir"
  # p File.dirname("file.ext")        # => "."
  # //}
  # 
  # File.dirname の動作は [[man:dirname(3)]]
  # に従います。
  # //emlist[例][ruby]{
  # p File.dirname("foo/bar/")      # => "foo"
  # p File.dirname("foo//bar")      # => "foo"
  # //}
  # 
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.basename]], [[m:File.extname]]
  def dirname; end

  # --- zero?(path)    -> bool
  # --- empty?(path)   -> bool
  # 
  # [[m:FileTest.#zero?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def empty?; end

  # --- executable?(path)    -> bool
  # 
  # [[m:FileTest.#executable?]] と同じです。
  # 
  # @param path パスを表す文字列を指定します。
  def executable?; end

  # --- executable_real?(path)    -> bool
  # 
  # [[m:FileTest.#executable_real?]] と同じです。
  # 
  # @param path パスを表す文字列を指定します。
  def executable_real?; end

  # --- exist?(path)    -> bool
  # 
  # [[m:FileTest.#exist?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def exist?; end

  # --- exists?(path)    -> bool
  # 
  # このメソッドは Ruby 2.1 から deprecated です。[[m:File.exist?]] を使用してください。
  def exists?; end

  # --- expand_path(path, default_dir = '.')    -> String
  # 
  # path を絶対パスに展開した文字列を返します。
  # path が相対パスであれば default_dir を基準にします。
  # 
  # 先頭の ~ はホームディレクトリ(環境変数 HOME が使われます)に、
  # ~USER はそのユーザのホームディレクトリに展開されます。
  # 
  # //emlist[例][ruby]{
  # p Dir.getwd                      #=> "/home/matz/work/foo"
  # p ENV["HOME"]                    #=> "/home/matz"
  # p File.expand_path("..")         #=> "/home/matz/work"
  # p File.expand_path("..", "/tmp") #=> "/"
  # p File.expand_path("~")          #=> "/home/matz"
  # p File.expand_path("~foo")       #=> "/home/foo"
  # //}
  # 
  # @param path パスを表す文字列を指定します。
  # 
  # @param default_dir path が相対パスであれば default_dir を基準に展開されます。
  def expand_path; end

  # --- extname(filename)    -> String
  # 
  # ファイル名 filename の拡張子部分(最後の "." に続く文字列)を
  # 返します。ディレクトリ名に含まれる "." や、ファイル名先頭の "."
  # は拡張子の一部としては見なされません。filename に拡張子が含
  # まれない場合は空文字列を返します。
  # 
  # //emlist[例][ruby]{
  # p File.extname("foo/foo.txt")     # => ".txt"
  # p File.extname("foo/foo.tar.gz")  # => ".gz"
  # p File.extname("foo/bar")         # => ""
  # p File.extname("foo/.bar")        # => ""
  # p File.extname("foo.txt/bar")     # => ""
  # p File.extname(".foo")            # => ""
  # //}
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.basename]], [[m:File.dirname]]
  def extname; end

  # --- file?(path)    -> bool
  # 
  # [[m:FileTest.#file?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def file?; end

  # --- fnmatch(pattern, path, flags = 0)     -> bool
  # --- fnmatch?(pattern, path, flags = 0)    -> bool
  # 
  # ファイル名のパターンマッチ [[man:fnmatch(3)]] を行います。
  # path が pattern にマッチすれば真を返します。そうでない場合には false を返します。
  # 
  # @param pattern パターンを文字列で指定します。ワイルドカードとして `*',
  #                `?', `[]', `{}' が使用できます。
  #                [[m:Dir.glob]] とは違って `**/' は使用できません。
  # //emlist[例][ruby]{
  # %w(foo foobar bar).each {|f|
  #   p File.fnmatch("foo*", f)
  # }
  # # => true
  # #    true
  # #    false
  # //}
  # 
  # @param path パスを表す文字列を指定します。
  # 
  # @param flags パターンマッチの動作を以下で述べる定数の論理和で指定します。
  #              flags のデフォルト値は0(フラグ指定なし)です。
  # 
  # 引数 flags に指定できる定数は以下のとおりです。
  # これらの定数は [[c:File::Constants]] で定義されていますが、
  # [[c:File]] クラスの親クラスの IO が [[c:File::Constants]] をインクルードしているので、
  # これらの定数は File::FNM_NOESCAPE などとして参照可能です。
  # 
  # : FNM_NOESCAPE
  #  エスケープ文字 `\' を普通の文字とみなします。
  # 
  #  デフォルトでは \ を伴う任意の文字はその文字にマッチしますが、
  #  このフラグをつけると、\ が普通の文字として扱われます。
  # //emlist[][ruby]{
  # p File.fnmatch('\a', 'a')                       # => true
  # p File.fnmatch('\a', '\a', File::FNM_NOESCAPE)  # => true
  # //}
  #  前者で * は、エスケープされているので "*" そのものにマッチ
  #  します。
  # //emlist[][ruby]{
  # p File.fnmatch('\*', 'a')                       # => false
  # p File.fnmatch('\*', '\a', File::FNM_NOESCAPE)  # => true
  # //}
  #   単体の \ は、このフラグの有無に関わらず \ にマッチします。
  #   (シングルクォート文字列中では \\ は、\ であることに注意)
  # //emlist[][ruby]{
  # p File.fnmatch('\\', '\\')                      # => true
  # p File.fnmatch('\\', '\\', File::FNM_NOESCAPE)  # => true
  # //}
  # 
  # : FNM_PATHNAME
  #  ワイルドカード `*', `?', `[]' が `/' にマッチしなくなります。
  #  シェルのパターンマッチにはこのフラグが使用されています。
  # //emlist[][ruby]{
  # p File.fnmatch('*', '/', File::FNM_PATHNAME)   # => false
  # p File.fnmatch('?', '/', File::FNM_PATHNAME)   # => false
  # p File.fnmatch('[/]', '/', File::FNM_PATHNAME) # => false
  # //}
  # 
  # : FNM_CASEFOLD
  #  アルファベットの大小文字を区別せずにパターンマッチを行います。
  # //emlist[][ruby]{
  # p File.fnmatch('A', 'a', File::FNM_CASEFOLD)   # => true
  # //}
  # 
  # : FNM_DOTMATCH
  #  ワイルドカード `*', `?', `[]' が先頭の `.' にマッチするようになります。
  # //emlist[][ruby]{
  # p File.fnmatch('*', '.', File::FNM_DOTMATCH)           # => true
  # p File.fnmatch('?', '.', File::FNM_DOTMATCH)           # => true
  # p File.fnmatch('[.]', '.', File::FNM_DOTMATCH)         # => true
  # p File.fnmatch('foo/*', 'foo/.', File::FNM_DOTMATCH)   # => true
  # //}
  # 
  # : FNM_EXTGLOB
  #  {} 内のコンマで区切られた文字列の組合せにマッチするようになります。
  #  例えば、foo{a,b,c} は fooa, foob, fooc に展開されそれぞれに対してマッ
  #  チ判定を行います。
  # 
  #  括弧は入れ子にすることができます。例えば、 {foo,bar{foo,bar}} は foo,
  #  barfoo, barbar のそれぞれにマッチします。
  # //emlist[][ruby]{
  # p File.fnmatch('foo{a,b,c}', 'fooa', File::FNM_EXTGLOB)           # => true
  # p File.fnmatch('{foo,bar{foo,bar}}', 'barfoo', File::FNM_EXTGLOB) # => true
  # //}
  def fnmatch; end

  # --- ftype(filename)    -> String
  # 
  # ファイルのタイプを表す文字列を返します。
  # 
  # 文字列は以下のうちのいずれかです。File.lstat(filename).ftype と同じです。
  # シンボリックリンクに対して "link" を返します。
  # 
  #  * "file"
  #  * "directory"
  #  * "characterSpecial"
  #  * "blockSpecial"
  #  * "fifo"
  #  * "link"
  #  * "socket"
  #  * "unknown"
  # 
  # @param filename ファイル名を表す文字列を指定します。 
  # 
  # @raise Errno::EXXX 情報の取得に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.ftype("testfile")            # => "file"
  # File.ftype("/dev/tty")            # => "characterSpecial"
  # File.ftype("/tmp/.X11-unix/X0")   # => "socket"
  # //}
  def ftype; end

  # --- grpowned?(path)    -> bool
  # 
  # [[m:FileTest.#grpowned?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def grpowned?; end

  # --- identical?(filename1, filename2)    -> bool
  # 
  # [[m:FileTest.#identical?]] と同じです。
  # 
  # @param filename1 パスを表す文字列か IO オブジェクトを指定します。
  # 
  # @param filename2 パスを表す文字列か IO オブジェクトを指定します。
  def identical?; end

  # --- join(*item)    -> String
  # 
  # [[m:File::SEPARATOR]]を間に入れて文字列を連結します。[[d:platform/DOSISH-support]]で環境依存になる予定です。
  # 
  # @param item 連結したいディレクトリ名やファイル名を文字列（もしくは文字列を要素に持つ配列）で与えます。
  #             文字列AとBを連結する際に、Aの末尾の文字とBの先頭の文字が[[m:File::SEPARATOR]]であった場合には、
  #             まずこれらを削除した上で改めて[[m:File::SEPARATOR]]を間に入れて連結します。
  #             引数の中に配列がある場合は配列要素を再帰的に展開します。空の配列は空文字列に変換されます。
  #             配列・文字列以外のオブジェクトを指定した場合は、まず to_str メソッド、次に to_path メソッドにより暗黙の型変換を試みます。
  #             引数がない場合には空文字列を生成して返します。
  # 
  # @raise TypeError    引数の中に文字列以外の（暗黙の型変換が行えない）オブジェクトが存在した場合に発生します。
  # 
  # @raise ArgumentError    引数の中に、配列要素が自身を含むような無限にネストした配列や、
  #                         ヌル文字を含む文字列が存在した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.join("a","b")                        # => "a/b"
  # File.join("a/","b")                       # => "a/b"
  # File.join("a/","/b")                      # => "a/b"
  # File.join("a","/b")                       # => "a/b"
  # File.join("a", ["b", ["c", ["d"]]])       # => "a/b/c/d"
  # File.join("", "a", ["b", ["c", ["d"]]])   # => "/a/b/c/d"
  # File.join([])                             # => ""
  # File.join                                 # => ""
  # //}
  def join; end

  # --- lchmod(mode, *filename)    -> Integer
  # 
  # [[m:File.chmod]] と同様ですが、シンボリックリンクに関してリンクそのものの
  # モードを変更します。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param mode [[man:chmod(2)]] と同様に整数で指定します。
  # 
  # @raise NotImplementedError [[man:lchmod(2)]] を実装していないシステムでこのメソッドを呼び出すと発生します。
  # 
  # @raise Errno::EXXX モードの変更に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # File.symlink("testfile", "testlink")
  # File.lstat("testlink").ftype            # => "link"
  # File.lchmod(0744, "testlink")
  # File.stat("testlink").mode.to_s(8)      # => "100644"
  # File.lstat("testlink").mode.to_s(8)     # => "120744"
  # //}
  def lchmod; end

  # --- lchown(owner, group, *filename)    -> Integer
  # 
  # [[m:File#chown]] と同様ですが、
  # シンボリックリンクに関してリンクそのもののオーナー、
  # グループを変更します。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param owner [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、オーナーを現在のままにすることができます。
  # 
  # @param group [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、グループを現在のままにすることができます。
  # 
  # @raise NotImplementedError [[man:lchown(2)]] を実装していないシステムでこのメソッドを呼び出すと発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # File.symlink("testfile", "testlink")
  # File.chown(501, -1, "testfile")
  # File.lstat("testlink").ftype    # => "link"
  # File.lchown(0, -1, "testlink")
  # File.stat("testlink").uid       # => 501
  # File.lstat("testlink").uid      # => 0
  # //}
  def lchown; end

  # --- link(old, new)    -> 0
  # 
  # old を指す new という名前のハードリンクを
  # 生成します。old はすでに存在している必要があります。
  # ハードリンクに成功した場合は 0 を返します。
  # 
  # 失敗した場合は例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @param old ファイル名を表す文字列を指定します。 
  # 
  # @param new ファイル名を表す文字列を指定します。 
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # File.link("testfile", "testlink")   # => 0
  # IO.read("testlink")                 # => "test"
  # //}
  def link; end

  # --- lstat(filename)   -> File::Stat
  # 
  # [[m:File.stat]]と同様ですが、シンボリックリンクに関してリンクそのものの
  # 情報を File::Stat として返します。[[man:lstat(2)]] を実装していないシステムでは、File.stat と同じです。
  # 
  # @param filename ファイル名を表す文字列を指定します。 
  # 
  # @raise Errno::EXXX 情報の取得に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # # link.rb は t.rb のシンボリックリンク
  # File.lstat("link.rb") == File.stat("t.rb") # => false
  # File.stat("link.rb")  == File.stat("t.rb") # => true
  # //}
  # 
  # @see [[m:IO#stat]], [[m:File#lstat]]
  def lstat; end

  # --- lutime(atime, mtime, *filename)    -> Integer
  # 
  # ファイルの最終アクセス時刻と更新時刻を変更します。
  # シンボリックリンクに対しては [[m:File.utime]]　と違って、
  # シンボリックそのものを変更します。
  # 
  # @param atime 最終アクセス時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param mtime 更新時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param filename ファイル名を表す文字列を指定します。複数指定できます。
  # 
  # @return 変更したファイルの数を返します。
  # 
  # @raise Errno::EXXX 変更に失敗した場合に発生します。
  # 
  # @see [[m:File.utime]]
  def lutime; end

  # --- mkfifo(file_name, mode = 0666) -> 0
  # 
  # 引数 file_name で指定した名前の FIFO スペシャルファイルを作成します。
  # 
  # @param file_name ファイル名を指定します。
  # 
  # @param mode FIFO の許可モードを数値で指定します。指定したモードは通常の
  #             ファイル作成と同様にプロセスの umask によって変更されます。
  #             作成されたファイルの許可モードは (mode & ~umask) になります。
  # 
  # //emlist[例][ruby]{
  # File.mkfifo("testfile", 0666)
  # File.ftype("testfile")          # => "fifo"
  # //}
  def mkfifo; end

  # --- mtime(filename)    -> Time
  # 
  # 最終更新時刻を返します。
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise Errno::EXXX ファイルの時刻の取得に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.mtime(__FILE__) # => 2017-12-03 03:16:22 +0900
  # //}
  def mtime; end

  # --- new(path, mode = "r", perm = 0666)                -> File 
  # --- open(path, mode = "r", perm = 0666)               -> File 
  # --- open(path, mode = "r", perm = 0666) {|file| ... } -> object
  # 
  # path で指定されるファイルをオープンし、[[c:File]] オブジェクトを生成して
  # 返します。
  # 
  # path が整数の場合はファイルディスクリプタとして扱い、それに対応する
  # [[c:File]] オブジェクトを生成して返します。[[m:IO.open]] と同じです。
  # ブロックを指定して呼び出した場合は、File オブジェクトを引数として
  # ブロックを実行します。ブロックの実行が終了すると、ファイルは自動的に
  # クローズされます。ブロックの実行結果を返します。
  # 
  # @param path ファイルを文字列で指定します。整数を指定した場合はファイルディスクリプタとして扱います。
  # 
  # @param mode モードを文字列か定数の論理和で指定します。[[m:Kernel.#open]] と同じです。
  # 
  # @param perm ファイルを生成する場合のファイルのパーミッションを整数で指定します。[[m:Kernel.#open]] と同じです。
  # 
  # @raise Errno::EXXX ファイルのオープンに失敗した場合に発生します。
  # 
  # //emlist[例: File.new による読み込みモードでのファイルオープン][ruby]{
  # f = File.new("testfile", "r")
  # f.class # => File
  # f.close
  # //}
  # 
  # //emlist[例: File.open による読み込みモードでのファイルオープン][ruby]{
  # f = File.open("testfile", "r")
  # f.class # => File
  # f.close
  # //}
  # 
  # //emlist[例: File.open による書き込みモードでのファイルオープン][ruby]{
  # File.open("testfile", "w", 0755) { |f| f.print "test" }
  # File.read("testfile")  # => "test"
  # //}
  def new; end

  # --- owned?(path)    -> bool
  # 
  # [[m:FileTest.#owned?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def owned?; end

  # --- path(filename)    -> String
  # 
  # 指定されたファイル名を文字列で返します。filename が文字列でない場合は、to_path メソッドを呼びます。
  # 
  # @param filename ファイル名を表す文字列か to_path メソッドが定義されたオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # class MyPath
  #   def initialize(path)
  #     @path = path
  #   end
  #   def to_path
  #     File.absolute_path(@path)
  #   end
  # end
  # 
  # File.path("/dev/null")          # => "/dev/null"
  # File.path(Pathname("/tmp"))     # => "/tmp"
  # File.path(MyPath.new("."))      # => "/Users/user/projects/txt"
  # //}
  def path; end

  # --- pipe?(path)    -> bool
  # 
  # [[m:FileTest.#pipe?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def pipe?; end

  # --- readable?(path)    -> bool
  # 
  # [[m:FileTest.#readable?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def readable?; end

  # --- readable_real?(path)    -> bool
  # 
  # [[m:FileTest.#readable_real?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def readable_real?; end

  # --- readlink(path)    -> String
  # 
  # シンボリックリンクのリンク先のパスを文字列で返します。
  # 
  # @param path シンボリックリンクを表す文字列を指定します。
  # 
  # @raise Errno::EXXX 指定された path がシンボリックリンクでない場合や、リンクの読み取りに失敗した場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("testfile", "test")
  # File.symlink("testfile", "testlink")   # => 0
  # File.readlink("testlink")              # => "testfile"
  # //}
  def readlink; end

  # --- realdirpath(pathname, basedir = nil) -> String
  # 
  # 与えられた pathname に対応する絶対パスを返します。
  # 
  # pathname の最後のコンポーネントは存在していなくても例外は発生しません。
  # 
  # @param pathname ファイル名を指定します。
  # 
  # @param basedir ベースディレクトリを指定します。省略するとカレントディレクトリを使用します。
  # 
  # @raise Errno::ENOENT ファイルが存在しない場合に発生します。
  def realdirpath; end

  # --- realpath(pathname, basedir = nil) -> String
  # 
  # 与えられた pathname に対応する絶対パスを返します。
  # 
  # pathname の全てのコンポーネントは存在しなければなりません。
  # 
  # @param pathname ファイル名を指定します。
  # 
  # @param basedir ベースディレクトリを指定します。省略するとカレントディレクトリを使用します。
  # 
  # @raise Errno::ENOENT ファイルが存在しない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # ENV["HOME"]                     # => "/home/matz"
  # File.symlink("testfile", "testlink")
  # File.realpath("testfile")       # => "/home/matz/testfile"
  # File.realpath("testlink")       # => "/home/matz/testfile"
  # File.realpath("..", "/tmp")     # => "/"
  # //}
  def realpath; end

  # --- rename(from, to)    -> 0
  # 
  # ファイルの名前を変更します。ディレクトリが異なる場合には移動も行い
  # ます。[[man:rename(2)]] を参照してください。移動先のファ
  # イルが存在する時には上書きされます。
  # 
  # ファイルの移動に成功した場合 0 を返します。失敗した場合は例外
  # [[c:Errno::EXXX]] が発生します。
  # 
  # @param from ファイルの名前を文字列で与えます。
  # 
  # @param to 新しいファイル名を文字列で与えます。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # begin
  #   File.rename("testfile", "testfile.bak")   # => 0
  #   File.rename("testfile", "testfile.bak")
  # rescue
  #   # 2回目の rename 時にすでに testfile が存在しないため例外が発生する
  #   $! # => #<Errno::ENOENT: No such file or directory @ rb_file_s_rename - (testfile, testfile.bak)>
  # end
  # //}
  def rename; end

  # --- setgid?(path)    -> bool
  # 
  # [[m:FileTest.#setgid?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def setgid?; end

  # --- setuid?(path)    -> bool
  # 
  # [[m:FileTest.#setuid?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def setuid?; end

  # --- size(path)    -> Integer
  # 
  # [[m:FileTest.#size]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def size; end

  # --- size?(path)    -> Integer | nil
  # 
  # [[m:FileTest.#size?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def size?; end

  # --- socket?(path)    -> bool
  # 
  # [[m:FileTest.#socket?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def socket?; end

  # --- split(pathname)    -> [String]
  # 
  # pathname を dirname とbasename に分割して、2 要
  # 素の配列を返します。
  # 
  # //emlist[][ruby]{
  # [File.dirname(pathname), File.basename(pathname)]
  # //}
  # 
  # と同じです。
  # 
  # @param pathname パス名を表す文字列を指定します。 
  def split; end

  # --- stat(filename)    -> File::Stat
  # 
  # filename の情報を含む [[c:File::Stat]] オブジェクトを生成し
  # て返します。
  # 
  # @param filename ファイル名を表す文字列を指定します。 
  # 
  # @raise Errno::EXXX 情報の取得に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.stat("testfile").class   # => File::Stat
  # File.stat("testfile").mtime   # => 2017-12-10 01:13:56 +0900
  # //}
  # 
  # @see [[m:IO#stat]], [[m:File#lstat]]
  def stat; end

  # --- sticky?(path)    -> bool
  # 
  # [[m:FileTest.#sticky?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def sticky?; end

  # --- symlink(old, new)    -> 0
  # 
  # old への new という名前のシンボリックリンクを生成します。
  # 
  # シンボリックリンクの作成に成功すれば 0 を返します。失敗した場合は
  # 例外 [[c:Errno::EXXX]] が発生します。
  # 
  # @param old ファイル名を表す文字列を指定します。 
  # 
  # @param new シンボリックリンクを表す文字列を指定します。 
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.symlink("testfile", "testlink")   # => 0
  # //}
  def symlink; end

  # --- symlink?(path)    -> bool
  # 
  # [[m:FileTest.#symlink?]] と同じです。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  def symlink?; end

  # --- truncate(path, length)    -> 0
  # 
  # path で指定されたファイルのサイズを最大 length バイト
  # にします。
  # 
  # サイズの変更に成功すれば 0 を返します。失敗した場合は例外
  # [[c:Errno::EXXX]] が発生します。
  # 
  # @param path パスを表す文字列を指定します。
  # 
  # @param length 変更したいサイズを整数で与えます。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "1234567890")
  # File.truncate("testfile", 5)   # => 0
  # File.size("testfile")          # => 5
  # //}
  def truncate; end

  # --- umask           -> Integer
  # 
  # 現在の umask の値を返します。
  # 
  # @see [[man:umask(2)]]
  # 
  # --- umask(umask)    -> Integer
  # 
  # umask を変更します。変更前の umask の値を返します。
  # 
  # @param umask 設定したい umask の値を整数で指定します。
  # 
  # //emlist[例][ruby]{
  # File.umask(0006)   # => 18
  # File.umask         # => 6
  # //}
  # 
  # @see [[man:umask(2)]]
  def umask; end

  # --- utime(atime, mtime, *filename)    -> Integer
  # 
  # ファイルの最終アクセス時刻と更新時刻を変更します。
  # シンボリックリンクに対しては [[m:File.lutime]]　と違って、
  # シンボリックのリンク先を変更します。
  # 
  # @param atime 最終アクセス時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param mtime 更新時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param filename ファイル名を表す文字列を指定します。複数指定できます。
  # 
  # @return 変更したファイルの数を返します。
  # 
  # @raise Errno::EXXX 変更に失敗した場合に発生します。
  # 
  # //emlist[例: Time を指定][ruby]{
  # atime = Time.new(2018, 1, 2, 3, 4, 5)
  # mtime = Time.new(2018, 2, 3, 4, 5, 6)
  # File.utime(atime, mtime, "testfile")  # => 1
  # File.atime("testfile")                # => 2018-01-02 03:04:05 +0900
  # File.mtime("testfile")                # => 2018-02-03 04:05:06 +0900
  # //}
  # 
  # //emlist[例: 経過秒数で指定][ruby]{
  # File.utime(1, 2, "testfile")  # => 1
  # File.atime("testfile")                # => 1970-01-01 09:00:01 +0900
  # File.mtime("testfile")                # => 1970-01-01 09:00:02 +0900
  # //}
  # 
  # @see [[m:File.lutime]]
  def utime; end

  # --- world_readable?(path)    -> Integer | nil
  # 
  # path が全てのユーザから読めるならばそのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # m = File.world_readable?("/etc/passwd")
  # "%o" % m                               # => "644"
  # //}
  def world_readable?; end

  # --- world_writable?(path)    -> bool
  # 
  # path が全てのユーザから書き込めるならば、そのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # @param path パスを表す文字列か IO オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # m = File.world_writable?("/tmp")
  # "%o" % m                               #=> "777"
  # //}
  def world_writable?; end

  # --- writable?(path)    -> bool
  # 
  # [[m:FileTest.#writable?]] と同じです。
  # 
  # @param path パスを表す文字列を指定します。
  def writable?; end

  # --- writable_real?(path)    -> bool
  # 
  # [[m:FileTest.#writable_real?]] と同じです。
  # 
  # @param path パスを表す文字列を指定します。
  def writable_real?; end

  # --- ALT_SEPARATOR -> "\\" | nil
  # 
  # システムのファイルパスのセパレータが SEPARATOR と異なる場合
  # に設定されます。MS-DOS などでは "\\" です。UNIX や Cygwin などでは nil です。
  def ALT_SEPARATOR; end

  # --- PATH_SEPARATOR -> ";" | ":"
  # 
  # PATH 環境変数の要素のセパレータです。UNIX では ":" MS-DOS な
  # どでは ";" です。
  def PATH_SEPARATOR; end

  # --- SEPARATOR -> "/"
  # --- Separator -> "/"
  # 
  # ファイルパスのセパレータです。ファイルを扱うメソッドにパス名を渡す
  # 場合などスクリプト内のパス名は環境によらずこのセパレータで統一され
  # ます。値は "/" です。
  def SEPARATOR; end

end
