class Gem::DocManager
  # --- generate_rdoc
  # 
  # 自身にセットされている [[c:Gem::Specification]] の情報をもとに RDoc のドキュメントを生成します。
  def generate_rdoc; end

  # --- generate_ri
  # 
  # 自身にセットされている [[c:Gem::Specification]] の情報をもとに RI 用のデータを生成します。
  def generate_ri; end

  # --- install_rdoc
  # 
  # RDoc を生成してインストールします。
  def install_rdoc; end

  # --- install_ri
  # 
  # RI のデータを生成してインストールします。
  def install_ri; end

  # --- rdoc_installed? -> bool
  # 
  # RDoc がインストール済みの場合は、真を返します。
  # そうでない場合は偽を返します。
  def rdoc_installed?; end

  # --- run_rdoc(*args)
  # 
  # 与えられた引数を使用して RDoc を実行します。
  # 
  # @param args RDoc に与える引数を指定します。
  # 
  # @raise Gem::FilePermissionError RDoc でドキュメント生成中にファイルにアクセス出来なかった場合に発生します。
  def run_rdoc; end

  # --- setup_rdoc
  # 
  # RDoc を実行するための準備を行います。
  # 
  # @raise Gem::FilePermissionError RDoc を保存するディレクトリにアクセスする権限がない場合に発生します。
  def setup_rdoc; end

  # --- uninstall_doc
  # 
  # RDoc と RI 用のデータを削除します。
  def uninstall_doc; end

  # --- configured_args -> Array
  # 
  # RDoc に渡す引数を返します。
  def configured_args; end

  # --- configured_args=(args)
  # 
  # RDoc に渡す引数をセットします。
  # 
  # @param args 文字列の配列か空白区切りの文字列を指定します。
  def configured_args=; end

  # --- load_rdoc
  # 
  # Gem の RDoc が使用可能な場合は使用します。
  # そうでない場合は、標準添付の RDoc を使用します。
  # 
  # @raise Gem::DocumentError RDoc が使用できない場合に発生します。
  def load_rdoc; end

  # --- new(spec, rdoc_args = "") -> Gem::DocManager
  # 
  # 自身を初期化します。
  # 
  # @param spec ドキュメントを生成する対象の [[c:Gem::Specification]] のインスタンスを指定します。
  # 
  # @param rdoc_args RDoc に渡すオプションを指定します。
  def new; end

  # --- update_ri_cache
  # 
  # RDoc 2 がインストールされている場合は RI のキャッシュを更新します。
  # そうでない場合は何もしません。
  def update_ri_cache; end

end
