class RDoc::Markup
  # --- add_html(tag, name) -> ()
  # 
  # tag で指定したタグをフォーマットの対象にします。
  # 
  # @param tag 追加するタグ名を文字列で指定します。大文字、小文字のど
  #            ちらを指定しても同一のものとして扱われます。
  # 
  # @param name [[c:SM::ToHtml]] などのフォーマッタに識別させる時の名前を
  #             [[c:Symbol]] で指定します。
  # 
  # 例:
  # 
  #   require 'rdoc/markup/simple_markup'
  #   require 'rdoc/markup/simple_markup/to_html'
  #   m = SM::SimpleMarkup.new
  #   m.add_html("no", :STRIKE)
  # 
  #   h = SM::ToHtml.new
  #   h.add_tag(:STRIKE, "<strike>", "</strike>")
  #   puts m.convert(input_string, h)
  # 
  # 変換時に実際にフォーマットを行うには [[m:SM::ToHtml#add_tag]] のように、
  # フォーマッタ側でも操作を行う必要があります。
  def add_html; end

  # --- add_special(pattern, name) -> ()
  # 
  # pattern で指定した正規表現にマッチする文字列をフォーマットの対象にしま
  # す。
  # 
  # 例えば WikiWord のような、[[m:SM::SimpleMarkup#add_word_pair]]、
  # [[m:SM::SimpleMarkup#add_html]] でフォーマットできないものに対して使用
  # します。
  # 
  # @param pattern 正規表現を指定します。
  # 
  # @param name [[c:SM::ToHtml]] などのフォーマッタに識別させる時の名前を
  #             [[c:Symbol]] で指定します。
  # 
  # 例:
  # 
  #   require 'rdoc/markup/simple_markup'
  #   require 'rdoc/markup/simple_markup/to_html'
  # 
  #   class WikiHtml < SM::ToHtml
  #     def handle_special_WIKIWORD(special)
  #       "<font color=red>" + special.text + "</font>"
  #     end
  #   end
  # 
  #   m = SM::SimpleMarkup.new
  #   m.add_special(/\b([A-Z][a-z]+[A-Z]\w+)/, :WIKIWORD)
  # 
  #   h = WikiHtml.new
  #   puts m.convert(input_string, h)
  # 
  # 変換時に実際にフォーマットを行うには SM::ToHtml#accept_special_<name で指定した名前>
  # のように、フォーマッタ側でも操作を行う必要があります。
  def add_special; end

  # --- add_word_pair(start, stop, name) -> ()
  # 
  # start と stop ではさまれる文字列(例. *bold*)をフォーマットの対象にしま
  # す。
  # 
  # @param start 開始となる文字列を指定します。
  # 
  # @param stop 終了となる文字列を指定します。start と同じ文字列にする事も
  #             可能です。
  # 
  # @param name [[c:SM::ToHtml]] などのフォーマッタに識別させる時の名前を
  #             [[c:Symbol]] で指定します。
  # 
  # @raise RuntimeError start に "<" で始まる文字列を指定した場合に発生します。
  # 
  # 例:
  # 
  #   require 'rdoc/markup/simple_markup'
  #   require 'rdoc/markup/simple_markup/to_html'
  #   m = SM::SimpleMarkup.new
  #   m.add_word_pair("{", "}", :STRIKE)
  # 
  #   h = SM::ToHtml.new
  #   h.add_tag(:STRIKE, "<strike>", "</strike>")
  #   puts m.convert(input_string, h)
  # 
  # 変換時に実際にフォーマットを行うには [[m:SM::ToHtml#add_tag]] のように、
  # フォーマッタ側でも操作を行う必要があります。
  def add_word_pair; end

  # --- attribute_manager -> RDoc::AttributeManager
  # 
  # 自身の [[c:RDoc::AttributeManager]] オブジェクトを返します。
  def attribute_manager; end

  # --- content -> String
  # 
  # 変換する文字列を返します。
  # 
  # rdoc ライブラリのデバッグ用途に使用します。
  # [[m:SM::SimpleMarkup#convert]] の後に実行します。
  # 
  # 変換のために加工したオブジェクトを改行で連結したものを返すため、変換前
  # の文字列と結果が異なる事があります。
  # 
  # @see [[m:SM::SimpleMarkup#convert]]
  def content; end

  # --- convert(str, formatter) -> object | ""
  # 
  # str で指定された文字列を formatter に変換させます。
  # 
  # @param str 変換する文字列を指定します。
  # 
  # @param formatter [[c:SM::ToHtml]]、[[c:SM::ToLaTeX]] などのインスタンス
  #                  を指定します。
  # 
  # 変換結果は formatter によって文字列や配列を返します。
  def convert; end

  # --- get_line_types -> [Symbol]
  # 
  # 変換する文字列の各行のタイプを [[c:Symbol]] の配列で返します。
  # 
  # rdoc ライブラリのデバッグ用途に使用します。
  # [[m:SM::SimpleMarkup#convert]] の後に実行します。
  # 
  # @see [[m:SM::SimpleMarkup#convert]]
  def get_line_types; end

  # --- new(attribute_manager = nil) -> RDoc::Markup
  # 
  # 自身を初期化します。
  # 
  # @param attribute_manager [[c:Rdoc::AttributeManager]] オブジェクトを指
  #                          定します。
  def new; end

  # --- LABEL_LIST_RE -> Regexp
  # 
  # ラベル付きリストにマッチする正規表現です。ライブラリの内部で使用します。
  def LABEL_LIST_RE; end

  # --- SIMPLE_LIST_RE -> Regexp
  # 
  # リストにマッチする正規表現です。ライブラリの内部で使用します。
  # 
  # ラベルの有無を問わずマッチします。
  def SIMPLE_LIST_RE; end

  # --- SPACE -> ?\s
  # 
  # 空白文字です。?\s を返します。ライブラリの内部で使用します。
  def SPACE; end

end
