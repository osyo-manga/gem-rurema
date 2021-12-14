class REXML::Text
  # --- <=>(other) -> -1 | 0 | 1
  # テキストの内容を other と比較します。
  # 
  # @param other 比較対象([[c:REXML::Text]] オブジェクトもしくは文字列)
  def <=>; end

  # --- clone -> REXML::Text
  # self を複製します。
  def clone; end

  # --- doctype -> REXML::DocType | nil
  # テキストノードが属する文書の DTD を返します。
  # 
  # そのような文書([[c:REXML::Document]])が存在しない、すなわち
  # テキストノードの親ノードを辿っても REXML::Document に到達しない、
  # 場合には nil を返します。
  # 
  # @see [[c:REXML::DocType]]
  def doctype; end

  # --- empty? -> bool
  # テキストが空ならば真を返します。
  def empty?; end

  # --- node_type -> Symbol
  # [[c:Symbol]] :text を返します。
  def node_type; end

  # --- raw -> bool
  # "raw" モードであれば真を返します。
  # 
  # raw モードについては [[m:REXML::Text.new]] を参考にしてください。
  # 
  # @see [[m:REXML::Text#raw=]]
  def raw; end

  # --- raw=(value)
  # "raw" モードの設定を変更します。
  # 
  # raw モードについては [[m:REXML::Text.new]] を参考にしてください。
  # 
  # @param value 設定する真偽値
  # @see [[m:REXML::Text#raw]]
  def raw=; end

  # --- to_s -> String
  # テキストの内容を正規化(すべての実体をエスケープ)された状態で返します。
  # 
  # つまり返り値は XML のテキストとして妥当です。
  # 
  # 結果は [[m:REXML::Text.new]] で指定した entity_filter を反映しています。
  # 
  # @see [[m:REXML::Text#value]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # t = REXML::Text.new("< & foobar", false, nil, false)
  # t.to_s # => "&lt; &amp; foobar"
  # t.value # => "< & foobar"
  # //}
  def to_s; end

  # --- value -> String
  # テキストの内容を非正規化(すべての実体をアンエスケープ)された状態で返します。
  # 
  # このメソッドの返り値では raw モードや entity_filter は無視されます。
  # 
  # @see [[m:REXML::Text#raw]], [[m:REXML::Text#to_s]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # t = REXML::Text.new("< & foobar", false, nil, false)
  # t.to_s # => "&lt; &amp; foobar"
  # t.value # => "< & foobar"
  # //}
  def value; end

  # --- value=(val)
  # テキストの内容を val に変更します。
  # 
  # val には非正規化された(エスケープされていない)文字列を渡さなければ
  # なりません。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # e = REXML::Element.new("a")
  # e.add_text("foo")
  # e[0].value = "bar"
  # e.to_s # => "<a>bar</a>"
  # e[0].value = "<a>"
  # e.to_s # => "<a>&lt;a&gt;</a>"
  # //}
  def value=; end

  # --- new(arg, respect_whitespace = false, parent = nil, raw = nil, entity_filter = nil, illegal = REXML::Text::NEEDS_A_SECOND_CHECK)
  # 
  # テキストノードオブジェクトを生成します。
  # 
  # arg でノードの内容を指定します。
  # 文字列の場合はそれが内容として使われます。
  # [[c:REXML::Text]] オブジェクトの場合はその内容が複製されます。
  # 
  # respect_whitespace に真を指定すると、arg に含まれる空白文字は保存されます。
  # 偽の場合は空白はまとめられます。
  # 
  # raw は true, false, nil のいずれかを指定し、生成されるテキストノードが
  # raw モードであるかどうかを決めます。
  # true の場合、そのノードは raw モードであると解釈され、
  # テキストにはエスケープされていないXMLマークアップは
  # 含まれていないと仮定し、テキストの内容は変更されません。
  # falseの場合、そのノードは raw モードであると解釈され、
  # rexml はテキストに含まれているすべての(定義済み)実体を
  # エスケープします
  # nilの場合、親ノードが raw モードであるかどうかで
  # self が raw モードになるかどうかが決まります。
  # arg に REXML::Text オブジェクトを渡した場合は、この値は無視され
  # arg が raw モードであるかどうかが使われます。
  # 
  # entity_filter は置き換えたい実体のリストを文字列の配列で指定します。
  # これは raw が false のときのみ意味を持ちます。
  # entity_filter が nil の場合(デフォルトの場合)、
  # テキストがどのようにエスケープされるかは、そのノードが属する
  # 文書([[c:REXML::Document]])の
  # DTD([[c:REXML::DocType]], [[m:REXML::Document#doctype]])
  # で定義されます。DTD が与えられていない場合は、XMLの規格上
  # 以下の実体参照/対応文字がデフォルトで使われます。
  #   * &amp; &
  #   * &lt; <
  #   * &gt; >
  #   * &quot; "
  #   * &apos; '
  # 
  # illegal は内部用なので使わないでください。
  # 
  # @param arg テキストデータ(文字列)もしくは元データの [[c:REXML::Text]] オブジェクト
  # @param respect_whitespace 空白を保存するかどうかを決める真偽値
  # @param parent 親ノード
  # @param raw テキストのエスケープの挙動を決める値
  # @param entity_filter 置換したい実体の名前の配列
  # @param illegal ライブラリ内部用
  # @raise RuntimeError テキストがXMLのテキストとして不正な
  #        文字を含んでいる場合に発生します。
  # 
  # //emlist[doctype なしの場合][ruby]{
  # p REXML::Text.new("<&", false, nil, false).to_s  # => "&lt;&amp;"
  # p REXML::Text.new("&lt;&amp;", false, nil, false).to_s # => "&amp;lt;&amp;amp;"
  # p REXML::Text.new("&lt;&amp;", false, nil, true).to_s # => "&lt;&amp;"
  # p REXML::Text.new("<&", false, nil, true).to_s # parse error
  # //}
  # 
  # //emlist[doctype があり、実体が宣言されている場合][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # doctype = REXML::Document.new(<<EOS).doctype
  # <!DOCTYPE root [
  # <!ENTITY p "foobar publisher">
  # <!ENTITY % q "quzz">
  # ]>
  # <root />
  # EOS
  # REXML::Text.new("&quzz", false, doc.root, false).to_s # => "&amp;&q;"
  # REXML::Text.new("quzz", false, doc.root, true).to_s # => "quzz"
  # //}
  def new; end

  # --- normalize(input, doctype = nil, entity_filter = nil) -> String
  # input を正規化(すべての entity をエスケープ)したものを
  # 返します。
  # 
  # @param input 正規化する文字列
  # @param doctype DTD([[c:REXML::DocType]] オブジェクト)
  # @param entity_filter 置換したい実体の名前の配列
  def normalize; end

  # --- unnormalize(string, doctype = nil, filter = nil, illegal = nil) -> String
  # string を非正規化(すべての entity をアンエスケープ)したものを
  # 返します。
  # 
  # filter でアンエスケープしない実体の実体名を文字列配列で指定します。
  # 
  # @param string 非正規化する文字列
  # @param doctype DTD([[c:REXML::DocType]] オブジェクト)
  # @param filter アンエスケープしない実体の実体名(文字列配列)
  # @param illegal 内部用。使わないでください。
  # 
  # //emlist[][ruby]{
  # require 'rexml/text'
  # REXML::Text.unnormalize("&amp; &foobar; &lt;") # => "& &foobar; <"
  # REXML::Text.unnormalize("&lt; &gt;", nil, ["lt"]) # => "&lt; >"
  # //}
  def unnormalize; end

end
