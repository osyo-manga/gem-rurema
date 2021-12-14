module FileUtils
  # --- ruby(*args){|result, status| ... }
  # 
  # 与えられた引数で Ruby インタプリタを実行します。
  # 
  # @param args Ruby インタプリタに与える引数を指定します。
  # 
  # 例:
  #    ruby %{-pe '$_.upcase!' <README}
  # 
  # @see [[m:Kernel.#sh]]
  def ruby; end

  # --- safe_ln(*args)
  # 
  # 安全にリンクを作成します。
  # 
  # リンクの作成に失敗した場合はファイルをコピーします。
  # 
  # @param args [[m:FileUtils.#cp]], [[m:FileUtils.#ln]] に渡す引数を指定します。
  # 
  # @see [[m:FileUtils.#cp]], [[m:FileUtils.#ln]]
  def safe_ln; end

  # --- sh(*cmd){|result, status| ... }
  # 
  # 与えられたコマンドを実行します。
  # 
  # 与えられた引数が複数の場合、シェルを経由しないでコマンドを実行します。
  # 
  # @param cmd 引数の解釈に関しては [[m:Kernel.#exec]] を参照してください。
  # 
  # 
  # 例:
  #    sh %{ls -ltr}
  #    
  #    sh 'ls', 'file with spaces'
  #    
  #    # check exit status after command runs
  #    sh %{grep pattern file} do |ok, res|
  #      if ! ok
  #        puts "pattern not found (status = #{res.exitstatus})"
  #      end
  #    end
  # 
  # @see [[m:Kernel.#exec]], [[m:Kernel.#system]]
  def sh; end

  # --- split_all(path) -> Array
  # 
  # 与えられたパスをディレクトリごとに分割します。
  # 
  # @param path 分割するパスを指定します。
  # 
  # 例:
  #    split_all("a/b/c") # =>  ['a', 'b', 'c']
  def split_all; end

  # --- cd(dir, options = {})                   -> 0
  # --- cd(dir, options = {}) {|dir| .... }     -> object
  # --- chdir(dir, options = {})                -> 0
  # --- chdir(dir, options = {}) {|dir| .... }  -> object
  # 
  # プロセスのカレントディレクトリを dir に変更します。
  # 
  # ブロックとともに呼び出された時はブロック終了後に
  # 元のディレクトリに戻ります。
  # 
  # @param dir ディレクトリを指定します。
  # 
  # @param options :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.cd('/', {:verbose => true})   # chdir and report it
  def cd; end

  # --- chmod(mode, list, options = {}) -> Array
  # 
  # ファイル list のパーミッションを mode に変更します。
  # 
  # @param mode パーミッションを8進数(absolute mode)か文字列(symbolic
  #             mode)で指定します。
  # 
  # @param list ファイルのリストを指定します。 対象のファイルが一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop と :verbose が指定可能です。
  #                [[ref:c:FileUtils#options]]
  # 
  # @return list を配列として返します。
  # 
  # 例:
  # 
  #   # Absolute mode
  #   require 'fileutils'
  #   FileUtils.chmod(0644, %w(my.rb your.rb his.rb her.rb))
  #   FileUtils.chmod(0755, 'somecommand')
  #   FileUtils.chmod(0755, '/usr/bin/ruby', :verbose => true)
  #   # Symbolic mode
  #   require 'fileutils'
  #   FileUtils.chmod("u=wr,go=rr", %w(my.rb your.rb his.rb her.rb))
  #   FileUtils.chmod("u=wrx,go=rx", 'somecommand')
  #   FileUtils.chmod("u=wrx,go=rx", '/usr/bin/ruby', :verbose => true)
  # 
  # symbolic mode では以下の指定を 操作対象 演算子 権限 の順番で指定します。
  # 
  # 操作対象(複数指定可。省略した場合は a)。
  # 
  #  * "a": 全て(所有者、グループ、その他)のユーザを指定するマスク
  #  * "u": 所有者を指定するマスク
  #  * "g": グループ(ファイルと同じグループに属しているが所有者ではない)を指定するマスク
  #  * "o": その他(所有者でもなく、そのファイルと同じグループにも属していない)を指定するマスク
  # 
  # 演算子。
  # 
  #  * "+": 以降で指定した権限を追加
  #  * "-" 以降で指定した権限を削除
  #  * "=" 以降で指定した権限を指定
  # 
  # 権限(複数指定可)。
  # 
  #  * "w": 書き込み権限
  #  * "r": 読み込み権限
  #  * "x": 実行権限
  #  * "s": 実行時にユーザー、あるいはグループ ID を設定
  #  * "t": sticky ビット
  def chmod; end

  # --- chmod_R(mode, list, options = {}) -> Array
  # 
  # ファイル list のパーミッションを再帰的に mode へ変更します。
  # 
  # @param mode パーミッションを8進数(absolute mode)か文字列(symbolic
  #             mode)で指定します([[m:FileUtils.#chmod]] 参照)。
  # 
  # @param list ファイルのリストを指定します。対象のファイルが一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop と :verbose が指定可能です。
  #                [[ref:c:FileUtils#options]]
  # 
  # @return list を配列として返します。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.chmod_R(0700, '/tmp/removing')
  def chmod_R; end

  # --- chown(user, group, list, options = {}) -> Array
  # 
  # ファイル list の所有ユーザと所有グループを user と group に変更します。
  # 
  # user, group に nil または -1 を渡すとその項目は変更しません。
  # 
  # @param user ユーザー名か uid を指定します。nil/-1 を指定すると変更しません。
  # 
  # @param group グループ名か gid を指定します。nil/-1 を指定すると変更しません。
  # 
  # @param list ファイルのリストを指定します。対象のファイルが一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop と :verbose が指定可能です。
  #                [[ref:c:FileUtils#options]]
  # 
  # @return list を配列として返します。
  # 
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
  #   FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true
  def chown; end

  # --- chown_R(user, group, list, options = {}) -> Array
  # 
  # list 以下のファイルの所有ユーザと所有グループを
  # user と group へ再帰的に変更します。
  # 
  # user, group に nil または -1 を渡すとその項目は変更しません。
  # 
  # @param user ユーザー名か uid を指定します。nil/-1 を指定すると変更しません。
  # 
  # @param group グループ名か gid を指定します。nil/-1 を指定すると変更しません。
  # 
  # @param list ファイルのリストを指定します。対象のファイルが一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop と :verbose が指定可能です。
  #                [[ref:c:FileUtils#options]]
  # 
  # @return list を配列として返します。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.chown 'root', 'staff', '/usr/local/bin/ruby'
  #   FileUtils.chown nil, 'bin', Dir.glob('/usr/bin/*'), :verbose => true
  #   
  #   require 'fileutils'
  #   FileUtils.chown_R 'www', 'www', '/var/www/htdocs'
  #   FileUtils.chown_R 'cvs', 'cvs', '/var/cvs', :verbose => true
  def chown_R; end

  # --- cmp(file_a, file_b)          -> bool
  # --- compare_file(file_a, file_b) -> bool
  # --- identical?(file_a, file_b)   -> bool
  # 
  # ファイル file_a と file_b の内容が同じなら真を返します。
  # 
  # @param file_a ファイル名。
  # 
  # @param file_b ファイル名。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.cmp('somefile', 'somefile')      #=> true
  #   FileUtils.cmp('/dev/null', '/dev/urandom') #=> false
  def cmp; end

  # --- compare_stream(io_a, io_b) -> bool
  # 
  # [[c:IO]] オブジェクト io_a と io_b の内容が同じなら真を返します。
  # 
  # @param io_a [[c:IO]] オブジェクト。
  # 
  # @param io_b [[c:IO]] オブジェクト。
  def compare_stream; end

  # --- cp(src, dest, options = {})   -> ()
  # --- copy(src, dest, options = {}) -> ()
  # 
  # ファイル src を dest にコピーします。
  # 
  # src にファイルが一つだけ与えられた場合、
  # dest がディレクトリならdest/src にコピーします。
  # dest が既に存在ししかもディレクトリでないときは上書きします。
  # 
  # src にファイルが複数与えられた場合、
  # file1 を dest/file1 にコピー、file2 を dest/file2 にコピー、
  # というように、ディレクトリ dest の中にファイル file1、file2 …を
  # 同じ名前でコピーします。dest がディレクトリでない場合は例外
  # [[c:Errno::ENOTDIR]] が発生します。
  # 
  # @param src コピー元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest コピー先のファイルかディレクトリです。
  # 
  # @param options :preserve, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @raise Errno::ENOTDIR src が複数のファイルかつ、dest がディレクトリでない場合に発生します。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.cp 'eval.c', 'eval.c.org'
  #   FileUtils.cp(['cgi.rb', 'complex.rb', 'date.rb'], '/usr/lib/ruby/1.8')
  #   FileUtils.cp(%w(cgi.rb complex.rb date.rb), '/usr/lib/ruby/1.8', {:verbose => true})
  def copy; end

  # --- copy_entry(src, dest, preserve = false, dereference_root = false) -> ()
  # 
  # ファイル src を dest にコピーします。
  # 
  # src が普通のファイルでない場合はその種別まで含めて完全にコピーします。
  # src がディレクトリの場合はその中身を再帰的にコピーします。
  # 
  # @param src コピー元。
  # 
  # @param dest コピー先。
  # 
  # @param preserve preserve が真のときは更新時刻と、
  #                 可能なら所有ユーザ・所有グループもコピーします。
  # 
  # @param dereference_root dereference_root が真のときは src についてだけシンボリックリンクの指す
  #                         内容をコピーします。偽の場合はシンボリックリンク自体をコピーします。
  def copy_entry; end

  # --- copy_file(src, dest, preserve = false, dereference_root = true) -> ()
  # 
  # ファイル src の内容を dest にコピーします。
  # 
  # @param src コピー元。
  # 
  # @param dest コピー先。
  # 
  # @param preserve preserve が真のときは更新時刻と、
  #                 可能なら所有ユーザ・所有グループもコピーします。
  # 
  # @param dereference_root dereference_root が真のときは src についてだけシンボリックリンクの指す
  #                         内容をコピーします。偽の場合はシンボリックリンク自体をコピーします。
  def copy_file; end

  # --- copy_stream(src, dest) -> ()
  # 
  # src を dest にコピーします。
  # src には read メソッド、dest には write メソッドが必要です。
  # 
  # @param src read メソッドを持つオブジェクト。
  # 
  # @param dest write メソッドを持つオブジェクト。
  def copy_stream; end

  # --- cp_lr(src, dest, noop: nil, verbose: nil, dereference_root: true, remove_destination: false)
  # 
  # src へのハードリンク dest を作成します。
  # src がディレクトリの場合、再帰的にリンクします。
  # dest がディレクトリの場合、src へのハードリンク dest/src を作成します。
  # 
  # @param src リンク元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest リンク作成先のファイルかディレクトリです。
  # 
  # @param options :noop, :verbose, :dereference_root, :remove_destination が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @raise ArgumentError dest が src に含まれる場合に発生します。
  # @raise Errno::EEXIST src が一つで dest がすでに存在しディレクトリでない場合に発生します。
  # @raise Errno::ENOTDIR src が複数で dest がディレクトリでない場合に発生します。
  # 
  # //emlist["mylib" ライブラリを site_ruby にインストールする例][ruby]{
  # require 'fileutils'
  # FileUtils.rm_r site_ruby + '/mylib', :force => true
  # FileUtils.cp_lr 'lib/', site_ruby + '/mylib'
  # //}
  # 
  # //emlist[様々なファイルを対象ディレクトリにリンクする例][ruby]{
  # require 'fileutils'
  # FileUtils.cp_lr %w(mail.rb field.rb debug/), site_ruby + '/tmail'
  # FileUtils.cp_lr Dir.glob('*.rb'), '/home/aamine/lib/ruby', :noop => true, :verbose => true
  # //}
  # 
  # //emlist[内容をリンクする例][ruby]{
  # require 'fileutils'
  # # ディレクトリそのものではなく、ディレクトリの内容をリンクしたい場合は、
  # # 以下のようになります。(たとえば src/x -> dest/x, src/y -> dest/y)
  # FileUtils.cp_lr 'src/.', 'dest'
  # # FileUtils.cp_lr('src', 'dest') は dest ディレクトリが存在すれば dest/src を作成しますが、この例はしません。
  # //}
  def cp_lr; end

  # --- cp_r(src, dest, options = {}) -> ()
  # 
  # src を dest にコピーします。src がディレクトリであったら再帰的に
  # コピーします。その際 dest がディレクトリなら dest/src にコピーします。
  # 
  # @param src コピー元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest コピー先のファイルかディレクトリです。
  # 
  # @param options :preserve, :noop, :verbose, :dereference_root, :remove_destination が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   # installing ruby library "mylib" under the site_ruby
  #   require 'fileutils'
  #   FileUtils.rm_r(site_ruby + '/mylib', {:force => true})
  #   FileUtils.cp_r('lib/', site_ruby + '/mylib')
  #   # other sample
  #   require 'fileutils'
  #   FileUtils.cp_r(%w(mail.rb field.rb debug/), site_ruby + '/tmail')
  #   FileUtils.cp_r(Dir.glob('*.rb'), '/home/taro/lib/ruby',
  #                  {:noop => true, :verbose => true})
  def cp_r; end

  # --- pwd   -> String
  # --- getwd -> String
  # 
  # プロセスのカレントディレクトリを文字列で返します。
  def getwd; end

  # --- install(src, dest, options = {}) -> ()
  # 
  # src と dest の内容が違うときだけ src を dest にコピーします。
  # 
  # @param src コピー元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest コピー先のファイルかディレクトリです。
  # 
  # @param options :preserve, :noop, :verbose, :mode, :owner, :group が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.install('ruby', '/usr/local/bin/ruby', {:mode => 0755, :verbose => true})
  #   FileUtils.install('lib.rb', '/usr/local/lib/ruby/site_ruby', {:verbose => true})
  def install; end

  # --- ln(src, dest, options = {})   -> ()
  # --- link(src, dest, options = {}) -> ()
  # 
  # src へのハードリンク dest を作成します。
  # 
  # src が一つの場合、
  # dest がすでに存在しディレクトリであるときは dest/src を作成します。
  # dest がすでに存在しディレクトリでないならば例外 Errno::EEXIST が発生します。
  # ただし :force オプションを指定したときは dest を上書きします。
  # 
  # src が複数の場合、
  # src[0] へのハードリンク dest/src[0]、src[1] への
  # ハードリンク dest/src[1] …を作成します。
  # dest がディレクトリでない場合は例外 Errno::ENOTDIR が発生します。
  # 
  # @param src リンク元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest リンク作成先のファイルかディレクトリです。
  # 
  # @param options :force, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @raise Errno::EEXIST src が一つで dest がすでに存在しディレクトリでない場合に発生します。
  # @raise Errno::ENOTDIR src が複数で dest がディレクトリでない場合に発生します。
  # 
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.ln('gcc', 'cc', {:verbose => true})
  #   FileUtils.ln('/usr/bin/emacs21', '/usr/bin/emacs')
  #   FileUtils.cd('/bin')
  #   FileUtils.ln(%w(cp mv mkdir), '/usr/bin')
  def link; end

  # --- ln_s(src, dest, options = {})    -> ()
  # --- symlink(src, dest, options = {}) -> ()
  # 
  # src へのシンボリックリンク dest を作成します。
  # 
  # src が一つの場合、
  # dest がすでに存在しディレクトリであるときは dest/src を作成します。
  # dest がすでに存在しディレクトリでないならば例外 Errno::EEXIST が発生します。
  # ただし :force オプションを指定したときは dest を上書きします。
  # 
  # src が複数の場合、
  # src[0] へのシンボリックリンク dest/src[0]、src[1] への
  # シンボリックリンク dest/src[1] …を作成します。
  # dest がディレクトリでない場合は例外 Errno::ENOTDIR が発生します。
  # 
  # @param src リンク元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest リンク作成先のファイルかディレクトリです。
  # 
  # @param options :force, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @raise Errno::EEXIST src が一つで dest がすでに存在しディレクトリでない場合に発生します。
  # @raise Errno::ENOTDIR src が複数で dest がディレクトリでない場合に発生します。
  # 
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.ln_s('/usr/bin/ruby', '/usr/local/bin/ruby')
  #   FileUtils.ln_s('verylongsourcefilename.c', 'c', {:force => true})
  #   FileUtils.ln_s(Dir.glob('bin/*.rb'), '/home/aamine/bin')
  def ln_s; end

  # --- ln_sf(src, dest, options = {}) -> ()
  # 
  # src へのシンボリックリンク dest を作成します。
  # 
  # ln_s(src, dest, :force => true) と同じです。
  # 
  # @param src リンク元。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest リンク作成先のファイルかディレクトリです。
  # 
  # @param options :force, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @raise Errno::ENOTDIR src が複数で dest がディレクトリでない場合に発生します。
  # 
  # @see [[m:FileUtils.#ln_s]]
  def ln_sf; end

  # --- mkdir_p(list, options = {})  -> Array
  # --- mkpath(list, options = {})   -> Array
  # --- makedirs(list, options = {}) -> Array
  # 
  # ディレクトリ dir とその親ディレクトリを全て作成します。
  # 
  # 例えば、
  # 
  #   require 'fileutils'
  #   FileUtils.mkdir_p('/usr/local/lib/ruby')
  # 
  # は以下の全ディレクトリを (なければ) 作成します。
  # 
  #   * /usr
  #   * /usr/local
  #   * /usr/local/bin
  #   * /usr/local/bin/ruby
  # 
  # @param list 作成するディレクトリ。一つの場合は文字列でも指定できます。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :mode, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # @return ディレクトリ名文字列の配列を返します。
  def makedirs; end

  # --- mkdir(dir, options = {}) -> ()
  # 
  # ディレクトリ dir を作成します。
  # 
  # @param dir 作成するディレクトリ。
  # 
  # @param options :mode, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.mkdir('test')
  #   FileUtils.mkdir(%w( tmp data ))
  #   FileUtils.mkdir('notexist', {:noop => true})  # does not create really
  def mkdir; end

  # --- mv(src, dest, options = {})   -> ()
  # --- move(src, dest, options = {}) -> ()
  # 
  # ファイル src を dest に移動します。
  # 
  # src が一つの場合、
  # dest がすでに存在しディレクトリであるときは src を dest/src へ移動します。
  # dest がすでに存在しディレクトリでないときは src は dest を上書きします。
  # 
  # src が複数の場合、
  # src[0] を dest/src[0]、src[1] を dest/src[1] へ移動します。
  # dest がディレクトリでない場合は例外 Errno::ENOTDIR が発生します。
  # 
  # @param src 元のファイル。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param dest 移動先のファイル、またはディレクトリ。
  # 
  # @param options :force, :noop, :verbose, :secure が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.mv('badname.rb', 'goodname.rb')
  #   FileUtils.mv('stuff.rb', 'lib/ruby', {:force => true})
  #   FileUtils.mv(['junk.txt', 'dust.txt'], "#{ENV['HOME']}/.trash")
  #   FileUtils.mv(Dir.glob('test*.rb'), 'test', {:noop => true, :verbose => true} )
  def move; end

  # --- rm(list, options = {})     -> ()
  # --- remove(list, options = {}) -> ()
  # 
  # list で指定された対象を消去します。
  # 
  # @param list 削除する対象。一つの場合は文字列も指定可能です。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :force, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.rm('junk.txt')
  #   FileUtils.rm(Dir.glob('*~'))
  #   FileUtils.rm('NotExistFile', {:force => true})    # never raises exception
  def remove; end

  # --- remove_dir(path, force = false) -> ()
  # 
  # ディレクトリ path を削除します。
  # 
  # @param path 削除するディレクトリ。
  # 
  # @param force 真のときは削除中に発生した [[c:StandardError]] を無視します。
  def remove_dir; end

  # --- remove_entry(path, force = false) -> ()
  # 
  # ファイル path を削除します。path がディレクトリなら再帰的に削除します。
  # 
  # このメソッドにはローカル脆弱性が存在します。
  # 詳しくは [[m:FileUtils.#remove_entry_secure]] の項を参照してください。
  # 
  # @param path 削除するパス。
  # 
  # @param force 真のときは削除中に発生した [[c:StandardError]] を無視します。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.remove_entry '/tmp/ruby.tmp.08883'
  # 
  # @see [[m:FileUtils.#remove_entry_secure]]
  def remove_entry; end

  # --- remove_entry_secure(path, force = false) -> ()
  # 
  # ファイル path を削除します。path がディレクトリなら再帰的に削除します。
  # 
  # [[m:FileUtils.#rm_r]] および [[m:FileUtils.#remove_entry]] には
  # TOCTTOU (time-of-check to time-of-use)脆弱性が存在します。
  # このメソッドはそれを防ぐために新設されました。
  # [[m:FileUtils.#rm_r]] および [[m:FileUtils.#remove_entry]] は以下の条件が
  # 満たされるときにはセキュリティホールになりえます。
  # 
  #   * 親ディレクトリが全ユーザから書き込み可能 (/tmp を含む)
  #   * path 以下のいずれかのディレクトリが全ユーザから書き込み可能
  #   * システムがシンボリックリンクを持つ
  # 
  # この脆弱性を防ぐため、remove_entry_secure は削除前に path 以下の
  # ディレクトリのオーナーとパーミッションを変更し、上記の条件を回避します。
  # ただし remove_entry_secure は親ディレクトリが以下の条件を満たすことを
  # 仮定しています。
  # 
  #   * UNIX システムおよびそれに類する環境では、sticky ビットが立っていること。
  #   * 全ユーザが書き込み可能であるのは、直接の親ディレクトリのみであること。
  #     例えば、/var/tmp のパーミッションが 1777 であるのは問題ありませんが、
  #     その場合 / や /var が全ユーザから書き込み可能であってはなりません。
  # 
  # この条件が満たされない場合 remove_entry_secure は安全ではありません。
  # 
  # @param path 削除するパス。
  # 
  # @param force 真のときは削除中に発生した [[c:StandardError]] を無視します。
  def remove_entry_secure; end

  # --- remove_file(path, force = false) -> ()
  # 
  # ファイル path を削除します。
  # 
  # @param path 削除するファイル。
  # 
  # @param force 真のときは削除中に発生した [[c:StandardError]] を無視します。
  def remove_file; end

  # --- rm_f(list, options = {})        -> ()
  # --- safe_unlink(list, options = {}) -> ()
  # 
  # FileUtils.rm(list, :force => true) と同じです。
  # 
  # [[ref:c:FileUtils#options]]
  # 
  # @param list 削除する対象。一つの場合は文字列も指定可能です。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop, :verbose が指定できます。
  #                :force がセットされた場合は作業中すべての [[c:StandardError]] を無視します。
  # 
  # @see [[m:FileUtils.#rm]]
  def rm_f; end

  # --- rm_r(list, options = {}) -> ()
  # 
  # ファイルまたはディレクトリ list を再帰的に消去します。
  # 
  # @param list 削除する対象。一つの場合は文字列も指定可能です。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :force, :noop, :verbose, :secure が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # === 注意
  # 
  # このメソッドにはローカル脆弱性が存在します。
  # この脆弱性を回避するには :secure オプションを使用してください。
  # 詳しくは [[m:FileUtils.#remove_entry_secure]] の項を参照してください。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.rm_r(Dir.glob('/tmp/*'))
  #   FileUtils.rm_r(Dir.glob('/tmp/*'), :secure => true)
  # 
  # @see [[m:FileUtils.#rm]], [[m:FileUtils.#remove_entry_secure]]
  def rm_r; end

  # --- rm_rf(list, options = {})  -> ()
  # --- rmtree(list, options = {}) -> ()
  # 
  # ファイルまたはディレクトリ list を再帰的に消去します。
  # 
  # rm_r(list, {:force => true}) と同じです。
  # 
  # @param list 削除する対象。一つの場合は文字列も指定可能です。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :noop, :verbose, :secure が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # === 注意
  # 
  # このメソッドにはローカル脆弱性が存在します。
  # この脆弱性を回避するには :secure オプションを使用してください。
  # 詳しくは [[m:FileUtils.#remove_entry_secure]] の項を参照してください。
  # 
  # @see [[m:FileUtils.#rm]], [[m:FileUtils.#rm_r]], [[m:FileUtils.#remove_entry_secure]]
  def rm_rf; end

  # --- rmdir(dir, options = {}) -> ()
  # 
  # ディレクトリ dir を削除します。
  # 
  # ディレクトリにファイルが残っていた場合は削除に失敗します。
  # 
  # @param dir 削除するディレクトリを指定します。一つの場合は文字列でも指定可能です。
  #            二つ以上指定する場合は配列で指定します。
  # 
  # @param options :parents, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.rmdir('somedir')
  #   FileUtils.rmdir(%w(somedir anydir otherdir))
  #   # 実際にはディレクトリの削除は行わずにメッセージ出力のみ
  #   FileUtils.rmdir('somedir', {:verbose => true, :noop => true})
  def rmdir; end

  # --- touch(list, options = {}) -> ()
  # 
  # list で指定されたファイルの最終変更時刻 (mtime) と
  # アクセス時刻 (atime) を変更します。
  # 
  # list で指定されたファイルが存在しない場合は空のファイルを作成します。
  # 
  # @param list 対象のファイル。一つの場合は文字列も指定可能です。
  #             二つ以上指定する場合は配列で指定します。
  # 
  # @param options :mtime, :nocreate, :noop, :verbose が指定できます。
  #                [[ref:c:FileUtils#options]]
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.touch('timestamp')
  #   FileUtils.touch('timestamp', :mtime => Time.now)
  #   FileUtils.touch(Dir.glob('*.c'))
  def touch; end

  # --- uptodate?(newer, older_list, options = nil) -> bool
  # 
  # newer が、older_list に含まれるすべてのファイルより新しいとき真。
  # 存在しないファイルは無限に古いとみなされます。
  # 
  # @param newer ファイルを一つ指定します。
  # 
  # @param older_list ファイル名の配列を指定します。
  # 
  # @param options どのようなオプションも指定することはできません。
  # 
  # @raise ArgumentError options にオプションを指定した場合に発生します。
  # 
  # 例:
  # 
  #   require 'fileutils'
  #   FileUtils.uptodate?('hello.o', ['hello.c', 'hello.h']) or system('make')
  def uptodate?; end

  # --- collect_method(opt) -> Array
  # 
  # 与えられたオプションを持つメソッド名の配列を返します。
  # 
  # @param opt オプション名をシンボルで指定します。
  # 
  #   require 'fileutils'
  #   FileUtils.collect_method(:preserve) # => ["cp", "cp_r", "copy", "install"]
  def collect_method; end

  # --- commands -> Array
  # 
  # 何らかのオプションを持つメソッド名の配列を返します。
  # 
  #   require 'fileutils'
  #   FileUtils.commands  # => ["chmod", "cp", "cp_r", "install", ...]
  def commands; end

  # --- have_option?(mid, opt) -> bool
  # 
  # mid というメソッドが opt というオプションを持つ場合、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param mid メソッド名を指定します。
  # 
  # @param opt オプション名を指定します。
  def have_option?; end

  # --- options -> Array
  # 
  # オプション名の配列を返します。
  # 
  #   require 'fileutils'
  #   FileUtils.options
  #   # => ["noop", "verbose", "force", "mode", "parents", "owner", "group", "preserve", "dereference_root", "remove_destination", "secure", "mtime", "nocreate"]
  def options; end

  # --- options_of(mid) -> Array
  # 
  # 与えられたメソッド名で使用可能なオプション名の配列を返します。
  # 
  # @param mid メソッド名を指定します。
  # 
  #   require 'fileutils'
  #   FileUtils.options_of(:rm)  # => ["noop", "verbose", "force"]
  def options_of; end

  # --- METHODS -> Array
  # 
  # このモジュールで定義されている公開メソッドの配列を返します。
  def METHODS; end

  # --- OPT_TABLE -> Hash
  # 
  # 内部で使用します。
  def OPT_TABLE; end

end
