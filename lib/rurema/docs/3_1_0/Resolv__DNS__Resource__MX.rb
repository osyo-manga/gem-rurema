class Resolv::DNS::Resource::MX
  # --- exchange -> Resolv::DNS::Name
  # MXのホスト名を返します。
  def exchange; end

  # --- preference -> Integer
  # このMXレコードの優先度を返します。
  def preference; end

  # --- new(preference, exchange) -> Resolv::DNS::Resource::MX
  # Resolv::DNS::Resource::MX のインスタンスを返します。
  # 
  # @param preference MXの優先度
  # @param exchange MXのホスト
  def new; end

end
