class Rake::Application
  # --- add_loader(ext, loader)
  # 
  # 与えられた拡張子で終わるファイル名のファイルをロードするためのローダーを
  # 自身に追加します。
  # 
  # @param ext 拡張子を指定します。
  # 
  # @param loader ローダーを指定します。
  # 
  # //emlist[例][ruby]{
  # require "rake/loaders/makefile"
  # 
  # # Rakefile での記載例とする
  # 
  # task default: :test
  # task :test
  # 
  # makefile =<<-EOS
  # << <<-'SAMPLE_MF'
  # # Comments
  # a: a1 a2 a3 a4
  # EOS
  # IO.write("sample.mf", makefile)
  # Rake.application.add_loader("mf", Rake::MakefileLoader.new)
  # Rake.application.add_import("sample.mf")
  # Rake::Task.task_defined?("a") # => false
  # Rake.application.load_imports
  # Rake::Task.task_defined?("a") # => true
  # //}
  def add_loader; end

  # --- init(app_name = 'rake')
  # 
  # コマンドラインオプションとアプリケーション名を初期化します。
  # 
  # //emlist[例][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test
  # task :test
  # 
  # Rake.application.name # => "rake"
  # Rake.application.init("MyApp") # => ["default"]
  # Rake.application.name # => "MyApp"
  # //}
  def init; end

  # --- load_rakefile
  # 
  # Rakefile を探してロードします。
  def load_rakefile; end

  # --- name -> String
  # 
  # アプリケーションの名前を返します。通常は 'rake' という名前を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.name # => "rake"
  # end
  # //}
  def name; end

  # --- options -> OpenStruct
  # 
  # コマンドラインで与えられたアプリケーションのオプションを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.options  # => #<OpenStruct always_multitask=false, backtrace=false, build_all=false, dryrun=false, ignore_deprecate=false, ignore_system=false, job_stats=false, load_system=false, nosearch=false, rakelib=["rakelib"], show_all_tasks=false, show_prereqs=false, show_task_pattern=nil, show_tasks=nil, silent=false, suppress_backtrace_pattern=nil, thread_pool_size=8, trace=false, trace_output=#<IO:<STDERR>>, trace_rules=false>
  # end
  # //}
  def options; end

  # --- original_dir -> String
  # 
  # rake コマンドを実行したディレクトリを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.original_dir # => "/path/to/dir"
  # end
  # //}
  def original_dir; end

  # --- rakefile -> String
  # 
  # 実際に使用されている Rakefile の名前を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.rakefile # => "Rakefile"
  # end
  # //}
  def rakefile; end

  # --- run
  # 
  # Rake アプリケーションを実行します。
  # 
  # このメソッドは以下の 3 ステップを実行します。
  # 
  #  * コマンドラインオプションを初期化します。[[m:Rake::Application#init]]
  #  * タスクを定義します。[[m:Rake::Application#load_rakefile]]
  #  * コマンドラインで指定されたタスクを実行します。[[m:Rake::Application#top_level]]
  def run; end

  # --- top_level
  # 
  # Rake アプリケーションに与えられたトップレベルのタスク
  # (コマンドラインで指定されたタスク) を実行します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test1
  # task :test1
  # task :test2 do
  #   puts "test2"
  # end
  # 
  # # rake test2 で実行
  # Rake.application.top_level
  # 
  # # => "test2"
  # //}
  def top_level; end

  # --- top_level_tasks -> Array
  # 
  # コマンドラインで指定されたタスクのリストを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.top_level_tasks # => ["default"]
  # end
  # //}
  def top_level_tasks; end

  # --- tty_output=(tty_output_state)
  # 
  # TTY に対する出力状態を上書きします。
  # 
  # 大抵の場合、テストのために使用します。
  # 
  # @param tty_output_state 変更後の状態を指定します
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.tty_output?                 # => false
  #   Rake.application.tty_output = "debug output" # => "debug output"
  #   Rake.application.tty_output?                 # => "debug output"
  # end
  # //}
  def tty_output=; end

  # --- DEFAULT_RAKEFILES -> Array
  # 
  # デフォルトで Rakefile として扱うファイル名の配列を返します。
  # 
  # 'rakefile', 'Rakefile', 'rakefile.rb', 'Rakefile.rb' が指定されています。
  def DEFAULT_RAKEFILES; end

end
