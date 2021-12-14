class PStore::DummyMutex
  # --- synchronize{ ... } -> object
  # 
  # 与えられたブロックを評価するだけで何もしません。
  def synchronize; end

end
