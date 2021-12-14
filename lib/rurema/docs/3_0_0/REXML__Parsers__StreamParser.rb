class REXML::Parsers::StreamParser
  # --- parse -> ()
  # 入力をパースします。
  # 
  # このメソッドの中からコールバックが呼び出されます。
  # 
  # @raise REXML::ParseException XML文書のパースに失敗した場合に発生します
  # @raise REXML::UndefinedNamespaceException XML文書のパース中に、定義されていない名前空間
  #        が現れた場合に発生します
  def parse; end

  # --- new(source, listener) -> REXML::Parsers::StreamParser
  # ストリームパーサオブジェクトを生成します。
  # 
  # @param source 入力(文字列、IO、IO互換オブジェクト(StringIOなど))
  # @param listener コールバックオブジェクト
  def new; end

end
