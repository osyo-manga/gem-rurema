module Kconv
  # --- guess(str) -> Encoding | nil
  # 
  # 文字列 str のエンコーディングを判定します。戻り値は
  # Kconv の定数です。
  # 
  # このモジュール関数で判定できるのは、
  #   * ISO-2022-JP ([[m:Kconv::JIS]])
  #   * Shift_JIS ([[m:Kconv::SJIS]])
  #   * EUC-JP ([[m:Kconv::EUC]])
  #   * ASCII ([[m:Kconv::ASCII]])
  #   * UTF-8 ([[m:Kconv::UTF8]])
  #   * UTF-16BE ([[m:Kconv::UTF16]])
  #   * 不明 ([[m:Kconv::UNKNOWN]])
  #   * 以上のどれでもない ([[m:Kconv::BINARY]])
  # のいずれかです。
  # 
  # @param str エンコーディング判定対象の文字列
  def guess; end

  # --- iseuc(str) -> bool
  # 文字列 str が EUC-JP なバイト列として正当であるかどうかを判定します。
  # 
  # @param str 判定対象の文字列
  # @see [[m:String#iseuc]]
  def iseuc; end

  # --- isjis(str) -> bool
  # 文字列 str が ISO-2022-JP なバイト列として正当であるかどうかを判定します。
  # 
  # @param str 判定対象の文字列
  # @see [[m:String#isjis]]
  # 
  # 例:
  #   require 'kconv'
  # 
  #   euc_str = "\
  #   \xa5\xaa\xa5\xd6\xa5\xb8\xa5\xa7\xa5\xaf\xa5\xc8\xbb\xd8\xb8\xfe\
  #   \xa5\xd7\xa5\xed\xa5\xb0\xa5\xe9\xa5\xdf\xa5\xf3\xa5\xb0\xb8\xc0\xb8\xec\
  #   \x52\x75\x62\x79".force_encoding('EUC-JP')
  # 
  #   jis_str = "\
  #   \x1b\x24\x42\x25\x2a\x25\x56\x25\x38\x25\x27\x25\x2f\x25\x48\x3b\x58\x38\x7e\
  #   \x25\x57\x25\x6d\x25\x30\x25\x69\x25\x5f\x25\x73\x25\x30\x38\x40\x38\x6c\x1b\x28\x42\
  #   \x52\x75\x62\x79".force_encoding('ISO-2022-JP')
  # 
  #   euc_str.isjis  # => false
  #   jis_str.isjis  # => true
  def isjis; end

  # --- issjis(str) -> bool
  # 文字列 str が Shift_JIS なバイト列として正当であるかどうかを判定します。
  # 
  # @param str 判定対象の文字列
  # @see [[m:String#issjis]]
  def issjis; end

  # --- isutf8(str) -> bool
  # 文字列 str が UTF-8 なバイト列として正当であるかどうかを判定します。
  # 
  # @param str 判定対象の文字列
  # @see [[m:String#isutf8]]
  def isutf8; end

  # --- kconv(str, out_code, in_code = Kconv::AUTO) -> String
  # 
  # 文字列 str のエンコーディングを out_code に変換したものを
  # 返します。in_code も指定されていたら str のエンコーディングが
  # in_code だとして動作します。
  # 
  # このメソッドはMIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]] を使ってください。
  # 
  # @param str 変換元の文字列
  # @param out_code 変換後のエンコーディング
  # @param in_code strのエンコーディング
  # 
  # @see [[m:String#kconv]]
  def kconv; end

  # --- toeuc(str) -> String
  # 
  # 文字列 str のエンコーディングを EUC-JP に変換して返します。
  # 
  # Kconv.kconv(str, Kconv::EUC)と同じです。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-exm0', str)
  # を使ってください。
  # 
  # @param str 変換元の文字列
  # 
  # @see [[m:Kconv.#kconv]], [[m:String#toeuc]]
  def toeuc; end

  # --- tojis(str) -> String
  # 
  # 文字列 str のエンコーディングを iso-2022-jp に変換して返します。
  # 
  # Kconv.kconv(str, Kconv::JIS) と同じです。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-jxm0', str)
  # を使ってください。
  # 
  # @param str 変換元の文字列
  # 
  # @see [[m:Kconv.#kconv]], [[m:String#tojis]]
  def tojis; end

  # --- tolocale(str) -> String
  # 
  # 文字列 str のエンコーディングをロケールエンコーディングに変換して返します。
  # 
  # ロケールエンコーディングについては [[m:Encoding.locale_charmap]] を見てください。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:String#encode]]
  # を使ってください。
  # 
  # Kconv.kconv(str, Encoding.locale_charmap)と同じです。
  # 
  # @param str 変換元の文字列
  # @see [[m:String#tolocale]]
  def tolocale; end

  # --- tosjis(str) -> String
  # 
  # 文字列 str のエンコーディングを shift_jis に変換して返します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-sxm0', str)
  # を使ってください。
  # 
  # Kconv.kconv(str, Kconv::SJIS)と同じです。
  # 
  # @param str 変換元の文字列
  # 
  # @see [[m:Kconv.#kconv]], [[m:String#tosjis]]
  def tosjis; end

  # --- toutf16(str) -> String
  # 
  # 文字列 str のエンコーディングを UTF-16BE に変換して返します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-w16xm0', str)
  # を使ってください。
  # 
  # Kconv.kconv(str, Kconv::UTF16)と同じです。
  # 
  # @param str 変換元の文字列
  # @see [[m:String#toutf16]]
  def toutf16; end

  # --- toutf32(str) -> String
  # 
  # 文字列 str のエンコーディングを UTF-32 に変換して返します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-w32xm0', str)
  # を使ってください。
  # 
  # Kconv.kconv(str, Kconv::UTF32)と同じです。
  # 
  # @param str 変換元の文字列
  # @see [[m:String#toutf32]]
  def toutf32; end

  # --- toutf8(str) -> String
  # 
  # 文字列 str のエンコーディングを UTF-8 に変換して返します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-wxm0', str)
  # を使ってください。
  # 
  # Kconv.kconv(str, Kconv::UTF8)と同じです。
  # 
  # @param str 変換元の文字列
  # @see [[m:String#toutf8]]
  def toutf8; end

  # --- ASCII -> Encoding
  # 
  # ASCII を表します。
  def ASCII; end

  # --- AUTO -> nil
  # 
  # エンコーディングを自動検出します。
  # 入力の指定でのみ有効です。
  def AUTO; end

  # --- BINARY -> Encoding
  # 
  # JIS EUC SJIS 以外を表します。
  # この値は[[m:Kconv.#guess]]の返り値としてのみ用いられます。
  def BINARY; end

  # --- EUC -> Encoding
  # 
  # EUC-JP を表します。
  def EUC; end

  # --- JIS -> Encoding
  # 
  # ISO-2022-JP を表します。
  def JIS; end

  # --- NOCONV -> nil
  # 
  # 変換されないことを表します。
  # 出力エンコーディングの指定にのみ用います。
  def NOCONV; end

  # --- SJIS -> Encoding
  # 
  # Shift_JIS を表します。
  # cp932ではないことに注意してください。
  def SJIS; end

  # --- UNKNOWN -> nil
  # 
  # 出力においては「エンコーディングを判定できなかった」
  # 入力においては AUTO と同様に「自動検出」を表します。
  def UNKNOWN; end

  # --- UTF16 -> Encoding
  # 
  # UTF16 を表します。
  def UTF16; end

  # --- UTF32 -> Encoding
  # 
  # UTF32 を表します。
  def UTF32; end

  # --- UTF8 -> Encoding
  # 
  # UTF8 を表します。
  def UTF8; end

end
