class Prime::TrialDivisionGenerator
  # --- next -> Integer
  # --- succ -> Integer
  # 
  # 次の(擬似)素数を返します。なお、この実装においては擬似素数は真に素数です。
  # 
  # また内部的な列挙位置を進めます。
  def next; end

  # --- rewind -> nil
  # 
  # 列挙状態を巻き戻します。
  def rewind; end

end
