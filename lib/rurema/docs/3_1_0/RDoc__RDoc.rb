class RDoc::RDoc
  # --- document(argv) -> nil
  # 
  # argv で与えられた引数を元にドキュメントをフォーマットして指定されたディ
  # レクトリに出力します。
  # 
  # @param argv コマンドラインで rdoc コマンドに指定するのと同じ引数を文字
  #             列の配列で指定します。
  # 
  # @raise RDoc::Error ドキュメントの処理中にエラーがあった場合に発生します。
  # 
  # 指定できるオプションについては、[[ref:lib:rdoc#usage]] を参照してくださ
  # い。出力ディレクトリが指定されなかった場合はカレントディレクトリ の
  # doc 以下に出力します。
  def document; end

  # --- add_generator(klass) -> klass
  # 
  # 引数 klass で指定したクラスをジェネレータとして登録します。
  # 
  # @param klass 登録するクラスを指定します。
  # 
  # @see [[ref:c:RDoc::Options#custom_options]]
  def add_generator; end

end
