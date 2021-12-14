class REXML::Parsers::SAX2Parser
  # --- deafen(listener) -> ()
  # 
  # [[m:REXML::Parsers::SAX2Parser#listen]] で指定した listener を
  # 取り除きます。
  # 
  # @param listener 取り除く listener
  def deafen; end

  # --- listen(sym, ary) { ... } -> ()
  # --- listen(sym) { ... } -> ()
  # --- listen(ary, listener) -> ()
  # --- listen(ary) { ... } -> ()
  # --- listen(listener) -> ()
  # 
  # コールバックをパーサに登録します。
  # 
  # 引数の種類やブロックの有無でどのような場合に何がコールバックされかが
  # 変わります。
  # 
  # ブロックを指定した場合はそのブロックがコールバックされます。
  # ブロックを指定しない場合は [[c:REXML::SAX2Listener]] を include した
  # クラスのオブジェクトを指定します。
  # 
  # sym は以下のシンボルが指定でき、どの場合にコールバックが呼び出されるかを
  # 指定します。どのような場合にどのような引数でコールバックが呼び出されるか
  # については、
  # [[c:REXML::SAX2Listener]] の対応するメソッドで詳しく説明されていますので
  # そちらを参照してください。
  # 
  #   * :start_document
  #     (XML文書開始, [[m:REXML::SAX2Listener#start_document]])
  #   * :end_document
  #     (XML文書終了, [[m:REXML::SAX2Listener#end_document]])
  #   * :start_element
  #     (要素開始, [[m:REXML::SAX2Listener#start_element]])
  #   * :end_element
  #     (要素終了, [[m:REXML::SAX2Listener#end_element]])
  #   * :start_prefix_mapping
  #     (名前空間接頭辞導入, [[m:REXML::SAX2Listener#start_prefix_mapping]])
  #   * :end_prefix_mapping
  #     (名前空間接頭辞適用終了, [[m:REXML::SAX2Listener#end_prefix_mapping]])
  #   * :characters (文字データ, [[m:REXML::SAX2Listener#characters]])
  #   * :processing_instruction
  #     (XML 処理命令 [[m:REXML::SAX2Listener#processing_instruction]])
  #   * :doctype
  #     (DTD, [[m:REXML::SAX2Listener#doctype]])
  #   * :attlistdecl
  #     (DTDの属性リスト宣言, [[m:REXML::SAX2Listener#attlistdecl]])
  #   * :entitydecl
  #     (DTDの実体宣言, [[m:REXML::SAX2Listener#entitydecl]])
  #   * :notationdecl
  #     (DTDの記法宣言, [[m:REXML::SAX2Listener#notationdecl]])
  #   * :cdata
  #     (CDATA セクション, [[m:REXML::SAX2Listener#cdata]])
  #   * :xmldecl
  #     (XML 宣言, [[m:REXML::SAX2Listener#xmldecl]])
  #   * :comment
  #     (コメント, [[m:REXML::SAX2Listener#comment]])
  #   * :progress
  #     (入力を読み進める, [[m:REXML::SAX2Listener#progress]])
  # 
  # 
  # ary には配列を指定し、要素名によるコールバック呼び出し条件を指定します。
  # 配列の要素としては、文字列か正規表現が指定できます。
  # start_element, end_element に関しては、指定した名前を持つ
  # 要素の開始時と終了時にのみコールバックが呼び出されるようになります。
  # start_prefix_mapping, end_prefix_mapping では、その名前空間が導入された
  # 要素の要素名、つまり xmlns:foo="bar" という属性を持つ
  # 要素の名前でフィルタリングされるようになります。
  # それ以外(character, cdataなど)では、指定した名前を要素として持つ要素の直下のみ
  # コールバックが呼び出されます。
  # フィルタリングに使われる名前は QName、つまり prefix を含む文字列です。
  # 
  # @param sym イベント名(シンボル)
  # @param ary 要素名によるコールバック呼び出し条件の指定(文字列もしくは正規表現の配列)
  # @param listener コールバックオブジェクト
  # 
  # === 例
  #   # CDATAセクションに出会った場合にブロックが呼び出される。
  #   parser.listen(:cdata){|data| ... }
  # 
  #   # h1, h2 という要素名を持つ要素が開始した場合にブロックが呼び出される
  #   parser.listen(:start_element, ["h1", "h2"]){|uri, localname, qname, attrs|
  #     ...
  #   }
  # 
  #   # /\Ah[1234]\z/ という正規表現にマッチする要素(h1, .. h4)の直下の
  #   # 文字データに出会った場合に呼び出される
  #   parser.listen(:characters, [/\Ah[1234]\z/]){|data|
  #     ...
  #   }
  def listen; end

  # --- parse -> ()
  # [[m:REXML::Parsers::SAX2Parser.new]] で指定した XML を
  # パースし、その結果によって [[m:REXML::Parsers::SAX2Parser#listen]] で
  # 指定したコールバックを呼び出します。
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def parse; end

  # --- new(source) -> REXML::Parsers::SAX2Parser
  # SAX2 パーサオブジェクトを生成します。
  # 
  # @param source 入力(文字列、IO、IO互換オブジェクト(StringIOなど))
  def new; end

end
