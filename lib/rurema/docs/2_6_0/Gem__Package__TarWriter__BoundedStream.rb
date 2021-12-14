class Gem::Package::TarWriter::BoundedStream
  # --- limit -> Integer
  # 
  # 書き込み可能な最大のサイズを返します。
  def limit; end

  # --- write(data) -> Integer
  # 
  # 与えられたデータを自身に関連付けられた IO に書き込みます。
  # 
  # @param data 書き込むデータを指定します。
  # 
  # @return 書き込んだデータのサイズを返します。
  # 
  # @raise Gem::Package::TarWriter::FileOverflow [[m:Gem::Package::TarWriter::BoundedStream#limit]] を越えて
  #        書き込もうとした場合に発生します。
  def write; end

  # --- written -> Integer
  # 
  # 既に書き込んだデータのサイズを返します。
  def written; end

  # --- new(io, limit) -> Gem::Package::TarWriter::BoundedStream
  # 
  # 自身を初期化します。
  # 
  # @param io ラップする IO を指定します。
  # 
  # @param limit 書き込み可能な最大のサイズを指定します。
  def new; end

end
