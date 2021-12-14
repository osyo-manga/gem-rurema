class DRb::DRbUnknown
  # --- buf -> String
  # 保持しているマーシャリングされたバイト列を返します。
  def buf; end

  # --- exception -> DRb::DRbUnknownError
  # マーシャリングされたオブジェクトが元のオブジェクトに変換できなかった、
  # ということを意味する例外オブジェクトを返します。
  # 
  # この例外オブジェクトの [[m:DRb::DRbUnknownError#unknown]] を
  # 呼び出すと、 self が返されます。
  def exception; end

  # --- name -> String
  # 保持しているマーシャリングされたオブジェクトのクラスの名前を返します。
  def name; end

  # --- reload -> object
  # 保持しているマーシャリングされたオブジェクトをRubyのオブジェクトに
  # 変換しようと試みます。
  # 
  # DRbUnknown オブジェクトを受け取った後に対応するクラスが定義された場合、
  # このメソッドでそのクラスのオブジェクトに変換できます。
  # 変換を試みて失敗した場合は DRbUnknown オブジェクトを返します。
  def reload; end

end
