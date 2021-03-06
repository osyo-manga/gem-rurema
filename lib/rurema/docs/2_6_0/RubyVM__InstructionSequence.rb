class RubyVM::InstructionSequence
  # --- absolute_path -> String | nil
  # 
  # self が表す命令シーケンスの絶対パスを返します。
  # 
  # self を文字列から作成していた場合は nil を返します。
  # 
  # 例1:irb で実行した場合
  # 
  #   iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  #   # => <RubyVM::InstructionSequence:<compiled>@<compiled>>
  #   iseq.absolute_path
  #   # => nil
  # 
  # 例2: [[m:RubyVM::InstructionSequence.compile_file]] を使用した場合
  # 
  #   # /tmp/method.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   # irb
  #   > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb')
  #   > iseq.absolute_path # => "/tmp/method.rb"
  # 
  # @see [[m:RubyVM::InstructionSequence#path]]
  def absolute_path; end

  # --- base_label -> String
  # 
  # self が表す命令シーケンスの基本ラベルを返します。
  # 
  # 例1:irb で実行した場合
  # 
  #   iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  #   # => <RubyVM::InstructionSequence:<compiled>@<compiled>>
  #   iseq.base_label
  #   # => "<compiled>"
  # 
  # 例2: [[m:RubyVM::InstructionSequence.compile_file]] を使用した場合
  # 
  #   # /tmp/method.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   # irb
  #   > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb')
  #   > iseq.base_label # => "<main>"
  # 
  # 例3:
  # 
  #   # /tmp/method2.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   RubyVM::InstructionSequence.of(method(:hello)).base_label
  #   # => "hello"
  # 
  # @see [[m:RubyVM::InstructionSequence#label]]
  def base_label; end

  # --- disasm      -> String
  # --- disassemble -> String
  # 
  # self が表す命令シーケンスを人間が読める形式の文字列に変換して返します。
  # 
  #   puts RubyVM::InstructionSequence.compile('1 + 2').disasm
  # 
  # 出力:
  # 
  #   == disasm: <RubyVM::InstructionSequence:<compiled>@<compiled>>==========
  #   0000 trace            1                                               (   1)
  #   0002 putobject        1
  #   0004 putobject        2
  #   0006 opt_plus         <ic:1>
  #   0008 leave
  # 
  # @see [[m:RubyVM::InstructionSequence.disasm]]
  def disasm; end

  # --- eval -> object
  # 
  # self の命令シーケンスを評価してその結果を返します。
  # 
  #     RubyVM::InstructionSequence.compile("1 + 2").eval # => 3
  def eval; end

  # --- first_lineno -> Integer
  # 
  # self が表す命令シーケンスの 1 行目の行番号を返します。
  # 
  # 例1:irb で実行した場合
  # 
  #   RubyVM::InstructionSequence.compile('num = 1 + 2').first_lineno
  #   # => 1
  # 
  # 例2:
  # 
  #   # /tmp/method.rb
  #   require "foo-library"
  #   def foo
  #     p :foo
  #   end
  # 
  #   RubyVM::InstructionSequence.of(method(:foo)).first_lineno
  #   # => 2
  def first_lineno; end

  # --- inspect -> String
  # 
  # self の情報をラベルとパスを含んだ人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  # iseq.inspect # => "<RubyVM::InstructionSequence:<compiled>@<compiled>>"
  # //}
  # 
  # @see [[m:RubyVM::InstructionSequence#label]],
  #      [[m:RubyVM::InstructionSequence#path]]
  def inspect; end

  # --- label -> String
  # 
  # self が表す命令シーケンスのラベルを返します。通常、メソッド名、クラス名、
  # モジュール名などで構成されます。
  # 
  # トップレベルでは "<main>" を返します。self を文字列から作成していた場合
  # は "<compiled>" を返します。
  # 
  # 例1:irb で実行した場合
  # 
  #   iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  #   # => <RubyVM::InstructionSequence:<compiled>@<compiled>>
  #   iseq.label
  #   # => "<compiled>"
  # 
  # 例2: [[m:RubyVM::InstructionSequence.compile_file]] を使用した場合
  # 
  #   # /tmp/method.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   # irb
  #   > iseq = RubyVM::InstructionSequence.compile_file('/tmp/method.rb')
  #   > iseq.label # => "<main>"
  # 
  # 例3:
  # 
  #   # /tmp/method2.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   RubyVM::InstructionSequence.of(method(:hello)).label
  #   # => "hello"
  # 
  # @see [[m:RubyVM::InstructionSequence#base_label]]
  def label; end

  # --- path -> String
  # 
  # self が表す命令シーケンスの相対パスを返します。
  # 
  # self の作成時に指定した文字列を返します。self を文字列から作成していた
  # 場合は "<compiled>" を返します。
  # 
  # 例1:irb で実行した場合
  # 
  #   iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  #   # => <RubyVM::InstructionSequence:<compiled>@<compiled>>
  #   iseq.path
  #   # => "<compiled>"
  # 
  # 例2: [[m:RubyVM::InstructionSequence.compile_file]] を使用した場合
  # 
  #   # /tmp/method.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   # irb
  #   > iseq = RubyVM::InstructionSequence.compile_file('method.rb')
  #   > iseq.path # => "method.rb"
  # 
  # @see [[m:RubyVM::InstructionSequence#absolute_path]]
  def path; end

  # --- to_a -> Array
  # 
  # self の情報を 14 要素の配列にして返します。
  # 
  # 命令シーケンスを以下の情報で表します。
  # 
  # : magic
  # 
  #   データフォーマットを示す文字列。常に
  #   "YARVInstructionSequence/SimpleDataFormat"。
  # 
  # : major_version
  # 
  #   命令シーケンスのメジャーバージョン。
  # 
  # : minor_version
  # 
  #   命令シーケンスのマイナーバージョン。
  # 
  # : format_type
  # 
  #   データフォーマットを示す数値。常に 1。
  # 
  # : misc
  # 
  #   以下の要素から構成される [[c:Hash]] オブジェクト。
  # 
  #   :arg_size： メソッド、ブロックが取る引数の総数(1 つもない場合は 0)。
  # 
  #   :local_size： ローカル変数の総数 + 1。
  # 
  #   :stack_max： スタックの深さ。([[c:SystemStackError]] を検出するために使用)
  # 
  # : #label
  # 
  #   メソッド名、クラス名、モジュール名などで構成される命令シーケンスのラ
  #   ベル。トップレベルでは "<main>"。文字列から作成していた場合は
  #   "<compiled>"。
  # 
  # : #path
  # 
  #   命令シーケンスの相対パス。文字列から作成していた場合は "<compiled>"。
  # 
  # : #absolute_path
  # 
  #   命令シーケンスの絶対パス。文字列から作成していた場合は nil。
  # 
  # : #first_lineno
  # 
  #   命令シーケンスの 1 行目の行番号。
  # 
  # : type
  # 
  #   命令シーケンスの種別。
  #   :top、:method、:block、:class、:rescue、:ensure、:eval、:main、
  #   :defined_guard のいずれか。
  # 
  # : locals
  # 
  #   全ての引数名、ローカル変数名からなる [[c:Symbol]] の配列。
  # 
  # : args
  # 
  #   引数の指定が必須のメソッド、ブロックの引数の個数。あるいは以下のよう
  #   な配列。
  # 
  #     [required_argc, [optional_arg_labels, ...],
  #      splat_index, post_splat_argc, post_splat_index,
  #      block_index, simple]
  # 
  #   より詳細な情報については、vm_core.h を参照。
  # 
  # : catch_table
  # 
  #   例外や制御構造のオペレータ(rescue、next、redo、break など)の一覧。
  # 
  # : bytecode
  # 
  #   命令シーケンスを構成する命令とオペランドの配列の配列。
  # 
  # 
  # //emlist[例][ruby]{
  # require 'pp'
  # 
  # iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  # pp iseq.to_a
  # # ※ Ruby 2.5.0 での実行結果
  # # => ["YARVInstructionSequence/SimpleDataFormat",
  # # 2,
  # # 0,
  # # 1,
  # # {:arg_size=>0, :local_size=>2, :stack_max=>2},
  # # "<compiled>",
  # # "<compiled>",
  # # nil,
  # # 1,
  # # :top,
  # # [:num],
  # # 0,
  # # [],
  # # [1,
  # #  [:trace, 1],
  # #  [:putobject_OP_INT2FIX_O_1_C_],
  # #  [:putobject, 2],
  # #  [:opt_plus, {:mid=>:+, :flag=>256, :orig_argc=>1, :blockptr=>nil}],
  # #  [:dup],
  # #  [:setlocal_OP__WC__0, 2],
  # #  [:leave]]]
  # //}
  def to_a; end

  # --- to_binary(extra_data = nil) -> String
  # 
  # バイナリフォーマットでシリアライズされたiseqのデータを文字列として返します。
  # [[m:RubyVM::InstructionSequence.load_from_binary]] メソッドでバイナリデータに対応するiseqオブジェクトを作れます。
  # 
  # 引数の extra_data はバイナリデータと共に保存されます。
  # [[m:RubyVM::InstructionSequence.load_from_binary_extra_data]] メソッドでこの文字列にアクセス出来ます。
  # 
  # 注意: 変換後のバイナリデータはポータブルではありません。 to_binary で得たバイナリデータは他のマシンに移動できません。他のバージョンや他のアーキテクチャのRubyで作られたバイナリデータは使用できません。
  # 
  # //emlist[例][ruby]{
  # iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  # iseq.to_binary("extra_data")
  # 
  # # ※表示の都合上改行しているが実際は改行はない
  # # => "YARB\x02\x00\x00\x00\x03\x00\x00\x00\x16\x02\x00\x00\n\x00\x00\x00\x01
  # # \x00\x00\x00\x03\x00\x00\x00\x05\x00\x00\x00\x84\x01\x00\x00\x88\x01\x00
  # # \x00\x02\x02\x00\x00x86_64-darwin15\x00*\x00\x00\x00\x00\x00\x00\x00\x01
  # # \x00\x00\x00\x00\x00\x00\x00\\\x00\x00\x00\x00\x00\x00\x00\x0F\x00\x00\x00
  # # \x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00=\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1F
  # # \x00\x00\x00\x00\x00\x00\x00Y\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00
  # # \x00\x00\x00\x003\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00
  # # \x00\x01\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x10
  # # \x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\f\x00\x00\x00<\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00
  # # \x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00
  # # \x00\x00\x9C\x00\x00\x00\x00\x00\x00\x00\xA4\x00\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xAC\x00\x00\x00
  # # \x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00
  # # \x01\x00\x00\x00\x02\x00\x00\x00\xBC\x00\x00\x00\x00\x00\x00\x00\x00\x00
  # # \x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00
  # # \xF1\x7F\x00\x00\b\x00\x00\x00\x00\x00\x00\x00E\x7F\x00\x00\x02\x00\x00\x00
  # # \x00\x00\x00\x00\n\x00\x00\x00\x00\x00\x00\x00<compiled>\xF5\x7F\x00\x00
  # # \x05\x00\x00\x00\x00\x00\x00\x00E\x7F\x00\x00\x02\x00\x00\x00\x00\x00\x00
  # # \x00\x03\x00\x00\x00\x00\x00\x00\x00numE\x7F\x00\x00\x02\x00\x00\x00\x00
  # # \x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00+\xA0\x01\x00\x00\xAC\x01\x00
  # # \x00\xCA\x01\x00\x00\xD6\x01\x00\x00\xED\x01\x00\x00extra_data"
  # //}
  # 
  # @see [[m:RubyVM::InstructionSequence.load_from_binary]]
  # @see [[m:RubyVM::InstructionSequence.load_from_binary_extra_data]]
  def to_binary; end

  # --- compile(source, file = nil, path = nil, line = 1, options = nil) -> RubyVM::InstructionSequence
  # --- new(source, file = nil, path = nil, line = 1, options = nil) -> RubyVM::InstructionSequence
  # 
  # 引数 source で指定した Ruby のソースコードを元にコンパイル済みの
  # [[c:RubyVM::InstructionSequence]] オブジェクトを作成して返します。
  # 
  # @param source Ruby のソースコードを文字列で指定します。
  # 
  # @param file ファイル名を文字列で指定します。
  # 
  # @param path 引数 file の絶対パスファイル名を文字列で指定します。
  # 
  # @param line 引数 source の 1 行目の行番号を指定します。
  # 
  # @param options コンパイル時のオプションを true、false、[[c:Hash]] オブ
  #                ジェクトのいずれかで指定します。詳細は
  #                [[m:RubyVM::InstructionSequence.compile_option=]] を参照
  #                してください。
  # 
  #   RubyVM::InstructionSequence.compile("a = 1 + 2")
  #   # => <RubyVM::InstructionSequence:<compiled>@<compiled>>
  # 
  # @see [[m:RubyVM::InstructionSequence.compile_file]]
  def compile; end

  # --- compile_file(file, options = nil) -> RubyVM::InstructionSequence
  # 
  # 引数 file で指定した Ruby のソースコードを元にコンパイル済みの
  # [[c:RubyVM::InstructionSequence]] オブジェクトを作成して返します。
  # 
  # [[m:RubyVM::InstructionSequence.compile]] とは異なり、file、path などの
  # メタデータは自動的に取得します。
  # 
  # @param file ファイル名を文字列で指定します。
  # 
  # @param options コンパイル時のオプションを true、false、[[c:Hash]] オブ
  #                ジェクトのいずれかで指定します。詳細は
  #                [[m:RubyVM::InstructionSequence.compile_option=]] を参照
  #                してください。
  # 
  #   # /tmp/hello.rb
  #   puts "Hello, world!"
  # 
  #   # irb
  #   RubyVM::InstructionSequence.compile_file("/tmp/hello.rb")
  #   # => <RubyVM::InstructionSequence:<main>@/tmp/hello.rb>
  # 
  # @see [[m:RubyVM::InstructionSequence.compile]]
  def compile_file; end

  # --- compile_option -> Hash
  # 
  # 命令シーケンスのコンパイル時のデフォルトの最適化オプションを Hash で返
  # します。
  # 
  # //emlist[例][ruby]{
  # require "pp"
  # pp RubyVM::InstructionSequence.compile_option
  # 
  # # => {:inline_const_cache=>true,
  # # :peephole_optimization=>true,
  # # :tailcall_optimization=>false,
  # # :specialized_instruction=>true,
  # # :operands_unification=>true,
  # # :instructions_unification=>false,
  # # :stack_caching=>false,
  # # :trace_instruction=>true,
  # # :frozen_string_literal=>false,
  # # :debug_frozen_string_literal=>false,
  # # :coverage_enabled=>true,
  # # :debug_level=>0}
  # //}
  # 
  # @see [[m:RubyVM::InstructionSequence.compile_option=]]
  def compile_option; end

  # --- compile_option=(options)
  # 
  # 命令シーケンスのコンパイル時のデフォルトの最適化オプションを引数
  # options で指定します。
  # 
  # @param options コンパイル時の最適化オプションを true、false、nil、
  #                [[c:Hash]] のいずれかで指定します。true を指定した場合は
  #                全てのオプションを有効にします。false を指定した場合は全
  #                てのオプションを無効にします。nil を指定した場合はいずれ
  #                のオプションも変更しません。また、[[c:Hash]] を指定した
  #                場合は以下のキーに対して、true か false を指定する事で個
  #                別に有効、無効を指定します。
  # //emlist{
  #   * :inline_const_cache
  #   * :instructions_unification
  #   * :operands_unification
  #   * :peephole_optimization
  #   * :specialized_instruction
  #   * :stack_caching
  #   * :tailcall_optimization
  #   * :trace_instruction
  # //}
  #                :debug_level をキーに指定した場合は値を数値で指定します。
  # 
  # .new、.compile、.compile_file メソッドの実行の際に option 引数を指定し
  # た場合はその実行のみ最適化オプションを変更する事もできます。
  # 
  # @see [[m:RubyVM::InstructionSequence.new]],
  #      [[m:RubyVM::InstructionSequence.compile]],
  #      [[m:RubyVM::InstructionSequence.compile_file]]
  def compile_option=; end

  # --- disasm(body)      -> String
  # --- disassemble(body) -> String
  # 
  # 引数 body で指定したオブジェクトから作成した
  # [[c:RubyVM::InstructionSequence]] オブジェクトを人間が読める形式の文字
  # 列に変換して返します。
  # 
  # @param body [[c:Proc]]、[[c:Method]] オブジェクトを指定します。
  # 
  # 例1:[[c:Proc]] オブジェクトを指定した場合
  # 
  #   # /tmp/proc.rb
  #   p = proc { num = 1 + 2 }
  #   puts RubyVM::InstructionSequence.disasm(p)
  # 
  # 出力:
  # 
  #   == disasm: <RubyVM::InstructionSequence:block in <main>@/tmp/proc.rb>===
  #   == catch table
  #   | catch type: redo   st: 0000 ed: 0012 sp: 0000 cont: 0000
  #   | catch type: next   st: 0000 ed: 0012 sp: 0000 cont: 0012
  #   |------------------------------------------------------------------------
  #   local table (size: 2, argc: 0 [opts: 0, rest: -1, post: 0, block: -1] s1)
  #   [ 2] num
  #   0000 trace            1                                               (   1)
  #   0002 putobject        1
  #   0004 putobject        2
  #   0006 opt_plus         <ic:1>
  #   0008 dup
  #   0009 setlocal         num, 0
  #   0012 leave
  # 
  # 例2:[[c:Method]] オブジェクトを指定した場合
  # 
  #   # /tmp/method.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   puts RubyVM::InstructionSequence.disasm(method(:hello))
  # 
  # 出力:
  # 
  #   == disasm: <RubyVM::InstructionSequence:hello@/tmp/method.rb>============
  #   0000 trace            8                                               (   1)
  #   0002 trace            1                                               (   2)
  #   0004 putself
  #   0005 putstring        "hello, world"
  #   0007 send             :puts, 1, nil, 8, <ic:0>
  #   0013 trace            16                                              (   3)
  #   0015 leave                                                            (   2)
  # 
  # @see [[m:RubyVM::InstructionSequence#disasm]]
  def disasm; end

  # --- load_from_binary(binary) -> RubyVM::InstructionSequence
  # 
  # [[m:RubyVM::InstructionSequence#to_binary]]により作られたバイナリフォーマットの文字列からiseqのオブジェクトをロードします。
  # 
  # このローダーは検証機構をもっておらず、壊れたり改変されたバイナリを読み込むと深刻な問題を引き起こします。
  # 
  # 他者により提供されたバイナリデータはロードすべきではありません。自分が変換したバイナリデータを使うべきです。
  # 
  # //emlist[例][ruby]{
  # iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  # binary = iseq.to_binary
  # RubyVM::InstructionSequence.load_from_binary(binary).eval # => 3
  # //}
  # 
  # @see [[m:RubyVM::InstructionSequence#to_binary]]
  def load_from_binary; end

  # --- load_from_binary_extra_data(binary) -> String
  # 
  # バイナリフォーマットの文字列から埋め込まれたextra_dataを取り出します。
  # 
  # //emlist[例][ruby]{
  # iseq = RubyVM::InstructionSequence.compile('num = 1 + 2')
  # binary = iseq.to_binary("extra_data")
  # RubyVM::InstructionSequence.load_from_binary_extra_data(binary) # => extra_data
  # //}
  # 
  # @see [[m:RubyVM::InstructionSequence#to_binary]]
  def load_from_binary_extra_data; end

  # --- of(body) -> RubyVM::InstructionSequence
  # 
  # 引数 body で指定した [[c:Proc]]、[[c:Method]] オブジェクトを元に
  # [[c:RubyVM::InstructionSequence]] オブジェクトを作成して返します。
  # 
  # @param body [[c:Proc]]、[[c:Method]] オブジェクトを指定します。
  # 
  # 例1:irb で実行した場合
  # 
  #   # proc
  #   > p = proc { num = 1 + 2 }
  #   > RubyVM::InstructionSequence.of(p)
  #   > # => <RubyVM::InstructionSequence:block in irb_binding@(irb)>
  # 
  #   # method
  #   > def foo(bar); puts bar; end
  #   > RubyVM::InstructionSequence.of(method(:foo))
  #   > # => <RubyVM::InstructionSequence:foo@(irb)>
  # 
  # 例2: [[m:RubyVM::InstructionSequence.compile_file]] を使用した場合
  # 
  #   # /tmp/iseq_of.rb
  #   def hello
  #     puts "hello, world"
  #   end
  # 
  #   $a_global_proc = proc { str = 'a' + 'b' }
  # 
  #   # irb
  #   > require '/tmp/iseq_of.rb'
  # 
  #   # hello メソッド
  #   > RubyVM::InstructionSequence.of(method(:hello))
  #   > # => #<RubyVM::InstructionSequence:0x007fb73d7cb1d0>
  # 
  #   # グローバル proc
  #   > RubyVM::InstructionSequence.of($a_global_proc)
  #   > # => #<RubyVM::InstructionSequence:0x007fb73d7caf78>
  def of; end

end
