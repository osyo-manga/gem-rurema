module IRB::HistorySavingAbility
  # --- load_history -> ()
  # 
  # irb のヒストリを履歴ファイルから読み込みます。
  # 
  # @see [[ref:lib:irb#history]]
  def load_history; end

  # --- save_history -> ()
  # 
  # irb のヒストリを履歴ファイルに保存します。
  # 
  # @see [[ref:lib:irb#history]]
  def save_history; end

  # --- extended(obj) -> object
  # 
  # obj に irb のヒストリの読み込み、保存の機能を提供します。
  # 
  # obj を返します。
  # 
  # @param obj [[c:IRB::HistorySavingAbility]] を extend したオブジェクトです。
  def extended; end

end
