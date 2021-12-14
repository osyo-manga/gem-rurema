class RDoc::Parser
  # --- parse_files_matching(regexp) -> ()
  # 
  # regexp で指定した正規表現にマッチするファイルを解析できるパーサとして、
  # 自身を登録します。
  # 
  # @param regexp 正規表現を指定します。
  # 
  # 新しいパーサを作成する時に使用します。
  # 
  # 例:
  # 
  #   class RDoc::Parser::Xyz < RDoc::Parser
  #     parse_files_matching /\.xyz$/
  #     ...
  #   end
  def parse_files_matching; end

  # --- alias_extension(old_ext, new_ext) -> bool
  # 
  # old_ext に登録されたパーサを new_ext でも解析できるようにエイリアスを登
  # 録します。
  # 
  # @param old_ext 拡張子を文字列で指定します。
  # 
  # @param new_ext 拡張子を文字列で指定します。
  # 
  # @return エイリアスが登録された場合は true を返します。old_ext にパーサ
  #         が登録されていない場合、エイリアスが登録されずに false を返しま
  #         す。
  def alias_extension; end

  # --- can_parse(file_name) -> RDoc::Parser | nil
  # 
  # file_name を解析できるパーサクラスを返します。見つからなかった場合は
  # nil を返します。
  # 
  # @param file_name 解析するファイルの名前を指定します。
  def can_parse; end

  # --- parser_for(top_level, file_name, body, options, stats) -> RDoc::Parser
  # 
  # file_name を解析できるパーサのインスタンスを返します。
  # 見つからなかった場合は [[c:RDoc::Parser::Simple]] のインスタンスを返します。
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
  def parser_for; end

  # --- parsers -> [[Regexp, RDoc::Parser]]
  # 
  # [[m:RDoc::Parser#parse_files_matching]] で登録した正規表現とパーサクラ
  # スの配列の配列を返します。
  def parsers; end

end
