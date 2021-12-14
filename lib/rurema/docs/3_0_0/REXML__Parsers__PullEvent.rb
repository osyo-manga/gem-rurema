class REXML::Parsers::PullEvent
  # --- [](nth) -> object
  # --- [](start, len) -> [object]
  # イベントのパラメータを取り出します。
  # 
  # [[m:Array#[] ]] と同様の引数を取ります。
  # 
  # @param nth nth番目のイベントパラメータを取り出します
  # @param start start番目から len 個のイベントを取り出します
  # @param len start番目から len 個のイベントを取り出します
  def []; end

  # --- attlistdecl? -> bool
  # DTDの属性リスト宣言なら真を返します。
  def attlistdecl?; end

  # --- cdata? -> bool
  # cdata セクションなら真を返します。
  def cdata?; end

  # --- comment? -> bool
  # コメントノードなら真を返します。
  def comment?; end

  # --- doctype? -> bool
  # DTD 開始なら真を返します。
  def doctype?; end

  # --- elementdecl? -> bool
  # DTDの要素宣言なら真を返します。
  def elementdecl?; end

  # --- end_element? -> bool
  # XML要素の終了タグなら真を返します。
  def end_element?; end

  # --- entitydecl? -> bool
  # DTDの実体宣言なら真を返します。
  def entitydecl?; end

  # --- event_type -> Symbol
  # イベントの種類をシンボルで返します。
  # 
  # 詳しくは [[ref:c:REXML::Parsers::PullParser#event_type]] を参照してください。
  def event_type; end

  # --- instruction? -> bool
  # XML処理命令なら真を返します。
  def instruction?; end

  # --- notationdecl? -> bool
  # DTDの記法宣言なら真を返します。
  def notationdecl?; end

  # --- start_element? -> bool
  # XML要素の開始タグなら真を返します。
  def start_element?; end

  # --- text? -> bool
  # テキストノードなら真を返します。
  def text?; end

  # --- xmldecl? -> bool
  # XML宣言なら真を返します。
  def xmldecl?; end

end
