class Rake::InvocationChain
  # --- append(task_name) -> Rake::InvocationChain
  # 
  # 与えられたタスク名を追加して新しい [[c:Rake::InvocationChain]] を返します。
  # 
  # @param task_name 追加するタスク名を指定します。
  # 
  # @raise RuntimeError 循環したタスクの呼び出しを検出した場合に発生します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   invocation_chain= Rake::InvocationChain.new("task_a", Rake::InvocationChain::EMPTY)
  #   invocation_chain.append("task_b") # => LL("task_b", "task_a")
  # end
  # //}
  def append; end

  # --- member?(task_name) -> bool
  # 
  # 与えられたタスク名が自身に含まれる場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   invocation_chain = Rake::InvocationChain.new("task_a", Rake::InvocationChain::EMPTY)
  #   invocation_chain.member?("task_a") # => true
  #   invocation_chain.member?("task_b") # => false
  # end
  # //}
  def member?; end

  # --- to_s -> String
  # 
  # トップレベルのタスクから自身までの依存関係を文字列として返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   invocation_chain= Rake::InvocationChain.new("task_a", Rake::InvocationChain::EMPTY)
  #   invocation_chain.to_s # => "TOP => task_a"
  # end
  # //}
  def to_s; end

  # --- append(task_name, chain) -> Rake::InvocationChain
  # 
  # 与えられたタスク名を第二引数の [[c:Rake::InvocationChain]] に追加します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # @param chain 既に存在する [[c:Rake::InvocationChain]] のインスタンスを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   chain = Rake::InvocationChain::EMPTY
  #   b = Rake::InvocationChain.append("task_a", chain)
  #   b.to_s # => "TOP => task_a"
  # end
  # //}
  def append; end

  # --- new(task_name, tail)
  # 
  # 与えられたタスク名と一つ前の [[c:Rake::InvocationChain]] を用いて自身を初期化します。
  # 
  # @param task_name タスク名を指定します。
  # 
  # @param tail 一つ前の [[c:Rake::InvocationChain]] を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   tail = Rake::InvocationChain.new("task_a", Rake::InvocationChain::EMPTY)
  #   tail.to_s # => "TOP => task_a"
  #   b = Rake::InvocationChain.new("task_b", tail)
  #   b.to_s # => "TOP => task_a => task_b"
  # end
  # //}
  def new; end

  # --- EMPTY -> Rake::InvocationChain::EmptyInvocationChain
  # 
  # [[c:Rake::InvocationChain::EmptyInvocationChain]] のインスタンスを表します。
  def EMPTY; end

end
