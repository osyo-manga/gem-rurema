class Psych::Handler
  # --- alias(anchor) -> ()
  # anchor という名前の alias を見付けたときに呼び出されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param anchor aliasのアンカー文字列
  # 
  # === 例
  # 
  # 以下の YAMLドキュメントは自分自身への参照を持つ配列を表しています。
  # 
  #   --- &ponies
  #   - first element
  #   - *ponies
  # 
  # この &ponies が anchor で *ponies が alias です。この場合、
  # alias メソッドは "poines" という引数で呼び出されます。
  def alias; end

  # --- empty -> ()
  # 
  # empty event が発生したときに呼び出されます。
  # 
  # 実際問題としてこれが呼び出される例は知られていません。
  def empty; end

  # --- end_document(implicit) -> ()
  # ドキュメントが終了したときに呼び出されます。
  # 
  # ドキュメントが implicit に終わったならば implicit には真が渡されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param implicit ドキュメントが implicit に終わったかどうか
  # 
  # === 例
  # 
  # 以下の YAML ドキュメントでは implicit は true です。
  #   ---
  #     hello world
  # 
  # また、以下の YAML ドキュメントでは implicit は false です。
  #   ---
  #     hello world
  #   ...
  def end_document; end

  # --- end_mapping -> ()
  # 
  # mapping の終了の見付けたときに呼び出されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  def end_mapping; end

  # --- end_sequence -> ()
  # 
  # sequence の終了の見付けたときに呼び出されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  def end_sequence; end

  # --- end_stream -> ()
  # 
  # YAML stream の終端を見付けたときに呼び出されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  def end_stream; end

  # --- scalar(value, anchor, tag, plain, quoted, style) -> ()
  # スカラー値を見付けたときに呼び出されます。
  # 
  # value にはスカラー値の文字列が渡されます。
  # 
  # anchor にはスカラー値に関連付けられた anchor の名前が文字列で渡されます。
  # anchor がない場合には nil が渡されます。
  # 
  # tag にはスカラー値に関連付けられた tag の名前が文字列で渡されます。
  # tag がない場合には nil が渡されます。
  # 
  # plain は plain style であるかどうか、quoted は quoted style であるかどうか
  # が渡されます。style には node の style が整数値で渡されます。
  # style は次の値のいずれかです。
  #   * [[m:Psych::Nodes::Scalar::PLAIN]]
  #   * [[m:Psych::Nodes::Scalar::SINGLE_QUOTED]]
  #   * [[m:Psych::Nodes::Scalar::DOUBLE_QUOTED]]
  #   * [[m:Psych::Nodes::Scalar::LITERAL]]
  #   * [[m:Psych::Nodes::Scalar::FOLDED]]
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param value スカラー値
  # @param anchor 関連付けられた anchor の名前
  # @param tag タグ名
  # @param plain plain style であるかどうか
  # @param quoted quoted style であるかどうか
  # @param style スカラーのスタイル
  # 
  # === 例
  # 
  # 以下の YAML ドキュメントには多くのパターンのスカラーが含まれています。
  # 
  #   ---
  #   - !str "foo"
  #   - &anchor fun
  #   - many
  #     lines
  #   - |
  #     many
  #     newlines
  # 
  # この YAML ドキュメントには4つの文字列が含まれています。
  # scalar メソッドは 順に以下の引数で呼び出されます。
  # 
  #   # value               anchor    tag     plain   quoted  style
  #   ["foo",               nil,      "!str", false,  false,  3    ]
  #   ["fun",               "anchor", nil,    true,   false,  1    ]
  #   ["many lines",        nil,      nil,    true,   false,  1    ]
  #   ["many\nnewlines\n",  nil,      nil,    false,  true,   4    ]
  def scalar; end

  # --- start_document(version, tag_directives, implicit) ->()
  # 
  # YAML ドキュメントの始まりで呼び出されます。
  # 
  # version には YAML ドキュメントに宣言されているバージョンが
  # [major, minor] という配列で渡されます。宣言がない場合は空の配列が渡されます。
  # 
  # tag_directives には tag directive の配列が渡されます。
  # それぞれの tag は [prefix, suffix] という配列で表現されます。
  # 
  # implicit にはドキュメントが implicit に始まっているかどうかが
  # 真偽値で渡されます。
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # 
  # @param version バージョン
  # @param tag_directives tag directive の配列
  # @param implicit ドキュメントが implicit に始まっているかどうか
  # 
  # === 例
  # 
  # 以下の YAML に対しては
  #   %YAML 1.1
  #   %TAG ! tag:tenderlovemaking.com,2009:
  #   --- !squee
  # start_document に渡される引数は以下の通りです
  #   version         # => [1, 1]
  #   tag_directives  # => [["!", "tag:tenderlovemaking.com,2009:"]]
  #   implicit        # => false
  # 
  # 以下の YAML に対しては
  #   - x
  #   - y
  # start_document に渡される引数は以下の通りです。
  #   version         # => []
  #   tag_directives  # => []
  #   implicit        # => true
  def start_document; end

  # --- start_mapping(anchor, tag, implicit, style) -> ()
  # mapping の開始を見付けたときに呼び出されます。
  # 
  # anchor には map に関連付けられた anchor の名前が文字列で渡されます。
  # anchor がない場合には nil が渡されます。
  # 
  # tag には map に関連付けられた tag の名前が文字列で渡されます。
  # tag がない場合には nil が渡されます。
  # 
  # implicit には map が implicit に開始されたかどうかが
  # 真偽値で渡されます。
  # 
  # style には sequence の style が整数値で渡されます。以下のいずれか
  # です。
  #   * [[m:Psych::Nodes::Mapping::BLOCK]]
  #   * [[m:Psych::Nodes::Mapping::FLOW]]
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param anchor 関連付けられた anchor の名前
  # @param tag タグ名
  # @param implicit mapping が implicit に開始されかどうか
  # @param style mapping のスタイル
  # 
  # === 例
  # 
  # 以下の YAML ドキュメントを例として考えます。
  # 
  #   ---
  #   k: !!map { hello: world }
  #   v: &pewpew
  #     hello: world
  # 
  # この YAML ドキュメントには3つの mapping が含まれています。
  # 外側の map の中に 2 つの map が含まれています。
  # start_mapping メソッドは 順に以下の引数で呼び出されます。
  # 
  #   # anchor    tag                       implicit  style
  #   [nil,       nil,                      true,     1     ]
  #   [nil,       "tag:yaml.org,2002:map",  false,    2     ]
  #   ["pewpew",  nil,                      true,     1     ]
  def start_mapping; end

  # --- start_sequence(anchor, tag, implicit, style) -> ()
  # 
  # sequence の開始を見付けたときに呼び出されます。
  # 
  # anchor には sequence に関連付けられた anchor の名前が文字列で渡されます。
  # anchor がない場合には nil が渡されます。
  # 
  # tag には sequence に関連付けられた tag の名前が文字列で渡されます。
  # tag がない場合には nil が渡されます。
  # 
  # implicit には sequence が implicit に開始されたかどうかが
  # 真偽値で渡されます。
  # 
  # style には sequence の style が整数値で渡されます。以下のいずれか
  # です。
  #   * [[m:Psych::Nodes::Sequence::BLOCK]]
  #   * [[m:Psych::Nodes::Sequence::FLOW]]
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param anchor 関連付けられた anchor の名前
  # @param tag タグ名
  # @param implicit sequence が implicit に開始されかどうか
  # @param style sequence のスタイル
  # 
  # === Example
  # 
  # 以下の YAML ドキュメントを例として考えます。
  # 
  #   ---
  #   - !!seq [
  #     a
  #   ]
  #   - &pewpew
  #     - b
  # 
  # この YAML ドキュメントには3つの list が含まれています。
  # 外側の list の中に 2 つの list が含まれています。
  # start_sequence メソッドは 順に以下の引数で呼び出されます。
  # 
  #   # anchor    tag                       implicit  style
  #   [nil,       nil,                      true,     1     ]
  #   [nil,       "tag:yaml.org,2002:seq",  false,    2     ]
  #   ["pewpew",  nil,                      true,     1     ]
  def start_sequence; end

  # --- start_stream(encoding) -> ()
  # 
  # YAML ストリームの始まりで呼び出されます。
  # 
  # encoding にはストリームのエンコーディング(以下のいずれか)が渡されます。
  #   * [[m:Psych::Parser::UTF8]]
  #   * [[m:Psych::Parser::UTF16BE]]
  #   * [[m:Psych::Parser::UTF16LE]]
  # 
  # このメソッドは YAML のストリームごとに呼び出されます。一つのストリームには
  # 複数のドキュメントが含まれている可能性があります。
  # 
  # 必要に応じてこのメソッドを override してください。
  # 
  # @param encoding ストリームのエンコーディング(整数値)
  def start_stream; end

  # --- streaming? -> bool
  # 
  # handler が streaming handler であるならば真を返すように
  # override してください。
  # 
  # デフォルトでは false を返します。
  def streaming?; end

end
