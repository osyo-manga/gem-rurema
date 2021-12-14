class GetoptLong
  # --- each {|optname, optarg|...}
  # --- each_option {|optname, optarg|...}
  # get メソッドのイテレータ版です。オプションとその引数の取得を
  # 繰り返し行います。
  # 
  # @see [[m:GetoptLong#get]]
  def each; end

  # --- error  -> Class | nil
  # --- error? -> Class | nil
  # 
  # 現在のエラーの型を返します。エラーが発生していなければ、nil
  # を返します。
  def error; end

  # --- error_message -> String | nil
  # 
  # 現在のエラーのエラーメッセージを返します。エラーが発生していな
  # ければ、nil を返します。
  def error_message; end

  # --- get        -> [String, String]
  # --- get_option -> [String, String]
  # ARGV から、次のオプションの名前と、もしあればその引数の組を取
  # 得します。メソッドは 2 つの値を返し、1 つ目の値がオプション名
  # (例: --max-size) で、2 つ目がオプションの引数 (例: 20K) です。
  # 
  # get と get_option は常にオプション名を正式名
  # で返します。与えられたオプションが引数を取らないときは、
  # 空の文字列 ('') が optarg にセットされます。オプションが
  # ARGV に残っていないときは、optname, optarg ともに nil に
  # セットされます。メソッドから戻る際に、取得したオプションと引数
  # は自動的に ARGV から取り除かれます。
  # 
  # 与えられたコマンド行引数があなたのプログラムのオプションの設定
  # に合わない場合は、エラーとなって、以下のいずれかの例外が発生し
  # ます。
  # 
  #  * [[c:GetoptLong::AmbiguousOption]]
  #  * [[c:GetoptLong::InvalidOption]]
  #  * [[c:GetoptLong::MissingArgument]]
  #  * [[c:GetoptLong::NeedlessArgument]]
  # 
  # 加えて、静粛 (quiet) フラグが有効になっていない限り、エラーメッ
  # セージを標準エラー出力に出力します。
  # 
  # 例:
  #     optname, optarg = option_parser.get
  def get; end

  # --- ordering -> Integer
  # 現在の順序形式を返します。
  def ordering; end

  # --- ordering=(ordering)
  # 順序形式を設定します。
  # 
  # 環境変数 POSIXLY_CORRECT が定義されていると、引数に 
  # [[m:GetoptLong::PERMUTE]] を与えてこのメソッドを呼び出しても、実際のところの順
  # 序形式は [[m:GetoptLong::REQUIRE_ORDER]] に設定されます。
  # 
  # 環境変数 POSIXLY_CORRECT が定義されていない限り、[[m:GetoptLong::PERMUTE]]
  # が初期値です。定義されていれば、[[m:GetoptLong::REQUIRE_ORDER]] が初期値になり
  # ます。
  # 
  # @param ordering [[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
  #                 [[m:GetoptLong::RETURN_IN_ORDER]] のいずれかを指定します。
  # 
  # @raise ArgumentError [[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
  #                  [[m:GetoptLong::RETURN_IN_ORDER]] 以外の値を指定した場合に発生します。
  # 
  # @raise RuntimeError [[m:GetoptLong#get]], [[m:GetoptLong#get_option]],
  #                     [[m:GetoptLong#each]], [[m:GetoptLong#each_option]] メソッドを
  #                     呼び出した後にこのメソッドを呼び出した場合に発生します。
  def ordering=; end

  # --- quiet  -> true | false
  # --- quiet? -> true | false
  # 静粛モードが有効であれば、真を返します。そうでなければ、偽を返します。
  def quiet; end

  # --- quiet=(flag)
  # flag が真なら、静粛 (quiet) モードが有効になります。
  # 
  # 静粛モードが有効になっていると、レシーバのオブジェクトは、
  # [[m:GetoptLong#get]], [[m:GetoptLong#get_option]],
  # [[m:GetoptLong#each]], [[m:GetoptLong#each_option]] メソッドでエラーが
  # 発生しても、エラーメッセージを出力しません。初期値は、偽になっています。
  # 
  # @param flag 真または偽を指定します。
  def quiet=; end

  # --- set_error(type, message) -> ()
  # 
  # 引数で与えられた例外を発生させます。
  # 
  # その際、静粛モードでなければ標準エラー出力に与えられたメッセージを出力します。
  # 
  # @param type 例外クラスを指定します。
  # 
  # @param message 例外にセットするメッセージを指定します。
  def set_error; end

  # --- set_options(*arguments) -> self
  # あなたのプログラムで、認識させたいオプションをセットします。
  # 個々のオプションは、オプション名と引数のフラグからなる配列でな
  # ければいけません。
  # 
  # 配列中のオプション名は、一文字オプション (例: -d) か長いオプ
  # ション (例: --debug) を表した文字列のいずれかでなければなり
  # ません。配列の中の一番左端のオプション名が、オプションの正式名
  # になります。配列中の引数のフラグは、[[m:GetoptLong::NO_ARGUMENT]],
  # [[m:GetoptLong::REQUIRE_ARGUMENT]], [[m:GetoptLong::OPTIONAL_ARGUMENT]]
  # のいずれかでなくてはなりません。
  # 
  # オプションを設定できるのは、get, get_option, each,
  # each_option メソッドを呼び出す前だけです。これらのメソッドを
  # 呼び出した後でオプションを設定しようとすると、RuntimeError
  # 例外が発生します。
  # 
  # @param arguments オプションを表す配列を指定します。
  # 
  # @raise ArgumentError 不正な引数が与えられるた場合、発生します。
  # 
  #     parser.set_options(['-d', '--debug', GetoptLong::NO_ARGUMENT],
  #                        ['--version',     GetoptLong::NO_ARGUMENT],
  #                        ['--help',        GetoptLong::NO_ARGUMENT])
  # 
  # オプション名と引数のフラグの順番に決まりはないので、次のような
  # 形式でも構いません。
  # 
  #     parser.set_options([GetoptLong::NO_ARGUMENT, '-d', '--debug'],
  #                        [GetoptLong::NO_ARGUMENT, '--version'],
  #                        [GetoptLong::NO_ARGUMENT, '--help'])
  def set_options; end

  # --- terminate -> self
  # オプションの処理を、強制的に終了させます。ただし、エラーが起き
  # ている状態でこのメソッドを起動しても、終了させることはできません。
  # 
  # すでにオプションの処理が終了しているときは、このメソッドは何も行いません。
  # 
  # @raise RuntimeError エラーが起きている状態でこのメソッドを起動すると、発生します
  def terminate; end

  # --- terminated? -> true | false
  # エラーが起きずにオプションの処理が終了しているときは真が
  # 返ります。それ以外のときは、偽が返ります。
  def terminated?; end

  # --- new(*arguments)
  # 
  # GetoptLong のオブジェクトを生成します。引数が与えられ
  # たときは、それを [[m:GetoptLong#set_options]] メソッドに渡します。
  # 
  # @param arguments オプションを定義するための配列の配列を指定します。
  # 
  # @see [[m:GetoptLong#set_options]]
  def new; end

  # --- ARGUMENT_FLAGS -> Array
  # 
  # 内部で使用する定数です。
  # 
  # [[m:GetoptLong::NO_ARGUMENT]], [[m:GetoptLong::REQUIRE_ARGUMENT]],
  # [[m:GetoptLong::OPTIONAL_ARGUMENT]] がセットされています。
  def ARGUMENT_FLAGS; end

  # --- NO_ARGUMENT -> 0
  # 
  # オプションに引数が無いことを表す定数です。
  def NO_ARGUMENT; end

  # --- OPTIONAL_ARGUMENT -> 2
  # 
  # オプションにはオプショナル引数があることを表す定数です。
  def OPTIONAL_ARGUMENT; end

  # --- ORDERINGS -> Array
  # 
  # 内部で使用する定数です。
  # 
  # [[m:GetoptLong::REQUIRE_ORDER]], [[m:GetoptLong::PERMUTE]],
  # [[m:GetoptLong::RETURN_IN_ORDER]] がセットされています。
  def ORDERINGS; end

  # --- PERMUTE -> 1
  # コマンド行引数の内容を、走査した順に入れ替え、最終的にはすべての非オプ
  # ションを末尾に寄せます。この方式では、オプションはどの順序で書いても良
  # いことになります。これは、たとえプログラム側でそうなることを期待しなく
  # ても、そうなります。この方式がデフォルトです。
  def PERMUTE; end

  # --- REQUIRED_ARGUMENT -> 1
  # 
  # オプションに必須引数があることを表す定数です。
  def REQUIRED_ARGUMENT; end

  # --- REQUIRE_ORDER -> 0
  # 非オプション引数の後に来たオプションは、オプションとして認識しません。
  # 最初に非オプション引数が現れた時点で、オプションの解析処理を中止します。
  def REQUIRE_ORDER; end

  # --- RETURN_IN_ORDER -> 2
  # オプションと他の非オプション引数はどんな順序で並んでも良いが、お互いの
  # 順序は保持したままにしたいというプログラムのための形式です。
  def RETURN_IN_ORDER; end

  # --- STATUS_STARTED    -> 1
  # 
  # 内部状態を管理するための定数です。ユーザが使用することはありません。
  def STATUS_STARTED; end

  # --- STATUS_TERMINATED -> 2
  # 
  # 内部状態を管理するための定数です。ユーザが使用することはありません。
  def STATUS_TERMINATED; end

  # --- STATUS_YET        -> 0
  # 
  # 内部状態を管理するための定数です。ユーザが使用することはありません。
  def STATUS_YET; end

end
