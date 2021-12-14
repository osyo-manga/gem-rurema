class Shell::CommandProcessor
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

  # --- add_delegate_command_to_shell(id)
  # @todo
  # 
  # [[c:Shell]] 自体を初期化する時に呼び出されるメソッドです。
  # ユーザが使用することはありません。
  # 
  # @param id メソッド名を指定します。
  def add_delegate_command_to_shell; end

  # --- alias_command(alias, command, *opts) -> self
  # --- alias_command(alias, command, *opts){ ... } -> self
  # @todo
  # 
  # @param alias エイリアスの名前を指定します。
  # 
  # @param command コマンド名を指定します。
  # 
  # @param opts コマンドに与えるオプションを指定します。
  # 
  # @raise SyntaxError コマンドのエイリアス作成に失敗した時に発生します。
  def alias_command; end

  # --- alias_map -> Hash
  # 
  # [[m:Shell::CommandProcessor.alias_command]] で定義したエイリアスの一覧を返します。
  def alias_map; end

  # --- def_builtin_commands(delegation_class, commands_specs) -> ()
  # @todo
  # 
  # @param delegation_class 処理を委譲したいクラスかモジュールを指定します。
  # 
  # @param commands_specs コマンドの仕様を文字列の配列で指定します。
  #                       [[コマンド名, [引数1, 引数2, ...]], ...]
  def def_builtin_commands; end

  # --- def_system_command(command, path = command) -> ()
  # @todo
  # 
  # 与えられたコマンドをメソッドとして定義します。
  # 
  # @param command 定義したいコマンドを指定します。
  # 
  # @param path command のパスを指定します。省略すると環境変数 PATH から command を探します。
  def def_system_command; end

  # --- initialize -> ()
  # @todo
  # 
  # このクラスを初期化します。
  def initialize; end

  # --- install_builtin_commands -> ()
  # 
  # ビルトインコマンドを定義します。
  def install_builtin_commands; end

  # --- install_system_commands(prefix = "sys_") -> ()
  # 
  # 全てのシステムコマンドをメソッドとして定義します。
  # 
  # 既に定義されているコマンドを再定義することはありません。
  # デフォルトでは全てのコマンドに "sys_" というプレフィクスが付きます。
  # また、メソッド名として使用できない文字は全て "_" に置換してメソッドを定義します。
  # このメソッドの実行中に発生した例外は単に無視されます。
  # 
  # @param prefix プレフィクスを指定します。
  def install_system_commands; end

  # --- method_added(id)
  # @todo
  # このクラスに定義されたメソッドを [[c:Shell]] にも定義するためのフックです。
  # 
  # @param id メソッド名を指定します。
  def method_added; end

  # --- new(shell)
  # @todo
  def new; end

  # --- run_config -> ()
  # 
  # ユーザのホームディレクトリに "~/.rb_shell" というファイルが存在すれば、それを [[m:Kernel.#load]] します。
  # 
  # 存在しない時は何もしません。
  def run_config; end

  # --- unalias_command(alias) -> self
  # 
  # エイリアスを削除します。
  # 
  # @param alias 削除したいエイリアスを指定します。
  def unalias_command; end

  # --- undef_system_command(command) -> self
  # 
  # 与えられたコマンドを削除します。
  # 
  # @param command 削除したいコマンド名を指定します。
  def undef_system_command; end

  # --- NoDelegateMethods -> [String]
  # 
  # 内部で使用する定数です。
  def NoDelegateMethods; end

end
