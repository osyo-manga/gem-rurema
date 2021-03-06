class RDoc::Markup::Formatter
  # --- add_tag(name, start, stop) -> ()
  # 
  # name で登録された規則で取得された文字列を start と stop で囲むように指
  # 定します。
  # 
  # @param name [[c:RDoc::Markup::ToHtml]] などのフォーマッタに識別させる時
  #             の名前を [[c:Symbol]] で指定します。
  # 
  # @param start 開始の記号を文字列で指定します。
  # 
  # @param stop 終了の記号を文字列で指定します。
  # 
  # 例:
  # 
  #   require 'rdoc/markup/to_html'
  # 
  #   # :STRIKE のフォーマットを <strike> 〜 </strike> に指定。
  #   h = RDoc::Markup::ToHtml.new
  #   h.add_tag(:STRIKE, "<strike>", "</strike>")
  def add_tag; end

  # --- convert(content) -> ()
  # 
  # content で指定された文字列を変換します。
  # 
  # @param content 変換する文字列を指定します。
  def convert; end

  # --- new(markup = nil) -> RDoc::Markup::Formatter
  # 
  # 自身を初期化します。
  # 
  # @param markup [[c:RDoc::Markup]] オブジェクトを指定します。省略した場合
  #               は新しく作成します。
  def new; end

end
