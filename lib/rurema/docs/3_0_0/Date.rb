class Date
  # --- + (n) -> Date
  # self から n 日後の日付オブジェクトを返します。
  # n は数値でなければなりません。
  # 
  # @param n 日数
  # @raise TypeError n が数値でない場合に発生します。
  def +; end

  # --- - (x) -> Rational | Date
  # x が日付オブジェクトなら、ふたつの差を返します。
  # あるいは
  # x が数値ならば、self より x 日前の日付を返します。
  # 
  # @param x 日数、あるいは日付オブジェクト
  # @raise TypeError x が数値でも日付オブジェクトでもない場合に発生します。
  def -; end

  # --- << (n) -> Date
  # self より n ヶ月前の日付オブジェクトを返します。
  # n は数値でなければなりません。
  # 
  #   require 'date'
  #   Date.new(2001,2,3)  <<  1   #=> #<Date: 2001-01-03 ...>
  #   Date.new(2001,2,3)  << -2   #=> #<Date: 2001-04-03 ...>
  # 
  # 対応する月に同じ日が存在しない時は、代わりにその月の末日が使われます。
  # 
  #   require 'date'
  #   Date.new(2001,3,28) << 1   #=> #<Date: 2001-02-28 ...>
  #   Date.new(2001,3,31) << 1   #=> #<Date: 2001-02-28 ...>
  # 
  # このことは以下のように、もしかすると予期しない振る舞いをするかもしれません。
  # 
  #   require 'date'
  #   Date.new(2001,3,31) << 2         #=> #<Date: 2001-01-31 ...>
  #   Date.new(2001,3,31) << 1 << 1    #=> #<Date: 2001-01-28 ...>
  # 
  #   Date.new(2001,3,31) << 1 << -1   #=> #<Date: 2001-03-28 ...>
  # 
  # [[m:Date#prev_month]] も参照してください。
  # 
  # @param n 月数
  def <<; end

  # --- <=> (other) -> -1 | 0 | 1 | nil
  # 二つの日付を比較します。
  # 同じ日付なら 0 を、self が other よりあとの日付なら 1 を、
  # その逆なら -1 を返します。
  # 
  # other は日付オブジェクトか、
  # 天文学的なユリウス日をあらわす数値を指定します。
  # そうでない場合、比較ができないので nil を返します。
  # 
  # //emlist[][ruby]{
  # require "date"
  # 
  # p Date.new(2001, 2, 3) <=> Date.new(2001, 2, 4) # => -1
  # p Date.new(2001, 2, 3) <=> Date.new(2001, 2, 3) # => 0
  # p Date.new(2001, 2, 3) <=> Date.new(2001, 2, 2) # => 1
  # p Date.new(2001, 2, 3) <=> Object.new           # => nil
  # p Date.new(2001, 2, 3) <=> Rational(4903887, 2) # => 0
  # //}
  # 
  # @param other 日付オブジェクトまたは数値
  def <=>; end

  # --- === (other) -> bool
  # 同じ日なら真を返します。
  # 
  # @param other 日付オブジェクト
  def ===; end

  # --- >> (n) -> Date
  # self から n ヶ月後の日付オブジェクトを返します。
  # n は数値でなければなりません。
  # 
  #   require 'date'
  #   Date.new(2001,2,3)  >>  1   #=> #<Date: 2001-03-03 ...>
  #   Date.new(2001,2,3)  >> -2   #=> #<Date: 2000-12-03 ...>
  # 
  # 
  # 対応する月に同じ日が存在しない時は、代わりにその月の末日が使われます。
  # 
  #   require 'date'
  #   Date.new(2001,1,28) >> 1   #=> #<Date: 2001-02-28 ...>
  #   Date.new(2001,1,31) >> 1   #=> #<Date: 2001-02-28 ...>
  # 
  # このことは以下のように、もしかすると予期しない振る舞いをするかもしれません。
  # 
  #   require 'date'
  #   Date.new(2001,1,31) >> 2         #=> #<Date: 2001-03-31 ...>
  #   Date.new(2001,1,31) >> 1 >> 1    #=> #<Date: 2001-03-28 ...>
  # 
  #   Date.new(2001,1,31) >> 1 >> -1   #=> #<Date: 2001-01-28 ...>
  # 
  # [[m:Date#next_month]] も参照してください。
  # 
  # @param n 月数
  def >>; end

  # --- ajd -> Rational
  # このメソッドは [[m:Date#jd]] と似ていますが、天文学的なユリウス日を返します。
  # 時刻を含みます。
  def ajd; end

  # --- amjd -> Rational
  # このメソッドは [[m:Date#mjd]] と似ていますが、天文学的な修正ユリウス日を返します。
  # 時刻を含みます。
  def amjd; end

  # --- asctime -> String
  # --- ctime -> String
  # [[man:asctime(3)]] 書式の文字列を返します (ただし、末尾の "\n\0" は除く)。
  def asctime; end

  # --- cwday -> Integer
  # 暦週の日 (曜日) を返します (1-7、月曜は1)。
  def cwday; end

  # --- cweek -> Integer
  # 暦週を返します (1-53)。
  def cweek; end

  # --- cwyear -> Integer
  # 暦週における年を返します。
  def cwyear; end

  # --- mday -> Integer
  # --- day -> Integer
  # 月の日を返します (1-31)。
  def day; end

  # --- downto(min){|date| ...} -> self
  # --- downto(min) -> Enumerator
  # このメソッドは、step(min, -1){|date| ...} と等価です。
  # 
  # @param min 日付オブジェクト
  # 
  # @see [[m:Date#step]], [[m:Date#upto]]
  def downto; end

  # --- england -> Date
  # このメソッドは、new_start(Date::ENGLAND) と等価です。
  # 
  # [[m:Date#new_start]]、および [[m:Date::ENGLAND]] を参照してください。
  def england; end

  # --- friday? -> bool
  # 金曜日なら真を返します。
  def friday?; end

  # --- gregorian -> Date
  # このメソッドは、new_start(Date::GREGORIAN) と等価です。
  # 
  # [[m:Date#new_start]]、および [[m:Date::GREGORIAN]] を参照してください。
  def gregorian; end

  # --- gregorian? -> bool
  # グレゴリオ暦なら真を返します。
  def gregorian?; end

  # --- httpdate -> String
  # [[RFC:2616]] ([[RFC:1123]]) で定められた書式の文字列を返します。
  def httpdate; end

  # --- iso8601 -> String
  # --- rfc3339 -> String
  # [[ISO:8601]] 書式の文字列を返します (拡大表記はつかいません)。
  def iso8601; end

  # --- italy -> Date
  # このメソッドは、new_start(Date::ITALY) と等価です。
  # 
  # [[m:Date#new_start]]、および [[m:Date::ITALY]] を参照してください。
  def italy; end

  # --- jd -> Integer
  # ユリウス日を返します。
  # 時刻を含みません。
  # 
  # [[m:Date#ajd]] も参照してください。
  def jd; end

  # --- jisx0301 -> String
  # [[JIS:X 0301]] 書式の文字列を返します。
  # ただし、明治以前については [[ISO:8601]] 書式になります。
  # なお、明治6年以前についても太陰太陽暦を使用することはありません。
  def jisx0301; end

  # --- julian -> Date
  # このメソッドは、new_start(Date::JULIAN) と等価です。
  # 
  # [[m:Date#new_start]]、および [[m:Date::JULIAN]] を参照してください。
  def julian; end

  # --- julian? -> bool
  # ユリウス暦なら真を返します。
  def julian?; end

  # --- ld -> Integer
  # リリウス日を返します。
  def ld; end

  # --- leap? -> bool
  # 閏年なら真を返します。
  def leap?; end

  # --- mjd -> Integer
  # 修正ユリウス日を返します。
  # 時刻の情報を含みません。
  # 
  # [[m:Date#amjd]] も参照してください。
  def mjd; end

  # --- mon -> Integer
  # --- month -> Integer
  # 月を返します (1-12)。
  def mon; end

  # --- monday? -> bool
  # 月曜日なら真を返します。
  def monday?; end

  # --- new_start(start = Date::ITALY) -> Date
  # self を複製して、その改暦日を設定しなおします。
  # 引数を省略した場合は、[[m:Date::ITALY]] (1582年10月15日) になります。
  # 
  # [[m:Date.new]] も参照してください。
  # 
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def new_start; end

  # --- succ -> Date
  # --- next -> Date
  # 翌日の日付オブジェクトを返します。
  def next; end

  # --- next_day(n = 1) -> Date
  # n 日後を返します。
  # 
  # [[m:Date#succ]] も参照してください。
  # 
  # @param n 日数
  def next_day; end

  # --- next_month(n = 1) -> Date
  # n ヶ月後を返します。
  # 
  # [[m:Date#>>]] も参照してください。
  # 
  # @param n 月数
  def next_month; end

  # --- next_year(n = 1) -> Date
  # n 年後を返します。
  # 
  # self >> (n * 12) に相当します。
  # 
  #   require 'date'
  #   Date.new(2001,2,3).next_year      #=> #<Date: 2002-02-03 ...>
  #   Date.new(2008,2,29).next_year     #=> #<Date: 2009-02-28 ...>
  #   Date.new(2008,2,29).next_year(4)  #=> #<Date: 2012-02-29 ...>
  # 
  # [[m:Date#>>]] も参照してください。
  # 
  # @param n 年数
  def next_year; end

  # --- prev_day(n = 1) -> Date
  # n 日前を返します。
  # 
  # @param n 日数
  def prev_day; end

  # --- prev_month(n = 1) -> Date
  # n ヶ月前を返します。
  # 
  # [[m:Date#<<]] も参照してください。
  # 
  # @param n 月数
  def prev_month; end

  # --- prev_year(n = 1) -> Date
  # n 年前を返します。
  # 
  # self << (n * 12) に相当します。
  # 
  #   require 'date'
  #   Date.new(2001,2,3).prev_year      #=> #<Date: 2000-02-03 ...>
  #   Date.new(2008,2,29).prev_year     #=> #<Date: 2007-02-28 ...>
  #   Date.new(2008,2,29).prev_year(4)  #=> #<Date: 2004-02-29 ...>
  # 
  # [[m:Date#<<]] も参照してください。
  # 
  # @param n 年数
  def prev_year; end

  # --- rfc2822 -> String
  # --- rfc822 -> String
  # [[RFC:2822]] で定められた書式の文字列を返します。
  def rfc2822; end

  # --- saturday? -> bool
  # 土曜日なら真を返します。
  def saturday?; end

  # --- start -> Integer
  # 改暦日をあらわすユリウス日を返します。
  # 
  # [[m:Date.new]] も参照してください。
  def start; end

  # --- step(limit, step = 1){|date| ...} -> self
  # --- step(limit, step = 1) -> Enumerator
  # ブロックの評価を繰り返します。ブロックは日付オブジェクトをとります。
  # limit は日付オブジェクトでなければなりません、
  # また step は非零でなければなりません。
  # 
  # @param limit 日付オブジェクト
  # @param step 歩幅
  # 
  # @see [[m:Date#downto]], [[m:Date#upto]]
  def step; end

  # --- strftime(format = '%F') -> String
  # 与えられた雛型で日付を書式づけます。
  # 
  # つぎの変換仕様をあつかいます:
  # 
  # %A, %a, %B, %b, %C, %c, %D, %d, %e, %F, %G, %g, %H, %h, %I, %j, %k, %L, %l,
  # %M, %m, %N, %n, %P, %p, %Q, %R, %r, %S, %s, %T, %t, %U, %u, %V, %v, %W, %w, %X,
  # %x, %Y, %y, %Z, %z, %:z, %::z, %:::z, %%, %+
  # 
  # GNU 版にあるような幅指定などもできます。
  # 
  # [[man:strftime(3)]]、および [[m:Date.strptime]] も参照してください。
  # 
  # @param format 書式
  def strftime; end

  # --- sunday? -> bool
  # 日曜日なら真を返します。
  def sunday?; end

  # --- thursday? -> bool
  # 木曜日なら真を返します。
  def thursday?; end

  # --- to_date -> Date
  # 対応する [[c:Date]] オブジェクトを返します。
  def to_date; end

  # --- to_datetime -> DateTime
  # 対応する [[c:DateTime]] オブジェクトを返します。
  def to_datetime; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数はそのまま [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] に渡されます。
  # 
  # //emlist[例][ruby]{
  # require "json/add/core"
  # 
  # Date.today.to_json
  # # => "{\"json_class\":\"Date\",\"y\":2018,\"m\":12,\"d\":11,\"sg\":2299161.0}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_s -> String
  # [[ISO:8601]] 書式の文字列を返します (拡大表記はつかいません)。
  def to_s; end

  # --- to_time -> Time
  # 対応する [[c:Time]] オブジェクトを返します。
  def to_time; end

  # --- tuesday? -> bool
  # 火曜日なら真を返します。
  def tuesday?; end

  # --- upto(max){|date| ...} -> self
  # --- upto(max) -> Enumerator
  # このメソッドは、step(max, 1){|date| ...} と等価です。
  # 
  # @param max 日付オブジェクト
  # 
  # @see [[m:Date#step]], [[m:Date#downto]]
  def upto; end

  # --- wday -> Integer
  # 曜日を返します (0-6、日曜日は零)。
  def wday; end

  # --- wednesday? -> bool
  # 水曜日なら真を返します。
  def wednesday?; end

  # --- xmlschema -> String
  # XML Scheme (date) による書式の文字列を返します。
  def xmlschema; end

  # --- yday -> Integer
  # 年の日を返します (1-366)。
  def yday; end

  # --- year -> Integer
  # 年を返します。
  def year; end

  # --- _httpdate(str) -> Hash
  # このメソッドは [[m:Date.httpdate]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.httpdate]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _httpdate; end

  # --- _iso8601(str) -> Hash
  # このメソッドは [[m:Date.iso8601]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.iso8601]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _iso8601; end

  # --- _jisx0301(str) -> Hash
  # このメソッドは [[m:Date.jisx0301]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.jisx0301]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _jisx0301; end

  # --- _parse(str, complete = true) -> Hash
  # このメソッドは [[m:Date.parse]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.parse]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param complete 年を補完するか
  def _parse; end

  # --- _rfc2822(str) -> Hash
  # --- _rfc822(str) -> Hash
  # このメソッドは [[m:Date.rfc2822]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.rfc2822]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _rfc2822; end

  # --- _rfc3339(str) -> Hash
  # このメソッドは [[m:Date.rfc3339]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.rfc3339]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _rfc3339; end

  # --- _strptime(str, format = '%F') -> Hash
  # このメソッドは [[m:Date.strptime]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # @param str 日付をあらわす文字列
  # @param format 書式文字列
  # 
  # 書式文字列に使用できるものは以下の通りです。
  # 
  #   * %A: 曜日の名称(Sunday, Monday ... )
  #   * %a: 曜日の省略名(Sun, Mon ... )
  #   * %B: 月の名称(January, February ... )
  #   * %b: 月の省略名(Jan, Feb ... )
  #   * %C: 世紀 (2009年であれば 20)
  #   * %c: 日付と時刻 (%a %b %e %T %Y)
  #   * %D: 日付 (%m/%d/%y)
  #   * %d: 日(01-31)
  #   * %e: 日。一桁の場合、半角空白で埋める ( 1..31)
  #   * %F: %Y-%m-%d と同等 (ISO 8601の日付フォーマット)
  #   * %H: 24時間制の時(00-23)
  #   * %h: %b と同等
  #   * %I: 12時間制の時(01-12)
  #   * %j: 年中の通算日(001-366)
  #   * %k: 24時間制の時。一桁の場合、半角空白で埋める ( 0..23)
  #   * %L: ミリ秒 (000..999)
  #   * %l: 12時間制の時。一桁の場合、半角空白で埋める ( 0..12)
  #   * %M: 分(00-59)
  #   * %m: 月を表す数字(01-12)
  #   * %n: 改行 (\n)
  #   * %N: 秒の小数点以下
  #   * %P: 午前または午後(am,pm)
  #   * %p: 午前または午後(AM,PM)
  #   * %Q: 1970-01-01 00:00:00 UTC からの経過ミリ秒
  #   * %R: 24時間制の時刻。%H:%M と同等。
  #   * %r: 12時間制の時刻。%I:%M:%S %p と同等。
  #   * %S: 秒(00-60) (60はうるう秒)
  #   * %s: 1970-01-01 00:00:00 UTC からの経過秒
  #   * %T: 24時間制の時刻。%H:%M:%S と同等。
  #   * %t: タブ文字 (\t)
  #   * %U: 週を表す数。最初の日曜日が第1週の始まり(00-53)
  #   * %u: 月曜日を1とした、曜日の数値表現 (1..7)
  #   * %V: ISO 8601形式の暦週 (01..53)
  #   * %v: VMS形式の日付 (%e-%b-%Y)
  #   * %W: 週を表す数。最初の月曜日が第1週の始まり(00-53)
  #   * %w: 曜日を表す数。日曜日が0(0-6)
  #   * %X: 時刻 (%Tと同等)
  #   * %x: 日付 (%Dと同等)
  #   * %Y: 西暦を表す数
  #   * %y: 西暦の下2桁(00-99)
  #   * %z: タイムゾーン。UTCからのオフセット (例 +0900)
  #   * %:z: タイムゾーン。コロンが入ったUTCからのオフセット (例 +09:00)
  #   * %::z: タイムゾーン。コロンが入った秒まで含むUTCからのオフセット (例 +09:00:00)
  #   * %Z: タイムゾーン名
  #   * %%: %自身
  #   * %+: [[man:date(1)]]の形式 (%a %b %e %H:%M:%S %Z %Y)
  def _strptime; end

  # --- _xmlschema(str) -> Hash
  # このメソッドは [[m:Date.xmlschema]] と似ていますが、日付オブジェクトを生成せずに、
  # 見いだした要素をハッシュで返します。
  # 
  # [[m:Date.xmlschema]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  def _xmlschema; end

  # --- civil(year = -4712, mon = 1, mday = 1, start = Date::ITALY) -> Date
  # --- new(year = -4712, mon = 1, mday = 1, start = Date::ITALY) -> Date
  # 暦日付に相当する日付オブジェクトを生成します。
  # 
  # このクラスでは、紀元前の年を天文学の流儀で勘定します。
  # 1年の前は零年、零年の前は-1年、のようにします。
  # 月、および月の日は負、
  # または正の数でなければなりません (負のときは最後からの序数)。
  # 零であってはなりません。
  # 
  # 最後の引数は、グレゴリオ暦をつかい始めた日をあらわすユリウス日です。
  # 省略した場合は、[[m:Date::ITALY]] (1582年10月15日) になります。
  # 
  # [[m:Date.jd]] も参照してください。
  # 
  # @param year 年
  # @param mon 月
  # @param mday 日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise Date::Error 正しくない日付になる組み合わせである場合に発生します。
  # 
  # 例:
  #   require 'date'
  #   Date.new(2017, 9, 20)  # => #<Date: 2017-09-20 ...>
  def civil; end

  # --- commercial(cwyear = -4712, cweek = 1, cwday = 1, start = Date::ITALY) -> Date
  # 暦週日付に相当する日付オブジェクトを生成します。
  # 
  # 週、および週の日 (曜日) は負、
  # または正の数でなければなりません(負のときは最後からの序数)。
  # 零であってはなりません。
  # 
  # このメソッドに改暦前の日付を与えることはできません。
  # 
  # [[m:Date.jd]]、および [[m:Date.new]] も参照してください。
  # 
  # @param cwyear 年
  # @param cweek 週
  # @param cwday 週の日 (曜日)
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise Date::Error 正しくない日付になる組み合わせである場合に発生します。
  def commercial; end

  # --- gregorian_leap? (year) -> bool
  # --- leap? (year) -> bool
  # グレゴリオ暦の閏年なら真を返します。
  # 
  # @param year 年
  def gregorian_leap?; end

  # --- httpdate(str = 'Mon, 01 Jan -4712 00:00:00 GMT', start = Date::ITALY) -> Date
  # [[RFC:2616]] で定められた書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._httpdate]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def httpdate; end

  # --- iso8601(str = '-4712-01-01', start = Date::ITALY) -> Date
  # いくつかの代表的な [[ISO:8601]] 書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # @param str 日付をあらわす文字列
  # 
  # [[m:Date._iso8601]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def iso8601; end

  # --- jd(jd = 0, start = Date::ITALY) -> Date
  # ユリウス日に相当する日付オブジェクトを生成します。
  # 
  # このクラスのいくつかの重要なメソッドで、
  # 負のユリウス日は保証されません。
  # 
  # [[m:Date.new]] も参照してください。
  # 
  # @param jd ユリウス日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def jd; end

  # --- jisx0301(str = '-4712-01-01', start = Date::ITALY) -> Date
  # いくつかの代表的な [[JIS:X 0301]] 書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._jisx0301]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def jisx0301; end

  # --- json_create(hash) -> Date
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- julian_leap? (year) -> bool
  # ユリウス暦の閏年なら真を返します。
  # 
  # 西暦4年は真になりますが、
  # これは歴史的には正しくありません。
  # 
  # @param year 年
  def julian_leap?; end

  # --- ordinal(year = -4712, yday = 1, start = Date::ITALY) -> Date
  # 年間通算日 (年日付) に相当する日付オブジェクトを生成します。
  # 
  # 年の日は負、
  # または正の数でなければなりません (負のときは最後からの序数)。
  # 零であってはなりません。
  # 
  # [[m:Date.jd]]、および [[m:Date.new]] も参照してください。
  # 
  # @param year 年
  # @param yday 年の日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise Date::Error 正しくない日付になる組み合わせである場合に発生します。
  def ordinal; end

  # --- parse(str = '-4712-01-01', complete = true, start = Date::ITALY) -> Date
  # 与えられた日付表現を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # 年が "00" から "99" の範囲であれば、
  # 年の下2桁表現であるとみなしこれを補います。
  # この振舞いを抑止したい場合は、ヒントとして、complete に false を与えます。
  # 
  # [[m:Date._parse]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param complete 年を補完するか
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise Date::Error 正しくない日付になる組み合わせである場合に発生します。
  def parse; end

  # --- rfc2822(str = 'Mon, 1 Jan -4712 00:00:00 +0000', start = Date::ITALY) -> Date
  # --- rfc822(str = 'Mon, 1 Jan -4712 00:00:00 +0000', start = Date::ITALY) -> Date
  # [[RFC:2822]] で定められた書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._rfc2822]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def rfc2822; end

  # --- rfc3339(str = '-4712-01-01T00:00:00+00:00', start = Date::ITALY) -> Date
  # [[RFC:3339]] 書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._rfc3339]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def rfc3339; end

  # --- strptime(str = '-4712-01-01', format = '%F', start = Date::ITALY) -> Date
  # 与えられた雛型で日付表現を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._strptime]] も参照してください。
  # また [[man:strptime(3)]]、および [[m:Date#strftime]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param format 書式
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise Date::Error 正しくない日付になる組み合わせである場合に発生します。
  def strptime; end

  # --- today(start = Date::ITALY) -> Date
  # 現在の日付に相当する日付オブジェクトを生成します。
  # 
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # 
  # 例:
  #   require 'date'
  #   Date.today  # => #<Date: 2017-09-20 ...>
  def today; end

  # --- valid_civil? (year, mon, mday, start = Date::GREGORIAN) -> bool
  # --- valid_date? (year, mon, mday, start = Date::GREGORIAN) -> bool
  # 正しい暦日付であれば真、そうでないなら偽を返します。
  # 
  # [[m:Date.jd]]、および [[m:Date.civil]] も参照してください。
  # 
  # @param year 年
  # @param mon 月
  # @param mday 日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def valid_civil?; end

  # --- valid_commercial? (cwyear, cweek, cwday, start = Date::GREGORIAN) -> bool
  # 正しい暦週日付であれば真、そうでないなら偽を返します。
  # 
  # [[m:Date.jd]]、および [[m:Date.commercial]] も参照してください。
  # 
  # @param cwyear 年
  # @param cweek 週
  # @param cwday 週の日 (曜日)
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def valid_commercial?; end

  # --- valid_jd? (jd, start = Date::GREGORIAN) -> bool
  # 真を返します。
  # 
  # 対称性のため用意されていますが、実際的に意味はありません。
  # 
  # [[m:Date.jd]] も参照してください。
  # 
  # @param jd ユリウス日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def valid_jd?; end

  # --- valid_ordinal? (year, yday, start = Date::GREGORIAN) -> bool
  # 正しい年間通算日 (年日付) であれば真、そうでないなら偽を返します。
  # 
  # [[m:Date.jd]]、および [[m:Date.ordinal]] も参照してください。
  # 
  # @param year 年
  # @param yday 年の日
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def valid_ordinal?; end

  # --- xmlschema(str = '-4712-01-01', start = Date::ITALY) -> Date
  # XML Schema による書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._xmlschema]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def xmlschema; end

  # --- ENGLAND -> Integer
  # 英国がグレゴリオ暦をつかい始めた日 (1752年9月14日) をあらわすユリウス日です。
  # この "ENGLAND" の名前は、旧い UNIX の [[man:cal(1)]] の記述に由来します。
  # 
  # @see [[url:https://www.bell-labs.com/usr/dmr/www/pdfs/man61.pdf]]
  # 
  # ちなみに、本実装で英国の改暦日を尊重する姿勢がみられるのは前実装からの影響です。
  # 前実装が英国の改暦日を尊重していたのは、おそらく [[man:cal(1)]] の影響です。
  # もっとも本実装で一番に尊重されているのは、伊国の改暦日であり、多くの場合、
  # 改暦日の既定値は [[m:Date::ITALY]] です。
  def ENGLAND; end

  # --- GREGORIAN -> Date::Infinity
  # 常にグレゴリオ暦であることを示します。
  # 改暦日は無限の過去にあると考えられます。
  def GREGORIAN; end

  # --- ITALY -> Integer
  # 伊国がグレゴリオ暦をつかい始めた日 (1582年10月15日) をあらわすユリウス日です。
  def ITALY; end

  # --- JULIAN -> Date::Infinity
  # 常にユリウス暦であることを示します。
  # 改暦日は無限の未来にあると考えられます。
  def JULIAN; end

end
