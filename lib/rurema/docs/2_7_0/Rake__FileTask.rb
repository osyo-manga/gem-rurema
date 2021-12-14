class Rake::FileTask
  # --- needed? -> bool
  # 
  # このタスクが必要である場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # このタスクで作成しようとしているファイルが存在しない場合や、
  # このタスクで作成しようとしているファイルが古い場合に真を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: "test.txt"
  # file "test.txt" do |task|
  #   Rake.application.options.build_all = false
  #   task.needed? # => true
  #   IO.write("test.txt", "test")
  #   task.needed? # => false
  # end
  # //}
  def needed?; end

  # --- timestamp -> Time | Rake::LateTime
  # 
  # ファイルタスクのタイムスタンプを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: "test.txt"
  # file "test.txt" do |task|
  #   Rake.application.options.build_all = false
  #   task.timestamp # => #<Rake::LateTime:0x2ba58f0>
  # end
  # //}
  def timestamp; end

  # --- scope_name(scope, task_name) -> String
  # 
  # ファイルタスクはスコープを無視します。
  def scope_name; end

end
