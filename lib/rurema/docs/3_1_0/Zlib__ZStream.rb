class Zlib::ZStream
  # --- adler -> Integer
  # 
  # adler-32 チェックサムを返します。
  def adler; end

  # --- avail_in -> Integer
  # 
  # 入力バッファに溜っているデータのバイト数を返します。通常は 0 です。
  def avail_in; end

  # --- avail_out -> Integer
  # 
  # 出力バッファの空き用量をバイト数で返します。
  # 空きは必要な時に動的に確保されるため、通常は 0 です。
  def avail_out; end

  # --- avail_out=(size)
  # 
  # 出力側のバッファに size バイトの空きを確保します。
  # すでに size バイト以上の空きがある場合、バッファは
  # 縮められます。空きは必要な時に動的に確保されるため、通常
  # このメソッドを使う必要はありません。
  # 
  # @param size 出力バッファのサイズを整数で指定します。
  # 
  # @return size を返します。
  def avail_out=; end

  # --- close -> nil
  # --- end -> nil
  # 
  # ストリームを閉じます。
  # 以後、このストリームにアクセスすることはできなくなります。
  def close; end

  # --- closed? -> bool
  # --- ended? -> bool
  # 
  # ストリームが閉じられている時に真を返します。
  def closed?; end

  # --- data_type -> Integer
  # 
  # ストリームに入力されたデータの形式を推測します。
  # 返り値は [[m:Zlib::BINARY]], [[m:Zlib::ASCII]], [[m:Zlib::UNKNOWN]] の
  # いずれかです。
  def data_type; end

  # --- finish -> String
  # 
  # ストリームへの入力を終了し、出力バッファをフラッシュします。
  # より具体的な振る舞いは [[m:Zlib::Deflate#finish]],
  # [[m:Zlib::Inflate#finish]] を参照して下さい。
  # 
  # @see  [[m:Zlib::Deflate#finish]],[[m:Zlib::Inflate#finish]] 
  def finish; end

  # --- finished? -> bool
  # --- stream_end? -> bool
  # 
  # ストリームへの入力が終了している時に真を返します。
  def finished?; end

  # --- flush_next_in -> String
  # 
  # 入力バッファに残っているデータを強制的に取り出します。
  def flush_next_in; end

  # --- flush_next_out -> String
  # 
  # 出力バッファに残っているデータを強制的に取り出します。
  def flush_next_out; end

  # --- reset -> nil
  # 
  # ストリームの状態をリセットします。
  # 入力/出力バッファ内に残っていたデータは破棄されます。
  def reset; end

  # --- total_in -> Integer
  # 
  # ストリームに入力されたデータの総バイト数を返します。
  def total_in; end

  # --- total_out -> Integer
  # 
  # ストリームの出力したデータの総バイト数を返します。
  def total_out; end

  # --- new -> ()
  # 
  # 直接使用しません。
  # 通常、具体的な圧縮/展開を行う場合は、
  # [[m:Zlib::Deflate.new]] もしくは、[[m:Zlib::Inflate.new]] を使用します。
  # 
  # @see [[m:Zlib::Deflate.new]], [[m:Zlib::Inflate.new]] 
  def new; end

end
