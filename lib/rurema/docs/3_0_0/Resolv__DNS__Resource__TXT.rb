class Resolv::DNS::Resource::TXT
  # --- data -> String
  # TXT レコードの最初の文字列を返します。
  def data; end

  # --- strings -> [String]
  # TXT レコードの文字列を配列で返します。
  def strings; end

  # --- new(first_string, *rest_strings) -> Resolv::DNS::Resource::TXT
  # Resolv::DNS::Resource::TXTのインスタンスを生成します。
  # 
  # @param first_string レコードの最初の文字列
  # @param rest_strings レコードの残りの文字列
  def new; end

end
