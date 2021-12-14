class Encoding
  # --- ascii_compatible? -> bool
  # 
  # 自身が ASCII 互換のエンコーディングである場合真返します。
  # そうでない場合は偽を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # Encoding::UTF_8.ascii_compatible?     #=> true
  # Encoding::UTF_16BE.ascii_compatible?  #=> false
  # //}
  def ascii_compatible?; end

  # --- dummy? -> bool
  # 自身がダミーエンコーディングである場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # ダミーエンコーディングとは Ruby が名前を知っているものの実質的には対応していないエンコーディングのことです。例えば、ダミーエンコーディングで符号化された文字列の場合、 [[m:String#length]] はマルチバイト文字を考慮せずにバイト列の長さを返します。
  # 
  # ダミーエンコーディングも [[c:IO]] の外部エンコーディングに指定できます。また
  # Ruby はサポートしていないが拡張ライブラリがサポートしているエンコーディングを扱う場合にも
  # 用います。
  # 
  # //emlist[例][ruby]{
  # Encoding::ISO_2022_JP.dummy?       #=> true
  # Encoding::UTF_8.dummy?             #=> false
  # //}
  def dummy?; end

  # --- inspect -> String
  # プログラマにわかりやすい表現の文字列を返します。
  # 
  # //emlist[例][ruby]{
  # Encoding::UTF_8.inspect       #=> "#<Encoding:UTF-8>"
  # Encoding::ISO_2022_JP.inspect #=> "#<Encoding:ISO-2022-JP (dummy)>"
  # //}
  def inspect; end

  # --- name -> String
  # --- to_s -> String
  # エンコーディングの名前を返します。
  # 
  # //emlist[例][ruby]{
  # Encoding::UTF_8.name       #=> "UTF-8"
  # //}
  def name; end

  # --- names -> String
  # エンコーディングの名前とエイリアス名の配列を返します。
  # 
  # //emlist[例][ruby]{
  # Encoding::UTF_8.names      #=> ["UTF-8", "CP65001"]
  # //}
  def names; end

  # --- replicate(name) -> Encoding
  # 
  # レシーバのエンコーディングを複製(replicate)します。
  # 複製されたエンコーディングは元のエンコーディングと同じバイト構造を持たなければなりません。
  # name という名前のエンコーディングが既に存在する場合は [[c:ArgumentError]] を発生します。
  # 
  # //emlist[][ruby]{
  # encoding = Encoding::UTF_8.replicate("REPLICATED_UTF-8")     #=> #<Encoding:REPLICATED_UTF-8>
  # encoding.name                                                #=> "REPLICATED_UTF-8"
  # "\u3042".force_encoding(Encoding::UTF_8).valid_encoding?     #=> true
  # "\u3042".force_encoding(encoding).valid_encoding?            #=> true
  # "\u3042".force_encoding(Encoding::SHIFT_JIS).valid_encoding? #=> false
  # //}
  def replicate; end

  # --- aliases    -> Hash
  # エンコーディングの別名に対して元の名前を対応づけるハッシュを返します。
  # 
  # //emlist[例][ruby]{
  # p Encoding.aliases
  # #=> {"BINARY"=>"ASCII-8BIT", "ASCII"=>"US-ASCII", "ANSI_X3.4-1986"=>"US-ASCII",
  # #   "SJIS"=>"Shift_JIS", "eucJP"=>"EUC-JP", "CP932"=>"Windows-31J"}
  # //}
  def aliases; end

  # --- compatible?(obj1, obj2) -> Encoding | nil
  # 2つのオブジェクトのエンコーディングに関する互換性をチェックします。
  # 互換性がある場合はそのエンコーディングを、
  # ない場合は nil を返します。
  # 
  # 引数が両方とも文字列である場合、互換性があるならば
  # その文字列を結合できます。この場合返り値のエンコーディングは
  # 結合した文字列が取るであろう Encoding オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # Encoding.compatible?("\xa1".force_encoding("iso-8859-1"), "b")
  # #=> #<Encoding:ISO-8859-1>
  # 
  # Encoding.compatible?(
  #   "\xa1".force_encoding("iso-8859-1"),
  #   "\xa1\xa1".force_encoding("euc-jp"))
  # #=> nil
  # //}
  # 
  # 引数が文字列でない場合でも、両方のオブジェクトが encoding を持つ場合には
  # 互換性を判定することができます。
  # //emlist[例][ruby]{
  # Encoding.compatible?(Encoding::UTF_8, Encoding::CP932)
  # # => nil
  # Encoding.compatible?(Encoding::UTF_8, Encoding::US_ASCII)
  # # => #<Encoding:UTF-8>
  # //}
  # @param obj1 チェック対象のオブジェクト
  # @param obj2 チェック対象のオブジェクト
  def compatible?; end

  # --- default_external -> Encoding
  # 既定の外部エンコーディングを返します。
  # 
  # 標準入出力、コマンドライン引数、open で開くファイルなどで、外部エンコーディングが指定されていない場合の既定値として利用されます。
  # 
  # Rubyはロケールまたは -E オプションに従って default_external を決定します。ロケールの確認・設定方法については各システムのマニュアルを参照してください。
  # 
  # 
  # default_external は必ず設定されます。[[m:Encoding.locale_charmap]] が nil を返す場合には US-ASCII が、
  # ロケールにRubyが扱えないエンコーディングが指定されている場合には ASCII-8BIT が、default_external に設定されます。
  # 
  # @see [[d:spec/rubycmd]] [[man:locale(1)]], [[m:Encoding.locale_charmap]] [[m:Encoding.default_internal]]
  def default_external; end

  # --- default_external=(encoding)
  # 既定の外部エンコーディングを設定します。
  # 
  # default_external を変更する前に作成した文字列と、default_external を変更した後に作成した文字列とではエンコーディングが異なる可能性があるため、Ruby スクリプト内で Encoding.default_external を設定してはいけません。代わりに、ruby -E を使用して、正しい default_external で Ruby を起動してください。
  # 
  # デフォルトの外部エンコーディングがどのように使われるかについては [[m:Encoding.default_external]] を参照してください。
  # 
  # @see [[d:spec/rubycmd]] [[m:Encoding.default_external]]
  def default_external=; end

  # --- default_internal -> Encoding | nil
  # 既定の内部エンコーディングを返します。デフォルトでは nil です。
  # 
  # 標準入出力、コマンドライン引数、open で開くファイルなどで、内部エンコーディングが指定されていない場合の既定値として利用されます。
  # 
  # [[m:String#encode]] と [[m:String#encode!]] は、引数に Encoding が与えられていない場合、 default_internal を使用します。
  # 
  # 文字列リテラルを作成した場合、エンコーディングには default_internal ではなく __ENCODING__ 特殊変数で参照できるスクリプトエンコーディングが使用されます。
  # 
  # default_internal は、ソースファイルの [[m:IO.internal_encoding]] または -E オプションで初期化されます。
  # 
  # @see [[d:spec/rubycmd]] [[m:Encoding.default_external]]
  def default_internal; end

  # --- default_internal=(encoding)
  # 
  # 既定の内部エンコーディングを設定します。
  # 
  # default_internal を変更する前に作成した文字列と、default_internal を変更した後に作成した文字列とではエンコーディングが異なる可能性があるため、Ruby スクリプト内で Encoding.default_internal を設定してはいけません。代わりに、ruby -E を使用して、正しい default_internal で Ruby を起動してください。
  # 
  # デフォルトの内部エンコーディングがどのように使われるかについては [[m:Encoding.default_internal]] を参照してください。
  # 
  # @see [[d:spec/rubycmd]] [[m:Encoding.default_internal]]
  def default_internal=; end

  # --- find(name) -> Encoding
  # 指定された name という名前を持つ Encoding オブジェクトを返します。
  # 
  # @param name エンコーディング名を表す [[c:String]] を指定します。
  # @return 発見された Encoding オブジェクトを返します。
  # @raise ArgumentError 指定した名前のエンコーディングが発見できないと発生します。
  # 
  # 特殊なエンコーディング名として、ロケールエンコーディングを表す locale、default_external を表す external、default_internal を表す internal、ファイルシステムエンコーディングを表す filesystem があります。
  # 
  # //emlist[例][ruby]{
  # p Encoding.find("utf-8")       #=> #<Encoding:UTF-8>
  # //}
  def find; end

  # --- list -> [Encoding]
  # 現在ロードされているエンコーディングのリストを返します。
  # 
  # //emlist[例][ruby]{
  # Encoding.list
  # # => [#<Encoding:ASCII-8BIT>, #<Encoding:EUC-JP>,
  # #     #<Encoding:Shift_JIS>, #<Encoding:UTF-8>,
  # #     #<Encoding:ISO-2022-JP (dummy)>]
  # 
  # Encoding.find("US-ASCII")
  # # => #<Encoding:US-ASCII>
  # 
  # Encoding.list
  # # => [#<Encoding:ASCII-8BIT>, #<Encoding:EUC-JP>,
  # #     #<Encoding:Shift_JIS>, #<Encoding:UTF-8>,
  # #     #<Encoding:US-ASCII>, #<Encoding:ISO-2022-JP (dummy)>]
  # //}
  def list; end

  # --- locale_charmap -> String | nil
  # ロケールエンコーディングを決定するために用いる、locale charmap 名を返します。nl_langinfo 等がない環境では nil を、miniruby では ASCII_8BIT を返します。
  # 
  # //emlist[Debian GNU/Linux + LANG=C][ruby]{
  # Encoding.locale_charmap #=> "ANSI_X3.4-1968"
  # //}
  # 
  # //emlist[LANG=ja_JP.EUC-JP][ruby]{
  # Encoding.locale_charmap #=> "EUC-JP"
  # //}
  # 
  # //emlist[SunOS 5 + LANG=C][ruby]{
  # Encoding.locale_charmap #=> "646"
  # //}
  # 
  # //emlist[SunOS 5 + LANG=ja][ruby]{
  # Encoding.locale_charmap #=> "eucJP"
  # //}
  # 
  # @see [[man:charmap(5)]]
  def locale_charmap; end

  # --- name_list    -> [String]
  # 利用可能なエンコーディングの名前を文字列の配列で返します。
  # 
  # //emlist[例][ruby]{
  # p Encoding.name_list
  # #=> ["US-ASCII", "ASCII-8BIT", "UTF-8",
  # #    "ISO-8859-1", "Shift_JIS", "EUC-JP",
  # #    "Windows-31J",
  # #    "BINARY", "CP932", "eucJP", ...]
  # //}
  def name_list; end

  # --- US_ASCII -> Encoding
  # --- ASCII -> Encoding
  # --- ANSI_X3_4_1968 -> Encoding
  # US-ASCII、いわゆる ASCII のことで、ISO 646 IRV と一致します。
  # 
  # 7bit の範囲のみを含み、8bit 目の立っている文字 (たとえば \x80 など) が含まれる場合は正しいエンコーディングであるとみなしません。
  def ANSI_X3_4_1968; end

  # --- ASCII_8BIT -> Encoding
  # --- BINARY -> Encoding
  # ASCII-8BIT、ASCII互換オクテット列用のエンコーディングです。
  # 
  # もっぱら文字エンコーディングを持たないデータ、文字を符号化したのではない単なるバイトの列を表現するために用いますが、このエンコーディングは ASCII 互換であることがポイントです。
  def ASCII_8BIT; end

  # --- Big5 -> Encoding
  # --- BIG5 -> Encoding
  # 
  # Big5 エンコーディングです。
  # 
  # 台湾で使われている繁体字中国語のエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Big5]]
  def BIG5; end

  # --- Big5_HKSCS -> Encoding
  # --- BIG5_HKSCS -> Encoding
  # --- BIG5_HKSCS_2008 -> Encoding
  # --- Big5_HKSCS_2008 -> Encoding
  # 
  # Big5-HKSCS エンコーディングです。
  # 
  # 香港で使われている Big5 の亜種です。
  # 
  # @see [[url:http://www.iana.org/assignments/charset-reg/Big5-HKSCS]],
  #      [[url:http://www.ogcio.gov.hk/en/business/tech_promotion/ccli/hkscs/]]
  def BIG5_HKSCS; end

  # --- BIG5_UAO -> Encoding
  # --- Big5_UAO -> Encoding
  # Big5_UAO エンコーディングです。
  # 
  # Big5 の亜種(非公式的拡張)です。
  # 
  # Unicodeとの対応表が
  # [[url:http://moztw.org/docs/big5/table/big5_2003-b2u.txt]]
  # にあります。
  def BIG5_UAO; end

  # --- CESU_8 -> Encoding
  # 
  # CESU-8 エンコーディングです。
  # 
  # UTF-8 の亜種です。Unicode コンソーシアムは使用を推奨していません。
  # 
  # @see [[url:https://bugs.ruby-lang.org/issues/15931]], [[url:https://www.unicode.org/reports/tr26/tr26-4.html]]
  def CESU_8; end

  # --- Windows_1250 -> Encoding
  # --- CP1250 -> Encoding
  # --- WINDOWS_1250 -> Encoding
  # 
  # Windows-1250 エンコーディング。
  # 
  # ISO8859-2 の亜種です。
  # 
  # @see [[url:http://www.microsoft.com/globaldev/reference/sbcs/1250.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1250]]
  def CP1250; end

  # --- Windows_1251 -> Encoding
  # --- CP1251 -> Encoding
  # --- WINDOWS_1251 -> Encoding
  # 
  # Windows-1251 エンコーディング。
  # 
  # キリル文字を用いる言語を取り扱う8bit single-byteエンコーディングです。
  # 
  # @see [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1251.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1251]]
  def CP1251; end

  # --- Windows_1252 -> Encoding
  # --- CP1252 -> Encoding
  # --- WINDOWS_1252 -> Encoding
  # 
  # Windows-1252 エンコーディングです。
  # 
  # ISO8859-1 の亜種です。
  # 
  # @see [[m:Encoding::ISO_8859_1]]
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1252.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1252]]
  def CP1252; end

  # --- Windows_1253 -> Encoding
  # --- CP1253 -> Encoding
  # --- WINDOWS_1253 -> Encoding
  # 
  # Windows-1253 エンコーディング。
  # 
  # ISO8859-7 の亜種です。
  # 
  # @see [[m:Encoding::ISO_8859_7]],
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1253.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1253]]
  def CP1253; end

  # --- Windows_1254 -> Encoding
  # --- CP1254 -> Encoding
  # --- WINDOWS_1254 -> Encoding
  # 
  # Windows-1254 エンコーディング。
  # 
  # ISO8859-9 の亜種です。
  # 
  # @see [[m:Encoding::ISO_8859_9]],
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1254.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1254]]
  def CP1254; end

  # --- Windows_1255 -> Encoding
  # --- CP1255 -> Encoding
  # --- WINDOWS_1255 -> Encoding
  # 
  # Windows-1255 エンコーディング。
  # 
  # ISO8859-8 の亜種です。
  # 
  # @see [[m:Encoding::ISO_8859_8]],
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1255.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1255]]
  def CP1255; end

  # --- Windows_1256 -> Encoding
  # --- CP1256 -> Encoding
  # --- WINDOWS_1256 -> Encoding
  # Windows-1256 エンコーディング。
  # 
  # Windowsで用いられる、アラビア文字を扱う 8bit single-byte エンコーディングです。
  # 
  # @see [[m:Encoding::ISO_8859_6]],
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1256.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1256]]
  def CP1256; end

  # --- Windows_1257 -> Encoding
  # --- CP1257 -> Encoding
  # --- WINDOWS_1257 -> Encoding
  # Windows-1257 エンコーディング。
  # 
  # ISO8859-13 の亜種です。
  # 
  # @see [[m:Encoding::ISO8859_13]],
  #      [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/1257.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/Windows-1257]]
  def CP1257; end

  # --- Windows_1258 -> Encoding
  # --- CP1258 -> Encoding
  # --- WINDOWS_1258 -> Encoding
  # 
  # WINDOWS-1258 エンコーディング。
  # 
  # ベトナム語を扱う 8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Windows-1258]]
  def CP1258; end

  # --- IBM437 -> Encoding
  # --- CP437 -> Encoding
  # 
  # CP437 エンコーディング。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_437]],
  #      [[m:Encoding::CP869]]
  def CP437; end

  # --- CP50220 -> Encoding
  # CP50220 エンコーディング、
  # Windows で用いられる ISO-2022-JP 亜種です。
  # 
  # CP50221 とほぼ同様のエンコーディングですが、
  # 他のエンコーディングへの変換テーブルが少し異なります。
  # 
  # @see [[url:http://legacy-encoding.osdn.jp/wiki/index.php?cp50220]]
  def CP50220; end

  # --- CP50221 -> Encoding
  # Windows で用いられる、ISO-2022-JP 亜種です。
  # 
  # ISO-2022-JP に加え、ESC ( I でいわゆる半角カナを許し、Windows の機種依存文字を扱うことができます。
  # 
  # @see [[url:http://legacy-encoding.osdn.jp/wiki/index.php?cp50221]]
  def CP50221; end

  # --- CP51932 -> Encoding
  # Windows で用いられる、日本語 EUC 亜種です。
  # 
  # G0 が US-ASCII、G1 が JIS X 0201 片仮名図形文字集合、G2 が JIS X 0208 + Windows の機種依存文字となっており、G3 は未割り当てになっています。
  # 
  # @see [[url:http://legacy-encoding.osdn.jp/wiki/index.php?cp51932]]
  def CP51932; end

  # --- UTF_7 -> Encoding
  # --- CP65000 -> Encoding
  # 
  # UTF-7 です。
  # 
  # 7ビットの範囲内で表現される、Unicode のエンコーディングの一種です。
  # ダミーエンコーディングです。
  def CP65000; end

  # --- UTF_8 -> Encoding
  # --- CP65001 -> Encoding
  # UTF-8。Unicode や ISO 10646 を ASCII 互換な形で符号化するための方式です。
  # 
  # BOM を含みません。
  # 
  # @see [[url:https://tools.ietf.org/html/rfc3629]]
  def CP65001; end

  # --- IBM737 -> Encoding
  # --- CP737 -> Encoding
  # 
  # CP437 エンコーディング。
  # 
  # ギリシャ語を取り扱う 8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_737]]
  def CP737; end

  # --- IBM775 -> Encoding
  # --- CP775 -> Encoding
  # CP775 エンコーディング。
  # 
  # バルト語派の言語を扱うための 8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_775]]
  def CP775; end

  # --- CP850 -> Encoding
  # --- IBM850 -> Encoding
  # 
  # CP850 エンコーディング。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_850]]
  def CP850; end

  # --- IBM852 -> Encoding
  # --- CP852 -> Encoding
  # 
  # CP852 エンコーディング。
  # 
  # ラテンアルファベットを用いる中欧の言語のための
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_852]]
  def CP852; end

  # --- IBM855 -> Encoding
  # --- CP855 -> Encoding
  # 
  # CP855 エンコーディング。
  # 
  # キリル文字を用いる言語のための
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_855]]
  def CP855; end

  # --- IBM857 -> Encoding
  # --- CP857 -> Encoding
  # 
  # CP857 エンコーディング。
  # 
  # トルコ語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_857]]
  def CP857; end

  # --- IBM860 -> Encoding
  # --- CP860 -> Encoding
  # 
  # CP860 エンコーディング。
  # 
  # ポルトガル語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_860]]
  def CP860; end

  # --- IBM861 -> Encoding
  # --- CP861 -> Encoding
  # CP861 エンコーディング。
  # 
  # アイスランド語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_861]]
  def CP861; end

  # --- IBM862 -> Encoding
  # --- CP862 -> Encoding
  # CP862 エンコーディング。
  # 
  # ヘブライ語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_862]]
  def CP862; end

  # --- IBM863 -> Encoding
  # --- CP863 -> Encoding
  # CP863 エンコーディング。
  # 
  # フランス語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_863]]
  def CP863; end

  # --- IBM864 -> Encoding
  # --- CP864 -> Encoding
  # CP864 エンコーディング。
  # 
  # アラビア語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_864]]
  def CP864; end

  # --- IBM865 -> Encoding
  # --- CP865 -> Encoding
  # CP865 エンコーディング。
  # 
  # 北欧の諸言語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_865]]
  def CP865; end

  # --- IBM866 -> Encoding
  # --- CP866 -> Encoding
  # CP866 エンコーディング。
  # 
  # キリル文字を使う諸言語に用いられる、
  # 8bit single-byte エンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_866]]
  def CP866; end

  # --- IBM869 -> Encoding
  # --- CP869 -> Encoding
  # 
  # CP869 エンコーディング。
  # 
  # ギリシャ語を取り扱う 8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Code_page_869]],
  #      [[m:Encoding::CP737]]
  def CP869; end

  # --- Windows_874 -> Encoding
  # --- CP874 -> Encoding
  # --- WINDOWS_874 -> Encoding
  # 
  # Windows-874 エンコーディング。
  # 
  # タイ語を扱うエンコーディングで、ISO8859-11の亜種です。
  # 
  # 
  # @see [[m:Encoding::TIS_620]], [[m:Encoding::ISO_8859_11]],
  #      [[url:http://www.microsoft.com/globaldev/reference/sbcs/874.mspx]]
  def CP874; end

  # --- KOI8_R -> Encoding
  # --- CP878 -> Encoding
  # 
  # KOI8-R エンコーディング。
  # 
  # ロシア語のキリル文字で使われる8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/KOI8-R]]
  def CP878; end

  # --- Windows_31J -> Encoding
  # --- CP932 -> Encoding
  # --- CSWINDOWS31J -> Encoding
  # --- CsWindows31J -> Encoding
  # --- WINDOWS_31J -> Encoding
  # --- PCK -> Encoding
  # --- SJIS -> Encoding
  # 
  # Windows-31J、Windows で用いられる、シフトJIS亜種で、CP932とも言います。
  # 
  # 7bit 部分が論理的には US-ASCIIであり、また Windows の機種依存文字を扱うことができます。
  # 
  # @see [[url:http://www2d.biglobe.ne.jp/~msyk/charcode/cp932/index.html]],
  #      [[url:http://legacy-encoding.osdn.jp/wiki/index.php?cp932]]
  def CP932; end

  # --- GBK -> Encoding
  # --- CP936 -> Encoding
  # 
  # GBK エンコーディング
  # 
  # 中国で用いられる簡体字中国語のエンコーディングです。
  # 
  # @see [[url:http://www.iana.org/assignments/character-sets]],
  #      [[url:http://www.iana.org/assignments/charset-reg/GBK]],
  #      [[url:http://www.microsoft.com/globaldev/reference/dbcs/936.mspx]]
  def CP936; end

  # --- CP949 -> Encoding
  # 
  # CP949 エンコーディング。
  # 
  # EUC-KR に近い、韓国語を取り扱う multi-byte エンコーディングです。
  # 
  # @see [[m:Encoding::EUC_KR]],
  #      [[url:http://www.microsoft.com/globaldev/reference/dbcs/949.mspx]],
  #      [[url:https://en.wikipedia.org/wiki/EUC-KR#EUC-KR]]
  def CP949; end

  # --- CP950 -> Encoding
  # 
  # CP950 エンコーディングです。
  # 
  # Windows で使われる Big5 の亜種です。
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/goglobal/cc305155.aspx]]
  def CP950; end

  # --- CP951 -> Encoding
  # CP951 エンコーディングです。
  # 
  # Windows で使われる Big5-HKSCS の亜種です。
  # 
  # @see [[url:http://www.microsoft.com/hk/hkscs/default.aspx]],
  #      [[url:http://www.microsoft.com/downloads/en/details.aspx?FamilyID=0e6f5ac8-7baa-4571-b8e8-78b3b776afd7&DisplayLang=en]],
  #      [[url:http://blogs.msdn.com/b/shawnste/archive/2007/03/12/cp-951-hkscs.aspx]]
  def CP951; end

  # --- IBM037       -> Encoding
  # --- EBCDIC_CP_US -> Encoding
  # 
  # IBM037 エンコーディング。
  # 
  # ダミーエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/EBCDIC_037]]
  def EBCDIC_CP_US; end

  # --- EMACS_MULE -> Encoding
  # --- Emacs_Mule -> Encoding
  # 
  # Emacs-Mule エンコーディングです。
  # 
  # Emacsの多言語化(Mule)で使われているステートレスのエンコーディングです。
  # 
  # @see [[url:http://web.archive.org/web/20100714080650/http://www.m17n.org/mule/pricai96/mule.en.html]]
  def EMACS_MULE; end

  # --- EUC_CN -> Encoding
  # --- EUCCN -> Encoding
  # --- EucCN -> Encoding
  # ENC-CN エンコーディングです。
  # 
  # 中国で用いられる簡体字中国語 EUCのエンコーディングです。
  # GB2312 と呼ばれることも多いです。
  def EUCCN; end

  # --- EUC_JP -> Encoding
  # --- EucJP -> Encoding
  # --- EUCJP -> Encoding
  # IANA Character Sets にある EUC-JP のことです。
  # 
  # 日本語 EUC 亜種で、G0 が US-ASCII、G1 が JIS X 0201 片仮名図形文字集合、G2 が JIS X 0208、G3 が JIS X 0212 となっています。
  # EUC-JP を指定する場合は、それが実際には CP51932 のことである可能性を考えなければなりません。
  def EUCJP; end

  # --- EUCJP_MS -> Encoding
  # --- EucJP_ms -> Encoding
  # --- EUC_JP_MS -> Encoding
  # eucJP-ms、Unix 系で用いられる、日本語 EUC 亜種です。
  # 
  # EUC-JPに加え、Windowsの機種依存文字とユーザ定義文字を扱うことができます。
  # @see [[url:http://www2d.biglobe.ne.jp/~msyk/charcode/cp932/eucJP-ms.html]],
  #      [[url:http://legacy-encoding.osdn.jp/wiki/index.php?eucJP-ms]],
  #      [[url:http://blog.livedoor.jp/numa2666/archives/50980727.html]]
  def EUCJP_MS; end

  # --- EUC_KR -> Encoding
  # --- EUCKR -> Encoding
  # --- EucKR -> Encoding
  # 
  # EUC-KR エンコーディングです。
  # 
  # 韓国語 EUC のエンコーディングです。
  def EUCKR; end

  # --- EUC_TW -> Encoding
  # --- EUCTW -> Encoding
  # --- EucTW -> Encoding
  # 
  # EUC-TW エンコーディングです。
  # 
  # 台湾で用いられる繁体字中国語 EUCのエンコーディングです。
  def EUCTW; end

  # --- GB12345 -> Encoding
  # 
  # GB 12345 エンコーディング。
  # 
  # GB 2312 から派生したもので、繁体字中国語を取り扱うエンコーディングです。
  def GB12345; end

  # --- GB18030 -> Encoding
  # GBK エンコーディング
  # 
  # 中国で用いられる中国語のエンコーディングです。
  # 
  # @see [[url:http://www.iana.org/assignments/charset-reg/GB18030]]
  def GB18030; end

  # --- GB1988 -> Encoding
  # 
  # GB1988 エンコーディング。
  # 
  # ISO/IEC 646 の中国版です。
  def GB1988; end

  # --- ISO_2022_JP -> Encoding
  # --- ISO2022_JP -> Encoding
  # ISO 2022-JP エンコーディングです。
  # 
  # @see [[url:http://tools.ietf.org/html/rfc1468]]
  def ISO2022_JP; end

  # --- ISO_2022_JP_2 -> Encoding
  # --- ISO2022_JP2 -> Encoding
  # 
  # ISO-2022-JP-2 エンコーディングです。
  # 
  # ISO-2022-JP の拡張版です。
  # 
  # @see [[m:Encoding::ISO_2022_JP]]
  def ISO2022_JP2; end

  # --- ISO_8859_1 -> Encoding
  # --- ISO8859_1 -> Encoding
  # 
  # ISO-8859-1 エンコーディングです。
  # 
  # 多くの西欧言語を含むさまざまなラテン文字言語を表現するための
  # 8bitエンコーディングです。
  # 
  # Latin-1 とも呼ばれます。
  def ISO8859_1; end

  # --- ISO_8859_10 -> Encoding
  # --- ISO8859_10 -> Encoding
  # 
  # ISO 8859-10 エンコーディング。
  # 
  # 北欧の言語を扱う 8bit single-byte エンコーディングです。
  def ISO8859_10; end

  # --- ISO_8859_11 -> Encoding
  # --- ISO8859_11 -> Encoding
  # 
  # ISO8859-11 エンコーディング。
  # 
  # タイ語を扱う 8bit single-byte エンコーディングです。
  # 
  # @see [[m:Encoding::TIS_620]]
  def ISO8859_11; end

  # --- ISO_8859_13 -> Encoding
  # --- ISO8859_13 -> Encoding
  # 
  # ISO8859-13 エンコーディング。
  # 
  # バルト語派の言語を扱う8bit single-byteエンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1257]]
  def ISO8859_13; end

  # --- ISO_8859_14 -> Encoding
  # --- ISO8859_14 -> Encoding
  # 
  # ISO8859-14 エンコーディング。
  # 
  # ケルト語派の言語を扱う8bit single-byteエンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1257]]
  def ISO8859_14; end

  # --- ISO_8859_15 -> Encoding
  # --- ISO8859_15 -> Encoding
  # 
  # ISO 8859-15 エンコーディング。
  # 
  # ISO 8859-1 の改訂版です。
  def ISO8859_15; end

  # --- ISO_8859_16 -> Encoding
  # --- ISO8859_16 -> Encoding
  # 
  # ISO 8859-16 エンコーディング。
  # 
  # 東欧を中心とした地域の諸語を扱う 8bit single-byte エンコーディングです。
  def ISO8859_16; end

  # --- ISO_8859_2 -> Encoding
  # --- ISO8859_2 -> Encoding
  # 
  # ISO8859-2 エンコーディング。
  # 
  # 中東欧の言語を扱う 8bit single-byte エンコーディングです。
  def ISO8859_2; end

  # --- ISO_8859_3 -> Encoding
  # --- ISO8859_3 -> Encoding
  # ISO8859-3 エンコーディング。
  # 
  # トルコ語、マルタ語、エスペラントを扱う 8bit single-byte エンコーディングです。
  def ISO8859_3; end

  # --- ISO_8859_4 -> Encoding
  # --- ISO8859_4 -> Encoding
  # 
  # ISO 8859-4 エンコーディング。
  # 
  # 北欧の言語を扱う 8bit single-byte エンコーディングです。
  def ISO8859_4; end

  # --- ISO_8859_5 -> Encoding
  # --- ISO8859_5 -> Encoding
  # 
  # ISO 8859-5 エンコーディング。
  # 
  # キリル文字を用いる言語を扱う 8bit single-byte エンコーディングです。
  def ISO8859_5; end

  # --- ISO_8859_6 -> Encoding
  # --- ISO8859_6 -> Encoding
  # 
  # ISO8859-6 エンコーディング。
  # 
  # アラビア文字を扱う 8bit single-byte エンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1256]]
  def ISO8859_6; end

  # --- ISO_8859_7 -> Encoding
  # --- ISO8859_7 -> Encoding
  # 
  # ISO8859-7 エンコーディング。
  # 
  # ギリシャ語を扱う 8bit single-byte エンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1253]]
  def ISO8859_7; end

  # --- ISO_8859_8 -> Encoding
  # --- ISO8859_8 -> Encoding
  # ISO8859-8 エンコーディング。
  # 
  # ヘブライ語を扱う 8bit single-byte エンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1255]]
  def ISO8859_8; end

  # --- ISO_8859_9 -> Encoding
  # --- ISO8859_9 -> Encoding
  # 
  # ISO8859-9 エンコーディング。
  # 
  # ISO8859-1 に近い、
  # トルコ語を扱うことができる8bit single-byteエンコーディングです。
  # 
  # @see [[m:Encoding::Windows_1254]]
  def ISO8859_9; end

  # --- ISO_2022_JP_KDDI -> Encoding
  # ISO-2022-JP-KDDI エンコーディングです。
  # 
  # ISO-2022-JP の亜種です。
  # KDDI の携帯電話で使われる絵文字が含まれています。
  # 
  # 
  # @see [[url:https://www.au.com/ezfactory/tec/spec/img/typeD.pdf]]
  def ISO_2022_JP_KDDI; end

  # --- KOI8_U -> Encoding
  # 
  # KOI8-U エンコーディング。
  # 
  # ウクライナ語のキリル文字で使われる8bit single-byteエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/KOI8-U]]
  def KOI8_U; end

  # --- MacCentEuro -> Encoding
  # --- MACCENTEURO -> Encoding
  # MacCentEuro エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byteエンコーディングで、
  # 中欧および南東欧の言語を取り扱うものです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Macintosh_Central_European_encoding]]
  def MACCENTEURO; end

  # --- MacCroatian -> Encoding
  # --- MACCROATIAN -> Encoding
  # MacCroatian エンコーディング。
  # 
  # Mac OS で使われる
  # 8bit single-byteエンコーディングで、
  # クロアチア語、スベロニア語を取り扱うものです。
  # 
  # @see [[url:https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/CROATIAN.TXT]]
  def MACCROATIAN; end

  # --- MacCyrillic -> Encoding
  # --- MACCYRILLIC -> Encoding
  # 
  # MacCyrillic エンコーディング。
  # 
  # Mac OS で使われる 8bit single-byte エンコーディングで、
  # キリル文字を取り扱うものです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Macintosh_Cyrillic_encoding]]
  def MACCYRILLIC; end

  # --- MacGreek -> Encoding
  # --- MACGREEK -> Encoding
  # MacGreek エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byte エンコーディングで、
  # ギリシャ語のために使われます。
  # 
  # @see [[url:https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/GREEK.TXT]]
  def MACGREEK; end

  # --- MacIceland -> Encoding
  # --- MACICELAND -> Encoding
  # 
  # MacIceland エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byte エンコーディングで、
  # アイスランド語のために使われます
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Mac_Icelandic_encoding]]
  def MACICELAND; end

  # --- MacJapanese -> Encoding
  # --- MACJAPAN -> Encoding
  # --- MACJAPANESE -> Encoding
  # --- MacJapan -> Encoding
  # 
  # MacJapanese エンコーディング。
  # 
  # Mac OS の 9.x までで用いられていた Shift_JIS 亜種です。
  # 
  # @see [[url:https://unicode.org/Public/MAPPINGS/VENDORS/APPLE/JAPANESE.TXT]],
  #      [[url:https://ja.wikipedia.org/wiki/MacJapanese]]
  def MACJAPAN; end

  # --- MacRoman -> Encoding
  # --- MACROMAN -> Encoding
  # MacRoman エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byte エンコーディングで、
  # 西欧を中心としたラテン文字を用いる諸語を取り扱うためのものです。
  # 
  # IANA character-sets で "macintosh" で表現されるものです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Mac_OS_Roman]]
  def MACROMAN; end

  # --- MacRomania -> Encoding
  # --- MACROMANIA -> Encoding
  # MacRoman エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byte エンコーディングで、
  # ルーマニア語のために使われます。
  # 
  # @see [[url:https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/ROMANIAN.TXT]]
  def MACROMANIA; end

  # --- MacThai -> Encoding
  # --- MACTHAI -> Encoding
  # MacThai エンコーディング。
  # 
  # タイ語を扱うエンコーディングで、ISO8859-11の亜種です。
  # 
  # @see [[m:Encoding::TIS_620]], [[m:Encoding::ISO_8859_11]]
  def MACTHAI; end

  # --- MacTurkish -> Encoding
  # --- MACTURKISH -> Encoding
  # MacTurkish エンコーディング。
  # 
  # Mac OSで使われる
  # 8bit single-byte エンコーディングで、
  # トルコ語のために使われます。
  # 
  # @see [[url:https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/TURKISH.TXT]]
  def MACTURKISH; end

  # --- MacUkraine -> Encoding
  # --- MACUKRAINE -> Encoding
  # MacUkraine エンコーディング。
  # 
  # Mac OS で使われる、ウクライナ語キリル文字を取り扱うエンコーディング。
  # MacCyrillic の亜種です。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Macintosh_Ukrainian_encoding]]
  def MACUKRAINE; end

  # --- Shift_JIS -> Encoding
  # --- SHIFT_JIS -> Encoding
  # IANA Character Sets にある Shift_JIS のことです。
  # 
  # 基本的にはJIS X 0208:1997の付属書1にある「シフト符号化表現」のことですが、
  # Ruby M17N では 7bit 部分が US-ASCII になっています。
  def SHIFT_JIS; end

  # --- SJIS_DOCOMO -> Encoding
  # --- SJIS_DoCoMo -> Encoding
  # 
  # SJIS-DoCoMo エンコーディングです。
  # 
  # Shift_JIS, CP932 の亜種です。
  # DoCoMo の携帯電話で使われる絵文字が含まれています。
  # 
  # @see [[url:https://www.nttdocomo.co.jp/english/service/developer/make/content/pictograph/basic/index.html]],
  #      [[url:https://www.nttdocomo.co.jp/english/service/developer/make/content/pictograph/extention/index.html]]
  def SJIS_DOCOMO; end

  # --- SJIS_KDDI -> Encoding
  # 
  # SJIS-KDDI エンコーディングです。
  # 
  # Shift_JIS, CP932 の亜種です。
  # KDDI の携帯電話で使われる絵文字が含まれています。
  # 
  # @see [[url:https://www.au.com/ezfactory/tec/spec/img/typeD.pdf]]
  def SJIS_KDDI; end

  # --- SJIS_SOFTBANK -> Encoding
  # --- SJIS_SoftBank -> Encoding
  # SJIS-SoftBank エンコーディングです。
  # 
  # Shift_JIS, CP932 の亜種です。
  # SoftBank の携帯電話で使われる絵文字が含まれています。
  # 
  # @see [[url:http://creation.mb.softbank.jp/mc/tech/tech_pic/pic_index.html]]
  def SJIS_SOFTBANK; end

  # --- STATELESS_ISO_2022_JP -> Encoding
  # --- Stateless_ISO_2022_JP -> Encoding
  # stateless-ISO-2022-JP エンコーディングです。
  # 
  # ISO-2022-JPをステートレスに扱うための方式です。
  # Emacs-Mule エンコーディングを元にしています。
  def STATELESS_ISO_2022_JP; end

  # --- STATELESS_ISO_2022_JP_KDDI -> Encoding
  # --- Stateless_ISO_2022_JP_KDDI -> Encoding
  # stateless-ISO-2022-JP-KDDI エンコーディングです。
  # 
  # stateless-ISO-2022-JP の亜種です。
  # KDDI の携帯電話で使われる絵文字が含まれています。
  # 
  # 
  # @see [[url:https://www.au.com/ezfactory/tec/spec/img/typeD.pdf]]
  def STATELESS_ISO_2022_JP_KDDI; end

  # --- TIS_620 -> Encoding
  # TIS-620 エンコーディング。
  # 
  # タイ語を扱うためのエンコーディングで、 ISO8859-11 とほぼ
  # 同一のエンコーディングです。
  # 
  # @see [[url:https://en.wikipedia.org/wiki/Thai_Industrial_Standard_620-2533]]
  def TIS_620; end

  # --- UTF_16BE -> Encoding
  # --- UCS_2BE -> Encoding
  # UTF-16BE (ビッグエンディアン) です。
  # 
  # BOM を含みません。
  def UCS_2BE; end

  # --- UTF_32BE -> Encoding
  # --- UCS_4BE -> Encoding
  # UTF-32BE (ビッグエンディアン) です。
  # 
  # BOM を含みません。
  def UCS_4BE; end

  # --- UTF_32LE -> Encoding
  # --- UCS_4LE -> Encoding
  # UTF-32LE (リトルエンディアン) です。
  # 
  # BOM を含みません。
  def UCS_4LE; end

  # --- UTF8_DOCOMO -> Encoding
  # --- UTF8_DoCoMo -> Encoding
  # UTF8-DoCoMo エンコーディングです。
  # 
  # UTF-8 の亜種です。
  # DoCoMo の携帯電話で使われる絵文字が含まれています。
  # 
  # 
  # @see [[url:https://www.nttdocomo.co.jp/english/service/developer/make/content/pictograph/basic/index.html]],
  #      [[url:https://www.nttdocomo.co.jp/english/service/developer/make/content/pictograph/extention/index.html]]
  def UTF8_DOCOMO; end

  # --- UTF8_KDDI -> Encoding
  # 
  # UTF8-KDDI エンコーディングです。
  # 
  # UTF8 の亜種です。
  # KDDI の携帯電話で使われる絵文字が含まれています。
  # 
  # @see [[url:https://www.au.com/ezfactory/tec/spec/img/typeD.pdf]]
  def UTF8_KDDI; end

  # --- UTF8_MAC -> Encoding
  # --- UTF_8_MAC -> Encoding
  # --- UTF_8_HFS -> Encoding
  # UTF8-MAC、アップルによって修正された Normalization Form D（分解済み）という形式のUTF-8です。
  # 
  # @see [[url:http://developer.apple.com/jp/technotes/tn1150.html]],
  #      [[url:http://developer.apple.com/jp/technotes/tn2078.html]]
  def UTF8_MAC; end

  # --- UTF8_SOFTBANK -> Encoding
  # --- UTF8_SoftBank -> Encoding
  # UTF8-SoftBank エンコーディングです。
  # 
  # UTF-8 の亜種です。
  # SoftBank の携帯電話で使われる絵文字が含まれています。
  # 
  # @see [[url:http://creation.mb.softbank.jp/mc/tech/tech_pic/pic_index.html]]
  def UTF8_SOFTBANK; end

  # --- UTF_16 -> Encoding
  # UTF-16 (BOMを含む) です。
  # 
  # ダミーエンコーディングです。
  def UTF_16; end

  # --- UTF_16LE -> Encoding
  # UTF-16LE (リトルエンディアン) です。
  # 
  # BOM を含みません。
  def UTF_16LE; end

  # --- UTF_32 -> Encoding
  # UTF-32 (BOMを含む) です。
  # 
  # ダミーエンコーディングです。
  def UTF_32; end

end
