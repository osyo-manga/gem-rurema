class Gem::Package::TarWriter::RestrictedStream
  # --- write(data) -> Integer
  # 
  # 与えられたデータを自身に関連付けられた IO に書き込みます。
  # 
  # @param data 書き込むデータを指定します。
  # 
  # @return 書き込んだデータのサイズを返します。
  def write; end

  # --- new(io) -> Gem::Package::TarWriter::RestrictedStream
  # 
  # 自身を初期化します。
  # 
  # @param io ラップする IO を指定します。
  def new; end

end
