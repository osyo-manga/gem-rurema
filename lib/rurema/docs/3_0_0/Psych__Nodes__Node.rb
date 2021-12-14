class Psych::Nodes::Node
  # --- children -> [Psych::Nodes::Node]
  # 子ノードの集合を配列で返します。
  def children; end

  # --- each -> Enumerator
  # --- each{|node| ... } -> ()
  # 
  # self のノードをルートとする部分木の各ノードを引数として
  # ブロックを呼び出します。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  def each; end

  # --- tag -> String | nil
  # ノードに付加されたタグを返します。
  # 
  # タグが付加されていない場合は nil を返します。
  # 
  #   ast = Psych.parse(<<EOS)
  #   ---
  #   - !!str a
  #   - b
  #   EOS
  #   
  #   p ast.root.children[0].value  # => "a"
  #   p ast.root.children[0].tag    # => "tag:yaml.org,2002:str"
  #   
  #   p ast.root.children[1].value  # => "b"
  #   p ast.root.children[1].tag    # => nil
  def tag; end

  # --- to_ruby -> object
  # --- transform -> object
  # 
  # AST を ruby のオブジェクトに変換します。
  def to_ruby; end

  # --- yaml(io=nil, options={}) -> String | IO
  # --- to_yaml(io=nil, options={}) -> String | IO
  # 
  # AST を YAML ドキュメントに変換します。
  # 
  # io に [[c:IO]] オブジェクトを指定した場合は、その
  # オブジェクトに変換後のドキュメントが書き込まれます。
  # この場合は io を返り値として返します。
  # 
  # io を省略した(nil を指定した)場合には変換後のドキュメントを
  # 文字列で返します。
  # 
  # [[c:Psych::Nodes::Stream]] 以外を変換しようとすると、AST として不正で
  # あるためエラーが発生します。
  # 
  # options には以下が指定できます。
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
  # @param io 書き込み先の IO
  # @param options オプション
  def to_yaml; end

end
