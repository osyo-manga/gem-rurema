class Psych::Nodes::Document
  # --- implicit -> bool
  # ドキュメントが implicit に始まっているかどうかを返します。
  # 
  # @see [[m:Psych::Nodes::Document#implicit=]],
  #      [[m:Psych::Nodes::Document.new]]
  def implicit; end

  # --- implicit=(bool)
  # ドキュメントが implicit に始まっているかどうかを設定します。
  # 
  # @param bool ドキュメントが implicit に始まっているかどうかの設定値
  # @see [[m:Psych::Nodes::Document#implicit]],
  #      [[m:Psych::Nodes::Document.new]]
  def implicit=; end

  # --- implicit_end -> bool
  # ドキュメントが implicit に終わっているかどうかを返します。
  # 
  # オブジェクト生成時のデフォルト値は true です。
  # 
  # @see [[m:Psych::Nodes::Document#implicit_end=]]
  def implicit_end; end

  # --- implicit_end=(bool)
  # ドキュメントが implicit に終わっているかどうかを設定します。
  # 
  # @param bool ドキュメントが implicit に終わっているかどうかの設定値
  # @see [[m:Psych::Nodes::Document#implicit_end]]
  def implicit_end=; end

  # --- root -> Psych::Nodes::Node
  # ルートノードを返します。
  def root; end

  # --- tag_directives -> [[String, String]]
  # tag directive の配列を返します。
  # 
  # @see [[m:Psych::Nodes::Document#tag_directives=]],
  #      [[m:Psych::Nodes::Document.new]]
  def tag_directives; end

  # --- tag_directives=(tags)
  # tag directive の配列を設定します。
  # 
  # @param tags 設定する tag directive の配列
  # @see [[m:Psych::Nodes::Document#tag_directives]],
  #      [[m:Psych::Nodes::Document.new]]
  def tag_directives=; end

  # --- version -> [Integer]
  # YAML ドキュメントのバージョンを返します。
  # 
  # @see [[m:Psych::Nodes::Document#version=]],
  #      [[m:Psych::Nodes::Document.new]]
  def version; end

  # --- version=(ver) 
  # YAML ドキュメントのバージョンを設定します。
  # 
  # @param ver 設定するバージョン
  # @see [[m:Psych::Nodes::Document#version]],
  #      [[m:Psych::Nodes::Document.new]]
  def version=; end

  # --- new(version=[], tag_directives=[], implicit=false) -> Psych::Nodes::Document
  # 
  # Document オブジェクトを生成します。
  # 
  # version にはドキュメントのバージョンを指定します。
  # [major, minor] という配列で指定します。
  # 
  # tag_directives には tag directive の配列を指定します。
  # それぞれの tag は [prefix, suffix] という文字列の配列で
  # 表現します。
  # 
  # implicit にはドキュメントが implicit に始まっているかどうかを
  # 真偽値で指定します。
  # 
  # @param version YAML ドキュメントのバージョン
  # @param tag_directives tag directive の配列
  # @param implicit ドキュメントが implicit に始まっているかどうか
  # 
  # === 例
  # 以下の例では、YAML 1.1  のドキュメントで、
  # tag directive を1つ持ち、 implicit にドキュメントが開始
  # している Document オブジェクトを生成しています。
  # 
  #   Psych::Nodes::Document.new(
  #     [1,1],
  #     [["!", "tag:tenderlovemaking.com,2009:"]],
  #     true)
  # 
  # @see [[m:Psych::Handler#start_document]]
  def new; end

end
