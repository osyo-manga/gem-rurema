class IO
  # --- <<(object)    -> self
  # 
  # object を出力します。object が文字列でない時にはメソッ
  # ド to_s を用いて文字列に変換します。
  # 
  # 以下のような << の連鎖を使うことができます。
  # 
  #   STDOUT << 1 << " is a " << Integer << "\n"
  # 
  # @param object 出力したいオブジェクトを与えます。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  def <<; end

  # --- advise(advice, offset=0, len=0) -> nil
  # 
  # [[man:posix_fadvise(2)]] を呼びだし、
  # ファイルへのアクセスパターンをOSに知らせます。
  # 
  # advice には以下のいずれかのシンボルを指定します。
  #   * :normal - デフォルト
  #   * :sequential - データは前から順にアクセスされる
  #   * :random - データはランダムアクセスされる
  #   * :willneed - データはこの直後にアクセスされる
  #   * :dontneed - データは直後にはアクセスしない
  #   * :noreuse - データは一度しかアクセスされない
  # これらの advice が具体的に何をするのかはプラットフォーム依存です。
  # 
  # ここでいう「データ」は offset と len で特定することができます。
  # len が 0 ならば、offset からファイル末尾までを指定したことになります。
  # デフォルトでは offset と len がともに 0 なので、
  # ファイル全体を指定したことになります。
  # 
  # posix_fadvise をサポートしていないプラットフォーム上では
  # 何もしません。
  # 
  # @param advice アクセスパターンを表すシンボル
  # @param offset パターンを指定するデータの先頭位置
  # @param len パターンを指定するデータの長さ
  # 
  # @raise IOError ストリームが既に閉じられているときに発生する例外
  # @raise Errno::EBADF ファイルデスクリプタが不正であるときに発生する例外
  # @raise Errno::EINVAL advice が不正
  # @raise Errno::ESPIPE ファイルデスクリプタが FIFO か pipe を指している
  #        場合に発生する例外(Linux はこの場合には Errno::EINVAL を発生する)
  # @raise RangeError offset,lenが有効範囲から出ている場合に発生する例外
  # 
  # //emlist[例][ruby]{
  # File.open("testfile") { |f| p f.advise(:sequential) } # => nil
  # //}
  def advise; end

  # --- autoclose=(bool)
  # 
  # auto-close フラグを設定します。
  # 
  # フラグが設定されているオブジェクトは
  # close時/GCでのファイナライザ呼出時にファイルデスクリプタを close します。
  # 偽を設定すると close しません。
  # 
  # @param bool 真偽値でフラグを設定します
  # @see [[m:IO#autoclose?]]
  # 
  #    f = open("/dev/null")
  #    IO.for_fd(f.fileno)
  #    # ...
  #    f.gets # may cause Errno::EBADF
  # 
  #    f = open("/dev/null")
  #    IO.for_fd(f.fileno).autoclose = false
  #    # ...
  #    f.gets # won't cause Errno::EBADF
  def autoclose=; end

  # --- autoclose? -> bool
  # 
  # auto-close フラグを返します。
  # 
  # //emlist[例][ruby]{
  # IO.open(IO.sysopen("testfile")) do |io|
  #   io.autoclose?         # => true
  #   io.autoclose = false
  #   io.autoclose?         # => false
  # end
  # //}
  # 
  # @see [[m:IO#autoclose=]]
  def autoclose?; end

  # --- binmode    -> self
  # 
  # ストリームをバイナリモードにします。MSDOS などバイナリモードの存在
  # する OS でのみ有効です。そうでない場合このメソッドは何もしません。
  # 
  # バイナリモードから通常のモードに戻す方法は再オープンしかありません。
  # 
  # @raise Errno::EXXX モードの変更に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.open(IO.sysopen("testfile", "w+")) do |io|
  #   io.binmode? # => false
  #   io.binmode  # => #<IO:fd 8>
  #   io.binmode? # => true
  # end
  # //}
  # 
  # @see [[ref:c:IO#io_binmode]], [[m:IO#binmode?]]
  def binmode; end

  # --- binmode? -> bool
  # 
  # 自身がバイナリモードなら true を返します。そうでない場合、false を返します。
  # 
  # 
  # @see [[ref:c:IO#io_binmode]], [[m:IO#binmode]]
  def binmode?; end

  # --- bytes {|ch| ... }        -> self
  # --- bytes                    -> Enumerator
  # 
  # このメソッドは obsolete です。
  # 代わりに [[m:IO#each_byte]] を使用してください。
  # 使用すると警告メッセージが表示されます。
  # 
  # IO の現在位置から 1 バイトずつ読み込み、それを整数として与え、ブロックを実行します。
  # 
  # ブロックが与えられなかった場合は、自身から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # バイナリ読み込みメソッドとして動作します。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # 
  # @see [[m:IO#each_byte]]
  def bytes; end

  # --- chars{|c| ... }         -> self
  # --- chars                   -> Enumerator
  # 
  # このメソッドは obsolete です。
  # 代わりに [[m:IO#each_char]] を使用してください。
  # 
  # 使用すると警告メッセージが表示されます。
  # 
  # self に含まれる文字を一文字ずつブロックに渡して評価します。
  # 
  # self は読み込み用にオープンされていなければなりません。
  # 
  # ブロックを省略した場合は各文字について繰り返す [[c:Enumerator]] を返します。
  # 
  # @raise IOError self が読み込み用にオープンされていない場合に発生します。
  # 
  # 
  # @see [[m:IO#each_char]]
  def chars; end

  # --- clone    -> IO
  # --- dup      -> IO
  # 
  # レシーバと同じ IO を参照する新しい IO オブジェクトを返します。
  # 参照しているファイル記述子は [[man:dup(2)]] されます。
  # 
  # clone の際に self は一旦 [[m:IO#flush]] されます。
  # フリーズした IO の clone は同様にフリーズされた IO を返しますが、
  # dup は内容の等しいフリーズされていない IO を返します。
  # 
  # @raise IOError 既に close されていた場合に発生します。 
  # 
  # //emlist[例][ruby]{
  # clone_io = nil
  # IO.write("testfile", "test")
  # File.open("testfile") do |io|
  #   clone_io = io.clone
  # end
  # clone_io.read # => "test"
  # clone_io.close
  # //}
  def clone; end

  # --- close    -> nil
  # 
  # 入出力ポートをクローズします。
  # 
  # 以後このポートに対して入出力を行うと例外 [[c:IOError]] が発生しま
  # す。ガーベージコレクトの際にはクローズされていない IO ポートはクロー
  # ズされます。
  # self がパイプでプロセスにつながっていれば、そのプロセスの終
  # 了を待ち合わせます。
  # 
  # 既に close されていた場合には単に無視されます。
  # 
  # @raise Errno::EXXX close に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # f = File.open("testfile")
  # f.read   # => "test"
  # f.close
  # # f.read # => IOError (すでに close しているので read できない)
  # //}
  # 
  # @see [[m:IO#closed?]], [[m:IO#close_read]], [[m:IO#close_write]]
  def close; end

  # --- close_on_exec=(bool)
  # 自身に close-on-exec フラグを設定します。
  # 
  # このフラグをセットすると [[man:exec(2)]] 時にそのファイルデスクリプタを
  # close します。
  # 
  # @see [[man:fcntl(2)]]
  # @param bool 自身の close-on-exec フラグを true か false で指定します。
  # 
  #    f = open("/dev/null")
  #    f.close_on_exec = true
  #    system("cat", "/proc/self/fd/#{f.fileno}") # cat: /proc/self/fd/3: No such file or directory
  #    f.closed?                #=> false
  # 
  # @see [[m:IO#close_on_exec?]]
  def close_on_exec=; end

  # --- close_on_exec?   -> bool
  # 自身に close-on-exec フラグが設定されていた場合 true を返します。
  # そうでない場合に false を返します。
  # 
  #    f = open("/dev/null")
  #    f.close_on_exec?                 #=> true
  #    f.close_on_exec = false
  #    f.close_on_exec?                 #=> false
  #    f.close_on_exec = true
  #    f.close_on_exec?                 #=> true
  # 
  # @see [[m:IO#close_on_exec=]]
  def close_on_exec?; end

  # --- close_read    -> nil
  # 
  # 読み込み用の IO を close します。主にパイプや読み書き両用に作成し
  # た IO オブジェクトで使用します。
  # 
  # 既に close されていた場合には単に無視されます。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX close に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.popen("/bin/sh","r+") do |f|
  #   f.close_read
  #   # f.readlines # => IOError: not opened for reading
  # end
  # //}
  # 
  # @see [[m:IO#close]], [[m:IO#closed?]], [[m:IO#close_write]]
  def close_read; end

  # --- close_write    -> nil
  # 
  # 書き込み用の IO を close します。
  # 
  # 既に close されていた場合には単に無視されます。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX close に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # f = IO.popen("/bin/sh","r+") do |f|
  #   f.close_write
  #   # f.print "nowhere" # => IOError: not opened for writing
  # end
  # //}
  # 
  # @see [[m:IO#close]], [[m:IO#closed?]], [[m:IO#close_read]]
  def close_write; end

  # --- closed?    -> bool
  # 
  # self が完全に(読み込み用と書き込み用の両方が)クローズされている場合に true を返します。
  # そうでない場合は false を返します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # f = File.new("testfile")
  # f.close         # => nil
  # f.closed?       # => true
  # f = IO.popen("/bin/sh","r+")
  # f.close_write   # => nil
  # f.closed?       # => false
  # f.close_read    # => nil
  # f.closed?       # => true
  # //}
  # 
  # @see [[m:IO#close]], [[m:IO#close_read]], [[m:IO#close_write]]
  def closed?; end

  # --- codepoints{|c| ... }         -> self
  # --- codepoints                   -> Enumerator
  # 
  # このメソッドは obsolete です。
  # 代わりに [[m:IO#each_codepoint]] を使用してください。
  # 
  # 使用すると警告メッセージが表示されます。
  # 
  # IO の各コードポイントに対して繰り返しブロックを呼びだします。
  # 
  # ブロックの引数にはコードポイントを表す整数が渡されます。
  # 
  # ブロックを省略した場合には、[[c:Enumerator]] を返します。
  # 
  # 
  # @see [[m:IO#each_codepoint]]
  def codepoints; end

  # --- cooked {|io| ... } -> object
  # 
  # cooked モードを有効にして指定されたブロックを評価します。
  # 
  # ブロック引数には self が渡されます。ブロックを評価した結果を返します。
  # 
  # @raise LocalJumpError ブロックを指定しなかった場合に発生します。
  # 
  # 以下の例では、標準入力からエコーバック付きで文字列を一行読み込みます。
  # 
  #   require "io/console"
  #   STDIN.cooked(&:gets)
  def cooked; end

  # --- cooked! -> self
  # 
  # cooked モードを有効にします。端末のモードを後で元に戻す必要がある場合は
  # [[m:IO#cooked]] を使用してください。
  # 
  # @return 自身を返します。
  # 
  # @see [[m:IO#cooked]]
  def cooked!; end

  # --- each(rs = $/, chomp: false) {|line| ... }         -> self
  # --- each(limit, chomp: false) {|line| ... }           -> self
  # --- each(rs, limit, chomp: false) {|line| ... }       -> self
  # --- each(rs = $/, chomp: false)                       -> Enumerator
  # --- each(limit, chomp: false)                         -> Enumerator
  # --- each(rs, limit, chomp: false)                     -> Enumerator
  # --- each_line(rs = $/, chomp: false) {|line| ... }    -> self
  # --- each_line(limit, chomp: false) {|line| ... }      -> self
  # --- each_line(rs, limit, chomp: false) {|line| ... }  -> self
  # --- each_line(rs = $/, chomp: false)                  -> Enumerator
  # --- each_line(limit, chomp: false)                    -> Enumerator
  # --- each_line(rs, limit, chomp: false)                -> Enumerator
  # 
  # IO の現在位置から 1 行ずつ文字列として読み込み、それを引数として
  # 与えられたブロックを実行します。
  # 
  # ブロックが与えられなかった場合は、自身から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # limit で最大読み込みバイト数を指定します。ただしマルチバイト文字が途中で
  # 切れないように余分に読み込む場合があります。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。
  #           空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # @param chomp true を指定すると各行の末尾から "\n", "\r", または "\r\n" を取り除きます。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # //emlist[例: 引数なし][ruby]{
  # IO.write("testfile", "This is line one,\nThis is line two,\nThis is line three,\nAnd so on...")
  # f = File.new("testfile")
  # f.each { |line| p "#{f.lineno}: #{line}" }
  # # => "1: This is line one,\n"
  # # "2: This is line two,\n"
  # # "3: This is line three,\n"
  # # "4: And so on..."
  # //}
  # //emlist[例: 行の区切りに半角カンマ、最大読み取りバイト数に 10 を指定][ruby]{
  # IO.write("testfile", "This is line one,This is line two,This is line three,And so on...")
  # f = File.new("testfile")
  # f.each(",", 10) { |line| p "#{f.lineno}: #{line}" }
  # # => "0: This is li"
  # # "1: ne one,"
  # # "1: This is li"
  # # "2: ne two,"
  # # "2: This is li"
  # # "3: ne three,"
  # # "3: And so on."
  # # "4: .."
  # //}
  # //emlist[例: chomp = true][ruby]{
  # IO.write("testfile", "This is line one\nThis is line two\nThis is line three\nAnd so on...")
  # f = File.new("testfile")
  # f.each(chomp: true) { |line| p "#{f.lineno}: #{line}" }
  # # => "1: This is line one"
  # # "2: This is line two"
  # # "3: This is line three"
  # # "4: And so on..."
  # //}
  # 
  # @see [[m:$/]], [[m:IO#gets]]
  def each; end

  # --- each_byte {|ch| ... }    -> self
  # --- each_byte                -> Enumerator
  # 
  # IO の現在位置から 1 バイトずつ読み込み、それを整数として与え、ブロックを実行します。
  # 
  # ブロックが与えられなかった場合は、自身から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # バイナリ読み込みメソッドとして動作します。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "aあ")
  # File.open("testfile") do |io|
  #   io.each_byte { |x| p x }
  #   # => 97
  #   # 227
  #   # 129
  #   # 130
  # end
  # //}
  def each_byte; end

  # --- each_char{|c| ... }     -> self
  # --- each_char               -> Enumerator
  # 
  # self に含まれる文字を一文字ずつブロックに渡して評価します。
  # 
  # self は読み込み用にオープンされていなければなりません。
  # 
  # ブロックを省略した場合は各文字について繰り返す [[c:Enumerator]] を返します。
  # 
  # @raise IOError self が読み込み用にオープンされていない場合に発生します。
  # 
  #   f = File.new("testfile")
  #   f.each_char {|c| print c, ' ' }   #=> #<File:testfile>
  def each_char; end

  # --- each_codepoint{|c| ... }     -> self
  # --- each_codepoint               -> Enumerator
  # 
  # IO の各コードポイントに対して繰り返しブロックを呼びだします。
  # 
  # ブロックの引数にはコードポイントを表す整数が渡されます。
  # 
  # ブロックを省略した場合には、[[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "abcdeあ")
  # File.open("testfile") do |f|
  #   f.each_codepoint { |i| p i }
  # end
  # # => 97
  # # 98
  # # 99
  # # 100
  # # 101
  # # 12354
  # //}
  def each_codepoint; end

  # --- echo=(flag)
  # 
  # 文字入力時のエコーバックが有効かどうかを設定します。
  # 
  # @param flag true を指定した場合、文字入力時のエコーバックが有効に設定さ
  #             れます。
  def echo=; end

  # --- echo? -> bool
  # 
  # 文字入力時のエコーバックが有効かどうかを返します。
  def echo?; end

  # --- eof     -> bool
  # --- eof?    -> bool
  # 
  # ストリームがファイルの終端に達した場合、true を返します。そうでない場合、false を返します。
  # 
  #    f = File.new("testfile")
  #    dummy = f.readlines
  #    f.eof   #=> true
  # 
  # 自身がパイプやソケットなどのストリームであった場合、相手がデータを送るか close するまでブロックします。
  # 
  #    r, w = IO.pipe
  #    Thread.new { sleep 10; w.close }
  #    r.eof?  #=> 10秒ブロックしてから true を返す。
  # 
  #    r, w = IO.pipe
  #    Thread.new { sleep 10; w.puts "a" }
  #    r.eof?  #=> 10秒ブロックしてから false を返す。
  # 
  #    r, w = IO.pipe
  #    r.eof?  # 永久にブロックします。
  # 
  # eof, eof? は入力バッファにデータを読み込むので、[[m:IO#sysread]] と同時に使うと正常に
  # 動作しません。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  def eof; end

  # --- expect(pattern, timeout = 9999999) -> Array | nil
  # --- expect(pattern, timeout = 9999999){|array| ... } -> nil
  # 
  # レシーバから指定したパターンを読み込むまで待ちます。
  # 
  # このメソッドがブロックなしで呼ばれた場合、まずレシーバである
  # IO オブジェクトから pattern にマッチするパターンが読みこまれる
  # まで待ちます。
  # 
  # このメソッドをブロック付きで呼びだした場合は、マッチした要素の
  # 配列をブロックに渡して評価します。
  # 
  # 
  # @param pattern 文字列か正規表現を指定します。
  #                文字列を指定した場合は、文字列そのものにマッチする正規表現に変換されます。
  #                
  # @param timeout タイムアウトする秒数。省略すると 9999999 秒後にタイムアウトします。
  # 
  # @return パターンが得られたら、そのパターンに関する配列を返します。
  #         配列の最初の要素は、pattern にマッチするまでに読みこんだ文字列です。
  #         2番目以降の要素は、pattern の正規表現中のアンカーにマッチした部分です。
  #         タイムアウトした場合は nil を返します。
  def expect; end

  # --- external_encoding   -> Encoding | nil
  # 
  # IO の外部エンコーディングを返します。
  # 外部エンコーディングが指定されていない場合は nil を返します。
  # ただし読み込み専用モードの場合は [[m:Encoding.default_external]] になります。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "abcde")
  # File.open("testfile") { |f| p f.external_encoding } # => #<Encoding:UTF-8>
  # //}
  def external_encoding; end

  # --- fcntl(cmd, arg = 0)    -> Integer
  # 
  # IOに対してシステムコール fcntl を実行します。
  # 機能の詳細は [[man:fcntl(2)]] を参照してください。
  # fcntl(2) が返した整数を返します。
  # 
  # @param cmd IO に対するコマンドを、添付ライブラリ [[lib:fcntl]] が提供している定数で指定します。
  # 
  # @param arg cmd に対する引数を整数、文字列、booleanのいずれかで指定します。
  #            整数の時にはその値を [[man:fcntl(2)]] に渡します。
  #            文字列の場合には Array#pack した構造体だとみなして渡します。
  #            arg が nil か false の場合には 0を、true の場合には 1 を渡します。
  # 
  # @raise Errno::EXXX fcntl の実行に失敗した場合に発生します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require "fcntl"
  # 
  # IO.write("testfile", "abcde")
  # # ファイル状態フラグを読み出す
  # File.open("testfile") do |f|
  #   f.fcntl(Fcntl::F_GETFL, 0) # => 0
  #   f.fcntl(Fcntl::F_SETFL, Fcntl::O_NONBLOCK) # => 0
  #   f.fcntl(Fcntl::F_GETFL, 0) # => 4
  # end
  # //}
  def fcntl; end

  # --- fdatasync -> 0 | nil
  # 
  # IO のすべてのバッファされているデータを直ちにディスクに書き込みます。
  # 
  # [[man:fdatasync(2)]] をサポートしていない OS 上では代わりに
  # [[m:IO#fsync]] を呼びだします。
  # 
  # [[m:IO#fsync]] との違いは [[man:fdatasync(2)]] を参照してください。
  # 
  # @raise NotImplementedError [[man:fdatasync(2)]] も [[man:fsync(2)]] も
  #        サポートされていない OS で発生します。
  # 
  # //emlist[例][ruby]{
  # require "tempfile"
  # 
  # Tempfile.open("testtmpfile") do |f|
  #   f.print "test"
  #   File.read(f.path) # => ""
  #   f.fdatasync
  #   File.read(f.path) # => "test"
  # end
  # //}
  def fdatasync; end

  # --- fileno    -> Integer
  # --- to_i      -> Integer
  # 
  # ファイル記述子を表す整数を返します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # 
  # //emlist[例][ruby]{
  # $stdin.fileno    # => 0
  # $stdout.fileno   # => 1
  # //}
  # 
  # @see [[m:Dir#fileno]]
  def fileno; end

  # --- flush    -> self
  # 
  # IO ポートの内部バッファをフラッシュします。
  # 
  # このメソッドを使ったとき、即座にメタデータを更新することは保証されません(特にWindowsで)。
  # 即座にメタデータも更新したいときは [[m:IO#fsync]] を使います。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX [[man:fflush(3)]] が失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require "tempfile"
  # 
  # Tempfile.open("testtmpfile") do |f|
  #   f.print "test"
  #   File.read(f.path) # => ""
  #   f.flush
  #   File.read(f.path) # => "test"
  # end
  # //}
  def flush; end

  # --- fsync    -> 0 | nil
  # 
  # 書き込み用の IO に対して、システムコール [[man:fsync(2)]]
  # を実行します。[[m:IO#flush]] を行ったあと、(OSレベルで)まだディスクに
  # 書き込まれていないメモリ上にあるデータをディスクに書き出します。
  # 
  # 成功すれば 0 を返します。
  # [[man:fsync(2)]] がサポートされていない場合は nil を返します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  def fsync; end

  # --- getbyte   -> Integer | nil
  # 
  # IO から1バイトを読み込み整数として返します。
  # 既に EOF に達していれば nil を返します。
  # 
  #    f = File.new("testfile")
  #    f.getbyte   #=> 84
  #    f.getbyte   #=> 104
  def getbyte; end

  # --- getc    -> String | nil
  # 
  # IO ポートから外部エンコーディングに従い 1 文字読み込んで返します。
  # EOF に到達した時には nil を返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # [[m:IO#readchar]] との違いは EOF での振る舞いのみです。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # 例:
  #    File.write("testfile", "test")
  #    f = File.new("testfile")
  #    p f.getc                 #=> "い"
  #    p f.getc                 #=> "ろ"
  #    p f.getc                 #=> "は"
  #    f.read
  #    f.getc                   #=> nil
  # 
  # @see [[m:IO#readchar]]
  def getc; end

  # --- getch -> String
  # 
  # raw モードで一文字読み込んだ結果を返します。
  def getch; end

  # --- gets(rs = $/, chomp: false)    -> String | nil
  # --- gets(limit, chomp: false)      -> String | nil
  # --- gets(rs, limit, chomp: false)  -> String | nil
  # 
  # 一行読み込んで、読み込みに成功した時にはその文字列を返します。
  # EOF に到達した時には nil を返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # 読み込んだ文字列を変数 [[m:$_]] にセットします。
  # [[m:IO#readline]] との違いは EOF での振る舞いのみです。
  # 
  # limit で最大の読み込みバイト数を指定します。ただし
  # ファイルのエンコーディングがマルチバイトエンコーディングである場合には
  # 読み込んだ文字列がマルチバイト文字の途中で切れないように
  # 数バイト余分に読み込む場合があります。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。
  #           空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # @param chomp true を指定すると各行の末尾から "\n", "\r", または "\r\n" を取り除きます。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  #    f = File.new("oneline_file")
  #    f.gets                          #=> "This is line one\n"
  #    $_                              #=> "This is line one\n"
  #    f.gets                          #=> nil
  #    $_                              #=> nil
  # 
  # @see [[m:$/]], [[m:IO#readline]]
  def gets; end

  # --- iflush -> self
  # 
  # カーネルの入力バッファをフラッシュします。
  # 
  # @return 自身を返します。
  def iflush; end

  # --- internal_encoding   -> Encoding | nil
  # 
  # IO の内部エンコーディングを返します。
  # 内部エンコーディングが指定されていない場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "abcde")
  # File.open("testfile") do |f|
  #   p f.internal_encoding  # => nil
  #   f.set_encoding("ASCII-8BIT", "EUC-JP")
  #   p f.internal_encoding  # => #<Encoding:EUC-JP>
  # end
  # //}
  def internal_encoding; end

  # --- ioctl(cmd, arg = 0)    -> Integer
  # 
  # IO に対してシステムコール ioctl を実行し、その結果を返します。
  # 機能の詳細は [[man:ioctl(2)]] を参照してください。
  # 
  # @param cmd IO に対するコマンドを整数で指定します。どのようなコマンドが使えるかはプラットフォームに依存します。
  # 
  # @param arg cmd に対する引数を指定します。整数の時にはその値を ioctl に渡します。
  #            文字列の場合には [[m:Array#pack]] した構造体だとみなして渡します。
  #            arg が nil か false の場合には 0を、true の場合には 1 を渡します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  def ioctl; end

  # --- ioflush -> self
  # 
  # カーネルの入出力バッファをフラッシュします。
  # 
  # @return 自身を返します。
  def ioflush; end

  # --- isatty    -> bool
  # --- tty?      -> bool
  # 
  # 入出力ポートがttyに結合している時、真を返します。そうでない場合 false を返します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.new("testfile").isatty   # => false
  # File.new("/dev/tty").isatty   # => true
  # //}
  def isatty; end

  # --- lineno    -> Integer
  # 
  # 現在の行番号を整数で返します。実際には [[m:IO#gets]] が呼ばれた回数です。
  # 改行以外のセパレータで gets が呼ばれた場合など、実際の行番号と異なる場合があります。
  # 
  # @raise IOError 読み込み用にオープンされていなければ発生します。
  # 
  #   f = File.new("testfile")
  #   f.lineno                 #=> 0
  #   f.gets                   #=> "This is line one\n"
  #   f.lineno                 #=> 1
  #   f.gets                   #=> "This is line two\n"
  #   f.lineno                 #=> 2
  # 
  # @see [[m:$.]]
  def lineno; end

  # --- lineno=(number)
  # 
  # 現在の行番号を number にセットします。 [[m:$.]] は次回の読み込みの時に更新されます。
  # 
  # @param number 行番号を整数で指定します。
  # 
  # @raise IOError 読み込み用にオープンされていなければ発生します。
  # 
  #   f = File.new("testfile")
  #   f.gets                     #=> "This is line one\n"
  #   $.                         #=> 1
  #   f.lineno = 1000
  #   f.lineno                   #=> 1000
  #   $.                         #=> 1
  #   f.gets                     #=> "This is line two\n"
  #   $.                         #=> 1001
  # 
  # @see [[m:$.]]
  def lineno=; end

  # --- lines(rs = $/) {|line| ... }        -> self
  # --- lines(limit) {|line| ... }          -> self
  # --- lines(rs, limit) {|line| ... }      -> self
  # --- lines(rs = $/)                      -> Enumerator
  # --- lines(limit)                        -> Enumerator
  # --- lines(rs, limit)                    -> Enumerator
  # 
  # このメソッドは obsolete です。
  # 代わりに [[m:IO#each_line]] を使用してください。
  # 
  # 使用すると警告メッセージが表示されます。
  # 
  # IO の現在位置から 1 行ずつ文字列として読み込み、それを引数として
  # 与えられたブロックを実行します。
  # 
  # ブロックが与えられなかった場合は、自身から生成した
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # limit で最大読み込みバイト数を指定します。ただしマルチバイト文字が途中で
  # 切れないように余分に読み込む場合があります。
  # 
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。
  #           空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # 
  # @see [[m:$/]], [[m:IO#each_line]]
  def lines; end

  # --- noecho {|io| ... } -> object
  # 
  # 文字入力時のエコーバックを無効に設定してブロックを評価します。
  # 
  # ブロック引数には self が渡されます。ブロックを評価した結果を返します。
  # 
  # 以下の例では、標準入力からエコーバックなしで文字列を一行読み込みます。
  # 
  #   require "io/console"
  #   STDIN.noecho(&:gets)
  # 
  # @raise LocalJumpError ブロックを指定しなかった場合に発生します。
  def noecho; end

  # --- nonblock(bool = true) { ... } -> object
  # 
  # ブロック実行中、一時的に self のブロックモードを変更します。
  # bool が真ならノンブロックモード、偽ならブロックモードになります。
  # 
  # @param bool 真を指定するとノンブロックモード、偽を指定するとブロックモードになります。
  def nonblock; end

  # --- nonblock=(bool)
  # bool が真なら self をノンブロックモードに、偽ならブロックモー
  # ドにします。
  # 
  # @param bool 真を指定すると自身をノンブロックモードにします。偽を指定するとブロックモードにします。
  def nonblock=; end

  # --- nonblock? -> bool
  # self がノンブロックモードならば true を、
  # ブロックモードなら false を返します。
  def nonblock?; end

  # --- nread -> Integer
  # ブロックせずに読み込み可能なバイト数を返します。
  # ブロックする場合は0を返します。
  # 
  # 判別が不可能な場合は0を返します。
  def nread; end

  # --- oflush -> self
  # 
  # カーネルの出力バッファをフラッシュします。
  # 
  # @return 自身を返します。
  def oflush; end

  # --- pathconf(name) -> Integer | nil
  # 
  # [[man:fpathconf(3)]] で取得したファイルの設定変数の値を返します。
  # 
  # 引数 name が制限に関する設定値であり、設定が制限がない状態の場合は nil
  # を返します。([[man:fpathconf(3)]] が -1 を返し、errno が設定されていない
  # 場合)
  # 
  # @param name [[c:Etc]] モジュールの PC_ で始まる定数のいずれかを指定します。
  # 
  # //emlist[][ruby]{
  # require 'etc'
  # IO.pipe {|r, w|
  #   p w.pathconf(Etc::PC_PIPE_BUF) # => 4096
  # }
  # //}
  def pathconf; end

  # --- pid    -> Integer | nil
  # 
  # 自身が [[m:IO.popen]] で作られたIOポートなら、子プロセスのプロセス ID を
  # 返します。それ以外は nil を返します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.popen("-") do |pipe|
  #   if pipe
  #     $stderr.puts "In parent, child pid is #{pipe.pid}" # => In parent, child pid is 16013
  #   else
  #     $stderr.puts "In child, pid is #{$$}"              # => In child, pid is 16013
  #   end
  # end
  # //}
  def pid; end

  # --- pos    -> Integer
  # --- tell   -> Integer
  # 
  # ファイルポインタの現在の位置を整数で返します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "This is line one\n")
  # File.open("testfile") do |f|
  #   f.pos    # => 0
  #   f.gets   # => "This is line one\n"
  #   f.pos    # => 17
  # end
  # //}
  def pos; end

  # --- pos=(n)
  # 
  # ファイルポインタを指定位置に移動します。
  # [[m:IO#seek]](n, IO::SEEK_SET) と同じです。
  # 
  # @param n 先頭からのオフセットを整数で指定します。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "This is line one\nThis is line two\n")
  # File.open("testfile") do |f|
  #   f.pos    # => 0
  #   f.pos = 17
  #   f.gets   # => "This is line two\n"
  # end
  # //}
  def pos=; end

  # --- pread(maxlen, offset, outbuf = "")    -> string
  # 
  # preadシステムコールを使ってファイルポインタを変更せずに、また現在のファイルポインタに
  # 依存せずにmaxlenバイト読み込みます。
  # 
  # [[m:IO#seek]]と[[m:IO#read]]の組み合わせと比べて、アトミックな操作に
  # なるという点が優れていて、複数スレッド/プロセスから同じIOオブジェクトを
  # 様々な位置から読み込むことを許します。
  # どのユーザー空間のIO層のバッファリングもバイパスします。
  # 
  # @param maxlen 読み込むバイト数を指定します。
  # @param offset 読み込み開始位置のファイルの先頭からのオフセットを指定します。
  # @param outbuf データを受け取る String を指定します。
  # 
  # @raise Errno::EXXX シークまたは書き込みが失敗した場合に発生します。
  # @raise EOFError EOF に到達した時に発生します。
  # @raise NotImplementedError システムコールがサポートされていない OS で発生します。
  # 
  # //emlist[例][ruby]{
  # File.write("testfile", "This is line one\nThis is line two\n")
  # File.open("testfile") do |f|
  #   p f.read           # => "This is line one\nThis is line two\n"
  #   p f.pread(12, 0)   # => "This is line"
  #   p f.pread(9, 8)    # => "line one\n"
  # end
  # //}
  def pread; end

  # --- print(*arg)    -> nil
  # 
  # 引数を IO ポートに順に出力します。引数を省略した場合は、[[m:$_]] を出力します。
  # 
  # @param arg [[m:Kernel.#print]] と同じです。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # $stdout.print("This is ", 100, " percent.\n") # => This is 100 percent.
  # //}
  # 
  # @see [[m:Kernel.#print]]
  def print; end

  # --- printf(format, *arg)    -> nil
  # 
  # C 言語の printf と同じように、format に従い引数
  # を文字列に変換して、self に出力します。
  # 
  # 第一引数に IO を指定できないこと、引数を省略できないことを除けば [[m:Kernel.#printf]] と同じです。
  # 
  # @param format [[m:Kernel.#printf]] と同じです。[[d:print_format]] を参照してください。
  # 
  # @param arg [[m:Kernel.#printf]] と同じです。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # 
  # @see [[m:Kernel.#printf]]
  def printf; end

  # --- putc(ch)    -> object
  # 
  # 文字 ch を self に出力します。
  # 引数の扱いは [[m:Kernel.#putc]] と同じです。詳細はこちらを参照し
  # てください。ch を返します。
  # 
  # @param ch 出力したい文字を、文字列か文字コード(整数)で与えます。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # $stdout.putc "A" # => A
  # $stdout.putc 65  # => A
  # //}
  # 
  # @see [[m:Kernel.#putc]]
  def putc; end

  # --- puts(*obj)    -> nil
  # 
  # 各 obj を self に出力し、それぞれの後に改行を出力します。
  # 引数の扱いは [[m:Kernel.#puts]] と同じです。詳細はこちらを参照し
  # てください。
  # 
  # @param obj 出力したいオブジェクトを指定します。[[m:Kernel.#puts]] と同じです。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  #      $stdout.puts("this", "is", "a", "test", [1, [nil, 3]])
  #      
  #      #=>     
  #      this
  #      is
  #      a
  #      test
  #      1
  #      
  #      3
  # 
  # @see [[m:Kernel.#puts]]
  def puts; end

  # --- pwrite(string, offset) -> Integer
  # stringをoffsetの位置にpwrite()システムコールを使って書き込みます。
  # 
  # [[m:IO#seek]]と[[m:IO#write]]の組み合わせと比べて、アトミックな操作に
  # なるという点が優れていて、複数スレッド/プロセスから同じIOオブジェクトを
  # 様々な位置から読み込むことを許します。
  # どのユーザー空間のIO層のバッファリングもバイパスします。
  # 
  # @param string 書き込む文字列を指定します。
  # @param offset ファイルポインタを変えずに書き込む位置を指定します。
  # 
  # @return 書き込んだバイト数を返します。
  # 
  # @raise Errno::EXXX シークまたは書き込みが失敗した場合に発生します。
  # @raise NotImplementedError システムコールがサポートされていない OS で発生します。
  # 
  # //emlist[例][ruby]{
  # File.open("testfile", "w") do |f|
  #   f.pwrite("ABCDEF", 3)   # => 6
  # end
  # 
  # File.read("testfile")     # => "\u0000\u0000\u0000ABCDEF"
  # //}
  def pwrite; end

  # --- raw {|io| ... } -> object
  # 
  # raw モード、行編集を無効にして指定されたブロックを評価します。
  # 
  # ブロック引数には self が渡されます。ブロックを評価した結果を返します。
  # 
  # @raise LocalJumpError ブロックを指定しなかった場合に発生します。
  # 
  # 以下の例では、標準入力からエコーバックなしで文字列を一行読み込みます。
  # 
  #   require "io/console"
  #   STDIN.raw(&:gets)
  def raw; end

  # --- raw! -> self
  # 
  # raw モードを有効にします。端末のモードを後で元に戻す必要がある場合は
  # [[m:IO#raw]] を使用してください。
  # 
  # @return 自身を返します。
  # 
  # @see [[m:IO#raw]]
  def raw!; end

  # --- read(length = nil, outbuf = "")    -> String | nil
  # 
  # length バイト読み込んで、その文字列を返します。
  # 
  # 引数 length が指定された場合はバイナリ読み込みメソッド、そうでない場合はテキスト読み込みメソッドとして
  # 動作します。
  # 既に EOF に達していれば nil を返します。
  # ただし、length に nil か 0 が指定されている場合は、空文字列 "" を返します。
  # 例えば、open(空ファイル) {|f| f.read } は "" となります。
  # 
  # @param length 読み込むサイズを整数で指定します。
  #               nil が指定された場合、EOF までの全てのデータを読み込んで、その文字列を返します。
  # 
  # @param outbuf 出力用のバッファを文字列で指定します。IO#read は読み込んだ
  #               データをその文字列オブジェクトに上書きして返します。指定し
  #               た文字列オブジェクトがあらかじめ length 長の領域であれば、
  #               余計なメモリの割当てが行われません。指定した文字列の長さが
  #               length と異なる場合、その文字列は一旦 length 長に拡張(ある
  #               いは縮小)されたあと、実際に読み込んだデータのサイズになります。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX データの読み込みに失敗した場合に発生します。
  # 
  # @raise ArgumentError length が負の場合に発生します。
  # 
  # 第二引数を指定した read の呼び出しでデータが空であった場合
  # (read が nil を返す場合)、outbuf は空文字列になります。
  # 
  #   outbuf = "x" * 20;
  #   io = File.open("/dev/null")
  #   p io.read(10,outbuf)
  #   p outbuf
  #   => nil
  #      ""
  def read; end

  # --- read_nonblock(maxlen, outbuf = nil, exception: true) -> String | Symbol | nil
  # 
  # IO をノンブロッキングモードに設定し、
  # その後で [[man:read(2)]] システムコールにより
  # 長さ maxlen を上限として読み込み、文字列として返します。
  # EAGAIN, EINTR などは [[c:Errno::EXXX]] 例外として呼出元に報告されます。
  # 
  # 発生した例外 がErrno::EAGAIN、 Errno::EWOULDBLOCK である場合は、
  # その例外オブジェクトに [[c:IO::WaitReadable]] が [[m:Object#extend]]
  # されます。
  # 
  # なお、バッファが空でない場合は、read_nonblock はバッファから読み込みます。この場合、read(2) システムコールは呼ばれません。
  # 
  # このメソッドはノンブロッキングモードにする点を除いて [[m:IO#readpartial]] と
  # 同じであることに注意してください。
  # 
  # バイナリ読み込みメソッドとして動作します。
  # 
  # 既に EOF に達していれば EOFError が発生します。ただし、maxlen に 0 が指定されている場合は、空文字列 "" を返します。
  # 
  # @param maxlen 読み込む長さの上限を整数で指定します。
  # 
  # @param outbuf 文字列で指定します。IO#read_nonblock は読み込んだデータを outbuf に破壊的に格納し、
  #               返り値は outbuf となります。outbuf は一旦 maxlen 長に拡張(あるいは縮小)されたあと、
  #               実際に読み込んだデータのサイズになります。read(2) システムコールが 0 を返した場合は、空文字列になります。
  # 
  # @param exception 読み込み時に [[c:Errno::EAGAIN]]、
  #                  [[c:Errno::EWOULDBLOCK]] が発生する代わりに
  #                  :wait_readable を返すかどうかを指定します。また、false
  #                  を指定した場合は既に EOF に達していれば
  #                  [[c:EOFError]] の代わりに nil を返します。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX read(2) システムコールの結果としてエラーが起きた場合に発生します。
  # 
  # @raise EOFError read(2) システムコールが 0 を返した場合に発生します。これは、IO が既に EOF に達していることを意味します。
  def read_nonblock; end

  # --- readbyte   -> Integer
  # 
  # IO から1バイトを読み込み整数として返します。
  # 既に EOF に達していれば EOFError が発生します。
  # 
  # @raise EOFError 既に EOF に達している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "123")
  # File.open("testfile") do |f|
  #   begin
  #     f.readbyte  # => 49
  #     f.readbyte  # => 50
  #     f.readbyte  # => 51
  #     f.readbyte  # => 例外発生
  #   rescue => e
  #     e.class # => EOFError
  #   end
  # end
  # //}
  def readbyte; end

  # --- readchar    -> String
  # 
  # IO ポートから 1 文字読み込んで返します。
  # EOF に到達した時には EOFError が発生します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # [[m:IO#getc]] との違いは EOF での振る舞いのみです。
  # 
  # @raise EOFError EOF に到達した時に発生します。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  #    f = File.new("testfile")
  #    p f.readchar                   #=> "い"
  #    p f.readchar                   #=> "ろ"
  #    p f.readchar                   #=> "は"
  #    f.read
  #    f.readchar                   #=> EOFError
  # 
  # @see [[m:IO#getc]]
  def readchar; end

  # --- readline(rs = $/, chomp: false)   -> String
  # --- readline(limit, chomp: false)     -> String
  # --- readline(rs, limit, chomp: false) -> String
  # 
  # 一行読み込んで、読み込みに成功した時にはその文字列を返します。
  # EOF に到達した時には EOFError が発生します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # 読み込んだ文字列を変数 [[m:$_]] にセットします。[[m:IO#gets]] との違いは EOF での振る舞いのみです。
  # 
  # limit で最大読み込みバイト数を指定します。ただしマルチバイト文字が途中で
  # 切れないように余分に読み込む場合があります。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # @param chomp true を指定すると各行の末尾から "\n", "\r", または "\r\n" を取り除きます。
  # 
  # @raise EOFError EOF に到達した時に発生します。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  #    f = File.new("oneline_file")
  #    f.readline                      #=> "This is line one\n"
  #    $_                              #=> "This is line one\n"
  #    f.readline                      #=> EOFError
  #    $_                              #=> nil
  # 
  # @see [[m:$/]], [[m:IO#gets]]
  def readline; end

  # --- readlines(rs = $/, chomp: false)    -> [String]
  # --- readlines(limit, chomp: false)      -> [String]
  # --- readlines(rs, limit, chomp: false)  -> [String]
  # 
  # データを全て読み込んで、その各行を要素としてもつ配列を返します。
  # 既に EOF に達していれば空配列 [] を返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # limit で最大読み込みバイト数を指定します。ただしマルチバイト文字が途中で
  # 切れないように余分に読み込む場合があります。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。
  #           空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # @param chomp true を指定すると各行の末尾から rs を取り除きます。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "line1,\nline2,\nline3,\n")
  # File.open("testfile") { |f| p f.readlines }      # => ["line1,\n", "line2,\n", "line3,\n"]
  # File.open("testfile") { |f| p f.readlines(3) }   # => ["lin", "e1,", "\n", "lin", "e2,", "\n", "lin", "e3,", "\n"]
  # File.open("testfile") { |f| p f.readlines(",") } # => ["line1,", "\nline2,", "\nline3,", "\n"]
  # //}
  # 
  # //emlist[例: rsを取り除く（chomp = true）][ruby]{
  # IO.write("testfile", "line1,\rline2,\r\nline3,\n")
  # File.open("testfile") { |f| p f.readlines(chomp: true) }       # => ["line1,\rline2,", "line3,"]
  # File.open("testfile") { |f| p f.readlines("\r", chomp: true) } # => ["line1,", "line2,", "\nline3,\n"]
  # //}
  # 
  # @see [[m:$/]], [[m:IO#gets]]
  def readlines; end

  # --- readpartial(maxlen, outbuf = "")    -> String
  # 
  # IO から長さ maxlen を上限として読み込み、文字列として返します。
  # 即座に得られるデータが存在しないときにはブロックしてデータの到着を待ちます。
  # 即座に得られるデータが 1byte でも存在すればブロックしません。
  # 
  # バイナリ読み込みメソッドとして動作します。
  # 
  # 既に EOF に達していれば EOFError が発生します。
  # ただし、maxlen に 0 が指定されている場合は、空文字列 "" を返します。
  # 
  # readpartial はブロックを最小限に抑えることによって、
  # パイプ、ソケット、端末などのストリームに対して適切に動作するよう設計されています。
  # readpartial がブロックするのは次の全ての条件が満たされたときだけです。
  #   * IO オブジェクト内のバッファが空
  #   * ストリームにデータが到着していない
  #   * ストリームが EOF になっていない
  # これらの条件が満たされる場合、何らかのデータが到着するか EOF になるまで readpartial はブロックします。
  # 
  # readpartial の結果は以下のようになります。
  #   (1) バッファが空でなければ、そのバッファのデータを読み込んで返します。
  #   (2) ストリームにデータがあれば、ストリームからデータを読み込んで返します。
  #   (3) ストリームが EOF になっていれば、例外 [[c:EOFError]] を発生させます。
  # 
  # 例えば、パイプに対しては次のように動作します。
  # 
  #   r, w = IO.pipe           #               buffer          pipe content
  #   w << "abc"               #               ""              "abc".
  #   r.readpartial(4096)      #=> "abc"       ""              ""
  #   r.readpartial(4096)      # バッファにもパイプにもデータがないのでブロックする
  #   
  #   r, w = IO.pipe           #               buffer          pipe content
  #   w << "abc"               #               ""              "abc"
  #   w.close                  #               ""              "abc" EOF
  #   r.readpartial(4096)      #=> "abc"       ""              EOF
  #   r.readpartial(4096)      # 例外 EOFError 発生
  #   
  #   r, w = IO.pipe           #               buffer          pipe content
  #   w << "abc\ndef\n"        #               ""              "abc\ndef\n"
  #   r.gets                   #=> "abc\n"     "def\n"         ""
  #   w << "ghi\n"             #               "def\n"         "ghi\n"
  #   r.readpartial(4096)      #=> "def\n"     ""              "ghi\n"
  #   r.readpartial(4096)      #=> "ghi\n"     ""              ""
  # 
  # なお、readpartial は nonblock フラグに影響されません。
  # つまり、nonblock フラグが設定されていて sysread であれば Errno::EAGAIN になる場合でもブロックします。
  # 
  # また、readpartial の挙動は sysread によく似ています。
  # とくに、バッファが空の場合には同じ挙動を示します。
  # ただし、EAGAIN および EINTR エラーは内部で発生したとしても通知されず、データが到着するまでブロックし続けます。
  # 
  # @param maxlen 読み込む長さの上限を整数で指定します。
  # 
  # @param outbuf 文字列で指定します。IO#readpartial は読み込んだデータを outbuf に破壊的に格納し、
  #               返り値は outbuf となります。outbuf は一旦 maxlen 長に拡張(あるいは縮小)されたあと、
  #               実際に読み込んだデータのサイズになります。IO が既に EOF に達していれば、空文字列になります。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # @raise EOFError IO が既に EOF に達していれば発生します。
  def readpartial; end

  # --- ready? -> bool | nil
  # ブロックせずに読み込み可能ならtrueを、
  # ブロックしてしまう可能性があるならfalseを返します。
  # 
  # 判定不可能な場合は nil を返します。
  def ready?; end

  # --- reopen(io)                   -> self
  # 
  # 自身を指定された io に繋ぎ換えます。
  # 
  # クラスも io に等しくなることに注意してください。
  # [[m:IO#pos]], [[m:IO#lineno]] などは指定された io と等しくなります。
  # 
  # @param io 自身を繋ぎ換えたい IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された io が close されている場合に発生します。
  # 
  # --- reopen(path)                 -> self
  # --- reopen(path, mode)     -> self
  # 
  # path で指定されたファイルにストリームを繋ぎ換えます。
  # 
  # 第二引数を省略したとき self のモードをそのまま引き継ぎます。
  # [[m:IO#pos]], [[m:IO#lineno]] などはリセットされます。
  # 
  # @param path パスを表す文字列を指定します。
  # 
  # @param mode パスを開く際のモードを文字列で指定します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "This is line one\nThis is line two\n")
  # f1 = File.new("testfile", "a+")
  # f2 = File.new("testfile")
  # f1.print("This is line three\n")
  # f2.readlines                # => ["This is line one\n", "This is line two\n"]
  # f1.close
  # f2.reopen("testfile", "r")  # => #<File:testfile>
  # f2.readlines                # => ["This is line one\n", "This is line two\n", "This is line three\n"]
  # f2.close
  # //}
  # 
  # @see [[m:Kernel.#open]]
  def reopen; end

  # --- rewind    -> 0
  # 
  # ファイルポインタを先頭に移動します。[[m:IO#lineno]] は 0 になります。
  # 
  # @raise IOError 既に close されている場合に発生します。
  # 
  #      f = File.new("testfile")
  #      f.readline               #=> "This is line one\n"
  #      f.rewind                 #=> 0
  #      f.lineno                 #=> 0
  #      f.readline               #=> "This is line one\n"
  def rewind; end

  # --- scanf(format) -> Array
  # --- scanf(format) {|*ary| ...} -> Array
  # 
  # [[m:String#scanf]]も参照してください。
  # 
  # @param format スキャンするフォーマットを文字列で指定します。
  #               詳細は、[[ref:m:String#scanf#format]] を参照してください。
  def scanf; end

  # --- seek(offset, whence = IO::SEEK_SET)    -> 0
  # 
  # ファイルポインタを whence の位置から offset だけ移動させます。
  # offset 位置への移動が成功すれば 0 を返します。
  # 
  # @param offset ファイルポインタを移動させるオフセットを整数で指定します。
  # 
  # @param whence 値は以下のいずれかです。
  #               それぞれ代わりに :SET、:CUR、:END、:DATA、:HOLE を指定す
  #               る事も可能です。
  # 
  #   * IO::SEEK_SET: ファイルの先頭から (デフォルト)
  #   * IO::SEEK_CUR: 現在のファイルポインタから
  #   * IO::SEEK_END: ファイルの末尾から
  #   * IO::SEEK_DATA: offset 以降の次にデータがある位置へ(lseek の man ページ参照。Linux 3.1 以降のみ)
  #   * IO::SEEK_HOLE: offset 以降の次にホールがある位置へ(同上)
  # 
  # @raise Errno::EXXX ファイルポインタの移動に失敗した場合に発生します。
  # 
  # @raise IOError 既に close されていた場合に発生します。 
  # 
  #      f = File.new("testfile")
  #      f.seek(-13, IO::SEEK_END)   #=> 0
  #      f.readline                  #=> "And so on...\n"
  # 
  # @see [[m:IO#sysseek]]
  def seek; end

  # --- set_encoding(enc_str, opt={})           -> self
  # --- set_encoding(ext_enc)           -> self
  # --- set_encoding(ext_enc, int_enc, opt={})  -> self
  # 
  # IO のエンコーディングを設定します。
  # 
  # 引数が "A:B" のようにコロンで区切られた文字列の場合は、
  # A を外部エンコーディング、 B を内部エンコーディングに指定します。
  # 
  # 引数が一つで、上のような形式でない場合には、
  # それが外部エンコーディングと見なされます。
  # 
  # 引数が2つの場合はそのそれぞれを外部エンコーディング、内部エンコーディング
  # に設定します。
  # 
  # opt のハッシュで外部エンコーディングを内部エンコーディングに変換する際の
  # オプションを指定します。
  # 詳しくは [[m:String#encode]] を参照してください。
  # 
  # @param enc_str エンコーディングを表す文字列を指定します。"A:B" のようにコロンで区切られた
  #                文字列を指定した場合 A が外部エンコーディング、B が内部エンコーディングを
  #                表します。
  # 
  # @param ext_enc 外部エンコーディングを表す文字列か [[c:Encoding]] オブジェクトを指定します。
  # 
  # @param int_enc 内部エンコーディングを表す文字列か [[c:Encoding]] オブジェクトを指定します。
  # @param opt エンコーディング変換のオプション
  # 例:
  #     io = File.open(file)
  #     io.set_encoding("ASCII-8BIT", "EUC-JP")
  def set_encoding; end

  # --- stat    -> File::Stat
  # 
  # ファイルのステータスを含む [[c:File::Stat]] オブジェクトを生成して
  # 返します。
  # 
  # @raise Errno::EXXX ステータスの読み込みに失敗した場合に発生します。
  # 
  # @raise IOError 既に close されていた場合に発生します。 
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "This is line one\nThis is line two\n")
  # File.open("testfile") do |f|
  #   s = f.stat
  #   "%o" % s.mode   # => "100644"
  #   s.blksize       # => 4096
  #   s.atime         # => 2018-03-01 23:19:59 +0900
  # end
  # //}
  # 
  # @see [[m:File#lstat]], [[m:File.stat]], [[m:File.lstat]] 
  def stat; end

  # --- sync    -> bool
  # 
  # 現在の出力が同期モードならば true を返します。そうでない場合は false を返します。
  # 
  # @raise IOError 既に close されていた場合に発生します。 
  # 
  # //emlist[例][ruby]{
  # File.open("testfile", "w") do |f|
  #   f.sync      # => false
  #   f.sync = true
  #   f.sync      # => true
  # end
  # //}
  def sync; end

  # --- sync=(newstate)
  # 
  # 自身を同期モードに設定すると、出力関数の呼出毎にバッファがフラッシュされます。
  # 
  # @param newstate 自身を同期モードに設定するかを boolean で指定します。
  # 
  # @raise IOError 既に close されていた場合に発生します。 
  # 
  # @see [[m:IO#sync]]
  def sync=; end

  # --- sysread(maxlen, outbuf = "")   -> String
  # 
  # [[man:read(2)]] を用いて入力を行ない、入力されたデータを
  # 含む文字列を返します。stdio を経由しないので gets や getc や eof? などと混用すると思わぬ動作
  # をすることがあります。
  # 
  # バイナリ読み込みメソッドとして動作します。
  # 
  # 既に EOF に達していれば EOFError が発生します。ただし、maxlen に 0 が指定されている場合は、空文字列 "" を返します。
  # 
  # @param maxlen 入力のサイズを整数で指定します。
  # 
  # @param outbuf 出力用のバッファを文字列で指定します。IO#sysread は読み込んだデータを
  #               その文字列オブジェクトに上書きして返します。指定した文字列オブジェクト
  #               があらかじめ maxlen 長の領域であれば、余計なメモリの割当てが行われません。
  #               指定した文字列の長さが maxlen と異なる場合、その文字列は一旦 maxlen 長に
  #               拡張(あるいは縮小)されたあと、実際に読み込んだデータのサイズになります。
  # 
  # @raise IOError 自身が読み込み用にオープンされていなければ発生します。
  # 
  # @raise EOFError IO が既に EOF に達していれば発生します。
  # 
  # @raise Errno::EXXX データの読み込みに失敗した場合に発生します。
  # 
  # 第二引数を指定した sysread の呼び出しでデータが空であった場
  # 合(sysread が例外 [[c:EOFError]] を発生させる場合)、
  # outbuf は空文字列になります。
  # 
  #   outbuf = "x" * 20;
  #   io = File.open("/dev/null")
  #   p((io.sysread(10,outbuf) rescue nil))
  #   p outbuf
  #   => nil
  #      ""
  def sysread; end

  # --- sysseek(offset, whence = IO::SEEK_SET)    -> Integer
  # 
  # [[man:lseek(2)]] と同じです。[[m:IO#seek]] では、
  # [[m:IO#sysread]], [[m:IO#syswrite]] と併用すると正しく動作しないので代わりにこのメソッドを使います。
  # 位置 offset への移動が成功すれば移動した位置(ファイル先頭からのオフセット)を返します。
  # 
  # 書き込み用にバッファリングされた IO に対して実行すると警告が出ます。
  # 
  #   File.open("/dev/zero") {|f|
  #     buf = f.read(3)
  #     f.sysseek(0)
  #   }
  #   # => -:3:in `sysseek': sysseek for buffered IO (IOError)
  #   
  #   File.open("/dev/null", "w") {|f|
  #     f.print "foo"
  #     f.sysseek(0)
  #   }
  #   # => -:3: warning: sysseek for buffered IO
  # 
  # @param offset ファイルポインタを移動させるオフセットを整数で指定します。
  # 
  # @param whence 値は以下のいずれかです。
  #               それぞれ代わりに :SET、:CUR、:END、:DATA、:HOLE を指定す
  #               る事も可能です。
  # 
  #   * IO::SEEK_SET: ファイルの先頭から (デフォルト)
  #   * IO::SEEK_CUR: 現在のファイルポインタから
  #   * IO::SEEK_END: ファイルの末尾から
  #   * IO::SEEK_DATA: offset 以降の次にデータがある位置へ(lseek の man ページ参照。Linux 3.1 以降のみ)
  #   * IO::SEEK_HOLE: offset 以降の次にホールがある位置へ(同上)
  # 
  # @raise IOError 読み込み用にバッファリングされた IO に対して実行すると発生します。
  #                既に close されていた場合にも発生します。 
  # 
  # @raise Errno::EXXX 移動に失敗した場合に発生します。
  # 
  # @see [[m:IO#seek]]
  def sysseek; end

  # --- syswrite(string)    -> Integer    
  # 
  # [[man:write(2)]] を用いて string を出力します。
  # string が文字列でなければ to_s による文字列化を試みます。
  # 実際に出力できたバイト数を返します。
  # 
  # stdio を経由しないので他の出力メソッドと混用すると思わぬ動作
  # をすることがあります。
  # 
  # @param string 自身に書き込みたい文字列を指定します。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.open("testfile", "w+") do |f|
  #   f.syswrite("ABCDE") # => 5
  #   f.syswrite(:ABC)    # => 3
  # end
  # File.read("testfile") # => "ABCDEABC"
  # //}
  def syswrite; end

  # --- to_io    -> self
  # 
  # self を返します。
  def to_io; end

  # --- ungetbyte(c) -> nil
  # 
  # 指定したバイト列を書き戻します。
  # 
  # 2バイト以上の書き戻しは仕様として保証しません。
  # 
  # このメソッドはバッファを経由しない読み出し([[m:IO#sysread]] など)
  # には影響しません。
  # 
  # @param c バイト列(文字列)、もしくは0から255までの整数
  # 
  # 例:
  # 
  #    f = File.new("testfile")   #=> #<File:testfile>
  #    b = f.getbyte              #=> 0x38
  #    f.ungetbyte(b)             #=> nil
  #    f.getbyte                  #=> 0x38
  def ungetbyte; end

  # --- ungetc(char)     -> nil
  # 
  # 指定された char を読み戻します。
  # 
  # @param char 読み戻したい1文字かそのコードポイントを指定します。
  # 
  # @raise IOError 読み戻しに失敗した場合に発生します。また、自身が読み込み用にオープンされていない時、
  #                自身がまだ一度も read されていない時に発生します。
  # 
  #   f = File.new("testfile")   # => #<File:testfile>
  #   c = f.getc                 # => "い"
  #   f.ungetc(c)                # => nil
  #   f.getc                     # => "い"
  def ungetc; end

  # --- wait(timeout = nil)          -> bool | self | nil
  # --- wait_readable(timeout = nil) -> bool | self | nil
  # 
  # self が読み込み可能になるまでブロックし、読み込み可能になったら
  # 真値を返します。タイムアウト、もしくはEOFで
  # それ以上読みこめない場合は偽の値を返します。
  # 
  # より詳しくは、一度ブロックしてから読み込み可能になった場合には
  # selfを返します。
  # 内部のバッファにデータがある場合には
  # ブロックせずに true を返します。
  # 内部のバッファとはRubyの処理系が保持管理している
  # バッファのことです。
  # 
  # つまり、読み込み可能である場合にはtrueを返す場合と
  # selfを返す場合があることに注意してください。
  # 
  # timeout を指定した場合は、指定秒数経過するまでブロックし、タ
  # イムアウトした場合は nil を返します。
  # 
  # self が EOF に達していれば false を返します。
  # 
  # @param timeout タイムアウトまでの秒数を指定します。
  # 
  # 
  # @see [[m:IO#wait_writable]]
  def wait; end

  # --- wait_writable          -> self
  # --- wait_writable(timeout) -> self | nil
  # 
  # self が書き込み可能になるまでブロックし、書き込み可能になったら self を
  # 返します。
  # 
  # timeout を指定した場合は、指定秒数経過するまでブロックし、タイムアウト
  # した場合は nil を返します。
  # 
  # @param timeout タイムアウトまでの秒数を指定します。
  # 
  # @see [[m:IO#wait_readable]]
  def wait_writable; end

  # --- winsize -> [Integer, Integer]
  # 
  # 端末のサイズを [rows, columns] で返します。
  def winsize; end

  # --- winsize=(size)
  # 
  # 端末のサイズを設定します。
  # 
  # @param size [rows, columns] を数値の配列で指定します。
  # 
  # 効果はプラットフォームや環境に依存します。
  def winsize=; end

  # --- write(*str)     -> Integer
  # 
  # IOポートに対して str を出力します。str が文字列でなけ
  # れば to_s による文字列化を試みます。
  # 実際に出力できたバイト数を返します。
  # 
  # [[m:IO#syswrite]] を除く全ての出力メソッドは、最終的に
  # "write" という名のメソッドを呼び出すので、このメソッドを置き換える
  # ことで出力関数の挙動を変更することができます。
  # 
  # @param str 自身に書き込みたい文字列を指定します。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # File.open("textfile", "w+") do |f|
  #   f.write("This is")  # => 7
  # end
  # File.read("textfile") # => "This is"
  # //}
  # //emlist[複数引数の例][ruby]{
  # File.open("textfile", "w+") do |f|
  #   f.write("This is", " a test\n")  # => 15
  # end
  # File.read("textfile")              # => "This is a test\n"
  # //}
  def write; end

  # --- write_nonblock(string, exception: true) -> Integer | :wait_writable
  # 
  # IO をノンブロッキングモードに設定し、string を [[man:write(2)]] システムコールで書き出します。
  # 
  # write(2) が成功した場合、書き込んだ長さを返します。
  # EAGAIN, EINTR などは例外 [[c:Errno::EXXX]] として呼出元に報告されます。
  # 
  # 書き込んだバイト数(つまり返り値)は [[m:String#bytesize]] の
  # 値より小さい可能性があります。
  # 
  # 発生した例外 がErrno::EAGAIN、 Errno::EWOULDBLOCK である場合は、
  # その例外オブジェクトに [[c:IO::WaitWritable]] が [[m:Object#extend]]
  # されます。よって IO::WaitWritable を write_nonblock のリトライが必要
  # かの判定に用いることができます。
  # 
  # @param string 自身に書き込みたい文字列を指定します。
  # 
  # @param exception false を指定すると、書き込み時に [[c:Errno::EAGAIN]]、[[c:Errno::EWOULDBLOCK]] が発生
  #                  する代わりに :wait_writable を返します。
  # 
  # @raise IOError 自身が書き込み用にオープンされていなければ発生します。
  # 
  # @raise Errno::EXXX [[man:write(2)]] が失敗した場合に発生します。
  def write_nonblock; end

  # --- binread(path, length = nil, offset = 0)     -> String | nil
  # path で指定したファイルを open し、offset の所まで seek し、
  # length バイト読み込みます。
  # 
  # length を省略するとファイルの末尾まで読み込みます。
  # 
  # ファイルを開くときの mode は "rb:ASCII-8BIT" です。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "This is line one\nThis is line two\nThis is line three\nAnd so on...\n")
  # IO.binread("testfile")           # => "This is line one\nThis is line two\nThis is line three\nAnd so on...\n"
  # IO.binread("testfile", 20)       # => "This is line one\nThi"
  # IO.binread("testfile", 20, 10)   # => "ne one\nThis is line "
  # //}
  # 
  # @see [[m:IO.read]]
  def binread; end

  # --- binwrite(path, string, offset=nil) -> Integer
  # path で指定されるファイルを開き、string を書き込み、
  # 閉じます。
  # 
  # ファイルを開くときの mode が "rb:ASCII-8BIT" で、バイナリモードが有効
  # である点以外は [[m:IO.write]] と同じです。
  # 
  # offset を指定するとその位置までシークします。
  # 
  # offset を指定しないと、書き込みの末尾でファイルを
  # 切り捨てます。
  # 
  # @param path ファイル名文字列
  # @param string 書き込む文字列
  # @param offset 書き込み開始位置
  # 
  # //emlist[例][ruby]{
  # # 8x8の真っ白なPNG画像データ。
  # png = 'iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAAAAADhZOFXAAAADklEQVQIW2P4DwUMlDEA98A/wTjP
  # QBoAAAAASUVORK5CYII='.unpack('m').first
  # 
  # # 期待する先頭16バイトの16進ダンプ: どの環境でも同じ。
  # puts png[0...16].unpack('C*').map {|c| '%02x' % c }.join(' ')
  # # => 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52
  # 
  # # binwriteを使用した場合: どの環境でも正しく保存できる。
  # IO.binwrite('white.binmode.png', png)
  # puts IO.binread('white.binmode.png', 16).unpack('C*').map {|c| '%02x' % c }.join(' ')
  # # => 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52
  # 
  # # binwriteを使用しなかった場合: Windowsで改行文字(0x0a: "\n")と同じビット列が変換されてしまう。
  # IO.write('white.txtmode.png', png)
  # puts IO.binread('white.txtmode.png', 16).unpack('C*').map {|c| '%02x' % c }.join(' ')
  # # => 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 (Linux/Macの場合
  # # => 89 50 4e 47 0d 0d 0a 1a 0d 0a 00 00 00 0d 49 48 (Windowsの場合
  # //}
  # 
  # @see [[ref:c:IO#io_binmode]], [[m:IO.write]]
  def binwrite; end

  # --- console -> File | nil
  # 
  # 端末を [[c:File]] オブジェクトで返します。
  # 
  #   require "io/console"
  #   IO.console # => #<File:/dev/tty>
  # 
  # プロセスが端末から切り離された状態で実行すると nil を返します。
  # 
  # 戻り値はプラットフォームや環境に依存します。
  def console; end

  # --- console_size -> [Integer, Integer]
  # 
  # 端末のサイズを [rows, columns] で返します。
  # 
  # [[lib:io/console]] が利用できない場合は、[[m:IO.default_console_size]]
  # の値を返します。
  # 
  # @see [[m:IO.default_console_size]]
  def console_size; end

  # --- copy_stream(src, dst, copy_length = nil)             -> Integer
  # --- copy_stream(src, dst, copy_length, src_offset) -> Integer
  # 
  # 指定された src から dst へコピーします。
  # コピーしたバイト数を返します。
  # 
  # コピー元の src が IO オブジェクトの場合は、src のオフセットから
  # ファイル名の場合はファイルの最初からコピーを開始します。
  # コピー先の dst に関しても同様です。
  # 
  # dst にファイル名を指定し、そのファイルが存在しない場合、
  # ファイルは作成されます。ファイルが存在する場合は長さ 0 に切り詰められます。
  # 
  # src が IO オブジェクトでかつ src_offset が指定されている場合、
  # src のオフセット(src.pos)は変更されません。
  # 
  # @param src コピー元となる IO オブジェクトかファイル名を指定します。
  # 
  # @param dst コピー先となる IO オブジェクトかファイル名を指定します。
  # 
  # @param copy_length コピーする長さをバイト単位で指定します。最大 copy_length までコピーされます。
  #                    nil を指定した場合、コピーする長さに制限はありません。
  # 
  # @param src_offset  コピーを始めるオフセットを数値で指定します。
  # 
  # //emlist[例][ruby]{
  # IO.write("filetest", "abcdefghij")
  # IO.copy_stream("filetest", "filecopy", 2)     # => 2
  # IO.read("filecopy")                           # => "ab"
  # IO.copy_stream("filetest", "filecopy", 3, 4)  # => 3
  # IO.read("filecopy")                           # => "efg"
  # //}
  def copy_stream; end

  # --- default_console_size -> [Integer, Integer]
  # 
  # デフォルトの端末のサイズを [rows, columns] で返します。
  def default_console_size; end

  # --- new(fd, mode = "r", opt={})                -> IO
  # --- for_fd(fd, mode = "r", opt={})             -> IO
  # --- open(fd, mode = "r", opt={})               -> IO
  # --- open(fd, mode = "r" opt={}) {|io| ... }   -> object
  # 
  # オープン済みのファイルディスクリプタ fd に対する新しい
  # IO オブジェクトを生成して返します。
  # 
  # IO.open にブロックが与えられた場合、IO オブジェクトを生成しそれを引数としてブロックを
  # 実行します。ブロックの終了とともに fd はクローズされます。ブロックの結果を返します。
  # IO.new, IO.for_fd はブロックを受け付けません。
  # 
  # === オプション引数
  # このメソッドは以下のオプションを利用できます。
  #   * :mode mode引数と同じ意味です
  #   * :external_encoding 外部エンコーディング。"-" はデフォルト外部エンコーディングの
  #     別名です。
  #   * :internal_encoding 内部エンコーディング。"-" はデフォルト内部エンコーディングの
  #     別名です。nilなら変換しません。
  #   * :encoding "extenc:intenc" の形で外部/内部エンコーディングを指定します。
  #   * :textmode 真を渡すと mode の "t" と同じ意味になります。
  #   * :binmode 真を渡すと mode の "b" と同じ意味になります。
  #   * :autoclose 偽を渡すと close時/GCでのファイナライザ呼出時に fd を close しません。
  # また、[[m:String#encode]] で説明されている :invalid => :replace などの
  # 変換オプションも指定することができます。外部エンコーディングから
  # 内部エンコーディングへの変換をするときに用いられます。
  # 
  # 
  # @param fd ファイルディスクリプタである整数を指定します。
  # 
  # @param mode [[m:Kernel.#open]] と同じ形式で IO のモードを指定します。[[m:File::Constants::RDONLY]] などの
  #             定数(数値)でモードを指定できます。詳細は組み込み関数 [[m:Kernel.#open]] を参照
  #             してください。
  #             mode は省略可能で、省略時のデフォルトのモードは、
  #             [[man:fcntl(2)]] で F_GETFL フラグが利用できる環境では第一引数で指定した fd のモードを引き継ぎ、
  #             利用できない環境では "r" になります。
  # 
  # @param opt オプション引数
  # 
  # @raise Errno::EXXX IO オブジェクトの生成に失敗した場合に発生します。
  # 
  # //emlist[例:IO.new による読み込みモードでのファイルオープン][ruby]{
  # io = IO.new(IO.sysopen("testfile"))
  # io.class # => IO
  # io.close
  # //}
  # 
  # //emlist[例:IO.for_fd による読み込み・バイナリモードでのファイルオープン][ruby]{
  # IO.binwrite("testfile", "\xBF\xAA\x16\x04.\b\xCB\x12\xACoeQ\xFDv2\xCF9+\x81\x18")
  # io = IO.for_fd(IO.sysopen("testfile"), "r", { binmode: true })
  # io.class # => IO
  # io.binmode? # => true
  # io.close
  # //}
  # 
  # //emlist[例:IO.open によるファイルオープン][ruby]{
  # IO.open(IO.sysopen("testfile")) { |io| p io.class } # => IO
  # //}
  def for_fd; end

  # --- foreach(path, rs = $/, chomp: false) {|line| ... }    -> nil
  # --- foreach(path, rs = $/, chomp: false)                  -> Enumerator
  # 
  # path で指定されたファイルの各行を引数としてブロックを繰り返し実行します。
  # path のオープンに成功すれば nil を返します。
  # 
  # ブロックが与えられなかった場合は、path で指定されたファイルの各行を繰り返す
  # [[c:Enumerator]] オブジェクトを生成して返します。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # path が空ファイルの場合、何もせずに nil を返します。
  # [[m:Kernel.#open]] と同様 path の先頭が "|" ならば、"|" に続くコマンドの出力を読み取ります。
  # 
  # @param path ファイル名を表す文字列か "|コマンド名" を指定します。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。
  #           空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # 
  # @param chomp true を指定すると各行の末尾から "\n", "\r", または "\r\n" を取り除きます。
  # 
  # @raise Errno::EXXX path のオープンに失敗した場合、発生します。
  # 
  # //emlist[例:rs 指定なし][ruby]{
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # IO.foreach("testfile")  # => #<Enumerator: IO:foreach("testfile")>
  # IO.foreach("testfile") { |x| print "GOT ", x }
  # # => GOT line1
  # # GOT line2,
  # # GOT line3
  # //}
  # 
  # //emlist[例:カンマを行の区切りに指定（ rs = "," ）][ruby]{
  # IO.write("testfile", "line1,line2,line3")
  # IO.foreach("testfile", ",") { |x| puts "GOT #{x}" }
  # # => GOT line1,
  # # GOT line2,
  # # GOT line3
  # //}
  # 
  # //emlist[例: 各行の末尾から "\n", "\r", または "\r\n" を取り除く（chomp = true）][ruby]{
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # IO.foreach("testfile", chomp: true) { |x| print "GOT ", x }
  # # => GOT line1GOT line2,GOT line3
  # //}
  # 
  # @see [[m:$/]]
  def foreach; end

  # --- pipe                    -> [IO]
  # --- pipe(ext_enc)           -> [IO]
  # --- pipe(enc_str, opts={})           -> [IO]
  # --- pipe(ext_enc, int_enc, opts={})  -> [IO]
  # --- pipe{|read_io, write_io| ... } -> object
  # --- pipe(ext_enc){|read_io, write_io| ... } -> object
  # --- pipe(enc_str, opt={}){|read_io, write_io| ... }           -> object
  # --- pipe(ext_enc, int_enc, opt={}){|read_io, write_io| ... }  -> object
  # 
  # [[man:pipe(2)]] を実行して、相互につながった2つの
  # [[c:IO]] オブジェクトを要素とする配列を返します。
  # 
  # 戻り値の配列は最初の要素が読み込み側で、次の要素が書き込み側です。
  # 
  # ブロックが渡された場合は、そのブロックに2つの IO オブジェクトが渡され、
  # ブロックの返り値がこのメソッドの返り値となります。
  # ブロック終了時に IO オブジェクトがもし close されていないならば
  # close します(close されていてるオブジェクトはそのままです)。
  # 
  # 得られる2つの IO オブジェクトのエンコーディングを引数で指定することが
  # できます。
  # 
  # @param enc_str 読み込み側の外部エンコーディングを文字列で指定します。
  #                文字列がコロンを挟んだ二つのエンコーディング名 "A:B" である場合
  #                最初のものが外部エンコーディング、次が内部エンコーディングを意味します。
  # 
  # @param ext_enc 読み込み側の外部エンコーディングを Encoding オブジェクトで指定します。
  # 
  # @param int_enc 読み込み側の内部エンコーディングを Encoding オブジェクトで指定します。
  # @param opt エンコーディングなどを設定するオプション引数(see [[m:IO.new]])
  # 
  # @raise Errno::EXXX IO オブジェクトの作成に失敗した場合に発生します。
  # 
  #   r, w = IO.pipe
  #   p [r, w]            # => [#<IO:0x401b90f8>, #<IO:0x401b7718>]
  #   Thread.new do
  #     w.puts "foo"
  #     w.close
  #   end
  #   p r.gets           # => "foo\n"
  def pipe; end

  # --- popen(env = {}, command, mode = "r", opt={}) -> IO
  # --- popen(env = {}, command, mode = "r", opt={}){|f| ... } -> object
  # --- popen([env = {}, cmdname, *args, execopt={}], mode = "r", opt={}) -> IO
  # --- popen([env = {}, cmdname, *args, execopt={}], mode = "r", opt={}){|f| ... } -> object
  # --- popen([env = {}, [cmdname, arg0], *args, execopt={}], mode = "r", opt={}) -> IO
  # --- popen([env = {}, [cmdname, arg0], *args, execopt={}], mode = "r", opt={}){|f| ... } -> object
  # --- popen(env = {}, [cmdname, *args, execopt={}], mode = "r", opt={}) -> IO
  # --- popen(env = {}, [cmdname, *args, execopt={}], mode = "r", opt={}){|f| ... } -> object
  # --- popen(env = {}, [[cmdname, arg0], *args, execopt={}], mode = "r", opt={}) -> IO
  # --- popen(env = {}, [[cmdname, arg0], *args, execopt={}], mode = "r", opt={}){|f| ... } -> object
  # 
  # サブプロセスを実行し、そのプロセスの標準入出力
  # との間にパイプラインを確立します。生成したパイプを [[c:IO]] オブジェクトとして返します。
  # 
  #   p io = IO.popen("cat", "r+")  # => #<IO:fd 4>
  #   io.puts "foo"
  #   io.close_write
  #   p io.gets                     # => "foo\n"
  # 
  # サブプロセスを指定する方法は2通りあります。文字列を指定する場合と配列を指定する場合です。
  # 文字列の場合は、シェルを経由して子プロセスを実行し、
  # 配列の場合は、シェルを経由せずに子プロセスを実行します。
  # 
  # シェルを経由しない場合(上のシグネチャで cmdname を含む場合)には *args
  # がサブプロセスの引数として使われます。この場合には *args はシェルでの
  # ワイルドカード展開などはなされません。
  # 
  # 配列内に配列を指定することで、arg0(みせかけのプログラム名)を指定することができます。
  # 
  # ブロックが与えられた場合は生成した IO オブジェクトを引数にブ
  # ロックを実行し、ブロックの実行結果を返します。ブロックの実行後、生成したパイ
  # プは自動的にクローズされます。
  # 
  #   p IO.popen("cat", "r+") {|io|
  #     io.puts "foo"
  #     io.close_write
  #     io.gets
  #   }
  #   # => "foo\n"
  # 
  # 
  # opt でプロセス起動のためのオプションや、パイプ IO オブジェクトの属性(エンコーディングや
  # 読み書き能力)を指定することができます。
  # プロセス起動のためのオプションは [[m:Kernel.#spawn]] と、
  # パイプオブジェクトの属性の指定のオプションは [[m:IO.new]] と共通です。
  # つまり、 :external_encoding や :unsetenv_others が指定できます。
  # オプションの詳しい意味は [[m:Kernel.#spawn]] や [[m:IO.new]] を参照してください。
  # 
  #   # nkfプロセスから得られる文字列を EUC-JP と指定する
  #   # IO.new などと共通のオプションが指定できる
  #   IO.popen("nkf -e filename", external_encoding: "EUC-JP"){|nkf_io|
  #     nkf_io.read 
  #   }
  # 
  # これに加えて、プロセス起動のためのオプションを execopt で指定することもできます。
  # execopt ではエンコーディングなどは指定できません。
  # 
  #   # 標準エラー出力を子プロセス側で標準出力にリダイレクトする
  #   # 標準エラー出力と標準出力がマージされる
  #   # Kernel.#spawn と共通のオプション
  #   IO.popen(["ls", "/", :err=>[:child, :out]]) {|ls_io|
  #     ls_result_with_error = ls_io.read
  #   }
  #   
  #   # 上と同じ、配列の外側でもオプションが指定できる
  #   IO.popen(["ls", "/"], :err=>[:child, :out]) {|ls_io|
  #     ls_result_with_error = ls_io.read
  #   }
  # 
  # @param env 環境変数を { 変数名 => 内容 } という形式の [[c:Hash]] で渡します。
  # @param command コマンド名を文字列で指定します。シェルを経由して実行されます。
  # @param cmdname コマンド名を文字列で指定します
  # @param arg0 みせかけのコマンド名を指定します
  # @param args コマンドのパラメータを文字列で指定します
  # @param execopt プロセス実行に関するオプションを Hash で指定します。
  # @param mode オープンする IO ポートのモードを指定します。mode の詳細は [[m:Kernel.#open]] 参照して下さい。
  # @param opt プロセス実行やパイプのIOのエンコーディングなどを設定するオプションを指定します
  # 
  # @raise Errno::EXXX パイプ、あるいは子プロセスの生成に失敗した場合に発生します。
  # 
  # --- popen("-", mode = "r", opt={})                -> IO
  # --- popen("-", mode = "r", opt={}) {|io| ... }    -> object
  # --- popen(env, "-", mode = "r", opt={})            -> IO
  # --- popen(env, "-", mode = "r", opt={}){|io| ... } -> object
  # 
  # 第一引数に文字列 "-" が指定された時、[[man:fork(2)]] を
  # 行い子プロセスの標準入出力との間にパイプラインを確立します。
  # 親プロセスでは IO オブジェクトを返し、子プロセスでは
  # nil を返します。
  # 
  #   io = IO.popen("-", "r+")
  #   if io  # parent
  #     io.puts "foo"
  #     p io.gets                   # => "child output: foo\n"
  #     io.close
  #   else   # child
  #     s = gets
  #     print "child output: " + s
  #     exit
  #   end
  #   
  # ブロックを与えられた場合、親プロセスでは生成した IO オブジェクトを引数に
  # ブロックを実行し、その結果を返します。ブロックの実行後、生成したパイ
  # プは自動的にクローズされます。
  # 子プロセスでは nil を引数にブロックを実行し終了します。  
  # 
  #   p IO.popen("-", "r+") {|io|
  #     if io   # parent
  #       io.puts "foo"
  #       io.gets
  #     else    # child
  #       s = gets
  #       puts "child output: " + s
  #     end
  #   }
  #   # => "child output: foo\n"
  # 
  # opt ではエンコーディングの設定やプロセス起動のためのオプションが指定できます。
  # [[m:IO.new]] や [[m:Kernel.#spawn]] で指定できるものと共通なので
  # 詳しくはそちらを見てください。
  # 
  # @param env 環境変数を { 変数名 => 内容 } という形式の [[c:Hash]] で渡します。
  # @param mode オープンする IO ポートのモードを指定します。mode の詳細は [[m:Kernel.#open]] 参照して下さい。
  # @param opt エンコーディングなどを設定するオプション引数(see [[m:IO.new]])
  # 
  # @raise Errno::EXXX パイプ、あるいは子プロセスの生成に失敗した場合に発生します。
  def popen; end

  # --- read(path, opt = {})     -> String | nil
  # --- read(path, length = nil, opt = {})     -> String | nil
  # --- read(path, length = nil, offset = 0, opt = {})     -> String | nil
  # 
  # path で指定されたファイルを offset 位置から
  # length バイト分読み込んで返します。
  # 
  # 既に EOF に達している場合は nil を返します。ただし、length に nil か 0 が指定されている場合は、空文字列 "" を返します。例えば、IO.read(空ファイル) は "" を返します。
  # 
  # 引数 length が指定された場合はバイナリ読み込みメソッド、そうでない場合はテキスト読み込みメソッドとして
  # 動作します。
  # 
  # [[m:Kernel.#open]] と同様 path の先頭が "|" ならば、"|" に続くコマンドの出力を読み取ります。
  # 
  # @param path ファイル名を表す文字列か "|コマンド名" を指定します。
  # 
  # @param length 読み込む長さを整数で指定します。nil であるか省略した場合には、EOF まで読み込みます。
  # 
  # @param offset 読み込みを始めるオフセットを整数で指定します。
  # 
  # @param opt ファイル path を open する時に使われるオプションを Hash で指定します。
  # 
  # @raise Errno::EXXX path のオープン、offset 位置への設定、ファイルの読み込みに失敗した場合に発生します。
  # 
  # @raise ArgumentError length が負の場合に発生します。
  # 
  # 引数 opt で有効なキーと値は以下のとおりです。
  # キーはいずれも Symbol オブジェクトです。
  # 
  # : :encoding
  #   
  #   読み込んだ文字列のエンコーディングを指定します。
  #   読み込む長さを指定した場合はこれは無視されます。
  # 
  # : :mode
  #   
  #   [[m:IO.open]] のモードを指定します。
  #   "r" で始まる文字列である必要があります。
  # 
  # : :open_args
  #   
  #   [[m:IO.open]] に渡される引数を配列で指定します。
  # 
  # これらの他、 :external_encoding など
  # [[m:IO.open]] のオプション引数が指定できます。
  # 
  # @see [[m:IO.binread]]
  # 
  # 例:
  # 
  #   IO.read(empty_file)             #=> ""
  #   IO.read(empty_file, 1)          #=> nil
  #   IO.read(one_byte_file, 0, 10)   #=> ""
  #   IO.read(one_byte_file, nil, 10) #=> "" 
  #   IO.read(one_byte_file, 1, 10)   #=> nil
  def read; end

  # --- readlines(path, rs = $/, chomp: false, opts={})    -> [String]
  # --- readlines(path, limit, chomp: false, opts={})      -> [String]
  # --- readlines(path, rs, limit, chomp: false, opts={})  -> [String]
  # 
  # path で指定されたファイルを全て読み込んで、その各行を要素としてもつ配列を返します。
  # 
  # [[m:Kernel.#open]] と同様 path の先頭が "|" ならば、"|" に続くコマンドの出力を読み取ります。
  # 
  # テキスト読み込みメソッドとして動作します。
  # 
  # limit で最大読み込みバイト数を指定します。ただしマルチバイト文字が途中で
  # 切れないように余分に読み込む場合があります。
  # 
  # opts でファイルを開くときのオプションを指定します。エンコーディングなど
  # を指定できます。
  # [[m:File.open]] と同様なのでそちらを参照してください。
  # 
  # @param path ファイル名を表す文字列か "|コマンド名" を指定します。
  # 
  # @param rs 行の区切りを文字列で指定します。rs に nil を指定すると行区切りなしとみなします。空文字列 "" を指定すると連続する改行を行の区切りとみなします(パラグラフモード)。
  # @param limit 最大の読み込みバイト数
  # @param chomp true を指定すると各行の末尾から rs を取り除きます。
  # @param opts ファイルを開くときのオプション引数
  # 
  # @raise Errno::EXXX path のオープン、ファイルの読み込みに失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "line1\nline2,\nline3\n")
  # IO.readlines("testfile")             # => ["line1\n", "line2,\n", "line3\n"]
  # IO.readlines("testfile", ",")        # => ["line1\nline2,", "\nline3\n"]
  # //}
  # 
  # //emlist[例: rs を取り除く（chomp = true）][ruby]{
  # IO.write("testfile", "line1,\rline2,\r\nline3,\n")
  # IO.readlines("testfile", chomp: true)        # => ["line1,\rline2,", "line3,"]
  # IO.readlines("testfile", "\r", chomp: true)  # => ["line1,", "line2,", "\nline3,\n"]
  # //}
  def readlines; end

  # --- select(reads, writes = [], excepts = [], timeout = nil)    -> [[IO]] | nil
  # 
  # [[man:select(2)]] を実行します。
  # 
  # 与えられた入力/出力/例外待ちの  IO オブジェクトの中から準備ができたものを
  # それぞれ配列にして、配列の配列として返します。
  # タイムアウトした時には nil を返します。
  # 
  # @param reads 入力待ちする [[c:IO]] オブジェクトの配列を渡します。
  # 
  # @param writes 出力待ちする [[c:IO]] オブジェクトの配列を渡します。
  # 
  # @param excepts 例外待ちする [[c:IO]] オブジェクトの配列を渡します。
  # 
  # @param timeout タイムアウトまでの時間を表す数値または nil を指定します。数値で指定したときの単位は秒です。nil を指定した時には IO がどれかひとつレディ状態になるまで待ち続けます。
  # 
  # @raise IOError 与えられた IO オブジェクトが閉じられていた時に発生します。
  # 
  # @raise Errno::EXXX [[man:select(2)]] に失敗した場合に発生します。
  # 
  #  rp, wp = IO.pipe
  #  mesg = "ping "
  #  100.times{
  #    rs, ws, = IO.select([rp], [wp])
  #    if r = rs[0]
  #      ret = r.read(5)
  #      print ret
  #      case ret
  #      when /ping/
  #        mesg = "pong\n"
  #      when /pong/
  #        mesg = "ping "
  #      end
  #    end
  #    if w = ws[0]
  #      w.write(mesg)
  #    end
  #  }
  # 
  # @see [[m:Kernel.#select]]
  def select; end

  # --- sysopen(path, mode = "r", perm = 0666)     -> Integer
  # 
  # path で指定されるファイルをオープンし、ファイル記述子を返しま
  # す。
  # 
  # [[m:IO.for_fd]] などで IO オブジェクトにしない限り、このメソッ
  # ドでオープンしたファイルをクローズする手段はありません。
  # 
  # @param path ファイル名を表す文字列を指定します。
  # 
  # @param mode モードを文字列か定数の論理和で指定します。[[m:Kernel.#open]] と同じです。
  # 
  # @param perm [[man:open(2)]] の第 3 引数のように、ファイルを生成する場合の
  #             ファイルのパーミッションを整数で指定します。[[m:Kernel.#open]] と同じです。
  # 
  # @raise Errno::EXXX ファイルのオープンに失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.sysopen("testfile", "w+")   # => 3
  # //}
  # 
  # @see [[m:Kernel.#open]]
  def sysopen; end

  # --- try_convert(obj) -> IO | nil
  # 
  # obj を to_io メソッドによって [[c:IO]] オブジェクトに変換します。
  # 変換できなかった場合は nil を返します。
  # 
  #    IO.try_convert(STDOUT)     # => STDOUT
  #    IO.try_convert("STDOUT")   # => nil
  def try_convert; end

  # --- write(path, string, opt={}) -> Integer
  # --- write(path, string, offset=nil, opt={}) -> Integer
  # path で指定されるファイルを開き、string を書き込み、
  # 閉じます。
  # 
  # offset を指定するとその位置までシークします。
  # 
  # offset を指定しないと、書き込みの末尾でファイルを
  # 切り捨てます。
  # 
  # 引数最後のハッシュはファイルを開くときに使われます。
  # エンコーディングなどを指定することができます。
  # 詳しくは [[m:IO.open]] を見てください。
  # 
  # @param path ファイル名文字列
  # @param string 書き込む文字列
  # @param offset 書き込み開始位置
  # @param opt ファイルを開くときのオプション引数
  # 
  # //emlist[例][ruby]{
  # text = "This is line one\nThis is line two\nThis is line three\nAnd so on...\n"
  # IO.write("testfile", text)              # => 66
  # IO.write("testfile", "0123456789", 20)  #=> 10
  # IO.read("testfile")
  # # => "This is line one\nThi0123456789two\nThis is line three\nAnd so on...\n"
  # IO.write("testfile", "0123456789")      #=> 10
  # IO.read("testfile")                     # => "0123456789"
  # //}
  # 
  # @see [[m:IO.binwrite]]
  def write; end

  # --- SEEK_CUR -> Integer
  # 
  # [[m:IO#seek]] を参照してください。
  def SEEK_CUR; end

  # --- SEEK_DATA -> Integer
  # 
  # [[m:IO#seek]] を参照してください。
  # 
  # Linux 3.1 以降で利用可能です。
  def SEEK_DATA; end

  # --- SEEK_END -> Integer
  # 
  # [[m:IO#seek]] を参照してください。
  def SEEK_END; end

  # --- SEEK_HOLE -> Integer
  # 
  # [[m:IO#seek]] を参照してください。
  # 
  # Linux 3.1 以降で利用可能です。
  def SEEK_HOLE; end

  # --- SEEK_SET -> Integer
  # 
  # [[m:IO#seek]] を参照してください。
  def SEEK_SET; end

end
