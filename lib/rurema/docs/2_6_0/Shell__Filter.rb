class Shell::Filter
  # --- +(filter)
  # 執筆者募集
  # 
  # filter1 + filter2 は filter1の出力の後, filter2の出力を行う。
  def +; end

  # --- <(src) -> self
  # 
  # srcをフィルタの入力とする。 srcが, 文字列ならばファイルを, IOオブジェクトであれ
  # ばそれをそのまま入力とする。
  # 
  # @param src フィルタの入力を, 文字列もしくは,IO オブジェクトで指定します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.def_system_command("head")
  #   sh = Shell.new
  #   sh.transact {
  #     (sh.head("-n 30") < "/etc/passwd") > "ugo.txt"
  #   }
  def <; end

  # --- >(to) -> self
  # 
  # toをフィルタの出力とする。 toが, 文字列ならばファイルに, IOオブジェクトであれ
  # ばそれをそのまま出力とする。
  # 
  # @param to 出力先を指定します。文字列ならばファイルに,IOオブジェクトならばそれに出力します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.def_system_command("tail")
  #   sh = Shell.new
  #   sh.transact {
  #     (sh.tail("-n 3") < "/etc/passwd") > File.open("tail.out", "w")
  #     #(sh.tail("-n 3") < "/etc/passwd") > "tail.out" # と同じ.
  #   }
  def >; end

  # --- >>(to) -> self
  # 
  # toをフィルタに追加する。 toが, 文字列ならばファイルに, IOオブジェクトであれば
  # それをそのまま出力とする。
  # 
  # @param to 出力先を指定します。文字列ならばファイルに、IOオブジェクトならばそれに出力します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.def_system_command("tail")
  #   sh = Shell.new
  #   sh.transact {
  #     (sh.tail("-n 3") < "/etc/passwd") >> "tail.out" 
  #     #(sh.tail("-n 3") < "/etc/passwd") >> File.open("tail.out", "w") # でも同じ。
  #   }
  def >>; end

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

  # --- delete(*filename)    -> Integer
  # --- rm(*filename)        -> Integer
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param filename ファイル名を表す文字列を指定します。
  # 
  # @see [[m:File.delete]]
  def delete; end

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

  # --- each(rs = nil) -> ()
  # 
  # フィルタの一行ずつをblockに渡します。
  # 
  # @param rs レコードセパレーターを表す文字列を指定します。
  #           nil ならば、[[m:Shell.record_separator]]の値が使用されます。
  # 
  # 使用例
  #   require 'shell'
  #   sh = Shell.new
  #   sh.cat("/etc/passwd").each { |line|
  #     puts line
  #   }
  def each; end

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

  # --- input -> Shell::Filter | nil
  # 現在のフィルターを返します。
  def input; end

  # --- input=(filter)
  # 
  # フィルターを設定します。
  # 
  # @param filter フィルターを指定します。
  def input=; end

  # --- inspect -> String
  # 
  # オブジェクトを人間が読める形式に変換した文字列を返します。
  # 
  # @see [[m:Object#inspect]]
  def inspect; end

  # --- join(*item)    -> String
  # [[c:File]] クラスにある同名のクラスメソッドと同じです.
  # 
  # @param item 連結したいディレクトリ名やファイル名を文字列で与えます。
  # 
  # @see [[m:File.join]]
  def join; end

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

  # --- to_a -> [String]
  # 実行結果を文字列の配列で返します。
  # 
  #   require 'shell'
  #   Shell.def_system_command("wc")
  #   sh = Shell.new
  #   puts sh.cat("/etc/passwd").to_a
  def to_a; end

  # --- to_s -> String
  # 実行結果を文字列で返します。
  # 
  #   require 'shell'
  #   Shell.def_system_command("wc")
  #   sh = Shell.new
  # 
  #   sh.transact {
  #     puts (cat("/etc/passwd") | wc("-l")).to_s
  #   }
  def to_s; end

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

  # --- |(filter) -> object
  # 
  # パイプ結合を filter に対して行います。
  # 
  # @param filter Shell::Filter オブジェクトを指定します。
  # 
  # @return filter を返します。
  # 
  # 使用例
  #   require 'shell'
  #   Shell.def_system_command("tail")
  #   Shell.def_system_command("head")
  #   Shell.def_system_command("wc")
  #   sh = Shell.new
  #   sh.transact {
  #     i = 1
  #     while i <= (cat("/etc/passwd") | wc("-l")).to_s.chomp.to_i
  #       puts (cat("/etc/passwd") | head("-n #{i}") | tail("-n 1")).to_s
  #       i += 1
  #     end
  #   }
  def |; end

  # --- new(sh) -> Shell::Filter
  # 
  # [[c:Shell::Filter]] クラスのインスタンスを返します。
  # 通常このメソッドを直接使う機会は少ないでしょう。
  def new; end

end
