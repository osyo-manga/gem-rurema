class Shell
  # --- test(command, file1, file2 = nil) -> bool | Time | Integer | nil
  # --- [](command, file1, file2 = nil) -> bool | Time | Integer | nil
  # 
  # [[m:Kernel.#test]] や [[c:FileTest]] のメソッドに処理を委譲します。
  # 
  # @param command 数値、またはサイズが 1 の文字列の場合は [[m:Kernel.#test]] に処理委譲します。
  #                2 文字以上の文字列の場合は [[c:FileTest]] のメソッドとして実行します。
  # 
  # @param file1 文字列でファイルへのパスを指定します。
  # 
  # @param file2 文字列でファイルへのパスを指定します。
  # 
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  #   begin
  #     sh.mkdir("foo")
  #   rescue
  #   end
  #   p sh[?e, "foo"]         # => true
  #   p sh[:e, "foo"]         # => true
  #   p sh["e", "foo"]        # => true
  #   p sh[:exists?, "foo"]   # => true
  #   p sh["exists?", "foo"]  # => true
  # 
  # @see [[m:Kernel.#test]], [[c:FileTest]]
  def []; end

  # --- append(to, filter) -> Shell::AppendFile | Shell::AppendIO
  # @todo
  # 
  # @param to 文字列か [[c:IO]] を指定します。
  # 
  # @param filter [[c:Shell::Filter]] のインスタンスを指定します。
  def append; end

  # --- atime(filename) -> Time
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:File.atime]]
  def atime; end

  # --- basename(filename, suffix = "")     -> String
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param suffix サフィックスを文字列で与えます。'.*' という文字列を与えた場合、'*' はワイルドカードとして働き
  #               '.' を含まない任意の文字列にマッチします。
  # 
  # @see [[m:File.basename]]
  def basename; end

  # --- blockdev?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#blockdev?]]
  def blockdev?; end

  # --- cat(*files) -> Shell::Filter
  # 実行すると, それらを内容とする Filter オブジェクトを返します.
  # 
  # @param files シェルコマンド cat に与えるファイル名を文字列で指定します。
  # 
  # 動作例
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact {
  #     glob("*.txt").to_a.each { |file|
  #       file.chomp!
  #       cat(file).each { |l|
  #         echo(l) | tee(file + ".tee") >> "all.tee"
  #       }
  #     }
  #   }
  def cat; end

  # --- cd(path, &block) -> self
  # --- chdir(path, &block) -> self
  # 
  # カレントディレクトリをpathにする. イテレータとして呼ばれたときには
  # ブロック実行中のみカレントディレクトリを変更する.
  # 
  # @param path カレントディレクトリを文字列で指定します.  
  # 
  # @param block path で指定したディレクトリで行う操作をブロックで指定します.
  # 
  # 使用例
  #   require 'shell'
  #   sh = Shell.new
  #   sh.transact {
  #     cd("/tmp"){
  #       p cwd #=> "/tmp"
  #     }
  #     p cwd #=> "/Users/kouya/rbmanual"
  #   }
  def cd; end

  # --- chardev?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#chardev?]]
  def chardev?; end

  # --- check_point
  # --- finish_all_jobs
  # @todo
  def check_point; end

  # --- chmod(mode, *filename)    -> Integer
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param mode [[man:chmod(2)]] と同様に整数で指定します。
  # 
  # @see [[m:File.chmod]]
  def chmod; end

  # --- chown(owner, group, *filename)    -> Integer
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param owner [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、オーナーを現在のままにすることができます。
  # 
  # @param group [[man:chown(2)]] と同様に数値で指定します。nil または -1 を指定することで、グループを現在のままにすることができます。
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.chown]]
  def chown; end

  # --- command_processor -> Shell::CommandProcessor
  # @todo
  def command_processor; end

  # --- concat(*jobs) -> Shell::Concat
  # @todo
  def concat; end

  # --- ctime(filename)    -> Time
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:File.ctime]]
  def ctime; end

  # --- cwd -> String
  # --- dir -> String
  # --- getwd -> String
  # --- pwd -> String
  # 
  # カレントディレクトリのパスを文字列で返します。
  # 
  # 使用例
  #   require 'shell'
  #   sh = Shell.new
  #   p sh.cwd 
  #   # 例
  #   #=> "/Users/kouya/tall"
  def cwd; end

  # --- debug -> bool | Integer
  # --- debug? -> bool | Integer
  # @todo
  def debug; end

  # --- debug=(flag)
  # @todo
  def debug=; end

  # --- delete(*filename)    -> Integer
  # --- rm(*filename)        -> Integer
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.delete]]
  def delete; end

  # --- dirs -> [String]
  # --- dir_stack -> [String]
  # @todo
  def dir_stack; end

  # --- directory?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#directory?]]
  def directory?; end

  # --- dirname(filename)    -> String
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.dirname]]
  def dirname; end

  # --- echo(*strings) -> Shell::Filter
  # 実行すると, それらを内容とする Filter オブジェクトを返します.
  # 
  # @param strings シェルコマンド echo に与える引数を文字列で指定します。
  # 
  # 動作例
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact {
  #     glob("*.txt").to_a.each { |file|
  #       file.chomp!
  #       cat(file).each { |l|
  #         echo(l) | tee(file + ".tee") >> "all.tee"
  #       }
  #     }
  #   }
  def echo; end

  # --- executable?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#executable?]]
  def executable?; end

  # --- executable_real?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#executable_real?]]
  def executable_real?; end

  # --- exist?(file) -> bool
  # --- exists?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#exist?]] [[m:FileTest.#exists?]]
  def exist?; end

  # --- expand_path(path) -> String
  # 
  # Fileクラスにある同名のクラスメソッドと同じです.
  # 
  # @param path ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.expand_path]]
  def expand_path; end

  # --- file?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#file?]]
  def file?; end

  # --- find_system_command(command)
  # @todo
  def find_system_command; end

  # --- foreach(path = nil, &block) -> ()
  # 
  # pathがファイルなら, File#foreach
  # pathがディレクトリなら, Dir#foreach
  # の動作をします。
  # 
  # @param path ファイルもしくはディレクトリのパスを文字列で指定します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  #   sh.foreach("/tmp"){|f|
  #     puts f
  #   }
  def foreach; end

  # --- ftype(filename)    -> String
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.ftype]]
  def ftype; end

  # --- glob(pattern) -> Shell::Filter
  # 実行すると, それらを内容とする Filter オブジェクトを返します.
  # 
  # @param pattern シェルコマンド glob に与えるパターンを指定します。
  #               パターンの書式については、[[m:Dir.[] ]]を参照してください。
  # 
  # 動作例
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact {
  #     glob("*.txt").to_a.each { |file|
  #       file.chomp!
  #       cat(file).each { |l|
  #         echo(l) | tee(file + ".tee") >> "all.tee"
  #       }
  #     }
  #   }
  # 
  # @see [[m:Dir.[] ]]
  def glob; end

  # --- grpowned?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#grpowned?]]
  def grpowned?; end

  # --- identical?
  # @todo
  def identical?; end

  # --- jobs -> Array
  # 
  # スケジューリングされているjobの一覧を返します。
  def jobs; end

  # --- join(*item)    -> String
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param item 連結したいディレクトリ名やファイル名を文字列で与えます。
  # 
  # @see [[m:File.join]]
  def join; end

  # --- kill(signal, job) -> Integer
  # @todo
  # 
  # ジョブにシグナルを送ります。
  # 
  # @param signal
  # 
  # @param job
  def kill; end

  # --- link(old, new)    -> 0
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param old ファイル名を表す文字列を指定します。
  # 
  # @param new ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.link]]
  def link; end

  # --- lstat(filename)   -> File::Stat
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.lstat]]
  def lstat; end

  # --- mkdir(*path) -> Array
  # 
  # Dir.mkdirと同じです。 (複数可)
  # 
  # @param path 作成するディレクトリ名を文字列で指定します。
  # 
  # @return 作成するディレクトリの一覧の配列を返します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  #   begin
  #     p sh.mkdir("foo") #=> ["foo"]
  #   rescue => err
  #     puts err
  #   end
  def mkdir; end

  # --- mtime(filename)    -> Time
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:File.mtime]]
  def mtime; end

  # --- notify(*opts){ ... } -> ()
  # @todo
  def notify; end

  # --- open(path, mode) -> File | Dir
  # 
  # path がファイルなら、 [[m:File.open]] path がディレクトリなら、 [[m:Dir.open]] の動作をします。
  # 
  # @param path 開きたいパスを指定します。
  # 
  # @param mode アクセスモードを指定します。path がディレクトリの場合は無視されます。
  # 
  # @see [[m:File.open]], [[m:Dir.open]]
  def open; end

  # --- out(dev = STDOUT, &block) -> ()
  # 
  # [[m:Shell#transact]] を呼び出しその結果を dev に出力します。
  # 
  # @param dev  出力先をIO オブジェクトなどで指定します。
  # 
  # @param block transact 内部で実行するシェルを指定します。
  # 
  # 
  # 使用例:
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   File.open("out.txt", "w"){ |fp|
  #     sh.out(fp) {
  #       system("ls", "-l") | head("-n 3")
  #     }
  #   }
  def out; end

  # --- owned?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#owned?]]
  def owned?; end

  # --- pipe?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @see [[m:FileTest.#pipe?]]
  def pipe?; end

  # --- popd -> ()
  # --- popdir -> ()
  # 
  # ディレクトリスタックからポップし, それをカレントディレクトリにする.
  # 
  # 動作例
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  #   sh.pushd("/tmp")
  #   p sh.cwd #=> "/tmp"
  #   sh.pushd("/usr")
  #   p sh.cwd #=> "/usr"
  #   sh.popd
  #   p sh.cwd #=> "/tmp"
  def popd; end

  # --- process_controller -> Shell::ProcessController
  # @todo
  def process_controller; end

  # --- pushd(path = nil, &block) -> object
  # --- pushdir(path = nil, &block) -> object
  # 
  # カレントディレクトリをディレクトリスタックにつみ, カレントディレク
  # トリをpathにする. pathが省略されたときには, カレントディレクトリと
  # ディレクトリスタックのトップを交換する. イテレータとして呼ばれたと
  # きには, ブロック実行中のみpushdする.
  # 
  # @param path  カレントディレクトリをpathにする。文字列で指定します。
  # 
  # @param block イテレータとして呼ぶ場合, ブロックを指定します。
  #  
  # 動作例
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  #   sh.pushd("/tmp")
  #   p sh.cwd #=> "/tmp"
  #   sh.pushd("/usr")
  #   p sh.cwd #=> "/usr"
  #   sh.popd
  #   p sh.cwd #=> "/tmp"
  #   sh.pushd("/usr/local"){
  #     p sh.cwd #=> "/usr/local"
  #   }
  #   p sh.cwd #=> "/tmp"
  def pushd; end

  # --- readable?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#readable?]]
  def readable?; end

  # --- readable_real?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#readable_real?]]
  def readable_real?; end

  # --- readlink(path)    -> String
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param path シンボリックリンクを表す文字列を指定します。
  # 
  # @see [[m:File.readlink]]
  def readlink; end

  # --- record_separator -> String
  # @todo
  def record_separator; end

  # --- record_separator=(rs)
  # @todo
  def record_separator=; end

  # --- rehash -> {}
  # 
  # 登録されているシステムコマンドの情報をクリアします。
  # 通常、使うことはありません。
  def rehash; end

  # --- rename(from, to)    -> 0
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param from ファイルの名前を文字列で与えます。
  # 
  # @param to 新しいファイル名を文字列で与えます。
  # 
  # @see [[m:File.rename]]
  def rename; end

  # --- rmdir(*path) -> ()
  # 
  # Dir.rmdirと同じです。 (複数可)
  # 
  # @param path 削除するディレクトリ名を文字列で指定します。
  def rmdir; end

  # --- setgid?(file) -> bool
  # 
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#setgid?]]
  def setgid?; end

  # --- setuid?(file)    -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#setuid?]]
  def setuid?; end

  # --- size(file) -> Integer
  # --- size?(file) -> Integer | nil
  # 
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#size]] [[m:FileTest.#size?]]
  def size; end

  # --- socket?(file) -> bool
  # 
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#socket?]]
  def socket?; end

  # --- split(pathname)    -> [String]
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param pathname パス名を表す文字列を指定します。
  # 
  # @see [[m:File.split]]
  def split; end

  # --- stat(filename)    -> File::Stat
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.stat]]
  def stat; end

  # --- sticky?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#sticky?]]
  def sticky?; end

  # --- symlink(old, new)    -> 0
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param old ファイル名を表す文字列を指定します。
  # 
  # @param new シンボリックリンクを表す文字列を指定します。
  # 
  # @see [[m:File.symlink]]
  def symlink; end

  # --- symlink?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#symlink?]]
  def symlink?; end

  # --- system(command, *opts) -> Shell::SystemCommand
  # 
  # command を実行する.
  # 
  # @param command 実行するコマンドのパスを文字列で指定します。
  # 
  # @param opts command のオプションを文字列で指定します。複数可。
  # 
  # 使用例:
  # 
  #   require 'shell'
  #   Shell.verbose = false
  #   sh = Shell.new
  # 
  #   print sh.system("ls", "-l")
  #   Shell.def_system_command("head")
  #   sh.system("ls", "-l") | sh.head("-n 3") > STDOUT
  def system; end

  # --- system_path -> Array 
  # --- system_path=(path)
  # コマンドサーチパスの配列を返す。
  # 
  # @param path コマンドサーチパスの配列を指定します。
  # 
  # 使用例
  # 
  #   require 'shell'
  #   sh = Shell.new
  #   sh.system_path = [ "./" ]
  #   p sh.system_path #=> ["./"]
  def system_path; end

  # --- tee(file) -> Shell::Filter
  # 
  # 実行すると, それらを内容とする Filter オブジェクトを返します.
  # 
  # @param file シェルコマンドtee に与えるファイル名を文字列で指定します。
  # 
  # 動作例
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact {
  #     glob("*.txt").to_a.each { |file|
  #       file.chomp!
  #       cat(file).each { |l|
  #         echo(l) | tee(file + ".tee") >> "all.tee"
  #       }
  #     }
  #   }
  def tee; end

  # --- transact { ... } -> object
  # 
  # ブロック中で shell を self として実行します。
  # 
  # 例:
  # 
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact{
  #     system("ls", "-l") | head > STDOUT
  #     # transact の中では、
  #     # sh.system("ls", "-l") | sh.head > STDOUT と同じとなる。
  #   }
  def transact; end

  # --- truncate(path, length)    -> 0
  # 
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param path パスを表す文字列を指定します。
  # 
  # @param length 変更したいサイズを整数で与えます。
  # 
  # @see [[m:File.truncate]]
  def truncate; end

  # --- umask -> object
  # @todo
  # 
  # umaskを返します。
  def umask; end

  # --- umask=(umask)
  # @todo
  def umask=; end

  # --- unlink(path) -> self
  # 
  # path がファイルなら [[m:File.unlink]]、path がディレクトリなら [[m:Dir.unlink]] の動作をします。
  # 
  # @param path 削除したいパスを指定します。
  # 
  # @see [[m:File.unlink]], [[m:Dir.unlink]]
  def unlink; end

  # --- utime(atime, mtime, *filename)    -> Integer
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @param atime 最終アクセス時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @param utime 更新時刻を [[c:Time]] か、起算時からの経過秒数を数値で指定します。
  # 
  # @see [[m:File.utime]]
  def utime; end

  # --- verbose -> bool  
  # --- verbose? -> bool
  # @todo
  def verbose; end

  # --- verbose=(flag)
  # @todo
  def verbose=; end

  # --- world_readable?
  # @todo
  def world_readable?; end

  # --- world_writable?
  # @todo
  def world_writable?; end

  # --- writable?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#writable?]]
  def writable?; end

  # --- writable_real?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#writable_real?]]
  def writable_real?; end

  # --- zero?(file) -> bool
  # [[c:FileTest]] モジュールにある同名のクラスメソッドと同じです.
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # @see [[m:FileTest.#zero?]]
  def zero?; end

  # --- alias_command(alias, command, *opts) {...} -> self
  # 
  # コマンドの別名(エイリアス)を作成します。
  # コマンドが無い場合は、[[m:Shell.def_system_command]] などであらかじめ作成します.
  # 
  # @param alias エイリアスの名前を文字列で指定します.
  # 
  # @param command コマンド名を文字列で指定します.
  # 
  # @param opts command で指定したコマンドのオプションを指定します.
  # 
  # 使用例: ls -la | sort -k 5 のような例。
  # 
  #   require 'shell'
  #   Shell.def_system_command("ls")
  #   Shell.alias_command("lsla", "ls", "-a", "-l")
  #   Shell.def_system_command("sort")
  #   sh = Shell.new
  #   sh.transact {
  #     (lsla | sort("-k 5")).each {|l|
  #       puts l
  #     }
  #   }
  def alias_command; end

  # --- cascade -> bool
  # @todo
  def cascade; end

  # --- cascade=(flag)
  # @todo
  def cascade=; end

  # --- cd(path = nil, verbose = self.verbose) -> self
  # 
  # pathをカレントディレクトリとするShellオブジェクトを生成します.
  # 
  # @param path カレントディレクトリとするディレクトリを文字列で指定します。
  # 
  # @param verbose true を指定すると冗長な出力を行います。
  # 
  # 
  # 使用例
  #   require 'shell'
  #   sh = Shell.new
  #   sh.cd("/tmp")
  def cd; end

  # --- debug -> bool | Integer
  # --- debug? -> bool | Integer
  # @todo
  # 
  # デバッグ用フラグを参照します。
  def debug; end

  # --- debug=(val) 
  # 
  # デバッグ用のフラグを設定します。
  # 
  # @param val bool 値や整数値を指定します。詳細は下記を参照してください。
  # 
  #   # debug: true -> normal debug
  #   # debug: 1    -> eval definition debug
  #   # debug: 2    -> detail inspect debug
  def debug=; end

  # --- debug_output_lock -> Mutex
  # @todo
  # 
  # @see [[m:Thread::Mutex#lock]]
  def debug_output_lock; end

  # --- debug_output_locked? -> bool
  # @todo
  # 
  # @see [[m:Thread::Mutex#locked?]]
  def debug_output_locked?; end

  # --- debug_output_synchronize
  # @todo
  # 
  # @see [[m:Thread::Mutex#synchronize]]
  def debug_output_synchronize; end

  # --- debug_output_try_lock -> bool
  # @todo
  # 
  # @see [[m:Thread::Mutex#try_lock]]
  def debug_output_try_lock; end

  # --- debug_output_unlock -> Mutex | nil
  # @todo
  # 
  # @see [[m:Thread::Mutex#unlock]]
  def debug_output_unlock; end

  # --- def_system_command(command, path = command) -> nil
  # 
  # Shell のメソッドとして command を登録します.
  # 
  # OS上のコマンドを実行するにはまず, Shellのメソッドとして定義します.
  # 注) コマンドを定義しなくとも直接実行できる [[m:Shell#system]] コマンドもあります.
  # 
  # @param command Shell のメソッドとして定義するコマンドを文字列で指定します。
  # 
  # @param path command のパスを指定します。
  #             指定しない場合はcommand と同じになります。
  # 
  # 例)
  #   require 'shell'
  #   Shell.def_system_command "ls"
  #   # ls を定義
  # 
  #   Shell.def_system_command "sys_sort", "sort"
  #   # sortコマンドをsys_sortとして定義
  # 
  #   sh = Shell.new
  #   sh.transact {
  #     ls.each { |l|
  #       puts l
  #     }
  #     (ls("-l") | sys_sort("-k 5")).each {|l|
  #       puts l
  #     }
  #   }
  def def_system_command; end

  # --- default_record_separator -> String
  # --- default_record_separator=(rs)
  # 
  # 執筆者募集
  # 
  # Shell で用いられる入力レコードセパレータを表す文字列を設定および参照します。
  # なにも指定しない場合は[[m:$/]] の値が用いられます。
  # 
  # @param rs Shell で用いられる入力レコードセパレータを表す文字列を指定します。
  def default_record_separator; end

  # --- default_system_path -> Array
  # --- default_system_path=(path)
  # 
  # Shellでもちいられるコマンドを検索する対象のパスを設定および、参照します。
  # 
  # @param path Shellでもちいられるコマンドを検索する対象のパスを文字列で指定します。
  # 
  # 動作例
  #   require 'shell'
  #   p Shell.default_system_path 
  #   # 例
  #   #=> [ "/opt/local/bin", "/opt/local/sbin", "/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/X11/bin", "/Users/kouya/bin"]
  #   Shell.default_system_path = ENV["HOME"] + "/bin"
  #   p Shell.default_system_path
  #   # => "/Users/kouya/bin"
  def default_system_path; end

  # --- install_system_commands(pre = "sys_") -> ()
  # 
  # system_path上にある全ての実行可能ファイルをShellに定義する. メソッ
  # ド名は元のファイル名の頭にpreをつけたものとなる.
  # 
  # @param pre Shellに定義するメソッド名の先頭に付加される文字列を指定します。
  # 
  # 使用例: ls -l | head -n 5 のような例。
  # 
  #   require 'shell'
  #   Shell.install_system_commands
  #   sh = Shell.new
  #   sh.verbose = false
  #   sh.transact {
  #     (sys_ls("-l") | sys_head("-n 5")).each {|l|
  #       puts l
  #     } 
  #   }
  def install_system_commands; end

  # --- new(pwd = Dir.pwd, umask = nil) -> Shell
  # 
  # プロセスのカレントディレクトリをpwd で指定されたディレクトリとするShellオ
  # ブジェクトを生成します.
  # 
  # @param pwd プロセスのカレントディレクトリをpwd で指定されたディレクトリとします。
  #            指定しない場合は、[[m:Dir.pwd]] が使用されます。
  # 
  # @param umask ファイル作成の際に用いられる umask を使用します。
  def new; end

  # --- notify(*opts){|message| ... } -> String
  # @todo
  def notify; end

  # --- unalias_command(alias) -> ()
  # 
  # commandのaliasを削除します.
  # 
  # @param alias 削除したいエイリアスの名前を文字列で指定します。
  # 
  # @raise NameError alias で指定したコマンドが無い場合に発生します。
  # 
  # 使用例: ls -la | sort -k 5 のような例。
  #   require 'shell'
  #   Shell.def_system_command("ls")
  #   Shell.alias_command("lsla", "ls", "-a", "-l")
  #   Shell.def_system_command("sort")
  #   sh = Shell.new
  #   sh.transact {
  #     (lsla | sort("-k 5")).each {|l|
  #       puts l
  #     }
  #   }
  #   Shell.unalias_command("lsla")
  #   begin
  #     Shell.unalias_command("lsla")
  #   rescue NameError => err
  #     puts err
  #   end
  def unalias_command; end

  # --- undef_system_command(command) -> Shell::CommandProcessor
  # 
  # commandを削除します.
  # 
  # @param command 削除するコマンドの文字列を指定します。
  # 
  # 動作例：
  #   require 'shell'
  #   Shell.def_system_command("ls")
  #   # ls を定義
  #   Shell.undef_system_command("ls")
  #   # ls を 削除
  # 
  #   sh = Shell.new
  #   begin
  #     sh.transact {
  #       ls("-l").each {|l|
  #         puts l
  #       }
  #     }
  #   rescue NameError => err
  #     puts err
  #   end
  def undef_system_command; end

  # --- verbose -> bool  
  # --- verbose? -> bool
  # @todo
  def verbose; end

  # --- verbose=(flag)
  # 
  # true ならば冗長な出力の設定を行います。
  # 
  # @param flag true ならば冗長な出力の設定を行います。
  def verbose=; end

end
