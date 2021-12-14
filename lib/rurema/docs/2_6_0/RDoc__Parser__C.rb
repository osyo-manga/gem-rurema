class RDoc::Parser::C
  # --- progress=(val)
  # 
  # 進捗を出力する [[c:IO]] を指定します。
  # 
  # @param val 進捗を出力する [[c:IO]] を指定します。指定しなかった場合は
  #            [[m:$stderr]] が使われます。
  def progress=; end

  # --- scan -> RDoc::TopLevel
  # 
  # C 言語で記述されたソースコードから組み込みクラス/モジュールのドキュメン
  # トを解析します。
  # 
  # @return [[c:RDoc::TopLevel]] オブジェクトを返します。
  def scan; end

  # --- new(top_level, file_name, body, options, stats) -> RDoc::Parser::C
  # 
  # 自身を初期化します。
  # 
  # @param top_level [[c:RDoc::TopLevel]] オブジェクトを指定します。
  # 
  # @param file_name ファイル名を文字列で指定します。
  # 
  # @param body ソースコードの内容を文字列で指定します。
  # 
  # @param options [[c:RDoc::Options]] オブジェクトを指定します。
  # 
  # @param stats [[c:RDoc::Stats]] オブジェクトを指定します。
  def new; end

end
