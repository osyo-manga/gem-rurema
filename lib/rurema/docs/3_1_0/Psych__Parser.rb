class Psych::Parser
  # --- handler -> Psych::Handler
  # セットされているイベントハンドラを返します。
  # 
  # @see [[m:Psych::Parser#handler=]]
  def handler; end

  # --- handler=(val)
  # イベントハンドラをセットします。
  # 
  # @param val セットするハンドラ
  # @see [[m:Psych::Parser#handler=]]
  def handler=; end

  # --- mark -> Psych::Parser::Mark
  # 
  # パーサが現在読み込んでいる入力上の位置を [[c:Psych::Parser::Mark]] オブジェクト
  # で返します。
  def mark; end

  # --- parse(yaml) -> self
  # 
  # YAML ドキュメントをパースし、イベントハンドラに
  # イベントを逐次通知します。
  # 
  # @see [[m:Psych::Parser.new]], [[c:Psych::Handler]], [[m:Psych::Parser#handler]]
  def parse; end

  # --- new(handler = Handler.new) -> Psych::Parser
  # 新たなパーサオブジェクトを生成して返します。
  # 
  # handler で YAML のイベントを処理するハンドラを指定します。
  # 詳しくは [[c:Psych::Parser]] を参照してください。
  # 
  # @param handler YAML のイベントを処理するハンドラ
  def new; end

  # --- ANY -> Integer
  # 「任意の」エンコーディングを意味します。
  def ANY; end

  # --- UTF16BE -> Integer
  # UTF-16BE エンコーディングを表します。
  # 
  # @see [[m:Psych::Handler#start_stream]]
  def UTF16BE; end

  # --- UTF16LE -> Integer
  # UTF-16LE エンコーディングを表します。
  # 
  # @see [[m:Psych::Handler#start_stream]]
  def UTF16LE; end

  # --- UTF8 -> Integer
  # UTF-8 エンコーディングを表します。
  # 
  # @see [[m:Psych::Handler#start_stream]]
  def UTF8; end

end
