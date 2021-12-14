class REXML::CData
  # --- clone -> REXML::CData
  # self を複製して返します。
  # 
  # 親ノードの情報は複製されません。
  def clone; end

  # --- to_s -> String
  # --- value -> String
  # 
  # テキスト文字列を返します。
  # 
  # @see [[m:REXML::Text#value]], [[m:REXML::Text#to_s]]
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <root><![CDATA[foobar  baz]]></root>
  # EOS
  # doc.root[0].class # => REXML::CData
  # doc.root[0].value # => "foobar  baz"
  # //}
  def to_s; end

  # --- new(text, respect_whitespace = true, parent = nil) -> REXML::CData
  # text をテキストとして持つ CData オブジェクトを生成します。
  # 
  # respect_whitespace に真を指定すると、text に含まれる空白文字は保存されます。
  # 偽の場合は空白はまとめられます。
  # 
  # @param text テキスト文字列
  # @param respect_whitespace 空白を保存するかどうかを決める真偽値
  # @param parent 親ノード
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <root />
  # EOS
  # doc.root.add(REXML::CData.new("foo bar  baz "))
  # doc.to_s # => "<root><![CDATA[foo bar  baz ]]></root>\n"
  # 
  # doc = REXML::Document.new(<<EOS)
  # <root />
  # EOS
  # doc.root.add(REXML::CData.new("foo  bar  baz  ", true))
  # doc.root.add(REXML::CData.new("foo  bar  baz  ", false))
  # doc.to_s # => "<root><![CDATA[foo  bar  baz  ]]><![CDATA[foo bar baz ]]></root>\n"
  # //}
  def new; end

end
