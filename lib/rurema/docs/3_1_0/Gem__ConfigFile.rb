class Gem::ConfigFile
  # --- [](key) -> object
  # 
  # 引数で与えられたキーに対応する設定情報を返します。
  # 
  # @param key 設定情報を取得するために使用するキーを指定します。
  def []; end

  # --- []=(key, value)
  # 
  # 引数で与えられたキーに対応する設定情報を自身に保存します。
  # 
  # @param key 設定情報をセットするために使用するキーを指定します。
  # 
  # @param value 設定情報の値を指定します。
  def []=; end

  # --- args -> Array
  # 
  # 設定ファイルオブジェクトに与えられたコマンドライン引数のリストを返します。
  def args; end

  # --- backtrace -> bool
  # 
  # エラー発生時にバックトレースを出力するかどうかを返します。
  # 
  # 真の場合はバックトレースを出力します。そうでない場合はバックトレースを出力しません。
  def backtrace; end

  # --- backtrace=(backtrace)
  # 
  # エラー発生時にバックトレースを出力するかどうか設定します。
  # 
  # @param backtrace 真を指定するとエラー発生時にバックトレースを出力するようになります。
  def backtrace=; end

  # --- benchmark -> bool
  # 
  # 真の場合はベンチマークを実行します。
  # そうでない場合は、ベンチマークを実行しません。
  def benchmark; end

  # --- benchmark=(benchmark)
  # 
  # ベンチマークを実行するかどうか設定します。
  # 
  # @param benchmark 真を指定するとベンチマークを実行するようになります。
  def benchmark=; end

  # --- bulk_threshold -> Integer
  # 
  # 一括ダウンロードの閾値を返します。
  # インストールしていない Gem がこの数値を越えるとき一括ダウンロードを行います。
  def bulk_threshold; end

  # --- bulk_threshold=(bulk_threshold)
  # 
  # 一括ダウンロードの閾値を設定します。
  # 
  # @param bulk_threshold 数値を指定します。
  def bulk_threshold=; end

  # --- config_file_name -> String
  # 
  # 設定ファイルの名前を返します。
  def config_file_name; end

  # --- each{|key, value| ... } -> Hash
  # 
  # 設定ファイルの各項目のキーと値をブロック引数として与えられたブロックを評価します。
  def each; end

  # --- handle_arguments(arg_list)
  # 
  # コマンドに渡された引数を処理します。
  # 
  # @param arg_list コマンドに渡された引数の配列を指定します。
  def handle_arguments; end

  # --- hash -> Hash
  # 
  # 設定ファイルの各項目のキーと値を要素として持つハッシュです。
  def hash; end

  # --- load_file(file_name) -> object
  # 
  # 与えられたファイル名のファイルが存在すれば YAML ファイルとしてロードします。
  # 
  # @param file_name YAML 形式で記述された設定ファイル名を指定します。
  def load_file; end

  # --- path -> String
  # 
  # Gem を探索するパスを返します。
  def path; end

  # --- path=(path)
  # 
  # Gem を探索するパスをセットします。
  def path=; end

  # --- really_verbose -> bool
  # 
  # このメソッドの返り値が真の場合は verbose モードよりも多くの情報を表示します。
  def really_verbose; end

  # --- update_sources -> bool
  # 
  # 真の場合は [[c:Gem::SourceInfoCache]] を毎回更新します。
  # そうでない場合は、キャッシュがあればキャッシュの情報を使用します。
  def update_sources; end

  # --- update_sources=(update_sources)
  # 
  # [[c:Gem::SourceInfoCache]] を毎回更新するかどうか設定します。
  # 
  # @param update_sources 真を指定すると毎回 [[c:Gem::SourceInfoCache]] を更新します。
  def update_sources=; end

  # --- verbose -> bool | Symbol
  # 
  # ログの出力レベルを返します。
  # 
  # @see [[m:Gem::ConfigFile#verbose=]]
  def verbose; end

  # --- verbose=(verbose_level)
  # 
  # ログの出力レベルをセットします。
  # 
  # 以下の出力レベルを設定することができます。
  # 
  # : false
  #   何も出力しません。
  # : true
  #   通常のログを出力します。
  # : :loud
  #   より多くのログを出力します。
  # 
  # @param verbose_level 真偽値またはシンボルを指定します。
  def verbose=; end

  # --- write
  # 
  # 自身を読み込んだ設定ファイルを書き換えます。
  def write; end

  # --- DEFAULT_BACKTRACE -> false
  # 
  # バックトレースが表示されるかどうかのデフォルト値です。
  def DEFAULT_BACKTRACE; end

  # --- DEFAULT_BENCHMARK -> false
  # 
  # ベンチマークを実行するかどうかのデフォルト値です。
  def DEFAULT_BENCHMARK; end

  # --- DEFAULT_BULK_THRESHOLD -> 1000
  # 
  # 一括ダウンロードをするかどうかのデフォルト値です。
  def DEFAULT_BULK_THRESHOLD; end

  # --- DEFAULT_UPDATE_SOURCES -> true
  # 
  # 毎回 [[c:Gem::SourceInfoCache]] を更新するかどうかのデフォルト値です。
  def DEFAULT_UPDATE_SOURCES; end

  # --- DEFAULT_VERBOSITY -> true
  # 
  # ログレベルのデフォルト値です。
  def DEFAULT_VERBOSITY; end

  # --- OPERATING_SYSTEM_DEFAULTS -> {}
  # 
  # Ruby をパッケージングしている人がデフォルトの設定値をセットするために使用します。
  # 
  # 使用するファイルは rubygems/defaults/operating_system.rb です。
  def OPERATING_SYSTEM_DEFAULTS; end

  # --- PLATFORM_DEFAULTS -> {}
  # 
  # Ruby の実装者がデフォルトの設定値をセットするために使用します。
  # 
  # 使用するファイルは rubygems/defaults/#{RUBY_ENGINE}.rb です。
  def PLATFORM_DEFAULTS; end

  # --- SYSTEM_WIDE_CONFIG_FILE -> String
  # 
  # システム全体の設定ファイルのパスです。
  def SYSTEM_WIDE_CONFIG_FILE; end

end
