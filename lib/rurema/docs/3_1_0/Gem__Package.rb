module Gem::Package
  # --- open(io, mode = 'r', signer = nil){|tar_io| ... }
  # @todo ???
  # 
  # io を開いて与えられたブロックに渡してブロックを評価します。
  # 
  # @param io IO オブジェクトを指定します。普通は Gem パッケージを開いたファイルオブジェクトを指定します。
  # 
  # @param mode モードを文字列で指定します。指定できるモードは読み込み (r) と書き込み (w) です。
  # 
  # @param signer ???
  def open; end

  # --- pack(src, destname, signer = nil)
  # @todo
  # 
  # ???
  # 
  # @param src ???
  # 
  # @param destname ???
  # 
  # @param signer ???
  def pack; end

end
