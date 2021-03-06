class Encoding::Converter
  # --- convert(source_string) -> String
  # 与えられた文字列を変換して、変換できた結果を返します。
  # 引数の末尾の文字がバイト列の途中で終わっている場合、そのバイト列は変換器内に取り置かれます。
  # 変換を終了させるには [[m:Encoding::Converter#finish]] を呼びます。
  # 
  # [[c:Encoding::Converter]] を用いると、文字列の一部または全部を渡して変換を行うことができます。よって、不正なバイトを意識せずにストリームから読み出した文字列を変換したいときには Encoding::Converter が適します。
  # 
  # なお、Encoding::Converter#convert では、これらの例外を捕獲しても、例外を起こしたところから変換を再開することはできません。不正なバイトや変換先で未定義な文字をエスケープしたい場合やさらに細かい指定を行いたい場合は、[[m:Encoding::Converter#primitive_convert]] を用います。
  # 
  # @param source_string 変換する文字列の一部または全部です。
  # @return 変換結果である文字列の一部または全部です。
  # @raise Encoding::InvalidByteSequenceError 変換元のエンコーディングにおいて不正なバイト列があった場合に発生します。
  # @raise Encoding::UndefinedConversionError 変換先のエンコーディングで未定義な文字があった場合に発生します。
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "euc-jp")
  # puts ec.convert("\u3042").dump     #=> "\xA4\xA2"
  # puts ec.finish.dump                #=> ""
  # 
  # ec = Encoding::Converter.new("euc-jp", "utf-8")
  # puts ec.convert("\xA4").dump       #=> ""
  # puts ec.convert("\xA2").dump       #=> "\xE3\x81\x82"
  # puts ec.finish.dump                #=> ""
  # 
  # ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
  # puts ec.convert("\xE3").dump       #=> "".force_encoding("ISO-2022-JP")
  # puts ec.convert("\x81").dump       #=> "".force_encoding("ISO-2022-JP")
  # puts ec.convert("\x82").dump       #=> "\e$B$\"".force_encoding("ISO-2022-JP")
  # puts ec.finish.dump                #=> "\e(B".force_encoding("ISO-2022-JP")
  # //}
  def convert; end

  # --- convpath -> Array
  # 変換器が行う変換の経路を配列にして返します。
  # 
  # @return 変換器が行う変換の経路の配列
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("ISo-8859-1", "EUC-JP", crlf_newline: true)
  # p ec.convpath
  # #=> [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
  # #    [#<Encoding:UTF-8>, #<Encoding:EUC-JP>],
  # #    "crlf_newline"]
  # //}
  # 
  # @see [[m:Encoding::Converter.search_convpath]]
  def convpath; end

  # --- destination_encoding -> Encoding
  # 変換先のエンコーディングを返します。
  # 
  # @return 変換先のエンコーディング
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "euc-jp")
  # ec.destination_encoding #=> #<Encoding:EUC-JP>
  # //}
  def destination_encoding; end

  # --- finish -> String
  # 変換処理を終了し、結果文字列の末尾を返します。
  # 変換元の文字列の末尾がバイト列の途中で終わっていた場合、保持しているバイト列全てを返します。
  # 
  # @return 変換結果の末尾
  # @raise Encoding::InvalidByteSequenceError 変換元のエンコーディングにお
  #        いて不正なバイト列があった場合に発生します。
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
  # p ec.convert("\u3042")     #=> "\e$B$\""
  # p ec.finish                #=> "\e(B"
  # //}
  def finish; end

  # --- insert_output(string) -> nil
  # 変換器内のバッファに文字列を挿入します。
  # バッファに保持された文字列は、次の変換時の変換結果と一緒に返されます。
  # 
  # 変換先がステートフルなエンコーディングであった場合、
  # 挿入された文字列は状態に基づいて変換され、状態を更新します。
  # 
  # このメソッドは変換に際してエラーが発生した際にのみ利用されるべきです。
  # 
  # @param string 挿入する文字列
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "iso-8859-1")
  # src = "HIRAGANA LETTER A is \u{3042}."
  # dst = ""
  # p ec.primitive_convert(src, dst)    #=> :undefined_conversion
  # puts "[#{dst.dump}, #{src.dump}]"   #=> ["HIRAGANA LETTER A is ", "."]
  # ec.insert_output("<err>")
  # p ec.primitive_convert(src, dst)    #=> :finished
  # puts "[#{dst.dump}, #{src.dump}]"   #=> ["HIRAGANA LETTER A is <err>.", ""]
  # 
  # ec = Encoding::Converter.new("utf-8", "iso-2022-jp")
  # src = "\u{306F 3041 3068 2661 3002}" # U+2661 is not representable in iso-2022-jp
  # dst = ""
  # p ec.primitive_convert(src, dst)    #=> :undefined_conversion
  # puts "[#{dst.dump}, #{src.dump}]"   #=> ["\e$B$O$!$H".force_encoding("ISO-2022-JP"), "\xE3\     x80\x82"]
  # ec.insert_output "?"                # state change required to output "?".
  # p ec.primitive_convert(src, dst)    #=> :finished
  # puts "[#{dst.dump}, #{src.dump}]"   #=> ["\e$B$O$!$H\e(B?\e$B!#\e(B".force_encoding("ISO-20     22-JP"), ""]
  # //}
  def insert_output; end

  # --- inspect -> String
  # Encoding::Converter オブジェクトの情報を簡単に表示します。
  # 
  # @return 変換器の情報を簡単に可視化した文字列です。
  def inspect; end

  # --- last_error -> Exception | nil
  # 直前に変換器で発生した例外に相当する例外オブジェクトを返します。
  # 直前の変換で例外が発生していない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "iso-8859-1")
  # p ec.primitive_convert(src="\xf1abcd", dst="")       #=> :invalid_byte_sequence
  # p ec.last_error      #=> #<Encoding::InvalidByteSequenceError: "\xF1" followed by "a" on UTF-8>
  # p ec.primitive_convert(src, dst, nil, 1)             #=> :destination_buffer_full
  # p ec.last_error      #=> nil
  # //}
  def last_error; end

  # --- primitive_convert(source_buffer, destination_buffer) -> Symbol
  # --- primitive_convert(source_buffer, destination_buffer, destination_byteoffset) -> Symbol
  # --- primitive_convert(source_buffer, destination_buffer, destination_byteoffset, destination_bytesize) -> Symbol
  # --- primitive_convert(source_buffer, destination_buffer, destination_byteoffset, destination_bytesize, options) -> Symbol
  # 
  # エンコーディング変換のためのメソッドの中で、もっとも細かな扱いが可能なメソッドです。
  # 
  # 可搬性を確保しつつ、不正なバイトや変換先で未定義な文字の扱いを細かに指定したいときは、Encoding::Converter#primitive_convert が唯一の方法になります。
  # 
  # @param source_buffer 変換元文字列のバッファ
  # @param destination_buffer 変換先文字列を格納するバッファ
  # @param destination_byteoffset 変換先バッファでのオフセット
  # @param destination_bytesize 変換先バッファの容量
  # @param options 変換の詳細を指定する定数やハッシュ
  # @return 変換結果を表す Symbol
  # 
  # options には以下が指定できます。
  # 
  # : hash form
  #   :partial_input => true           # source buffer may be part of larger source
  #   :after_output => true            # stop conversion after output before input
  # : integer form
  #   Encoding::Converter::PARTIAL_INPUT
  #   Encoding::Converter::AFTER_OUTPUT
  # 
  # 戻り値は以下のうちのどれかです。
  # 
  #   * :invalid_byte_sequence
  #   * :incomplete_input
  #   * :undefined_conversion
  #   * :after_output
  #   * :destination_buffer_full
  #   * :source_buffer_empty
  #   * :finished
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("UTF-8", "EUC-JP")
  # src = "abc\x81あいう\u{20bb7}\xe3"
  # dst = ''
  # 
  # begin
  #   ret = ec.primitive_convert(src, dst)
  #   p [ret, src, dst, ec.primitive_errinfo]
  #   case ret
  #   when :invalid_byte_sequence
  #     ec.insert_output(ec.primitive_errinfo[3].dump[1..-2])
  #     redo
  #   when :undefined_conversion
  #     c = ec.primitive_errinfo[3].dup.force_encoding(ec.primitive_errinfo[1])
  #     ec.insert_output('\x{%X:%s}' % [c.ord, c.encoding])
  #     redo
  #   when :incomplete_input
  #     ec.insert_output(ec.primitive_errinfo[3].dump[1..-2])
  #   when :finished
  #   end
  #   break
  # end while nil
  # //}
  # 
  # 不正なバイトや変換先で未定義なバイトをエスケープしつつ変換する例です。以上のように、戻り値で分岐させつつ、[[m:Encoding::Converter#primitive_errinfo]] の情報を参照して処理していくことになります。
  def primitive_convert; end

  # --- primitive_errinfo -> Array
  # 直前の [[m:Encoding::Converter#primitive_convert]] による変換の結果を保持する五要素の配列を返します。
  # 
  # @return [result, enc1, enc2, error_bytes, readagain_bytes] という五要素の配列
  # 
  # result は直前の primitive_convert の戻り値です。
  # それ以外の四要素は :invalid_byte_sequence か :incomplete_input か :undefined_conversion だった場合に意味を持ちます。
  # enc1 はエラーの発生した原始変換の変換元のエンコーディング、enc2 は変換先のエンコーディングです。
  # error_bytes はエラーの発生原因となったバイト列、readagain_bytes は先読みによって変換器内部に保持されているバイト列です。
  # 
  # primitive_errinfo はもっぱら [[m:Encoding::Converter#primitive_convert]] と組み合わせて使います。[[m:Encoding::Converter#convert]] を用いている場合にも取得することはできますが、有用な使い方は難しいでしょう。
  # 
  # //emlist[][ruby]{
  # # \xff is invalid as EUC-JP.
  # ec = Encoding::Converter.new("EUC-JP", "Shift_JIS")
  # ec.primitive_convert(src="\xff", dst="", nil, 10)
  # p ec.primitive_errinfo
  # #=> [:invalid_byte_sequence, "EUC-JP", "Shift_JIS", "\xFF", ""]
  # 
  # # HIRAGANA LETTER A (\xa4\xa2 in EUC-JP) is not representable in ISO-8859-1.
  # # Since this error is occur in UTF-8 to ISO-8859-1 conversion,
  # # error_bytes is HIRAGANA LETTER A in UTF-8 (\xE3\x81\x82).
  # ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
  # ec.primitive_convert(src="\xa4\xa2", dst="", nil, 10)
  # p ec.primitive_errinfo
  # #=> [:undefined_conversion, "UTF-8", "ISO-8859-1", "\xE3\x81\x82", ""]
  # 
  # # partial character is invalid
  # ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
  # ec.primitive_convert(src="\xa4", dst="", nil, 10)
  # p ec.primitive_errinfo
  # #=> [:incomplete_input, "EUC-JP", "UTF-8", "\xA4", ""]
  # 
  # # Encoding::Converter::PARTIAL_INPUT prevents invalid errors by
  # # partial characters.
  # ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
  # ec.primitive_convert(src="\xa4", dst="", nil, 10, Encoding::Converter::PARTIAL_INPUT)
  # p ec.primitive_errinfo
  # #=> [:source_buffer_empty, nil, nil, nil, nil]
  # 
  # # \xd8\x00\x00@ is invalid as UTF-16BE because
  # # no low surrogate after high surrogate (\xd8\x00).
  # # It is detected by 3rd byte (\00) which is part of next character.
  # # So the high surrogate (\xd8\x00) is discarded and
  # # the 3rd byte is read again later.
  # # Since the byte is buffered in ec, it is dropped from src.
  # ec = Encoding::Converter.new("UTF-16BE", "UTF-8")
  # ec.primitive_convert(src="\xd8\x00\x00@", dst="", nil, 10)
  # p ec.primitive_errinfo
  # #=> [:invalid_byte_sequence, "UTF-16BE", "UTF-8", "\xD8\x00", "\x00"]
  # p src
  # #=> "@"
  # 
  # # Similar to UTF-16BE, \x00\xd8@\x00 is invalid as UTF-16LE.
  # # The problem is detected by 4th byte.
  # ec = Encoding::Converter.new("UTF-16LE", "UTF-8")
  # ec.primitive_convert(src="\x00\xd8@\x00", dst="", nil, 10)
  # p ec.primitive_errinfo
  # #=> [:invalid_byte_sequence, "UTF-16LE", "UTF-8", "\x00\xD8", "@\x00"]
  # p src
  # #=> ""
  # //}
  def primitive_errinfo; end

  # --- putback -> String
  # --- putback(max_numbytes) -> String
  # 後の変換用に変換器内部で保持しているバイト列を max_numbytes で指定した
  # バイト数だけ返します。max_numbytes を指定しなかった場合は保持しているバ
  # イト列の全てを返します。
  # 
  # @param max_numbytes 取得するバイト列の最大値
  # 
  # @return 格納されていたバイト列
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-16le", "iso-8859-1")
  # src = "\x00\xd8\x61\x00"
  # dst = ""
  # p ec.primitive_convert(src, dst)   #=> :invalid_byte_sequence
  # p ec.primitive_errinfo     #=> [:invalid_byte_sequence, "UTF-16LE", "UTF-8", "\x00\xD8", "a\x00"]
  # p ec.putback               #=> "a\x00"
  # p ec.putback               #=> ""          # no more bytes to put back
  # //}
  def putback; end

  # --- replacement -> String
  # 変換器に設定されている置換文字を返します。
  # 
  # @return 変換器に設定されている置換文字
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("euc-jp", "us-ascii")
  # p ec.replacement    #=> "?"
  # 
  # ec = Encoding::Converter.new("euc-jp", "utf-8")
  # p ec.replacement    #=> "\uFFFD"
  # //}
  def replacement; end

  # --- replacement=(string)
  # 置換文字を設定します。
  # 
  # @param string 変換器に設定する置換文字
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "us-ascii", :undef => :replace)
  # ec.replacement = "<undef>"
  # p ec.convert("a \u3042 b")      #=> "a <undef> b"
  # //}
  def replacement=; end

  # --- source_encoding -> Encoding
  # 変換元のエンコーディングを返します。
  # 
  # @return 変換元のエンコーディング
  # 
  # //emlist[][ruby]{
  # ec = Encoding::Converter.new("utf-8", "euc-jp")
  # ec.source_encoding #=> #<Encoding:UTF-8>
  # //}
  def source_encoding; end

  # --- asciicompat_encoding(string) -> Encoding | nil
  # --- asciicompat_encoding(encoding) -> Encoding | nil
  # 同じ文字集合を持つ ASCII 互換エンコーディングを返します。
  # 
  # @param string エンコーディング名
  # @param encoding エンコーディングオブジェクト
  # @return ASCII 互換エンコーディングのオブジェクトか nil
  # 
  # 引数とエンコーディングと同じ文字集合を持つ ASCII 互換エンコーディングを返します。引数と戻り値、2 つのエンコーディング間では変換しても未定義文字の例外は発生しません。
  # 引数が ASCII 互換エンコーディングである場合や、エンコーディングでない場合は nil を返します。
  # 
  # //emlist[][ruby]{
  # Encoding::Converter.asciicompat_encoding("ISO-2022-JP") #=> #<Encoding:stateless-ISO-2022-JP>
  # Encoding::Converter.asciicompat_encoding("UTF-16BE") #=> #<Encoding:UTF-8>
  # Encoding::Converter.asciicompat_encoding("UTF-8") #=> nil
  # //}
  def asciicompat_encoding; end

  # --- new(source_encoding, destination_encoding) -> Encoding::Converter
  # --- new(source_encoding, destination_encoding, options) -> Encoding::Converter
  # --- new(convpath) -> Encoding::Converter
  # Encoding::Converter オブジェクトを作成します。
  # 
  # @param source_encoding 変換元のエンコーディング
  # @param destination_encoding 変換先のエンコーディング
  # @param options 変換の詳細を指定する定数やハッシュ
  # @param convpath 変換経路の配列
  # 
  # options では [[m:String#encode]] でのハッシュオプションに加えて、以下の定数が利用可能です。
  # 
  #   * Encoding::Converter::INVALID_REPLACE
  #   * Encoding::Converter::UNDEF_REPLACE
  #   * Encoding::Converter::UNDEF_HEX_CHARREF
  #   * Encoding::Converter::UNIVERSAL_NEWLINE_DECORATOR
  #   * Encoding::Converter::CRLF_NEWLINE_DECORATOR
  #   * Encoding::Converter::CR_NEWLINE_DECORATOR
  #   * Encoding::Converter::XML_TEXT_DECORATOR
  #   * Encoding::Converter::XML_ATTR_CONTENT_DECORATOR
  #   * Encoding::Converter::XML_ATTR_QUOTE_DECORATOR
  # 
  # //emlist[][ruby]{
  # # UTF-16BE to UTF-8
  # ec = Encoding::Converter.new("UTF-16BE", "UTF-8")
  # 
  # # Usually, decorators such as newline conversion are inserted last.
  # ec = Encoding::Converter.new("UTF-16BE", "UTF-8", :universal_newline => true)
  # p ec.convpath #=> [[#<Encoding:UTF-16BE>, #<Encoding:UTF-8>],
  #               #    "universal_newline"]
  # 
  # # But, if the last encoding is ASCII incompatible,
  # # decorators are inserted before the last conversion.
  # ec = Encoding::Converter.new("UTF-8", "UTF-16BE", :crlf_newline => true)
  # p ec.convpath #=> ["crlf_newline",
  #               #    [#<Encoding:UTF-8>, #<Encoding:UTF-16BE>]]
  # 
  # # Conversion path can be specified directly.
  # ec = Encoding::Converter.new(["universal_newline", ["EUC-JP", "UTF-8"], ["UTF-8", "UTF-16BE"]])
  # p ec.convpath #=> ["universal_newline",
  #               #    [#<Encoding:EUC-JP>, #<Encoding:UTF-8>],
  #               #    [#<Encoding:UTF-8>, #<Encoding:UTF-16BE>]]
  # //}
  def new; end

  # --- search_convpath(source_encoding, destination_encoding, options) -> Array
  # 引数で指定した文字エンコーディングの変換の経路を配列にして返します。
  # 
  # @param source_encoding 変換元の文字エンコーディングを [[c:Encoding]] オ
  #                        ブジェクトか文字列で指定します。
  # 
  # @param destination_encoding 変換先の文字エンコーディングを
  #                             [[c:Encoding]] オブジェクトか文字列で指定し
  #                             ます。
  # 
  # @param options 変換の詳細を指定する定数やハッシュを指定します。
  #                [[m:Encoding::Converter.new]] と同じオプションが指定でき
  #                ます。
  # 
  # //emlist[][ruby]{
  # p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP")
  # # => [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
  # #     [#<Encoding:UTF-8>, #<Encoding:EUC-JP>]]
  # 
  # p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP", universal_newline: true)
  # # or
  # p Encoding::Converter.search_convpath("ISO-8859-1", "EUC-JP", newline: :universal)
  # # => [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
  # #     [#<Encoding:UTF-8>, #<Encoding:EUC-JP>],
  # #     "universal_newline"]
  # 
  # p Encoding::Converter.search_convpath("ISO-8859-1", "UTF-32BE", universal_newline: true)
  # # or
  # p Encoding::Converter.search_convpath("ISO-8859-1", "UTF-32BE", newline: :universal)
  # # => [[#<Encoding:ISO-8859-1>, #<Encoding:UTF-8>],
  # #     "universal_newline",
  # #     [#<Encoding:UTF-8>, #<Encoding:UTF-32BE>]]
  # //}
  # 
  # @see [[m:Encoding::Converter#convpath]], [[m:Encoding::Converter.new]]
  def search_convpath; end

end
