class Gem::RemoteFetcher::FetchError
  # --- uri -> URI
  # 
  # 問題が発生した URI を返します。
  def uri; end

  # --- new(message, uri) -> Gem::RemoteFetcher::FetchError
  # 
  # この例外クラスを初期化します。
  # 
  # @param message メッセージを指定します。
  # 
  # @param uri 問題が発生した URI を指定します。
  def new; end

end
