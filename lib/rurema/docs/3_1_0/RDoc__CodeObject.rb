class RDoc::CodeObject
  # --- comment -> String
  # 
  # 自身のコメントを返します。
  def comment; end

  # --- comment=(comment)
  # 
  # 自身のコメントを comment に設定します。
  # 
  # ただし、comment が空文字列だった場合は何もしません。
  # 
  # @param comment コメントを文字列で指定します。
  def comment=; end

  # --- document_children -> bool
  # 
  # 自身に含まれるメソッド、エイリアス、定数や属性をドキュメントに含めるか
  # どうかを返します。
  # 
  # @see [[m:RDoc::CodeObject#document_self]]
  def document_children; end

  # --- document_children=(val)
  # 
  # 自身に含まれるメソッド、エイリアス、定数や属性をドキュメントに含めるか
  # どうかを設定します。
  # 
  # :nodoc:、:stopdoc: を指定した時に false が設定されます。
  # 
  # @param val true を指定した場合、上記をドキュメントに含めます。
  # 
  # @see [[m:RDoc::CodeObject#document_self=]],
  #      [[m:RDoc::CodeObject#remove_classes_and_modules]]
  def document_children=; end

  # --- document_self -> bool
  # 
  # 自身をドキュメントに含めるかどうかを返します。
  # 
  # @see [[m:RDoc::CodeObject#document_children]]
  def document_self; end

  # --- document_self=(val)
  # 
  # 自身をドキュメントに含めるかどうかを設定します。
  # 
  # :doc: を指定した時に true が設定されます。
  # :nodoc:、:stopdoc: を指定した時に false が設定されます。
  # 
  # @param val true を指定した場合、自身をドキュメントに含めます。
  # 
  # @see [[m:RDoc::CodeObject#document_children=]],
  #      [[m:RDoc::CodeObject#remove_methods_etc]]
  def document_self=; end

  # --- documented? -> bool
  # 
  # 出力すべきドキュメントがあるかどうかを返します。
  def documented?; end

  # --- metadata -> Hash
  # 
  # 自身が持つメタデータ(他から任意の値を設定してもよい)を返します。
  def metadata; end

  # --- parent -> RDoc::CodeObject
  # 
  # 自身を所有する(変数や定数などの形で保持する)オブジェクトを返します。
  def parent; end

  # --- parent=(val)
  # 
  # 自身を所有する(変数や定数などの形で保持する)オブジェクトを設定します。
  # 
  # @param val [[c:RDoc::CodeObject]] のサブクラスのオブジェクトを指定しま
  #            す。
  def parent=; end

  # --- parent_file_name -> String
  # 
  # self.parent のファイル名を返します。
  # 
  # @see [[m:RDoc::CodeObject#parent]]
  def parent_file_name; end

  # --- parent_name -> String
  # 
  # self.parent の名前を返します。
  # 
  # @see [[m:RDoc::CodeObject#parent]]
  def parent_name; end

  # --- remove_classes_and_modules -> ()
  # 
  # 何もしません。[[m:RDoc::CodeObject#document_children=]] に false を指定
  # した時のコールバックとして呼び出されます。オーバーライドして使用します。
  def remove_classes_and_modules; end

  # --- remove_methods_etc -> ()
  # 
  # 何もしません。[[m:RDoc::CodeObject#document_self=]] に false を指定した
  # 時のコールバックとして呼び出されます。オーバーライドして使用します。
  def remove_methods_etc; end

  # --- section -> RDoc::Context::Section
  # 
  # 所属している section を返します。
  def section; end

  # --- section=(val)
  # 
  # 所属する section を設定します。
  # 
  # @param val [[c:RDoc::Context::Section]] オブジェクトを指定します。
  def section=; end

  # --- start_doc -> ()
  # 
  # 以降に解析したコメントを [[m:RDoc::CodeObject#stop_doc]] を呼び出すまで
  # の間、ドキュメントに含めます。
  # 
  # :startdoc: を見つけた時に呼び出されます。
  # [[m:RDoc::CodeObject#document_self]] と
  # [[m:RDoc::CodeObject#document_children]] を true に設定します。
  # 
  # @see [[m:RDoc::CodeObject#end_doc]]
  def start_doc; end

  # --- stop_doc -> ()
  # 
  # 以降に解析したコメントを [[m:RDoc::CodeObject#start_doc]] を呼び出すま
  # での間、ドキュメントに含めません。
  # 
  # :stopdoc: を見つけた時に呼び出されます。
  # [[m:RDoc::CodeObject#document_self]] と
  # [[m:RDoc::CodeObject#document_children]] を false に設定します。
  # 
  # @see [[m:RDoc::CodeObject#start_doc]]
  def stop_doc; end

  # --- new -> RDoc::CodeObject
  # 
  # 自身を初期化します。
  def new; end

end
