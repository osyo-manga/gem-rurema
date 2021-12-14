class REXML::Parsers::PullParser
  # --- each {|event| ... } -> ()
  # 
  # XMLをパースし、得られたイベント列を引数として順にブロックを呼び出します。
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def each; end

  # --- empty? -> bool
  # 未処理のイベントが残っていない場合に真を返します。
  # 
  # @see [[m:REXML::Parsers::PullParser#has_next?]]
  def empty?; end

  # --- has_next? -> bool
  # 未処理のイベントが残っている場合に真を返します。
  # 
  # @see [[m:REXML::Parsers::PullParser#empty?]]
  def has_next?; end

  # --- peek(depth = 0) -> REXML::Parsers::PullEvent | nil
  # イベントキューの先頭から depth 番目のイベントを取り出します。
  # 
  # 一番先頭のイベントは 0 で表します。
  # 
  # このメソッドでは列そのものの状態は変化しません。
  # 
  # 先頭から depth 番目のイベントが存在しない(XML文書の末尾の
  # さらに先を見ようとした場合)は nil を返します。
  # 
  # @param depth 先頭から depth 番目のイベントを取り出します
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def peek; end

  # --- pull -> REXML::Parsers::PullEvent
  # イベントキューの先頭のイベントを取り出し、キューからそれを取り除きます。
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def pull; end

  # --- unshift(token) -> ()
  # イベントキューの先頭に token を追加します。
  # 
  # @param token 先頭に追加するイベント([[c:REXML::Parsers::PullEvent]] オブジェクト)
  def unshift; end

  # --- new(stream) -> REXML::Parsers::PullParser
  # 新たな PullParser オブジェクトを生成して返します。
  # 
  # @param source 入力(文字列、IO、IO互換オブジェクト(StringIOなど))
  def new; end

end
