module Kernel
  # --- $! -> Exception | nil
  # 
  # 最後に例外が発生したときの [[c:Exception]] オブジェクトです。
  # 該当する例外がないときは nil です。
  # 
  # [[m:Kernel.#raise]] によって設定されます。
  # 
  # この変数はスレッドローカル、読み取り専用です。
  def !; end

  # --- $"               -> [String]
  # --- $LOADED_FEATURES -> [String]
  # 
  # [[m:Kernel.#require]] でロードされたファイル名を含む配列です。
  # 
  # [[m:Kernel.#require]] で同じファイルを
  # 複数回ロードしないようにするためのロックとして使われます。
  # 
  # この変数はグローバルスコープです。
  def "; end

  # --- $$ -> Integer
  # 現在実行中の Ruby プロセスのプロセス ID です。
  # [[m:Process.#pid]] と同じです。
  # 
  # この変数はグローバルスコープです。
  def $; end

  # --- $& -> String | nil
  # 
  # 現在のスコープで最後に成功した正規表現のパターンマッチでマッチした文字列です。
  # 最後のマッチが失敗していた場合には nil となります。
  # 
  # [[m:Regexp.last_match]][0] と同じです。
  # 
  # この変数はローカルスコープかつスレッドローカル、読み取り専用です。
  # Ruby起動時の初期値は nil です。
  # 
  # //emlist[例][ruby]{
  # str = '<p><a href="http://example.com">example.com</a></p>'
  # if %r[<a href="(.*?)">(.*?)</a>] =~ str
  #   p $& 
  # end
  # #=> "<a href=\"http://example.com\">example.com</a>"
  # //}
  def &; end

  # --- $' -> String | nil
  # 
  # 現在のスコープで最後に成功した正規表現のパターンマッチでマッチした
  # 部分より後ろの文字列です。
  # 最後のマッチが失敗していた場合には nil となります。
  # 
  # [[m:Regexp.last_match]].post_match と同じです。
  # 
  # この変数はローカルスコープかつスレッドローカル、読み取り専用です。
  # Ruby起動時の初期値は nil です。
  # 
  # //emlist[例][ruby]{
  # str = '<p><a href="http://example.com">example.com</a></p>'
  # if %r[<a href="(.*?)">(.*?)</a>] =~ str
  #   p $'
  # end
  # #=> "</p>"
  # //}
  def '; end

  # --- $* -> [String]
  # 
  # Rubyスクリプトに与えられた引数を表す配列です。
  # 組み込み定数 [[m:Object::ARGV]] の別名です。
  # 
  # Ruby 自身に対する引数は取り除かれています。
  # 
  # この変数はグローバルスコープです。
  def *; end

  # --- $+ -> String | nil
  # 
  # 現在のスコープで最後に成功した正規表現のパターンマッチで
  # マッチした中で最後の括弧に対応する部分文字列です。
  # 
  # 最後のマッチが失敗していた場合には nil。
  # いくつかある選択型のパターンのどれがマッチしたのか分からない時に便利です。
  # 
  # この変数はローカルスコープかつスレッドローカルです。
  def +; end

  # --- $, -> String | nil
  # 
  # デフォルトの出力フィールド区切り文字列です。
  # [[m:Array#join]] で引数を省略した場合と、
  # [[m:Kernel.#print]] の各引数の間で出力されます。
  # 
  # デフォルト値は nil で、空文字列と同じ結果になります。
  # 
  # Ruby 2.7からは nil 以外に変更することは非推奨になったため、
  # nil 以外を代入すると警告がでるようになりました。
  # 
  # この変数はグローバルスコープです。
  def ,; end

  # --- $/  -> String | nil
  # --- $-0 -> String | nil
  # 
  # 入力レコード区切りを表す文字列です。
  # awk の RS 変数のように働きます。
  # 
  # [[m:Kernel.#gets]] のような「行」単位の読み込みメソッドが「行」の区切りとして使用します。
  # Rubyがコマンドオプション -0 付きで起動されたときには -0 で指定された値が既定値となります。そうでないとき、既定値は "\n" です。
  # 
  # この変数に nil を設定すると読み込みメソッドはファイル全体を一度に読み込みます。
  # 空文字列 "" を設定するとパラグラフモードとみなされ、
  # 2 つ以上連続した改行が「行」の区切りになります。
  # 
  # $/ には正規表現は使えません。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -0; end

  # --- $;  -> Regexp | String | nil
  # --- $-F -> Regexp | String | nil
  # 
  # [[m:String#split]] で引数を省略した場合の区切り文字です。
  # 
  # Ruby 2.7からは nil 以外に変更することは非推奨になったため、
  # nil 以外を代入すると警告がでるようになりました。
  # 
  # nilを設定すると特殊な分割を行います。
  # 詳細は [[m:String#split]] を参照してください。
  # 
  # コマンドラインオプション -F を指定して Ruby を起動した場合、
  # 初期値は -F で指定した値です。
  # それ以外の時には初期値は nil です。
  # 
  # $; には任意のオブジェクトを代入できます。
  # ただし、[[m:String#split]] の仕様変更を考慮すると
  # 常に正規表現を指定すべきです。
  # 
  # Ruby のバージョンによらず動作するプログラムを書くときは
  # $; に頼らないコードを書くべきです。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -F; end

  # --- $:         -> [String]
  # --- $LOAD_PATH -> [String]
  # --- $-I        -> [String]
  # Rubyライブラリをロードするときの検索パスです。
  # 
  # [[m:Kernel.#load]] や [[m:Kernel.#require]]
  # がファイルをロードする時に検索するディレクトリのリストを含む配列です。
  # 
  # 起動時にはコマンドラインオプション -I で指定したディレクトリ、
  # 環境変数 RUBYLIB の値、
  # コンパイル時に指定したデフォルト値
  # をこの順番で含みます。
  # 
  # 以下に典型的な UNIX システム上でのロードパスを示します。
  # 
  #   -I で指定したパス
  #   環境変数 RUBYLIB の値
  #   /usr/local/lib/ruby/site_ruby/VERSION        サイト固有、バージョン依存のライブラリ
  #   /usr/local/lib/ruby/site_ruby/VERSION/ARCH   サイト固有、システム依存、拡張ライブラリ
  #   /usr/local/lib/ruby/site_ruby                サイト固有ライブラリ
  #   /usr/local/lib/ruby/VERSION                  標準ライブラリ
  #   /usr/local/lib/ruby/VERSION/ARCH             標準、システム依存、拡張ライブラリ
  # 
  # 上記表中の VERSION は Ruby のバージョンを表す文字列で、
  # 「1.6」や「1.8」です。
  # ARCH はハードウェアと OS を表す文字列で、
  # 「i686-linux」や「alpha-osf5.1」などです。
  # ARCH の値は Config::CONFIG['arch'] で得られます。
  # 
  # コンパイル時のデフォルトパスは
  # 多くの UNIX システムでは "/usr/local/lib/ruby" です。
  # [[d:platform/mswin32]]、[[d:platform/mingw32]]、[[d:platform/Cygwin]]
  # 環境では
  # ruby.dll の位置からの相対で決まります。
  # 
  # require 'foo' を実行すると、
  # 以下のように foo.rb と foo.so が交互に探索されます。
  # 
  #   /usr/local/lib/ruby/site_ruby/VERSION/foo.rb
  #   /usr/local/lib/ruby/site_ruby/VERSION/foo.so
  #   /usr/local/lib/ruby/site_ruby/VERSION/ARCH/foo.rb
  #   /usr/local/lib/ruby/site_ruby/VERSION/ARCH/foo.so
  #     :
  #     :
  # 
  # なお、共有ライブラリの拡張子が .so でないシステムでは
  # 「.so」が適切な拡張子に変更されます。
  # 例えば HP-UX では require 'foo.so' とすると foo.sl を検索します。
  # したがって Ruby で記述されたコードでは常に .so を使うべきです。
  # 
  # なお、ロードパスをコマンドラインから調べるには
  # 
  #   $ ruby -e 'puts $:'
  # 
  # とします。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]], [[d:spec/envvars]]
  def -I; end

  # --- $KCODE -> object
  # --- $-K    -> object
  # 
  # 通常のグローバル変数です。
  # 
  # Ruby 2.7 以前は特殊変数でしたが、Ruby 3.0 から通常のグローバル変数になりました。
  # 任意のオブジェクトを代入して nil 以外の値に設定できます。
  # 
  # @see [[d:spec/rubycmd]]
  def -K; end

  # --- $-W -> 0 | 1 | 2
  # コマンドラインオプション -W を指定したとき、
  # そのコマンドライン引数の値が設定されます。
  # 
  # つまり、[[m:$VERBOSE]] の値によって以下の値を返します。
  # 
  # : nil
  #     0。警告を出力しない。
  # : false
  #     1。重要な警告のみ出力する。(デフォルト)
  # : true
  #     2。すべての警告を出力する。
  # 
  # この変数には代入できません。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -W; end

  # --- $-a -> bool
  # 自動 split モードを表すフラグです。
  # 
  # コマンドラインオプション -a を使ったとき true に設定されます。
  # この変数には代入できません。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -a; end

  # --- $DEBUG -> bool
  # --- $-d    -> bool
  # 
  # この値が真のときはインタプリタがデバッグモードになります。
  # 
  # コマンドラインオプション -d でセットされます。
  # スクリプトから代入することもできます。
  # 
  # デバッグモードでは、通常モードに比べて以下の違いがあります。
  # 
  #  * 通常時はいずれかのスレッドが例外によって終了しても
  #    他のスレッドは実行を続けますが、デバッグモードでは
  #    いずれかのスレッドが例外によって終了した時に
  #    インタプリタ全体が中断されるようになります。
  #    [[m:Thread.abort_on_exception]] を
  #    true にセットするのと同じ効果です。
  #  * Thread.abort_on_exception= の効果がなくなります。
  #  * 例外を捕捉しているかどうかに関係なく、
  #    例外が発生した時点で [[m:$stderr]] にそれが出力されます。
  #    スクリプトの処理は続行されます。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -d; end

  # --- $-i -> String | nil
  # in-place 置換モードで用いられます。
  # 
  # コマンドラインオプション -i を指定したとき、空文字列になります。
  # -i オプションに拡張子を渡した場合にはその拡張子が文字列として格納されます。
  # 
  # -i オプションが指定されていない時の値は nil です。
  # 
  # スクリプト内で $-i に代入することもでき、
  # その場合は [[m:Object::ARGV]] の次の
  # ファイルを読み込み始めるタイミングで in-place 置換を開始します。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -i; end

  # --- $-l -> bool
  # 
  # コマンドラインオプション -l を指定したとき true に設定されます。
  # この変数には代入できません。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -l; end

  # --- $-p -> bool
  # 
  # コマンドラインオプション -p を指定したとき true に設定されます。
  # この変数には代入できません。
  # 
  # この変数はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -p; end

  # --- $VERBOSE -> bool | nil
  # --- $-v      -> bool | nil
  # --- $-w      -> bool | nil
  # 冗長メッセージフラグです。Rubyインタプリタへの
  # コマンドラインオプション -v でセットされます。
  # 
  # 警告レベルは三段階あり、それぞれ以下の通りです。
  # 
  # : nil
  #     警告を出力しない
  # : false
  #     重要な警告のみ出力 (デフォルト)
  # : true
  #     すべての警告を出力する
  # 
  # $VERBOSE に nil, false 以外を代入すると値は true になります。
  # 
  # $VERBOSE の値はコマンドラインオプション
  # -W でも設定できます。
  # -W0 オプションで nil、
  # -W1 オプションで false、
  # -W2, -W オプションで true が設定されます。
  # -v オプションや
  # -w オプションを指定した場合は
  # true が設定されます。
  # 
  # $VERBOSE はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def -v; end

  # --- $. -> Integer
  # 
  # いずれかの [[c:IO]] オブジェクトが最後に読んだ行の行番号です。
  # [[m:Object::ARGF]] などの IO 互換のオブジェクトも $. を更新します。
  # 
  # IO からの読み込みが起きるタイミングが予測不能であるような複雑なプログラムでは使用すべきではありません。特に、マルチスレッドプログラムではスレッド間で競合を起こす可能性があります。
  # そのような場合には、 [[m:IO#lineno]] を使用してください。
  # 
  # この変数はグローバルスコープです。
  # Ruby起動時の初期値は 0 です。
  def .; end

  # --- $0 -> String
  # --- $PROGRAM_NAME -> String
  # 
  # 現在実行中の Ruby スクリプトの名前を表す文字列です。
  # 
  # OS と Ruby のバージョンによっては、この変数に代入すると [[man:ps(1)]] の出力が変化します。
  # この機能はプログラムの現在の状態を表示するのに便利です。
  # 
  # この変数はグローバルスコープです。
  def 0; end

  # --- $1 -> String | nil
  # --- $2 -> String | nil
  # --- $3 -> String | nil
  # --- $4 -> String | nil
  # --- $5 -> String | nil
  # --- $6 -> String | nil
  # --- $7 -> String | nil
  # --- $8 -> String | nil
  # --- $9 -> String | nil
  # --- $10 -> String | nil
  # --- $11 -> String | nil
  # 
  # 最後に成功したパターンマッチで n 番目の括弧にマッチした値が格納されます。
  # 該当する括弧がなければ nil が入っています。(覚え方: \数字 のようなもの)
  # 
  # 番号 n はいくらでも大きな正整数を利用できます。
  # 
  # [[m:Regexp.last_match]](1),
  # [[m:Regexp.last_match]](2), ... と同じ。
  # 
  # これらの変数はローカルスコープかつスレッドローカル、読み取り専用です。
  # 
  # //emlist[例][ruby]{
  # str = '<p><a href="http://example.com">example.com</a></p>'
  # if %r[<a href="(.*?)">(.*?)</a>] =~ str
  #   print $1
  #   print $2
  # end
  # #=> "http://example.com"
  # #=> "example.com"
  # //}
  def 1; end

  # --- $< -> IO
  # 
  # すべての引数または標準入力で構成される仮想ファイルです。
  # 定数 [[m:Object::ARGF]] の別名です。
  # 
  # この変数はグローバルスコープ、読み取り専用です。
  def <; end

  # --- $= -> bool
  # 
  # 過去との互換性のために残されていますが、もはや何の意味もありません。
  # 
  # 値は常に false です。代入しても無視されます。
  # 
  # この変数はグローバルスコープです。
  # 
  # //emlist[例][ruby]{
  # $= = true # => warning: variable $= is no longer effective; ignored
  # $=        # => warning: variable $= is no longer effective
  #           #    false
  # //}
  def =; end

  # --- $>      -> object
  # --- $stdout -> object
  # 
  # 標準出力です。
  # 
  # 組み込み関数 [[m:Kernel.#print]]、[[m:Kernel.#puts]] や
  # [[m:Kernel.#p]] などのデフォルトの出力先となります。
  # 初期値は [[m:Object::STDOUT]] です。
  # コマンドラインオプションオプション -i を指定した場合には
  # 読み込み元と同じ名前のファイルを表します。
  # 
  # $stdout に代入するオブジェクトには
  # write という名前のメソッドが定義されていなければいけません。
  # 
  # 自プロセスの標準出力をリダイレクトしたいときには、
  # 以下のように $stdout に代入すれば十分です。
  # 
  # //emlist[例][ruby]{
  # # 標準出力の出力先を /tmp/foo に変更
  # $stdout = File.open("/tmp/foo", "w")
  # puts "foo"         # 出力する
  # $stdout = STDOUT   # 元に戻す
  # //}
  # 
  # 自プロセスだけでなく、子プロセスの標準出力もリダイレクトしたいときは
  # 以下のように [[m:IO#reopen]] を使います。
  # 
  # //emlist[例][ruby]{
  # STDOUT.reopen("/tmp/foo", "w")
  # //}
  # 
  # また、リダイレクトしたあと
  # 出力先をまた元に戻したい場合は以下のようにします。
  # 
  # //emlist[例][ruby]{
  # stdout_old = $stdout.dup        # 元の $stdout を保存する
  # $stdout.reopen("/tmp/foo")      # $stdout を /tmp/foo にリダイレクトする
  # puts "foo"                      # /tmp/foo に出力
  # $stdout.flush                   # 念のためフラッシュする
  # $stdout.reopen stdout_old       # 元に戻す
  # //}
  # 
  # $stdout はグローバルスコープです。
  # 
  # @see [[d:spec/rubycmd]]
  def >; end

  # --- $? -> Process::Status | nil
  # 
  # このスレッドで最後に終了した子プロセスのステータスです。
  # 
  # [[c:Process::Status]] オブジェクトが入っています。
  # 子プロセスの終了時ステータスは [[m:Process::Status#exitstatus]] で得られます。
  # 
  # この変数はスレッドローカルで読み取り専用です。
  # 
  # @see [[m:Process.#wait]]
  # @see [[m:Process.last_status]]
  def ?; end

  # --- $@ -> [String] | nil
  # 
  # 最後に例外が発生した時のバックトレースを表す配列です。
  # [[m:Kernel.#raise]] によって設定されます。
  # 
  # 配列の各要素はメソッドの呼び出し位置を示す文字列で形式は
  # 
  #   "filename:line"
  # 
  # または
  # 
  #   "filename:line:in `methodname'"
  # 
  # です。これは [[m:Kernel.#caller]] が返す値と同じ形式です。
  # 
  # $@ へ値を代入するときは、[[m:$!]] が nil であってはいけません。
  # $@ の値は、[[m:$!]].backtrace の値と同じです。
  # また、$@ への代入は [[m:$!]].set_backtrace 呼び出しと同じです。
  # 
  # 文字列の配列でも nil でもない値を代入しようとすると、 [[c:TypeError]] 例外が発生します。
  # 
  # この変数はスレッドローカルです。
  def @; end

  # --- $ARGV -> [String]
  # 
  # [[m:$*]] の別名
  # 
  #   require "English"
  #   p $ARGV
  #   # end of sample.rb
  # 
  #   ruby sample.rb 31 /home/hoge/fuga.txt
  #   #=> ["31", "/home/hoge/fuga.txt"]
  def ARGV; end

  # --- $CFLAGS -> String
  # 
  # 拡張ライブラリをコンパイルするときの C コンパイラのオプションや、
  # ヘッダファイルのディレクトリを指定する文字列です。
  # 
  # [[m:Kernel#dir_config]] の検査が成功すると、
  # この変数の値に " -Idir" が追加されます。
  def CFLAGS; end

  # --- $CHILD_STATUS -> Process::Status | nil
  # 
  # [[m:$?]] の別名
  # 
  #   require "English"
  # 
  #   out = `wget https://www.ruby-lang.org/en/about/license.txt -O - 2>/dev/null`
  # 
  #   if $CHILD_STATUS.to_i == 0
  #     print "wget success\n"
  #     out.split(/\n/).each { |line|
  #       printf "%s\n", line
  #     }
  #   else
  #     print "wget failed\n"
  #   end
  def CHILD_STATUS; end

  # --- $DEFAULT_INPUT -> IO
  # 
  # [[m:$<]] の別名
  # 
  #   require "English"
  #   while line = $DEFAULT_INPUT.gets
  #     p line
  #   end
  #   # end of sample.rb
  # 
  #   ruby sample.rb < /etc/passwd
  #   # => "hoge:x:500:501::/home/hoge:/bin/bash\n"
  #        ...
  def DEFAULT_INPUT; end

  # --- $DEFAULT_OUTPUT -> IO
  # 
  # [[m:$>]] の別名
  # 
  #   require "English"
  # 
  #   dout = $DEFAULT_OUTPUT.dup
  #   $DEFAULT_OUTPUT.reopen("out.txt", "w")
  #   print "foo"
  #   $DEFAULT_OUTPUT.close
  #   $DEFAULT_OUTPUT = dout
  #   p "bar" # => bar
  #   p File.read("out.txt") #=> foo
  def DEFAULT_OUTPUT; end

  # --- $ERROR_INFO -> Exception  | nil
  # 
  # [[m:$!]] の別名
  # 
  #   require "English"
  #   class SomethingError < StandardError; end
  # 
  #   begin
  #     raise SomethingError
  #   rescue
  #     p $ERROR_INFO.backtrace #=> ["sample.rb:5"]
  #     p $ERROR_INFO.to_s #=> "SomethingError"
  #   end
  def ERROR_INFO; end

  # --- $ERROR_POSITION -> [String] | nil
  # 
  # [[m:$@]] の別名
  # 
  #   require "English"
  #   class SomethingError < StandardError; end
  # 
  #   begin
  #     raise SomethingError
  #   rescue
  #     p $ERROR_POSITION #=> ["sample.rb:5"]
  #   end
  def ERROR_POSITION; end

  # --- $FS              -> String | nil
  # --- $FIELD_SEPARATOR -> String | nil
  # 
  # [[m:$;]] の別名
  # 
  #   require "English"
  # 
  #   str = "hoge,fuga,ugo,bar,foo"
  #   p str.split #=> ["hoge,fuga,ugo,bar,foo"]
  #   $FIELD_SEPARATOR = ","
  #   p str.split #=> ["hoge", "fuga", "ugo", "bar", "foo"]
  def FIELD_SEPARATOR; end

  # --- $FILENAME -> String
  # 
  # 仮想ファイル [[m:Object::ARGF]] で現在読み込み中のファイル名です。
  # [[m:ARGF.class#filename]] と同じです。
  # 
  # この変数はグローバルスコープです。
  def FILENAME; end

  # --- $IGNORECASE -> bool
  # 
  # 過去との互換性のために残されていますが、もはや何の意味もありません。
  # 
  # 値は常に false です。代入しても無視されます。
  # 
  # [[m:$=]] の別名
  # 
  #   require "English"
  # 
  #   $IGNORECASE = true # => warning: variable $= is no longer effective; ignored
  #   $IGNORECASE        # => warning: variable $= is no longer effective
  #                      #    false
  def IGNORECASE; end

  # --- $INPUT_LINE_NUMBER -> Integer
  # --- $NR                -> Integer
  # 
  # [[m:$.]] の別名
  # 
  #   1 e
  #   2 f
  #   3 g
  #   4 h
  #   5 i
  #   # end of a.txt
  # 
  #   require "English"
  # 
  #   File.foreach(ARGV.at(0)){|line|
  #     # read line
  #   }
  #   p $INPUT_LINE_NUMBER
  #   # end of sample.rb
  # 
  #   ruby sample.rb a.txt
  #   #=> 5
  def INPUT_LINE_NUMBER; end

  # --- $RS                     -> String | nil
  # --- $INPUT_RECORD_SEPARATOR -> String | nil
  # 
  # [[m:$/]] の別名
  # 
  #   require "English"
  # 
  #   $INPUT_RECORD_SEPARATOR = '|'
  #   array = []
  #   while line = DATA.gets
  #     array << line
  #   end
  #   p array #=> ["ugo|", "ego|", "fogo\n"]
  # 
  #   __END__
  #   ugo|ego|fogo
  def INPUT_RECORD_SEPARATOR; end

  # --- $LAST_MATCH_INFO -> MatchData | nil
  # 
  # [[m:$~]] の別名
  # 
  #   require "English"
  # 
  #   str = "<a href=https://www.ruby-lang.org/en/about/license.txt>license</a>"
  # 
  #   if /<a href=(.+?)>/ =~ str
  #     p $LAST_MATCH_INFO[0] #=> "<a href=https://www.ruby-lang.org/en/about/license.txt>"
  #     p $LAST_MATCH_INFO[1] #=> "https://www.ruby-lang.org/en/about/license.txt"
  #     p $LAST_MATCH_INFO[2] #=> nil
  #   end
  def LAST_MATCH_INFO; end

  # --- $LAST_PAREN_MATCH -> String | nil
  # 
  # [[m:$+]] の別名
  # 
  #   require "English"
  # 
  #   r1 = Regexp.compile("<img src=(http:.+?)>")
  #   r2 = Regexp.compile("<a href=(http|ftp).+?>(.+?)</a>")
  # 
  #   while line = DATA.gets
  #     [ r1, r2 ].each {|rep|
  #       rep =~ line
  #       p $+
  #     }
  #   end
  #   __END__
  #   <tr> <td><img src=http://localhost/a.jpg></td> <td>ikkou</td> <td><a href=http://localhost/link.html>link</a></td> </tr>
  #   #enf of sample.rb
  # 
  #   $ ruby sample.rb
  #   "http://localhost/a.jpg"
  #   "link"
  def LAST_PAREN_MATCH; end

  # --- $LAST_READ_LINE -> String | nil
  # 
  # [[m:$_]] の別名
  # 
  #   1 e
  #   2 f
  #   3 g
  #   4 h
  #   5 i
  #   # end of a.txt
  # 
  #   ruby -rEnglish -ne'p $LAST_READ_LINE' a.txt
  #   #=>
  #   "1 e\n"
  #   "2 f\n"
  #   "3 g\n"
  #   "4 h\n"
  #   "5 i\n"
  def LAST_READ_LINE; end

  # --- $LDFLAGS -> String
  # 
  # 拡張ライブラリをリンクするときのリンカのオプション、
  # ライブラリファイルのディレクトリを指定する文字列です。
  # 
  # [[m:Kernel#find_library]] または [[m:Kernel#dir_config]]
  # の検査が成功すると、$LDFLAGS の値に "-Ldir" を追加します。
  def LDFLAGS; end

  # --- $MATCH -> String | nil
  # 
  # [[m:$&]] の別名
  # 
  #   require "English"
  # 
  #   str = 'hoge,foo,bar,hee,hoo'
  # 
  #   /(foo|bar)/ =~ str
  #   p $MATCH     #=> "foo"
  def MATCH; end

  # --- $OFS                    -> String | nil
  # --- $OUTPUT_FIELD_SEPARATOR -> String | nil
  # 
  # [[m:$,]] の別名
  # 
  #   require "English"
  # 
  #   array = %w|hoge fuga ugo bar foo|
  #   p array.join #=> "hogefugaugobarfoo"
  #   $OUTPUT_FIELD_SEPARATOR = ","
  #   p array.join #=> "hoge,fuga,ugo,bar,foo"
  def OFS; end

  # --- $ORS                     -> String | nil
  # --- $OUTPUT_RECORD_SEPARATOR -> String | nil
  # 
  # [[m:$\]] の別名
  # 
  #   require "English"
  # 
  #   print "hoge\nhuga\n"
  #   $OUTPUT_RECORD_SEPARATOR = "\n"
  #   print "fuge"
  #   print "ugo"
  #   # end of sample.rb
  # 
  #   ruby sample.rb
  #   hoge
  #   huga
  #   fuge
  #   ugo
  def ORS; end

  # --- $PID        -> Integer
  # --- $PROCESS_ID -> Integer
  # 
  # [[m:$$]] の別名
  # 
  #   require "English"
  # 
  #   p sprintf("something%s", $PID) #=> "something5543" など
  def PID; end

  # --- $POSTMATCH -> String | nil
  # 
  # [[m:$']] の別名
  # 
  #   require "English"
  # 
  #   str = 'hoge,foo,bar,hee,hoo'
  # 
  #   /foo/ =~ str
  #   p $POSTMATCH #=> ",bar,hee,hoo"
  def POSTMATCH; end

  # --- $PREMATCH -> String | nil
  # 
  # [[m:$`]] の別名
  # 
  #   require "English"
  # 
  #   str = 'hoge,foo,bar,hee,hoo'
  # 
  #   /foo/ =~ str
  #   p $PREMATCH  #=> "hoge,"
  def PREMATCH; end

  # --- $SAFE -> object
  # 
  # 通常のグローバル変数です。
  # 
  # Ruby 2.7 以前は特殊変数でしたが、Ruby 3.0 から通常のグローバル変数になりました。
  def SAFE; end

  # --- $\ -> String | nil
  # 
  # 出力レコード区切りを表す文字列です。
  # [[m:Kernel.#print]] が最後にこの文字列を出力します。
  # 
  # デフォルトは nil で、何も出力しません。
  # 
  # この変数はグローバルスコープです。
  def \; end

  # --- $_ -> String | nil
  # 
  # 最後に [[m:Kernel.#gets]] または [[m:Kernel.#readline]] で読み込んだ文字列です。
  # EOF に達した場合には、 nil になります。
  # (覚え方: Perlと同じ)
  # 
  # [[m:Kernel.#print]] のような Perl 由来の幾つかのメソッドは、引数を省略すると代わりに $_ を利用します。
  # 
  # この変数はローカルスコープかつスレッドローカルです。
  # Ruby起動時の初期値は nil です。
  # 
  # @see [[m:Kernel.#print]], [[m:Kernel.#gets]], [[m:Kernel.#readline]], [[m:Object::ARGF]]
  # 
  # === 例
  # example.txt:
  #  foo
  #  bar
  #  baz
  # 
  # このとき、コマンド ruby -e 'print while gets' example.txt は次を出力します
  #  foo
  #  bar
  #  baz
  # 
  # ただし、このプログラムは次のように書く方がよりRuby的です。
  # //emlist[例][ruby]{
  # ARGF.each do |line|
  #   print line
  # end
  # //}
  def _; end

  # --- $` -> String | nil
  # 
  # 現在のスコープで最後に成功した正規表現のパターンマッチでマッチした
  # 部分より前の文字列です。
  # 最後のマッチが失敗していた場合には nil となります。
  # 
  # [[m:Regexp.last_match]].pre_match と同じです。
  # 
  # この変数はローカルスコープかつスレッドローカル、読み取り専用です。
  # Ruby起動時の初期値は nil です。
  # 
  # //emlist[例][ruby]{
  # str = '<p><a href="http://example.com">example.com</a></p>'
  # if %r[<a href="(.*?)">(.*?)</a>] =~ str
  #   p $`
  # end
  # #=> "<p>"
  # //}
  def `; end

  # --- $archdir -> String
  # 
  # マシン固有のライブラリを置くディレクトリです。
  # 通常は "/usr/local/lib/ruby/バージョン/arch" です。
  def archdir; end

  # --- $defs -> [String]
  # 
  # 拡張ライブラリをコンパイルするときのマクロ定義を指定する配列です。
  # 
  # この変数の値は、例えば
  # 
  #   ["-DHAVE_FUNC", "-DHAVE_HEADER_H"]
  # 
  # のような形式の配列です。
  # 
  # [[m:Kernel#have_func]] または [[m:Kernel#have_header]]
  # を呼び出すと、その検査結果が $defs に追加されます。
  # 
  # [[m:Kernel#create_header]]
  # はこの変数の値を参照してヘッダファイルを生成します。
  def defs; end

  # --- $hdrdir -> String
  # 
  # Ruby のヘッダファイル ruby.h が存在するディレクトリです。
  # 通常は [[m:$archdir]] と同じで、"/usr/local/lib/ruby/バージョン/arch" です。
  def hdrdir; end

  # --- $libdir -> String
  # 
  # Ruby のライブラリを置くディレクトリです。
  # 通常は "/usr/local/lib/ruby/バージョン" です。
  def libdir; end

  # --- $libs -> String
  # 
  # 拡張ライブラリをリンクするときに
  # 一緒にリンクされるライブラリを指定する文字列です。
  # 
  # この変数の値は、例えば
  # 
  #   "-lfoo -lbar"
  # 
  # のような形式の文字列です。
  # 
  # [[m:Kernel#have_library]] または [[m:Kernel#find_library]]
  # を呼び出すと、その検査結果が
  # 間に空白をはさみつつ $libs に連結されます。
  def libs; end

  # --- $sitearchdir -> String
  # 
  # サイト固有でかつマシン固有のライブラリを置くディレクトリです。
  # 通常は "/usr/local/lib/ruby/site_ruby/バージョン/arch" です。
  def sitearchdir; end

  # --- $sitelibdir -> String
  # 
  # サイト固有のライブラリを置くディレクトリです。
  # 通常は "/usr/local/lib/ruby/site_ruby/バージョン" です。
  def sitelibdir; end

  # --- $srcdir -> String
  # 
  # Ruby インタプリタを make したときのソースディレクトリです。
  def srcdir; end

  # --- $stderr -> object
  # 
  # 標準エラー出力です。
  # 
  # Ruby インタプリタが出力するエラーメッセージや
  # 警告メッセージ、[[m:Kernel.#warn]] の出力先となります。
  # 初期値は [[m:Object::STDERR]] です。
  # 
  # $stderr に代入するオブジェクトには
  # write という名前のメソッドが定義されていなければいけません。
  # 
  # 自プロセスの標準エラー出力をリダイレクトしたいときには、
  # $stderr に代入すれば十分です。
  # 
  # //emlist[例][ruby]{
  # # 標準エラー出力の出力先を /tmp/foo に変更
  # $stderr = File.open("/tmp/foo", "w")
  # puts "foo"         # 出力する
  # $stderr = STDERR   # 元に戻す
  # //}
  # 
  # 自プロセスだけでなく、子プロセスの標準エラー出力も
  # リダイレクトしたいときは以下のように [[m:IO#reopen]] を使います。
  # 
  # //emlist[例][ruby]{
  # $stderr.reopen("/tmp/foo", "w")
  # //}
  # 
  # また、リダイレクトしたあと
  # 出力先をまた元に戻したい場合は以下のようにします。
  # 
  # //emlist[例][ruby]{
  # stderr_old = $stderr.dup        # 元の $stderr を保存する
  # $stderr.reopen("/tmp/foo")      # $stderr を /tmp/foo にリダイレクトする
  # puts "foo"                      # /tmp/foo に出力
  # $stderr.flush                   # 念のためフラッシュする
  # $stderr.reopen stderr_old       # 元に戻す
  # //}
  # 
  # $stderr はグローバルスコープです。
  def stderr; end

  # --- $stdin -> object
  # 標準入力です。
  # 
  # 自プロセスの標準入力をリダイレクトしたいときは
  # $stdin に代入すれば十分です。
  # 
  # //emlist[例][ruby]{
  # # 標準入力の入力元 /tmp/foo に変更
  # $stdin = File.open("/tmp/foo", "w")
  # gets               # 入力する
  # $stdin = STDIN     # 元に戻す
  # //}
  # 
  # ただし、[[m:Kernel.#gets]] など、特定の組み込みメソッドは
  # $stdin オブジェクトにメソッドを転送して実装されています。
  # 従って、[[m:Kernel.#gets]] などが正しく動作するには、
  # $stdin オブジェクトに代入したオブジェクトが以下のメソッドを
  # 正しく実装していなければいけません。
  # 
  #     gets, readline, readlines, getc, readchar, tell, seek,
  #     pos=, rewind, fileno, to_io, eof, each_line, each_byte,
  #     binmode, closed?
  # 
  # //emlist[例][ruby]{
  # $stdin = Object.new
  # def $stdin.gets
  #   "foo"
  # end
  # p gets()  # => "foo"
  # //}
  # 
  # 自プロセスだけでなく、子プロセスの標準入力もリダイレクトしたいときは
  # 以下のように [[m:IO#reopen]] を使います。
  # 
  # //emlist[例][ruby]{
  # $stdin.reopen("/tmp/foo")
  # //}
  # 
  # また、リダイレクトしたあと
  # 出力先をまた元に戻したい場合は以下のようにします。
  # 
  # //emlist[例][ruby]{
  # stdin_old = $stdin.dup       # 元の $stdin を保存する
  # $stdout.reopen("/tmp/foo")   # $stdin を /tmp/foo にリダイレクトする
  # gets                         # /tmp/foo から入力
  # $stdin.reopen stdin_old      # 元に戻す
  # //}
  # 
  # $stdin はグローバルスコープです。
  def stdin; end

  # --- $topdir -> String
  # 
  # 拡張ライブラリを make するためのヘッダファイル、
  # ライブラリ等が存在するディレクトリです。
  # 通常は [[m:$archdir]] と同じで、"/usr/local/lib/ruby/バージョン/arch" です。
  def topdir; end

  # --- $~ -> MatchData | nil
  # 
  # 現在のスコープで最後に成功したマッチに関する [[c:MatchData]]オブジェクトです。
  # [[m:Regexp.last_match]] の別名です。
  # 
  # このデータから n 番目のマッチ ($n) を取り出すためには $~[n] を使います。
  # 
  # この値に代入すると Regexp.last_match や、 [[m:$&]], [[m:$1]], [[m:$2]], ... などの関連する組み込み変数の値が変化します。
  # MatchData オブジェクトでも nil でもない値を代入しようとすると [[c:TypeError]] が発生します。
  # 
  # この変数はローカルスコープかつスレッドローカルです。
  # Ruby起動時の初期値は nil です。
  # 
  # //emlist[例][ruby]{
  # str = '<p><a href="http://example.com">example.com</a></p>'
  # if %r[<a href="(.*?)">(.*?)</a>] =~ str
  #   p $~[1]
  # end
  # #=> "http://example.com"
  # //}
  def ~; end

  # --- DelegateClass(superclass) -> object
  # 
  # クラス superclass のインスタンスへメソッドを委譲するクラスを定義し、
  # そのクラスを返します。
  # 
  # @param superclass 委譲先となるクラス
  # 
  # 例:
  # 
  # //emlist{
  # require 'delegate'
  # 
  # class ExtArray < DelegateClass(Array)
  #   def initialize
  #     super([])
  #   end
  # end
  # a = ExtArray.new
  # p a.class   # => ExtArray
  # a.push 25
  # p a         # => [25]
  # //}
  def DelegateClass; end

  # --- Digest(name) -> object
  # 
  # "MD5"や"SHA1"などのダイジェストを示す文字列 name を指定し、
  # 対応するダイジェストのクラスを取得します。
  # 
  # このメソッドはスレッドセーフです。マルチスレッド環境で
  # [[c:Digest::MD5]]などを直接呼び出すと問題があるときはこのメソッドを使
  # うか、起動時に使用するライブラリを [[m:Kernel.#require]] してください。
  # 
  # @param name "MD5"や"SHA1"などのダイジェストを示す文字列を指定します。
  # @return Digest::MD5やDigest::SHA1などの対応するダイジェストのクラスを返します。インスタンスではなく、クラスを返します。注意してください。
  # 
  # 例: Digest::MD、Digest::SHA1、Digest::SHA512のクラス名を順番に出力する。
  # 
  #   require 'digest'
  #   for a in ["MD5", "SHA1", "SHA512"]
  #     p Digest(a) # => Digest::MD5, Digest::SHA1, Digest::SHA512
  #   end
  def Digest; end

  # --- JSON(object, options = {}) -> object
  # 
  # 第一引数に与えられたオブジェクトの種類によって Ruby のオブジェクトか JSON 形式の文字列を返します。
  # 
  # 第一引数に文字列のようなオブジェクトを指定した場合は、それを [[m:JSON.#parse]] を用いてパースした結果を返します。
  # そうでないオブジェクトを指定した場合は、それを [[m:JSON.#generate]] を用いて変換した結果を返します。
  # 
  # @param object 任意のオブジェクトを指定します。
  # 
  # @param options [[m:JSON.#parse]], [[m:JSON.#generate]] に渡すオプションを指定します。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # JSON('[1,2,{"name":"tanaka","age":19}]')
  # # => [1, 2, {"name"=>"tanaka", "age"=>19}]
  # 
  # JSON('[1,2,{"name":"tanaka","age":19}]', symbolize_names: true)
  # # => [1, 2, {:name=>"tanaka", :age=>19}]
  # //}
  # 
  # @see [[m:JSON.#parse]], [[m:JSON.#generate]]
  def JSON; end

  # --- Pathname(path) -> Pathname
  # 文字列 path を元に [[c:Pathname]] オブジェクトを生成します。
  # 
  # Pathname.new(path) と同じです。
  # 
  # @param path 文字列、または類似のオブジェクトを与えます。
  #             実際には to_str に反応するオブジェクトなら何でも構いません。
  def Pathname; end

  # --- arg_config(config, default) { ... } -> object | String | true | nil
  # 
  # configure オプション --config の値を返します。
  # 
  # @param config オプションを文字列で指定します。
  # 
  # @param default 引数 config で指定したオプションのデフォルト値を指定します。
  # 
  # @return オプションが指定されてた場合は true を、指定されなかった場合は
  #         nil を返します。
  #         引数 default、あるいはブロックを指定すると、オプションが指定さ
  #         れていない場合に引数 default の値かブロックの評価結果を返します
  #         (両方指定した場合はブロックが優先されます)。
  #         オプションに引数が指定されていた場合は指定した文字列を返します。
  # 
  # 例えば extconf.rb で arg_config メソッドを使う場合、
  # 
  #   $ ruby extconf.rb --foo --bar=baz
  # 
  # と実行したとき、arg_config("--foo") の値は true、
  # arg_config("--bar") の値は "baz" です。
  def arg_config; end

  # --- cc_command(opt = "") -> String
  # 
  # 実際にコンパイルする際に使用するコマンドを返します。
  # 
  # @param opt コンパイラに与える追加のコマンドライン引数を指定します。
  # 
  # @see [[m:RbConfig.expand]]
  def cc_command; end

  # --- check_signedness(type, headers = nil, opts = nil) -> "signed" | "unsigned" | nil
  # --- check_signedness(type, headers = nil, opts = nil){ ... } -> "signed" | "unsigned" | nil
  # 
  #  Returns the signedness of the given +type+.  You may optionally
  #  specify additional +headers+ to search in for the +type+.
  #  
  #  If the +type+ is found and is a numeric type, a macro is passed as a
  #  preprocessor constant to the compiler using the +type+ name, in
  #  uppercase, prepended with 'SIGNEDNESS_OF_', followed by the +type+
  #  name, followed by '=X' where 'X' is positive integer if the +type+ is
  #  unsigned, or negative integer if the +type+ is signed.
  #  
  #  For example, if size_t is defined as unsigned, then
  #  check_signedness('size_t') would returned +1 and the
  #  SIGNEDNESS_OF_SIZE_T=+1 preprocessor macro would be passed to the
  #  compiler, and SIGNEDNESS_OF_INT=-1 if check_signedness('int') is
  #  done.
  def check_signedness; end

  # --- check_sizeof(type, headers = nil) -> Integer | nil
  # --- check_sizeof(type, headers = nil){ ... } -> Integer | nil
  # 
  # 与えられた型のサイズを返します。
  # 
  # 型 type がシステムに存在する場合は、グローバル変数 [[m:$defs]] に
  # "-DSIZEOF_type=X" を追加し、型のサイズを返します。型 type がシステムに
  # 存在しない場合は、nil を返します。
  # 
  # 例えば、
  # 
  #   require 'mkmf'
  #   check_sizeof('mystruct') # => 12
  # 
  # である場合、SIZEOF_MYSTRUCT=12 というプリプロセッサマクロをコンパイラに渡します。
  # 
  # @param type 検査したい型を指定します。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  def check_sizeof; end

  # --- chmod -> ()
  # ファイルのアクセス権を変更します。
  # 
  # Change the mode of each FILE to OCTAL-MODE.
  # 
  #   ruby -run -e chmod -- [OPTION] OCTAL-MODE FILE
  # 
  #   -v          詳細表示
  # 
  # @see [[man:chmod(1)]]
  def chmod; end

  # --- convertible_int(type, headers = nil, opts = nil)
  # --- convertible_int(type, headers = nil, opts = nil){ ... }
  # 
  #  Returns the convertible integer type of the given +type+.  You may
  #  optionally specify additional +headers+ to search in for the +type+.
  #  _Convertible_ means actually same type, or typedefed from same type.
  #  
  #  If the +type+ is a integer type and _convertible_ type is found,
  #  following macros are passed as preprocessor constants to the
  #  compiler using the +type+ name, in uppercase.
  #  
  #  * 'TYPEOF_', followed by the +type+ name, followed by '=X' where 'X'
  #    is the found _convertible_ type name.  * 'TYP2NUM' and 'NUM2TYP,
  #    where 'TYP' is the +type+ name in uppercase with replacing '_t'
  #    suffix with 'T', followed by '=X' where 'X' is the macro name to
  #    convert +type+ to +Integer+ object, and vice versa.
  #  
  #  For example, if foobar_t is defined as unsigned long, then
  #  convertible_int("foobar_t") would return "unsigned long", and define
  #  macros:
  #  
  #    #define TYPEOF_FOOBAR_T unsigned long
  #    #define FOOBART2NUM ULONG2NUM
  #    #define NUM2FOOBART NUM2ULONG
  def convertible_int; end

  # --- cp -> ()
  # ファイルやディレクトリをコピーします。
  # 
  # 
  #   ruby -run -e cp -- [OPTION] SOURCE DEST
  # 
  #   -p          可能であればファイルの属性を保持します。
  #   -r          再帰的にコピーします。
  #   -v          詳細表示
  # 
  # @see [[man:cp(1)]]
  def cp; end

  # --- cpp_command(outfile, opt = "") -> String
  # 
  # 実際にプリプロセッサを実行する際に使用するコマンドを返します。
  # 
  # @param outfile 出力ファイルの名前を指定します。
  # 
  # @param opt プリプロセッサに与える追加のコマンドライン引数を指定します。
  # 
  # @see [[m:RbConfig.expand]]
  def cpp_command; end

  # --- create_header(header = "extconf.h") -> String
  # 
  # [[m:Kernel#have_func]], [[m:Kernel#have_header]] などの検査結果を元に、
  # ヘッダファイルを生成します。
  # 
  # このメソッドは extconf.rb の最後で呼び出すようにしてください。
  # 
  # @param header ヘッダファイルの名前を指定します。
  # 
  # @return ヘッダファイルの名前を返します。
  # 
  # 例
  # 
  #   # extconf.rb
  #   require 'mkmf'
  #   have_func('realpath')
  #   have_header('sys/utime.h')
  #   create_header
  #   create_makefile('foo')
  # 
  # 上の extconf.rb は以下の extconf.h を生成します。
  # 
  #   #ifndef EXTCONF_H
  #   #define EXTCONF_H
  #   #define HAVE_REALPATH 1
  #   #define HAVE_SYS_UTIME_H 1
  #   #endif
  def create_header; end

  # --- create_makefile(target, srcprefix = nil) -> true
  # @todo
  # 
  # [[m:Kernel#have_library]] などの各種検査の結果を元に、拡張ライブラリを
  # ビルドするための Makefile を生成します。
  # 
  # extconf.rb は普通このメソッドの呼び出しで終ります。
  # 
  # @param target ターゲットとなる拡張ライブラリの名前を指定します。
  #               例えば、拡張ライブラリで "Init_foo" という関数を定義して
  #               いる場合は、"foo" を指定します。
  #               '/' を含む場合は、最後のスラッシュ以降のみをターゲット名
  #               として使用します。残りはトップレベルのディレクトリ名と見
  #               なされ、生成された Makefile はそのディレクトリ構造に従い
  #               ます。
  #               例えば、'test/foo' を指定した場合、拡張ライブラリは
  #               'test' ディレクトリにインストールされます。この拡張ライブ
  #               ラリを Ruby スクリプトから使用するときは
  #               "require 'test/foo'" とする必要があります。
  # 
  # @param srcprefix ソースコードがあるディレクトリ名を指定します。
  #                  省略した場合は extconf.rb があるディレクトリを使用します。
  #                  
  # 以下のようなディレクトリ構成の場合:
  # 
  #    ext/
  #       extconf.rb
  #       test/
  #          foo.c
  # 
  # このようにします。
  # 
  #    require 'mkmf'
  #    create_makefile('test/foo', 'test')
  # 
  # このようにして作った Makefile で 'make install' すると拡張ライブラリは、
  # 以下のパスにインストールされます。
  # 
  #   /path/to/ruby/sitearchdir/test/foo.so
  def create_makefile; end

  # --- create_tmpsrc(src) -> String
  # 
  # 与えられた C プログラムのソースコードを一時ファイルに出力して与えられたソースコードを返します。
  # 
  # @param src C プログラムのソースコードを指定します。
  def create_tmpsrc; end

  # --- depend_rules(depend) -> Array
  # 
  # ファイルの依存関係の書かれた depend ファイルの内容を処理します。
  # 
  # @param depend depend ファイルの内容を指定します。
  # 
  # @return 見つかった依存関係を Makefile 形式で返します。
  def depend_rules; end

  # --- desc(description) -> String
  # 
  # 直後の Rake タスクの説明を登録します。
  # 
  # @param description 直後のタスクの説明を指定します。
  # 
  # 例:
  #    desc "Run the Unit Tests"
  #    task :test => [:build] do
  #      runtests
  #    end
  def desc; end

  # --- dir_config(target, idefault = nil, ldefault = nil) -> [String, String]
  # 
  # configure オプション
  # --with-TARGET-dir,
  # --with-TARGET-include,
  # --with-TARGET-lib
  # をユーザが extconf.rb に指定できるようにします。
  # 
  # --with-TARGET-dir オプションは
  # システム標準ではない、
  # ヘッダファイルやライブラリがあるディレクトリをまとめて指定するために使います。
  # ユーザが extconf.rb に --with-TARGET-dir=PATH を指定したときは
  # [[m:$CFLAGS]] に "-IPATH/include" を、
  # [[m:$LDFLAGS]] に "-LPATH/lib" を、
  # それぞれ追加します。
  # 
  # --with-TARGET-include オプションは
  # システム標準ではないヘッダファイルのディレクトリを指定するために使います。
  # ユーザが extconf.rb に --with-TARGET-include=PATH を指定したときは
  # [[m:$CFLAGS]] に PATH を追加します。
  # 
  # --with-TARGET-lib オプションは
  # システム標準ではないライブラリのディレクトリを指定するために使います。
  # ユーザが extconf.rb に --with-TARGET-lib=PATH を指定したときは
  # [[m:$CFLAGS]] に PATH を追加します。
  # 
  # @param target ターゲットの名前を指定します。
  # 
  # @param idefault システム標準ではないヘッダファイルのディレクトリのデフォルト値を指定します。
  # 
  # @param ldefault システム標準ではないライブラリのディレクトリのデフォルト値を指定します。
  # 
  # 例
  #   require 'mkmf'
  #   # xml2 の configure オプションを指定できるようにします。
  #   xml2_dirs = dir_config('xml2', '/opt/local/include/libxml2', '/opt/local/lib')
  def dir_config; end

  # --- directory(dir) -> ()
  # 
  # 与えられたディレクトリを作成するタスクを定義します。
  # 
  # @param dir 作成するディレクトリを指定します。
  # 
  # 例:
  #   directory 'testdata/doc'
  def directory; end

  # --- dummy_makefile(srcdir) -> String
  # 
  # ダミーの Makefile を作成します。
  # 
  # @param srcdir ソースディレクトリを指定します。
  def dummy_makefile; end

  # --- egrep_cpp(pattern, src, opt = "") -> bool
  # --- egrep_cpp(pattern, src, opt = ""){ ... } -> bool
  # 
  # C プログラムのソースコード src をプリプロセスし、
  # その結果が正規表現 pattern にマッチするかどうかを判定します。
  # 
  #   CPP $CFLAGS opt | egrep pat
  # 
  # を実行し、その結果が正常かどうかを true または false で返します。
  # 
  # このメソッドはヘッダファイルに関数などの宣言があるかどうか
  # 検査するために使用します。
  # 
  # @param pattern 「egrep の」正規表現を文字列で指定します。
  #                 Ruby の正規表現ではありません。
  # 
  # @param src C 言語のソースコードを文字列で記述します。
  # 
  # @see [[man:egrep(1)]]
  def egrep_cpp; end

  # --- enable_config(config, default) -> bool | String
  # --- enable_config(config, default){|config, default| ... } -> bool | String
  # 
  # configure のオプションを検査します。
  # 
  # configure のオプションに --enable-<config> が指定された場合は、真を返し
  # ます。--disable-<config> が指定された場合は。偽を返します。どちらでもな
  # い場合は default を返します。
  # 
  # これはデバッグ情報などのカスタム定義を、追加するのに役立ちます。
  # 
  # @param config configure のオプションの名前を指定します。
  # 
  # @param default デフォルト値を返します。
  # 
  # 例
  #   require 'mkmf'
  #   if enable_config("debug")
  #      $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
  #   end
  def enable_config; end

  # --- file(*args){ ... } -> Rake::FileTask
  # 
  # ファイルタスクを定義します。
  # 
  # @param args ファイル名と依存ファイル名を指定します。
  # 
  # 例:
  #    file "config.cfg" => ["config.template"] do
  #      open("config.cfg", "w") do |outfile|
  #        open("config.template") do |infile|
  #          while line = infile.gets
  #            outfile.puts line
  #          end
  #        end
  #      end
  #    end
  # 
  # @see [[m:Rake::Task.define_task]]
  def file; end

  # --- file_create(*args){ ... } -> Rake::FileCreationTask
  # 
  # ファイルを作成するタスクを定義します。
  # 
  # 主に [[m:Kernel.#directory]] を定義するために使用します。
  def file_create; end

  # --- find_executable(bin, path = nil) -> String | nil
  # 
  # パス path から実行ファイル bin を探します。
  # 
  # 実行ファイルが見つかった場合は、そのフルパスを返します。
  # 実行ファイルが見つからなかった場合は、nilを返します。
  # 
  # このメソッドは Makefile を変更しません。
  # 
  # @param bin 実行ファイルの名前を指定します。
  # 
  # @param path パスを指定します。デフォルトは環境変数 PATH です。
  #             環境変数 PATH が定義されていない場合は /usr/local/bin,
  #             /usr/ucb, /usr/bin, /bin を使います。
  def find_executable; end

  # --- find_header(header, *paths) -> bool
  # 
  # 与えられた paths から header を検索し、見つかった場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # ヘッダが見つかったディレクトリをコンパイラに渡すコマンドラインオプショ
  # ンに追加します(-I オプションを経由します)。
  # 
  # @param header ヘッダを指定します。
  # 
  # @param paths ヘッダを検索するパスを指定します。
  def find_header; end

  # --- find_library(lib, func, *paths) -> bool
  # --- find_library(lib, func, *paths){ ... } -> bool
  # 
  # 関数 func が定義されたライブラリ lib を探します。
  # 
  # 最初はパスを指定せずに探し、
  # それに失敗したら paths[0] を指定して探し、
  # それにも失敗したら paths[1] を指定して探し……
  # というように、リンク可能なライブラリを探索します。
  # 
  # 上記の探索でライブラリ lib を発見できた場合は lib を [[m:$libs]] に追加し、
  # 見つかったパスを [[m:$LDFLAGS]] に追加して true を返します。
  # 指定されたすべてのパスを検査してもライブラリ lib が見つからないときは、
  # 変数を変更せず false を返します。
  # 
  # paths を指定しないときは [[m:Kernel#have_library]] と同じ動作です。
  # 
  # @param lib ライブラリ名を指定します。
  # 
  # @param func 関数名を指定します。
  #             nil または空文字列を指定した場合は "main" になります。
  # 
  # @param paths ライブラリを検索するパスを文字列の配列で指定します。
  def find_library; end

  # --- find_type(type, opt, *headers) -> Array
  # --- find_type(type, opt, *headers){ ... } -> Array
  # 
  # 静的な型 type がシステムに存在するかどうか検査します。
  # 
  # @param type 検査したい型の名前を指定します。
  # 
  # @param opt コンパイラに渡す追加のオプションを指定します。
  # 
  # @param headers 追加のヘッダを指定します。
  # 
  # @see [[m:Kernel#have_type]] 
  def find_type; end

  # --- gem(gem_name, *version_requirements) -> bool
  # [[m:$LOAD_PATH]] に Ruby Gem を追加します。
  # 
  # 指定された Gem をロードする前にその Gem が必要とする Gem をロードします。
  # バージョン情報を省略した場合は、最も高いバージョンの Gem をロードします。
  # 指定された Gem やその Gem が必要とする Gem が見つからなかった場合は
  # [[c:Gem::LoadError]] が発生します。
  # 
  # バージョンの指定方法に関しては [[c:Gem::Version]] を参照してください。
  # 
  # rubygems ライブラリがライブラリバージョンの衝突を検出しない限り、
  # gem メソッドは全ての require メソッドよりも前に実行されます。
  # 
  # === 環境変数 GEM_SKIP
  # 
  # 特定の Gem をロードしないようにするために環境変数 GEM_SKIP を定義することができます。
  # 特定の Gem がまだインストールされていないという状況を試すために使用できます。
  # 
  # 例:
  # 
  #   GEM_SKIP=libA:libB ruby-I../libA -I../libB ./mycode.rb
  # 
  # @param gem Gem の名前の文字列か、Gem の依存関係を [[c:Gem::Dependency]] のインスタンスで指定します。
  # 
  # @param version_requirements 必要とする gem のバージョンを指定します。
  # 
  # @return Gem がロードできた場合は true を返します。ロードできなかった場合は false を返します。
  # 
  # @raise Gem::LoadError 指定された Gem やその Gem が必要とする Gem が見つからなかった場合に発生します。
  #                       ただし、環境変数 GEM_SKIP に指定されている Gem に関してはこの例外は発生しません。
  # 
  # @see [[c:Gem::Version]]
  def gem; end

  # --- have_devel? -> bool
  # 
  # 開発環境がインストールされているかどうか検査するために何もしない実行ファ
  # イルを作成しようと試みます。成功した場合は、真を返します。失敗した場合
  # は、偽を返します。
  def have_devel?; end

  # --- have_framework(framework) -> bool
  # --- have_framework(framework){ ... } -> bool
  # 
  # フレームワーク framework がシステムに存在するかどうか検査します。
  # 
  # フレームワーク framework がシステムに存在する場合は、グローバル変数
  # [[m:$defs]] に "-DHAVE_FRAMEWORK_framework" を追加し、真を返します。ま
  # た、グローバル変数 [[m:$LDFLAGS]] に "-framework #{framework}" を追加し
  # ます。 フレームワーク framework がシステムに存在しない場合は、偽を返し
  # ます。
  # 
  # 例えば、
  # 
  #   require 'mkmf'
  #   have_framework('Ruby') # => true
  # 
  # である場合、HAVE_FRAMEWORK_RUBY というプリプロセッサマクロをコンパイラに渡します。
  # 
  # @param framework フレームワークの名前を指定します。
  def have_framework; end

  # --- have_func(func, headers = nil) -> bool
  # --- have_func(func, headers = nil){ ... } -> bool
  # 
  # 関数 func がシステムに存在するかどうかを検査します。
  # 
  # 関数 func が存在すれば [[m:$defs]] に "-DHAVE_func" (func は大文字に変
  # 換されます) を追加して true を返します。関数 func が見つからないときは
  # グローバル変数を変更せず false を返します。
  # 
  # @param func 関数名を指定します。
  # 
  # @param headers 関数 func を使用するのに必要なヘッダファイル名を指定しま
  #                す。これは関数の型をチェックするためではなく、関数が実際
  #                にはマクロで定義されている場合などのために使用します。
  def have_func; end

  # --- have_header(header, preheaders = nil) -> bool
  # --- have_header(header, preheaders = nil){ ... } -> bool
  # 
  # ヘッダファイル header がシステムに存在するかどうか検査します。
  # 
  # ヘッダファイル header が存在する場合は、グローバル変数 [[m:$defs]] に
  # "-DHAVE_header" を追加して true を返します。ヘッダファイル header が存
  # 在しない場合は $defs は変更せず false を返します。
  # 
  # @param header 検査したいヘッダファイルを指定します。
  # 
  # @param preheaders ヘッダファイルを検査する前に読み込んでおくヘッダファイルを指定します。
  def have_header; end

  # --- have_library(lib, func = nil, headers = nil) -> bool
  # --- have_library(lib, func = nil, headers = nil){ ... } -> bool
  # 
  # ライブラリ lib がシステムに存在し、関数 func が定義されているかどうかをチェックします。
  # チェックが成功すれば [[m:$libs]] に lib を追加し true を返します。
  # チェックが失敗したら false を返します。
  # 
  # @param lib ライブラリの名前を指定します。
  # 
  # @param func 検査する関数名を指定します。
  #             nil または空文字列のときは、"main" になります。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  def have_library; end

  # --- have_macro(macro, headers = nil, opt = "") -> bool
  # --- have_macro(macro, headers = nil, opt = ""){ ... } -> bool
  # 
  # 与えられた macro が共通のヘッダファイルか headers に定義されている場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param macro マクロの名前を指定します。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  # 
  # @param opt C コンパイラに渡すコマンドライン引数を指定します。
  def have_macro; end

  # --- have_struct_member(type, member, headers = nil) -> bool
  # --- have_struct_member(type, member, headers = nil){ ... } -> bool
  # 
  # member というメンバを持つ構造体 type がシステムに存在するかどうか検査します。
  # 
  # member というメンバを持つ構造体 type がシステムに存在する場合は、
  # グローバル変数 [[m:$defs]] に "-DHAVE_type_member" を追加し、真を返します。
  # member というメンバを持つ構造体 type が存在しない場合は、偽を返します。
  # 
  # 例えば
  # 
  #   require 'mkmf'
  #   have_struct_member('struct foo', 'bar') # => true
  # 
  # である場合、HAVE_STRUCT_FOO_BAR というプリプロセッサマクロをコンパイラに渡します。
  # また、後方互換性のために HAVE_ST_BAR というプリプロセッサマクロも定義します。
  # 
  # @param type 検査したい構造体の名前を指定します。
  # 
  # @param member 検査したい構造体のメンバの名前を指定します。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  def have_struct_member; end

  # --- have_type(type, headers = nil, opt = "") -> bool
  # --- have_type(type, headers = nil, opt = ""){ ... } -> bool
  # 
  # 静的な型 type がシステムに存在するかどうか検査します。
  # 
  # 型 type がシステムに存在する場合は、グローバル変数 [[m:$defs]] に
  # "-DHAVE_type" を追加し、真を返します。型 type がシステムに存在しない場
  # 合は、偽を返します。
  # 
  # 例えば、
  # 
  #   require 'mkmf'
  #   have_type('foo') # => true
  # 
  # である場合、HAVE_TYPE_FOO をというプリプロセッサマクロをコンパイラに渡します。
  # 
  # @param type 検査したい型の名前を指定します。
  # 
  # @param headers 追加のヘッダを指定します。
  # 
  # @param opt コンパイラに渡す追加のオプションを指定します。
  def have_type; end

  # --- have_var(var, headers = nil) -> bool
  # --- have_var(var, headers = nil){ ... } -> bool
  # 
  # 変数 var がシステムに存在するかどうか検査します。
  # 
  # 変数 var がシステムに存在する場合は、グローバル変数 [[m:$defs]] に
  # "-DHAVE_var" を追加し、真を返します。変数 var がシステムに存在しない場
  # 合は、偽を返します。
  # 
  # 例えば、
  # 
  #   require 'mkmf'
  #   have_var('foo') # => true
  # 
  # である場合、HAVE_FOO というプリプロセッサマクロをコンパイラに渡します。
  # 
  # @param var 検査したい変数名を指定します。
  # 
  # @param headers 追加のヘッダを指定します。
  def have_var; end

  # --- help -> ()
  # ヘルプメッセージを表示します。
  # 
  # 
  #   ruby -run -e help [COMMAND]
  def help; end

  # --- httpd -> ()
  # 
  # WEBrick HTTP server を起動します。
  # 
  #   ruby -run -e httpd -- [OPTION] [DocumentRoot]
  # 
  #   --bind-address=ADDR         バインドアドレスを指定します
  #   --port=NUM                  ポート番号を指定します
  #   --max-clients=MAX           同時接続数の最大値
  #   --temp-dir=DIR              一時ディレクトリを指定します
  #   --do-not-reverse-lookup     逆引きを無効にします
  #   --request-timeout=SECOND    リクエストがタイムアウトする秒数を指定します
  #   --http-version=VERSION      HTTP version
  #   --server-name=NAME          サーバーのホスト名を指定します
  #   --server-software=NAME      サーバーの名前とバージョンを指定します
  #   --ssl-certificate=CERT      サーバーの SSL 証明書ファイルを指定します
  #   --ssl-private-key=KEY       サーバーの SSL 証明書の秘密鍵を指定します
  #   -v                          詳細表示
  def httpd; end

  # --- import(*filenames)
  # 
  # 分割された Rakefile をインポートします。
  # 
  # インポートされたファイルは、現在のファイルが完全にロードされた後でロードされます。
  # このメソッドはインポートするファイルのどこで呼び出されてもかまいません。
  # また、インポートされるファイル内に現れるオブジェクトはインポートするファイル内で定義
  # されているオブジェクトに依存していてもかまいません。
  # 
  # このメソッドは依存関係を定義したファイルを読み込むのによく使われます。
  # 
  # @param filenames インポートする Rakefile を指定します。
  # 
  # 例:
  #    import ".depend", "my_rules"
  def import; end

  # --- install -> ()
  # ファイルをコピーし、その属性を設定します。
  # 
  # 
  #   ruby -run -e install -- [OPTION] SOURCE DEST
  # 
  #   -p          ファイルのアクセス時刻と修正時刻を保持します。
  #   -m          chmod と同じようにファイルのパーミッションを設定します。
  #   -v          詳細表示
  # 
  # @see [[man:install(1)]]
  def install; end

  # --- install_files(mfile, ifiles, map = nil, srcprefix = nil) -> []
  # 
  # このメソッドは create_makefile, install_rb が使用します。
  # 内部用のメソッドです。
  # 
  # @param mfile Makefile を表す [[c:File]] のインスタンスです。
  # 
  # @param ifiles インストールするファイルのリストを指定します。
  # 
  # @param map ???
  # 
  # @param srcprefix ソースディレクトリを指定します。
  def install_files; end

  # --- install_rb(mfile, dest, srcdir = nil) -> Array
  # 
  # このメソッドは create_makefile が使用します。
  # 内部用のメソッドです。
  # 
  # ディレクトリ srcdir/lib 配下の Ruby スクリプト (*.rb ファイル)
  # を dest にインストールするための Makefile 規則を mfile に出力します。
  # 
  # srcdir/lib のディレクトリ構造はそのまま dest 配下に反映されます。
  # 
  # @param mfile Makefile を表す [[c:File]] のインスタンスです。
  # 
  # @param dest インストールする先のディレクトリを指定します。
  # 
  # @param srcdir ソースディレクトリを指定します。
  def install_rb; end

  # --- j(*objects) -> nil
  # 
  # 与えられたオブジェクトを JSON 形式の文字列で標準出力に一行で出力します。
  # 
  # @param objects JSON 形式で出力したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # j([1,2,{"name" => "tanaka","age" => 19}])
  # # => [1,2,{"name":"tanaka","age":19}]
  # //}
  # 
  # @see [[m:Kernel.#p]]
  def j; end

  # --- jj(*objects) -> nil
  # 
  # 与えられたオブジェクトを JSON 形式の文字列で標準出力に人間に読みやすく整形して出力します。
  # 
  # @param objects JSON 形式で出力したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # jj([1,2,{"name" => "tanaka","age" => 19}])
  # # => [
  # #      1,
  # #      2,
  # #      {
  # #        "name": "tanaka",
  # #        "age": 19
  # #      }
  # #    ]
  # //}
  # 
  # @see [[m:Kernel.#pp]]
  def jj; end

  # --- libpathflag(libpath = $DEFLIBPATH|$LIBPATH) -> String
  # 
  # 与えられた libpath を -L 付きの文字列に変換して返します。
  # 
  # @param libpath LIBPATH に指定する値を指定します。
  def libpathflag; end

  # --- link_command(ldflags, opt = "", libpath = $DEFLIBPATH|$LIBPATH) -> String
  # 
  # 実際にリンクする際に使用するコマンドを返します。
  # 
  # @param ldflags LDFLAGS に追加する値を指定します。
  # 
  # @param opt LIBS に追加する値を指定します。
  # 
  # @param libpath LIBPATH に指定する値を指定します。
  # 
  # @see [[m:RbConfig.expand]]
  def link_command; end

  # --- ln -> ()
  # ファイルへのリンクを作成します。
  # 
  #   ruby -run -e ln -- [OPTION] TARGET LINK_NAME
  # 
  #   -s          ハードリンクの代わりにシンボリックリンクを作成します
  #   -f          LINK_NAME を上書きします
  #   -v          詳細表示
  # 
  # @see [[man:ln(1)]]
  def ln; end

  # --- log_src(src) -> ()
  # 
  # 与えられた C プログラムのソースコードをログ出力します。
  # 
  # @param src C プログラムのソースコードを指定します。
  def log_src; end

  # --- merge_libs(*libs) -> [String]
  # @todo 使われてない
  # 
  # @param libs ???
  def merge_libs; end

  # --- message(format, *arg) -> nil
  # 
  # [[m:Kernel.#printf]] と同じように標準出力にメッセージを出力します。
  # メッセージ出力後すぐに [[m:IO#flush]] します。
  # 
  # $VERBOSE が真のときは何もしません。
  # 
  # @param format フォーマット文字列です。
  # 
  # @param arg フォーマットされる引数です。
  # 
  # @see [[m:Kernel.#printf]]
  def message; end

  # --- mkdir -> ()
  # ディレクトリを作成します。
  # 
  # 
  #   ruby -run -e mkdir -- [OPTION] DIR
  # 
  #   -p          ディレクトリが存在してもエラーになりません。
  #               必要であれば親ディレクトリも作成します。
  #   -v          詳細表示
  # 
  # @see [[man:mkdir(1)]]
  def mkdir; end

  # --- mkmf -> ()
  # 
  # [[lib:mkmf]] を使って Makefile を作成します。
  # 
  #   ruby -run -e mkmf -- [OPTION] EXTNAME [OPTION]
  # 
  #   -d ARGS	run dir_config
  #   -h ARGS	run have_header
  #   -l ARGS	run have_library
  #   -f ARGS	run have_func
  #   -v ARGS	run have_var
  #   -t ARGS	run have_type
  #   -m ARGS	run have_macro
  #   -c ARGS	run have_const
  #   --vendor	install to vendor_ruby
  def mkmf; end

  # --- modified?(target, times) -> Time | nil
  # 
  # target が times の全ての要素よりも新しい場合は target の更新時刻を返します。
  # そうでない場合は nil を返します。target が存在しない場合も nil を返します。
  # 
  # @param target 対象のファイル名を指定します。
  # 
  # @param times [[c:Time]] の配列か [[c:Time]] を一つ指定します。
  def modified?; end

  # --- multitask(args){ ... } -> Rake::MultiTask
  # 
  # 事前タスクを並列実行するタスクを定義します。
  # 
  # 与えられた事前タスクを実行する順序は不定です。
  # 
  # 例:
  #   multitask :deploy => [:deploy_gem, :deploy_rdoc]
  def multitask; end

  # --- mv -> ()
  # 
  # ファイルを移動します (ファイル名を変更します)。
  # 
  # 
  #   ruby -run -e mv -- [OPTION] SOURCE DEST
  # 
  #   -v          詳細表示
  # 
  # @see [[man:mv(1)]]
  def mv; end

  # --- namespace(name = nil){ ... } -> Rake::NameSpace
  # 
  # 新しい名前空間を作成します。
  # 
  # 与えられたブロックを評価する間は、その名前空間を使用します。
  # 
  # 例:
  #    ns = namespace "nested" do
  #      task :run
  #    end
  #    task_run = ns[:run] # find :run in the given namespace.
  # 
  # @see [[m:Rake::TaskManager#in_namespace]]
  def namespace; end

  # --- y(*objects) -> String
  # --- psych_y(*objects) -> String
  # objects を YAML document に変換します。
  # 
  # このメソッドは irb 上でのみ定義されます。
  # 
  # [[lib:syck]] に y メソッドがあるため、
  # psych_y が別名として定義されています。将来的に
  # syck が廃止された場合  psych_y は廃止
  # される予定であるため、特別の事情がない限り y を用いてください。
  # 
  # @param objects YAML document に変換する Ruby のオブジェクト
  def psych_y; end

  # --- require(path) -> bool
  # 
  # RubyGems を require すると、[[m:Kernel#require]] が Gem を
  # 要求されたときにロードするように置き換えます。
  # 
  # 再定義された [[m:Kernel#require]] を呼び出すと以下の事を行います。
  # Ruby のロードパスに存在するライブラリを指定した場合はそのままロードします。
  # そうではなく、インストールされた Gem ファイルの中から見つかった場合は、
  # その Gem をロードパスに登録します。
  # 
  # @param path ロードしたいライブラリの名前を指定します。
  # 
  # @return 既にロードされているライブラリを再度ロードしようとした場合は false を返します。
  #         そうでない場合は true を返します。
  def require; end

  # --- rm -> ()
  # 
  # ファイルやディレクトリを削除します。
  # 
  # 
  #   ruby -run -e rm -- [OPTION] FILE
  # 
  #   -f          存在しないファイルを無視します
  #   -r          ディレクトリを再帰的にたどってファイルやディレクトリを削除します
  #   -v          詳細表示
  # 
  # @see [[man:rm(1)]]
  def rm; end

  # --- rm_f(*files) -> ()
  # 
  # [[m:FileUtils.#rm_f]] のラッパーメソッドです。
  # 
  # @param files ファイルのリストか、[[m:Dir.glob]]で利用できる glob パターンを指定します。
  #              最後の要素が [[c:Hash]] の場合は [[m:FileUtils.#rm_f]] の第二引数になります。
  # 
  # @see [[m:FileUtils.#rm_f]], [[m:Dir.glob]]
  def rm_f; end

  # --- rm_rf(*files) -> ()
  # 
  # [[m:FileUtils.#rm_rf]] のラッパーメソッドです。
  # 
  # @param files ファイルのリストか、[[m:Dir.glob]]で利用できる glob パターンを指定します。
  #              最後の要素が [[c:Hash]] の場合は [[m:FileUtils.#rm_f]] の第二引数になります。
  # 
  # @see [[m:FileUtils.#rm_rf]], [[m:Dir.glob]]
  def rm_rf; end

  # --- rmdir -> ()
  # 
  # 空のディレクトリを削除します。
  # 
  #   ruby -run -e rmdir -- [OPTION] DIR
  # 
  #   -p          DIR で指定されたディレクトリとその上位ディレクトリを削除します
  #   -v          詳細表示
  # 
  # @see [[man:rmdir(1)]]
  def rmdir; end

  # --- rule(*args){|t| ... } -> Rake::Task
  # 
  # 自動的に作成するタスクのためのルールを定義します。
  # 
  # @param args ルールに与えるパラメータを指定します。
  # 
  # 例:
  #   rule '.o' => '.c' do |t|
  #     sh %{cc -o #{t.name} #{t.source}}
  #   end
  def rule; end

  # --- task(*args){ ... } -> Rake::Task
  # 
  # Rake タスクを定義します。
  # 
  # @param args タスク名と依存タスクを指定します。
  # 
  # 例:
  #   task :clobber => [:clean] do
  #     rm_rf "html"
  #   end
  # 
  # @see [[m:Rake::Task.define_task]]
  def task; end

  # --- time(msg, width = 25){ ... } -> object
  # 
  # 与えられたブロックの実行時間を計測して表示します。
  # 
  # @param msg 表示するメッセージを指定します。
  # 
  # @param width 表示する幅を指定します。
  # 
  # @return ブロックの実行結果を返します。
  def time; end

  # --- timeout(sec) {|i| .... }                        -> object
  # --- timeout(sec, exception_class = nil) {|i| .... } -> object
  # 
  # ブロックを sec 秒の期限付きで実行します。
  # ブロックの実行時間が制限を過ぎたときは例外
  # [[c:Timeout::Error]] が発生します。
  # 
  # exception_class を指定した場合には [[c:Timeout::Error]] の代わりに
  # その例外が発生します。
  # ブロックパラメータ i は sec がはいります。
  # 
  # また sec が 0 もしくは nil のときは制限時間なしで
  # ブロックを実行します。
  # 
  # @param sec タイムアウトする時間を秒数で指定します.
  # @param exception_class タイムアウトした時、発生させる例外を指定します.
  # 
  # === 注意
  # 
  # timeout による割り込みは Thread によって実現されています。C 言語
  # レベルで実装され、Ruby のスレッドが割り込めない処理に対して
  # timeout は無力です。
  # そのような
  # ものは実用レベルでは少ないのですが、例をあげると Socket などは
  # DNSの名前解決に時間がかかった場合割り込めません
  # ([[lib:resolv-replace]] を使用する必要があります)。
  # その処理を Ruby で実装しなおすか C 側で Ruby
  # のスレッドを意識してあげる必要があります。
  def timeout; end

  # --- touch -> ()
  # 
  # ファイルのアクセス時刻と修正時刻を現在の時刻に変更します。
  # 
  # 
  #   ruby -run -e touch -- [OPTION] FILE
  # 
  #   -v          詳細表示
  # 
  # @see [[man:touch(1)]]
  def touch; end

  # --- try_compile(src, opt = "", *opts) -> bool
  # --- try_compile(src, opt = "", *opts){ ... } -> bool
  # 
  # 与えられた C のソースコードがコンパイルできた場合は真を返します。
  # コンパイルできなかった場合は偽を返します。
  # 
  # ブロックを与えた場合、そのブロックはコンパイル前に評価されます。
  # ブロック内でソースコードを変更することができます。
  # 
  # @param src C のソースコードを指定します。
  # 
  # @param opt コンパイラに渡すオプションを指定します。
  #            $CFLAGS もコンパイラには渡されます。
  def try_compile; end

  # --- try_constant(const, headers = nil, opt = "") -> Integer | nil
  # --- try_constant(const, headers = nil, opt = ""){ ... } -> Integer | nil
  # 
  # 定数 const がシステムに存在するかどうか検査します。
  # [[m:Kernel#have_const]] を使ってください。
  # 
  # @param const C 言語の定数名を指定します。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  # 
  # @param opt コンパイラに渡すオプションを指定します。
  #            $CFLAGS もコンパイラには渡されます。
  # 
  # @return 定数 const がシステムに存在する場合はその値を返します。
  #         定数 const がシステムに存在しない場合は nil を返します。
  def try_constant; end

  # --- try_cpp(src, opt = "", *opts) -> bool
  # --- try_cpp(src, opt = "", *opts){ ... } -> bool
  # 
  # C プログラムのソースコード src をプリプロセスします。
  # 
  # [[m:$CPPFLAGS]], [[m:$CFLAGS]] の値もプリプロセッサにコマンドライン引数
  # として渡します。
  # 
  # このメソッドはヘッダファイルの存在チェックなどに使用します。
  # 
  # @param src C プログラムのソースコードを指定します。
  # 
  # @param opt プリプロセッサにコマンドライン引数として渡す値を指定します。
  # 
  # @return 問題なくプリプロセスできたら true を返します。
  #         プリプロセスに失敗したら false を返します。
  # 
  # 例：
  # 
  #   require 'mkmf'
  #   if try_cpp("#include <stdio.h>")
  #     $stderr.puts "stdio.h exists"
  #   end
  def try_cpp; end

  # --- try_do(src, command, *opts) -> ()
  # --- try_do(src, command, *opts){ ... } -> ()
  # 
  # @param src C プログラムのソースコードを指定します。
  # 
  # @param command コマンドを指定します。
  # 
  # @param opts オプションを [[c:Hash]] で指定します。
  # 
  # @raise RuntimeError 開発環境がインストールされていない場合に発生します。
  # 
  # @see [[m:Kernel#xsystem]]
  def try_do; end

  # --- try_func(func, libs, headers = nil) -> bool
  # --- try_func(func, libs, headers = nil){ ... } -> bool
  # 
  # 関数 func がシステムに存在するかどうか検査します。
  # [[m:Kernel#have_func]] を使ってください。
  # 
  # @param func 関数名を指定します。
  # 
  # @param libs ライブラリの名前を指定します。
  # 
  # @param headers 関数 func を使用するのに必要なヘッダファイル名を指定しま
  #                す。これは関数の型をチェックするためではなく、関数が実際
  #                にはマクロで定義されている場合などのために使用します。
  def try_func; end

  # --- try_link(src, opt = "", *options) -> bool
  # --- try_link(src, opt = "", *options){ ... } -> bool
  # 
  # C プログラムのソースコード src をコンパイル、リンクします。
  # 
  # このメソッドは [[m:$CFLAGS]] と [[m:$LDFLAGS]] の値もコンパイラまたはリ
  # ンカに渡します。
  # 
  # 問題なくリンクできたら true を返します。
  # コンパイルとリンクに失敗したら false を返します。
  # 
  # @param src C プログラムのソースコードを指定します。
  # 
  # @param opt リンカにコマンド引数として渡す値を指定します。
  # 
  # 例：
  # 
  #   require 'mkmf'
  #   if try_link("int main() { sin(0.0); }", '-lm')
  #     $stderr.puts "sin() exists"
  #   end
  def try_link; end

  # --- try_run(src, opt = "") -> bool | nil
  # --- try_run(src, opt = ""){ ... } -> bool | nil
  # 
  # 与えられたソースコードが、コンパイルやリンクできるかどうか検査します。
  # 
  # 以下の全ての検査に成功した場合は、真を返します。そうでない場合は偽を返します。
  # 
  #   * src が C のソースとしてコンパイルできるか
  #   * 生成されたオブジェクトが依存しているライブラリとリンクできるか
  #   * リンクしたファイルが実行可能かどうか
  #   * 実行ファイルがきちんと存在しているかどうか
  # 
  # ブロックを与えた場合、そのブロックはコンパイル前に評価されます。
  # ブロック内でソースコードを変更することができます。
  # 
  # @param src C のソースコードを指定します。
  # 
  # @param opt リンカに渡すオプションを指定します。
  #            $CFLAGS, $LDFLAGS もリンカには渡されます。
  # 
  # @return 実行ファイルが存在する場合は true を返します。そうでない場合は
  #         false を返します。プリプロセス、コンパイル、リンクのいずれかの
  #         段階で失敗した場合は nil を返します。
  def try_run; end

  # --- try_static_assert(expr, headers = nil, opt = "") -> bool
  # --- try_static_assert(expr, headers = nil, opt = ""){ ... } -> bool
  # @todo ???
  # 
  # ...
  # 
  # @param expr C 言語の式を指定します。
  # 
  # @param headers 追加のヘッダファイルを指定します。
  # 
  # @param opt コンパイラに渡すオプションを指定します。
  #            $CFLAGS もコンパイラには渡されます。
  def try_static_assert; end

  # --- try_type(type, headers = nil, opt = "") -> bool
  # --- try_type(type, headers = nil, opt = ""){ ... } -> bool
  # 
  # [[m:Kernel#have_type]] を使ってください。
  # 
  # @param type 検査したい型の名前を指定します。
  # 
  # @param headers 追加のヘッダを指定します。
  # 
  # @param opt コンパイラに渡す追加のオプションを指定します。
  def try_type; end

  # --- try_var(var, headers = nil) -> bool
  # --- try_var(var, headers = nil){ ... } -> bool
  # 
  # [[m:Kernel#have_var]] を使ってください。
  # 
  # @param var 検査したい変数名を指定します。
  # 
  # @param headers 追加のヘッダを指定します。
  def try_var; end

  # --- wait_writable -> ()
  # ファイルが書き込み可能になるまで待ちます。
  # 
  #   ruby -run -e wait_writable -- [OPTION] FILE
  # 
  #   -n RETRY	リトライ回数
  #   -w SEC	リトライごとに待つ秒数
  #   -v		詳細表示
  def wait_writable; end

  # --- with_config(config, default = nil) -> bool | String
  # --- with_config(config, default = nil){|config, default| ... } -> bool | String
  # 
  # configure のオプションを検査します。
  # 
  # configure のオプションに --with-<config> が指定された場合は真を返しま
  # す。--without-<config> が指定された場合は偽を返します。どちらでもない場
  # 合は default を返します。
  # 
  # これはデバッグ情報などのカスタム定義を、追加するのに役立ちます。
  # 
  # @param config configure のオプションの名前を指定します。
  # 
  # @param default デフォルト値を返します。
  # 
  # 例
  #   require 'mkmf'
  #   if with_config("debug")
  #      $defs.push("-DOSSL_DEBUG") unless $defs.include? "-DOSSL_DEBUG"
  #   end
  def with_config; end

  # --- with_werror(opt, opts = nil){|opt| ... } -> object
  # --- with_werror(opt, opts = nil){|opt, opts| ... } -> object
  # @todo 内部用？
  # 
  # ???
  # 
  # @param opt ????
  # 
  # @param opts ????
  # 
  # @return ブロックを評価した結果を返します。
  def with_werror; end

  # --- xmp(exps, bind = nil) -> XMP
  # 
  # 引数 exps で指定されたRuby のソースコードとその実行結果を、標準出力に行
  # ごとに交互に表示します。
  # 
  # @param exps 評価するRuby のソースコードを文字列で指定します。
  # 
  # @param bind [[c:Binding]] オブジェクトを指定します。省略した場合は、最
  #             後に実行した [[m:XMP#puts]]、[[m:Kernel#xmp]] の
  #             [[c:Binding]] を使用します。まだ何も実行していない場合は
  #             [[m:Object::TOPLEVEL_BINDING]] を使用します。
  def xmp; end

  # --- xpopen(command, *mode) -> IO
  # --- xpopen(command, *mode){ ... } -> object
  # 
  # command を表示してから [[m:IO.popen]] の実行します。
  # 
  # @param command コマンド名を指定します。
  # 
  # @param mode オープンする IO ポートのモードを指定します。mode の詳細は [[m:Kernel.#open]] 参照して下さい。
  # 
  # @see [[m:IO.popen]]
  def xpopen; end

  # --- xsystem(command, opts = nil) -> ()
  # 
  # [[m:Kernel.#system]] と同じですが、コマンドの出力は(標準出力、標準エラー
  # 出力ともに)ログファイルに出力します。ログファイル名は mkmf.log です。
  # 
  # @param command コマンドを指定します。
  # @param opts オプションを [[c:Hash]] で指定します。
  #             :werror というキーに真を指定すると
  # 
  # @see [[m:Kernel.#system]]
  def xsystem; end

  # --- Array(arg) -> Array
  # 
  # 引数を配列([[c:Array]])に変換した結果を返します。
  # 
  # arg.to_ary と arg.to_a をこの順に呼び出して、返ってきた配列を変換結果とします。
  # 
  # arg に to_ary, to_a のいずれのメソッドも定義されていない場合は
  # 一要素の配列 [arg] を返します。
  # 
  # @param arg 変換対象のオブジェクトです。
  # @raise TypeError to_ary, to_a の返り値が配列でなければ発生します
  # 
  # //emlist[例][ruby]{
  # p Array({:it => 3}) #=> [[:it, 3]]
  # p Array(nil) #=> []
  # p Array("fefe") #=> ["fefe"]
  # //}
  # 
  # @see [[m:Object#to_a]],[[m:Object#to_ary]],[[c:Array]]
  def Array; end

  # --- BigDecimal(s, exception: true) -> BigDecimal | nil
  # --- BigDecimal(s, n, exception: true) -> BigDecimal | nil
  # 
  # 引数で指定した値を表す BigDecimal オブジェクトを生成します。
  # 
  # @param s 数値を表現する初期値を文字列、[[c:Integer]]、
  #          [[c:Float]]、[[c:Rational]]、[[c:BigDecimal]] オブジェクトのい
  #          ずれかで指定します。
  #          文字列中のスペースは無視されます。また、判断できない文字が出現
  #          した時点で文字列は終了したものとみなされます。
  # 
  # @param n 必要な有効桁数(self の最大有効桁数)を整数で指定します。 n が
  #          0 または省略されたときは、n の値は s の有効桁数とみなされます。
  #          s の有効桁数より n が小さいときもn = 0 のときと同じです。
  #          self の最大有効桁数は n より若干大きい値が採用されます。最大有
  #          効桁数は以下のような割り算を実行するとき等に意味を持ちます。
  # //emlist[][ruby]{
  # require "bigdecimal"
  # BigDecimal("1")    / BigDecimal("3")    # => 0.333333333333333333e0
  # BigDecimal("1",10) / BigDecimal("3",10) # => 0.333333333333333333e0
  # //}
  #          ただし、個々の演算における最大有効桁数 n の取り扱いは将来のバー
  #          ジョンで若干変更される可能性があります。
  # 
  # @param exception false を指定すると、変換できなかった場合、
  #                  例外を発生する代わりに nil を返します。
  # 
  # @raise ArgumentError s に [[c:Float]] オブジェクトを指定し、n に
  #                      [[m:Float::DIG]] + 2 以上の値を指定した場合に発生します。
  #                      s に [[c:Float]]、[[c:Rational]] オブジェクトを指
  #                      定し、n を省略した場合に発生します。
  # 
  # @raise ArgumentError n に負の数を指定した場合に発生します。
  def BigDecimal; end

  # --- Complex(r, i = 0, exception: true) -> Complex | nil
  # --- Complex(s, exception: true)        -> Complex | nil
  # 
  # 実部が r、虚部が i である [[c:Complex]] クラスのオブジェクトを生成します。
  # 
  # @param r 生成する複素数の実部。
  # 
  # @param i 生成する複素数の虚部。省略した場合は 0 です。
  # 
  # @param s 生成する複素数を表す文字列。
  # 
  # @param exception false を指定すると、変換できなかった場合、
  #                  例外を発生する代わりに nil を返します。
  # 
  # @raise ArgumentError 変換できないオブジェクトを指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Complex(1)       # => (1+0i)
  # Complex(1, 2)    # => (1+2i)
  # Complex('1+1i')  # => (1+1i)
  # Complex('1+1j')  # => (1+1i)
  # # Complex.polar(10, 10) と同一。
  # Complex('10@10') # => (-8.390715290764524-5.440211108893697i)
  # Complex('_')     # => ArgumentError
  # //}
  # 
  # r にも i にも複素数と解釈されるオブジェクトを指定した場合には、
  # Complex(a, b) を a+bi として計算した [[c:Complex]] オブジェクトを返しま
  # す。
  # 
  # //emlist[例][ruby]{
  # Complex('1+1i', '2+3i')                          # => (-2+3i)
  # Complex('1+1i') + Complex('2+3i') * Complex('i') # => (-2+3i)
  # //}
  # 
  # @see [[m:Complex.rect]]、[[m:Complex.rectangular]]
  # 
  # [注意] Complex.new、Complex.new! は 1.9 系では廃止されました。
  def Complex; end

  # --- Float(arg, exception: true) -> Float | nil
  # 
  # 引数を浮動小数点数([[c:Float]])に変換した結果を返します。
  # 
  # 引数が数値の場合は素直に変換し、文字列の場合
  # は整数や浮動小数点数と見なせるもののみ変換します。
  # 
  # メソッド Float は文字列に対し [[m:String#to_f]] よりも厳密な変換を行います。
  # 
  # @param arg 変換対象のオブジェクトです。
  # @param exception false を指定すると、変換できなかった場合、
  #                  例外を発生する代わりに nil を返します。
  # @raise ArgumentError 整数や浮動小数点数と見なせない文字列を引数に指定した場合に発生します。
  # @raise TypeError nil またはメソッド to_f を持たないオブジェクトを引数に指定したか、
  #                  to_f が浮動小数点数を返さなかった場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p Float(4)            #=> 4.0
  # p Float(4_000)        #=> 4000.0
  # p Float(9.88)         #=> 9.88
  # 
  # p Float(Time.gm(1986)) #=> 504921600.0
  # p Float(Object.new)   # can't convert Object into Float (TypeError)
  # p Float(nil)          # can't convert nil into Float (TypeError)
  # 
  # p Float("10")         #=> 10.0
  # p Float("10e2")       #=> 1000.0
  # p Float("1e-2")       #=> 0.01
  # p Float(".1")         #=> 0.1
  # p Float("0xa")        #=> 10.0
  # 
  # p Float("nan")        # invalid value for Float(): "nan" (ArgumentError)
  # p Float("INF")        # invalid value for Float(): "INF" (ArgumentError)
  # p Float("-Inf")       # invalid value for Float(): "-Inf" (ArgumentError)
  # p Float(("10" * 1000)) #=> Infinity
  # p Float("0xa.a")      # invalid value for Float(): "0xa.a" (ArgumentError)
  # p Float(" \n10\s \t") #=> 10.0 # 先頭と末尾の空白類は無視される
  # p Float("1\n0")       # invalid value for Float(): "1\n0" (ArgumentError)
  # p Float("")           # invalid value for Float(): "" (ArgumentError)
  # //}
  # 
  # @see [[m:String#to_f]],[[c:Float]]
  def Float; end

  # --- Hash(arg) -> Hash
  # 
  # 引数 arg で指定したオブジェクトを to_hash メソッドを呼び出す事で
  # [[c:Hash]] オブジェクトに変換します。nil か [] を指定した場合は空の
  # [[c:Hash]] オブジェクトを返します。
  # 
  # @param arg 変換対象のオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # Hash([])          # => {}
  # Hash(nil)         # => {}
  # Hash(key: :value) # => {:key => :value}
  # Hash([1, 2, 3])   # => TypeError
  # //}
  # 
  # @raise TypeError 変換できないオブジェクトを指定した場合に発生します。
  def Hash; end

  # --- Integer(arg, base = 0, exception: true) -> Integer | nil
  # 
  # 引数を整数([[c:Fixnum]],[[c:Bignum]])に変換した結果を返します。
  # 
  # 引数が数値の場合は直接変換し（小数点以下切り落とし）、
  # 文字列の場合は、進数を表す接頭辞を含む整数表現とみなせる文字列のみ
  # 変換します。
  # 
  # 数値と文字列以外のオブジェクトに対しては arg.to_int, arg.to_i を
  # この順に使用して変換します。
  # 
  # @param arg 変換対象のオブジェクトです。
  # 
  # @param base 基数として0か2から36の整数を指定します(引数argに文字列を指
  #             定した場合のみ)。省略するか0を指定した場合はプリフィクスか
  #             ら基数を判断します。その場合に認識できるプリフィクスは、0b
  #             (2 進数)、0 (8 進数)、0o (8 進数)、0d (10 進数)、0x (16 進
  #             数) です。
  # 
  # @param exception false を指定すると、変換できなかった場合、
  #                  例外を発生する代わりに nil を返します。
  # 
  # @raise ArgumentError 整数と見なせない文字列を引数に指定した場合に発生します。
  # @raise TypeError メソッド to_int, to_i を持たないオブジェクトを引数に指定したか、to_int, to_i
  #   が整数([[c:Integer]]のサブクラス)を返さなかった場合に発生します。
  # @raise TypeError 引数に nil を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p Integer(4)          #=> 4
  # p Integer(4_000)      #=> 4000
  # p Integer(9.88)       #=> 9
  # 
  # p Integer(nil)        # can't convert nil into Integer (TypeError)
  # p Integer(Object.new) # cannot convert Object into Integer (TypeError)
  # 
  # p Integer("10")       #=> 10
  # p Integer("10", 2)    #=> 2
  # p Integer("0d10")     #=> 10
  # p Integer("010")      #=> 8
  # p Integer("0o10")     #=> 8
  # p Integer("0x10")     #=> 16
  # p Integer("0b10")     #=> 2
  # p Integer(" \n10\t ") #=> 10 # 先頭と末尾の空白類は無視される
  # p Integer("1\n0")     # `Integer': invalid value for Integer: "1\n0" (ArgumentError)
  # p Integer("hoge")     # `Integer': invalid value for Integer: "hoge" (ArgumentError)
  # p Integer("")         # `Integer': invalid value for Integer: "" (ArgumentError)
  # //}
  # 
  # @see [[m:String#hex]],[[m:String#oct]],[[m:String#to_i]],[[c:Integer]]
  def Integer; end

  # --- Rational(x, y = 1, exception: true) -> Rational | nil
  # 
  # 引数を有理数([[c:Rational]])に変換した結果を返します。
  # 
  # @param x 変換対象のオブジェクトです。
  # 
  # @param y 変換対象のオブジェクトです。省略した場合は x だけを用いて
  #          [[c:Rational]] オブジェクトを作成します。
  # 
  # @param exception false を指定すると、変換できなかった場合、
  #                  例外を発生する代わりに nil を返します。
  # 
  # @raise ArgumentError 変換できないオブジェクトを指定した場合に発生します。
  # 
  # 引数 x、y の両方を指定した場合、x/y した [[c:Rational]] オブジェクトを
  # 返します。
  # 
  # //emlist[例][ruby]{
  # Rational("1/3")           # => (1/3)
  # Rational(1, 3)            # => (1/3)
  # Rational("0.1", "0.3")    # => (1/3)
  # Rational(Complex(1,2), 2) # => ((1/2)+(1/1)*i)
  # //}
  # 
  # ただし、1.8系とは異なり、[[c:Rational]] オブジェクトは常に既約(それ以上
  # 約分できない状態)である事に注意してください。
  # 
  # //emlist[例][ruby]{
  # Rational(2, 6)         # => (1/3)
  # Rational(1, 3) * 3     # => (1/1)
  # //}
  # 
  # 引数に文字列を指定する場合、以下のいずれかの形式で指定します。
  # 
  #  * "1/3" のような分数の形式
  #  * "0.3" のような10進数の形式
  #  * "0.3E0" のような x.xEn の形式
  #  * 数字をアンダースコアで繋いだ形式
  # 
  # "1.2/3" のように、分子を実数にする事も可能ですが、分母には指定できませ
  # ん。また、[[m:Kernel.#Integer]] とは違い "0x10" のような進数を表す接頭
  # 辞を含めた指定は行えません。
  # 
  # //emlist[例][ruby]{
  # Rational("1/3")        # => (1/3)
  # Rational("0.3")        # => (3/10)
  # Rational('0.3E0')      # => (3/10)
  # Rational('0.1E1/3')    # => (1/3)
  # Rational('1.2/3')      # => (2/5)
  # Rational('1/3.1')      # => ArgumentError
  # Rational('3.0', '3.0') # => (1/1)
  # Rational('3/3', '3/3') # => (1/1)
  # Rational('1_234_567')  # => (1234567/1)
  # Rational(" \n10\t ")   # => (10/1) # 空白類は無視される
  # Rational("0x10")       # => ArgumentError
  # //}
  # 
  # 引数に変換できないオブジェクトを指定した場合には [[c:ArgumentError]] が
  # 発生します。
  # 
  # //emlist[例][ruby]{
  # Rational(Object.new)   # => ArgumentError
  # Rational("")           # => ArgumentError
  # Rational(nil)          # => ArgumentError
  # //}
  # 
  # また、Rational('0.3') と Rational(0.3) は異なるオブジェクトを返す事に注
  # 意してください。前者は正確に 3/10 ですが、後者はそうではありません。
  # 
  # //emlist[例][ruby]{
  # Rational('0.3')        # => (3/10)
  # Rational(0.3)          # => (5404319552844595/18014398509481984)
  # //}
  # 
  # @see [[c:Rational]]
  def Rational; end

  # --- String(arg) -> String
  # 
  # 引数を文字列([[c:String]])に変換した結果を返します。
  # 
  # arg.to_s を呼び出して文字列に変換します。
  # arg が文字列の場合、何もせず arg を返します。
  # 
  # @param arg 変換対象のオブジェクトです。
  # @raise TypeError to_s の返り値が文字列でなければ発生します。
  # 
  # //emlist[例][ruby]{
  # class Foo
  #  def to_s
  #    "hogehoge"
  #  end
  # end
  # 
  # arg = Foo.new
  # p String(arg) #=> "hogehoge"
  # //}
  # 
  # @see [[m:Object#to_s]],[[c:String]]
  def String; end

  # --- URI(uri_str) -> object
  # 
  # 与えられた URI から該当する [[c:URI::Generic]] のサブクラスのインスタンスを生成して
  # 返します。scheme が指定されていない場合は、[[c:URI::Generic]] オブジェクトを返します。
  # 
  # @param uri_str パースしたい URI を文字列として与えます。
  # 
  # @raise URI::InvalidURIError パースに失敗した場合に発生します。
  # 
  # @see [[m:URI.parse]]
  def URI; end

  # --- __callee__ -> Symbol | nil
  # 
  # 現在のメソッド名を返します。
  # メソッドの外で呼ばれると nil を返します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   p __callee__
  # end
  # alias :bar :foo
  # foo # => :foo
  # bar # => :bar
  # p __callee__ # => nil
  # //}
  # 
  # [[m:Kernel.#__method__]] とは異なり、現在のメソッド名が alias されたメ
  # ソッドの場合には alias 先のメソッド名を返します。
  # 
  # @see [[m:Kernel.#__method__]]
  def __callee__; end

  # --- __dir__ -> String | nil
  # 
  # 現在のソースファイル(__FILE__)のあるディレクトリ名を正規化された絶対パ
  # スで返します。シンボリックリンクも解決されます。また、__FILE__ が nil
  # の場合は nil を返します。
  def __dir__; end

  # --- __method__ -> Symbol | nil
  # 
  # 現在のメソッド名を返します。
  # メソッドの外で呼ばれると nil を返します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   p __method__
  # end
  # alias :bar :foo
  # foo #=> :foo
  # bar #=> :foo
  # p __method__ #=> nil
  # //}
  # 
  # 現在のメソッド名が alias されたメソッドの場合でも alias 元のメソッド名
  # を返します。
  def __method__; end

  # --- `(command) -> String
  # 
  # command を外部コマンドとして実行し、その標準出力を文字列として
  # 返します。このメソッドは `command` の形式で呼ばれます。
  # 
  # 引数 command に対しダブルクォートで囲まれた文字列と同様の解釈と式展開を行った後、
  # コマンドとして実行します。
  # コマンドは評価されるたびに実行されます。コマンドの終了ステータスを得るには、[[m:$?]] を参照します。
  # 
  # コマンドの出力を得る必要がなく、単にコマンドを実行したいだけなら
  # [[m:Kernel.#system]] を使います。特に端末を制御するコマンドでは
  # `command` は失敗するかもしれません。
  # 
  # [[ref:d:spec/literal#command]] も参照。
  # 
  # @param command コマンドとして実行する引数です。そのまま評価されるのではなく、
  #        ダブルクォート文字列と同様のバックスラッシュ記法の解釈と式展開が行われます。
  # @return コマンドの出力を文字列で返します。
  # @raise Errno::EXXX コマンドを実行できないときや失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # puts `ruby -v` #=> ruby 1.8.6 (2007-03-13 patchlevel 0) [i386-mswin32]
  # puts $?.inspect #=> #<Process::Status: pid=3580,exited(0)>
  # //}
  # 
  # @see [[m:Kernel.#system]],[[m:Kernel.#exec]],[[m:Kernel.#spawn]]
  def `; end

  # --- abort            -> ()
  # --- abort(message)   -> ()
  # 
  # Ruby プログラムをエラーメッセージ付きで終了します。終了ステータスは 1 固定です。
  # 
  # このメソッドと [[m:Kernel.#exit]] との違いは、プログラムの終了ステー
  # タスが 1 (正確にはCレベルの定数 EXIT_FAILURE の値)固定であることと、
  # エラーメッセージを標準エラー出力 [[m:$stderr]] に出力することです。
  # 
  # 引数 message を指定すると SystemExit クラスの
  # [[m:Exception#message]] に message を設定し
  # て標準エラー出力に出力します。
  # 
  # 引数を省略した呼び出し時に [[m:$!]] が nil でなければその例外のメッセージと
  # バックトレースを表示します。
  # 
  # @param message エラーメッセージ文字列です。
  # 
  # //emlist[][ruby]{
  # puts 'start'
  # begin
  #   puts 'start1...'
  #   abort "error1"
  # rescue SystemExit => err
  #   puts "end1 with #{err.inspect}"
  # end
  # 
  # begin
  #   puts 'start2...'
  #   raise RuntimeError.new
  # rescue
  #   abort
  # ensure
  #   puts 'end2...'
  # end
  # puts 'end' #実行されない
  # 
  # #(標準出力)
  # #=> start
  # #   start1...
  # #   end1 with #<SystemExit: error1>
  # #   start2...
  # #   end2...
  # #終了ステータス:1
  # #(標準エラー出力)
  # #=> error1
  # #   Traceback (most recent call last):
  # #   sample.rb:11:in `<main>': RuntimeError (RuntimeError)
  # //}
  # 
  # @see [[m:Kernel.#exit]],[[m:Kernel.#exit!]]
  def abort; end

  # --- at_exit{ ... } -> Proc
  # 
  # 与えられたブロックをインタプリタ終了時に実行します。
  # 
  # at_exitがメソッドである点を除けば、END ブロックによる終了
  # 処理の登録と同等です。登録した処理を取り消すことはできません。
  # [[d:spec/terminate]]も参照してください。
  # 
  # @return 登録した処理を [[c:Proc]] オブジェクトで返します。
  # 
  # //emlist[例][ruby]{
  # 3.times do |i|
  #   at_exit{puts "at_exit#{i}"}
  # end
  # END{puts "END"}
  # at_exit{puts "at_exit"}
  # puts "main_end"
  # 
  # #=> main_end
  # #   at_exit
  # #   END
  # #   at_exit2
  # #   at_exit1
  # #   at_exit0
  # //}
  # 
  # @see [[ref:d:spec/control#END]],[[m:Kernel.#exit!]],[[m:Kernel.#fork]]
  def at_exit; end

  # --- autoload(const_name, feature) -> nil
  # 
  # 定数 const_name を最初に参照した時に feature を
  # [[m:Kernel.#require]] するように設定します。
  # 
  # const_name には、 "::" 演算子を含めることはできません。
  # ネストした定数を指定する方法は [[m:Module#autoload]] を参照してください。
  # 
  # @param const_name 定数をString または Symbol で指定します。
  # @param feature require と同様な方法で autoload する対象を指定します。
  # @raise LoadError featureのロードに失敗すると発生します。
  # 
  # //emlist[][ruby]{
  # # ------- /tmp/foo.rb ---------
  # class Bar
  # end
  # # ----- end of /tmp/foo.rb ----
  # 
  # autoload :Bar, '/tmp/foo'
  # p Bar #=> Bar
  # //}
  # 
  # @see [[m:Kernel.#autoload?]],[[m:Module#autoload]],[[m:Kernel.#require]]
  def autoload; end

  # --- autoload?(const_name) -> String | nil
  # 
  # const_name が [[m:Kernel.#autoload]] 設定されているか調べます。
  # 
  # autoload 設定されていて、autoload 定数がまだ定義されてない(ロードされていない)
  # ときにそのパス名を返します。
  # 
  # autoload 設定されていないか、ロード済みなら nil を返します。
  # 
  # @param const_name 定数をString または Symbol で指定します。
  # 
  # //emlist[例][ruby]{
  # # ------- /tmp/foo.rb ---------
  # class Foo
  #   class Bar
  #   end
  # end
  # # ----- end of /tmp/foo.rb ----
  # 
  # class Foo
  # end
  # p Foo.autoload?(:Bar)         #=> nil
  # Foo.autoload :Bar, '/tmp/foo'
  # p Foo.autoload?(:Bar)         #=> "/tmp/foo"
  # p Foo::Bar                    #=> Foo::Bar
  # p Foo.autoload?(:Bar)         #=> nil
  # //}
  # 
  # @see [[m:Kernel.#autoload]]
  def autoload?; end

  # --- binding -> Binding
  # 
  # 変数・メソッドなどの環境情報を含んだ [[c:Binding]] オブジェクトを
  # 生成して返します。通常、[[m:Kernel.#eval]] の第二引数として使います。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   a = 1
  #   binding
  # end
  # 
  # eval("p a", foo)  #=> 1
  # //}
  # 
  # @see [[m:Kernel.#eval]],[[m:Object::TOPLEVEL_BINDING]]
  def binding; end

  # --- block_given? -> bool
  # --- iterator? -> bool
  # 
  # メソッドにブロックが与えられていれば真を返します。
  # 
  # このメソッドはカレントコンテキストにブロックが与えられているかを調べるので、
  # メソッド内部以外で使っても単に false を返します。
  # 
  # iterator? は （ブロックが必ずイテレートするとはいえないので）推奨されていないの
  # で block_given? を使ってください。
  # 
  # //emlist[例][ruby]{
  # def check
  #   if block_given?
  #     puts "Block is given."
  #   else
  #     puts "Block isn't given."
  #   end
  # end
  # check{} #=> Block is given.
  # check #=> Block isn't given.
  # //}
  def block_given?; end

  # --- callcc {|cont| .... } -> object
  # 
  # 継続を作成します。 [[c:Continuation]] を参照してください。
  def callcc; end

  # --- caller(start = 1)               -> [String] | nil
  # --- caller(start, length)           -> [String] | nil
  # --- caller(range)                   -> [String] | nil
  # 
  # start 段上の呼び出し元の情報を [[m:$@]]
  # の形式のバックトレース(文字列の配列)として返します。
  # 
  # トップレベルでは空の配列を返します。caller の戻り値を [[m:$@]] に代入することで
  # 例外の発生位置を設定できます。
  # 
  # 引数で指定した値が範囲外の場合は nil を返します。
  # 
  # @param start long の範囲を超えない正の整数でスタックレベルを指定します。
  # @param length 取得するスタックの個数を指定します。
  # 
  # @param range 取得したいスタックの範囲を示す [[c:Range]] オブジェクトを指定します。
  # 
  # @see [[m:Kernel.#set_trace_func]],[[m:Kernel.#raise]],
  #      [[m:Kernel.#caller_locations]]
  # 
  # //emlist[例][ruby]{
  # def foo
  #   p caller(0)
  #   p caller(1)
  #   p caller(2)
  #   p caller(3)
  #   p caller(4)
  # end
  # 
  # def bar
  #   foo
  # end
  # 
  # bar
  # 
  # #=> ["-:2:in `foo'", "-:10:in `bar'", "-:13:in `<main>'"]
  # #   ["-:10:in `bar'", "-:13:in `<main>'"]
  # #   ["-:13:in `<main>'"]
  # #   []
  # #   nil
  # //}
  # 
  # 以下の関数は、caller の要素から [ファイル名, 行番号, メソッド名]
  # を取り出して返します。
  # 
  # //emlist[例][ruby]{
  # def parse_caller(at)
  #   if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
  #     file = $1
  #     line = $2.to_i
  #     method = $3
  #     [file, line, method]
  #   end
  # end
  # 
  # def foo
  #   p parse_caller(caller.first)
  # end
  # 
  # def bar
  #   foo
  #   p parse_caller(caller.first)
  # end
  # 
  # bar
  # p parse_caller(caller.first)
  # 
  # #=> ["-", 15, "bar"]
  # #   ["-", 19, nil]
  # #   nil
  # //}
  # 
  # 以下は、[[m:$DEBUG]] が真の場合に役に立つ debug 関数
  # のサンプルです。
  # 
  # //emlist[例][ruby]{
  # $DEBUG = true
  # 
  # def debug(*args)
  #   p [caller.first, *args] if $DEBUG
  # end
  # 
  # debug "debug information"
  # 
  # #=> ["-:7", "debug information"]
  # //}
  def caller; end

  # --- caller_locations(start = 1, length = nil) -> [Thread::Backtrace::Location] | nil
  # --- caller_locations(range)                   -> [Thread::Backtrace::Location] | nil
  # 
  # 現在のフレームを [[c:Thread::Backtrace::Location]] の配列で返します。引
  # 数で指定した値が範囲外の場合は nil を返します。
  # 
  # @param start 開始フレームの位置を数値で指定します。
  # 
  # @param length 取得するフレームの個数を指定します。
  # 
  # @param range  取得したいフレームの範囲を示す [[c:Range]] オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # def test1(start, length)
  #   locations = caller_locations(start, length)
  #   p locations
  #   p locations.map(&:lineno)
  #   p locations.map(&:path)
  # end
  # 
  # def test2(start, length)
  #   test1(start, length)
  # end
  # 
  # def test3(start, length)
  #   test2(start, length)
  # end
  # 
  # caller_locations # => []
  # test3(1, nil)
  # # => ["/Users/user/test.rb:9:in `test2'", "/Users/user/test.rb:13:in `test3'", "/Users/user/test.rb:17:in `<main>'"]
  # # => [9, 13, 17]
  # # => ["/Users/user/test.rb", "/Users/user/test.rb", "/Users/user/test.rb"]
  # test3(1, 2)
  # # => ["/Users/user/test.rb:9:in `test2'", "/Users/user/test.rb:13:in `test3'"]
  # # => [9, 13]
  # # => ["/Users/user/test.rb", "/Users/user/test.rb"]
  # test3(2, 1)
  # # => ["/Users/user/test.rb:13:in `test3'"]
  # # => [13]
  # # => ["/Users/user/test.rb"]
  # //}
  # 
  # @see [[c:Thread::Backtrace::Location]], [[m:Kernel.#caller]]
  def caller_locations; end

  # --- catch {|tag| .... } -> object
  # --- catch(tag) {|tag| .... } -> object
  # 
  # [[m:Kernel.#throw]]との組み合わせで大域脱出を行います。 catch はブロックを実行します。
  # 
  # ブロックの実行中に tag と同一のオブジェクトを引数とする [[m:Kernel.#throw]] が行われた
  # 場合は、その throw の第二引数を戻り値として、ブロックの実行を終了します。
  # 
  # 主にネストしたループから一気に脱出するのに使用します。
  # 
  # 引数を省略した場合、タグとなるオブジェクトが内部で生成され、ブロックパラメータ tag に
  # 渡されます。
  # 
  # @param tag タグとなる任意のオブジェクトです。
  # @return ブロックの返り値か、対応するthrowの第二引数を返り値として返します。
  # 
  # //emlist[例][ruby]{
  # result = catch do |tag|
  #   for i in 1..2
  #     for j in 1..2
  #       for k in 1..2
  #         throw tag, k
  #       end
  #     end
  #   end
  # end
  # 
  # p result #=> 1
  # //}
  # 
  # @see [[m:Kernel.#throw]]
  def catch; end

  # --- chomp(rs = $/)  -> String
  # 
  # $_.chomp とほぼ同じですが、置換が発生したときは、$_の内容を置き換える点が異なります。
  # コマンドラインオプションで -p または -n を指定した時のみ定義されます。
  # 
  # 暗号的になりすぎるきらいがあるため、このメソッドの使用は推奨されていません。
  # 今後はより明示的な $_.chomp を使ってください。
  # 
  # $_.chomp とこのメソッド chomp は以下の点で違いがあります。
  # 
  #   * chomp は $_ の値をコピーして、コピーの方を更新し、
  #   $_ に再代入します。
  # 
  # @param rs 末尾から削除する改行コードを指定します。
  # 
  # //emlist[例: ruby -n で "test" を入力][ruby]{
  # $_            # => "test\n"
  # chomp         # => "test"
  # //}
  # 
  # //emlist[例: ruby -n で "test," を入力し、 rs に "," を指定][ruby]{
  # $_            # => "test\n"
  # chomp         # => "test,"
  # chomp(",")    # => "test"
  # //}
  # 
  # @see [[m:String#chomp]],[[m:$_]],[[m:$/]]
  def chomp; end

  # --- chop  -> String
  # 
  # $_.chop とほぼ同じですが、置換が発生したときは、$_の内容を置き換える点が異なります。
  # コマンドラインオプションで -p または -n を指定した時のみ定義されます。
  # 
  # 暗号的になりすぎるきらいがあるため、このメソッドの使用は推奨されていません。
  # 今後はより明示的な $_.chop を使ってください。
  # 
  # $_.chopとこのメソッド chop は以下の点で違いがあります。
  # 
  #   * chop は $_ の値をコピーして、コピーの方を更新し、
  #   $_ に再代入します。
  # 
  # //emlist[例][ruby]{
  # $_ = "test\r\n"
  # $_          # => "test\r\n"
  # chop        # => "test"
  # $_ = "test\n"
  # $_          # => "test\n"
  # chop        # => "test"
  # $_ = "test"
  # $_          # => "test"
  # chop        # => "tes"
  # //}
  # 
  # @see [[m:String#chop]],[[m:$_]]
  def chop; end

  # --- eval(expr) -> object
  # --- eval(expr, bind, fname = "(eval)", lineno = 1) -> object
  # 
  # 文字列 expr を Ruby プログラムとして評価してその結果を返しま
  # す。第2引数に
  # [[c:Binding]] オブジェクトを与えた場合、
  # そのオブジェクトを生成したコンテキストで文字列を評価します。
  # 
  # expr の中のローカル変数の扱いはブロックの場合と同じです。すなわち、eval
  # 実行前に補足されていた変数は eval 実行後にブロック外に持ち出せます。
  # 
  # fname と lineno が与えられた場合には、ファイル
  # fname の行番号 lineno から文字列 expr が書かれているかのように
  # コンパイルされます。スタックトレースの表示などを差し替えることが
  # できます。
  # 
  # bind によらずに特定のオブジェクトのコンテキストで expr を評価したい場合、
  # [[m:Module#module_eval]], [[m:BasicObject#instance_eval]] が使えます。
  # 
  # @param expr  評価する文字列です。
  # @param bind  評価コンテキストです。
  # @param fname スタックトレースに表示するファイル名です。
  # @param lineno 文字列 expr が書かれていると想定する先頭の行番号を整数で指定します。
  # 
  # //emlist[例][ruby]{
  # a = nil
  # eval('a = RUBY_RELEASE_DATE')
  # p a #=> "2007-03-13"
  # 
  # eval('def fuga;p 777 end')
  # fuga #=> 777
  # 
  # eval('raise RuntimeError', binding, 'XXX.rb', 4)
  # #=> XXX.rb:4: RuntimeError (RuntimeError)
  # #       from ..:9
  # //}
  # 
  # @see [[m:Kernel.#binding]],[[m:Module#module_eval]],[[m:BasicObject#instance_eval]],[[m:Object#method]],[[m:Object#send]]
  def eval; end

  # --- exec(command, options={}) -> ()
  # --- exec(env, command, options={}) -> ()
  # 
  # 引数で指定されたコマンドを実行します。
  # 
  # プロセスの実行コードはそのコマンド(あるいは shell)になるので、
  # 起動に成功した場合、このメソッドからは戻りません。
  # 
  # === 引数の解釈
  # 
  # この形式では command が shell のメタ文字
  # //emlist{
  #   * ? {} [] <> () ~ & | \ $ ; ' ` " \n
  # //}
  # を含む場合、shell 経由で実行されます。
  # そうでなければインタプリタから直接実行されます。
  # 
  # @param command コマンドを文字列で指定します。
  # @param env 更新する環境変数を表す Hash
  # @param options オプションパラメータ Hash
  # @raise Errno::EXXX 起動に失敗し、ruby インタプリタに制御が戻った場合に発生します。
  # 
  # //emlist[例][ruby]{
  # # a.rb
  # puts '実行前'
  # exec 'echo "実行中"'
  # puts '実行後'
  # //}
  # 
  # 上記のスクリプトを実行すると以下のようになります。
  # 
  #   $ ruby a.rb
  #   実行前
  #   実行中
  #   # '実行後' は表示されない
  # 
  # --- exec(program, *args, options={}) -> ()
  # --- exec(env, program, *args, options={}) -> ()
  # 
  # 引数で指定されたコマンドを実行します。
  # 
  # プロセスの実行コードはそのコマンド(あるいは shell)になるので、
  # 起動に成功した場合、このメソッドからは戻りません。
  # 
  # この形式では、常に shell を経由せずに実行されます。
  # 
  # [[man:exec(3)]] でコマンドを実行すると、
  # 元々のプログラムの環境をある程度(ファイルデスクリプタなど)引き継ぎます。
  # Hash を options として渡すことで、この挙動を変更できます。
  # 詳しくは [[m:Kernel.#spawn]] を参照してください。
  # 
  # === 引数の解釈
  # 
  # この形式で呼び出した場合、空白や shell のメタキャラクタも
  # そのまま program の引数に渡されます。
  # 先頭の引数が2要素の配列であった場合、第1要素の文字列が実際に
  # 起動するプログラムのパスであり、第2要素が「みせかけ」のプロ
  # グラム名になります。
  # また、第1要素はフルパスで指定しなくても環境変数 PATH から探します。
  # 
  # @param program 文字列か2要素の配列を指定します。
  # @param args 渡される引数です。0 個以上の文字列を指定します。
  # @param env 更新する環境変数を表す Hash
  # @param options オプションパラメータ Hash
  # @raise ArgumentError 第一引数が配列かつ要素数が 2 でない場合に発生します。
  # @raise Errno::EXXX 起動に失敗し、ruby インタプリタに制御が戻った場合に発生します。
  # 
  # 
  # 
  # //emlist[例][ruby]{
  # # a.rb
  # exec ['sleep', 'mysleep'], '600'
  # //}
  # 
  # 上記スクリプトを実行すると以下のようになります。
  # 
  #   $ ruby a.rb
  #   ## sleep してるので制御が戻ってこない。別の仮想端末に切替えて以下を実行
  #   $ ps aux|grep sleep
  #   xxxx    32754  0.0  0.0   2580   468 pts/3    S+   22:01   0:00 mysleep 600
  #   xxxx    32761  0.0  0.0   2824   792 pts/6    S+   22:01   0:00 grep sleep
  # 
  # @see [[m:Kernel.#system]],[[m:Kernel.#`]],[[m:Kernel.#spawn]],[[m:Kernel.#fork]],[[m:IO.popen]],[[m:IO.pipe]],[[m:Kernel.#open]],[[man:exec(3)]]
  def exec; end

  # --- exit(status = true) -> ()
  # 
  # Rubyプログラムの実行を終了します。status として整
  # 数が与えられた場合、その値を Ruby コマンドの終了ステータスとします。
  # デフォルトの終了ステータスは 0(正常終了)です。
  # 
  # status が true の場合 0、 false の場合 1 を引数に指定したとみなされます。この値はCレベルの定数
  # EXIT_SUCCESS、EXIT_FAILURE の値なので、正確には環境依存です。
  # 
  # exit は例外 [[c:SystemExit]] を発生させ
  # ることによってプログラムの実行を終了させますので、
  # 必要に応じて begin 節で捕捉することができます。
  # 
  # @param status 終了ステータスを整数か true または false で与えます。
  # 
  # //emlist[例][ruby]{
  # puts 'start'
  # begin
  #   puts 'start1...'
  #   exit
  # rescue SystemExit => err
  #   puts "end1 with #{err.inspect}"
  # end
  # 
  # begin
  #   puts 'start2...'
  #   exit
  # ensure
  #   puts 'end2...'
  # end
  # puts 'end' #実行されない
  # 
  # #=> start
  # #   start1...
  # #   end1 with #<SystemExit: exit>
  # #   start2...
  # #   end2...
  # #終了ステータス:0
  # //}
  # 
  # @see [[m:Kernel.#exit!]],[[m:Kernel.#abort]], [[ref:d:spec/control#begin]]
  def exit; end

  # --- exit!(status = false) -> ()
  # 
  # Rubyプログラムの実行を即座に終了します。
  # status として整数が与えられた場合、その値を Ruby コマンドの終了ステータスとします。
  # デフォルトの終了ステータスは 1 です。
  # 
  # status が true の場合 0、 false の場合 1 を引数に指定したとみなされます。この値はCレベルの定数
  # EXIT_SUCCESS、EXIT_FAILURE の値なので、正確には環境依存です。
  # 
  # exit! は exit とは違って、例外処理などは一切行ないませ
  # ん。 [[m:Kernel.#fork]] の後、子プロセスを終了させる時などに用
  # いられます。
  # 
  # @param status 終了ステータスを整数か true または false で与えます。
  # 
  # //emlist[例][ruby]{
  # STDOUT.sync = true #表示前に終了しないようにする
  # puts 'start'
  # begin
  #   puts 'start1...'
  #   exit!
  # ensure
  #   puts 'end1...' #実行されない
  # end
  # puts 'end' #実行されない
  # 
  # #=> start
  # #   start1...
  # #終了ステータス:1
  # //}
  # 
  # @see [[m:Kernel.#exit]],[[m:Kernel.#abort]],[[m:Kernel.#at_exit]],[[m:Kernel.#fork]]
  def exit!; end

  # --- raise -> ()
  # --- fail  -> ()
  # --- raise(message, cause: $!) -> ()
  # --- fail(message, cause: $!)  -> ()
  # --- raise(error_type, message = nil, backtrace = caller(0), cause: $!) -> ()
  # --- fail(error_type, message = nil, backtrace = caller(0), cause: $!)  -> ()
  # 
  # 例外を発生させます。
  # 発生した例外は変数 [[m:$!]] に格納されます。また例外が
  # 発生した時のスタックトレースは変数 [[m:$@]] に格納され
  # ます。発生した例外は rescue 節で捕捉できます。
  # 
  # 引数無しの場合は、同スレッドの同じブロック内で最後に rescue された
  # 例外オブジェクト ([[m:$!]]) を再発生させます。そのような
  # 例外が存在しないが自身は捕捉されている時には例外 [[c:RuntimeError]] を発生させます。
  # 
  # //emlist[例][ruby]{
  # begin
  #   open("nonexist")
  # rescue
  #   raise   #=> `open': No such file or directory - "nonexist" (Errno::ENOENT)
  # end
  # //}
  # 
  # 引数を渡した場合は、例外メッセージ message を持った error_type の示す例外(省略時 RuntimeError)を
  # 発生させます。
  # 
  # error_type として例外ではないクラスやオブジェクトを指定した場合、
  # そのオブジェクトの exception メソッドが返す値を発生する例外にします。
  # その際、exception メソッドに引数として変数 message を渡すことができます。
  # 
  # @param error_type 発生させる例外を例外クラスまたは例外クラスのインスタンスで指定します。
  # @param message 例外のメッセージとなる文字列です。
  # @param backtrace 例外発生時のスタックトレースで、[[m:Kernel.#caller]] の戻り値と同じ
  #   形式で指定しなければいけません。
  # @param cause 現在の例外([[m:$!]])の代わりに [[m:Exception#cause]] に設定する例外を指定します。
  #   [[c:Exception]] オブジェクトまたは nil を指定できます。
  # @raise TypeError exception メソッドが例外オブジェクトを返さなかった場合に発生します。
  # 
  # 例外の捕捉の例を示します。
  # 
  # //emlist[例1][ruby]{
  # begin
  #   raise NameError,"!!error!!"
  # rescue ArgumentError => err
  # rescue NameError => err
  # rescue TypeError => err
  # ensure
  #   p err #=> #<NameError: !!error!!>
  # end
  # //}
  # 
  # //emlist[例2][ruby]{
  # def foo num
  #   print 'in method.'
  #   raise "error!!" if num <= 9
  # rescue RuntimeError
  #   num += 10
  #   print 'in rescue.'
  #   retry
  # else
  #   print 'in else.'
  # ensure
  #   print "in ensure.\n"
  # end
  # 
  # foo(4) #=> in method.in rescue.in method.in else.in ensure.
  # //}
  # 
  # //emlist[例3][ruby]{
  # class MyException
  #   def exception(mesg=nil)
  #     SecurityError.new(mesg)
  #   end
  # end
  # 
  # begin
  #   raise MyException.new
  # rescue SecurityError
  #   p $! #=> #<SecurityError: SecurityError>
  # end
  # //}
  # 
  # @see [[m:Kernel.#caller]]
  def fail; end

  # --- fork -> Integer | nil
  # --- fork { ... } -> Integer | nil
  # 
  # [[man:fork(2)]] システムコールを使ってプロセスの複製を作
  # ります。親プロセスでは子プロセスのプロセスIDを、子プロセスでは
  # nil を返します。ブロックを指定して呼び出した場合には、生成し
  # た子プロセスでブロックを評価します。
  # 
  # fork 前に STDOUT と STDERR を [[m:IO#flush]] します。
  # 
  # @raise NotImplementedError 実行環境がこのメソッドに対応していないとき発生します。
  # 
  # //emlist[ブロックを指定しなかった場合][ruby]{
  # if child_pid = fork
  #   puts "parent process. pid: #{Process.pid}, child pid: #{child_pid}"
  #   # => parent process. pid: 81060, child pid: 81329
  # 
  #   # 親プロセスでの処理
  #   # ...
  # 
  #   # 子プロセスの終了を待って終了。
  #   Process.waitpid(child_pid)
  # else
  #   puts "child process. pid: #{Process.pid}"
  #   # => child process. pid: 81329
  # 
  #   # 子プロセスでの処理
  #   sleep(1)
  # end
  # //}
  # 
  # //emlist[ブロックを指定した場合][ruby]{
  # child_pid = fork do
  #   puts "child process. pid: #{Process.pid}"
  #   # => child process. pid: 79602
  # 
  #   # 子プロセスでの処理
  #   sleep(1)
  # end
  # 
  # puts "parent process. pid: #{Process.pid}, child pid: #{child_pid}"
  # # => parent process. pid: 79055, child pid: 79602
  # 
  # # 親プロセスでの処理
  # # ...
  # 
  # # 子プロセスの終了を待って終了。
  # Process.waitpid(child_pid)
  # //}
  # 
  # 
  # @see [[m:IO.popen]],[[m:IO.pipe]],[[m:Kernel.#at_exit]],[[m:Kernel.#exit!]], [[man:fork(2)]]
  def fork; end

  # --- sprintf(format, *arg) -> String
  # --- format(format, *arg) -> String
  # 
  # format 文字列を C 言語の sprintf と同じように解釈し、
  # 引数をフォーマットした文字列を返します。
  # 
  # @param format フォーマット文字列です。
  # @param arg フォーマットされる引数です。
  # @see [[m:Kernel.#printf]],[[m:Time#strftime]],[[m:Date.strptime]]
  # 
  # === sprintf フォーマット
  # 
  # Ruby の sprintf フォーマットは基本的に C 言語の [[man:sprintf(3)]]
  # のものと同じです。ただし、short や long などの C 特有の型に対する修飾子が
  # ないこと、2進数の指示子(%b, %B)が存在すること、sprintf のすべての方言をサ
  # ポートしていないこと(%': 3桁区切り)などの違いがあります。
  # 
  # Ruby には整数の大きさに上限がないので、%b, %B, %o, %x, %X
  # に負の数を与えると (左側に無限に1が続くとみなせるので)
  # ..f のような表示をします。絶対値に符号を付けた形式
  # で出力するためには %+x、% x のように指定します。
  # 
  # 
  # 以下は sprintf フォーマットの書式です。[] で囲まれた部分は省略可
  # 能であることを示しています。
  # 
  #  %[nth$][フラグ][幅][.精度]指示子
  #  %[<name>][フラグ][幅][.精度]指示子
  # 
  # `%' 自身を出力するには `%%' とします。
  # 
  # 以下それぞれの要素に関して説明します。
  # 
  # === フラグ
  # 
  # フラグには #, +, ' '(スペース), -, 0 の5種類があります。
  # 
  # : #
  # 
  #  2進、8進、16進の指示子(b, B, o, x, X) ではそれぞれプレフィック
  #  スとして "0b", "0B", "0", "0x", "0X" を付加します。
  #  C 言語と同様引数が 0 の場合にはプレフィックスが付加されません。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#b", 10) #=> "0b1010"
  # p sprintf("%#B", 10) #=> "0B1010"
  # p sprintf("%#b", 0)  #=> "0"
  # p sprintf("%#o", 10) #=> "012"
  # p sprintf("%#x", 10) #=> "0xa"
  # p sprintf("%#X", 10) #=> "0XA"
  # //}
  # 
  #  浮動小数点数 (f, e, E, g, G) に対しては必ず出力に"."をつけます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.0f", 10) #=> "10"
  # p sprintf("%#.0f", 10) #=> "10."
  # p sprintf("%.0e", 10) #=> "1e+01"
  # p sprintf("%#.0e", 10) #=> "1.e+01"
  # //}
  # 
  #  また g, G では上記に加えて末尾の余分な0が残ります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.05g", 10) #=> "10"
  # p sprintf("%#.05g", 10) #=> "10.000"
  # //}
  # 
  # : +
  # 
  #  出力文字列を符号付きにします。特に正の数では`+'が付加されます。
  #  数値の指示子
  #  (d, i, b, B, o, x, X, u, f, e, E, g, G)
  #  に対してだけ意味を持ちます。
  #  また、特に b, B, o, x, X, u に対しては、負数に対して "-"
  #  を付加することを示します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%d", 1)   #=> "1"
  # p sprintf("%+d", 1)  #=> "+1"
  # 
  # p sprintf("%x", -1)  #=> "..f"  # ".." は無限に f が続くことを表している
  # p sprintf("%+x", -1) #=> "-1"
  # //}
  # 
  # : ' '(スペース)
  # 
  #  `+' と同じですが正の符号 `+' の代わりに空白を用います。数値の指示子
  #  (d, i, b, B, o, x, X, u, f, e, E, g, G)
  #  に対してだけ意味を持ちます。
  # //emlist[][ruby]{
  # p sprintf("%d", 1)   #=> "1"
  # p sprintf("%+d", 1)  #=> "+1"
  # p sprintf("% d", 1)  #=> " 1"
  # 
  # p sprintf("%x", -1)  #=> "..f"
  # p sprintf("% x", 1)  #=> " 1"
  # p sprintf("% x", -1) #=> "-1"
  # //}
  # 
  # : -
  # 
  #  出力を左詰めにします。幅の指定がなければ
  #  意味がありません。
  # 
  # : 0
  # 
  #  出力が右詰めの場合に余った部分に空白の代わりに "0" を詰めます。
  # 
  #  数値の指示子の一部(d, i, b, B, o, x, X, u, f, g, G)に対し
  #  てだけ意味を持ちます(e, E には意味がない)
  # //emlist[][ruby]{
  # p sprintf("%010d", 10)   #=> "0000000010"
  # //}
  #  `#' と一緒に指定した場合の出力は以下のようになります。
  # //emlist[][ruby]{
  # p sprintf("%#010x", 10)  #=> "0x0000000a"
  # p sprintf("%#010o", 10)  #=> "0000000012"
  # p sprintf("%#010b", 10)  #=> "0b00001010"
  # //}
  # 
  #  これは、以下と同じです。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#10.8x", 10) #=> "0x0000000a"
  # p sprintf("%#10.9o", 10) #=> "0000000012"
  # p sprintf("%#10.8b", 10) #=> "0b00001010"
  # //}
  # 
  #  通常は、以下のようになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#10x", 10)   #=> "       0xa"
  # p sprintf("%#10o", 10)   #=> "       012"
  # p sprintf("%#10b", 10)   #=> "    0b1010"
  # //}
  # 
  # === 幅
  # 
  # 0以外の数字で始まる数字列は幅指定になります。幅は生成文字列の長さを示
  # します。後述の精度の値によらずこの幅分だ
  # けの文字列が生成されます。
  # 
  # 幅の指定はフラグで付与される " ", "+",
  # "-", "0b", "0B", "0", "0x", "0X" の長さも考慮されます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%+5d", 11)  #=> "  +11"
  # p sprintf("%+-5d", 11) #=> "+11  "
  # p sprintf("%+05d", 11) #=> "+0011"
  # //}
  # 
  # 幅は「最低限必要な幅」の指定になります。結果の文字列が指定した幅を超
  # える場合は幅の指定は無効になります。
  # 
  # 幅として `*' を指定すると幅の値を引数から得ることになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#05x", 10)    #=> "0x00a"
  # p sprintf("%#0*x", 5, 10) #=> "0x00a"
  # //}
  # 
  # === 精度
  # 
  # "." の後に続く数字列は精度を表します("." のみの場合 ".0" と同じです)。精度は
  # 整数の指示子
  # (d, i, b, B, o, x, X, u)
  # に対しては、数値列部分の長さを意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5d", 1)  #=> "     00001"
  # p sprintf("%#10.5x", 1) #=> "   0x00001"
  # p sprintf("%+10.5x", 1) #=> "    +00001"
  # //}
  # 
  # 浮動小数点数の指示子
  # (f)
  # に対しては小数部の桁数を意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5f", 1)   #=> "   1.00000"
  # p sprintf("%10.5f", 10)  #=> "  10.00000"
  # //}
  # 
  # 浮動小数点数の指示子
  # (e, E, g, G)
  # に対しては有効桁数を意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5e", 1)   #=> "1.00000e+00"
  # p sprintf("%10.5e", 10)  #=> "1.00000e+01"
  # p sprintf("%10.5g",  10)  #=> "        10"
  # p sprintf("%#10.5G", 10)  #=> "    10.000"
  # //}
  # 
  # 文字列の指示子(s, p)
  # に対しては引数の文字列のうち指定した数を超える分を切り捨てます。
  # 幅と精度を同じ値にすれば、どのような引数に対してもその
  # 長さだけの出力を行うことになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.2s", "foo")  #=> "        fo"
  # 
  # p sprintf("%5.5s", "foo")     #=> "  foo"
  # p sprintf("%5.5s", "foobar")  #=> "fooba"
  # //}
  # 
  # 精度として `*' を指定すると精度の値を引数から得ることになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.5s", "foobar")    #=> "fooba"
  # p sprintf("%.*s", 5, "foobar") #=> "fooba"
  # //}
  # 
  # === 指示子
  # 
  # 指示子は引数の型の解釈を示します。指示子を省略することはできません。
  # 指示子には大きく分けて
  # 
  #  * 文字列を表す指示子: c, s, p
  #  * 整数を表す指示子: d, i, u, b, B, o, x, X,
  #  * 浮動小数点数を表す指示子: f, g, e, E, G
  # 
  # があります
  # 
  # : c
  # 
  #  引数の数値(0〜255)を文字コードとみなして対応する文字を出力します。
  #  引数が数値以外のオブジェクトの場合 to_int メソッドによる変換を試みます。
  #  引数として範囲内の一文字の文字列も受けつけます。文字そのものを出力します。
  # //emlist[][ruby]{
  # p sprintf("%c", 97)  #=> "a"
  # p sprintf("%c", 'a') #=> "a"
  # //}
  # 
  #  フラグ `-' と幅 の指定だけが意味を持ちます。
  # 
  # : s
  # 
  #  文字列を出力します。
  # 
  #  引数が [[c:String]] オブジェクトでなければ to_s メソッドにより文字列化
  #  したものを引数として扱います。
  # 
  # : p
  # 
  #  [[m:Object#inspect]] の結果を出力します。
  # //emlist[][ruby]{
  # p sprintf("%s", /e+/)  #=> "(?-mix:e+)"
  # p sprintf("%p", /e+/)  #=> "/e+/"
  # //}
  # 
  # 
  # : d
  # : i
  # 
  #  引数の数値を10進表現の整数として出力します。
  # 
  #  引数が整数でなければ関数 [[m:Kernel.#Integer]] と同じ規則で整数に
  #  変換されます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%d", -1) #=> "-1"
  # p sprintf("%d", 3.1) #=> "3"
  # p sprintf("%d", '0b1010') #=> "10"
  # //}
  # 
  # : u
  # 
  #  引数の数値を符号なし整数とみなして10進表現の整数として出力します。
  # //emlist[][ruby]{
  # p sprintf("%u", '0b1010') #=> "10"
  # p sprintf("%u", -1) #=> "-1"
  # //}
  # 
  # 
  # : b
  # : B
  # : o
  # : x
  # : X
  # 
  #  整数をそれぞれ2進、2進(大文字)、8進、16進、16進(大文字)表現の文字列で出力します。
  # 
  #  `#' フラグを指定すれば "0b", "0B", "0", "0x", "0X" を先頭に付加します。
  # 
  #  `+', ` ' フラグがない場合、負の数には ".." が先頭(`#' フラグがあれば 
  #  "0x" などの後)に付加されます。これは最上位桁の文字が無限に続くことを
  #  意味し、2の補数表現で負の数を表しています。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#b", 10)    #=> "0b1010"
  # p sprintf("%#B", 10)    #=> "0B1010"
  # p sprintf("%#o", 10)    #=> "012"
  # p sprintf("%#x", 10)    #=> "0xa"
  # p sprintf("%#X", 10)    #=> "0XA"
  # 
  # # 負の数に対して ".." が付加されます
  # p sprintf("%#b", -1)    #=> "0b..1"
  # p sprintf("%#o", -1)    #=> "0..7"
  # p sprintf("%#x", -1)    #=> "0x..f"
  # 
  # p sprintf("%10x", -1)   #=> "       ..f"
  # p sprintf("%-10x", -1)  #=> "..f       "
  # 
  # # ruby 1.9.1 以降では「精度」を指定した場合も、".." は付加されます 
  # p sprintf("%.10x", -1) #=> "..ffffffff" 
  # //}
  # 
  # : f
  # : e
  # : E
  # : g
  # : G
  # : a
  # : A
  # 
  #  f は小数点表現(xxx.xxx)で数値を出力します。
  # 
  #  e は指数表現(x.xxxe+xx)で数値を出力します。
  # 
  #  g は 指数が -4 より小さいか精度以上の場合に e と同じ出力を、それ以
  #  外では f と同じ出力を行います。ただし、小数部の末尾の0は取り除かれ
  #  ます。
  # 
  #  a, A は指数表現の16進数("-h.hhh±pd") で数値を出力します。ただし、[[m:Float::INFINITY]]、[[m:Float::NAN]] はそれぞれ 'Inf'、'NaN' になります。詳しくは [[ruby-dev:40650]] を参照してください。
  # 
  # //emlist[][ruby]{
  # p sprintf("%a", -0.0)            # => "-0x0p+0"
  # p sprintf("%a", 729.0/10)        # => "0x1.239999999999ap+6"
  # p sprintf("%a", Float::INFINITY) # => "Inf"
  # //}
  # 
  # 
  #  大文字の指示子(E, G)は出力のアルファベットを大文字にします。
  # //emlist[][ruby]{
  # p sprintf("%f", 1.0) #=> "1.000000"
  # p sprintf("%e", 1.0) #=> "1.000000e+00"
  # p sprintf("%g", 1.0) #=> "1"
  # 
  # p sprintf("%f", 10.1) #=> "10.100000"
  # p sprintf("%e", 10.1) #=> "1.010000e+01"
  # p sprintf("%g", 10.1) #=> "10.1"
  # 
  # p sprintf("%g", 10 ** 6)  #=> "1e+06"
  # p sprintf("%g", 10 ** -5) #=> "1e-05"
  # //}
  #  精度の省略値は 6 です。
  # 
  #  無限大、NaN(Not a Number) に対する出力は以下のとおりです。
  # //emlist[][ruby]{
  # p sprintf("%f",  1.0/0)  #=> "inf"
  # p sprintf("%f", -1.0/0)  #=> "-inf"
  # p sprintf("%f",  0.0/0)  #=> "nan"
  # 
  # p sprintf("%E",  1.0/0)  #=> "INF"
  # p sprintf("%E", -1.0/0)  #=> "-INF"
  # p sprintf("%E",  0.0/0)  #=> "NAN"
  # //}
  #  f, e, E, g, G に関しては [[man:sprintf(3)]] の結果を利用しています。従って出力結果は
  #  実際にはシステムに依存することになります。
  # 
  # === 引数指定
  # 
  # 利用頻度が低いので最後に説明します。
  # 
  # : nth$
  # 
  #  nth 番目の引数のフォーマットを行うことを示します。
  # //emlist[][ruby]{
  # p sprintf("%d, %x, %o", 1, 2, 3) #=> "1, 2, 3"
  # p sprintf("%3$d, %2$x, %1$o", 1, 2, 3) #=> "3, 2, 1"
  # 
  # p sprintf("%1$d, %1$x, %1$o", 10) #=> "10, a, 12"
  # //}
  #  状況によってフォーマットを変えたいが引数の順序を変えたくない場合に使
  #  用します。
  # //emlist[][ruby]{
  # case ENV['LC_TIME']
  # when /^ja_JP/
  #   fmt = "%1$d年%2$d月%3$d日"
  # else
  #   fmt = "%2$02d/%03$2d/%1$02d"
  # end
  # 
  # p sprintf(fmt, 1, 4, 22) #=> "04/22/01"
  # //}
  #  "*" の後に指定することで幅や
  #  精度を引数で指定することもできます。
  # //emlist[][ruby]{
  # p sprintf("%5.2f", 1)              #=> " 1.00"
  # p sprintf("%*.*f", 5, 2, 1)        #=> " 1.00"
  # p sprintf("%1$*2$.*3$f", 1, 5, 2)  #=> " 1.00"
  # //}
  # 
  # : %<name>
  # 
  #  Symbol のインスタンス name をキーとする Hash を引数にした場合、
  #  対応する値をフォーマットして参照します。
  # //emlist[][ruby]{
  # p sprintf('%<foo>f : %<bar>+d', foo: 1, bar: 2) #=> "1.000000 : +2"
  # //}
  # 
  # : %{name}
  # 
  #  Symbol のインスタンス name をキーとする Hash を引数にした場合、
  #  対応する値をフォーマットせずに参照します。
  #  幅や精度を指定するために使用することができます。
  # //emlist[][ruby]{
  # p sprintf('%{foo}f : %{bar}+d', foo: 1, bar: 2) #=> "1f : 2+d"
  # //}
  def format; end

  # --- gets(rs = $/) -> String | nil
  # 
  # [[c:ARGF]]から一行読み込んで、それを返します。
  # 行の区切りは引数 rs で指定した文字列になります。
  # 
  # rs に nil を指定すると行区切りなしとみなしてファイルの内容を
  # すべて読み込みます。ARGVに複数のファイル名が存在する場合は1度に1ファイルずつ読み込みます。
  # 空文字列 "" を指定すると連続する改行を行の区切りとみなします
  # (パラグラフモード)。
  # 
  # 読み込んだ文字列は組み込み変数 [[m:$_]] にもセットされます。
  # 
  # @param rs 行の区切りとなる文字列です。
  # @return ファイルの終り(EOF)に到達した時、 nil を返します。
  # @raise Errno::EXXX 読み込みに失敗した場合に発生します。
  # 
  # //emlist[main.rb][ruby]{
  # ARGV << 'b.txt' << 'c.txt'
  # p gets #=> "hello\n"
  # p gets(nil) #=> "it\ncommon\n"
  # p gets("") #=> "ARGF\n\n"
  # p gets('、') #=> "スクリプトに指定した引数 (Object::ARGV を参照) をファイル名と\nみなして、"
  # p gets #=> "それらのファイルを連結した 1 つの仮想ファイルを表すオブジェクトです。 \n"
  # p gets #=> nil
  # p readline # end of file reached (EOFError)
  # //}
  # 
  # //emlist[b.txt][ruby]{
  # hello
  # it
  # common
  # //}
  # 
  # //emlist[b.txt][ruby]{
  # ARGF
  # # スクリプトに指定した引数 (Object::ARGV を参照) をファイル名と
  # # みなして、それらのファイルを連結した 1 つの仮想ファイルを表すオブジェクトです。
  # //}
  # 
  # 
  # @see [[m:$/]],[[c:ARGF]],[[m:Kernel.#readlines]],[[m:Kernel.#readline]]
  def gets; end

  # --- global_variables -> [Symbol]
  # 
  # プログラム中で定義されているグローバル変数(`$'で始まる変数)名の
  # 配列を返します。
  # 
  # //emlist[例][ruby]{
  # p global_variables #=> [:$;, :$-F, :$@, ... ]
  # //}
  # 
  # @see [[m:Kernel.#local_variables]],[[m:Object#instance_variables]],[[m:Module.constants]],[[m:Module#constants]],[[m:Module#class_variables]]
  def global_variables; end

  # --- gsub(pattern, replace)          -> String
  # --- gsub(pattern) {|matched| ... }  -> String
  # --- gsub(pattern)                   -> Enumerator
  # 
  # $_.gsub とほぼ同じですが、置換が発生したときは、$_の内容を置き換える点が異なります。
  # コマンドラインオプションで -p または -n を指定した時のみ定義されます。
  # 
  # 暗号的になりすぎるきらいがあるため、このメソッドの使用は推奨されていません。
  # 今後はより明示的な $_.gsub を使ってください。
  # 
  # $_.gsub とこのメソッド gsub は以下の点で違いがあります。
  # 
  #   * gsub は $_ の値をコピーして、コピーの方を更新し、
  #   $_ に再代入します。
  # 
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # 
  # //emlist[例][ruby]{
  # $_                # => "test\n"
  # gsub(/es/, '!!')  # => "t!!t\n"
  # //}
  # 
  # @see [[m:String#gsub]],[[m:$_]]
  def gsub; end

  # --- proc { ... } -> Proc
  # --- lambda { ... } -> Proc
  # 
  # 与えられたブロックから手続きオブジェクト ([[c:Proc]] のインスタンス)
  # を生成して返します。[[m:Proc.new]] に近い働きをします。
  # 
  # 
  # また、lambda に & 引数を渡すのは推奨されません。& 引数ではなくてブロック記法で記述する必要があります。
  # 
  # & 引数を渡した lambda は Warning[:deprecated] = true のときに警告メッセージ
  # 「warning: lambda without a literal block is deprecated; use the proc without lambda instead」
  # を出力します。
  # 
  # @raise ArgumentError ブロックを省略した呼び出しを行ったときに発生します。
  # 
  # //emlist[例][ruby]{
  # def foo &block
  #   proc(&block)
  # end
  # 
  # it = foo{p 12}
  # it.call #=> 12
  # //}
  # 
  # @see [[c:Proc]],[[m:Proc.new]]
  # 
  # ===[a:should_use_next] 手続きを中断して値を返す
  # 
  # 手続きオブジェクトを中断して、呼出し元(呼び出しブロックでは yield、それ以外では [[m:Proc#call]])
  # へジャンプし値を返すには next を使います。break や return ではありません。
  # 
  # 
  # //emlist[例][ruby]{
  # def foo
  #   f = Proc.new{
  #     next 1
  #     2
  #   }
  # end
  # 
  # p foo().call       #=> 1
  # //}
  # 
  # ===[a:block] Proc オブジェクトをブロック付きメソッド呼び出しに使う
  # 
  # ブロック付きメソッドに対して Proc オブジェクトを `&' を指定して渡すと
  # 呼び出しブロックのように動作します。
  # しかし、厳密には以下の違いがあります。
  # これらは、Proc オブジェクトが呼び出しブロックとして振舞う際の制限です。
  # 
  # //emlist[問題なし][ruby]{
  # (1..5).each { break }
  # //}
  # 
  # //emlist[LocalJumpError が発生します。][ruby]{
  # pr = Proc.new { break }
  # (1..5).each(&pr)
  # //}
  # 
  # 
  # ===[a:lambda_proc] lambda と proc と Proc.new とイテレータの違い
  # 
  # [[m:Kernel.#lambda]] と [[m:Proc.new]] はどちらも [[c:Proc]] クラスのインスタンス(手続きオブジェクト)を生成しますが、
  # 生成された手続きオブジェクトはいくつかの場面で挙動が異なります。 lambda の生成する手続きオブジェクトのほうが
  # よりメソッドに近い働きをするように設計されています。
  # 
  # [[m:Kernel.#proc]] は Proc.new と同じになります。
  # 引数に & を付けることで手続きオブジェクト化したブロックは、Proc.new で生成されたそれと
  # 同じにように振る舞います。
  # 
  # ==== 引数の扱い
  # 
  # lambda のほうがより厳密です。引数の数が違っていると（メソッドのように）エラーになります。
  # Proc.new は引数を多重代入に近い扱い方をします。
  # 
  # //emlist[例][ruby]{
  # b1 = Proc.new{|a,b,c|
  #   p a,b,c
  # }
  # b1.call(2, 4)
  # #=> 2
  #     4
  #     nil
  # 
  # b2 = lambda{|a,b,c|
  #   p a,b,c
  # }
  # b2.call(2, 4)
  # # => wrong number of arguments (given 2, expected 3)
  # //}
  # 
  # [[ref:d:spec/call#block_arg]] も参照してください。
  # 
  # ==== ジャンプ構文の挙動の違い
  # 
  # return と break は、lambda と Proc.new では挙動が異なります。
  # 例えば return を行った場合、lambda では手続きオブジェクト自身を抜けますが、
  # Proc.new では手続きオブジェクトを囲むメソッドを抜けます。
  # 
  # //emlist[例][ruby]{
  # def foo
  #  f = Proc.new { return :foo }
  #  f.call 
  #  return 
  # end
  # 
  # def bar
  #  f = lambda { return :bar }
  #  f.call 
  #  return 
  # end
  # 
  # def h
  #  yield
  # end
  # 
  # def hoge
  #  h{ return :hoge }
  #  nil
  # end
  # 
  # p foo()  #=> :foo
  # p bar()  #=> nil
  # p hoge() #=> :hoge
  # //}
  # 
  # 以下の表は、手続きオブジェクトの実行を上の例と同じように、手続きオブジェクトが定義されたのと
  # 同じメソッド内で行った場合の結果です。
  # 
  #                  return                          next                        break
  #   Proc.new   メソッドを抜ける            手続きオブジェクトを抜ける   例外が発生する
  #   proc       メソッドを抜ける            手続きオブジェクトを抜ける   例外が発生する
  #   lambda     手続きオブジェクトを抜ける  手続きオブジェクトを抜ける   手続きオブジェクトを抜ける
  #   イテレータ メソッドを抜ける            手続きオブジェクトを抜ける   メソッドを抜ける
  # 
  # 
  # 
  # ===[a:orphan] orphan な手続きオブジェクトの挙動
  # 
  # Proc を生成したメソッドから脱出した後、手続きオブジェクトからの
  # return, break
  # は例外 [[c:LocalJumpError]] を発生させます。
  # ただし、上でも説明した通り lambda で生成した手続きオブジェクトはメソッドと同じように振る舞う
  # ことを意図されているため、例外 [[c:LocalJumpError]] は発生しません。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   Proc.new { return }
  # end
  # 
  # foo.call
  # # => in `call': return from proc-closure (LocalJumpError)
  # //}
  # 
  # 以下の表は、手続きオブジェクトの実行を上の例と同じように、手続きオブジェクトが定義されたメソッドを
  # 脱出してから行った場合の結果です。
  # 
  #                  return                          next                        break
  #   Proc.new   例外が発生する              手続きオブジェクトを抜ける   例外が発生する
  #   proc       例外が発生する              手続きオブジェクトを抜ける   例外が発生する
  #   lambda     手続きオブジェクトを抜ける  手続きオブジェクトを抜ける   手続きオブジェクトを抜ける
  def lambda; end

  # --- load(file, priv = false) -> true
  # 
  # Ruby プログラム file をロードして実行します。再ロード可能です。
  # 
  # file が絶対パスのときは file からロードします。
  # file が相対パスのときは組み込み変数 [[m:$:]]
  # に示されるパスとカレントディレクトリを順番に探し、最初に見付かったファイルを
  # ロードします。このとき、[[m:$:]] の要素文字列の先頭文字が
  # `~' (チルダ) だと、環境変数 HOME の値に展開されます。
  # また `~USER' はそのユーザのホームディレクトリに展開されます。
  # 
  # ロードに成功した場合は true を返します。
  # 
  # @param file ファイル名の文字列です。
  # @param priv 真のとき、ロード・実行は内部的に生成される
  #             無名モジュールをトップレベルとして行われ、
  #             グローバルな名前空間を汚染しません。
  # @raise LoadError ロードに失敗した場合に発生します。
  # @see [[m:Kernel.#require]]
  # 
  # === require と load の違い
  # 
  # [[m:Kernel.#require]] は同じファイルは一度だけしかロードしませんが、
  # [[m:Kernel.#load]] は無条件にロードします。
  # また、require は拡張子.rb や .so を自動的に補完しますが、
  # load は行いません。
  # require はライブラリのロード、load は
  # 設定ファイルの読み込みなどに使うのが典型的な用途です。
  # 
  # //emlist[例][ruby]{
  # load "#{ENV['HOME']}/.myapprc"
  # load "/etc/myapprc"
  # //}
  # 
  # なお、特定のディレクトリからファイルをロードしたい場合、
  # load 'filename' とするのは不適切です。必ず絶対パスを
  # 使ってください。
  def load; end

  # --- local_variables -> [Symbol]
  # 
  # 現在のスコープで定義されているローカル変数名の配列を返します。
  # 
  # //emlist[例][ruby]{
  # yuyu = 0
  # p local_variables #=> [:yuyu]
  # //}
  # 
  # @see [[m:Kernel.#global_variables]],[[m:Object#instance_variables]],[[m:Module.constants]],[[m:Module#constants]],[[m:Module#class_variables]]
  def local_variables; end

  # --- loop         -> Enumerator
  # --- loop { ... } -> object | nil
  # (中断されない限り)永遠にブロックの評価を繰り返します。
  # ブロックが指定されなければ、代わりに [[c:Enumerator]] を返します。
  # 
  # //emlist[例][ruby]{
  # loop do
  #   print "Input: "
  #   line = gets
  #   break if !line or line =~ /^qQ/
  #   # ...
  # end
  # //}
  # 
  # 与えられたブロック内で [[c:StopIteration]] を [[m:Kernel.#raise]] すると
  # ループを終了して [[c:Enumerator]] が最後に返した値を返します。
  # ループを終了させる場合、通常は break を使用してください。
  # 
  # //emlist[例][ruby]{
  # enum = Enumerator.new { |y|
  #   y << "one"
  #   y << "two"
  #   :ok
  # }
  # 
  # result = loop {
  #   puts enum.next
  # } # => :ok
  # //}
  # 
  # 
  # @return break の引数など、ループ脱出時の値を返します。
  def loop; end

  # --- open(file, mode_enc = "r", perm = 0666) -> IO
  # --- open(file, mode_enc = "r", perm = 0666) {|io| ... } -> object
  # 
  # file をオープンして、[[c:IO]]（[[c:File]]を含む）クラスのインスタンスを返します。
  # 
  # ブロックが与えられた場合、指定されたファイルをオープンし、
  # 生成した [[c:IO]] オブジェクトを引数としてブロックを実行します。
  # ブロックの終了時や例外によりブロックを脱出するとき、
  # ファイルをクローズします。ブロックを評価した結果を返します。
  # 
  # ファイル名 file が `|' で始まる時には続く文字列をコマンドとして起動し、
  # コマンドの標準入出力に対してパイプラインを生成します
  # 
  # ファイル名が "|-" である時、open は Ruby の子プロセス
  # を生成し、その子プロセスとの間のパイプ([[c:IO]]オブジェクト)を返し
  # ます。(このときの動作は、[[m:IO.popen]] と同じです。
  # [[m:File.open]] にはパイプラインを生成する機能はありません)。
  # 
  # Perlと異なりコマンドは常に `|' で始まります。
  # 
  # @param file ファイルを文字列で指定します。整数を指定した場合はファイルディスクリプタとして扱います。
  # @param mode_enc モード・エンコーディングを文字列か定数の論理和で指定します。後述。
  # @param perm [[man:open(2)]] の第 3 引数のように、ファイルを生成する場合の
  #   ファイルのパーミッションを整数で指定します。
  # @raise Errno::EXXX ファイルのオープンに失敗した場合に発生します。
  # 
  # 
  # @see [[m:File.open]],[[m:IO.popen]],[[m:IO.open]]
  # 
  # === 第二引数のオープンモード・エンコーディング
  # 文字列("mode" か "mode:ext_enc" か "mode:ext_enc:int_enc" という形式)か
  # 整数([[c:File::Constants]] モジュールの定数の論理和)を組み合わせて指定します。
  # 
  # mode は以下の三つのうちのいずれかです。
  # 
  # : "r", RDONLY
  #     ファイルを読み込みモードでオープンします。（デフォルトのモード）
  # 
  # : "w", WRONLY|CREAT|TRUNC
  #     ファイルを書き込みモードでオープンします。
  #     オープン時にファイルがすでに存在していれば
  #     その内容を空にします。
  # 
  # : "a", WRONLY|CREAT|APPEND
  #     ファイルを書き込みモードでオープンします。
  #     出力は 常に ファイルの末尾に追加されます。
  #     例えば、ファイルオープン中にファイルのサイズが小さ
  #     くなってもその末尾に出力されます。
  # 
  # 以上の3つの後に "+" があれば、ファイルは読み書き両用モード (RDWR)
  # でオープンされます。
  # 
  # : "r+"
  #     ファイルの読み書き位置は先頭にセットされます。
  # 
  # : "w+"
  #     "r+" と同じですが、オープン時にファイルがすでに
  #     存在していればその内容を空にします。
  # 
  # : "a+"
  #     "r+"と同様、ファイルの読み込み位置は先頭にセットされますが、
  #     書き込みは常にファイル末尾に行われます。書き込みは
  #     [[m:IO#seek]] などの影響を受けません。
  # 
  # これらのいずれに対しても "b" フラグを ("r+b"のように) つけることがで
  # きます (整数なら File::BINARY )。この場合、バイナリモードでオープン
  # します (ただし、DOS/Windowsのようにシステムがテキスト／バイナリでファイルを区別する場
  # 合に限ります)
  # 
  # "w" に対しては "x" フラグを ("wx"や"wb+x"のように) つけることが
  # できます (整数なら File::EXCL)。
  # この場合、ファイルがすでに存在すると Errno::EEXIST が発生します。
  # ただし、全ての種類のストリームでサポートされているとは限りません (例えばパイプ)。
  # 
  # === Universal Newline
  # 改行をLFに揃えます。一言で言えばPEP:278 [[url:https://www.python.org/dev/peps/pep-0278/]]のことです。
  # 
  # : "rt"
  #     CR、LF、CRLFのいずれをもLFとして読み込む。
  # : "rb"
  #     CR、LF、CRLFはいずれもそのまま読み込まれる。
  # : "r"
  #     "rt"と"rb"のどちらの扱いになるかはプラットフォーム依存。
  #     (Unix系ならばなら"rb"、mswinやmingwなら"rt"扱いとなる)
  # : "wb"
  #     LFはそのままLFとして書き込まれる。
  # : "wt" または "w"
  #     LFはLFのままか、CR+LFか、どちらかになる。どちらになるかはプラットフォーム依存。
  #     (Unix系ならばLFのまま、mswinやmingwならばCRLFとなる)
  # 
  # なお、以上のCR、LF、CRLFは入力のエンコーディングを解釈した後に処理されます。例えば、UTF-16LEでは、LFはバイト列"\x0a\x00"のことになります。
  # 
  # === エンコーディングの指定
  # ext_enc(外部エンコーディング)が指定されている場合、
  # 読み込まれた文字列にはこのエンコーディングが指定され、
  # 出力する文字列はそのエンコーディングに変換されます。
  # 
  # ext_encが'BOM|'で始まる場合、その入力に含まれるBOMはあらかじめ削られます。
  # また、BOMがあった場合、入力された文字列にはそのBOMに対応するエンコーディングが設定されます。
  # //emlist[BOMでUTF-16BEかLEかを判別する例][ruby]{
  # File.open("utf16.txt", "rb:BOM|utf-16"){|file| "..." }
  # //}
  # 
  # int_encも指定されていた場合、入力された文字列をext_encでエンコーディングされた文字列とみなしてint_encへと変換し、その結果にint_encを設定して返します。
  def open; end

  # --- p(*arg) -> object | Array
  # 
  # 引数を人間に読みやすい形に整形して改行と順番に標準出力 [[m:$stdout]] に出力します。主にデバッグに使用します。
  # 
  # 引数の inspect メソッドの返り値と改行を順番に出力します。つまり以下のコードと同じです。
  # 
  # //emlist[例][ruby]{
  # print arg[0].inspect, "\n", arg[1].inspect, "\n" #, ...
  # //}
  # 
  # 整形に用いられる[[m:Object#inspect]]は普通に文字列に変換すると
  # 区別がつかなくなるようなクラス間の差異も表現できるように工夫されています。
  # 
  # p に引数を与えずに呼び出した場合は特に何もしません。
  # 
  # @param arg 出力するオブジェクトを任意個指定します。
  # @raise IOError 標準出力が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # @return 指定された引数 arg を返します。複数の引数が指定された場合はそれらを要素とする配列を返します。
  # 
  # //emlist[例][ruby]{
  # puts "" #=> （空行）
  # p "" #=> ""
  # 
  # puts 50,"50"
  # #=> 50
  # #=> 50
  # p 50,"50"
  # #=> 50
  # #=> "50"
  # //}
  # 
  # @see [[m:Object#inspect]],[[m:Kernel.#puts]],[[m:Kernel.#print]]
  def p; end

  # --- pp(*obj)    -> object
  # 
  # 指定されたオブジェクト obj を標準出力に見やすい形式(プリティプリント)で出力します。
  # obj それぞれを引数として [[m:PP.pp]] を呼ぶことと同等です。
  # 
  # 初回呼び出し時に自動的に [[lib:pp]] を require します。
  # 
  # @param obj 表示したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'pp'
  # 
  # b = [1, 2, 3] * 4
  # a = [b, b]
  # a << a
  # pp a
  # 
  # #=> [[1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
  # #    [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
  # #    [...]]
  # //}
  # 
  # @see [[m:PP.pp]]
  def pp; end

  # --- print(*arg) -> nil
  # 
  # 引数を順に標準出力 [[m:$stdout]] に出力します。引数が与えられない時には変数
  # [[m:$_]] の値を出力します。
  # 
  # 文字列以外のオブジェクトが引数として与えられた場合には、
  # to_s メソッドにより文字列に変換してから出力します。
  # 
  # 変数 [[m:$,]] (出力フィールドセパレータ)に nil で
  # ない値がセットされている時には、各引数の間にその文字列を出力します。
  # 変数 [[m:$\]] (出力レコードセパレータ)に nil でな
  # い値がセットされている時には、最後にそれを出力します。
  # 
  # @param arg 出力するオブジェクトを任意個指定します。
  # @raise IOError 標準出力が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # print "Hello, world!"
  # print "Regexp is",/ant/
  # print nil
  # print "\n"
  # #=> Hello, world!Regexp is(?-mix:ant)
  # 
  # $_ = "input"
  # $, = "<and>"
  # $\ = "<end>\n"
  # print
  # print "AA","BB"
  # #=> input<end>
  # #=> AA<and>BB<end>
  # //}
  # 
  # @see [[m:Kernel.#puts]],[[m:Kernel.#p]],[[m:IO#print]]
  def print; end

  # --- printf(format, *arg) -> nil
  # --- printf(port, format, *arg) -> nil
  # 
  # C 言語の printf と同じように、format に従い引数を文字列に変
  # 換して port に出力します。
  # 
  # port を省略した場合は標準出力 [[m:$stdout]] に出力します。
  # 
  # 引数を 1 つも指定しなければ何もしません。
  # 
  # Ruby における format 文字列の拡張については
  # [[m:Kernel.#sprintf]]の項を参照してください。
  # 
  # @param port 出力先になる[[c:IO]] のサブクラスのインスタンスです。
  # @param format フォーマット文字列です。
  # @param arg フォーマットされる引数です。
  # @raise ArgumentError port を指定したのに format を省略した場合に発生します。
  # @raise IOError port が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # printf("calculate%3s%-6s%.15f", 'PI', '...', Math::PI)
  # #=> calculate PI...   3.141592653589793
  # 
  # printf("%d %04x", 123, 123)               #=> "123 007b"
  # printf("%08b '%4s'", 123, 123)            #=> "01111011 ' 123'"
  # printf("%1$*2$s %2$d %1$s", "hello", 8)   #=> "   hello 8 hello"
  # printf("%1$*2$s %2$d", "hello", -8)       #=> "hello    -8"
  # printf("%+g:% g:%-g", 1.23, 1.23, 1.23)   #=> "+1.23: 1.23:1.23"
  # printf("%u", -123)                        #=> "..4294967173"
  # //}
  # 
  # @see [[m:Kernel.#sprintf]],[[m:IO#printf]]
  def printf; end

  # --- putc(ch) -> object
  # 
  # 文字 ch を 標準出力 [[m:$stdout]] に出力します。
  # 
  # ch が数値なら 0 〜 255 の範囲の対応する文字を出力します。
  # ch が文字列なら、その先頭1文字を出力します。
  # どちらでもない場合は、ch.to_int で整数に変換を試みます。
  # 
  # @param ch 出力する文字です。数または文字列で指定します。
  # @return ch を返します
  # @raise RangeError [[c:Bignum]] を引数にした場合に発生します。
  # @raise IOError 標準出力が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # @raise TypeError [[c:Integer]] に変換できないオブジェクトを引数に
  #                  指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # putc("ch")
  # putc(?c)
  # putc(99)
  # putc(355)
  # #=> cccc
  # 
  # putc(99.00) #=> c
  # putc(33333333333333333333333333333333333) # bignum too big to convert into `long' (RangeError)
  # //}
  # 
  # @see [[m:IO#putc]]
  def putc; end

  # --- puts(*arg) -> nil
  # 
  # 引数と改行を順番に 標準出力 [[m:$stdout]] に出力します。
  # 引数がなければ改行のみを出力します。
  # 
  # 引数が配列の場合、その要素と改行を順に出力します。
  # 配列や文字列以外のオブジェクトが引数として与えられた場合には、
  # 当該オブジェクトを最初に to_ary により配列へ、
  # 次に to_s メソッドにより文字列へ変換を試みます。
  # 末尾が改行で終っている引数や配列の要素に対しては puts 自身
  # は改行を出力しません。
  # 
  # @param arg 出力するオブジェクトを任意個指定します。
  # @raise IOError 標準出力が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # puts "foo", "bar\n", "baz"
  # puts ""    # 改行のみ出力
  # puts       # 改行のみ出力
  # puts nil   # 改行のみ出力
  # puts ["oui", "non"]
  # #=> foo
  # #   bar
  # #   baz
  # #
  # #
  # #
  # #   oui
  # #   non
  # //}
  # 
  # @see [[m:Kernel.#print]], [[m:Kernel.#p]], [[m:IO#puts]]
  def puts; end

  # --- rand(max = 0) -> Integer | Float
  # --- rand(range) -> Integer | Float | nil
  # 
  # 擬似乱数を発生させます。
  # 
  # 最初の形式では
  # max が 0 の場合は 0.0 以上 1.0 未満の実数を、正の整数の場合は 0 以上 max 未満の整数を返します。
  # それ以外の値を指定した場合は max.to_int の絶対値が指定されたものとして扱います。
  # 
  # 二番目の形式では range で指定された範囲の値を返します。
  # range の始端と終端が共に整数の場合は整数を、少なくとも片方が実数の場合は実数を返します。
  # range に含まれる数が無い場合は nil を返します。
  # 
  # まだ [[m:Kernel.#srand]] が呼ばれていなければ自動的に呼び出します。
  # 
  # 擬似乱数生成器として [[c:Random]] クラスオブジェクトを使用します。
  # 
  # @param max   乱数値の上限を正の整数で指定します。
  #              max 自体は乱数値の範囲に含まれません。
  #              0 を指定すると実数値の乱数を返します。
  # @param range 発生させる乱数値の範囲を [[c:Range]] オブジェクトで指定します。
  #              range の境界は数値でなければなりません。
  # 
  # //emlist[例][ruby]{
  # srand(1234)     # 乱数の種を設定する。
  # rand            #=> 0.1915194503788923
  # rand            #=> 0.6221087710398319
  # rand(10)        #=> 4
  # rand(5.5)       #=> 0
  #                 # rand(5) と同じ。 5 が乱数値の範囲に含まれないことに注意。
  # 
  # rand(1..6)      #=> 2                   (1 から 6 までの整数)
  # rand(0...10)    #=> 1                   (0 から 9 までの整数。終端を含まない)
  # rand(1.0..1.5)  #=> 1.1362963047752432  (1.0 以上 1.5 以下の実数)
  # rand(1.0...1.5) #=> 1.1382321275715483  (1.0 以上 1.5 未満の実数)
  # rand(1..0)      #=> nil
  # //}
  # 
  # @see [[m:Kernel.#srand]], [[m:Random#rand]], [[c:Random]]
  def rand; end

  # --- readline(rs = $/) -> String
  # 
  # [[c:ARGF]]から一行読み込んで、それを返します。
  # 行の区切りは引数 rs で指定した文字列になります。
  # 
  # rs に nil を指定すると行区切りなしとみなしてファイルの内容を
  # すべて読み込みます。ARGVに複数のファイル名が存在する場合は1度に1ファイルずつ読み込みます。
  # 空文字列 "" を指定すると連続する改行を行の区切りとみなします
  # (パラグラフモード)。
  # 
  # 読み込んだ文字列は組み込み変数 [[m:$_]] にもセットされます。
  # 
  # @param rs 行の区切りとなる文字列です。
  # @raise Errno::EXXX 読み込みに失敗した場合に発生します。
  # @raise EOFError readline でファイル末端(EOF)を検出すると発生します。
  # 
  # //emlist[例][ruby]{
  # # ---main.rb---
  # ARGV << 'b.txt' << 'c.txt'
  # p readline #=> "hello\n"
  # p readline(nil) #=> "it\ncommon\n"
  # p readline("") #=> "ARGF\n\n"
  # p readline('、') #=> "スクリプトに指定した引数 (Object::ARGV を参照) をファイル名と\nみなして、"
  # p readline #=> "それらのファイルを連結した 1 つの仮想ファイルを表すオブジェクトです。 \n"
  # p readline # end of file reached (EOFError)
  # # --- b.txt ---
  # hello
  # it
  # common
  # # --- c.txt ---
  # ARGF
  # # スクリプトに指定した引数 (Object::ARGV を参照) をファイル名と
  # # みなして、それらのファイルを連結した 1 つの仮想ファイルを表すオブジェクトです。
  # //}
  # 
  # 
  # @see [[m:$/]],[[c:ARGF]],[[m:Kernel.#readlines]],[[m:Kernel.#gets]]
  def readline; end

  # --- readlines(rs = $/) -> [String]
  # 
  # [[c:ARGF]]を [[m:Kernel.#gets]](rs) でEOFまで読み込んで、その各行を要素としてもつ配列を返します。
  # 行の区切りは引数 rs で指定した文字列になります。
  # 
  # rs に nil を指定すると行区切りなしとみなします。
  # 空文字列 "" を指定すると連続する改行を行の区切りとみなします
  # (パラグラフモード)。
  # 
  # @param rs 行の区切りとなる文字列です。
  # @raise Errno::EXXX 読み込みに失敗した場合に発生します。
  # 
  # //emlist[main.rb][ruby]{
  # ARGV << 'b.txt' << 'b.txt'
  # p readlines       #=> ["hello\n", "it\n", "\n", "common\n", "hello\n", "it\n", "\n", "common\n"]
  # 
  # ARGV << 'b.txt' << 'b.txt'
  # p readlines(nil)  #=> ["hello\nit\n\ncommon\n", "hello\nit\n\ncommon\n"]
  # 
  # ARGV << 'b.txt' << 'b.txt'
  # p readlines("")   #=> ["hello\nit\n\n", "common\n", "hello\nit\n\n", "common\n"]
  # 
  # ARGV << 'b.txt' << 'b.txt'
  # p readlines('it') #=> ["hello\nit", "\n\ncommon\n", "hello\nit", "\n\ncommon\n"]
  # p readlines       #=> []
  # //}
  # 
  # //emlist[b.txt][ruby]{
  # hello
  # it
  # 
  # common
  # //}
  # 
  # @see [[m:$/]],[[c:ARGF]],[[m:Kernel.#gets]], [[m:Kernel.#readline]]
  def readlines; end

  # --- require(feature) -> bool
  # 
  # Ruby ライブラリ feature をロードします。拡張子補完を行い、
  # 同じファイルの複数回ロードはしません。
  # 
  # feature が絶対パスのときは feature からロードします。
  # feature が相対パスのときは組み込み変数 [[m:$:]]
  # に示されるパスを順番に探し、最初に見付かったファイルを
  # ロードします。このとき、$: の要素文字列の先頭文字が
  # `~' (チルダ) だと、環境変数 HOME の値に展開されます。
  # また `~USER' はそのユーザのホームディレクトリに展開されます。
  # 
  # Ruby ライブラリとは Ruby スクリプト (*.rb) か拡張ライブラリ
  # (*.so,*.o,*.dll など) であり、feature の拡張子が省略された場合はその
  # 両方から探します( *.rb が優先されます)。
  # 省略されなかった場合は指定された種別のみを探します。
  # また、feature の拡張子にはアーキテクチャで実際に使われる拡張子に
  # 関らず拡張ライブラリの拡張子として常に .so を用いることができます（内部で適切に変換されます）。
  # 
  # ライブラリのロードに成功した時には true を返し、ロードした feature の名前を(拡
  # 張子も含めて) 変数 [[m:$"]] に追加します。ただし、feature の名前が既に $"
  # に含まれていた場合はロードせずに false を返します。
  # 
  # @param feature ファイル名の文字列です。
  # @raise LoadError ロードに失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # $LOADED_FEATURES.grep(/prime/).size # => 0
  # require "prime"       # => true
  # $LOADED_FEATURES.grep(/prime/).size # => 1
  # require "prime"       # => false
  # begin
  #   require "invalid"
  # rescue LoadError => e
  #   e.message # => "cannot load such file -- invalid"
  # end
  # //}
  # 
  # @see [[m:Kernel.#load]],[[m:Kernel.#autoload]],[[m:Kernel.#require_relative]]
  def require; end

  # --- require_relative(relative_feature) -> bool
  # 現在のファイルからの相対パスで require します。
  # 
  #   require File.expand_path(relative_feature, File.dirname(__FILE__))
  # とほぼ同じです。
  # 
  # [[m:Kernel.#eval]] などで文字列を評価した場合に、そこから
  # require_relative を呼出すと必ず失敗します。
  # 
  # @param relative_feature ファイル名の文字列です。
  # @raise LoadError ロードに失敗した場合に発生します。
  # @see [[m:Kernel.#require]]
  # 
  # === require と load のスコープ
  # 
  # ローカル変数はファイル間では共有されません。ですので、
  # ロードしたライブラリのローカル変数を
  # ロード元のスクリプトから直接取得することはできません。
  # このスコープの扱い方は[[m:Kernel.#load]]でも同様です。
  # 
  # //emlist[例][ruby]{
  # # ---------- some.rb -----------
  # $a = 1
  # @a = 1
  # A = 1
  # a = 1
  # # ---------- end some.rb -------
  # 
  # require 'some'
  # p $a #=> 1
  # p @a #=> 1
  # p A #=> 1
  # p a # undefined local variable or method `a' for #<Object:0x294f9ec @a=1> (NameError)
  # //}
  def require_relative; end

  # --- select(reads, writes = [], excepts = [], timeout = nil) -> [[IO]] | nil
  # 
  # [[m:IO.select]] と同じです。
  # 
  # @param reads [[m:IO.select]] 参照
  # @param writes [[m:IO.select]] 参照
  # @param excepts [[m:IO.select]] 参照
  # @param timeout [[m:IO.select]] 参照
  # 
  # 
  # @see [[m:IO.select]]
  def select; end

  # --- set_trace_func(proc) -> Proc
  # 
  # Ruby インタプリタのイベントをトレースする [[c:Proc]] オブジェクトとして
  # 指定された proc を登録します。 nil を指定するとトレースがオフになります。
  # 
  # Ruby インタプリタがプログラムを実行する過程で、メソッドの呼び出しや
  # 式の評価などのイベントが発生する度に、以下で説明する6個の引数とともに
  # 登録された [[c:Proc]] オブジェクトを実行します。
  # 
  # 標準添付の [[lib:debug]]、[[lib:tracer]]、
  # [[lib:profile]] はこの組み込み関数を利用して実現されています。
  # 
  # === ブロックパラメータの意味
  # 
  # 渡す Proc オブジェクトのパラメータは
  # //emlist[][ruby]{
  # proc{|event, file, line, id, binding, klass| "..." }
  # //}
  # で、意味は以下の通りです。
  # 
  # : event
  #  実行のタイプを表す、以下のいずれかの文字列。
  # //emlist{
  #   "line":      式の評価。
  #   "call":      メソッドの呼び出し。
  #   "return":    メソッド呼び出しからのリターン。
  #   "c-call":    Cで記述されたメソッドの呼び出し。
  #   "c-return":  Cで記述されたメソッド呼び出しからのリターン。
  #   "class":     クラス定義、特異クラス定義、モジュール定義への突入。
  #   "end":       クラス定義、特異クラス定義、モジュール定義の終了。
  #   "raise":     例外の発生。
  # //}
  # : file
  #  実行中のプログラムのソースファイル名 (文字列)。
  # 
  # : line
  #  実行中のプログラムのソースファイル上の行番号 (整数)。
  # 
  # : id
  #  event に応じ、以下のものが渡されます。
  #  第六ブロック引数の klass と対応しています。
  # //emlist{
  #     line
  #         最後に呼び出されたメソッドを表す Symbol オブジェクト。
  #         トップレベルでは nil。
  #     call/return/c-call/c-return
  #         呼び出された/リターンするメソッドを表す Symbol オブジェクト。
  #     class/end
  #         nil。
  #     raise
  #         最後に呼び出されたメソッドを表す Symbol オブジェクト。
  #         トップレベルでは nil。
  # //}
  # : binding
  #  実行中のプログラムのコンテキストを表す [[c:Binding]] オブジェクト。
  # 
  # : klass
  #  event に応じ、以下のものが渡されます。
  #  第四ブロック引数の id と対応しています。
  # //emlist{
  #     line
  #         最後に呼び出されたメソッドが属するクラスを表す
  #         Class オブジェクト。トップレベルでは nil。
  #     call/return/c-call/c-return
  #         呼び出された/リターンするメソッドが属するクラス
  #         を表す Class オブジェクト。
  #     class/end
  #         nil。
  #     raise
  #         最後に呼び出されたメソッドが属するクラスを表す
  #         Class オブジェクト。トップレベルでは nil。
  # //}
  # @param proc トレース用 [[c:Proc]] オブジェクトを指定します。nil を指定した場合、トレースをオフにします。
  # 
  # @return proc を返します。
  # 
  # //emlist[例][ruby]{
  # set_trace_func lambda {|*arg|
  #   p arg
  # }
  # class Foo
  # end
  # 43.to_s
  # 
  # # ----結果----
  # # ["c-return", "..", 1, :set_trace_func, #<Binding:0xf6ceb8>, Kernel]
  # # ["line", "..", 4, nil, #<Binding:0x10cbcd8>, nil]
  # # ["c-call", "..", 4, :inherited, #<Binding:0x10cba98>, Class]
  # # ["c-return", "..", 4, :inherited, #<Binding:0x10cb858>, Class]
  # # ["class", "..", 4, nil, #<Binding:0x10cb600>, nil]
  # # ["end", "..", 5, nil, #<Binding:0x10cb3f0>, nil]
  # # ["line", "..", 6, nil, #<Binding:0x10cb1e0>, nil]
  # # ["c-call", "..", 6, :to_s, #<Binding:0x10cafd0>, Fixnum]
  # # ["c-return", "..", 6, :to_s, #<Binding:0x10cad78>, Fixnum]
  # //}
  # 
  # @see [[m:Kernel.#caller]]
  def set_trace_func; end

  # --- sleep -> Integer
  # --- sleep(sec) -> Integer
  # 
  # sec 秒だけプログラムの実行を停止します。
  # 
  # sec が省略された場合、他スレッドからの [[m:Thread#run]]
  # などで明示的に起こさない限り永久にスリープします。Thread#runを呼ぶとその時点で
  # sleepの実行が中断されます。
  # 
  # @param sec 停止する秒数を非負の数値で指定します。浮動小数点数も指定できます。
  #            省略された場合、永久にスリープします。
  # 
  # @return 実際に停止していた秒数 (整数に丸められた値) です。
  # 
  # //emlist[例][ruby]{
  # it = Thread.new do
  #   sleep
  #   puts 'it_end'
  # end
  # 
  # re = sleep 2.11
  # puts re
  # it.run
  # re2 = sleep 0.76
  # puts re2
  # #=> 2
  # #   it_end
  # #   1
  # //}
  def sleep; end

  # --- spawn(command, options={}) -> Integer
  # --- spawn(env, command, options={}) -> Integer
  # 
  # 引数を外部コマンドとして実行しますが、生成した
  # 子プロセスの終了を待ち合わせません。生成した子プロセスのプロセスIDを返します。
  # 
  # 
  # === 引数の解釈
  # 
  # この形式では command が shell のメタ文字
  # //emlist{
  #   * ? {} [] <> () ~ & | \ $ ; ' ` " \n
  # //}
  # を含む場合、shell 経由で実行されます。
  # そうでなければインタプリタから直接実行されます。
  # 
  # 
  # @param command コマンドを文字列で指定します。
  # @param env 更新する環境変数を表す Hash
  # @param options オプションパラメータ Hash
  # @raise Errno::EXXX 起動に失敗し、ruby インタプリタに制御が戻った場合に発生します。
  # 
  # @raise Errno::EXXX コマンドが実行できなかった場合に発生します。
  # 
  # 
  # @see [[m:Kernel.#system]],[[m:Kernel.#exec]]
  # 
  # --- spawn(program, *args) -> Integer
  # --- spawn(env, program, *args, options={}) -> Integer
  # 
  # 引数を外部コマンドとして実行しますが、生成した
  # 子プロセスの終了を待ち合わせません。生成した子プロセスのプロセスIDを返します。
  # 
  # env に Hash を渡すことで、[[man:exec(2)]] で子プロセス内で
  # ファイルを実行する前に環境変数を変更することができます。
  # Hash のキーは環境変数名文字列、Hash の値に設定する値とします。
  # nil とすることで環境変数が削除([[man:unsetenv(3)]])されます。
  # //emlist[例][ruby]{
  # # FOO を BAR にして BAZ を削除する
  # pid = spawn({"FOO"=>"BAR", "BAZ"=>nil}, command)
  # //}
  # 
  # 親プロセスは [[m:Process.#waitpid]] で子プロセスの終了を待ち合わせるか
  # もしくは [[m:Process.#detach]] で子プロセスを切り離すかしてください。
  # そうでないとゾンビプロセスが残る場合があります。
  # 
  # === 引数の解釈
  # 
  # この形式で呼び出した場合、空白や shell のメタキャラクタも
  # そのまま program の引数に渡されます。
  # 先頭の引数が2要素の配列であった場合、第1要素の文字列が実際に
  # 起動するプログラムのパスであり、第2要素が「みせかけ」のプロ
  # グラム名になります。
  # また、第1要素はフルパスで指定しなくても環境変数 PATH から探します。
  # 
  # === option引数の概要
  # Hash を options として渡すことで、起動される子プロセスの
  #   * プロセスグループ
  #   * resource limit
  #   * カレントディレクトリ
  #   * umask
  #   * 子プロセスでのリダイレクト
  # などを変更できます。環境変数のクリアなども指定できます。
  # 
  # 以下のオプションが指定できます。
  # 
  # : :unsetenv_others
  #   これを true にすると、envで指定した環境変数以外をすべてクリアします。
  #   false だとクリアしません。false がデフォルトです。
  # 
  # : :pgroup
  #   引数に true or 0 を渡すと新しいプロセスグループを作成し、そこで動きます。
  #   整数を渡すと、指定したプロセスグループに属します。
  #   nil を渡すとプロセスグループを変更しません。デフォルトは nil です。
  # 
  # : :rlimit_core, :rlimit_cpu, etc
  #   resource limit を設定します。詳しくは [[m:Process.#setrlimit]] を見て
  #   ください。引数には整数、もしくは整数2つの配列を渡します。
  # 
  # : :chdir
  #   指定した文字列をカレントディレクトリにします。
  # 
  # : :umask
  #   指定した整数を umask に設定します。
  # 
  # : リダイレクト関連
  # 
  #   Hash のキーに子プロセス側のファイルデスクリプタを、
  #   対応する値に親プロセス側のファイルデスクリプタや
  #   ファイル名を指定することでリダイレクトを実現できます。
  # 
  # : :close_others
  #   これを true に設定すると
  #   リダイレクトされていない、0(stdin), 1(stdout), 2(stderr) 以外の
  #   ファイルデスクリプタをすべて閉じます。
  #   false がデフォルトです。
  # 
  # : :exception
  #   [[m:Kernel.#system]] のみで指定できます。
  #   これを true に設定すると、nil や false を返す代わりに例外が発生します。
  #   false がデフォルトです。
  # 
  # === option引数によるリダイレクトの概要
  # Hash のキー(子プロセス側)には以下のいずれかが指定できます。
  #   * 単一のファイルデスクリプタ
  #   * ファイルデスクリプタの配列
  # 配列を渡すことで複数のファイルデスクリプタを同時にリダイレクトできます。
  # 
  # Hash の値(親プロセス側)には以下のいずれかが指定できます。
  #   * 単一のファイルデスクリプタ
  #   * リダイレクト先のファイル名文字列
  #   * [リダイレクト先のファイル名文字列]、配列の要素にすることで
  #     [[m:File::Constants::RDONLY]] でファイルを開いてリダイレクトします。
  #   * [リダイレクト先のファイル名文字列, モード文字列]
  #     open(ファイル名, モード, 0644) でファイルを開いてリダイレクト
  #     します。
  #   * [リダイレクト先のファイル名文字列, モード文字列, パーミション(整数)]
  #     open(ファイル名, モード, パーミッション) でファイルを
  #     開いてリダイレクトします。
  #   * [:child, ファイルデスクリプタ]
  #     子プロセス側のファイルデスクリプタを指定できます。
  #   * :close キーで指定したファイルデスクリプタを子プロセス側で閉じます
  # 
  # ファイルデスクリプタを表すためには、以下が利用できます。
  #   * :in  標準入力, ファイルデスクリプタ0
  #   * :out 標準出力, ファイルデスクリプタ1
  #   * :err 標準エラー出力, ファイルデスクリプタ2
  #   * 整数 指定した整数が表すファイルデスクリプタ
  #   * [[c:IO]] [[m:IO#fileno]] で表されるファイルデスクリプタ
  # 
  # === option引数の詳細および例
  # 
  # 「:unsetenv_others」を使うと、envで指定したもの以外の環境変数を
  # クリアします。
  # //emlist[][ruby]{
  # # すべての環境変数をクリア
  # pid = spawn(command, :unsetenv_others=>true)
  # # FOO だけ
  # pid = spawn({"FOO"=>"BAR"}, command, :unsetenv_others=>true)
  # //}
  # 
  # 「:pgroup」でプロセスグループを指定できます。
  # //emlist[][ruby]{
  # # true, 0 で新しいプロセスグループを作りそのリーダーになります。
  # pid = spawn(command, :pgroup => true)
  # # 整数を渡すとそのグループに所属します。
  # pid = spawn(command, :pgroup => 10)
  # //}
  # 
  # 「:rlimit_core」「:rlimit_cpu」などで、resource limit を指定します。
  # 詳しくは [[m:Process.#setrlimit]] を見てください。
  # このオプションには 整数 or 整数2つの配列、を渡すことができます。
  # それぞれ [[m:Process.#setrlimit]] の引数が2個、3個の場合に対応します。
  # //emlist[][ruby]{
  # # 現プロセスの core の resource limit を取得
  # cur, max = Process.getrlimit(:CORE)
  # # 一時的に子プロセスの core dump を止める
  # pid = spawn(command, :rlimit_core=>[0,max]) # disable core temporary.
  # # 子プロセスで core dump を出せるようにする
  # pid = spawn(command, :rlimit_core=>max) # enable core dump
  # # 子プロセスで core dump を出せなくする
  # pid = spawn(command, :rlimit_core=>0) # never dump core.
  # //}
  # 
  # 「:chdir」で子プロセスのカレントディレクトリを変更できます。
  # //emlist[][ruby]{
  # pid = spawn(command, :chdir=>"/var/tmp")
  # //}
  # 
  # 「:umask」で子プロセスの umask を指定できます。
  # //emlist[][ruby]{
  # pid = spawn(command, :umask=>077)
  # //}
  # 
  # リダイレクトは様々なやりかたが使えます。
  # Hash のキーが子プロセス側、値が親プロセス側です。
  # //emlist[][ruby]{
  # # 以下の例はすべて stderr を stdout にリダイレクトします
  # pid = spawn(command, :err=>:out)
  # pid = spawn(command, 2=>1)
  # pid = spawn(command, STDERR=>:out)
  # pid = spawn(command, STDERR=>STDOUT)
  # //}
  # この例では子プロセス側の stdout には触れていないので、
  # 親プロセスから引き継がれます。
  # 
  # Hash の値にはファイル名も指定できます。
  # //emlist[][ruby]{
  # pid = spawn(command, :in=>"/dev/null") # read mode
  # pid = spawn(command, :out=>"/dev/null") # write mode
  # pid = spawn(command, :err=>"log") # write mode
  # pid = spawn(command, 3=>"/dev/null") # read mode
  # //}
  # stdout と stderr をリダイレクトした場合は、
  # ファイルは write mode で open されます。それ以外の場合は
  # read mode で open されます。
  # 
  # ファイルのフラグ(write/read mode)やパーミッションを明示したい
  # 場合は、配列を用います。
  # //emlist[][ruby]{
  # # なにも指定がなければデフォルトで read mode が使われる。
  # pid = spawn(command, :in=>["file"])
  # # read mode で file を open し、リダイレクトする。
  # pid = spawn(command, :in=>["file", "r"])
  # # write mode で file を open し、リダイレクトする。
  # # パーミッションはデフォルトで 644。
  # pid = spawn(command, :out=>["log", "w"]) # 0644 assumed
  # # write mode、パーミッション 0600 でファイルをオープンし、リダイレクトする。
  # pid = spawn(command, :out=>["log", "w", 0600])
  # # flagを文字列でなくビットで指定する
  # pid = spawn(command, :out=>["log", File::WRONLY|File::EXCL|File::CREAT, 0600])
  # //}
  # 
  # 配列で複数のファイルデスクリプタを同時にリダイレクトできます。
  # //emlist[][ruby]{
  # # stdout と stderr を "log" ファイルにリダイレクト
  # pid = spawn(command, [:out, :err]=>["log", "w"])
  # //}
  # 
  # 複数のファイルデスクリプタを合わせてリダイレクトするには、
  # [ :child, FileDescriptor ] を使うこともできます。
  # これは子プロセス側で FileDescriptor にリダイレクトすることを意味します。
  # これはファイルデスクリプタを直接指定するのと異なるということに
  # 注意してください。
  # 例えば、
  #   :err => :out
  # とすると、子プロセスの stderr を親プロセスの stdout にリダイレクトします。
  #   :err => [:child, :out]
  # とすると、子プロセスの stderr を子プロセスの stdout にリダイレクトします。
  # これを用いて、[[m:IO.popen]] で、子プロセスの
  # stderr と stdout を混ぜる例を以下に示します。
  # //emlist[][ruby]{
  # io = IO.popen(["sh", "-c", "echo out; echo err >&2", :err=>[:child, :out]])
  # p io.read #=> "out\nerr\n
  # //}
  # 
  # spawn と IO.popen では
  # デフォルトでは非標準的なファイルデスクリプタ(3以降)を閉じません。
  # 「:close_others」オプションでこの挙動を制御できます。
  # 標準的ファイルデスクリプタ(0,1,2)は :close で明示的に閉じない
  # 限り、このオプションの影響を受けません。
  # 
  # 「:close_others」とは無関係に ruby が open する IO には
  # デフォルトでは close_on_exec が設定されていて、自動的に
  # 閉じられることに注意してください。
  # 
  # //emlist[][ruby]{
  # pid = spawn(command, :close_others=>true)  # close 3,4,5,...
  # pid = spawn(command, :close_others=>false) # don't close 3,4,5,... (default)
  # //}
  # 
  # これを利用して spawn を [[m:IO.popen]] のように使うことができます。
  # //emlist[][ruby]{
  # # similar to r = IO.popen(command)
  # r, w = IO.pipe
  # pid = spawn(command, :out=>w)   # r は子プロセスで閉じられる
  # w.close
  # //}
  # 
  # 「:close」を使ってファイルデスクリプタを明示的に閉じることもできます。
  # //emlist[][ruby]{
  # f = open(foo)
  # # f は継承されない
  # # system は :close_others=>false がデフォルトなのでそれ以外は継承される
  # system(command, f=>:close)        # don't inherit f.
  # //}
  # 
  # spawn で特定のファイルデスクリプタだけを継承したい場合は、
  # io => io という形のオプションを指定します。
  # //emlist[][ruby]{
  # # valgrind は --log-fd というオプションでログの出力先を指定できます。
  # # これで指定したファイルデスクリプタは親プロセスから
  # # 子プロセスに継承されなければならないため、 log_w=>log_w とします。
  # log_r, log_w = IO.pipe
  # pid = spawn("valgrind", "--log-fd=#{log_w.fileno}", "echo", "a", log_w=>log_w)
  # log_w.close
  # p log_r.read
  # //}
  # 
  # ファイルデスクリプタを入れ替えることもできます。
  # //emlist[][ruby]{
  # # stdout と stderr を入れ替えリダイレクト
  # pid = spawn(command, :out=>:err, :err=>:out)
  # //}
  # このような相互参照を解決するため、spawnの内部で新しい
  # ファイルデスクリプタを作り、利用します。
  # 
  # :close_others と :close オプションが意味を持つのは、
  # 子プロセスに閉じていないファイルデスクリプタが全て渡される環境
  # (Unix 系統の環境)のみです。
  # 例えば Windows では元々子プロセスにはファイルデスクリプタ 0 1 2 のみ
  # 渡されるので :close_others や :close オプションは意味を持ちません。
  # 
  # 
  # @param env 更新する環境変数を表す Hash
  # @param program 文字列か2要素の配列を指定します。
  # @param args 渡される引数です。0 個以上の文字列を指定します。
  # @param options オプションパラメータ Hash
  # 
  # @raise ArgumentError 第一引数が配列かつ要素数が 2 でない場合に発生します。
  # 
  # @raise Errno::EXXX コマンドが実行できなかった場合に発生します。
  # 
  # @see [[m:Kernel.#system]],[[m:Kernel.#exec]]
  def spawn; end

  # --- srand -> Integer
  # --- srand(seed) -> Integer
  # 
  # [[m:Kernel.#rand]] や [[m:Random.rand]] で使用される擬似乱数生成器の種を設定し、古い種を返します。
  # 
  # seed に整数を指定するとその絶対値を乱数の種に設定します。
  # それ以外の値を指定した場合は seed.to_int が指定されたものとして扱います。
  # seed に既知の値を与えると、以前の Kernel.#rand の値を再現できます。
  # 
  # seed が省略された時には
  # 現在の時刻やプロセス ID、srand を呼び出した回数、
  # また可能なら /dev/urandom から読み出したデータなどを元に種を作ります。
  # 
  # @param seed 乱数の種となる整数を指定します。
  #             [[c:Bignum]] も指定可能です。
  # 
  # //emlist[例][ruby]{
  # num = 455675
  # seeds = []
  # 
  # srand(num)
  # 
  # p rand(6) #=> 3
  # p rand(6) #=> 0
  # p rand(0) #=> 0.445804380918972
  # p rand(0) #=> 0.422248634121701
  # 
  # seeds << srand
  # 
  # p rand(6) #=> 3
  # p rand(6) #=> 3
  # p rand(0) #=> 0.938911141393347
  # p rand(0) #=> 0.915824970865251
  # 
  # seeds << srand(num)
  # 
  # p rand(6) #=> 3
  # p rand(6) #=> 0
  # p rand(0) #=> 0.445804380918972
  # p rand(0) #=> 0.422248634121701
  # 
  # seeds << srand
  # 
  # p seeds #=> [455675, 2995620310703489221660585195204777696, 455675]
  # //}
  # 
  # @see [[m:Kernel.#rand]], [[m:Random::DEFAULT]]
  def srand; end

  # --- sub(pattern, replace)          -> String
  # --- sub(pattern) {|matched| ... }  -> String
  # 
  # $_.sub とほぼ同じですが、置換が発生したときは、$_の内容を置き換える点が異なります。
  # コマンドラインオプションで -p または -n を指定した時のみ定義されます。
  # 
  # 暗号的になりすぎるきらいがあるため、このメソッドの使用は推奨されていません。
  # 今後はより明示的な $_.sub を使ってください。
  # 
  # @raise ArgumentError replace を指定しなかった場合に発生します。
  # 
  # $_.sub とこのメソッド sub は以下の点で違いがあります。
  # 
  #   * sub は $_ の値をコピーして、コピーの方を更新し、
  #   $_ に再代入します。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # 
  # //emlist[例][ruby]{
  # $_               # => "testtest\n"
  # sub(/es/, '!!')  # => "t!!ttest\n"
  # //}
  # 
  # @see [[m:String#sub]],[[m:$_]]
  def sub; end

  # --- syscall(num, *arg ) -> Integer
  # 
  # numで指定された番号のシステムコールを実行します。
  # 第2引数以降をシステムコールの引数として渡します。
  # 
  # どの数値がどのシステムコールに対応するかは、
  # syscall(2) や
  # /usr/include/sys/syscall.h を参照してください。
  # 
  # システムコールの慣習に従い、syscall(2)
  # が -1 を返す場合には例外 [[c:Errno::EXXX]] が発生します。
  # それ以外では、返した値をそのまま数値で返します。
  # 
  # ライブラリ [[lib:fiddle]] を使えばより高レベルな操作ができます。
  # 
  # @param num システムコール番号です。
  # @param arg 文字列か、整数です。最大 9 個まで渡すことができます。
  # @raise Errno::EXXX syscall(2) が -1 を返した場合に発生します。
  # @raise NotImplementedError 実行環境がこのメソッドに対応していないとき発生します。
  # 
  # //emlist[例][ruby]{
  # syscall 4, 1, "hello\n", 6   # '4' is write(2) on our box
  # # => hello
  # //}
  # 
  # @see [[lib:fiddle]], [[man:syscall(2freebsd)]], [[man:syscall(2linux)]]
  def syscall; end

  # --- system(command, options={}) -> bool | nil
  # --- system(env, command, options={}) -> bool | nil
  # 
  # 引数を外部コマンドとして実行して、成功した時に真を返します。
  # 
  # 子プロセスが終了ステータス 0 で終了すると成功とみなし true を返します。
  # それ以外の終了ステータスの場合は false を返します。
  # コマンドを実行できなかった場合は nil を返します。
  # 
  # options で :exception に true を指定することで、
  # nil や false を返す代わりに例外を発生するようにできます。
  # 
  # 終了ステータスは変数 [[m:$?]] で参照できます。
  # 
  # コマンドを実行することができなかった場合、多くのシェルはステータス
  # 127 を返します。シェルを介さない場合は Ruby の子プロセスがステータス
  # 127 で終了します。
  # コマンドが実行できなかったのか、コマンドが失敗したのかは、普通
  # [[m:$?]] を参照することで判別可能です。
  # 
  # === 引数の解釈
  # 
  # この形式では command が shell のメタ文字
  # //emlist{
  #   * ? {} [] <> () ~ & | \ $ ; ' ` " \n
  # //}
  # を含む場合、shell 経由で実行されます。
  # そうでなければインタプリタから直接実行されます。
  # 
  # @param command command コマンドを文字列で指定します。
  # @param env 更新する環境変数を表す Hash
  # @param options オプションパラメータ Hash
  # @raise Errno::EXXX exception: true が指定されていて、コマンドの実行が失敗したときに発生します。
  # @raise RuntimeError exception: true が指定されていて、コマンドの終了ステータスが 0 以外のときに発生します。
  # 
  # //emlist[シェル経由でコマンドを実行][ruby]{
  # system("echo *") # => true
  # # fileA fileB fileC ...
  # //}
  # 
  # //emlist[exceptionオプションを指定][ruby]{
  # system("sad", exception: true)                   # => Errno::ENOENT (No such file or directory - sad)
  # system('ruby -e "exit(false)"', exception: true) # => RuntimeError (Command failed with exit 1: ruby -e "exit(false)")
  # system('ruby -e "exit(true)"', exception: true)  # => true
  # //}
  # 
  # @see [[m:Kernel.#`]],[[m:Kernel.#spawn]],[[m:Kernel.#exec]],[[man:system(3)]]
  # 
  # --- system(program, *args, options={}) -> bool | nil
  # --- system(env, program, *args, options={}) -> bool | nil
  # 
  # 引数を外部コマンドとして実行して、成功した時に真を返します。
  # 
  # 子プロセスが終了ステータス 0 で終了すると成功とみなし true を返します。
  # それ以外の終了ステータスの場合は false を返します。
  # コマンドを実行できなかった場合は nil を返します。
  # 
  # options で :exception に true を指定することで、
  # nil や false を返す代わりに例外を発生するようにできます。
  # 
  # 終了ステータスは変数 [[m:$?]] で参照できます。
  # 
  # コマンドを実行することができなかった場合、多くのシェルはステータス
  # 127 を返します。シェルを介さない場合は Ruby の子プロセスがステータス
  # 127 で終了します。コマンドが実行できなかったのか、コマンドが失敗したの
  # かは、普通 [[m:$?]] を参照することで判別可能です。
  # 
  # Hash を options として渡すことで、起動される子プロセスの
  #   * プロセスグループ
  #   * resource limit
  #   * カレントディレクトリ
  #   * umask
  #   * 子プロセスでのリダイレクト
  # などを変更できます。環境変数のクリアなども指定できます。
  # 詳しくは [[m:Kernel.#spawn]] を参照してください。
  # 
  # === 引数の解釈
  # 
  # この形式で呼び出した場合、空白や shell のメタキャラクタも
  # そのまま program の引数に渡されます。
  # 先頭の引数が2要素の配列であった場合、第1要素の文字列が実際に
  # 起動するプログラムのパスであり、第2要素が「みせかけ」のプロ
  # グラム名になります。
  # また、第1要素はフルパスで指定しなくても環境変数 PATH から探します。
  # 
  # @param program 文字列か2要素の配列です。
  # @param args program に渡す引数を 0 個以上指定する
  # @param env 更新する環境変数を表す Hash
  # @param options オプションパラメータ Hash
  # @raise ArgumentError 第一引数が配列かつ要素数が 2 でない場合に発生します。
  # @raise Errno::EXXX exception: true が指定されていて、コマンドの実行が失敗したときに発生します。
  # @raise RuntimeError exception: true が指定されていて、コマンドの終了ステータスが 0 以外のときに発生します。
  # 
  # //emlist[インタプリタから直接コマンドを実行][ruby]{
  # system("echo", "*") # => true
  # # *
  # //}
  # 
  # @see [[m:Kernel.#`]],[[m:Kernel.#spawn]],[[m:Kernel.#exec]],[[man:system(3)]]
  def system; end

  # --- test(cmd, file) -> bool | Time | Integer | nil
  # 
  # 単体のファイルでファイルテストを行います。
  # 
  # @param cmd 以下に示す文字リテラル、文字列、あるいは同じ文字を表す数値
  #            です。文字列の場合はその先頭の文字だけをコマンドとみなします。
  # @param file テストするファイルのパスを表す文字列か IO オブジェクトを指定します。
  # @return 下表に特に明記していないものは、真偽値を返します。
  # 
  # 以下は cmd として指定できる文字リテラルとその意味です。
  # 
  # : ?r
  #     ファイルを実効 uid で読むことができる
  # : ?w
  #     ファイルに実効 uid で書くことができる
  # : ?x
  #     ファイルを実効 uid で実行できる
  # : ?o
  #     ファイルの所有者が実効 uid である
  # : ?G
  #     ファイルのグループ所有者が実効 gid である
  # : ?R
  #     ファイルを実 uid で読むことができる
  # : ?W
  #     ファイルに実 uid で書くことができる
  # : ?X
  #     ファイルを実 uid で実行できる
  # : ?O
  #     ファイルの所有者が実 uid である
  # : ?e
  #     ファイルが存在する
  # : ?z
  #     ファイルサイズが 0 である
  # : ?s
  #     ファイルサイズが 0 でない (ファイルサイズを返す、0 ならば nil) -> Integer|nil
  # : ?f
  #     ファイルはプレーンファイルである
  # : ?d
  #     ファイルはディレクトリである
  # : ?l
  #     ファイルはシンボリックリンクである
  # : ?p
  #     ファイルは名前つきパイプ(FIFO)である
  # : ?S
  #     ファイルはソケットである
  # : ?b
  #     ファイルはブロックスペシャルファイルである
  # : ?c
  #     ファイルはキャラクタースペシャルファイルである
  # : ?u
  #     ファイルに setuid ビットがセットされている
  # : ?g
  #     ファイルに setgid ビットがセットされている
  # : ?k
  #     ファイルに sticky ビットがセットされている
  # : ?M
  #     ファイルの最終更新時刻を返す -> Time
  # : ?A
  #     ファイルの最終アクセス時刻を返す -> Time
  # : ?C
  #     ファイルの inode 変更時刻を返す -> Time
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # test("r", "testfile") # => true
  # test("s", "testfile") # => 4
  # test("M", "testfile") # => 2018-03-31 07:38:40 +0900
  # //}
  # 
  # --- test(cmd, file1, file2) -> bool
  # 
  # ２ファイル間のファイルテストを行います。
  # 
  # @param cmd 以下に示す文字リテラル、文字列、あるいは同じ文字を表す数値
  #            です。文字列の場合はその先頭の文字だけをコマンドとみなします。
  # @param file1 テストするファイルのパスを表す文字列か IO オブジェクトを指定します。
  # @param file2 テストするファイルのパスを表す文字列か IO オブジェクトを指定します。
  # @return 真偽値を返します。
  # 
  # 以下は cmd として指定できる文字リテラルとその意味です。
  # 
  # : ?=
  #     ファイル1とファイル2の最終更新時刻が等しい
  # : ?>
  #     ファイル1の方がファイル2より最終更新時刻が新しい
  # : ?<
  #     ファイル1の方がファイル2より最終更新時刻が古い
  # : ?-
  #     ファイル1とファイル2が同一のファイルである
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile1", "test1")
  # IO.write("testfile2", "test2")
  # %w(= < > -).each do |e|
  #   result = test(e, "testfile1", "testfile2")
  #   puts "#{e}: #{result}"
  # end
  # //}
  # 
  # # => =: true
  # # => <: false
  # # => >: false
  # # => -: false
  def test; end

  # --- throw(tag, value = nil) -> ()
  # 
  # [[m:Kernel.#catch]]との組み合わせで大域脱出を行います。 throw
  # は同じ tag を指定した catch のブロックの終わりまでジャンプします。
  # 
  # throw は探索時に呼び出しスタックをさかのぼるので、
  # ジャンプ先は同じメソッド内にあるとは限りません。
  # もし ensure節 が存在するならジャンプ前に実行します。
  # 
  # 同じ tag で待っている catch が存在しない場合は、例外で
  # スレッドが終了します。
  # 
  # 同じ tag であるとは [[m:Object#object_id]] が同じであるという意味です。
  # 
  # @param tag catch の引数に対応する任意のオブジェクトです。
  # @param value catch の戻り値になります。
  # @raise UncaughtThrowError 同じ tag で待っている catch が存在しない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   throw :exit, 25
  # end
  # 
  # ret = catch(:exit) do
  #   begin
  #     foo
  #     some_process()    # 絶対に実行されない
  #     10
  #   ensure
  #     puts "ensure"
  #   end
  # end
  # puts ret
  # #=> ensure
  # #   25
  # //}
  # 
  # @see [[m:Kernel.#catch]]
  def throw; end

  # --- trace_var(varname, hook) -> nil
  # --- trace_var(varname){|new_val| .... } -> nil
  # --- trace_var(varname, hook) -> [String|Proc]
  # 
  # グローバル変数 varname への代入のフックを登録します。
  # 
  # ここでの「グローバル変数」は、特殊変数
  # ([[ref:d:spec/variables#builtin]] を参照)も含めた `$' で始まる変数のこ
  # とです。
  # 
  # この呼び出し以降、varname で指定したグローバル変数に
  # 値が代入されるたびに hook かブロックが評価されます。hook が Proc オブジェクトの場合
  # 代入された値がブロック引数に渡されます。文字列の場合はRubyコードとして評価されます。
  # 
  # trace_var がフックするのは明示的な代入だけです。
  # フックは複数登録できます。
  # 
  # フックを解除するには、hook に nil を
  # 指定するか、[[m:Kernel.#untrace_var]] を用います。
  # 
  # hook が nil ならば、設定されていた
  # hook をすべて解除してその配列を返します(ブロックで登録されていれば
  # [[c:Proc]] オブジェクトで返されます)
  # それ以外は、nil を返します。
  # 
  # @param varname グローバル変数名を文字列か [[c:Symbol]] で指定します。
  # @param hook フックになる文字列または [[c:Proc]] オブジェクトです。
  # @return フックを登録した場合は nil を返します。解除した場合は解除した
  #         フックを並べた配列を返します。
  # 
  # //emlist[例][ruby]{
  # trace_var(:$v){|val| puts "hook: $v=#{val.inspect}" }
  # $v = 1       #=> hook: $v=1
  # $v = "foo"   #=> hook: $v="foo"
  # $v.upcase!
  # p $v         #=> "FOO"
  # //}
  # 
  # @see [[m:Kernel.#untrace_var]]
  def trace_var; end

  # --- trap(signal, command) -> String | Proc | nil
  # --- trap(signal) { ... }  -> String | Proc | nil
  # 
  # signal で指定された割り込みにたいするハンドラとして
  # command を登録します。[[m:Signal.#trap]]と同じです。
  # 
  # [[m:Signal.#trap]]の使用を推奨します。
  # 
  # @param signal [[m:Signal.#trap]] 参照
  # @param command [[m:Signal.#trap]] 参照
  # 
  # 
  # @see [[m:Signal.#trap]],[[c:Signal]]
  def trap; end

  # --- untrace_var(varname, hook = nil) -> [String|Proc]
  # 
  # グローバル変数 varname に関連付けられたフックを解除します。
  # 
  # hook が指定された場合にはそのフックだけを解除します。
  # 省略するか nil を与えた場合は
  # varname のフックを全て解除します。
  # 
  # @param varname グローバル変数名を文字列か [[c:Symbol]] で指定します。
  # @param hook 文字列または [[c:Proc]] オブジェクトです。
  # @return 解除されたフックの配列を返します。
  # 
  # //emlist[例][ruby]{
  # trace_var(:$v){|val| print "hookA.#{val.inspect},\n" }
  # block = proc{|val| print "hookB.#{val.inspect}," }
  # trace_var(:$v,&block)
  # $v = 'str'        #=> hookB."str",hookA."str",
  # 
  # untrace_var(:$v,block)
  # $v = 'str'        #=> hookA."str",
  # 
  # trace_var(:$v){|val| print "hookC.#{val.inspect}," }
  # p untrace_var(:$v) #=> [#<Proc:0x02b68f58@..:9>, #<Proc:0x02b6978c@..:3>]
  # $v = 'str'        # なにも出力されない
  # //}
  # 
  # @see [[m:Kernel.#trace_var]]
  def untrace_var; end

  # --- warn(*message, uplevel: nil, category: nil) -> nil
  # 
  # message を 標準エラー出力 [[m:$stderr]] に出力します。 [[m:$VERBOSE]]
  # フラグ が nil のときは何も出力しません。
  # 
  # 文字列以外のオブジェクトが引数として与えられた場合には、
  # to_s メソッドにより文字列に変換してから出力します。
  # 
  # uplevel を指定しない場合は、
  # このメソッドは以下と同じです。
  # 
  # //emlist[][ruby]{
  # $stderr.puts(*message) if !$VERBOSE.nil? && !message.empty?
  # nil
  # //}
  # 
  # @param message 出力するオブジェクトを任意個指定します。
  # @param uplevel いくつ前の呼び出し元のファイル名と行番号を表示するかを0以上の数値で指定します。 nil の場合は表示しません。
  # @param category 警告のカテゴリを指定します。サポートされている category については [[m:Warning.[] ]] を参照してください。
  # @raise IOError 標準エラー出力が書き込み用にオープンされていなければ発生します。
  # @raise Errno::EXXX 出力に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # warn "caution!" #=> caution!
  # $VERBOSE = nil
  # warn "caution!" # 何もしない
  # //}
  # 
  # //emlist[uplevel の例][ruby]{
  # def foo
  #   warn("test message", uplevel: 0) # => test.rb:2: warning: test message
  #   warn("test message", uplevel: 1) # => test.rb:6: warning: test message
  #   warn("test message", uplevel: 2) # => test message
  # end
  # foo
  # //}
  # 
  # //emlist[category の例][ruby]{
  # Warning[:deprecated] = true # 非推奨の警告を表示する
  # warn("deprecated!!", category: :deprecated)
  # # => deprecated!
  # 
  # Warning[:deprecated] = false # 非推奨の警告を表示しない
  # warn("deprecated!!", category: :deprecated)
  # # 警告は出力されない
  # //}
  # 
  # @see [[m:Warning#warn]], [[m:$stderr]],[[m:$VERBOSE]]
  def warn; end

  # --- CONFIG -> Hash
  # [[m:RbConfig::MAKEFILE_CONFIG]] と同じです。
  def CONFIG; end

end
