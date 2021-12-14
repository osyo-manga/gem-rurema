class Rake::EarlyTime
  # --- <=>(other) -> -1
  # 
  # 必ず -1 を返します。
  # 
  # @param other 比較対象のオブジェクト
  # 
  # @return -1 を返します。
  def <=>; end

  # --- to_s -> String
  # 
  # "<EARLY TIME>" という文字列を返します。
  def to_s; end

end
