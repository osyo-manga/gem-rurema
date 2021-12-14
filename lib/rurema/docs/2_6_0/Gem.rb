module Gem
  # --- clear_paths -> nil
  # 
  # [[m:Gem.#dir]], [[m:Gem.#path]] の値をリセットします。
  # 
  # 次に [[m:Gem.#dir]], [[m:Gem.#path]] が呼ばれた時は、値を最初から計算します。
  # このメソッドは主にユニットテストの独立性を提供するために使用します。
  def clear_paths; end

  # --- dir -> String
  # 
  # Gem のインストールされているディレクトリを返します。
  def dir; end

  # --- ensure_gem_subdirectories
  # 
  # Gem をインストールするために必要なサブディレクトリを適切に作成します。
  # 
  # ディレクトリを作成する権限が無い場合もこのメソッドからは例外は発生しません。
  # 
  # @see [[m:Gem::DIRECTORIES]]
  def ensure_gem_subdirectories; end

  # --- marshal_version -> String
  # 
  # [[c:Marshal]] のバージョンを表す文字列を返します。
  def marshal_version; end

  # --- path -> Array
  # 
  # Gem を検索するパスの配列を返します。
  def path; end

  # --- prefix -> String
  # 
  # このライブラリがインストールされているディレクトリの親ディレクトリを返します。
  def prefix; end

  # --- set_home
  # 
  # Gem のホームディレクトリをセットします。
  # 
  # @see [[m:Gem.#set_home]]
  def set_home; end

  # --- set_paths
  # 
  # Gem を検索するパスをセットします。
  # 
  # @see [[m:Gem.#path]]
  def set_paths; end

  # --- source_index -> Gem::SourceIndex
  # 
  # [[m:Gem.#path]] にある [[c:Gem::Specification]] のキャッシュを返します。
  # インストールされている [[c:Gem::Specification]] のインデックスを返します
  # 
  # @see [[c:Gem::SourceIndex]], [[c:Gem::Specification]]
  def source_index; end

  # --- win_platform? -> bool
  # 
  # Windows プラットフォームであれば真を返します。そうでなければ偽を返します。
  # 
  # @see [[m:Object::RUBY_PLATFORM]]
  def win_platform?; end

  # --- default_bindir -> String
  # 
  # 実行ファイルのデフォルトのパスを返します。
  def default_bindir; end

  # --- default_dir -> String
  # 
  # デフォルトの Gem パッケージをインストールするディレクトリを返します。
  def default_dir; end

  # --- default_exec_format -> String
  # 
  # デフォルトのインストールするコマンド名を決めるためのフォーマット文字列を返します。
  def default_exec_format; end

  # --- default_path -> [String]
  # 
  # デフォルトの Gem パッケージをロードするディレクトリのリストを返します。
  def default_path; end

  # --- default_sources -> [String]
  # 
  # デフォルトのパッケージ情報取得先のリストを返します。
  def default_sources; end

  # --- default_system_source_cache_dir -> String
  # 
  # デフォルトのシステム全体のソースキャッシュファイルのパスを返します。
  def default_system_source_cache_dir; end

  # --- default_user_source_cache_dir -> String
  # 
  # デフォルトのユーザ専用のソースキャッシュファイルのパスを返します。
  def default_user_source_cache_dir; end

  # --- ensure_ssl_available
  # 
  # OpenSSL が使用可能でない場合は例外を発生させます。
  # 
  # @raise Gem::Exception OpenSSL が有効でない場合に発生します。
  def ensure_ssl_available; end

  # --- ruby_engine -> String
  # 
  # Ruby処理系実装の種類を表す文字列を返します。
  def ruby_engine; end

  # --- ssl_available? -> bool
  # 
  # 現在実行中のプラットフォームで OpenSSL が有効である場合は真を返します。
  # そうでない場合は偽を返します。
  def ssl_available?; end

  # --- user_dir -> String
  # 
  # ユーザのホームディレクトリの中の Gem のパスを返します。
  def user_dir; end

  # --- ConfigMap -> Hash
  # 
  # [[m:RbConfig::CONFIG]] の中からこのライブラリで使用するものを抽出して定義したハッシュ。
  def ConfigMap; end

  # --- DIRECTORIES -> Array
  # 
  # Gem のホームディレクトリ以下に作成されるサブディレクトリの配列。
  def DIRECTORIES; end

  # --- MD5 -> Class
  # 
  # [[c:Digest::MD5]] です。
  def MD5; end

  # --- RubyGemsVersion        -> String
  # --- RubyGemsPackageVersion -> String
  # 
  # このライブラリのバージョンを表す文字列。
  def RubyGemsPackageVersion; end

  # --- SHA1 -> Class
  # 
  # [[c:Digest::SHA1]] です。
  def SHA1; end

  # --- SHA256 -> Class
  # 
  # [[c:Digest::SHA256]] です。
  def SHA256; end

  # --- WIN_PATTERNS -> Array
  # 
  # Windows 上で動いている Ruby を識別するための正規表現の配列。
  def WIN_PATTERNS; end

end
