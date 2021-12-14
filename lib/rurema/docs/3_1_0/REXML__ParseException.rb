class REXML::ParseException
  # --- context -> [Integer, Integer, Integer]
  # パースエラーが起きた(XML上の)場所を返します。
  # 
  # 要素3個の配列で、
  #   [position, lineno, line]
  # という形で返します。
  # position, line は
  # [[m:REXML::ParseException#position]]
  # [[m:REXML::ParseException#line]]
  # と同じ値です。
  # lineno は [[m:IO#lineno]] が返す意味での行数です。
  # 通常は line と同じ値です。
  def context; end

  # --- line -> Integer
  # パースエラーが起きた(XML上の)場所を行数で返します。
  def line; end

  # --- position -> Integer
  # パースエラーが起きた(XML上の)場所を先頭からのバイト数で返します。
  def position; end

  # --- to_s -> String
  # 例外情報を文字列化して返します。
  def to_s; end

end
