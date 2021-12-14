class Pathname
  # --- +(other) -> Pathname
  # --- /(other) -> Pathname
  # 
  # パス名を連結します。つまり、other を self からの相対パスとした新しい
  # Pathname オブジェクトを生成して返します。
  # 
  # other が絶対パスなら単に other と同じ内容の Pathname オブジェクトが返さ
  # れます。
  # 
  #  require 'pathname'
  # 
  #  Pathname("foo/bar")+"baz" # => #<Pathname:foo/bar/baz>
  #  Pathname("foo/bar/")+"baz" # => #<Pathname:foo/bar/baz>
  #  Pathname("foo/bar")+"/baz" # => #<Pathname:/baz>
  #  Pathname("foo/bar")+"../baz" # => #<Pathname:foo/baz>
  # 
  # @param other 文字列か Pathname オブジェクトを指定します。
  def +; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # パス名を比較します。other と同じなら 0 を、ASCII順で self が大きい場合
  # は正、other が大きい場合は負を返します。大文字小文字は区別されます。
  # other は Pathname オブジェクトでなければなりません。
  # 
  # パス名の比較は単純にパス文字列の比較によって行われるので、論理的に
  # 同じパスでもパス文字列が違えば異なると判断されます。
  # 
  # @param other 比較対象の Pathname オブジェクトを指定します。
  # 
  #     require 'pathname'
  # 
  #     p Pathname.new("foo/bar") <=> Pathname.new("foo/bar")
  #     p Pathname.new("foo/bar") <=> Pathname.new("foo//bar")
  #     p Pathname.new("foo/../foo/bar") <=> Pathname.new("foo/bar")
  #     => 0
  #        1
  #        -1
  def <=>; end

  # --- ==(other)   -> bool
  # --- ===(other)  -> bool
  # --- eql?(other) -> bool
  # 
  # パス名を比較し、 other と同じなら真を返します。大文字小文字は区別されます。
  # other は Pathname オブジェクトでなければなりません。
  # 
  # パス名の比較は単純にパス文字列の比較によって行われるので、論理的に
  # 同じパスでもパス文字列が違えば異なると判断されます。
  # 
  # @param other 比較対象の Pathname オブジェクトを指定します。
  # 
  #     require 'pathname'
  # 
  #     p Pathname.new("foo/bar") == Pathname.new("foo/bar")
  #     p Pathname.new("foo/bar") == Pathname.new("foo//bar")
  #     p Pathname.new("foo/../foo/bar") == Pathname.new("foo/bar")
  # 
  #     # => true
  #          false
  #          false
  def ==; end

  # --- absolute? -> bool
  # self が絶対パス指定であれば真を返します。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # pathname = Pathname("/path/to/example.rb")
  # pathname.absolute? # => true
  # pathname = Pathname("../")
  # pathname.absolute? # => false
  # //}
  def absolute?; end

  # --- ascend {|pathname| ... } -> nil
  # --- ascend                   -> Enumerator
  # 
  # self のパス名から親方向に辿っていったときの各パス名を新しい Pathname オ
  # ブジェクトとして生成し、ブロックへの引数として渡して実行します。
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  #   require 'pathname'
  # 
  #   Pathname.new('/path/to/some/file.rb').ascend {|v| p v}
  #      #<Pathname:/path/to/some/file.rb>
  #      #<Pathname:/path/to/some>
  #      #<Pathname:/path/to>
  #      #<Pathname:/path>
  #      #<Pathname:/>
  # 
  #   Pathname.new('path/to/some/file.rb').ascend {|v| p v}
  #      #<Pathname:path/to/some/file.rb>
  #      #<Pathname:path/to/some>
  #      #<Pathname:path/to>
  #      #<Pathname:path>
  # 
  # ファイルシステムにはアクセスしません。
  def ascend; end

  # --- atime -> Time
  # File.atime(self.to_s) を渡したものと同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # pathname = Pathname("testfile")
  # pathname.atime # => 2018-12-18 20:58:13 +0900
  # //}
  # 
  # @see [[m:File.atime]]
  def atime; end

  # --- basename(suffix = "") -> Pathname
  # Pathname.new(File.basename(self.to_s, suffix)) と同じです。
  # 
  # @param suffix サフィックスを文字列で与えます。'.*' という文字列を与えた場合、'*' はワイルドカードとして働き
  #               '.' を含まない任意の文字列にマッチします。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname("ruby/ruby.c").basename          #=> #<Pathname:"ruby.c">
  # Pathname("ruby/ruby.c").basename(".c")    #=> #<Pathname:"ruby">
  # Pathname("ruby/ruby.c").basename(".*")    #=> #<Pathname:"ruby">
  # Pathname("ruby/ruby.exe").basename(".*")  #=> #<Pathname:"ruby">
  # Pathname("ruby/y.tab.c").basename(".*")   #=> #<Pathname:"y.tab">
  # //}
  # 
  # @see [[m:File.basename]]
  def basename; end

  # --- binread(*args) -> String | nil
  # IO.binread(self.to_s, *args)と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # pathname = Pathname("testfile")
  # pathname.binread           # => "This is line one\nThis is line two\nThis is line three\nAnd so on...\n"
  # pathname.binread(20)       # => "This is line one\nThi"
  # pathname.binread(20, 10)   # => "ne one\nThis is line "
  # //}
  # 
  # @see [[m:IO.binread]]
  def binread; end

  # --- binwrite(string, offset=nil) -> Integer
  # 
  # IO.binwrite(self.to_s, *args)と同じです。
  # 
  # 
  # @see [[m:IO.binwrite]]
  def binwrite; end

  # --- birthtime -> Time
  # File.birthtime(self.to_s) を渡したものと同じです。
  # 
  # @raise NotImplementedError  Windows のような birthtime のない環境で発生します。
  # 
  # 
  # @see [[m:File.birthtime]]
  def birthtime; end

  # --- blockdev? -> bool
  # FileTest.blockdev?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#blockdev?]]
  def blockdev?; end

  # --- chardev? -> bool
  # FileTest.chardev?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#chardev?]]
  def chardev?; end

  # --- children(with_directory = true) -> [Pathname]
  # self 配下にあるパス名(Pathnameオブジェクト)の配列を返します。
  # 
  # ただし、 ".", ".." は要素に含まれません。
  # 
  # @param with_directory 偽を指定するとファイル名のみ返します。デフォルトは真です。
  # 
  # @raise Errno::EXXX self が存在しないパスであったりディレクトリでなければ例外が発生します。
  # 
  #     require 'pathname'
  #     Pathname.new("/tmp").children # => [#<Pathname:.X11-unix>, #<Pathname:.iroha_unix>, ... ]
  def children; end

  # --- chmod(mode) -> Integer
  # File.chmod(mode, self.to_s) と同じです。
  # 
  # @param mode ファイルのアクセス権限を整数で指定します。
  # 
  # 
  # @see [[m:File.chmod]]
  def chmod; end

  # --- chown(owner, group) -> Integer
  # File.chown(owner, group, self.to_s) と同じです。
  # 
  # @param owner オーナーを指定します。
  # 
  # @param group グループを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # Pathname('testfile').stat.uid     # => 501
  # Pathname('testfile').chown(502, 12)
  # Pathname('testfile').stat.uid     # => 502
  # //}
  # 
  # @see [[m:File.chown]], [[m:File#chown]]
  def chown; end

  # --- cleanpath(consider_symlink = false) -> Pathname
  # 余計な "."、".." や "/" を取り除いた新しい Pathname オブジェクトを返します。
  # 
  # cleanpath は、実際にファイルシステムを参照することなく、文字列操作
  # だけで処理を行います。
  # 
  # @param consider_symlink 真ならパス要素にシンボリックリンクがあった場合
  #                         にも問題ないように .. を残します。
  # 
  #     require "pathname"
  #     path = Pathname.new("//.././../")
  #     path                  # => #<Pathname://.././../>
  #     path.cleanpath        # => #<Pathname:/>
  # 
  # 
  #     require 'pathname'
  #     Dir.rmdir("/tmp/foo")      rescue nil
  #     File.unlink("/tmp/bar/foo") rescue nil
  #     Dir.rmdir("/tmp/bar")      rescue nil
  #     Dir.mkdir("/tmp/foo")
  #     Dir.mkdir("/tmp/bar")
  #     File.symlink("../foo", "/tmp/bar/foo")
  #     path = Pathname.new("bar/././//foo/../bar")
  #     Dir.chdir("/tmp")
  # 
  #     path.cleanpath       # => #<Pathname:bar/bar>
  #     path.cleanpath(true) # => #<Pathname:bar/foo/../bar>
  def cleanpath; end

  # --- ctime -> Time
  # File.ctime(self.to_s) を渡したものと同じです。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # IO.write("testfile", "test")
  # pathname = Pathname("testfile")
  # pathname.ctime # => 2019-01-14 00:39:51 +0900
  # sleep 1
  # pathname.chmod(0755)
  # pathname.ctime # => 2019-01-14 00:39:52 +0900
  # //}
  # 
  # @see [[m:File.ctime]]
  def ctime; end

  # --- unlink -> Integer
  # --- delete -> Integer
  # self が指すディレクトリあるいはファイルを削除します。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # pathname = Pathname("/path/to/sample")
  # pathname.exist? # => true
  # pathname.unlink # => 1
  # pathname.exist? # => false
  # //}
  def delete; end

  # --- descend {|pathname| ... } -> nil
  # --- descend                   -> Enumerator
  # self のパス名の親から子供へと辿っていったときの各パス名を新しい
  # Pathname オブジェクトとして生成し、ブロックへの引数として渡して実行しま
  # す。
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  #   require 'pathname'
  # 
  #   Pathname.new('/path/to/some/file.rb').descend {|v| p v}
  #      #<Pathname:/>
  #      #<Pathname:/path>
  #      #<Pathname:/path/to>
  #      #<Pathname:/path/to/some>
  #      #<Pathname:/path/to/some/file.rb>
  # 
  #   Pathname.new('path/to/some/file.rb').descend {|v| p v}
  #      #<Pathname:path>
  #      #<Pathname:path/to>
  #      #<Pathname:path/to/some>
  #      #<Pathname:path/to/some/file.rb>
  # 
  # ファイルシステムにはアクセスしません。
  def descend; end

  # --- directory? -> bool
  # FileTest.directory?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#directory?]]
  def directory?; end

  # --- dirname -> Pathname
  # Pathname.new(File.dirname(self.to_s)) と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname('/usr/bin/shutdown').dirname # => #<Pathname:/usr/bin>
  # //}
  # 
  # @see [[m:File.dirname]]
  def dirname; end

  # --- each_child(with_directory = true)                  -> Enumerator
  # --- each_child(with_directory = true) {|pathname| ...} -> [Pathname]
  # 
  # self.children(with_directory).each と同じです。
  # 
  # @param with_directory 偽を指定するとファイル名のみ返します。デフォルトは真です。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname("/usr/local").each_child {|f| p f }
  # # => #<Pathname:/usr/local/bin>
  # # => #<Pathname:/usr/local/etc>
  # # => #<Pathname:/usr/local/include>
  # # => #<Pathname:/usr/local/lib>
  # # => #<Pathname:/usr/local/opt>
  # # => #<Pathname:/usr/local/sbin>
  # # => #<Pathname:/usr/local/share>
  # # => #<Pathname:/usr/local/var>
  # 
  # Pathname("/usr/local").each_child(false) {|f| p f }
  # # => #<Pathname:bin>
  # # => #<Pathname:etc>
  # # => #<Pathname:include>
  # # => #<Pathname:lib>
  # # => #<Pathname:opt>
  # # => #<Pathname:sbin>
  # # => #<Pathname:share>
  # # => #<Pathname:var>
  # //}
  # 
  # @see [[m:Pathname#children]]
  def each_child; end

  # --- each_entry {|pathname| ... } -> nil
  # Dir.foreach(self.to_s) {|f| yield Pathname.new(f) } と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname("/usr/local").each_entry {|f| p f }
  # 
  # # => #<Pathname:.>
  # # => #<Pathname:..>
  # # => #<Pathname:bin>
  # # => #<Pathname:etc>
  # # => #<Pathname:include>
  # # => #<Pathname:lib>
  # # => #<Pathname:opt>
  # //}
  # 
  # @see [[m:Dir.foreach]]
  def each_entry; end

  # --- each_filename {|v| ... } -> nil
  # self のパス名要素毎にブロックを実行します。
  # 
  #     require 'pathname'
  # 
  #     Pathname.new("/foo/../bar").each_filename {|v| p v}
  # 
  #     # => "foo"
  #          ".."
  #          "bar"
  def each_filename; end

  # --- each_line(*args){|line| ... } -> nil
  # --- each_line(*args) -> Enumerator
  # IO.foreach(self.to_s, *args, &block) と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # Pathname("testfile").each_line
  # # => #<Enumerator: IO:foreach("testfile")>
  # //}
  # 
  # //emlist[例 ブロックを指定][ruby]{
  # require "pathname"
  # 
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # Pathname("testfile").each_line {|f| p f }
  # 
  # # => "line1\n"
  # # => "line2,\n"
  # # => "line3\n"
  # //}
  # 
  # //emlist[例 limit を指定][ruby]{
  # require "pathname"
  # 
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # Pathname("testfile").each_line(4) {|f| p f }
  # 
  # # => "line"
  # # => "1\n"
  # # => "line"
  # # => "2,\n"
  # # => "line"
  # # => "3\n"
  # //}
  # 
  # //emlist[例 sep を指定][ruby]{
  # require "pathname"
  # 
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # Pathname("testfile").each_line(",") {|f| p f }
  # 
  # # => "line1\nline2,"
  # # => "\nline3\n"
  # //}
  # 
  # @see [[m:IO.foreach]]
  def each_line; end

  # --- empty? -> bool
  # ディレクトリに対しては Dir.empty?(self.to_s) と同じ、他に対しては FileTest.empty?(self.to_s) と同じです。
  # 
  # //emlist[例 ディレクトリの場合][ruby]{
  # require "pathname"
  # require 'tmpdir'
  # 
  # Pathname("/usr/local").empty?               # => false
  # Dir.mktmpdir { |dir| Pathname(dir).empty? } # => true
  # //}
  # 
  # //emlist[例 ファイルの場合][ruby]{
  # require "pathname"
  # require 'tempfile'
  # 
  # Pathname("testfile").empty?                           # => false
  # Tempfile.create("tmp") { |tmp| Pathname(tmp).empty? } # => true
  # //}
  # 
  # @see [[m:Dir.empty?]], [[m:FileTest.#empty?]], [[m:Pathname#zero?]]
  def empty?; end

  # --- entries -> [Pathname]
  # self に含まれるファイルエントリ名を元にした [[c:Pathname]] オブジェクトの配列を返します。
  # 
  # @raise Errno::EXXX self が存在しないパスであったりディレクトリでなければ例外が発生します。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # require 'pp'
  # 
  # pp Pathname('/usr/local').entries
  # # => [#<Pathname:.>,
  # #     #<Pathname:..>,
  # #     #<Pathname:bin>,
  # #     #<Pathname:etc>,
  # #     #<Pathname:include>,
  # #     #<Pathname:lib>,
  # #     #<Pathname:opt>,
  # #     #<Pathname:sbin>,
  # #     #<Pathname:share>,
  # #     #<Pathname:var>]
  # //}
  # 
  # @see [[m:Dir.entries]]
  def entries; end

  # --- executable? -> bool
  # FileTest.executable?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#executable?]]
  def executable?; end

  # --- executable_real? -> bool
  # FileTest.executable_real?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#executable_real?]]
  def executable_real?; end

  # --- exist? -> bool
  # FileTest.exist?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#exist?]]
  def exist?; end

  # --- expand_path(default_dir = '.') -> Pathname
  # Pathname.new(File.expand_path(self.to_s, *args)) と同じです。
  # 
  # @param default_dir self が相対パスであれば default_dir を基準に展開されます。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # path = Pathname("testfile")
  # Pathname.pwd             # => #<Pathname:/path/to>
  # path.expand_path         # => #<Pathname:/path/to/testfile>
  # path.expand_path("../")  # => #<Pathname:/path/testfile>
  # //}
  # 
  # @see [[m:File.expand_path]]
  def expand_path; end

  # --- extname -> String
  # File.extname(self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.extname]]
  def extname; end

  # --- file? -> bool
  # FileTest.file?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#file?]]
  def file?; end

  # --- find(ignore_error: true)                  -> Enumerator
  # --- find(ignore_error: true) {|pathname| ...} -> nil
  # self 配下のすべてのファイルやディレクトリを
  # 一つずつ引数 pathname に渡してブロックを実行します。
  # 
  #   require 'find'
  #   Find.find(self.to_s) {|f| yield Pathname.new(f)}
  # 
  # と同じです。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param ignore_error 探索中に発生した例外を無視するかどうかを指定します。
  # 
  # @see [[m:Find.#find]]
  def find; end

  # --- fnmatch(pattern, *args) -> bool
  # File.fnmatch(pattern, self.to_s, *args) と同じです。
  # 
  # @param pattern パターンを文字列で指定します。ワイルドカードとして `*', `?', `[]' が使用できま
  #                す。[[m:Dir.glob]] とは違って `{}' や `**/' は使用できません。
  # 
  # @param args [[m:File.fnmatch]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # path = Pathname("testfile")
  # path.fnmatch("test*")                       # => true
  # path.fnmatch("TEST*")                       # => false
  # path.fnmatch("TEST*", File::FNM_CASEFOLD)   # => true
  # //}
  # 
  # @see [[m:File.fnmatch]]
  def fnmatch; end

  # --- fnmatch?(pattern, *args) -> bool
  # File.fnmatch?(pattern, self.to_s, *args) と同じです。
  # 
  # @param pattern パターンを文字列で指定します。ワイルドカードとして `*', `?', `[]' が使用できま
  #                す。[[m:Dir.glob]] とは違って `{}' や `**/' は使用できません。
  # 
  # @param args [[m:File.fnmatch]] を参照してください。
  # 
  # @see [[m:File.fnmatch?]]
  def fnmatch?; end

  # --- ftype -> String
  # File.ftype(self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.ftype]]
  def ftype; end

  # --- glob(pattern, flags=0) -> [Pathname]
  # --- glob(pattern, flags=0) {|pathname| ...} -> nil
  # 
  # ワイルドカードの展開を行なった結果を、
  # Pathname オブジェクトの配列として返します。
  # 
  # 引数の意味は、[[m:Dir.glob]] と同じです。 flag の初期値である 0 は「何
  # も指定しない」ことを意味します。
  # 
  # ブロックが与えられたときは、ワイルドカードにマッチした Pathname オブジェ
  # クトを1つずつ引数としてそのブロックに与えて実行させます。この場合、値と
  # しては nil を返します。
  # 
  # このメソッドは内部で [[m:Dir.glob]] の base キーワード引数を使っています。
  # 
  # @param pattern ワイルドカードパターンです
  # @param flags   パターンマッチ時のふるまいを変化させるフラグを指定します
  # 
  # //emlist[][ruby]{
  # require "pathname"
  # Pathname("ruby-2.4.2").glob("R*.md") # => [#<Pathname:ruby-2.4.2/README.md>, #<Pathname:ruby-2.4.2/README.ja.md>]
  # //}
  # 
  # @see [[m:Dir.glob]]
  # @see [[m:Pathname.glob]]
  def glob; end

  # --- grpowned? -> bool
  # FileTest.grpowned?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#grpowned?]]
  def grpowned?; end

  # --- hash -> Integer
  # ハッシュ値を返します。
  def hash; end

  # --- join(*args) -> Pathname
  # 
  # 与えられたパス名を連結します。
  # 
  # @param args 連結したいディレクトリ名やファイル名を文字列で与えます。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # path0 = Pathname("/usr")                # Pathname:/usr
  # path0 = path0.join("bin/ruby")          # Pathname:/usr/bin/ruby
  #     # 上記の path0 の処理は下記の path1 と同様のパスになります
  # path1 = Pathname("/usr") + "bin/ruby"   # Pathname:/usr/bin/ruby
  # path0 == path1                          #=> true
  # //}
  def join; end

  # --- lchmod(mode) -> Integer
  # File.lchmod(mode, self.to_s) と同じです。
  # 
  # @param mode ファイルのアクセス権限を整数で指定します。
  # 
  # 
  # @see [[m:File.lchmod]]
  def lchmod; end

  # --- lchown(owner, group) -> Integer
  # File.lchown(owner, group, self.to_s) と同じです。
  # 
  # @param owner オーナーを指定します。
  # 
  # @param group グループを指定します。
  # 
  # 
  # @see [[m:File.lchown]]
  def lchown; end

  # --- lstat -> File::Stat
  # File.lstat(self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.lstat]]
  def lstat; end

  # --- make_link(old) -> 0
  # File.link(old, self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.link]]
  def make_link; end

  # --- make_symlink(old) -> 0
  # File.symlink(old, self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.symlink]]
  def make_symlink; end

  # --- mkdir(*args) -> 0
  # Dir.mkdir(self.to_s, *args) と同じです。
  # 
  # 
  # @see [[m:Dir.mkdir]]
  def mkdir; end

  # --- mkpath -> nil
  # FileUtils.mkpath(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileUtils.#mkpath]]
  def mkpath; end

  # --- mountpoint? -> bool
  # self がマウントポイントであれば真を返します。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # path = Pathname("/")
  # path.mountpoint? # => true
  # path = Pathname("/usr")
  # path.mountpoint? # => false
  # //}
  def mountpoint?; end

  # --- mtime -> Time
  # File.mtime(self.to_s) を渡したものと同じです。
  # 
  # 
  # @see [[m:File.mtime]]
  def mtime; end

  # --- open(mode = 'r', perm = 0666) -> File
  # --- open(mode = 'r', perm = 0666){|file| ... } -> object
  # File.open(self.to_s, *args, &block) と同じです。
  # 
  # 
  # @see [[m:File.open]]
  def open; end

  # --- opendir -> Dir
  # --- opendir{|dir| ... } -> nil
  # Dir.open(self.to_s, &block) と同じです。
  # 
  # 
  # @see [[m:Dir.open]]
  def opendir; end

  # --- owned? -> bool
  # FileTest.owned?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#owned?]]
  def owned?; end

  # --- parent -> Pathname
  # self の親ディレクトリを指す新しい Pathname オブジェクトを返します。
  # 
  # //emlist[例 絶対パス][ruby]{
  # require "pathname"
  # 
  # path = Pathname("/usr")
  # path        # => #<Pathname:/usr>
  # path.parent # => #<Pathname:/>
  # //}
  # 
  # //emlist[例 相対パス][ruby]{
  # require "pathname"
  # 
  # path = Pathname("foo/bar")
  # path.parent               # => #<Pathname:foo>
  # path.parent.parent        # => #<Pathname:.>
  # path.parent.parent.parent # => #<Pathname:..>
  # //}
  def parent; end

  # --- pipe? -> bool
  # FileTest.pipe?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#pipe?]]
  def pipe?; end

  # --- read(*args) -> String | nil
  # IO.read(self.to_s, *args)と同じです。
  # 
  # 
  # @see [[m:IO.read]]
  def read; end

  # --- readable? -> bool
  # FileTest.readable?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#readable?]]
  def readable?; end

  # --- readable_real? -> bool
  # FileTest.readable_real?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#readable_real?]]
  def readable_real?; end

  # --- readlines(*args) -> [String]
  # IO.readlines(self.to_s, *args)と同じです。
  # 
  # 
  # @see [[m:IO.readlines]]
  def readlines; end

  # --- readlink -> Pathname
  # Pathname.new(File.readlink(self.to_s)) と同じです。
  # 
  # 
  # @see [[m:File.readlink]]
  def readlink; end

  # --- realdirpath(basedir = nil) -> Pathname
  # 
  # [[m:Pathname#realpath]] とほぼ同じで、最後のコンポーネントは実際に
  # 存在しなくてもエラーになりません。
  # 
  # @param basedir ベースディレクトリを指定します。省略するとカレントディレクトリになります。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # path = Pathname("/not_exist")
  # path.realdirpath  # => #<Pathname:/not_exist>
  # path.realpath     # => Errno::ENOENT
  # 
  # # 最後ではないコンポーネント(/not_exist_1)も存在しないのでエラーになる。
  # path = Pathname("/not_exist_1/not_exist_2")
  # path.realdirpath  # => Errno::ENOENT
  # //}
  # 
  # @see [[m:Pathname#realpath]]
  def realdirpath; end

  # --- realpath(basedir = nil) -> Pathname
  # --- realpath -> Pathname
  # 余計な "."、".." や "/" を取り除いた新しい Pathname オブジェクトを返します。
  # 
  # また、ファイルシステムをアクセスし、実際に存在するパスを返します。
  # シンボリックリンクも解決されます。
  # 
  # self が指すパスが存在しない場合は例外 [[c:Errno::ENOENT]] が発生します。
  # 
  # @param basedir ベースディレクトリを指定します。省略するとカレントディレクトリになります。
  # 
  #     require 'pathname'
  # 
  #     Dir.rmdir("/tmp/foo")      rescue nil
  #     File.unlink("/tmp/bar/foo") rescue nil
  #     Dir.rmdir("/tmp/bar")      rescue nil
  # 
  #     Dir.mkdir("/tmp/foo")
  #     Dir.mkdir("/tmp/bar")
  #     File.symlink("../foo", "/tmp/bar/foo")
  #     path = Pathname.new("bar/././//foo/../bar")
  # 
  #     Dir.chdir("/tmp")
  # 
  #     p path.realpath
  # 
  #     => ruby 1.8.0 (2003-10-10) [i586-linux]
  #        #<Pathname:/tmp/bar>
  # 
  # @see [[m:Pathname#realdirpath]], [[m:File.realpath]]
  def realpath; end

  # --- relative? -> bool
  # self が相対パス指定であれば真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # p = Pathname.new('/im/sure')
  # p.relative? #=> false
  # 
  # p = Pathname.new('not/so/sure')
  # p.relative? #=> true
  # //}
  def relative?; end

  # --- relative_path_from(base_directory) -> Pathname
  # base_directory から self への相対パスを求め、その内容の新しい Pathname
  # オブジェクトを生成して返します。
  # 
  # パス名の解決は文字列操作によって行われ、ファイルシステムをアクセス
  # しません。
  # 
  # self が相対パスなら base_directory も相対パス、self が絶対パスなら
  # base_directory も絶対パスでなければなりません。
  # 
  # @param base_directory ベースディレクトリを表す Pathname オブジェクトを指定します。
  # 
  #     require 'pathname'
  # 
  #     path = Pathname.new("/tmp/foo")
  #     base = Pathname.new("/tmp")
  # 
  #     path.relative_path_from(base) # => #<Pathname:foo>
  def relative_path_from; end

  # --- rename(to) -> 0
  # File.rename(self.to_s, to) と同じです。
  # 
  # @param to ファイル名を表す文字列を指定します。
  # 
  # 
  # @see [[m:File.rename]]
  def rename; end

  # --- rmdir -> 0
  # Dir.rmdir(self.to_s) と同じです。
  # 
  # 
  # @see [[m:Dir.rmdir]]
  def rmdir; end

  # --- rmtree -> nil
  # FileUtils.rm_r(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileUtils.#rm_r]]
  def rmtree; end

  # --- root? -> bool
  # self がルートディレクトリであれば真を返します。判断は文字列操作によっ
  # て行われ、ファイルシステムはアクセスされません。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # Pathname('/').root?         # => true
  # Pathname('/im/sure').root?  # => false
  # //}
  def root?; end

  # --- setgid? -> bool
  # FileTest.setgid?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#setgid?]]
  def setgid?; end

  # --- setuid? -> bool
  # FileTest.setuid?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#setuid?]]
  def setuid?; end

  # --- size -> Integer
  # FileTest.size(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#size]]
  def size; end

  # --- size? -> bool
  # FileTest.size?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#size?]]
  def size?; end

  # --- socket? -> bool
  # FileTest.socket?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#socket?]]
  def socket?; end

  # --- split -> Array
  # File.split(self.to_s) と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # pathname = Pathname("/path/to/sample")
  # pathname.split # => [#<Pathname:/path/to>, #<Pathname:sample>]
  # //}
  # 
  # @see [[m:File.split]]
  def split; end

  # --- stat -> File::Stat
  # File.stat(self.to_s) と同じです。
  # 
  # 
  # @see [[m:File.stat]]
  def stat; end

  # --- sticky? -> bool
  # FileTest.sticky?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#sticky?]]
  def sticky?; end

  # --- sub(pattern, replace)  -> Pathname
  # --- sub(pattern) {|matched| ... } -> Pathname
  # 
  # self を表現するパス文字列に対して sub メソッドを呼び出し、その結果を内
  # 容とする新しい Pathname オブジェクトを生成し、返します。
  # 
  # @param pattern 置き換える文字列のパターンを指定します。
  # 
  # @param replace pattern で指定した文字列と置き換える文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # require 'pathname'
  # 
  # path1 = Pathname('/usr/bin/perl')
  # path1.sub('perl', 'ruby') #=> #<Pathname:/usr/bin/ruby>
  # //}
  # 
  # @see [[m:String#sub]]
  def sub; end

  # --- sub_ext(replace) -> Pathname
  # 
  # 拡張子を与えられた文字列で置き換えた [[c:Pathname]] オブジェクトを返します。
  # 
  # 自身が拡張子を持たない場合は、与えられた文字列を拡張子として付加します。
  # 
  # @param replace 拡張子を文字列で指定します。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname('/usr/bin/shutdown').sub_ext('.rb')      # => #<Pathname:/usr/bin/shutdown.rb>
  # Pathname('/home/user/test.txt').sub_ext('.pdf')   # => #<Pathname:/home/user/test.pdf>
  # Pathname('/home/user/test').sub_ext('.pdf')       # => #<Pathname:/home/user/test.pdf>
  # Pathname('/home/user/test.').sub_ext('.pdf')      # => #<Pathname:/home/user/test..pdf>
  # Pathname('/home/user/.test').sub_ext('.pdf')      # => #<Pathname:/home/user/.test.pdf>
  # Pathname('/home/user/test.tar.gz').sub_ext('.xz') # => #<Pathname:/home/user/test.tar.xz>
  # //}
  def sub_ext; end

  # --- symlink? -> bool
  # FileTest.symlink?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#symlink?]]
  def symlink?; end

  # --- sysopen(*args) -> Integer
  # IO.sysopen(self.to_s, *args)と同じです。
  # 
  # 
  # @see [[m:IO.sysopen]]
  def sysopen; end

  # --- to_path -> String
  # File.open などの引数に渡す際に呼ばれるメソッドです。 Pathname オブジェ
  # クトにおいては、 to_s と同じです。
  # 
  # 
  # @see [[m:Pathname#to_s]]
  def to_path; end

  # --- to_s   -> String
  # パス名を文字列で返します。
  # 
  # 
  #     require 'pathname'
  # 
  #     path = Pathname.new("/tmp/hogehoge")
  #     File.open(path)
  def to_s; end

  # --- truncate(length) -> 0
  # File.truncate(self.to_s, length) と同じです。
  # 
  # 
  # @param length 変更したいサイズを整数で与えます。
  # 
  # @see [[m:File.truncate]]
  def truncate; end

  # --- utime(atime, mtime) -> Integer
  # File.utime(atime, mtime, self.to_s) と同じです。
  # 
  # @param atime 最終アクセス時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param mtime 更新時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # 
  # @see [[m:File.utime]]
  def utime; end

  # --- world_readable? -> bool
  # FileTest.world_readable?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#world_readable?]]
  def world_readable?; end

  # --- world_writable? -> bool
  # FileTest.world_writable?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#world_writable?]]
  def world_writable?; end

  # --- writable? -> bool
  # FileTest.writable?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#writable?]]
  def writable?; end

  # --- writable_real? -> bool
  # FileTest.writable_real?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#writable_real?]]
  def writable_real?; end

  # --- write(string, offset=nil, opt={}) -> Integer
  # 
  # 
  # IO.write(self.to_s, *args)と同じです。
  # 
  # @see [[m:IO.write]]
  def write; end

  # --- zero? -> bool
  # 
  # FileTest.zero?(self.to_s) と同じです。
  # 
  # 
  # @see [[m:FileTest.#zero?]]
  #      , [[m:Pathname#empty?]]
  def zero?; end

  # --- getwd -> Pathname
  # --- pwd   -> Pathname
  # カレントディレクトリを元に Pathname オブジェクトを生成します。
  # Pathname.new(Dir.getwd) と同じです。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname.getwd #=> #<Pathname:/home/zzak/projects/ruby>
  # //}
  # 
  # @see [[m:Dir.getwd]]
  def getwd; end

  # --- glob(pattern, flags=0) -> [Pathname]
  # --- glob(pattern, flags=0) {|pathname| ...} -> nil
  # 
  # ワイルドカードの展開を行なった結果を、
  # Pathname オブジェクトの配列として返します。
  # 
  # 引数の意味は、[[m:Dir.glob]] と同じです。 flag の初期値である 0 は「何
  # も指定しない」ことを意味します。
  # 
  # ブロックが与えられたときは、ワイルドカードにマッチした Pathname オブジェ
  # クトを1つずつ引数としてそのブロックに与えて実行させます。この場合、値と
  # しては nil を返します。
  # 
  # @param pattern ワイルドカードパターンです
  # @param flags   パターンマッチ時のふるまいを変化させるフラグを指定します
  # 
  # //emlist[][ruby]{
  # require "pathname"
  # Pathname.glob("lib/i*.rb") # => [#<Pathname:lib/ipaddr.rb>, #<Pathname:lib/irb.rb>]
  # //}
  # 
  # @see [[m:Dir.glob]]
  # @see [[m:Pathname#glob]]
  def glob; end

  # --- new(path) -> Pathname
  # 文字列 path を元に Pathname オブジェクトを生成します。
  # 
  # @param path 文字列、または類似のオブジェクトを与えます。
  #             実際には to_str に反応するオブジェクトなら何でも構いません。
  # 
  # @raise ArgumentError path が \0 を含んでいると発生します。
  # 
  # //emlist[例][ruby]{
  # require "pathname"
  # 
  # Pathname.new(__FILE__) # => #<Pathname:/path/to/file.rb>
  # //}
  def new; end

  # --- SEPARATOR_PAT -> Regexp
  # パス名のなかのディレクトリを区切る部分にマッチする正規表現です。
  # 
  # この値は環境依存です。
  def SEPARATOR_PAT; end

  # --- TO_PATH -> Symbol
  # 内部的に使っている定数です。利用者が使うことはありません。
  def TO_PATH; end

end
