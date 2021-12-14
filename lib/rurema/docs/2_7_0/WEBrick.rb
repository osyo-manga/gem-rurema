module WEBrick
  # --- CR -> "\x0d"
  # 
  # 内部で利用する定数です。
  def CR; end

  # --- CRLF -> "\x0d\x0a"
  # 
  # 内部で利用する定数です。
  def CRLF; end

  # --- LF -> "\x0a"
  # 
  # 内部で利用する定数です。
  def LF; end

  # --- VERSION
  # 
  # WEBrick のバージョンを表す文字列です。
  # 
  #  require 'webrick'
  #  p WEBrick::VERSION   #=> "1.3.1"
  # 
  #   
  def VERSION; end

end
