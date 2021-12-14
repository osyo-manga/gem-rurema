module Zlib
  # --- adler32(string = nil, adler = nil) -> Integer
  # 
  # string の Adler-32 チェックサムを計算し、adler を
  # 更新した値を返します。string が省略された場合は
  # Adler-32 チェックサムの初期値を返します。adler が
  # 省略された場合は adler に初期値が与えらたものとして
  # 計算します。
  # 
  # @param string string の Adler-32 チェックサムが計算されます。
  # @param adler  adler を整数で指定します。
  def adler32; end

  # --- adler32_combine(adler1, adler2, length) -> Integer
  # 
  # 与えられた二つの Adler-32 チェックサムを一つにつなげます。
  # 
  # @param adler1 Adler-32 チェックサムを指定します。
  # 
  # @param adler2 Adler-32 チェックサムを指定します。
  # 
  # @param length adler2 を生成するのに使用した文字列の長さを指定します。
  def adler32_combine; end

  # --- crc32(string = nil, crc = nil) -> Integer
  # 
  # string の CRC チェックサムを計算し、crc を
  # 更新した値を返します。string が省略された場合は
  # CRC チェックサムの初期値を返します。crc が
  # 省略された場合は crc に初期値が与えらたものとして
  # 計算します。
  # 
  # @param string string の CRC チェックサムが計算されます。
  # @param crc  crc を整数で指定します。
  def crc32; end

  # --- crc32_combine(crc1, crc2, length) -> Integer
  # 
  # 与えられた二つの CRC-32 チェックサムを一つにつなげます。
  # 
  # @param crc1 CRC-32 チェックサムを指定します。
  # 
  # @param crc2 CRC-32 チェックサムを指定します。
  # 
  # @param length crc2 を生成するのに使用した文字列の長さを指定します。
  def crc32_combine; end

  # --- crc_table -> Array
  # 
  # CRC チェックサムの計算に用いるテーブルを配列で返します。
  def crc_table; end

  # --- deflate(string, level = Zlib::DEFAULT_COMPRESSION ) -> String
  # 
  # 引数 string を圧縮します。[[m:Zlib::Deflate.deflate]] と同じです。
  # 
  # @param string 圧縮する文字列を指定します。
  # @param level 圧縮の水準を詳細に指定します。
  #              有効な値は [[m:Zlib::NO_COMPRESSION]],
  #              [[m:Zlib::BEST_SPEED]], [[m:Zlib::BEST_COMPRESSION]],
  #              [[m:Zlib::DEFAULT_COMPRESSION]] 及び 0 から 9 の整数です。
  # 
  # @see [[m:Zlib::Deflate.deflate]]
  def deflate; end

  # --- inflate(string) -> String
  # 
  # 引数 string を展開します。[[m:Zlib::Inflate.inflate]] と同じです。
  # 
  # @param string 展開する文字列を指定します。
  # 
  # @raise Zlib::NeedDict 展開に辞書が必要な場合に発生します。
  # 
  # @see [[m:Zlib::Inflate.inflate]]
  def inflate; end

  # --- zlib_version -> String
  # 
  # zlib ライブラリのバージョンを表す文字列を返します。
  def zlib_version; end

  # --- ASCII -> Integer
  # 
  # [[m:Zlib::ZStream#data_type]] の返す、データタイプを表す整数です。
  def ASCII; end

  # --- BEST_COMPRESSION -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#deflate]] 等に渡す、
  # 圧縮レベルを表す整数です。
  def BEST_COMPRESSION; end

  # --- BEST_SPEED -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#deflate]] 等に渡す、
  # 圧縮レベルを表す整数です。
  def BEST_SPEED; end

  # --- BINARY -> Integer
  # 
  # [[m:Zlib::ZStream#data_type]] の返す、データタイプを表す整数です。
  def BINARY; end

  # --- DEFAULT_COMPRESSION -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#deflate]] 等に渡す、
  # 圧縮レベルを表す整数です。
  def DEFAULT_COMPRESSION; end

  # --- DEFAULT_STRATEGY -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#params]] に渡す、
  # 圧縮方法を表す整数です。
  def DEFAULT_STRATEGY; end

  # --- DEF_MEM_LEVEL -> Integer
  # 
  # [[m:Zlib::Deflate.new]] 等に渡す、memory level を表す整数です。
  def DEF_MEM_LEVEL; end

  # --- FILTERED -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#params]] に渡す、
  # 圧縮方法を表す整数です。
  def FILTERED; end

  # --- FINISH -> Integer
  # 
  # [[m:Zlib::Deflate#deflate]] 等に渡す、ストリームの出力を
  # 制御するための整数です。
  def FINISH; end

  # --- FULL_FLUSH -> Integer
  # 
  # [[m:Zlib::Deflate#deflate]] 等に渡す、ストリームの出力を
  # 制御するための整数です。
  def FULL_FLUSH; end

  # --- HUFFMAN_ONLY -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#params]] に渡す、
  # 圧縮方法を表す整数です。
  def HUFFMAN_ONLY; end

  # --- MAX_MEM_LEVEL -> Integer
  # 
  # [[m:Zlib::Deflate.new]] 等に渡す、memory level を表す整数です。
  def MAX_MEM_LEVEL; end

  # --- MAX_WBITS
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Inflate.new]] での
  # windowBits のデフォルト値です。
  def MAX_WBITS; end

  # --- NO_COMPRESSION -> Integer
  # 
  # [[m:Zlib::Deflate.new]] や [[m:Zlib::Deflate#deflate]] 等に渡す、
  # 圧縮レベルを表す整数です。
  def NO_COMPRESSION; end

  # --- NO_FLUSH -> Integer
  # 
  # [[m:Zlib::Deflate#deflate]] 等に渡す、ストリームの出力を
  # 制御するための整数です。
  def NO_FLUSH; end

  # --- OS_AMIGA -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_AMIGA; end

  # --- OS_ATARI -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_ATARI; end

  # --- OS_CODE -> Integer
  # 
  # [[m:Zlib::GzipFile#os_code]] メソッドの返す値です。
  def OS_CODE; end

  # --- OS_CPM -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_CPM; end

  # --- OS_MACOS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_MACOS; end

  # --- OS_MSDOS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_MSDOS; end

  # --- OS_OS2 -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_OS2; end

  # --- OS_QDOS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_QDOS; end

  # --- OS_RISCOS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_RISCOS; end

  # --- OS_TOPS20 -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_TOPS20; end

  # --- OS_UNIX -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_UNIX; end

  # --- OS_UNKNOWN -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_UNKNOWN; end

  # --- OS_VMCMS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_VMCMS; end

  # --- OS_VMS -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_VMS; end

  # --- OS_WIN32 -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_WIN32; end

  # --- OS_ZSYSTEM -> Integer
  # 
  # OS の種類を表す定数です。
  def OS_ZSYSTEM; end

  # --- SYNC_FLUSH -> Integer
  # 
  # [[m:Zlib::Deflate#deflate]] 等に渡す、ストリームの出力を
  # 制御するための整数です。
  def SYNC_FLUSH; end

  # --- UNKNOWN -> Integer
  # 
  # [[m:Zlib::ZStream#data_type]] の返す、データタイプを表す整数です。
  def UNKNOWN; end

  # --- VERSION -> String
  # 
  # Ruby/zlib のバージョンを表す文字列です。
  def VERSION; end

  # --- ZLIB_VERSION -> String
  # 
  # zlib.h のバージョンを表す文字列です。
  def ZLIB_VERSION; end

end
