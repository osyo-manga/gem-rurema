module Rake
  # --- application -> Rake::Application
  # 
  # 現在の Rake アプリケーションを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # require 'pp'
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   pp Rake.application
  # end
  # 
  # # => #<Rake::Application:0x31b0f18
  # #     @default_loader=#<Rake::DefaultLoader:0x31b0c78>,
  # #     @imported=[],
  # #     @last_description=nil,
  # #     @loaders=
  # #      {".rb"=>#<Rake::DefaultLoader:0x31b0c18>,
  # #       ".rf"=>#<Rake::DefaultLoader:0x31b0b88>,
  # #       ".rake"=>#<Rake::DefaultLoader:0x31b0b10>},
  # #     @name="rake",
  # #     @options=#<OpenStruct rakelib=["rakelib"], trace_output=#<IO:<STDERR>>>,
  # #     @original_dir="/path/to/dir",
  # #     @pending_imports=[],
  # #     @rakefile="rakefile",
  # #     @rakefiles=["rakefile", "Rakefile", "rakefile.rb", "Rakefile.rb"],
  # #     @rules=[],
  # #     @scope=LL(),
  # #     @tasks=
  # #      {"default"=><Rake::Task default => [test_rake_app]>,
  # #       "test_rake_app"=><Rake::Task test_rake_app => []>},
  # #     @terminal_columns=0,
  # #     @top_level_tasks=["default"],
  # #     @tty_output=false>
  # //}
  def application; end

  # --- application=(app)
  # 
  # 現在の Rake アプリケーションをセットします。
  # 
  # @param app [[c:Rake::Application]] のインスタンスを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # require 'pp'
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   app = Rake::Application.new
  #   app.tty_output = true
  #   Rake.application = app
  #   pp Rake.application
  # end
  # 
  # # => #<Rake::Application:0x00005624e6c30eb8
  # #     @default_loader=#<Rake::DefaultLoader:0x00005624e6c30cd8>,
  # #     @imported=[],
  # #     @last_description=nil,
  # #     @loaders=
  # #      {".rb"=>#<Rake::DefaultLoader:0x00005624e6c30bc0>,
  # #       ".rf"=>#<Rake::DefaultLoader:0x00005624e6c30b48>,
  # #       ".rake"=>#<Rake::DefaultLoader:0x00005624e6c30a80>},
  # #     @name="rake",
  # #     @options=
  # #      #<OpenStruct always_multitask=false, backtrace=false, build_all=false, dryrun=false, ignore_deprecate=false, ignore_system=false, job_stats=false, load_system=false, nosearch=false, rakelib=["rakelib"], show_all_tasks=false, show_prereqs=false, show_task_pattern=nil, show_tasks=nil, silent=false, suppress_backtrace_pattern=nil, thread_pool_size=20, trace=false, trace_output=#<IO:<STDERR>>, trace_rules=false>,
  # #     @original_dir="/path/to/dir",
  # #     @pending_imports=[],
  # #     @rakefile=nil,
  # #     @rakefiles=["rakefile", "Rakefile", "rakefile.rb", "Rakefile.rb"],
  # #     @rules=[],
  # #     @scope=LL(),
  # #     @tasks={},
  # #     @terminal_columns=0,
  # #     @top_level_tasks=[],
  # #     @tty_output=true>
  # //}
  def application=; end

  # --- original_dir -> String
  # 
  # Rake アプリケーションを開始したディレクトリを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.original_dir # => "/path/to/dir"
  # end
  # //}
  def original_dir; end

  # --- EARLY -> Rake::EarlyTime
  # 
  # [[c:Rake::EarlyTime]] の唯一のインスタンスを返します。
  def EARLY; end

  # --- EMPTY_TASK_ARGS -> Rake::TaskArguments
  # 
  # 空のタスクに渡すパラメータをあらわす定数です。
  def EMPTY_TASK_ARGS; end

end
