class OptionParser
  # --- accept(klass, pat = /.*/){|str| ...}    -> ()
  # 
  # [[m:OptionParser.accept]] と同様ですが、
  # 登録したブロックはレシーバーに限定されます。
  # 
  # @param klass クラスオブジェクトを与えます。
  # 
  # @param pat match メソッドを持ったオブジェクト([[c:Regexp]] オブジェクトなど)を与えます。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # require "time"
  # 
  # opts = OptionParser.new
  # opts.accept(Time) do |s,|
  #   begin
  #     Time.parse(s) if s
  #   rescue
  #     raise OptionParser::InvalidArgument, s
  #   end
  # end
  # 
  # opts.on("-t", "--time [TIME]", Time) do |time|
  #   p time.class # => Time
  # end
  # 
  # opts.parse!(ARGV)
  # //}
  def accept; end

  # --- banner            -> String
  # 
  # サマリの最初に表示される文字列を返します。
  # 
  # @return サマリの最初に表示される文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # options = {}
  # opts = OptionParser.new do |opts|
  #   opts.banner = "Usage: example.rb [options]"
  # 
  #   opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
  #     options[:verbose] = v
  #   end
  # end
  # 
  # p opts.banner # => "Usage: example.rb [options]"
  # //}
  def banner; end

  # --- banner=(heading)
  # 
  # サマリの最初に表示される文字列を指定します。
  # 
  # @param heading サマリの最初に表示される文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # options = {}
  # opts = OptionParser.new do |opts|
  #   opts.banner = "Usage: example.rb [options]" # => "Usage: example.rb [options]"
  # 
  #   opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
  #     options[:verbose] = v
  #   end
  # end
  # 
  # opts.banner # => "Usage: example.rb [options]"
  # //}
  def banner=; end

  # --- default_argv    -> [String]
  # 
  # 自身がデフォルトでパースする引数を文字列の配列で返します。
  # 
  # @param argv デフォルトでパースする文字列の配列を返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new
  # 
  # # --hoo param1 --bar param2 をパラメーターに指定して実行
  # opts.default_argv # => ["--foo", "param1", "--bar", "param2"]
  # //}
  def default_argv; end

  # --- default_argv=(argv)
  # 
  # 自身がデフォルトでパースする引数を文字列の配列で指定します。
  # 
  # [[m:OptionParser#parse]] の引数が指定されなかったときに使われます。
  # 
  # @param argv デフォルトでパースしたい文字列の配列を指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # config = {}
  # opts = OptionParser.new
  # opts.on("-r", "--require LIBRARY"){|lib| config[:lib] = lib }
  # 
  # # パラメーター指定なしで実行
  # opts.default_argv # => []
  # opts.parse!
  # p config          # => {}
  # 
  # opts.default_argv = ["--require", "lib1"] # => ["--require", "lib"]
  # opts.default_argv # => ["--require", "param1"]
  # opts.parse!
  # p config          # => {:lib=>"lib1"}
  # //}
  def default_argv=; end

  # --- environment(env)    -> [String]
  # 
  # 環境変数 env に対して
  # [[m:Shellwords.#shellwords]] を呼
  # んで配列にしてから parse を行ないます。
  # 
  # @param env 環境変数名を文字列で与えます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # config = {}
  # opts = OptionParser.new
  # opts.on("-r", "--require LIBRARY"){|lib| config[:lib] = lib }
  # 
  # # HOGE_OPT は hoge というプログラム名に対応した名前です
  # ENV['HOGE_OPT'] = %q{--require lib1 'remain data'}
  # p opts.environment('HOGE_OPT') # => ["remain data"]
  # p config                           # => {:lib=>"lib1"}
  # //}
  def environment; end

  # --- getopts(argv, *opts)   -> Hash
  # --- getopts(*opts)         -> Hash
  # 
  # 引数をパースした結果を、Hash として返します。
  # 
  # 配列 argv を与えた場合、argv をパースします。そうでない場合は、
  # default_argv をパースします。
  # 
  # //emlist[][ruby]{
  # opt = OptionParser.new
  # params = opt.getopts(ARGV, "ab:", "foo", "bar:")
  # # params["a"] = true   # -a
  # # params["b"] = "1"    # -b1
  # # params["foo"] = true  # --foo
  # # params["bar"] = "x"  # --bar x
  # //}
  # 
  # @param argv パースしたい配列を指定します。
  # 
  # @param opts 引数を文字列で指定します。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  def getopts; end

  # --- help    -> String
  # --- to_s    -> String
  # 
  # サマリの文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # options = {}
  # opts = OptionParser.new do |opts|
  #   opts.banner = "Usage: example.rb [options]"
  # 
  #   opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
  #     options[:verbose] = v
  #   end
  # end
  # 
  # puts opts.help
  # 
  # # => Usage: example.rb [options]
  # #    -v, --[no-]verbose               Run verbosely
  # //}
  def help; end

  # --- load(filename = nil)     -> bool
  # 
  # 指定された filename を読み込んで各行をまとめたものに対して [[m:OptionParser#parse]] を行ないます。
  # 
  # パースが成功した場合に true を返します。
  # ファイルが存在しなかった場合に false を返します。
  # 
  # @param filename 各行をパースしたいファイルの名前を文字列で指定します。
  #                 指定されないか nil である場合、~/.options/ に
  #                 プログラムのサフィックスを付けた '~/.options/コマンド名' というファイルをパースします。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # IO.write("options.txt", %w(-a --b).join("\n"))
  # options = { a: false, b: false }
  # OptionParser.new do |opt|
  #   opt.on('-a') { |v| options[:a] = v }
  #   opt.on('--b') {|v| options[:b] = v }
  #   opt.load("options.txt")   # => true
  #   opt.load("not_exist.txt") # => false
  # end
  # 
  # p options # => {:a=>true, :b=>true}
  # //}
  def load; end

  # --- on(short, desc = "") {|v| ... }        -> self
  # --- on(long, desc = "") {|v| ... }         -> self
  # --- on(short, long, desc = "") {|v| ... }  -> self
  # 
  # オプションを取り扱うためのブロックを自身に登録します。
  # ブロックはコマンドラインのパース時に、オプションが指定されていれば呼ばれます。
  # 
  # ショートオプションとロングオプションを同時に登録することもできます。
  #   opts.on("-r", "--require LIBRARY"){|lib| ...}
  # これは以下と同値です。
  #   opts.on("-r LIBRARY"){|lib| ...}
  #   opts.on("--require LIBRARY"){|lib| ...}
  # 
  # 複数の異なるオプションに同じブロックを一度に登録することもできます。
  # 
  #   opt.on('-v', '-vv'){|boolean| ...}
  #   opt.on('--require X', '--need', '--dependon'){|x| ... }
  # 
  # @param short ショートオプションを表す文字列を指定します。
  #              そのオプションが引数をとらない場合は、
  # //emlist{
  #   on("-x"){|boolean| ...}
  # //}
  #              となります。コマンドラインにオプションが存在した場合 true を引数と
  #              してブロックを評価します。
  #              ショートオプションが引数をとる場合は、
  # //emlist{
  #   on("-x MANDATORY"){|val| ...}
  # //}
  #              となります。"MANDATORY" の部分は任意の文字列で構いません。
  #              オプションの引数が必須でない場合は [ ] をつけて、
  # //emlist{
  #   on("-x [OPTIONAL]"){|val| ...}
  # //}
  #              となります。
  # 
  # @param long ロングオプションを表す文字列を指定します。ショートオプションの時と同様に、
  # //emlist{
  #   on("--long"){|boolean| ...}
  #   on("--long MANDATORY"){|val| ...}
  #   on("--long [OPTIONAL]"){|val| ...}
  # //}
  #             と指定できます。
  # 
  # @param desc オプションの説明を文字列で与えます。サマリに表示されます。
  # 
  # --- on(short, pat = /.*/, desc = "") {|v| ...}        -> self
  # --- on(long, pat = /.*/, desc = "") {|v| ...}         -> self
  # --- on(short, long, pat = /.*/, desc = "") {|v| ...}  -> self
  # 
  # オプションを取り扱うためのブロックを自身に登録します。
  # ブロックはコマンドラインのパース時に、オプションが指定されていれば呼ばれます。
  # 
  # pat にはオプションの引数に許すパターンを表す正規表現で与えます。
  # コマンドに与えられた引数がパターンにマッチしない場合、
  # 例外 OptionParser::InvalidArgument が parse 実行時に投げられます。
  # 
  #   opts.on("--username VALUE", /[a-zA-Z0-9_]+/){|name| ...}
  #   # ruby command --username=ruby_user
  #   # ruby command --username=ruby.user #=> Error
  # 
  # @param short ショートオプションを表す文字列を指定します。
  # 
  # @param long ロングオプションを表す文字列を指定します。
  # 
  # @param pat オプションの引数に許すパターンを表す正規表現で指定します。
  # 
  # @param desc オプションの説明を文字列で与えます。サマリに表示されます。
  # 
  # --- on(short, klass = String, desc = "") {|v| ...}        -> self
  # --- on(long, klass = String, desc = "") {|v| ...}         -> self
  # --- on(short, long, klass = String, desc = "") {|v| ...}  -> self
  # 
  # オプションを取り扱うためのブロックを自身に登録します。
  # ブロックはコマンドラインのパース時に、オプションが指定されていれば呼ばれます。
  # 
  # klass にはクラスを与えます。どのようなクラスを受け付けるかは、
  # 以下の「デフォルトで利用可能な引数クラス」を参照して下さい。
  # OptionParser.accept や OptionParser#accept によって、受け付け
  # るクラスを増やすことができます。登録されていないクラスが指定された
  # 場合、例外 [[c:ArgumentError]] を投げます。
  # また、登録されたクラスであっても引数が変換できないものである場合、例外
  # [[c:OptionParser::InvalidArgument]] を投げます。
  # 
  # オプションの引数は accept で登録したブロックで klass のインスタンス
  # に変換されてから、ブロックに渡されます。
  # 
  #   opts.on("-w", "--width N", Integer){|w|
  #     p w.class #=> Integer
  #   }
  #   # ruby command --width=32
  # 
  #   opts.on("-o", "--overwrite VALUE", TrueClass){|boolean| ...}
  #   # ruby command --overwrite yes
  # 
  # @param short ショートオプションを表す文字列を指定します。
  # 
  # @param long ロングオプションを表す文字列を指定します。
  # 
  # @param klass オプションの引数のクラスを指定します。
  # 
  # @param desc オプションの説明を文字列で与えます。サマリに表示されます。
  # 
  # @raise ArgumentError 登録されていないクラスが klass に指定された場合に発生します。
  # 
  # === デフォルトで利用可能な引数クラス
  # 
  # : Object
  #  オプションの引数は変換されません。
  # 
  # : String
  #  オプションの引数は変換されません。ただし、空文字列を指定すると
  #  [[c:OptionParser::InvalidArgument]] が発生します。
  # 
  # : Integer
  #  Integer オブジェクトに変換されます。"0b1"、"07"、"99"、"0xff" といった
  #  2進数、8進数、10進数、16進数の整数のフォーマットを指定できます。
  # 
  # : Float
  #  Float オブジェクトに変換されます。"1.0" や "0.5e0" のようなフォーマッ
  #  トを指定できます。
  # 
  # : Numeric
  #  整数の場合は Integer オブジェクトに、実数の場合は Float オブジェクトに
  #  変換されます。
  # 
  # : OptionParser::DecimalInteger
  #  Integer オブジェクトに変換されます。10進数の整数の整数のフォーマットの
  #  みを指定できます。
  # 
  # : OptionParser::OctalInteger
  #  Integer オブジェクトに変換されます。"0b1"、"07"、"0xff" といった 2進数、
  #  8進数、16進数の整数のフォーマットを指定できます。
  # 
  # : OptionParser::DecimalNumeric
  #  整数の場合は Integer オブジェクトに、実数の場合は Float オブジェクトに
  #  変換されます。10進数のフォーマットを指定できます。
  # 
  # : TrueClass
  #  true か false に変換されます。"yes" や "no"、"true" や "false"、"+"
  #  や "-" を指定できます。オプションの引数を省略した場合は true になります。
  #  また、"no-" をオプションの先頭に付けた場合は値が反転します。
  # 
  # : FalseClass
  #  true か false に変換されます。TrueClass との違いはオプションの引数を省
  #  略した場合に false になります。
  # 
  # : Array
  #  文字列の配列に変換されます。"," ごとに 1つの要素になります。
  # 
  # --- on(short, *rest) {|v| ...}        -> self
  # --- on(long, *rest) {|v| ...}         -> self
  # --- on(short, long, *rest) {|v| ...}  -> self
  # 
  # オプションを取り扱うためのブロックを自身に登録します。
  # ブロックはコマンドラインのパース時に、オプションが指定されていれば呼ばれます。
  # 
  # コマンドに与えられた引数が配列やハッシュに含まれない場合、例外
  # [[c:OptionParser::InvalidArgument]] が [[m:OptionParser#parse]] 実行時
  # に発生します。
  # 
  # @param short ショートオプションを表す文字列を指定します。
  # 
  # @param long ロングオプションを表す文字列を指定します。
  # 
  # @param rest 可能な引数を列挙した配列やハッシュを与えます。文字列を与えた場合は、
  #             サマリに表示されるオプションの説明と見なします。
  # 
  # //emlist[][ruby]{
  # opts.on("--protocol VALUE", [:http, :ftp, :https]){|w|
  #   p w
  # }
  # # ruby command --protocol=http #=> :http
  # 
  # opts.on("-c", "--charset VALUE", {"jis" => "iso-2022-jp", "sjis" => "shift_jis"}){|w|
  #   p w
  # }
  # # ruby command --charset=jis #=> "iso-2022-jp"
  # //}
  def on; end

  # --- on_head(*arg, &block) -> self
  # 
  # オプションを取り扱うためのブロックを自身の持つリストの最初に登録します。
  # 
  # @param arg [[m:OptionParser#on]] と同様です。
  # 
  # @param block [[m:OptionParser#on]] と同様です。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # puts opts.help
  # 
  # # => Usage: test [options]
  # #    -i, --init
  # #    -u, --update
  # #    -h, --help
  # //}
  # 
  # @see [[m:OptionParser#on]], [[m:OptionParser#on_tail]]
  def on_head; end

  # --- on_tail(*arg, &block) -> self
  # 
  # オプションを取り扱うためのブロックを自身の持つリストの最後に登録します。
  # 
  # --version や --help の説明をサマリの最後に表示したい時に便利です。
  # 
  # @param arg [[m:OptionParser#on]] と同様です。
  # 
  # @param block [[m:OptionParser#on]] と同様です。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # puts opts.help
  # 
  # # => Usage: test [options]
  # #    -i, --init
  # #    -u, --update
  # #    -h, --help
  # //}
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new
  # opts.on_tail("-h", "--help", "Show this message") do
  #   puts opts
  #   exit
  # end
  # 
  # opts.on_tail("--version", "Show version") do
  #   puts OptionParser::Version.join('.')
  #   exit
  # end
  # //}
  # 
  # @see [[m:OptionParser#on]], [[m:OptionParser#on_head]]
  def on_tail; end

  # --- order(argv, into: nil)            -> [String]
  # --- order(argv, into: nil){|s| ...}   -> [String]
  # --- order(*args, into: nil)           -> [String]
  # --- order(*args, into: nil){|s| ...}  -> [String]
  # 
  # 与えられた argv を順番にパースします。
  # オプションではないコマンドの引数(下の例で言うと somefile)に出会うと、パースを中断します。
  # argv からオプションを取り除いたものを返します。
  # 
  # ブロックが与えられている場合は、パースを中断せずに引数をブロックに渡してブロックを評価し、
  # パースを継続します。argv を返します。
  # 
  # 下の例で言うと、コマンドの引数 somefile よりも後ろにオプションを置くことができま
  # せん。-b もコマンドのオプションではない引数として扱われてしまいます。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param args パースしたい引数を順に文字列として与えます。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[opt.rb][ruby]{
  # require 'optparse'
  # opt = OptionParser.new
  # 
  # opt.on('-a [VAL]') {|v| p :a }
  # opt.on('-b') {|v| p :b }
  # 
  # opt.order(ARGV)
  # p ARGV
  # //}
  # ↓
  #   $ ruby opt.rb -a foo somefile -b
  #   :a
  #   ["-a", "foo", "somefile", "-b"]
  def order; end

  # --- order!(argv = self.default_argv, into: nil)             -> [String]
  # --- order!(argv = self.default_argv, into: nil) {|s| ...}   -> [String]
  # 
  # 与えられた argv を順番に破壊的にパースします。
  # argv からオプションがすべて取り除かれます。
  # argv を返します。
  # 
  # オプションではないコマンドの引数(下の例で言うと somefile)に出会うと、パースを中断します。
  # ブロックが与えられている場合は、パースを中断せずに
  # 引数をブロックに渡してブロックを評価し、パースを継続します。argv を返します。
  # 
  # 下の例で言うと、コマンドの引数 somefile よりも後ろにオプションを置くことができません。
  # -b もコマンドのオプションではない引数として扱われてしまいます。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[opt.rb][ruby]{
  # require 'optparse'
  # opt = OptionParser.new
  # 
  # opt.on('-a [VAL]') {|v| p :a }
  # opt.on('-b') {|v| p :b }
  # 
  # opt.order!(ARGV)
  # p ARGV
  # //}
  # ↓
  #   $ ruby opt.rb -a foo somefile -b
  #   :a
  #   ["somefile", "-b"]
  def order!; end

  # --- parse(argv, into: nil)   -> [String]
  # --- parse(*args, into: nil)  -> [String]
  # 
  # 与えられた argv をパースします。
  # argv からオプションを取り除いたものを返します。
  # 
  # [[m:OptionParser#permute]] と同様に振舞います。しかし、
  # 環境変数に POSIXLY_CORRECT が設定されている場合は、
  # [[m:OptionParser#order]] と同様に振舞います。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param args パースしたい引数を順に文字列として与えます。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # ARGV             # => ["-i", "-u", "-h", "test"]
  # opts.parse(ARGV) # => ["test"]
  # //}
  def parse; end

  # --- parse!(argv = self.default_argv, into: nil)   -> [String]
  # 
  # 与えられた argv をパースします。
  # 
  # [[m:OptionParser#permute!]] と同様に argv を破壊的にパースします。
  # 環境変数に POSIXLY_CORRECT が設定されている場合は、
  # [[m:OptionParser#order!]] と同様に振舞います。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # ARGV              # => ["-i", "-u", "-h", "test"]
  # opts.parse(ARGV)  # => ["test"]
  # ARGV              # => ["-i", "-u", "-h", "test"]
  # opts.parse!(ARGV) # => ["test"]
  # ARGV              # => ["test"]
  # //}
  def parse!; end

  # --- permute(argv, into: nil)   -> [String]
  # --- permute(*args, into: nil)  -> [String]
  # 
  # 与えられた argv をパースします。
  # オプションではないコマンドの引数(下の例で言うと somefile)があってもパースを中断しません。
  # argv からオプションを取り除いたものを返します。
  # 
  # 下の例で言うと、order と違いコマンドの引数 somefile よりも後ろにオプションを置くことが
  # できます。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param args パースしたい引数を順に文字列として与えます。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[opt.rb][ruby]{
  # require 'optparse'
  # opt = OptionParser.new
  # 
  # opt.on('-a [VAL]') {|v| p :a }
  # opt.on('-b ') {|v| p :b }
  # 
  # opt.permute!(ARGV)
  # p ARGV
  # //}
  # ↓
  #   $ ruby opt.rb -a foo somefile -b
  #   :a
  #   :b
  #   ["somefile"]
  def permute; end

  # --- permute!(argv = self.default_argv, into: nil)    -> [String]
  # 
  # 与えられた argv を破壊的にパースします。argv からオプションがすべて取り除かれます。
  # オプションではないコマンドの引数(下の例で言うと somefile)があってもパースを中断しません。
  # argv を返します。
  # 
  # 下の例で言うと、order と違いコマンドの引数 somefile よりも後ろにオプションを置くことが
  # できます。
  # 
  # @param argv パースしたい引数を文字列の配列で指定します。
  # 
  # @param into オプションを格納するハッシュを指定します。
  #             指定したハッシュにはオプションの名前をキーとして、[[m:OptionParser#on]]に渡されたブロックの値が格納されます。
  #             キーの名前はロングオプションが定義されていればロングオプションの値を、
  #             ショートオプションのみの場合はショートオプションの値から、先頭の "-" を除いてシンボル化した値が使用されます。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # //emlist[opt.rb][ruby]{
  # require 'optparse'
  # opt = OptionParser.new
  # 
  # opt.on('-a [VAL]') {|v| p :a }
  # opt.on('-b ') {|v| p :b }
  # 
  # opt.permute!(ARGV)
  # p ARGV
  # //}
  # ↓
  #   $ ruby opt.rb -a foo somefile -b
  #   :a
  #   :b
  #   ["somefile"]
  def permute!; end

  # --- program_name           -> String
  # 
  # プログラムの名前を文字列で返します。
  # 
  # デフォルトは $0 が使われます。
  # 
  # @return プログラムの名前を文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # OptionParser.new do |opts|
  #   p $0                 # => /path/to/filename.rb
  #   p opts.program_name  # => filename
  # end
  # //}
  def program_name; end

  # --- program_name=(name)
  # 
  # プログラムの名前を文字列で指定します。
  # 
  # @param name プログラムの名前を文字列で指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # OptionParser.new do |opts|
  #   $0                         # => /path/to/filename.rb
  #   opts.program_name          # => filename
  #   opts.program_name = 'test' # => "test"
  #   opts.program_name          # => "test"
  # end
  # //}
  def program_name=; end

  # --- reject(klass)    -> ()
  # 
  # [[m:OptionParser#accept]] で登録したクラスとブロックを
  # 自身から削除します。
  # 
  # @param klass 自身から削除したいクラスを指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # require "time"
  # 
  # def parse(option_parser)
  #   option_parser.on("-t", "--time [TIME]", Time) do |time|
  #     p time.class
  #   end
  #   option_parser.parse(ARGV)
  # end
  # 
  # opts = OptionParser.new
  # opts.accept(Time) do |s,|
  #   begin
  #     Time.parse(s) if s
  #   rescue
  #     raise OptionParser::InvalidArgument, s
  #   end
  # end
  # 
  # parse(opts) # => Time
  # opts.reject(Time)
  # parse(opts) # => unsupported argument type: Time (ArgumentError)
  # //}
  def reject; end

  # --- release       -> String
  # 
  # プログラムのリリースを文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # OptionParser.new do |opts|
  #   opts.release # => nil
  #   opts.release = "2019-05-01"
  #   opts.release # => "2019-05-01"
  # end
  # //}
  def release; end

  # --- release=(rel)
  # 
  # プログラムのリリースを文字列で指定します。
  # 
  # @param rel プログラムのリリースを文字列で指定します。
  # 
  # 
  # @see [[m:OptionParser#ver]]
  def release=; end

  # --- separator(sep)    -> ()
  # 
  # サマリにオプションを区切るための文字列 sep を挿入します。
  # オプションにいくつかの種類がある場合に、サマリがわかりやすくなります。
  # 
  # サマリには on メソッドを呼んだ順にオプションが表示されるので、区切りを挿入したい
  # ところでこのメソッドを呼びます。
  # 
  # @param sep サマリの区切りを文字列で指定します。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # opts = OptionParser.new
  # opts.banner = "Usage: example.rb [options]"
  # 
  # opts.separator ""
  # opts.separator "Specific options:"
  # 
  # opts.on("-r", "--require LIBRARY") do |lib|
  #         options.library << lib
  # end
  # 
  # opts.separator ""
  # opts.separator "Common options:"
  # 
  # opts.on_tail("-h", "--help", "Show this message") do
  #   puts opts
  #   exit
  # end
  # //}
  def separator; end

  # --- summarize(to = [], width = self.summary_width, max = width - 1, indent= self.summary_indent)               -> ()
  # --- summarize(to = [], width = self.summary_width, max = width - 1, indent= self.summary_indent) {|line| ... } -> ()
  # 
  # サマリを指定された to へと加えていきます。
  # 
  # ブロックが与えられた場合、サマリの各行を引数としてブロックを評価します。
  # この場合、ブロックの中で明示的に to へと加えていかない限り、
  # to にサマリが加えられることはありません。
  # 
  # @param to サマリを出力するオブジェクトを指定します。to には << メソッドが定義されいる必要があります。
  # 
  # @param width サマリの幅を整数で指定します。
  # 
  # @param max サマリの最大幅を整数で指定します。
  # 
  # @param indent サマリのインデントを文字列で指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.summarize
  # # => ["    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # opts.summarize(["description\n"], 10, 8, "  ")
  # # => ["description\n", "  -i\n", "      --init\n", "  -u\n", "      --update\n", "  -h\n", "      --help\n"]
  # //}
  def summarize; end

  # --- summary_indent          -> String
  # 
  # サマリを表示する時のインデントを文字列で返します。
  # 
  # @return サマリを表示する時のインデントを文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.summary_indent         # => "    "
  # opts.summarize
  # # => ["    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # opts.summary_indent = "  "
  # opts.summary_indent         # => "  "
  # opts.summarize
  # # => ["  -i, --init\n", "  -u, --update\n", "  -h, --help\n"]
  # //}
  def summary_indent; end

  # --- summary_indent=(indent)
  # 
  # サマリを表示する時のインデントを文字列で指定します。
  # 
  # @param indent サマリを表示する時に使われるインデントを文字列で指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.summary_indent         # => "    "
  # opts.summarize
  # # => ["    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # opts.summary_indent = "  "  # => "  "
  # opts.summary_indent         # => "  "
  # opts.summarize
  # # => ["  -i, --init\n", "  -u, --update\n", "  -h, --help\n"]
  # //}
  def summary_indent=; end

  # --- summary_width         -> Integer
  # 
  # サマリを表示するときの幅を整数で返します。
  # 
  # @return サマリを表示するときの幅を整数で返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.summary_width     # => 32
  # opts.summarize
  # # => ["    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # opts.summary_width = 8
  # opts.summary_width     # =>8
  # opts.summarize
  # # => ["    -i\n", "        --init\n", "    -u\n", "        --update\n", "    -h\n", "        --help\n"]
  # //}
  def summary_width; end

  # --- summary_width=(width)
  # 
  # サマリを表示するときの幅を整数で指定します。
  # 
  # @param width サマリを表示するときの幅を整数で指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.summary_width     # => 32
  # opts.summarize
  # # => ["    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # opts.summary_width = 8 # => 8
  # opts.summary_width     # => 8
  # opts.summarize
  # # => ["    -i\n", "        --init\n", "    -u\n", "        --update\n", "    -h\n", "        --help\n"]
  # //}
  def summary_width=; end

  # --- to_a    -> [String]
  # 
  # サマリの各行を要素とした配列を返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # opts = OptionParser.new do |opts|
  #   opts.on_head("-i", "--init")
  #   opts.on("-u", "--update")
  #   opts.on_tail("-h", "--help")
  # end
  # 
  # opts.to_a # => ["Usage: test [options]", "    -i, --init\n", "    -u, --update\n", "    -h, --help\n"]
  # //}
  def to_a; end

  # --- ver    -> String
  # 
  # program_name、version と release から生成したバージョンを表す文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # 
  # OptionParser.new do |opts|
  #   opts.banner = "Usage: example.rb [options]"
  #   opts.program_name = "Optparse Example"
  #   opts.version = [0, 1]
  #   opts.release = "2019-05-01"
  # 
  #   opts.on_tail("--version", "Show version") do
  #     puts opts.ver # => "Optparse Example 0.1 (2019-05-01)"
  #     exit
  #   end
  # 
  #   opts.parse!(ARGV)
  # end
  # //}
  def ver; end

  # --- version       -> String
  # 
  # プログラムのバージョンを文字列で返します。
  # 
  # @return プログラムのバージョンを文字列で返します。
  # 
  # 
  # @see [[m:OptionParser#ver]]
  def version; end

  # --- version=(ver)
  # 
  # プログラムのバージョンを文字列で指定します。
  # 
  # @param ver プログラムのバージョンを文字列で指定します。
  # 
  # 
  # @see [[m:OptionParser#ver]]
  def version=; end

  # --- accept(klass, pat = /.*/){|str| ...}    -> ()
  # 
  # オプションの引数を文字列から Ruby のオブジェクトに変換するための
  # ブロックを登録します。すべての OptionParser インスタンスに共通です。
  # 
  # ブロックには、文字列として与えられるオプションの引数から klass のインスタンスを生成して返すものを指定します。
  # 
  # [[m:OptionParser#on]] で klass を指定した場合、
  # コマンドラインのオプションに与えられた引数は、この accept で登録したブロックで
  # klass のインスタンスに変換されてから、OptionParser#on メソッドで登録したブロックに渡されます。
  # 
  # //emlist[][ruby]{
  # require "optparse"
  # require "time"
  # 
  # OptionParser.accept(Time) do |s,|
  #   begin
  #     Time.parse(s) if s
  #   rescue
  #     raise OptionParser::InvalidArgument, s
  #   end
  # end
  # 
  # opts = OptionParser.new
  # 
  # opts.on("-t", "--time [TIME]", Time) do |time|
  #   p time.class #=> Time
  # end
  # 
  # opts.parse!(ARGV)
  # //}
  # 
  # いくつかのクラスに対しては変換用のブロックがデフォルトで登録されて
  # います。[[m:OptionParser#on]] を参照して下さい。
  # 
  # @param klass クラスオブジェクトを与えます。
  # 
  # @param pat match メソッドを持ったオブジェクト([[c:Regexp]] オブジェクトなど)を与えます。
  def accept; end

  # --- getopts(argv, *opts)   -> Hash
  # --- getopts(*opts)         -> Hash
  # 
  # 引数をパースした結果を、Hash として返します。(self.new.getopts と同じです)
  # 
  # @param argv パースしたい配列を指定します。
  # 
  # @param opts 引数を文字列で指定します。
  # 
  # @raise OptionParser::ParseError パースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスになります。
  # 
  # 
  # @see [[m:OptionParser#getopts]]
  def getopts; end

  # --- new(banner = nil, width = 32, indent = ' ' * 4)              -> OptionParser
  # --- new(banner = nil, width = 32, indent = ' ' * 4) {|opt| ...}  -> OptionParser
  # 
  # OptionParser オブジェクトを生成して返します。
  # 
  # ブロックが与えられた場合、生成した OptionParser オブジェクトを引数としてブロックを評
  # 価します。つまり、以下のような書き方が可能です。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # OptionParser.new do |opt|
  # 
  #   opt.on('-a') {|v| p v }
  #   opt.on('-b') {|v| p v }
  # 
  #   opt.parse!(ARGV)
  # end
  # //}
  # 
  # @param banner ヘルプ(サマリ)の最初の部分に表示される、アプリケーションの説明などを文字列で与えます。
  # 
  # @param width サマリの幅を整数で与えます。
  # 
  # @param indent サマリのインデントを文字列で与えます。
  def new; end

  # --- reject(klass)    -> ()
  # 
  # [[m:OptionParser.accept]] メソッドで登録したブロックを削除します。
  # 
  # @param klass 削除したいクラスオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require "optparse"
  # require "time"
  # 
  # def parse(option_parser)
  #   option_parser.on("-t", "--time [TIME]", Time) do |time|
  #     p time.class
  #   end
  #   option_parser.parse(ARGV)
  # end
  # 
  # OptionParser.accept(Time) do |s,|
  #   begin
  #     Time.parse(s) if s
  #   rescue
  #     raise OptionParser::InvalidArgument, s
  #   end
  # end
  # 
  # opts1 = OptionParser.new
  # parse(opts1) # => Time
  # OptionParser.reject(Time)
  # opts2 = OptionParser.new
  # parse(opts2) # => unsupported argument type: Time (ArgumentError)
  # //}
  def reject; end

end
