class Errno::EXXX
  # --- new() -> Errno::EXXX
  # --- new(error_message) -> Errno::EXXX
  # Errno::EXXX オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列
  # 
  #   p Errno::ENOENT.new
  #       # => #<Errno::ENOENT: No such file or directory>
  #   p Errno::ENOENT.new('message')
  #       # => #<Errno::ENOENT: No such file or directory - message>
  def new; end

  # --- Errno -> Integer
  # 
  # Errno::EXXX の各クラスに対応するシステム依存のエラーコード値(整数)です。
  # 
  # 例:
  # 
  #     p Errno::EAGAIN::Errno            # => 11
  #     p Errno::EWOULDBLOCK::Errno       # => 11
  def Errno; end

end
