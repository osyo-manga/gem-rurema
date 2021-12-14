module RDoc
  # --- ATTR_MODIFIERS     -> [String]
  # 
  # ライブラリの内部で使用します。
  def ATTR_MODIFIERS; end

  # --- CLASS_MODIFIERS    -> [String]
  # 
  # ライブラリの内部で使用します。
  def CLASS_MODIFIERS; end

  # --- CONSTANT_MODIFIERS -> [String]
  # 
  # ライブラリの内部で使用します。
  def CONSTANT_MODIFIERS; end

  # --- DOT_DOC_FILENAME -> ".document"
  # 
  # rdoc コマンドが処理するファイル名の一覧が書かれたファイルの名前を返します。
  def DOT_DOC_FILENAME; end

  # --- GENERAL_MODIFIERS  -> [String]
  # 
  # ライブラリの内部で使用します。
  def GENERAL_MODIFIERS; end

  # --- KNOWN_CLASSES -> {String => String}
  # 
  # Ruby の組み込みクラスの内部的な変数名がキー、クラス名が値のハッシュです。
  # 
  #   RDoc::KNOWN_CLASSES["rb_cObject"] # => "Object"
  # 
  # ライブラリの内部で使用します。
  def KNOWN_CLASSES; end

  # --- METHOD_MODIFIERS   -> [String]
  # 
  # ライブラリの内部で使用します。
  def METHOD_MODIFIERS; end

  # --- VERSION -> String
  # 
  # RDoc のバージョンを表す文字列を返します。
  def VERSION; end

end
