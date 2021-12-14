class Resolv::DNS::Resource::HINFO
  # --- cpu -> String
  # ホストで使われる CPU 名(ハードウェア名)を返します。
  def cpu; end

  # --- os -> String
  # ホストで使われる OS 名を返します。
  def os; end

  # --- new(cpu, os) -> Resolv::DNS::Resource::HINFO
  # Resolv::DNS::Resource::HINFO のインスタンスを生成します。
  # 
  # @param cpu CPU 名
  # @param os OS 名
  def new; end

end
