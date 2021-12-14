class XMP
  # --- puts(exps) -> nil
  # 
  # 引数 exps で指定されたRuby のソースコードとその実行結果を、標準出力に行
  # ごとに交互に表示します。
  # 
  # @param exps 評価するRuby のソースコードを文字列で指定します。
  def puts; end

  # --- new(bind = nil) -> XMP
  # 
  # 自身を初期化します。
  # 
  # @param bind [[c:Binding]] オブジェクトを指定します。省略した場合は、最
  #             後に実行した [[m:XMP#puts]]、[[m:Kernel#xmp]] の
  #             [[c:Binding]] を使用します。まだ何も実行していない場合は
  #             [[m:Object::TOPLEVEL_BINDING]] を使用します。
  # 
  # @see [[m:XMP#puts]]
  def new; end

end
