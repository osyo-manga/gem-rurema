module Process
  # --- argv0 -> String
  # 
  # 現在実行中の Ruby スクリプトの名前を表す文字列です。[[m:$0]] を更新して
  # も本メソッドの戻り値への影響はありません。
  # 
  # 本メソッドは 2.1 以降でグローバル変数を用いないで現在実行中の Ruby スク
  # リプトの名前を表す文字列を取得する手段として提供されました。
  # 
  # @see [[m:Process.#setproctitle]], [[m:$0]]
  def argv0; end

  # --- clock_gettime(clock_id, unit=:float_second) -> Float | Integer
  # 
  # POSIX の clock_gettime() 関数の時間を返します。
  # 
  # 例:
  #   p Process.clock_gettime(Process::CLOCK_MONOTONIC) #=> 896053.968060096
  # 
  # @param clock_id クロックの種類を以下の定数のいずれかで指定します。
  #                 サポートされている定数は OS やバージョンに依存します。
  # 
  # : [[m:Process::CLOCK_REALTIME]]
  #  SUSv2 to 4, Linux 2.5.63, FreeBSD 3.0, NetBSD 2.0, OpenBSD 2.1, macOS 10.12
  # : [[m:Process::CLOCK_MONOTONIC]]
  #  SUSv3 to 4, Linux 2.5.63, FreeBSD 3.0, NetBSD 2.0, OpenBSD 3.4, macOS 10.12
  # : [[m:Process::CLOCK_PROCESS_CPUTIME_ID]]
  #  SUSv3 to 4, Linux 2.5.63, OpenBSD 5.4, macOS 10.12
  # : [[m:Process::CLOCK_THREAD_CPUTIME_ID]]
  #  SUSv3 to 4, Linux 2.5.63, FreeBSD 7.1, OpenBSD 5.4, macOS 10.12
  # : [[m:Process::CLOCK_VIRTUAL]]
  #  FreeBSD 3.0, OpenBSD 2.1
  # : [[m:Process::CLOCK_PROF]]
  #  FreeBSD 3.0, OpenBSD 2.1
  # : [[m:Process::CLOCK_REALTIME_FAST]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_REALTIME_PRECISE]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_REALTIME_COARSE]]
  #  Linux 2.6.32
  # : [[m:Process::CLOCK_REALTIME_ALARM]]
  #  Linux 3.0
  # : [[m:Process::CLOCK_MONOTONIC_FAST]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_MONOTONIC_PRECISE]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_MONOTONIC_COARSE]]
  #  Linux 2.6.32
  # : [[m:Process::CLOCK_MONOTONIC_RAW]]
  #  Linux 2.6.28, macOS 10.12
  # : [[m:Process::CLOCK_MONOTONIC_RAW_APPROX]]
  #  macOS 10.12
  # : [[m:Process::CLOCK_BOOTTIME]]
  #  Linux 2.6.39
  # : [[m:Process::CLOCK_BOOTTIME_ALARM]]
  #  Linux 3.0
  # : [[m:Process::CLOCK_UPTIME]]
  #  FreeBSD 7.0, OpenBSD 5.5
  # : [[m:Process::CLOCK_UPTIME_FAST]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_UPTIME_RAW]]
  #  macOS 10.12
  # : [[m:Process::CLOCK_UPTIME_RAW_APPROX]]
  #  macOS 10.12
  # : [[m:Process::CLOCK_UPTIME_PRECISE]]
  #  FreeBSD 8.1
  # : [[m:Process::CLOCK_SECOND]]
  #  FreeBSD 8.1
  # 
  # SUS は Single Unix Specification を意味しており、
  # SUS は POSIX と POSIX の一部で定義されている clock_gettime を含みます。
  # SUS では CLOCK_REALTIME は必須ですが、CLOCK_MONOTONIC, CLOCK_PROCESS_CPUTIME_ID,
  # CLOCK_THREAD_CPUTIME_ID は任意です。
  # 
  # さらに clock_id はいくつかのシンボルを受け付けます。
  # それらは clock_gettime() をエミュレーションします。
  # 
  # たとえば、[[m:Process::CLOCK_REALTIME]] は clock_gettime() がない場合は :GETTIMEOFDAY_BASED_CLOCK_REALTIME と定義されています。
  # 
  # CLOCK_REALTIME のエミュレーション:
  # 
  # : :GETTIMEOFDAY_BASED_CLOCK_REALTIME
  #  SUS で定義されている gettimeofday() を使います。 (しかし SUSv4 で obsoleted になっています)
  #  精度は1マイクロ秒です。
  # : :TIME_BASED_CLOCK_REALTIME
  #  ISO C で定義されている time() を使います。
  #  精度は1秒です。
  # 
  # CLOCK_MONOTONIC のエミュレーション:
  # 
  # : :MACH_ABSOLUTE_TIME_BASED_CLOCK_MONOTONIC
  #  Darwin で利用可能な mach_absolute_time() を使います。
  #  精度は CPU に依存します。
  # : :TIMES_BASED_CLOCK_MONOTONIC
  #  POSIX で定義されている times() の結果を使います。
  #  POSIX では「times() は過去のある時点 (例えばシステムの起動時刻) からの経過クロック数 (clock tick) で実際に経過時間を返します」と定義されています。
  #  例えば GNU/Linux では jiffies に基づいた値を返し、monotonic (単調増加が保証されていて、巻き戻ったりしない) です。
  #  しかし 4.4BSD では gettimeofday() を使い、monotonic ではありません。
  #  (ただし FreeBSD では clock_gettime(CLOCK_MONOTONIC) を代わりに使います。)
  #  精度はクロック数 (clock tick) です。
  #  「getconf CLK_TCK」コマンドで1秒あたりのクロック数を表示できます。
  #  (古いシステムでは、1秒あたりのクロック数は HZ マクロで定義されています。)
  #  もし1秒あたりのクロック数が 100 かつ clock_t が32ビット整数型の場合、精度は10ミリ秒で497日以上を表すことはできません。
  # 
  # CLOCK_PROCESS_CPUTIME_ID のエミュレーション:
  # 
  # : :GETRUSAGE_BASED_CLOCK_PROCESS_CPUTIME_ID
  #  SUS で定義されている getrusage() を使います。
  #  getrusage() を RUSAGE_SELF と一緒に使うと、(子プロセスの時間をのぞいた)
  #  getrusage() を呼び出したプロセスだけの CPU 時間が得られます。
  #  ユーザー時間 (ru_utime) とシステム時間 (ru_stime) を足した結果を返します。
  #  精度は1マイクロ秒です。
  # : :TIMES_BASED_CLOCK_PROCESS_CPUTIME_ID
  #  POSIX で定義されている times() を使います。
  #  ユーザー時間 (tms_utime) と システム時間 (tms_stime) を足した結果を返します。
  #  tms_cutime と tms_cstime は子プロセスの時間を含みません。
  #  精度はクロック数 (clock tick) です。
  #  「getconf CLK_TCK」コマンドで1秒あたりのクロック数を表示できます。
  #  (古いシステムでは、1秒あたりのクロック数は HZ マクロで定義されています。)
  #  もし1秒あたりのクロック数が100なら、精度は10ミリ秒です。
  # : :CLOCK_BASED_CLOCK_PROCESS_CPUTIME_ID
  #  ISO C で定義されている clock() を使います。
  #  精度は 1/CLOCKS_PER_SEC です。
  #  CLOCKS_PER_SEC は time.h で定義されているC言語のマクロです。
  #  SUS では CLOCKS_PER_SEC は 1000000 と定義されています。
  #  ただし、Unix 以外のシステムでは異なる値に定義されているかもしれません。
  #  SUS で定義されているように CLOCKS_PER_SEC が 1000000 なら、精度は1マイクロ秒です。
  #  CLOCKS_PER_SEC が 1000000 かつ clock_t が32ビット整数型の場合、72分以上を表すことはできません。
  # 
  # @param unit 返値の型を指定します。
  # 
  # : :float_second
  #  Float の秒 (デフォルト)
  # : :float_millisecond
  #  Float のミリ秒
  # : :float_microsecond
  #  Float のマイクロ秒
  # : :second
  #  Integer の秒
  # : :millisecond
  #  Integer のミリ秒
  # : :microsecond
  #  Integer のマイクロ秒
  # : :nanosecond
  #  Integer のナノ秒
  # 
  # 基になる関数 clock_gettime() はナノ秒を返します。
  # Float オブジェクト (IEEE 754 double) は CLOCK_REALTIME の結果を表すには不十分です。
  # 正確なナノ秒が必要なら、unit に :nanosecond を使ってください。
  # 
  # 返値のオリジン(0)は様々です。
  # 例えば、システムの起動時刻、プロセス起動時刻、エポックなどです。
  # 
  # CLOCK_REALTIME のオリジンはエポック (1970-01-01 00:00:00 UTC) と定義されています。
  # しかし、システムによってうるう秒をカウントするかどうかが異なります。
  # そのため、結果はシステムによって解釈が異なります。
  # CLOCK_REALTIME よりも [[m:Time.now]] をおすすめします。
  # 
  # @raise Errno::EINVAL clock_id がサポートされていない場合に発生します。
  # 
  # @see [[m:Time.now]]
  def clock_gettime; end

  # --- daemon(nochdir = nil, noclose = nil)    -> 0
  # 
  # プロセスから制御端末を切り離し、
  # バックグラウンドにまわってデーモンとして動作させます。
  # 
  # カレントディレクトリを / に移動します。
  # ただし nochdir に真を指定したときにはこの動作は抑制され、
  # カレントディレクトリは移動しません。
  # 
  # 標準入力・標準出力・標準エラー出力を /dev/null にリダイレクトします。
  # ただし noclose に真を指定したときにはこの動作は抑制され、
  # リダイレクトは行なわれません。
  # 
  # 
  # @param nochdir true を指定した場合、カレントディレクトリを移動しません。
  # 
  # @param noclose true を指定した場合、標準入力・標準出力・標準エラー出力を変更しません。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # @raise Errno::EXXX 失敗した場合に発生します。
  def daemon; end

  # --- detach(pid)    -> Thread
  # 
  # 子プロセス pid の終了を監視するスレッドを生成して返します。
  # 生成したスレッドは子プロセスが終了した後に終了ステータス ([[c:Process::Status]]) を返します。
  # 指定した子プロセスが存在しなければ即座に nil で終了します。
  # 
  # @param pid 子スレッドのプロセス ID を整数で指定します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #     pid = fork {
  #       # child
  #       sleep 3
  #     }
  # 
  #     p pid # => 7762
  #     th = Process.detach(pid)
  #     p th.value
  #     # => #<Process::Status: pid 7762 exit 0>
  def detach; end

  # --- egid    -> Integer
  # 
  # カレントプロセスの実効グループ ID を整数で返します。
  # 
  # @see [[man:getegid(2)]]
  def egid; end

  # --- egid=(gid)
  # 
  # カレントプロセスの実効グループ ID を gid に設定します。
  # 
  # 動作の詳細はプラットフォームに依存します。
  # 実効グループ ID 以外のグループ ID も変更されるかも知れません。
  # 
  # @param gid 実効グループ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 権限がない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[m:Process::GID.#eid=]]
  def egid=; end

  # --- euid        -> Integer
  # 
  # カレントプロセスの実効ユーザ ID を整数で返します。
  # 
  # @see [[man:geteuid(2)]]
  def euid; end

  # --- euid=(uid)
  # 
  # カレントプロセスの実効ユーザ ID を uid に設定します。
  # 
  # 動作の詳細はプラットフォームに依存します。
  # 実効ユーザ ID 以外のユーザ ID も変更されるかも知れません。
  # 
  # @param uid 実効ユーザ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 権限がない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[m:Process::UID.#eid=]]
  def euid=; end

  # --- getpgid(pid)   -> Integer
  # 
  # プロセス ID が pid であるプロセスのプロセスグループ ID を整数で返します。
  # 
  # @param pid プロセス ID を整数で指定します。0 の時はカレントプロセス ID を指定したのと同じです。
  # 
  # @raise Errno::EXXX プロセスグループの取得に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:getpgid(2)]]
  def getpgid; end

  # --- getpgrp            -> Integer
  # 
  # 現在のプロセスのプロセスグループ ID を整数で返します。
  # 
  # @raise Errno::EXXX プロセスグループの取得に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:getpgrp(2)]]
  def getpgrp; end

  # --- getpriority(which, who)    -> Integer
  # 
  # which に従いプロセス、プロセスグループ、ユーザのいずれかの現在のプライオリティを整数で返します。
  # 
  # @param which プライオリティの種類を次の定数で指定します。 [[m:Process::PRIO_PROCESS]],
  #              [[m:Process::PRIO_PGRP]], [[m:Process::PRIO_USER]]。
  # 
  # @param who which の値にしたがってプロセス ID、プロセスグループ ID、ユーザ ID のいずれかを整数で指定します。
  # 
  # @raise Errno::EXXX プライオリティの取得に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:getpriority(2)]]
  def getpriority; end

  # --- getrlimit(resource)    -> [Integer]
  # 
  # カレントプロセスでのリソースの制限値を、整数の配列として返します。
  # 返り値は、現在の制限値 cur_limit と、制限値として設定可能な最大値 max_limit の
  # 配列 [cur_limit, max_limit] です。
  # 
  # それぞれの limit が [[m:Process::RLIM_INFINITY]] と等しい場合、リソースに制限がないことを意味します。
  # 
  # @param resource リソースの種類を示す定数を指定します。指定できる定数はシステムに依存します。
  # 
  # @raise Errno::EXXX リソースの制限値の取得が失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # 引数 resource で有効な定数は以下のとおりです。
  # 
  # : [[m:Process::RLIMIT_CORE]]
  #  core ファイルのサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_CPU]]
  #  プロセスの CPU 時間 (秒) (SUSv3)
  # : [[m:Process::RLIMIT_DATA]]
  #  プロセスのデータ領域のサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_FSIZE]]
  #  プロセスが生成するファイルのサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_NOFILE]]
  #  プロセスがオープンできるファイルの数 (SUSv3)
  # : [[m:Process::RLIMIT_STACK]]
  #  プロセスのスタック領域のサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_AS]]
  #  プロセスの仮想メモリサイズ (バイト) (SUSv3, NetBSD, FreeBSD, OpenBSD but 4.4BSD-Lite))
  # : [[m:Process::RLIMIT_MEMLOCK]]
  #  [[man:mlock(2)]] でロックできるトータルのサイズ (バイト) (4.4BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_NPROC]] 
  #  そのユーザのプロセスの最大数 (4.4BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_RSS]]
  #  使用できる実メモリの最大サイズ (バイト) (4.2BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_SBSIZE]]
  #  ソケットバッファのサイズ (バイト) (NetBSD, FreeBSD)
  # 
  # 例:
  # 
  #  include Process
  #  p lim = getrlimit(RLIMIT_STACK)                                        #=> [8388608, 18446744073709551615]
  #  p lim.map{|i| i == RLIM_INFINITY ? "unlimited" : "#{i/(1024**2)}MB" }  #=> ["8MB", "unlimited"]
  # 
  # @see [[m:Process.#setrlimit]], [[man:getrlimit(2)]]
  def getrlimit; end

  # --- getsid(pid = 0) -> Integer
  # 
  # 引数 pid で指定されたプロセスのセッション ID を返します。
  # 
  # @param pid プロセス ID を整数で指定します。省略した場合、0 を指定した場
  #            合は現在のプロセスの ID を指定した場合と同じ動作になります。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されて
  #                            いない場合に発生します。
  # 
  #   Process.getsid()              # => 27422
  #   Process.getsid(0)             # => 27422
  #   Process.getsid(Process.pid()) # => 27422
  # 
  # @see [[man:getsid(2)]]
  def getsid; end

  # --- gid        -> Integer
  # 
  # カレントプロセスの実グループ ID を返します。
  # 
  # @see [[man:getgid(2)]]
  def gid; end

  # --- gid=(gid)
  # 
  # カレントプロセスの実グループ ID を gid に設定します。
  # 
  # 動作の詳細はプラットフォームに依存します。
  # 実グループ ID 以外のグループ ID も変更されるかも知れません。
  # 
  # @param gid 実グループ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 権限がない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[c:Process::GID]]
  def gid=; end

  # --- groups     -> [Integer]
  # 
  # 補助グループ ID の配列を返します(実効グループ ID を含むかも知れません)。
  # 
  # 返される配列の最大要素数は [[m:Process.#maxgroups]] です。
  # 
  # このメソッドは [[man:getgroups(2)]] の単純なラッパーです。
  # このことは以下の特徴がプラットフォームに依存することを意味します。
  # 
  #  * 結果がソートされているかどうか
  #  * 結果が実効グループ ID を含むかどうか
  #  * グループ ID が重複している可能性があるかどうか
  # 
  # ソート済みで重複のないグループ ID の配列の取得は以下のようにできます:
  # 
  # //emlist[][ruby]{
  # Process.groups.uniq.sort
  # //}
  # 
  # @raise Errno::EXXX [[m:Process.#maxgroups]] が実際に返される補助グループ ID の
  #                    数よりも少ない値を設定していると発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # //emlist[][ruby]{
  # Process.groups   #=> [27, 6, 10, 11]
  # //}
  # 
  # @see [[man:getgroups(2)]]
  def groups; end

  # --- groups=(gids)
  # 
  # 補助グループを設定します。
  # 
  # root だけがこのメソッドを呼ぶことができます。
  # 
  # @param gids 補助グループ ID の配列を指定します。補助グループ ID は整数かグループ名を表す文字列です。
  # 
  # @raise ArgumentError 設定する補助グループ ID の数が [[m:Process.#maxgroups]] の
  #                      数を越えている場合に発生します。
  # 
  # @raise Errno::EXXX 権限がない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:setgroups(2)]]
  def groups=; end

  # --- initgroups(user, group)    -> [Integer]
  # 
  # user が属するグループのリストを更新し、group をそのリストに加えます。
  # 
  # このメソッドを呼ぶには root 権限が必要です。
  # 
  # @param user ユーザ名を表す文字列で指定します。
  # 
  # @param group ユーザグループ ID を整数で指定します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  def initgroups; end

  # --- kill(signal, pid, *rest)    -> Integer
  # 
  # pid で指定されたプロセスにシグナルを送ります。signal
  # はシグナル番号(整数)かその名前(文字列または[[c:Symbol]])で指定します。
  # 全てのシグナル送信に成功した場合、指定した pid の総数を返します。
  # 
  # @param signal シグナルをシグナル番号(整数)かその名前(文字列または[[c:Symbol]])で指定します。負の値を持つシグナル(あるいはシグナル名の前に-)を指定すると、プロセスではなくプロセスグループにシグナルを送ります。
  # 
  # @param pid シグナルを送りたいプロセスのプロセス ID を整数で指定します。ただし、0 以下の場合は以下のような意味になります。
  # 
  #  * 0 の場合はカレントプロセスのプロセスグループにシグナルを送ります。
  #  * -1 の場合はシステム上の全てのプロセスにシグナルを送ります。
  #  * それ以外の負の整数を与えるとプロセスではなくプロセスグループにシグナルを送ります。
  #    負の整数はプロセスグループ ID にマイナスを付けたものと見なされます。
  # 
  # @param rest プロセス ID を整数で指定します。
  # 
  # @raise ArgumentError 存在しないシグナルを指定した場合に発生します。
  # 
  # @raise Errno::EXXX シグナル送信に失敗した場合に発生します。
  # 
  # 
  # @see [[m:Kernel.#trap]], [[man:kill(2)]]
  def kill; end

  # --- maxgroups        -> Integer
  # --- maxgroups=(num)
  # 
  # 設定できる補助グループ ID の数を指定します。
  # 
  # 実際に返される補助グループ ID の数よりも少ない値を設定していると、
  # [[m:Process.#groups]] で例外が発生します。
  # 
  # @param num 整数を指定します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  def maxgroups; end

  # --- pid    -> Integer
  # 
  # カレントプロセスのプロセス ID を返します。変数 [[m:$$]]
  # の値と同じです。
  # 
  # @see [[man:getpid(2)]]
  def pid; end

  # --- ppid    -> Integer
  # 
  # 親プロセスのプロセス ID を返します。UNIX では実際の親プロセスが終
  # 了した後は ppid は 1 (initの pid)になります。
  # 
  # @see [[man:getppid(2)]]
  def ppid; end

  # --- setpgid(pid, pgrp)    -> 0
  # 
  # プロセス ID が pid であるプロセスのプロセスグループを pgrp に設定します。
  # 
  # @param pid プロセス ID を整数で指定します。pid が 0 の時はカレントプロセスの ID を指定したのと同じです。
  #            プロセスグループの設定に成功した場合は 0 を返します。
  # 
  # @param pgrp プロセスグループ ID を整数で指定します。pgrp が 0 の時は pid を指定したのと同じです。
  # 
  # @raise Errno::EXXX プロセスグループの設定に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:setpgid(2)]]
  def setpgid; end

  # --- setpgrp    -> 0
  # 
  # カレントプロセスの ID と同じ ID をもつプロセスグループを作成し、カレントプロセスをそのリーダーにします。
  # [[m:Process.#setpgid]](0, 0) と同じです。
  # 
  # @raise Errno::EXXX プロセスグループの設定に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #  fork do
  #    p [Process.pid, Process.getpgrp]
  #    p Process.setpgrp
  #    p [Process.pid, Process.getpgrp]
  #  end
  #  Process.wait
  #  #=>
  #    [3427, 3426]
  #    0
  #    [3427, 3427]
  # 
  # @see [[man:setpgrp(2)]]
  def setpgrp; end

  # --- setpriority(which, who, prio)    -> 0
  # 
  # プロセス、プロセスグループ、
  # ユーザのいずれかの現在のプライオリティを設定します
  # 。プライオリティの設定に成功した場合は 0 を返します。
  # 
  # @param which プライオリティを設定する対象の種類を以下の定数のいずれかで指定します。
  # 
  #  * [[m:Process::PRIO_PROCESS]]
  #  * [[m:Process::PRIO_PGRP]]
  #  * [[m:Process::PRIO_USER]] 
  # 
  # @param who which の値にしたがってプロセス ID、プロセスグループ ID、ユーザ ID のいずれかを整数で指定します。
  # 
  # @param prio プライオリティを -20 から 20 までの整数で設定します。小さな値はプライオリティが高いことを意味し、大きな値はプライオリティが低いことを意味します。
  # 
  # @raise Errno::EXXX プライオリティの設定に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # 以下の例は呼び出したプロセス自身のプライオリティを 10 に下げます。
  # すでに 10 よりもプライオリティが低く、
  # Errno::EACCES となった場合には無視して実行を続けます。
  # 
  #   begin
  #     Process.setpriority(Process::PRIO_PROCESS, 0, 10)
  #   rescue Errno::EACCES
  #   end
  # 
  # @see [[man:setpriority(2)]]
  def setpriority; end

  # --- setproctitle(title) -> String
  # 
  # [[man:ps(1)]] が出力する現在実行中の Ruby スクリプトの名前を引数 title
  # で指定した文字列に変更します。
  # 
  # OS によっては何も行われません。また、処理結果に関係なく例外は発生しませ
  # ん。サポートされる OS ではない場合であっても [[c:NotImplementedError]]
  # が発生する事はありません。本メソッドを実行しても [[m:$0]] への影響はあ
  # りません。
  # 
  #    Process.setproctitle('myapp: worker #%d' % worker_id)
  # 
  # 本メソッドは 2.1 以降でグローバル変数を用いないで現在実行中の Ruby スク
  # リプトの名前を表す文字列を設定する手段として提供されました。
  # 
  # @see [[m:Process.#argv0]], [[m:$0]]
  def setproctitle; end

  # --- setrlimit(resource, cur_limit, max_limit)    -> nil
  # --- setrlimit(resource, limit)                   -> nil
  # 
  # カレントプロセスでのリソースの制限値を設定します。
  # 
  # @param resource リソースの種類を示す定数を指定します。指定できる定数はシステムに依存します。
  # 
  # @param limit resource によって意味が決まる制限値を表す整数もしくは定数を指定します。
  #              soft limit と hard limit 両方にこの値が使われます。
  # 
  # @param cur_limit 現在の制限値(soft limit)を表す整数もしくは定数を指定します。
  # 
  # @param max_limit soft limit として設定可能な最大値(hard limit)を表す整数もしくは定数を指定します。
  # 
  # @raise Errno::EXXX リソースの制限値の設定に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # 引数 resource で有効な定数は以下のとおりです。
  # 
  # : [[m:Process::RLIMIT_CORE]]
  #  core ファイルのサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_CPU]]
  #  プロセスの CPU 時間 (秒) (SUSv3)
  # : [[m:Process::RLIMIT_DATA]]
  #  プロセスのデータ領域のサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_FSIZE]]
  #  プロセスが生成するファイルのサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_NOFILE]]
  #  プロセスがオープンできるファイルの数 (SUSv3)
  # : [[m:Process::RLIMIT_STACK]]
  #  プロセスのスタック領域のサイズ (バイト) (SUSv3)
  # : [[m:Process::RLIMIT_AS]]
  #  プロセスの仮想メモリサイズ (バイト) (SUSv3, NetBSD, FreeBSD, OpenBSD but 4.4BSD-Lite))
  # : [[m:Process::RLIMIT_MEMLOCK]]
  #  [[man:mlock(2)]] でロックできるトータルのサイズ (バイト) (4.4BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_NPROC]]
  #  そのユーザのプロセスの最大数 (4.4BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_RSS]]
  #  使用できる実メモリの最大サイズ (バイト) (4.2BSD, GNU/Linux)
  # : [[m:Process::RLIMIT_SBSIZE]]
  #  ソケットバッファのサイズ (バイト) (NetBSD, FreeBSD)
  # 
  # 引数 limit, cur_limit, max_limit で有効な定数は以下のとおりです。
  # 
  #  * [[m:Process::RLIM_INFINITY]] リソースに制限を設けないことを意味します。
  #  * [[m:Process::RLIM_SAVED_CUR]]
  #  * [[m:Process::RLIM_SAVED_MAX]]
  # 
  # 以下の例は RLIMIT_CORE の制限を hard limit (max limit) まで引き上げ、可能なら core を残すようにします。
  # 
  #   Process.setrlimit(Process::RLIMIT_CORE, 
  #                     Process.getrlimit(Process::RLIMIT_CORE)[1])
  # 
  # @see [[man:setrlimit(2)]]
  def setrlimit; end

  # --- setsid    -> Integer
  # 
  # 新しいセッションを作成して、tty を切り離します。デーモンを簡単に作
  # ることができます。セッション ID を返します。
  # 
  # @raise Errno::EXXX セッションの作成に失敗した場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:setsid(2)]]
  def setsid; end

  # --- times    -> Process::Tms
  # 
  # 自身のプロセスとその子プロセスが消費したユーザ/システム CPU 時間の積算を
  # [[c:Process::Tms]] オブジェクトで返します。
  # 時間の単位は秒で、浮動小数点数で与えられます。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[c:Process::Tms]]
  def times; end

  # --- uid        -> Integer
  # 
  # プロセスの実ユーザ ID を返します。
  # 
  # @see [[man:getuid(2)]]
  def uid; end

  # --- uid=(id)
  # 
  # プロセスの実ユーザ ID を id に設定します。
  # 
  # 動作の詳細はプラットフォームに依存します。
  # 実ユーザ ID 以外のユーザ ID も変更されるかも知れません。
  # 
  # @param id 実ユーザ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 権限がない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[c:Process::UID]]
  def uid=; end

  # --- wait(pid = -1, flags = 0)       -> Integer | nil
  # --- wait2(pid = -1, flags = 0)      -> [Integer, Process::Status] | nil
  # --- waitpid(pid = -1, flags = 0)    -> Integer | nil
  # --- waitpid2(pid = -1, flags = 0)   -> [Integer, Process::Status] | nil
  # 
  # pid で指定される特定の子プロセスの終了を待ち、そのプロセスが
  # 終了した時に pid を返します。
  # wait2, waitpid2 は子プロセスの pid と終了ステータスを表す
  # [[c:Process::Status]] オブジェクトの配列を返します。
  # ノンブロッキングモードで子プロセスがまだ終了していない時には
  # nil を返します。
  # 
  # [[m:$?]] に終了した子プロセスの [[c:Process::Status]] オブジェクトがセットされます。
  # 
  # @param pid 子プロセスのプロセス ID を整数で指定します。
  #        0 以上なら指定されたプロセス ID の子プロセスを待ちます。
  #        0 なら呼び出し元のプロセスとプロセスグループ ID が同じ任意の子プロセスを待ちます。
  #        -1 (省略時のデフォルト) は任意の子プロセスを待ちます。
  #        -1 未満なら pid の絶対値とプロセスグループ ID が同じ任意の子プロセスを待ちます。
  # 
  # @param flags Process モジュールの定数 [[m:Process::WNOHANG]](ノンブロッキングモード)と
  #              [[m:Process::WUNTRACED]] の論理和を指定します。省略したときの値は 0 です。
  #              ノンブロッキングモードで子プロセスがまだ終了していない時には
  #              nil を返します。[[man:waitpid(2)]] か [[man:wait4(2)]] の実装されていないマシンでは
  #              flags はいつも nil または 0 を指定する必要があります。
  # 
  # @raise Errno::ECHILD 子プロセスが存在しない場合に発生します。
  # 
  # //emlist[][ruby]{
  # pid = fork { sleep 1 }
  # Process.wait2 # => [70024, #<Process::Status: pid 70024 exit 0>]
  # //}
  # 
  # @see [[man:wait(2)]], [[man:waitpid(2)]]
  def wait; end

  # --- waitall    -> [[Integer, Process::Status]]
  # 
  # 全ての子プロセスが終了するのを待ちます。
  # 終了した子プロセスの pid と終了ステータス
  # ([[c:Process::Status]]) の配列の配列を返します。
  # 子プロセスがいない状態でこのメソッドを呼び出すと空の配列を返します。
  # 
  # [[m:$?]] には最後に終了した子プロセスの [[c:Process::Status]] オブジェクトが設定されます。
  # 
  #     2.times {|n|
  #       Process.fork() { exit n }
  #     }
  #     p Process.waitall
  #     #=> [[2766, #<Process::Status: pid=2766,exited(1)>], [2765, #<Process::Status: pid=2765,exited(1)>]]
  def waitall; end

  # --- abort            -> ()
  # --- abort(message)   -> ()
  # 
  # 関数 [[m:Kernel.#abort]] と同じです。
  # 
  # @param message 終了時のメッセージを文字列で指定します。
  def abort; end

  # --- exec(command, *args) -> ()
  # 
  # カレントプロセスを与えられた外部コマンドで置き換えます。
  # 
  # 
  # === 引数の解釈
  # 
  # 引数が一つだけ与えられた場合、command が shell のメタ文字
  # //emlist{
  #   * ? {} [] <> () ~ & | \ $ ; ' ` " \n
  # //}
  # を含む場合、shell 経由で実行されます。
  # そうでなければインタプリタから直接実行されます。
  # 
  # 引数が複数与えられた場合、第 2 引数以降は command に直接渡され、
  # インタプリタから直接実行されます。
  # 
  # 第 1 引数が 2 要素の配列の場合、第 1 要素の文字列が実際に起動する
  # プログラムのパスで、第 2 要素が「みせかけ」のプログラム名になります。
  # 
  # MSDOS 環境の場合、command はサブシェル経由で実行されます。
  # そうでない場合、command は [[man:exec(2)]] を使用して実行されるので元の
  # プログラムからいくつかの環境を引き継ぎます。
  # 
  # @param command 実行する外部コマンド。
  # 
  # @param args command に渡す引数。
  # 
  #    exec "echo *"       # echoes list of files in current directory
  #    # never get here
  # 
  # 
  #    exec "echo", "*"    # echoes an asterisk
  #    # never get here
  def exec; end

  # --- exit(status = true)    -> ()
  # 
  # プロセスを終了します。関数 [[m:Kernel.#exit]] と同じです。
  # 
  # @param status 終了ステータスを boolean か整数で指定します。true の場合は成功を、false は失敗を意味します。
  # 
  # @see [[man:exit(3)]]
  def exit; end

  # --- exit!(status = false)    -> ()
  # 
  # 関数 [[m:Kernel.#exit!]] と同じです。
  # 
  # @param status 終了ステータスを boolean か整数で指定します。true の場合は成功を、false は失敗を意味します。
  # 
  # @see [[man:_exit(2)]]
  def exit!; end

  # --- fork            -> Integer | nil
  # --- fork { ... }    -> Integer | nil
  # 
  # 子プロセスを生成します。関数 [[m:Kernel.#fork]] と同じです。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  # @see [[man:fork(2)]]
  def fork; end

  # --- last_status -> Process::Status | nil
  # カレントスレッドで最後に終了した子プロセスのステータスを返します。
  # 
  # 変数 [[m:$?]] の値と同じです。
  # 
  #    Process.wait Process.spawn("ruby", "-e", "exit 13")
  #    Process.last_status   # => #<Process::Status: pid 4825 exit 13>
  # 
  # カレントスレッドで子プロセスを実行したことがない場合は nil を返します。
  # 
  #    Process.last_status   # => nil
  # 
  # @see [[c:Process::Status]]
  # @see [[m:$?]]
  def last_status; end

  # --- spawn(cmd, *arg)    -> Integer
  # 
  # 関数 [[m:Kernel.#spawn]] と同じです。
  # 
  # @param cmd [[m:Kernel.#spawn]] と同じです。
  # 
  # @param arg [[m:Kernel.#spawn]] と同じです。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  def spawn; end

  # --- CLOCK_BOOTTIME -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_BOOTTIME; end

  # --- CLOCK_BOOTTIME_ALARM -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_BOOTTIME_ALARM; end

  # --- CLOCK_MONOTONIC -> Integer | Symbol
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては :MACH_ABSOLUTE_TIME_BASED_CLOCK_MONOTONIC です。
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC; end

  # --- CLOCK_MONOTONIC_COARSE -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC_COARSE; end

  # --- CLOCK_MONOTONIC_FAST -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC_FAST; end

  # --- CLOCK_MONOTONIC_PRECISE -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC_PRECISE; end

  # --- CLOCK_MONOTONIC_RAW -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC_RAW; end

  # --- CLOCK_MONOTONIC_RAW_APPROX -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_MONOTONIC_RAW_APPROX; end

  # --- CLOCK_PROCESS_CPUTIME_ID -> Integer | Symbol
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては :GETRUSAGE_BASED_CLOCK_PROCESS_CPUTIME_ID です。
  # システムによっては定義されていません。
  def CLOCK_PROCESS_CPUTIME_ID; end

  # --- CLOCK_PROF -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_PROF; end

  # --- CLOCK_REALTIME -> Integer | Symbol
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては :GETTIMEOFDAY_BASED_CLOCK_REALTIME です。
  # システムによっては定義されていません。
  def CLOCK_REALTIME; end

  # --- CLOCK_REALTIME_ALARM -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_REALTIME_ALARM; end

  # --- CLOCK_REALTIME_COARSE -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_REALTIME_COARSE; end

  # --- CLOCK_REALTIME_FAST -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_REALTIME_FAST; end

  # --- CLOCK_REALTIME_PRECISE -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_REALTIME_PRECISE; end

  # --- CLOCK_SECOND -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_SECOND; end

  # --- CLOCK_THREAD_CPUTIME_ID -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_THREAD_CPUTIME_ID; end

  # --- CLOCK_UPTIME -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_UPTIME; end

  # --- CLOCK_UPTIME_FAST -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_UPTIME_FAST; end

  # --- CLOCK_UPTIME_PRECISE -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_UPTIME_PRECISE; end

  # --- CLOCK_UPTIME_RAW -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_UPTIME_RAW; end

  # --- CLOCK_UPTIME_RAW_APPROX -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_UPTIME_RAW_APPROX; end

  # --- CLOCK_VIRTUAL -> Integer
  # 
  # [[m:Process.#clock_gettime]] で使われます。
  # 
  # システムによっては定義されていません。
  def CLOCK_VIRTUAL; end

  # --- PRIO_PGRP -> Integer
  # 
  # 対象とするプライオリティがプロセスグループプライオリティであることを表す定数です。
  # 
  # [[m:Process.#getpriority]] または [[m:Process.#setpriority]] で使われます。
  def PRIO_PGRP; end

  # --- PRIO_PROCESS -> Integer
  # 
  # 対象とするプライオリティがプロセスプライオリティであることを表す定数です。
  # 
  # [[m:Process.#getpriority]] または [[m:Process.#setpriority]] で使われます。
  def PRIO_PROCESS; end

  # --- PRIO_USER -> Integer
  # 
  # 対象とするプライオリティがユーザプライオリティであることを表す定数です。
  # 
  # [[m:Process.#getpriority]] または [[m:Process.#setpriority]] で使われます。
  def PRIO_USER; end

  # --- RLIMIT_AS -> Integer
  # 
  # リソースの種類がプロセスの仮想メモリサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_AS; end

  # --- RLIMIT_CORE -> Integer
  # 
  # リソースの種類が core ファイルのサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_CORE; end

  # --- RLIMIT_CPU -> Integer
  # 
  # リソースの種類がプロセスの CPU 時間であることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_CPU; end

  # --- RLIMIT_DATA -> Integer
  # 
  # リソースの種類がプロセスのデータ領域のサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_DATA; end

  # --- RLIMIT_FSIZE -> Integer
  # 
  # リソースの種類がプロセスが生成するファイルのサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_FSIZE; end

  # --- RLIMIT_MEMLOCK -> Integer
  # 
  # リソースの種類が [[man:mlock(2)]] でロックできるトータルのサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_MEMLOCK; end

  # --- RLIMIT_NOFILE -> Integer
  # 
  # リソースの種類がプロセスがオープンできるファイルの数であることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_NOFILE; end

  # --- RLIMIT_NPROC -> Integer
  # 
  # リソースの種類がユーザのプロセスの最大数であることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_NPROC; end

  # --- RLIMIT_RSS -> Integer
  # 
  # リソースの種類が使用できる実メモリの最大サイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_RSS; end

  # --- RLIMIT_SBSIZE -> Integer
  # 
  # リソースの種類がソケットバッファのサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_SBSIZE; end

  # --- RLIMIT_STACK -> Integer
  # 
  # リソースの種類がプロセスのスタック領域のサイズであることを示す定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  # システムによっては定義されていません。
  def RLIMIT_STACK; end

  # --- RLIM_INFINITY -> Integer
  # 
  # リソースに制限がないことを意味する定数です。
  # 
  # [[m:Process.#getrlimit]]、[[m:Process.#setrlimit]] で使われます。
  def RLIM_INFINITY; end

  # --- RLIM_SAVED_CUR -> Integer
  # 
  # [[m:Process.#getrlimit]], [[m:Process.#setrlimit]] で使われます。詳しくは [[man:setrlimit(2)]] を参照して下さい。
  def RLIM_SAVED_CUR; end

  # --- RLIM_SAVED_MAX -> Integer
  # 
  # [[m:Process.#getrlimit]], [[m:Process.#setrlimit]] で使われます。詳しくは [[man:setrlimit(2)]] を参照して下さい。
  def RLIM_SAVED_MAX; end

  # --- WNOHANG -> Integer
  # 
  # [[m:Process.#waitpid]] の第二引数に指定するフラグです。
  # 終了した子プロセスがない時でも waitpid がブロックしません。
  def WNOHANG; end

  # --- WUNTRACED -> Integer
  # 
  # [[m:Process.#waitpid]] の第二引数に指定するフラグです。
  # このフラグが指定された場合、waitpid は停止しているだけで
  # 終了していない子プロセスのプロセス ID も返すようになります。
  # trace されている子プロセスの ID は返しません。
  # 
  #  include Process
  #  pid = fork{ Process.kill('SIGSTOP', Process.pid) }
  #  p pid                          #=> 4336
  #  p waitpid2(pid, WUNTRACED)     #=> [4336, #<Process::Status: pid=4336,stopped(SIGSTOP=19)>]
  # 
  # @see [[man:waitpid(2)]]
  def WUNTRACED; end

end
