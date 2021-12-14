class RDoc::Generator::JsonIndex
  # --- generate -> ()
  # 
  # 解析した情報を [[m:RDoc::Generator::JsonIndex::SEARCH_INDEX_FILE]] に出
  # 力します。
  def generate; end

  # --- new(parent_generator, options) -> RDoc::Generator::JsonIndex
  # 
  # [[c:RDoc::Generator::JsonIndex]] オブジェクトを初期化します。
  # 
  # @param parent_generator 親となるジェネレータオブジェクトを指定します。
  #                         RDoc::Generator::JsonIndex#class_dir や
  #                         #file_dir を決めるのに使用します。
  #                         他のジェネレータとは異なり、[[c:RDoc::Store]]
  #                         オブジェクトではない点に注意してください。
  # 
  # @param options [[c:RDoc::Options]] オブジェクトを指定します。
  #                parent_generator に渡されたものと同じものを指定します。
  def new; end

  # --- SEARCH_INDEX_FILE -> String
  # 
  # 検索インデックスのパスを表す文字列です。
  def SEARCH_INDEX_FILE; end

end
