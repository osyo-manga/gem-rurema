class Gem::Package::TarInput
  # --- close
  # 自身と自身に関連付けられた IO を close します。
  def close; end

  # --- each{|entry| ... }
  # data.tar.gz の各エントリをブロックに渡してブロックを評価します。
  # 
  # @see [[m:Gem::Package::TarReader#each]]
  def each; end

  # --- extract_entry(destdir, entry, expected_md5sum = nil)
  # 指定された destdir に entry を展開します。
  # 
  # @param destdir 展開先のディレクトリを指定します。
  # 
  # @param entry エントリを指定します。
  # 
  # @param expected_md5sum 期待する MD5 チェックサムを指定します。
  # 
  # @raise Gem::Package::BadCheckSum チェックサムが一致しなかった場合に発生します。
  def extract_entry; end

  # --- load_gemspec(io) -> Gem::Specification | nil
  # 
  # YAML 形式の gemspec を io から読み込みます。
  # 
  # @param io 文字列か [[c:IO]] オブジェクトを指定します。
  # 
  # @see [[m:Gem::Specification.from_yaml]]
  def load_gemspec; end

  # --- metadata -> Gem::Specification
  # 
  # メタデータを返します。
  def metadata; end

  # --- zipped_stream(entry) -> StringIO
  # 
  # 与えられた entry の圧縮したままの StringIO を返します。
  # 
  # @param entry エントリを指定します。
  def zipped_stream; end

  # --- new(io, security_policy = nil)
  # @todo ???
  # このクラスを初期化します。
  # 
  # @param io 自身に関連付ける IO を指定します。
  # 
  # @param security_policy ???
  def new; end

  # --- open(io, security_policy = nil){|is| ... }
  # @todo ???
  # ブロックに [[c:Gem::Package::TarInput]] のインスタンスを与えて評価します。
  # 
  # @param io 自身に関連付ける IO を指定します。
  # 
  # @param security_policy ???
  def open; end

end
