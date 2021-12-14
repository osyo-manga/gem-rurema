class REXML::Instruction
  # --- ==(other) -> bool
  # other と self が同じ 処理命令である場合に真を返します。
  # 
  # 同じとは、 [[m:REXML::Instruction#target]] と [[m:REXML::Instruction#content]]
  # が一致することを意味します。
  # 
  # @param other 比較対象
  def ==; end

  # --- clone -> REXML::Instruction
  # self を複製します。
  def clone; end

  # --- content -> String | nil
  # XML 処理命令の内容を返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <?xml version="1.0" encoding="utf-8" ?>
  # <?xml-stylesheet type="text/css" href="style.css"?>
  # <?foobar?>
  # <root />
  # EOS
  # doc[2] # => <?p-i xml-stylesheet ...?>
  # doc[2].target # => "xml-stylesheet"
  # doc[2].content # => "type=\"text/css\" href=\"style.css\""
  # doc[4].target # => "foobar"
  # doc[4].content # => nil
  # //}
  def content; end

  # --- content=(value)
  # XML 処理命令の内容を変更します。
  # 
  # @param value 新たなデータ(文字列)
  def content=; end

  # --- node_type -> Symbol
  # Symbol :processing_instruction を返します。
  def node_type; end

  # --- target -> String
  # XML 処理命令のターゲットを返します。
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # doc = REXML::Document.new(<<EOS)
  # <?xml version="1.0" encoding="utf-8" ?>
  # <?xml-stylesheet type="text/css" href="style.css"?>
  # <root />
  # EOS
  # doc[2] # => <?p-i xml-stylesheet ...?>
  # doc[2].target # => "xml-stylesheet"
  # doc[2].content # => "type=\"text/css\" href=\"style.css\""
  # //}
  def target; end

  # --- target=(value)
  # XML 処理命令のターゲットを value に変更します。
  # 
  # @param value 新たなターゲット(文字列)
  def target=; end

  # --- new(target, content = nil) -> REXML::Instruction
  # 新たな Instruction オブジェクトを生成します。
  # 
  # @param target ターゲット
  # @param content 内容
  def new; end

end
