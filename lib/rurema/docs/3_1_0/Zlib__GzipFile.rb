class Zlib::GzipFile
  # --- close -> IO
  # 
  # GzipFile オブジェクトをクローズします。このメソッドは
  # 関連付けられている IO オブジェクトの close メソッドを呼び出します。
  # 関連付けられている IO オブジェクトを返します。
  def close; end

  # --- closed? -> bool
  # --- to_io -> IO
  # 
  # IO クラスの同名メソッドと同じ。
  # 
  # @see [[m:IO#to_io]], [[m:IO#closed?]]
  def closed?; end

  # --- comment -> String | nil
  # 
  # gzip ファイルのヘッダーに記録されているコメントを返します。
  # コメントが存在しない場合は nil を返します。
  def comment; end

  # --- crc -> Integer
  # 
  # 圧縮されていないデータの CRC 値を返します。
  def crc; end

  # --- finish -> IO
  # 
  # GzipFile オブジェクトをクローズします。[[m:Zlib::GzipFile#close]]と違い、
  # このメソッドは関連付けられている IO オブジェクトの close メソッドを
  # 呼び出しません。関連付けられている IO オブジェクトを返します。
  def finish; end

  # --- level -> Integer
  # 
  # 圧縮レベルを返します。
  def level; end

  # --- mtime -> Time
  # 
  # gzip ファイルのヘッダーに記録されている最終更新時間を返します。
  def mtime; end

  # --- orig_name -> String | nil
  # 
  # gzip ファイルのヘッダーに記録されている元ファイル名を返します。
  # ファイル名が記録されていない場合は nil を返します。
  def orig_name; end

  # --- os_code -> Integer
  # 
  # gzip ファイルのヘッダーに記録されている OS コード番号を返します。
  def os_code; end

  # --- path -> String
  # 
  # 関連付けられている IO オブジェクトのパスを返します。
  # このメソッドは IO オブジェクトが path というメソッドを持つ場合のみ定義されます。
  def path; end

  # --- sync -> bool
  # --- sync=(flag) 
  # 
  # IO クラスと同じ。flag が真の時、関連付けられている
  # IO オブジェクトが flush メソッドを持っていなければなりません。
  # また、true にすると圧縮率が著しく低下します。
  # 
  # @see [[m:IO#sync]], [[m:IO#sync]]
  def sync; end

  # --- new(*args) -> ()
  # 
  # 直接使用しません。
  # 通常、具体的な読み書きをおこなうためには、
  # [[m:Zlib::GzipReader.new]] もしくは、 [[m:Zlib::GzipWriter.new]] を使用します。
  # 
  # @see [[m:Zlib::GzipReader.new]], [[m:Zlib::GzipWriter.new]] 
  def new; end

  # --- open(*args) {|gz| ... } -> ()
  # 
  # 直接使用しません。
  # 通常、具体的な読み書きをおこなうためには、
  # [[m:Zlib::GzipReader.open]] もしくは、[[m:Zlib::GzipWriter.open]] を使用します。
  # 
  # @see [[m:Zlib::GzipReader.open]], [[m:Zlib::GzipWriter.open]]
  def open; end

  # --- wrap(*args) {|gz| ... } -> ()
  # 
  # 直接使用しません。
  # 通常、具体的な読み書きをおこなうためには、
  # [[m:Zlib::GzipReader.wrap]] もしくは、[[m:Zlib::GzipWriter.wrap]] を使用します。
  # 
  # @see [[m:Zlib::GzipReader.wrap]],[[m:Zlib::GzipWriter.wrap]]
  def wrap; end

end
