class RDoc::Parser::Simple
  # --- remove_private_comments(comment) -> String
  # 
  # 行頭の "--" から "++" で囲まれたコメントを comment から削除した結果を返
  # します。
  # 
  # @param comment 対象の文字列を指定します。
  # 
  # @return コメントが削除された文字列を返します。
  def remove_private_comments; end

  # --- scan -> RDoc::TopLevel
  # 
  # 自身の持つ [[c:RDoc::TopLevel]] のコメントとしてファイルの内容を解析し
  # ます。
  # 
  # @return [[c:RDoc::TopLevel]] オブジェクトを返します。
  def scan; end

  # --- new(top_level, file_name, body, options, stats) -> RDoc::Parser::Simple
  # 
  # 自身を初期化します。
  # 
  # @param top_level [[c:RDoc::TopLevel]] オブジェクトを指定します。
  # 
  # @param file_name ファイル名を文字列で指定します。
  # 
  # @param body 内容を文字列で指定します。
  # 
  # @param options [[c:RDoc::Options]] オブジェクトを指定します。
  # 
  # @param stats [[c:RDoc::Stats]] オブジェクトを指定します。
  def new; end

end
