class RDoc::Markdown
  # --- break_on_newline -> bool
  # 
  # 改行を保持した状態で出力するかどうかを返します。
  # 
  # デフォルトでは false を返します。
  def break_on_newline; end

  # --- break_on_newline=(val)
  # 
  # 改行を保持した状態で出力するかどうかを設定します。
  def break_on_newline=; end

  # --- css -> bool
  # 
  # CSS を記述した場合に出力に含めるかどうかを返します。
  # 
  # デフォルトでは false を返します。
  def css; end

  # --- css=(val)
  # 
  # CSS を記述した場合に出力に含めるかどうかを設定します。
  def css=; end

  # --- definition_lists -> bool
  # 
  # 定義リストを解釈するかどうかを返します。
  # 
  # デフォルトでは true を返します。
  def definition_lists; end

  # --- definition_lists=(val)
  # 
  # 定義リストを解釈するかどうかを設定します。
  def definition_lists=; end

  # --- extension(name, enable) -> ()
  # 
  # 引数 name で指定した拡張の有効/無効を設定します。
  # 
  # @param name 拡張の名前を [[c:Symbol]] で指定します。
  # 
  # @param enable 有効にする場合は true を、無効にする場合は false を指定し
  #               ます。
  def extension; end

  # --- extension?(name)
  # 
  # 引数 name で指定した拡張が有効かどうかを返します。
  # 
  # @param name 拡張の名前を [[c:Symbol]] で指定します。
  def extension?; end

  # --- github -> bool
  # 
  # Github Flavored Markdown 拡張の一部を有効にして出力を行うかどうかを返し
  # ます。
  # 
  # デフォルトでは true を返します。
  def github; end

  # --- github=(val)
  # 
  # Github Flavored Markdown 拡張の一部を有効にして出力を行うかどうかを設定
  # します。
  def github=; end

  # --- html -> bool
  # 
  # HTML を記述した場合にそのまま出力するかどうかを返します。
  # 
  # デフォルトでは true を返します。
  def html; end

  # --- html=(val)
  # 
  # HTML を記述した場合にそのまま出力するかどうかを設定します。
  def html=; end

  # --- notes -> bool
  # 
  # 脚注の出力を有効にするかどうかを返します。
  # 
  # デフォルトでは true を返します。
  def notes; end

  # --- notes=(val)
  # 
  # 脚注の出力を有効にするかどうかを設定します。
  def notes=; end

  # --- parse(markdown) -> RDoc::Markup::Document
  # 
  # 引数 markdown で指定したドキュメントを解析して
  # [[c:RDoc::Markup::Document]] オブジェクトを返します。
  # 
  # @param markdown 解析の対象になるドキュメントを文字列で指定します。
  def parse; end

  # --- extension(name) -> nil
  # 
  # 引数 name で指定した拡張を有効/無効にするためのインスタンスメソッドを定
  # 義します。
  # 
  # ライブラリ内部で使用します。
  def extension; end

  # --- new(extensions = DEFAULT_EXTENSIONS, debug = false)
  # 
  # 引数 extensions で与えられた拡張を有効にした [[c:RDoc::Markdown]] オブ
  # ジェクトを初期化します。
  # 
  # @param extensions 有効にする拡張を [[c:Symbol]] の配列で指定します。
  # 
  # @param debug デバッグを有効にするかどうかを指定します。
  def new; end

  # --- parse(markdown) -> RDoc::Markup::Document
  # 
  # 引数 markdown で指定したドキュメントを解析して
  # [[c:RDoc::Markup::Document]] オブジェクトを返します。
  # 
  # @param markdown 解析の対象になるドキュメントを文字列で指定します。
  def parse; end

  # --- DEFAULT_EXTENSIONS -> [Symbol]
  # 
  # デフォルトで有効になっている拡張の一覧を [[c:Symbol]] の配列で返します。
  def DEFAULT_EXTENSIONS; end

  # --- EXTENSIONS -> [Symbol]
  # 
  # サポートする拡張の一覧を [[c:Symbol]] の配列で返します。
  def EXTENSIONS; end

  # --- HTML_ENTITIES -> {String => [Integer]}
  # 
  # HTML の実体参照のマッピングを表す [[c:Hash]] オブジェクトです。
  # [[c:RDoc::Markdown]] で使用します。
  def HTML_ENTITIES; end

end
