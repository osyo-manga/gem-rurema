class REXML::Parsers::UltraLightParser
  # --- parse -> Array
  # XML 文書のパース結果を配列による木で返します。
  # 
  # 返される木構造配列については [[ref:lib:rexml/parsers/ultralightparser#nodes]]
  # を参照してください。
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def parse; end

  # --- rewind -> ()
  # [[m:REXML::Parsers::UltraLightParser.new]] で指定した stream を
  # rewind してもう一度パースできる状態にします。
  def rewind; end

  # --- new(stream) -> REXML::Parsers::UltraLightParser
  # パーサオブジェクトを返します。
  # 
  # @param stream 入力(文字列、IO、IO互換オブジェクト(StringIOなど))
  def new; end

end
