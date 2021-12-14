module Gem::DefaultUserInteraction
  # --- ui -> Gem::ConsoleUI
  # 
  # デフォルトの UI を返します。
  # 
  # @see [[m:Gem::DefaultUserInteraction.ui]]
  def ui; end

  # --- ui=(new_ui)
  # 
  # デフォルトの UI を新しくセットします。
  # 
  # @param new_ui 新しい UI を指定します。
  # 
  # @see [[m:Gem::DefaultUserInteraction.ui=]]
  def ui=; end

  # --- use_ui(new_ui){ ... }
  # 
  # 与えられたブロックを評価している間だけ UI として new_ui を使用します。
  # 
  # @param new_ui 新しい UI を指定します。
  # 
  # @see [[m:Gem::DefaultUserInteraction.use_ui]]
  def use_ui; end

  # --- ui -> Gem::ConsoleUI
  # 
  # デフォルトの UI を返します。
  def ui; end

  # --- ui=(new_ui)
  # 
  # デフォルトの UI を新しくセットします。
  # 
  # デフォルトの UI を明確にセットしたことがなければ、シンプルなコンソールベースの
  # [[c:Gem::UserInteraction]] を自動的に使用します。
  # 
  # @param new_ui 新しい UI を指定します。
  def ui=; end

  # --- use_ui(new_ui){ ... }
  # 
  # 与えられたブロックを評価している間だけ UI として new_ui を使用します。
  # 
  # @param new_ui 新しい UI を指定します。
  def use_ui; end

end
