class RDoc::Parser::Ruby
  # --- scan -> RDoc::TopLevel
  # 
  # Ruby のソースコードからクラス/モジュールのドキュメントを解析します。
  # 
  # @return [[c:RDoc::TopLevel]] オブジェクトを返します。
  def scan; end

  # --- new(top_level, file_name, body, options, stats) -> RDoc::Parser::Ruby
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

  # --- NORMAL -> "::"
  # 
  # RDoc::NormalClass type
  def NORMAL; end

  # --- SINGLE -> "<<"
  # 
  # RDoc::SingleClass type
  def SINGLE; end

end
