module Psych
  # --- dump(o, options = {}) -> String
  # --- dump(o, io, options = {}) -> ()
  # Ruby のオブジェクト o を YAML ドキュメントに変換します。
  # 
  # io に IO オブジェクトを指定した場合は、変換されたドキュメントが
  # その IO に書き込まれます。
  # 指定しなかった場合は変換されたドキュメントが文字列としてメソッドの返り値と
  # なります。
  # 
  # options で出力に関するオプションを以下の指定できます。
  # 
  # : :version
  #   YAML document に付加するバージョンを [major, minor] という配列、
  #   もしくは文字列で指定します
  # : :header
  #   出力にヘッダを付けるかどうかを真偽値で指定します
  # : :indentation
  #   インデントのレベルを 1 から 9 までの整数で指定します
  # : :canonical
  #   出力の style が canonical であるかどうかを真偽値で指定します
  # : :line_width
  #   「好ましい」行幅を整数値で指定します
  # 
  # @param o 変換するオブジェクト
  # @param io 出力先
  # @param options 出力オプション
  # 
  # //emlist[例][ruby]{
  # # Dump an array, get back a YAML string
  # Psych.dump(['a', 'b'])  # => "---\n- a\n- b\n"
  # 
  # # Dump an array to an IO object
  # Psych.dump(['a', 'b'], StringIO.new)  # => #<StringIO:0x000001009d0890>
  # 
  # # Dump an array with indentation set
  # Psych.dump(['a', ['b']], :indentation => 3) # => "---\n- a\n-  - b\n"
  # 
  # # Dump an array to an IO with indentation set
  # Psych.dump(['a', ['b']], StringIO.new, :indentation => 3)
  # //}
  def dump; end

  # --- dump_stream(*objects) -> String
  # オブジェクト列を YAML ドキュメント列に変換します。
  # 
  # @param objects 変換対象のオブジェクト列
  # 
  # //emlist[例][ruby]{
  # Psych.dump_stream("foo\n  ", {}) # => "--- ! \"foo\\n  \"\n--- {}\n"
  # //}
  def dump_stream; end

  # --- libyaml_version -> [Integer, Integer, Integer]
  # libyaml のバージョンを返します。
  # 
  # [major, minor patch-level] という 3 つの整数からなる配列を返します。
  # 
  # @see [[m:Psych::LIBYAML_VERSION]]
  def libyaml_version; end

  # --- load(yaml, filename = nil, fallback: false, symbolize_names: false) -> object
  # 
  # YAML ドキュメントを Ruby のデータ構造(オブジェクト)に変換します。
  # 
  # 入力に複数のドキュメントが含まれている場合は、先頭のものを変換して
  # 返します。
  # 
  # filename はパース中に発生した例外のメッセージに用います。
  # 
  # 
  # @param yaml YAML ドキュメント(文字列 or IO オブジェクト)
  # @param filename [[c:Psych::SyntaxError]] 発生時にファイル名として表示する文字列。
  # @param fallback 引数 yaml に空のYAMLを指定した場合の戻り値を指定します。デフォルトは false です。
  # @param symbolize_names ハッシュ(YAMLの仕様では正確にはマッピング)のキー
  #                        を [[c:Symbol]] に変換するかどうかを指定します。
  #                        true を指定した場合は変換します。デフォルトでは
  #                        文字列に変換されます。
  # @raise Psych::SyntaxError YAMLドキュメントに文法エラーが発見されたときに発生します
  # @see [[m:Psych.parse]]
  # 
  # //emlist[例][ruby]{
  # Psych.load("--- a")           # => 'a'
  # Psych.load("---\n - a\n - b") # => ['a', 'b']
  # 
  # begin
  #   Psych.load("--- `", "file.txt")
  # rescue Psych::SyntaxError => ex
  #   p ex.file    # => 'file.txt'
  #   p ex.message # => "(file.txt): found character that cannot start any token while scanning for the next token at line 1 column 5"
  # end
  # //}
  # 
  # キーワード引数 symbolize_names に true を指定した場合はハッシュのキー
  # を [[c:Symbol]] に変換して返します。
  # 
  # //emlist[例][ruby]{
  # Psych.load("---\n foo: bar")                         # => {"foo"=>"bar"}
  # Psych.load("---\n foo: bar", symbolize_names: true)  # => {:foo=>"bar"}
  # //}
  def load; end

  # --- load_file(filename) -> object
  # filename で指定したファイルを YAML ドキュメントとして
  # Ruby のオブジェクトに変換します。
  # 
  # @param filename ファイル名
  # @raise Psych::SyntaxError YAMLドキュメントに文法エラーが発見されたときに発生します
  def load_file; end

  # --- load_stream(yaml, filename=nil) -> [object]
  # --- load_stream(yaml, filename=nil){|obj| ... } -> ()
  # 複数の YAML ドキュメントを含むデータを
  # Ruby のオブジェクトに変換します。
  # 
  # ブロックなしの場合はオブジェクトの配列を返します。
  # 
  # //emlist[例][ruby]{
  # Psych.load_stream("--- foo\n...\n--- bar\n...") # => ['foo', 'bar']
  # //}
  # 
  # ブロックありの場合は各オブジェクト引数としてそのブロックを呼び出します。
  # 
  # //emlist[例][ruby]{
  # list = []
  # Psych.load_stream("--- foo\n...\n--- bar\n...") do |ruby|
  #   list << ruby
  # end
  # list # => ['foo', 'bar']
  # //}
  # 
  # filename はパース中に発生した例外のメッセージに用います。
  # 
  # @param yaml YAML ドキュメント(文字列 or IO オブジェクト)
  # @param filename [[c:Psych::SyntaxError]] 発生時にファイル名として表示する文字列。
  # @raise Psych::SyntaxError YAMLドキュメントに文法エラーが発見されたときに発生します
  def load_stream; end

  # --- parse(yaml, filename = nil) -> Psych::Nodes::Document
  # YAML ドキュメントをパースし、YAML の AST を返します。
  # 
  # 入力に複数のドキュメントが含まれている場合は、先頭のものを AST に変換して
  # 返します。
  # 
  # filename はパース中に発生した例外のメッセージに用います。
  # 
  # AST については [[c:Psych::Nodes]] を参照してください。
  # 
  # @param yaml YAML ドキュメント(文字列 or IO オブジェクト)
  # @param filename [[c:Psych::SyntaxError]] 発生時にファイル名として表示する文字列。
  # @raise Psych::SyntaxError YAMLドキュメントに文法エラーが発見されたときに発生します
  # @see [[m:Psych.load]]
  # 
  # //emlist[例][ruby]{
  # Psych.parse("---\n - a\n - b") # => #<Psych::Nodes::Document:...>
  # 
  # begin
  #   Psych.parse("--- `", "file.txt")
  # rescue Psych::SyntaxError => ex
  #   p ex.file    # => 'file.txt'
  #   p ex.message # => "(file.txt): found character that cannot start any token while scanning for the next token at line 1 column 5"
  # end
  # //}
  def parse; end

  # --- parse_file(filename) -> Psych::Nodes::Document
  # filename で指定したファイルをパースして YAML の AST を返します。
  # 
  # @param filename パースするファイルの名前
  # @raise Psych::SyntaxError YAMLドキュメントに文法エラーが発見されたときに発生します
  def parse_file; end

  # --- parse_stream(yaml) -> Psych::Nodes::Stream
  # --- parse_stream(yaml){|node| ... } -> ()
  # 
  # YAML ドキュメントをパースします。
  # yaml が 複数の YAML ドキュメントを含む場合を取り扱うことができます。
  # 
  # ブロックなしの場合は YAML の AST (すべての YAML ドキュメントを
  # 保持した [[c:Psych::Nodes::Stream]] オブジェクト)を返します。
  # 
  # ブロック付きの場合は、そのブロックに最初の YAML ドキュメント
  # の Psych::Nodes::Document オブジェクトが渡されます。
  # この場合の返り値には意味がありません。
  # 
  # 
  # @see [[c:Psych::Nodes]]
  # 
  # //emlist[例][ruby]{
  # Psych.parse_stream("---\n - a\n - b") # => #<Psych::Nodes::Stream:0x00>
  # //}
  def parse_stream; end

  # --- parser -> Psych::Parser
  # デフォルトで使われるのパーサを返します。
  def parser; end

  # --- safe_load(yaml, whitelist_classes = [], whitelist_symbols = [], aliases = false, filename = nil, symbolize_names: false) -> object
  # 
  # 安全に YAML フォーマットの文書を読み込み Ruby のオブジェクトを生成して返します。
  # 
  # デフォルトでは以下のクラスのオブジェクトしか変換しません。
  # 
  #  * TrueClass
  #  * FalseClass
  #  * NilClass
  #  * Numeric
  #  * String
  #  * Array
  #  * Hash
  # 
  # 再帰的なデータ構造はデフォルトでは許可されていません。
  # 任意のクラスを許可するには whitelist_classes を指定すると、
  # そのクラスが追加されます。例えば Date クラスを許可するには
  # 以下のように書いてください:
  # 
  # //emlist[][ruby]{
  # Psych.safe_load(yaml, [Date])
  # //}
  # 
  # すると上のクラス一覧に加えて Date クラスが読み込まれます。
  # 
  # エイリアスは aliases パラメーターを変更することで明示的に許可できます。
  # 
  # //emlist[例][ruby]{
  # x = []
  # x << x
  # yaml = Psych.dump x
  # Psych.safe_load yaml               # => 例外発生
  # Psych.safe_load yaml, [], [], true # => エイリアスが読み込まれる
  # //}
  # 
  # yaml にホワイトリストにないクラスが含まれていた場合は、
  # Psych::DisallowedClass 例外が発生します。
  # 
  # yaml がエイリアスを含んでいて aliases パラメーターが false の時、
  # Psych::BadAlias 例外が発生します。
  # 
  # filename はパース中に発生した例外のメッセージに用います。
  # 
  # キーワード引数 symbolize_names に true を指定した場合はハッシュのキー
  # を [[c:Symbol]] に変換して返します。
  # 
  # //emlist[例][ruby]{
  # Psych.safe_load("---\n foo: bar")                         # => {"foo"=>"bar"}
  # Psych.safe_load("---\n foo: bar", symbolize_names: true)  # => {:foo=>"bar"}
  # //}
  # 
  # @param io YAMLフォーマットの文書の読み込み先のIOオブジェクト。
  # @param whitelist_classes 追加で読み込みを許可するクラスの配列。
  # @param whitelist_symbols 引数 whitelist_classesに [[c:Symbol]] を含む場
  #                          合に読み込みを許可する [[c:Symbol]] の配列。
  #                          省略した場合は全ての [[c:Symbol]] を許可します。
  # @param aliases エイリアスの読み込みを許可するかどうか。
  # @param filename [[c:Psych::SyntaxError]] 発生時にファイル名として表示する文字列。
  # @param symbolize_names ハッシュ(YAMLの仕様では正確にはマッピング)のキー
  #                        を [[c:Symbol]] に変換するかどうかを指定します。
  #                        true を指定した場合は変換します。デフォルトでは
  #                        文字列に変換されます。
  def safe_load; end

  # --- to_json(o) -> String
  # Ruby のオブジェクト o を JSON の文字列に変換します。
  # 
  # @param o 変換対象となるオブジェクト
  def to_json; end

  # --- LIBYAML_VERSION -> String
  # libyaml のバージョン。
  def LIBYAML_VERSION; end

  # --- VERSION -> String
  # Psych のバージョン。
  def VERSION; end

end
