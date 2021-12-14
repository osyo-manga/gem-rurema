class Psych::Visitors::YAMLTree
  # --- push(object)
  # --- <<(object)
  # 変換対象の Ruby オブジェクトを追加します。
  # 
  # @param object YAML AST へ変換する Ruby オブジェクト
  def <<; end

  # --- finish -> Psych::Nodes::Stream|nil
  # 変換を終了し、構築した AST を返します。
  # 
  # このメソッドは2回呼び出さないでください。
  # 
  # @see [[m:Psych::Visitors::YAMLTree#tree]]
  def finish; end

  # --- finished -> bool
  # --- finished? -> bool
  # [[m:Psych::Visitors::YAMLTree#finish]] をすでに呼び出しているならば
  # 真を返します。
  # 
  # まだならば偽を返します。
  def finished; end

  # --- start(encoding = Nodes::Stream::UTF8) -> Psych::Nodes::Stream
  # Ruby オブジェクトから YAML AST への変換のための準備をします。
  # 
  # 
  # [[m:Psych::Visitors::YAMLTree#push]] が呼び出されたとき、
  # まだこのメソッドが呼び出されていなければ push メソッドがこの
  # メソッドを呼び出し、変換の準備をします。
  # 
  # encoding には以下のいずれかを指定できます。
  #   * [[m:Psych::Nodes::Node::UTF8]]
  #   * [[m:Psych::Nodes::Node::UTF16BE]]
  #   * [[m:Psych::Nodes::Node::UTF16LE]]
  # 
  # @param encoding YAML AST に設定するエンコーディング
  def start; end

  # --- started -> bool
  # --- started? -> bool
  # [[m:Psych::Visitors::YAMLTree#start]] をすでに呼び出しているならば
  # 真を返します。
  # 
  # まだならば偽を返します。
  def started; end

  # --- tree -> Psych::Nodes::Stream|nil
  # 変換を終了し、構築した AST を返します。
  # 
  # 内部で finish を呼び出し、変換処理を終了します。
  # 
  # このメソッドを2回以上呼ぶと、2回目以降は nil を返します。
  # 
  # @see [[m:Psych::Visitors::YAMLTree#finish]]
  def tree; end

  # --- new(options = {}, emitter = Psych::TreeBuilder.new, ss = Psych::ScalarScanner.new) -> Psych::Visitors::YAMLTree
  # 
  # YAMLTree オブジェクトを生成します。
  # 
  # options には構築される YAML AST に設定されるオプション設定を指定します。
  # [[m:Psych.dump]] と同じオプションが指定できます。
  # 
  # emitter には AST の構築に使われる [[c:Psych::TreeBuilder]] オブジェクト
  # を渡します。
  # 
  # ss は Ruby の [[c:String]] が YAML document 上で quote が必要かどうか
  # を判定するための [[c:Psych::ScalarScanner]] オブジェクトを渡します。
  # 
  # emitter, ss は通常デフォルトのものから変える必要はないでしょう。
  # 
  # @param options オプション
  # @param emitter AST の構築に使う [[c:Psych::TreeBuilder]] オブジェクト
  # @param ss 文字列に quite が必要かどうかを判定するための [[c:Psych::ScalarScanner]] オブジェクト
  def new; end

end
