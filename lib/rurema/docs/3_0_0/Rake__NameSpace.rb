class Rake::NameSpace
  # --- [](name) -> Rake::Task
  # 
  # 与えられた名前のタスクを返します。
  # 
  # @param name タスクの名前を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # namespace :ns do |ns|
  #   task :ts1 do
  #   end
  #   task :ts2 do
  #   end
  # 
  #   ns[:ts1] # => <Rake::Task ns:ts1 => []>
  #   ns[:ts2] # => <Rake::Task ns:ts2 => []>
  # end
  # //}
  def []; end

  # --- tasks -> Array
  # 
  # タスクのリストを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # namespace :ns do |ns|
  #   task :ts1 do
  #   end
  #   task :ts2 do
  #   end
  # 
  #   ns.tasks # => [<Rake::Task ns:ts1 => []>, <Rake::Task ns:ts2 => []>]
  # end
  # //}
  def tasks; end

  # --- new(task_manager, scope_list)
  # 
  # 自身を初期化します。
  # 
  # @param task_manager [[c:Rake::Application]] のインスタンスを指定します。
  # 
  # @param scope_list 名前空間のリストを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   name_space = Rake::NameSpace.new(Rake.application, Rake::Scope.new("sample"))
  #   name_space.scope # => LL("sample")
  # end
  # //}
  def new; end

end
