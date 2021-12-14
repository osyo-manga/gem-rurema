module Rake::TaskManager
  # --- [](task_name, scopes = nil) -> Rake::Task
  # 
  # 与えられたタスク名にマッチするタスクを検索します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # @param scopes スコープを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application["test_rake_app"] # => <Rake::Task test_rake_app => []>
  # end
  # //}
  def []; end

  # --- clear
  # 
  # 全てのタスクとルールをクリアします。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.tasks # => [<Rake::Task default => [test_rake_app]>, <Rake::Task test_rake_app => []>]
  #   Rake.application.clear # => []
  #   Rake.application.tasks # => []
  # end
  # //}
  def clear; end

  # --- create_rule(*args){ ... }
  # 
  # 与えられたパラメータに従ってルールを作成します。
  # 
  # @param args ルールに与えるパラメータを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   rule = Rake.application.create_rule '.txt' => '.md' do |t|
  #     "#{t}"
  #   end
  #   p rule # => [[/\.txt$/, [], [".md"], nil, #<Proc:0x0000558dd2e32d20 /path/to/Rakefile:5>]]
  # end
  # //}
  def create_rule; end

  # --- current_scope -> Array
  # 
  # 現在のスコープを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.current_scope # => LL()
  # end
  # //}
  def current_scope; end

  # --- define_task(task_class, *args){ ... } -> Rake::Task
  # 
  # タスクを定義します。
  # 
  # @param task_class タスククラスを指定します。
  # 
  # @param args タスクに渡すパラメータを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   Rake.application.define_task(Rake::Task, :t) # => <Rake::Task t => []>
  # end
  # //}
  def define_task; end

  # --- enhance_with_matching_rule(task_name, level = 0) -> Rake::Task | nil
  # 
  # 与えられたタスク名にマッチしたルールが存在する場合は、そのタスクに見つかったルールの
  # 事前タスクとアクションを追加して返します。
  # 
  # @param task_name タスクの名前を指定します。
  # 
  # @param level 現在のルール解決のネストの深さを指定します。
  # 
  # @raise RuntimeError ルールの解決時にオーバーフローした場合に発生します。
  def enhance_with_matching_rule; end

  # --- in_namespace(name){|name_space| ... } -> Array
  # 
  # 与えられた名前の名前空間でブロックを評価します。
  # 
  # @param name 名前を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # 
  # namespace :sample do
  #   def hoge
  #     puts "hoge"
  #   end
  # end
  # 
  # task :test_rake_app do
  #   task.application.in_namespace("sample") do
  #     hoge # => "hoge"
  #   end
  # end
  # //}
  def in_namespace; end

  # --- intern(task_class, task_name) -> Rake::Task
  # 
  # タスクを検索します。
  # 
  # タスクが見つかれば見つかったタスクを返します。
  # 見つからなければ、与えられた型のタスクを作成して返します。
  # 
  # @param task_class タスクのクラスを指定します。
  # 
  # @param task_name タスクの名前を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # 
  # task :test_rake_app do |task|
  #   task.application.intern(Rake::Task, "test_rake_app") # => <Rake::Task test_rake_app => []>
  #   task.application.intern(Rake::Task, "sample_task")   # => <Rake::Task sample_task => []>
  # end
  # //}
  def intern; end

  # --- last_description -> String
  # --- last_comment -> String
  # 
  # Rakefile 内の最新の詳細説明を追跡するためのメソッドです。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app1
  # 
  # desc "test1"
  # task :test_rake_app1 do |task|
  #   p task.application.last_description # => "test2"
  # end
  # 
  # desc "test2"
  # task :test_rake_app2 do |task|
  # end
  # //}
  def last_comment; end

  # --- last_description=(description)
  # 
  # 最新の詳細説明をセットします。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app1
  # 
  # desc "test1"
  # task :test_rake_app1 do |task|
  #   task.application.last_description # => "test2"
  #   task.application.last_description = "test3"
  #   task.application.last_description # => "test3"
  # end
  # 
  # desc "test2"
  # task :test_rake_app2 do |task|
  # end
  # //}
  def last_description=; end

  # --- lookup(task_name, initial_scope = nil) -> Rake::Task | nil
  # 
  # 与えられたタスク名にマッチするタスクを検索します。
  # 
  # このメソッドは、ファイルタスクやルールを合成せずにタスクを探します。
  # 特別なスコープ ('^' など) が存在します。スコープが省略された場合は
  # 現在のスコープを使用します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # @param initial_scope 検索するスコープを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # 
  # task :test_rake_app do |task|
  #   task.application.lookup("test_rake_app") # => <Rake::Task test_rake_app => []>
  # end
  # //}
  def lookup; end

  # --- resolve_args(args) -> Array
  # 
  # タスクやルールに与えられたパラメータを解釈します。
  # 
  # @param args パラメータを指定します。
  # 
  # @return [task_name, arg_name_list, prerequisites] を返します。
  def resolve_args; end

  # --- synthesize_file_task(task_name) -> Rake::FileTask | nil
  # 
  # 与えられたタスク名をもとにファイルタスクを合成します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # @return 与えられたタスク名と同名のファイルが存在する場合は、ファイルタスクを作成して返します。
  #         そうでない場合は nil を返します。
  # 
  # @raise RuntimeError タスクを合成できなかった場合に発生します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # 
  # task :test_rake_app do |task|
  #   task.application.synthesize_file_task("sample_file") # => nil
  #   IO.write("sample_file", "")
  #   task.application.synthesize_file_task("sample_file") # => <Rake::FileTask sample_file => []>
  # end
  # //}
  def synthesize_file_task; end

  # --- tasks -> Array
  # 
  # 全てのタスクリストを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'pp'
  # 
  # task default: :test_rake_app2
  # 
  # task :test_rake_app1 do |task|
  # end
  # 
  # task :test_rake_app2 do |task|
  #   pp task.application.tasks
  #   # => [<Rake::Task default => [test_rake_app2]>,
  #   #    <Rake::Task test_rake_app1 => []>,
  #   #    <Rake::Task test_rake_app2 => []>]
  # end
  # //}
  def tasks; end

end
