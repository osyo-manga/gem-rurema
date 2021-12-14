class Rake::InvocationChain::EmptyInvocationChain
  # --- append(task_name) -> Rake::InvocationChain
  # 
  # 与えられた値を追加した [[c:Rake::InvocationChain]] を返します。
  # 
  # @param task_name 追加する値を指定します。
  def append; end

  # --- member?(task_name) -> bool
  # 
  # 偽を返します。
  def member?; end

  # --- to_s -> String
  # 
  # 'TOP' という文字列を返します。
  def to_s; end

end
