class Time
  # --- +(other)    -> Time
  # 
  # self より other 秒だけ後の時刻を返します。
  # 
  # @param other 自身からの秒数を数値で指定します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000)  # => 2000-01-01 00:00:00 +0900
  # p t + (60 * 60 * 24)    # => 2000-01-02 00:00:00 +0900
  # //}
  def +; end

  # --- -(time)    -> Float
  # 
  # 自身と time との時刻の差を [[c:Float]] で返します。単位は秒です。
  # 
  # @param time 自身との差を算出したい Time オブジェクトを指定します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000)  # => 2000-01-01 00:00:00 +0900
  # p t2 = t + 2592000      # => 2000-01-31 00:00:00 +0900
  # p t2 - t                # => 2592000.0
  # //}
  # 
  # --- -(sec)    -> Time
  # 
  # 自身より sec 秒だけ前の時刻を返します。
  # 
  # @param sec 実数を秒を単位として指定します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000)  # => 2000-01-01 00:00:00 +0900
  # p t2 = t + 2592000      # => 2000-01-31 00:00:00 +0900
  # p t2 - 2592000          # => 2000-01-01 00:00:00 +0900
  # //}
  def -; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self と other の時刻を比較します。self の方が大きい場合は 1 を、等しい場合は 0 を、
  # 小さい場合は -1 を返します。比較できない場合は、nil を返します。
  # 
  # @param other 自身と比較したい時刻を Time オブジェクトで指定します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000)  # => 2000-01-01 00:00:00 +0900
  # p t2 = t + 2592000      # => 2000-01-31 00:00:00 +0900
  # p t <=> t2              # => -1
  # p t2 <=> t              # => 1
  # //}
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000)  # => 2000-01-01 00:00:00 +0900
  # p t2 = t + 0.1          # => 2000-01-01 00:00:00 +0900
  # p t.nsec                # => 0
  # p t2.nsec               # => 100000000
  # p t <=> t2              # => -1
  # p t2 <=> t              # => 1
  # p t <=> t               # => 0
  # //}
  def <=>; end

  # --- asctime    -> String
  # --- ctime      -> String
  # 
  # 時刻を [[man:asctime(3)]] の形式の文字列に変換します。た
  # だし、末尾の改行文字 "\n" は含まれません。
  # 
  # 戻り値の文字エンコーディングは [[m:Encoding::US_ASCII]] です。
  # 
  # //emlist[][ruby]{
  # p Time.local(2000).asctime            # => "Sat Jan  1 00:00:00 2000"
  # p Time.local(2000).asctime.encoding   # => #<Encoding:US-ASCII>
  # p Time.local(2000).ctime              # => "Sat Jan  1 00:00:00 2000"
  # //}
  def asctime; end

  # --- ceil(ndigits=0)   -> Time
  # 
  # 十進小数点数で指定した桁数の精度で切り上げをし、
  # その [[c:Time]] オブジェクトを返します。
  # (デフォルトは0、つまり小数点の所で切り上げます)。
  # 
  # ndigits には 0 以上の整数を渡します。
  # 
  # @param ndigits 十進での精度(桁数)
  # 
  # //emlist[][ruby]{
  # require 'time'
  # 
  # t = Time.utc(2010,3,30, 5,43,25.0123456789r)
  # t.iso8601(10)          # => "2010-03-30T05:43:25.0123456789Z"
  # t.ceil.iso8601(10)     # => "2010-03-30T05:43:26.0000000000Z"
  # t.ceil(0).iso8601(10)  # => "2010-03-30T05:43:26.0000000000Z"
  # t.ceil(1).iso8601(10)  # => "2010-03-30T05:43:25.1000000000Z"
  # t.ceil(2).iso8601(10)  # => "2010-03-30T05:43:25.0200000000Z"
  # t.ceil(3).iso8601(10)  # => "2010-03-30T05:43:25.0130000000Z"
  # t.ceil(4).iso8601(10)  # => "2010-03-30T05:43:25.0124000000Z"
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # (t + 0.4).ceil.iso8601(3)    # => "2000-01-01T00:00:00.000Z"
  # (t + 0.9).ceil.iso8601(3)    # => "2000-01-01T00:00:00.000Z"
  # (t + 1.4).ceil.iso8601(3)    # => "2000-01-01T00:00:01.000Z"
  # (t + 1.9).ceil.iso8601(3)    # => "2000-01-01T00:00:01.000Z"
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # (t + 0.123456789).ceil(4).iso8601(6)  # => "1999-12-31T23:59:59.123500Z"
  # //}
  # 
  # @see [[m:Time#floor]], [[m:Time#round]]
  def ceil; end

  # --- mday    -> Integer
  # --- day     -> Integer
  # 
  # 日を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)  # => 2000-01-02 03:04:05 +0900
  # p t.day                         # => 2
  # p t.mday                        # => 2
  # //}
  def day; end

  # --- isdst    -> bool
  # --- dst?     -> bool
  # 
  # 自身が表す日時が夏時間なら true を返します。そうでないなら false を返します。
  # 
  # //emlist[][ruby]{
  # ENV['TZ'] = 'US/Pacific'
  # p Time.local(2000, 7, 1).isdst   # => true
  # p Time.local(2000, 1, 1).isdst   # => false
  # //}
  def dst?; end

  # --- eql?(other)    -> bool
  # 
  # other が Time かそのサブクラスのインスタンスであり自身と時刻が等しい場合に
  # true を返します。そうでない場合に false を返します。
  # 
  # @param other 自身と比較したい時刻を Time オブジェクトを指定します。
  # 
  # //emlist[][ruby]{
  # p Time.local(2000, 1, 1).eql?(Time.local(2000, 1, 1))   # => true
  # p Time.local(2000, 1, 1).eql?(Time.local(2000, 1, 2))   # => false
  # //}
  def eql?; end

  # --- floor(ndigits=0)   -> Time
  # 
  # 十進小数点数で指定した桁数の精度で切り捨てをし、
  # その [[c:Time]] オブジェクトを返します。
  # (デフォルトは0、つまり小数点の所で切り捨てます)。
  # 
  # ndigits には 0 以上の整数を渡します。
  # 
  # @param ndigits 十進での精度(桁数)
  # 
  # //emlist[][ruby]{
  # require 'time'
  # 
  # t = Time.utc(2010,3,30, 5,43,25.123456789r)
  # t.iso8601(10)           # => "2010-03-30T05:43:25.1234567890Z"
  # t.floor.iso8601(10)     # => "2010-03-30T05:43:25.0000000000Z"
  # t.floor(0).iso8601(10)  # => "2010-03-30T05:43:25.0000000000Z"
  # t.floor(1).iso8601(10)  # => "2010-03-30T05:43:25.1000000000Z"
  # t.floor(2).iso8601(10)  # => "2010-03-30T05:43:25.1200000000Z"
  # t.floor(3).iso8601(10)  # => "2010-03-30T05:43:25.1230000000Z"
  # t.floor(4).iso8601(10)  # => "2010-03-30T05:43:25.1234000000Z"
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # (t + 0.4).floor.iso8601(3)    # => "1999-12-31T23:59:59.000Z"
  # (t + 0.9).floor.iso8601(3)    # => "1999-12-31T23:59:59.000Z"
  # (t + 1.4).floor.iso8601(3)    # => "2000-01-01T00:00:00.000Z"
  # (t + 1.9).floor.iso8601(3)    # => "2000-01-01T00:00:00.000Z"
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # (t + 0.123456789).floor(4).iso8601(6)  # => "1999-12-31T23:59:59.123400Z"
  # //}
  # 
  # @see [[m:Time#ceil]], [[m:Time#round]]
  def floor; end

  # --- friday? -> bool
  # 
  # self の表す時刻が金曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(1987, 12, 18)     # => 1987-12-18 00:00:00 +0900
  # p t.friday?                      # => true
  # //}
  def friday?; end

  # --- getgm     -> Time
  # --- getutc    -> Time
  # 
  # タイムゾーンを協定世界時に設定した Time オブジェクトを新しく
  # 生成して返します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 +0900
  # p t.gmt?                             #=> false
  # p y = t.getgm                        #=> 2000-01-01 11:15:01 UTC
  # p y.gmt?                             #=> true
  # p t == y                             #=> true
  # //}
  def getgm; end

  # --- getlocal             -> Time
  # --- getlocal(utc_offset) -> Time
  # 
  # タイムゾーンを地方時に設定した Time オブジェクトを新しく生成
  # して返します。
  # 
  # @param utc_offset タイムゾーンを地方時に設定する代わりに協定世界時との
  #                   時差を、秒を単位とする整数か、"+HH:MM" "-HH:MM" 形式
  #                   の文字列で指定します。
  # 
  # //emlist[][ruby]{
  # p t = Time.utc(2000,1,1,20,15,1)  # => 2000-01-01 20:15:01 UTC
  # p t.utc?                          # => true
  # p l = t.getlocal                  # => 2000-01-02 05:15:01 +0900
  # p l.utc?                          # => false
  # p t == l                          # => true
  # p j = t.getlocal("+09:00")        # => 2000-01-02 05:15:01 +0900
  # p j.utc?                          # => false
  # p t == j                          # => true
  # //}
  def getlocal; end

  # --- gmt?    -> bool
  # --- utc?    -> bool
  # 
  # self のタイムゾーンが協定世界時に設定されていれば真を返します。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2017,9,19,15,0,0)   # => 2017-09-19 15:00:00 +0900
  # p t.utc?                             # => false
  # p utc_t = t.getutc                   # => 2017-09-19 06:00:00 UTC
  # p utc_t.utc?                         # => true
  # //}
  def gmt?; end

  # --- utc_offset     -> Integer
  # --- gmt_offset     -> Integer
  # --- gmtoff         -> Integer
  # 
  # 協定世界時との時差を秒を単位とする数値として返します。
  # 
  # 地方時が協定世界時よりも進んでいる場合(アジア、オーストラリアなど)
  # には正の値、遅れている場合(アメリカなど)には負の値になります。
  # 
  # //emlist[地方時の場合][ruby]{
  # p Time.now.zone        # => "JST"
  # p Time.now.utc_offset  # => 32400
  # //}
  # 
  # タイムゾーンが協定世界時に設定されている場合は 0 を返します。
  # 
  # //emlist[協定世界時の場合][ruby]{
  # p Time.now.getgm.zone        # => "UTC"
  # p Time.now.getgm.utc_offset  # => 0
  # //}
  def gmt_offset; end

  # --- gmtime    -> self
  # --- utc       -> self
  # 
  # タイムゾーンを協定世界時に設定します。
  # 
  # このメソッドを呼び出した後は時刻変換を協定世界時として行ないます。
  # 
  # [[m:Time#localtime]], [[m:Time#gmtime]] の挙動はシステムの
  # [[man:localtime(3)]] の挙動に依存します。Time クラ
  # スでは時刻を起算時からの経過秒数として保持していますが、ある特定の
  # 時刻までの経過秒は、システムがうるう秒を勘定するかどうかによって異
  # なる場合があります。システムを越えて Time オブジェクトを受け
  # 渡す場合には注意する必要があります。
  # 
  # //emlist[][ruby]{
  # p t = Time.local(2000,1,1,20,15,1)   # => 2000-01-01 20:15:01 +0900
  # p t.gmt?                             # => false
  # p t.gmtime                           # => 2000-01-01 11:15:01 UTC
  # p t.gmt?                             # => true
  # //}
  def gmtime; end

  # --- hash -> Integer
  # 
  # self のハッシュ値を返します。
  # 
  # @return ハッシュ値を返します。
  # 
  # 
  # @see [[m:Object#hash]]
  def hash; end

  # --- hour    -> Integer
  # 
  # 時を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)  # => 2000-01-02 03:04:05 +0900
  # p t.hour                        # => 3
  # //}
  def hour; end

  # --- httpdate -> String
  # 
  # [[RFC:2616]] で定義されている HTTP-date の rfc1123-date 形式の文字列を
  # 返します。
  # 
  # @return 以下の形式の文字列を返します。
  # //emlist{
  #   day-of-week, DD month-name CCYY hh:mm:ss GMT
  # //}
  #         注意: 結果はいつも UTC (GMT) です。
  # 
  # 使用例
  #   require 'time'
  # 
  #   iso8601_time = '2008-08-31T12:34:56+09:00'
  #   t = Time.iso8601(iso8601_time)
  #   p t.httpdate     #=> "Sun, 31 Aug 2008 03:34:56 GMT"
  def httpdate; end

  # --- inspect     -> String
  # 
  # 時刻を文字列に変換した結果を返します。
  # 
  # [[m:Time#to_s]] とは異なりナノ秒まで含めて返します。
  # 
  # //emlist[][ruby]{
  # t = Time.now
  # t.inspect                             #=> "2012-11-10 18:16:12.261257655 +0100"
  # t.strftime "%Y-%m-%d %H:%M:%S.%N %z"  #=> "2012-11-10 18:16:12.261257655 +0100"
  # 
  # t.utc.inspect                          #=> "2012-11-10 17:16:12.261257655 UTC"
  # t.strftime "%Y-%m-%d %H:%M:%S.%N UTC"  #=> "2012-11-10 17:16:12.261257655 UTC"
  # //}
  # 
  # 戻り値の文字エンコーディングは [[m:Encoding::US_ASCII]] です。
  def inspect; end

  # --- xmlschema(fractional_seconds = 0) -> String
  # --- iso8601(fractional_seconds = 0) -> String
  # 
  # XML Schema で定義されている dateTime として
  # 表現される形式の文字列を返します。
  # 
  # XML Schema で定義されている dateTime として
  # 表現される形式の文字列をパースするためのクラスメソッド
  # [[m:Time.iso8601]], [[m:Time.xmlschema]] もあります。
  # 
  # @param fractional_seconds 小数点以下の秒の桁数を整数で指定します。
  #                           省略した場合は0 となります。
  # 
  # @return 以下の形式の文字列を返します。
  # //emlist{
  #   CCYY-MM-DDThh:mm:ssTZD
  #   CCYY-MM-DDThh:mm:ss.sssTZD
  # //}
  #         ただし TZD は Z または [+-]hh:mm です。
  # 
  # 使用例
  #   require 'time'
  # 
  #   iso8601_time = '2008-08-31T12:34:56+09:00'
  #   t = Time.iso8601(iso8601_time)
  #   p t.xmlschema    #=> "2008-08-31T03:34:56Z"
  #   p t.xmlschema(9) #=> "2008-08-31T03:34:56.000000000Z"
  # 
  # @see [[m:Time.iso8601]], [[m:Time.xmlschema]]
  def iso8601; end

  # --- localtime             -> self
  # --- localtime(utc_offset) -> self
  # 
  # タイムゾーンを地方時に設定します。
  # 
  # このメソッドを呼び出した後は時刻変換を協定地方時として行ないます。
  # 
  # @param utc_offset タイムゾーンを地方時に設定する代わりに協定世界時との
  #                   時差を、秒を単位とする整数か、"+HH:MM" "-HH:MM" 形式
  #                   の文字列で指定します。
  # 
  # [[m:Time#localtime]], [[m:Time#gmtime]] の挙動はシステムの
  # [[man:localtime(3)]] の挙動に依存します。Time クラ
  # スでは時刻を起算時からの経過秒数として保持していますが、ある特定の
  # 時刻までの経過秒は、システムがうるう秒を勘定するかどうかによって異
  # なる場合があります。システムを越えて Time オブジェクトを受け
  # 渡す場合には注意する必要があります。
  # 
  # //emlist[][ruby]{
  # p t = Time.utc(2000, "jan", 1, 20, 15, 1)  # => 2000-01-01 20:15:01 UTC
  # p t.utc?                                   # => true
  # p t.localtime                              # => 2000-01-02 05:15:01 +0900
  # p t.utc?                                   # => false
  # 
  # p t.localtime("+09:00")                    # => 2000-01-02 05:15:01 +0900
  # p t.utc?                                   # => false
  # //}
  def localtime; end

  # --- min    -> Integer
  # 
  # 分を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)  # => 2000-01-02 03:04:05 +0900
  # p t.min                         # => 4
  # //}
  def min; end

  # --- mon      -> Integer
  # --- month    -> Integer
  # 
  # 月を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)  # => 2000-01-02 03:04:05 +0900
  # p t.month                       # => 1
  # p t.mon                         # => 1
  # //}
  def mon; end

  # --- monday? -> bool
  # 
  # self の表す時刻が月曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2003, 8, 4)       # => 2003-08-04 00:00:00 +0900
  # p t.monday?                      # => true
  # //}
  def monday?; end

  # --- nsec    -> Integer
  # --- tv_nsec -> Integer
  # 
  # 時刻のナノ秒の部分を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p "%10.9f" % t.to_f   # => "946749845.000005960"
  # p t.nsec              # => 6000
  # //}
  # 
  # IEEE 754 浮動小数点数で表現できる精度が違うため、[[m:Time#to_f]]の最小
  # の桁とnsecの最小の桁は異なります。nsecで表される値の方が正確です。
  def nsec; end

  # --- rfc2822 -> String
  # --- rfc822 -> String
  # 
  # [[RFC:2822]] で定義されている date-time として表現される形式の文字列を
  # 返します。
  # 
  # @return 以下の形式の文字列を返します。
  # //emlist{
  #   day-of-week, DD month-name CCYY hh:mm:ss zone
  # //}
  #         ただし zone は [+-]hhmm です。
  #         self が UTC time の場合、zone は +0000 になります。
  # 
  # 使用例
  #   require 'time'
  # 
  #   iso8601_time = '2008-08-31T12:34:56+09:00'
  #   t = Time.iso8601(iso8601_time)
  #   p t.rfc2822      #=> "Sun, 31 Aug 2008 03:34:56 -0000"
  def rfc2822; end

  # --- round(ndigits=0) -> Time
  # 
  # 十進小数点数で指定した桁数の精度で丸めをし、
  # その [[c:Time]] オブジェクトを返します。
  # (デフォルトは0、つまり小数点の所で丸めます)。
  # 
  # ndigits には 0 以上の整数を渡します。
  # 
  # @param ndigits 十進での精度(桁数)
  # 
  # //emlist[][ruby]{
  # require 'time'
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # p((t + 0.4).round.iso8601(3))    # => "1999-12-31T23:59:59.000Z"
  # p((t + 0.49).round.iso8601(3))   # => "1999-12-31T23:59:59.000Z"
  # p((t + 0.5).round.iso8601(3))    # => "2000-01-01T00:00:00.000Z"
  # p((t + 1.4).round.iso8601(3))    # => "2000-01-01T00:00:00.000Z"
  # p((t + 1.49).round.iso8601(3))   # => "2000-01-01T00:00:00.000Z"
  # p((t + 1.5).round.iso8601(3))    # => "2000-01-01T00:00:01.000Z"
  # 
  # t = Time.utc(1999,12,31, 23,59,59)
  # p (t + 0.123456789).round(4).iso8601(6)  # => "1999-12-31T23:59:59.123500Z"
  # //}
  # 
  # @see [[m:Time#ceil]], [[m:Time#floor]]
  def round; end

  # --- saturday? -> bool
  # 
  # self の表す時刻が土曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2006, 6, 10)      # => 2006-06-10 00:00:00 +0900
  # p t.saturday?                    # => true
  # //}
  def saturday?; end

  # --- sec    -> Integer
  # 
  # 秒を整数で返します。
  # 
  # //emlist[][ruby]{
  # p Time.mktime(2000, 1, 1).sec # => 0
  # //}
  # 
  # 通常は0から59を返しますが、うるう秒の場合は60を返します。
  # 
  # //emlist[][ruby]{
  # ENV['TZ'] = 'right/UTC'
  # p Time.mktime(2005, 12, 31, 23, 59, 60).sec # => 60
  # //}
  def sec; end

  # --- strftime(format)    -> String
  # 
  # 時刻を format 文字列に従って文字列に変換した結果を返します。
  # 
  # @param format フォーマット文字列を指定します。使用できるものは 以下の通りです。
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
  #   * %G: ISO 8601の暦週の年
  #   * %g: ISO 8601の暦週の年の下2桁(00-99)
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
  #   * %N: 秒の小数点以下。桁の指定がない場合は9桁 (ナノ秒)、%6N: マイクロ秒 (6桁)、%3N: ミリ秒 (3桁)
  #   * %P: 午前または午後(am,pm)
  #   * %p: 午前または午後(AM,PM)
  #   * %Q: 1970-01-01 00:00:00 UTC からの経過ミリ秒 ([[m:Time#strftime]] は対応していませんが、[[m:Date#strftime]] で使えます)
  #   * %R: 24時間制の時刻。%H:%M と同等。
  #   * %r: 12時間制の時刻。%I:%M:%S %p と同等。
  #   * %S: 秒(00-60) (60はうるう秒)
  #   * %s: 1970-01-01 00:00:00 UTC からの経過秒
  #   * %T: 24時間制の時刻。%H:%M:%S と同等。
  #   * %t: タブ文字 (\t)
  #   * %U: 週を表す数。最初の日曜日が第1週の始まり(00-53)
  #   * %u: 月曜日を1とした、曜日の数値表現 (1..7)
  #   * %V: ISO 8601形式の暦週 (01..53)
  #   * %v: VMS形式の日付 (%e-%^b-%4Y)
  #   * %W: 週を表す数。最初の月曜日が第1週の始まり(00-53)
  #   * %w: 曜日を表す数。日曜日が0(0-6)
  #   * %X: 時刻 (%Tと同等)
  #   * %x: 日付 (%Dと同等)
  #   * %Y: 西暦を表す数
  #   * %y: 西暦の下2桁(00-99)
  #   * %Z: タイムゾーン (環境依存)
  #   * %z: タイムゾーン。UTCからのオフセット (例 +0900)
  #   * %:z: タイムゾーン。コロンが入ったUTCからのオフセット (例 +09:00)
  #   * %::z: タイムゾーン。コロンが入った秒まで含むUTCからのオフセット (例 +09:00:00)
  #   * %%: %自身
  #   * %+: [[man:date(1)]]の形式 (%a %b %e %H:%M:%S %Z %Y) ([[m:Time#strftime]] は対応していませんが、[[m:Date#strftime]] で使えます)
  # 
  # このメソッドは [[man:strftime(3)]] や glibcの仕様を参考に作成されており、以下のオプションが利用できます。
  #   * ^: 大文字で出力を行なう
  #   * #: 小文字であれば大文字に、大文字であれば小文字に変更する
  #   * -: 左寄せにする(0埋めや空白埋めを行わない)
  #   * _: 空白埋めにする
  #   * 0: 0埋めにする
  #   * 数値: 表示桁数を指定する
  # EとOは無視されます。
  # 
  # //emlist[例][ruby]{
  # p t = Time.new(2001,2,3,4,5,6,"+09:00")  # => 2001-02-03 04:05:06 +0900
  # p t.strftime("Printed on %m/%d/%Y")      # => "Printed on 02/03/2001"
  # p t.strftime("Printed on %m/%-d/%_6Y")   # => "Printed on 02/3/  2001"
  # p t.strftime("at %I:%M%p")               # => "at 04:05AM"
  # p t.strftime("at %I:%M%#p")              # => "at 04:05am"
  # //}
  # 
  # //emlist[様々なISO 8601形式][ruby]{
  # t = Time.new(2001,2,3,4,5,6,"+09:00")
  # p t.strftime("%Y%m%d")           # => 20010203                  Calendar date (basic)
  # p t.strftime("%F")               # => 2001-02-03                Calendar date (extended)
  # p t.strftime("%Y-%m")            # => 2001-02                   Calendar date, reduced accuracy, specific month
  # p t.strftime("%Y")               # => 2001                      Calendar date, reduced accuracy, specific year
  # p t.strftime("%C")               # => 20                        Calendar date, reduced accuracy, specific century
  # p t.strftime("%Y%j")             # => 2001034                   Ordinal date (basic)
  # p t.strftime("%Y-%j")            # => 2001-034                  Ordinal date (extended)
  # p t.strftime("%GW%V%u")          # => 2001W056                  Week date (basic)
  # p t.strftime("%G-W%V-%u")        # => 2001-W05-6                Week date (extended)
  # p t.strftime("%GW%V")            # => 2001W05                   Week date, reduced accuracy, specific week (basic)
  # p t.strftime("%G-W%V")           # => 2001-W05                  Week date, reduced accuracy, specific week (extended)
  # p t.strftime("%H%M%S")           # => 040506                    Local time (basic)
  # p t.strftime("%T")               # => 04:05:06                  Local time (extended)
  # p t.strftime("%H%M")             # => 0405                      Local time, reduced accuracy, specific minute (basic)
  # p t.strftime("%H:%M")            # => 04:05                     Local time, reduced accuracy, specific minute (extended)
  # p t.strftime("%H")               # => 04                        Local time, reduced accuracy, specific hour
  # p t.strftime("%H%M%S,%L")        # => 040506,000                Local time with decimal fraction, comma as decimal sign (basic)
  # p t.strftime("%T,%L")            # => 04:05:06,000              Local time with decimal fraction, comma as decimal sign (extended)
  # p t.strftime("%H%M%S.%L")        # => 040506.000                Local time with decimal fraction, full stop as decimal sign (basic)
  # p t.strftime("%T.%L")            # => 04:05:06.000              Local time with decimal fraction, full stop as decimal sign (extended)
  # p t.strftime("%H%M%S%z")         # => 040506+0900               Local time and the difference from UTC (basic)
  # p t.strftime("%T%:z")            # => 04:05:06+09:00            Local time and the difference from UTC (extended)
  # p t.strftime("%Y%m%dT%H%M%S%z")  # => 20010203T040506+0900      Date and time of day for calendar date (basic)
  # p t.strftime("%FT%T%:z")         # => 2001-02-03T04:05:06+09:00 Date and time of day for calendar date (extended)
  # p t.strftime("%Y%jT%H%M%S%z")    # => 2001034T040506+0900       Date and time of day for ordinal date (basic)
  # p t.strftime("%Y-%jT%T%:z")      # => 2001-034T04:05:06+09:00   Date and time of day for ordinal date (extended)
  # p t.strftime("%GW%V%uT%H%M%S%z") # => 2001W056T040506+0900      Date and time of day for week date (basic)
  # p t.strftime("%G-W%V-%uT%T%:z")  # => 2001-W05-6T04:05:06+09:00 Date and time of day for week date (extended)
  # p t.strftime("%Y%m%dT%H%M")      # => 20010203T0405             Calendar date and local time (basic)
  # p t.strftime("%FT%R")            # => 2001-02-03T04:05          Calendar date and local time (extended)
  # p t.strftime("%Y%jT%H%MZ")       # => 2001034T0405Z             Ordinal date and UTC of day (basic)
  # p t.strftime("%Y-%jT%RZ")        # => 2001-034T04:05Z           Ordinal date and UTC of day (extended)
  # p t.strftime("%GW%V%uT%H%M%z")   # => 2001W056T0405+0900        Week date and local time and difference from UTC (basic)
  # p t.strftime("%G-W%V-%uT%R%:z")  # => 2001-W05-6T04:05+09:00    Week date and local time and difference from UTC (extended)
  # //}
  def strftime; end

  # --- subsec -> Integer | Rational
  # 
  # 時刻を表す分数を返します。
  # 
  # [[c:Rational]] を返す場合があります。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p "%10.9f" % t.to_f   # => "946749845.000005960"
  # p t.subsec            #=> (3/500000)
  # //}
  # 
  # to_f の値と subsec の値の下のほうの桁の値は異なる場合があります。
  # というのは IEEE 754 double はそれを表すのに十分な精度を
  # 持たないからです。subsec で得られる値が正確です。
  def subsec; end

  # --- sunday? -> bool
  # 
  # self の表す時刻が日曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(1990, 4, 1)       # => 1990-04-01 00:00:00 +0900
  # p t.sunday?                      # => true
  # //}
  def sunday?; end

  # --- thursday? -> bool
  # 
  # self の表す時刻が木曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(1995, 12, 21)     # => 1995-12-21 00:00:00 +0900
  # p t.thursday?                    # => true
  # //}
  def thursday?; end

  # --- to_a     -> Array
  # 
  # 時刻を10要素の配列で返します。
  # 
  # その要素は順序も含めて以下の通りです。
  # 
  #   * sec:   秒 (整数 0-60) (60はうるう秒)
  #   * min:   分 (整数 0-59)
  #   * hour:  時 (整数 0-23)
  #   * mday:  日 (整数)
  #   * mon:   月 (整数 1-12)
  #   * year:  年 (整数 2000年=2000)
  #   * wday:  曜日 (整数 0-6)
  #   * yday:  年内通算日 (整数 1-366)
  #   * isdst: 夏時間であるかどうか (true/false)
  #   * zone:  タイムゾーン (文字列)
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)
  # p t       # => 2000-01-02 03:04:05 +0900
  # p t.to_a  # => [5, 4, 3, 2, 1, 2000, 0, 2, false, "JST"]
  # //}
  # 
  # 要素の順序は C 言語の tm 構造体に合わせています。ただし、
  # tm 構造体に zone はありません。
  # 
  # 注意: C 言語の tm 構造体とは異なり、month は 1 月に対
  # して 1 を返し、year は 1998 年に対して 1998 を返します。また、
  # yday は 1 から数えます。
  def to_a; end

  # --- to_date -> Date
  # 対応する [[c:Date]] オブジェクトを返します。
  def to_date; end

  # --- to_datetime -> DateTime
  # 対応する [[c:DateTime]] オブジェクトを返します。
  def to_datetime; end

  # --- to_f    -> Float
  # 
  # 起算時からの経過秒数を浮動小数点数で返します。1 秒に満たない経過も
  # 表現されます。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p t                  # => 2000-01-02 03:04:05 +0900
  # p "%10.6f" % t.to_f  # => "946749845.000006"
  # p t.to_i             # => 946749845
  # //}
  def to_f; end

  # --- to_i      -> Integer
  # --- tv_sec    -> Integer
  # 
  # 起算時からの経過秒数を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p t                  # => 2000-01-02 03:04:05 +0900
  # p "%10.6f" % t.to_f  # => "946749845.000006"
  # p t.to_i             # => 946749845
  # p t.tv_sec           # => 946749845
  # //}
  def to_i; end

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
  # Time.now.to_json # => "{\"json_class\":\"Time\",\"s\":1544968675,\"n\":676167000}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_r    -> Rational
  # 
  # 起算時からの経過秒数を有理数で返します。1 秒に満たない経過も
  # 表現されます。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p t          # => 2000-01-02 03:04:05 +0900
  # p t.to_r     # => (473374922500003/500000)
  # //}
  def to_r; end

  # --- to_s     -> String
  # 
  # 時刻を文字列に変換した結果を返します。
  # 以下のようにフォーマット文字列を使って strftime を呼び出すのと同じです。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p t.to_s                               # => "2000-01-02 03:04:05 +0900"
  # p t.strftime("%Y-%m-%d %H:%M:%S %z")   # => "2000-01-02 03:04:05 +0900"
  # 
  # p t.utc.to_s                           # => "2000-01-01 18:04:05 UTC"
  # p t.strftime("%Y-%m-%d %H:%M:%S UTC")  # => "2000-01-01 18:04:05 UTC"
  # //}
  # 
  # 戻り値の文字エンコーディングは [[m:Encoding::US_ASCII]] です。
  def to_s; end

  # --- to_time -> Time
  # 対応する [[c:Time]] オブジェクトを返します。
  def to_time; end

  # --- tuesday? -> bool
  # 
  # self の表す時刻が火曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(1991, 2, 19)      # => 1991-02-19 00:00:00 +0900
  # p t.tuesday?                     # => true
  # //}
  def tuesday?; end

  # --- usec         -> Integer
  # --- tv_usec      -> Integer
  # 
  # 時刻のマイクロ秒の部分を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5,6)
  # p "%10.6f" % t.to_f   #=> "946749845.000006"
  # p t.usec              #=> 6
  # //}
  def tv_usec; end

  # --- wday    -> Integer
  # 
  # 曜日を0(日曜日)から6(土曜日)の整数で返します。
  # 
  # //emlist[][ruby]{
  # p sun = Time.new(2017, 9, 17, 10, 34, 15, '+09:00') # => 2017-09-17 10:34:15 +0900
  # p sun.wday                                          # => 0
  # p mon = Time.new(2017, 9, 18, 10, 34, 15, '+09:00') # => 2017-09-18 10:34:15 +0900
  # p mon.wday                                          # => 1
  # p tue = Time.new(2017, 9, 19, 10, 34, 15, '+09:00') # => 2017-09-19 10:34:15 +0900
  # p tue.wday                                          # => 2
  # p wed = Time.new(2017, 9, 20, 10, 34, 15, '+09:00') # => 2017-09-20 10:34:15 +0900
  # p wed.wday                                          # => 3
  # p thu = Time.new(2017, 9, 21, 10, 34, 15, '+09:00') # => 2017-09-21 10:34:15 +0900
  # p thu.wday                                          # => 4
  # p fri = Time.new(2017, 9, 22, 10, 34, 15, '+09:00') # => 2017-09-22 10:34:15 +0900
  # p fri.wday                                          # => 5
  # p sat = Time.new(2017, 9, 23, 10, 34, 15, '+09:00') # => 2017-09-23 10:34:15 +0900
  # p sat.wday                                          # => 6
  # //}
  def wday; end

  # --- wednesday? -> bool
  # 
  # self の表す時刻が水曜日である場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(1993, 2, 24)      # => 1993-02-24 00:00:00 +0900
  # p t.wednesday?                   # => true
  # //}
  def wednesday?; end

  # --- yday    -> Integer
  # 
  # 1月1日を1とした通算日(1から366まで)を整数で返します。
  # 
  # //emlist[][ruby]{
  # p Time.mktime(2000,  1,  1).yday # => 1
  # //}
  # 
  # うるう年の場合は、2月29日も含めた通算日を返します。
  # 
  # //emlist[うるう年でない場合][ruby]{
  # p Time.mktime(2003,  1,  1).yday # => 1
  # p Time.mktime(2003,  3,  1).yday # => 60
  # p Time.mktime(2003, 12, 31).yday # => 365
  # //}
  # 
  # //emlist[うるう年の場合][ruby]{
  # p Time.mktime(2004,  1,  1).yday # => 1
  # p Time.mktime(2004,  2, 29).yday # => 60
  # p Time.mktime(2004, 12, 31).yday # => 366
  # //}
  def yday; end

  # --- year    -> Integer
  # 
  # 年を整数で返します。
  # 
  # //emlist[][ruby]{
  # t = Time.local(2000,1,2,3,4,5)  # => 2000-01-02 03:04:05 +0900
  # p t.year                        # => 2000
  # //}
  def year; end

  # --- zone    -> String
  # 
  # タイムゾーンを表す文字列を返します。
  # 
  # //emlist[][ruby]{
  # p Time.now.zone # => "JST"
  # //}
  def zone; end

  # --- at(time)         -> Time
  # --- at(time, in:)    -> Time
  # 
  # time で指定した時刻の Time オブジェクトを返します。
  # 
  # キーワード引数 in でタイムゾーンを指定できます。タイムゾーンの指定がなく
  # 引数が数値の場合、生成された Time オブジェクトのタイムゾーンは地方時となります。
  # 
  # @param time Time オブジェクト、もしくは起算時からの経過秒数を表わす数値で指定します。
  # @param in "+HH:MM" や "-HH:MM" のような形式の文字列か
  #           "UTC" かミリタリータイムゾーンの文字列または
  #           数値でタイムゾーンを指定します。
  # 
  # //emlist[][ruby]{
  # Time.at(0)                                # => 1970-01-01 09:00:00 +0900
  # Time.at(Time.at(0))                       # => 1970-01-01 09:00:00 +0900
  # Time.at(Time.at(0).getutc)                # => 1970-01-01 00:00:00 UTC
  # Time.at(946702800)                        # => 2000-01-01 14:00:00 +0900
  # Time.at(-284061600)                       # => 1960-12-31 15:00:00 +0900
  # Time.at(946684800.2).usec                 # => 200000
  # Time.at(1582721899, in: "+09:00")         # => 2020-02-26 21:58:19 +0900
  # Time.at(1582721899, in: 9*60*60)          # => 2020-02-26 21:58:19 +0900
  # Time.at(1582721899, in: "UTC")            # => 2020-02-26 12:58:19 UTC
  # Time.at(1582721899, in: "C")              # => 2020-02-26 13:58:19 +0300
  # //}
  # 
  # --- at(time, usec)         -> Time
  # --- at(time, usec, in:)    -> Time
  # 
  # time + (usec/1000000) の時刻を表す Time オブジェクトを返します。
  # 浮動小数点の精度では不十分な場合に使用します。
  # 
  # キーワード引数 in でタイムゾーンを指定できます。タイムゾーンの指定がない場合、
  # 生成された Time オブジェクトのタイムゾーンは地方時となります。
  # 
  # @param time 起算時からの経過秒数を表わす値を[[c:Integer]]、 [[c:Float]]、 [[c:Rational]]、または他の[[c:Numeric]]で指定します。
  # 
  # @param usec マイクロ秒を[[c:Integer]]、 [[c:Float]]、 [[c:Rational]]、または他の[[c:Numeric]]で指定します。
  # 
  # @param in "+HH:MM" や "-HH:MM" のような形式の文字列か
  #           "UTC" かミリタリータイムゾーンの文字列または
  #           数値でタイムゾーンを指定します。
  # 
  # //emlist[][ruby]{
  # Time.at(946684800, 123456.789).nsec  # => 123456789
  # //}
  # 
  # --- at(seconds, xseconds, unit)      -> Time
  # --- at(seconds, xseconds, unit, in:) -> Time
  # 
  # unit に応じて seconds + xseconds ミリ秒などの時刻を表す Time オブジェクトを返します。
  # 
  # @param seconds 起算時からの経過秒数を表わす値を[[c:Integer]]、 [[c:Float]]、 [[c:Rational]]、または他の[[c:Numeric]]で指定します。
  # @param xseconds unit に対応するミリ秒かマイクロ秒かナノ秒を指定します。
  # @param unit :millisecond, :usec, :microsecond, :nsec, :nanosecond のいずれかを指定します。
  # @param in "+HH:MM" や "-HH:MM" のような形式の文字列か
  #           "UTC" かミリタリータイムゾーンの文字列または
  #           数値でタイムゾーンを指定します。
  # 
  # //emlist[][ruby]{
  # Time.at(946684800, 123.456789, :millisecond).nsec  # => 123456789
  # Time.at(946684800, 123456.789, :usec).nsec         # => 123456789
  # Time.at(946684800, 123456.789, :microsecond).nsec  # => 123456789
  # Time.at(946684800, 123456789, :nsec).nsec          # => 123456789
  # //}
  def at; end

  # --- gm(year, mon = 1, day = 1, hour = 0, min = 0, sec = 0, usec = 0)             -> Time
  # --- utc(year, mon = 1, day = 1, hour = 0, min = 0, sec = 0, usec = 0)            -> Time
  # 
  # 引数で指定した協定世界時の Time オブジェクトを返します。
  # 
  # 第2引数以降に nil を指定した場合の値はその引数がとり得る最小の値です。
  # 
  # @param year 年を整数か文字列で指定します。例えば 1998 年に対して 1998 を指定します。
  # 
  # @param mon 1(1月)から 12(12月)の範囲の整数または文字列で指定します。
  #            英語の月名("Jan", "Feb", ... などの省略名。文字の大小は無視)も指定できます。
  # 
  # @param  day 日を 1 から 31 までの整数か文字列で指定します。
  # 
  # @param  hour 時を 0 から 23 までの整数か文字列で指定します。
  # 
  # @param  min 分を 0 から 59 までの整数か文字列で指定します。
  # 
  # @param  sec 秒を 0 から 60 までの整数か文字列で指定します。(60はうるう秒)
  # 
  # @param  usec マイクロ秒を整数か文字列で指定します。
  # 
  # @raise ArgumentError 与えられた引数の範囲が valid でない場合に発生します。
  # 
  # //emlist[][ruby]{
  # p Time.gm(2000, 1, 1)  # => 2000-01-01 00:00:00 UTC
  # //}
  # 
  # --- gm(sec, min, hour, mday, mon, year, wday, yday, isdst, zone)     -> Time
  # --- utc(sec, min, hour, mday, mon, year, wday, yday, isdst, zone)    -> Time
  # 
  # 引数で指定した協定世界時の Time オブジェクトを返します。
  # 
  # 引数の順序は [[m:Time#to_a]] と全く同じです。
  # 引数 wday, yday, zone に指定した値は無視されます。
  # 引数に nil を指定した場合の値はその引数がとり得る最小の値です。
  # 
  # @param  sec 秒を 0 から 60 までの整数か文字列で指定します。(60はうるう秒)
  # 
  # @param  min 分を 0 から 59 までの整数か文字列で指定します。
  # 
  # @param  hour 時を 0 から 23 までの整数か文字列で指定します。
  # 
  # @param  mday 日を 1 から 31 までの整数か文字列で指定します。
  # 
  # @param mon 1(1月)から 12(12月)の範囲の整数か文字列で指定します。
  #            英語の月名("Jan", "Feb", ... などの省略名。文字の大小は無視)も指定できます。
  # 
  # @param year 年を整数か文字列で指定します。例えば 1998 年に対して 1998 を指定します。
  # 
  # @param wday 無視されます。
  # 
  # @param yday 無視されます。
  # 
  # @param isdst 指定した日時が夏時間(Daylight Saving Time)なら true を指定します。
  #              そうでないなら、false を指定します。
  # 
  # @param zone 無視されます。
  # 
  # @raise ArgumentError 与えられた引数の範囲が valid でない場合に発生します。
  def gm; end

  # --- httpdate(date) -> Time
  # 
  # [[RFC:2616]]で定義されているHTTP-dateとしてdateをパースして
  # [[c:Time]]オブジェクトに変換します。
  # 
  # dateが[[RFC:2616]]に準拠していない、または
  # [[c:Time]]クラスが指定された日時を表現できないときに[[c:ArgumentError]]が
  # 発生します。
  # 
  # @param date [[RFC:2616]]で定義されているHTTP-dateとしてパースされる文字列を指定します。
  # 
  # @raise ArgumentError dateが[[RFC:2616]]に準拠していない、または [[c:Time]]クラスが指定された日時を表現できないときに発生します。
  # 
  #   require 'time'
  #   rfc2616_time = 'Sun, 31 Aug 2008 12:34:56 GMT'
  # 
  #   t = Time.httpdate(rfc2616_time)
  #   p t.kind_of?(Time) #=> true
  # 
  #   non_rfc2616_time = 'San, 31 Aug 2008 12:34:56 GMT'
  #   begin
  #     Time.httpdate(non_rfc2616_time)
  #   rescue ArgumentError => err
  #     puts err #=>  not RFC 2616 compliant date: "San, 31 Aug 2008 12:34:56 GMT"
  #   end
  def httpdate; end

  # --- xmlschema(date) -> Time
  # --- iso8601(date) -> Time
  # 
  # XML Schema で定義されている dateTime として
  # date をパースして [[c:Time]] オブジェクトに変換します。
  # 
  # date がISO 8601で定義されている形式に準拠していない、
  # または [[c:Time]] クラスが指定された日時を表現できないときに
  # [[c:ArgumentError]] が発生します。
  # 
  # [[c:Time]] オブジェクトを ISO8601 形式の文字列にフォーマットする
  # インスタンスメソッド [[m:Time#iso8601]], [[m:Time#xmlschema]] もあります。
  # 
  # @param date XML Schema で定義されている dateTime として
  #             パースされる文字列を指定します。
  # 
  # @raise ArgumentError date がISO 8601で定義されている形式に準拠していない、
  #                      または [[c:Time]] クラスが指定された日時を表現できないとき
  #                      に発生します。
  # 使用例
  #   require 'time'
  # 
  #   iso8601_time = '2008-08-31T12:34:56+09:00'
  #   t = Time.iso8601(iso8601_time)
  #   p t #=> 2008-08-31 12:34:56 +0900
  #   p t.kind_of?(Time) #=> true
  # 
  #   begin
  #     non_iso8601_time = '2008-08-31A12:34:56+09:00'
  #     Time.iso8601(non_iso8601_time)
  #   rescue ArgumentError => err
  #     puts err #=> invalid date: "2008-08-31A12:34:56+09:00"
  #   end
  # 
  # @see [[m:Time#xmlschema]], [[m:Time#iso8601]]
  def iso8601; end

  # --- json_create(hash) -> Time
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- local(year, mon = 1, day = 1, hour = 0, min = 0, sec = 0, usec = 0)      -> Time
  # --- mktime(year, mon = 1, day = 1, hour = 0, min = 0, sec = 0, usec = 0)     -> Time
  # 
  # 引数で指定した地方時の Time オブジェクトを返します。
  # 
  # 第2引数以降に nil を指定した場合の値はその引数がとり得る最小の値です。
  # 
  # @param year 年を整数か文字列で指定します。例えば 1998 年に対して 1998 を指定します。
  # 
  # @param mon 1(1月)から 12(12月)の範囲の整数または文字列で指定します。
  #            英語の月名("Jan", "Feb", ... などの省略名。文字の大小は無視)も指定できます。
  # 
  # @param  day 日を 1 から 31 までの整数か文字列で指定します。
  # 
  # @param  hour 時を 0 から 23 までの整数か文字列で指定します。
  # 
  # @param  min 分を 0 から 59 までの整数か文字列で指定します。
  # 
  # @param  sec 秒を 0 から 60 までの整数か文字列で指定します。(60はうるう秒)
  # 
  # @param  usec マイクロ秒を整数か文字列で指定します。
  # 
  # @raise ArgumentError 与えられた引数の範囲が valid でない場合に発生します。
  # 
  # //emlist[][ruby]{
  # p Time.local(2000, 1, 1) # => 2000-01-01 00:00:00 +0900
  # //}
  # 
  # --- local(sec, min, hour, mday, mon, year, wday, yday, isdst, zone)     -> Time
  # --- mktime(sec, min, hour, mday, mon, year, wday, yday, isdst, zone)    -> Time
  # 
  # 引数で指定した地方時の Time オブジェクトを返します。
  # 
  # 引数の順序は [[m:Time#to_a]] と全く同じです。
  # 引数 wday, yday, zone に指定した値は無視されます。
  # 引数に nil を指定した場合の値はその引数がとり得る最小の値です。
  # 
  # @param  sec 秒を 0 から 60 までの整数か文字列で指定します。(60はうるう秒)
  # 
  # @param  min 分を 0 から 59 までの整数か文字列で指定します。
  # 
  # @param  hour 時を 0 から 23 までの整数か文字列で指定します。
  # 
  # @param  mday 日を 1 から 31 までの整数か文字列で指定します。
  # 
  # @param mon 1(1月)から 12(12月)の範囲の整数か文字列で指定します。
  #            英語の月名("Jan", "Feb", ... などの省略名。文字の大小は無視)も指定できます。
  # 
  # @param year 年を整数か文字列で指定します。例えば 1998 年に対して 1998 を指定します。
  # 
  # @param wday 無視されます。
  # 
  # @param yday 無視されます。
  # 
  # @param isdst 指定した日時が夏時間(Daylight Saving Time)なら true を指定します。
  #              そうでないなら、false を指定します。
  # 
  # @param zone 無視されます。
  # 
  # @raise ArgumentError 与えられた引数の範囲が valid でない場合に発生します。
  def local; end

  # --- new    -> Time
  # --- now    -> Time
  # 
  # 現在時刻の Time オブジェクトを生成して返します。
  # タイムゾーンは地方時となります。
  # 
  # //emlist[][ruby]{
  # p Time.now # => 2009-06-24 12:39:54 +0900
  # //}
  # 
  # --- new(year, mon = nil, day = nil, hour = nil, min = nil, sec = nil, zone = nil)    -> Time
  # --- new(year, mon = nil, day = nil, hour = nil, min = nil, sec = nil, in: nil)       -> Time
  # 
  # 引数で指定した地方時の Time オブジェクトを返します。
  # 
  # mon day hour min sec に nil を指定した場合の値は、その引数がとり得る最小の値です。
  # zone と in に nil を指定した場合の値は、現在のタイムゾーンに従います。
  # 
  # @param year 年を整数か文字列で指定します。例えば 1998 年に対して 1998 を指定します。
  # 
  # @param mon 1(1月)から 12(12月)の範囲の整数または文字列で指定します。
  #            英語の月名("Jan", "Feb", ... などの省略名。大文字小文字の違いは無視します)も指定できます。
  # 
  # @param day 日を 1 から 31 までの整数か文字列で指定します。
  # 
  # @param hour 時を 0 から 23 までの整数か文字列で指定します。
  # 
  # @param min 分を 0 から 59 までの整数か文字列で指定します。
  # 
  # @param sec 秒を 0 から 60 までの整数か文字列で指定します。(60はうるう秒)
  # 
  # @param zone 協定世界時との時差を、秒を単位とする整数か、
  #             "UTC" かミリタリータイムゾーンの文字列または
  #             "+HH:MM" "-HH:MM" 形式の文字列で指定します。
  # @param in 協定世界時との時差を、秒を単位とする整数か、
  #           "UTC" かミリタリータイムゾーンの文字列または
  #           "+HH:MM" "-HH:MM" 形式の文字列で指定します。
  # 
  # @raise ArgumentError 与えられた引数が無効である場合に発生します。
  # @raise ArgumentError zone と in を同時に指定した場合に発生します。
  # 
  # //emlist[][ruby]{
  # p Time.new(2008, 6, 21, 13, 30, 0, "+09:00") # => 2008-06-21 13:30:00 +0900
  # //}
  def new; end

  # --- parse(date, now = Time.now) -> Time
  # --- parse(date, now = Time.now) {|year| year } -> Time
  # 
  # 
  # date を [[m:Date._parse]] によって
  # パースして [[c:Time]]オブジェクトに変換します。
  # 
  # ブロック付きで呼ばれた場合、dateの年はブロックによって変換されます。
  # 
  #   require 'time'
  #   Time.parse(...) {|y| y < 100 ? (y >= 69 ? y + 1900 : y + 2000) : y}
  # 
  # 与えられた時刻に上位の要素がなかったり壊れていた場合、nowの
  # 該当要素が使われます。
  # 
  #   require 'time'
  #   time = Time.local(2019, 5, 1)
  #   Time.parse("12:00", time)   #=> 2019-05-01 12:00:00 +0900
  # 
  # 下位の要素がなかったり壊れていた場合、最小値(1か0)が使われます。
  # 
  # @param date [[c:Time]] オブジェクトに変換可能な文字列を指定します。
  # @param now  現在時刻を[[c:Time]] オブジェクトで指定します。
  #             デフォルトは[[m:Time.now]]となります。
  # 
  # @raise ArgumentError dateに空文字列を与えた場合、発生します。
  #                      なお、1.9.2より前は例外は発生せず、現在時刻を表す
  #                      Time のインスタンスを返していました。
  # 
  #   require 'time'
  # 
  #   # 現在時刻が "Thu Nov 29 14:33:20 GMT 2001" で
  #   # タイムゾーンがGMTとすると:
  #   Time.parse("16:30")     #=> Thu Nov 29 16:30:00 GMT 2001
  #   Time.parse("7/23")      #=> Mon Jul 23 00:00:00 GMT 2001
  #   Time.parse("2002/1")    #=> Tue Jan 01 00:00:00 GMT 2002
  # 
  # [[m:Date._parse]]がdateから情報を取り出せないとき、
  # または [[c:Time]] クラスが指定された日時を表現できないときに
  # [[c:ArgumentError]] が発生します。
  # 
  # このメソッドは他のパース用メソッドのフェイルセーフとして
  # 以下のように使用できます:
  # 
  #   require 'time'
  # 
  #   Time.rfc2822(date) rescue Time.parse(date)
  #   Time.httpdate(date) rescue Time.parse(date)
  #   Time.xmlschema(date) rescue Time.parse(date)
  # 
  # 従って [[m:Time.parse]] の失敗はチェックすべきです。
  def parse; end

  # --- rfc2822(date) -> Time
  # --- rfc822(date) -> Time
  # 
  # [[RFC:2822]]で定義されているdate-timeとしてdateをパースして
  # [[c:Time]]オブジェクトに変換します。
  # この形式は[[RFC:822]]で定義されて[[RFC:1123]]で更新された形式と
  # 同じです。
  # 
  # dateが[[RFC:2822]]に準拠していない、または
  # [[c:Time]]クラスが指定された日時を表現できないときに[[c:ArgumentError]]が
  # 発生します。
  # 
  # @param date [[RFC:2822]] で定義されるdate-time として文字列を指定します。
  # 
  # @raise ArgumentError dateが[[RFC:2822]]に準拠していない、または 
  #                      [[c:Time]]クラスが指定された日時を表現できないときに
  #                      発生します。
  # 
  # 使用例
  #   require 'time'
  # 
  #   rfc2822_time = 'Sun, 31 Aug 2008 12:08:19 +0900'
  #   t = Time.rfc2822(rfc2822_time)
  #   p t.kind_of?(Time) #=> true
  #   non_rfc2822_time = 'Sun 31 Aug 2008 12:08:19 +0900'
  # 
  #   begin
  #     p Time.rfc2822(non_rfc2822_time)
  #   rescue ArgumentError => err
  #     puts "format err: #{err}"
  #   end
  def rfc2822; end

  # --- strptime(date, format, now=self.now) -> Time
  # --- strptime(date, format, now=self.now){|y| ... } -> Time
  # 文字列を [[m:Date._strptime]] を用いて [[c:Time]] オブジェクト
  # に変換します。
  # 
  #   require 'time'
  #   Time.strptime('2001-02-03T04:05:06+09:00', '%Y-%m-%dT%H:%M:%S%z')
  #   #=> 2001-02-03 06:05:06 +0900
  # 
  # ブロックを渡すと年の部分をブロックによって変換できます。
  #   require 'time'
  #   Time.strptime('91/5/18 4:13:00', '%Y/%m/%d %T'){|y| 
  #     if y > 100 then y
  #     elsif y >= 69 then y + 1900
  #     else y + 2000
  #     end
  #   }
  #   #=> 1991-05-18 04:13:00 +0900
  #   
  #   Time.strptime('01/5/18 4:13:00', '%Y/%m/%d %T'){|y| 
  #     if y > 100 then y
  #     elsif y >= 69 then y + 1900
  #     else y + 2000
  #     end
  #   }
  #   #=>  2001-05-18 04:13:00 +0900
  # 
  # 詳しくは [[m:DateTime.strptime]], [[m:Date.strptime]] を見てください。
  # 
  # @param date 時刻を表す文字列
  # @param format 書式文字列
  def strptime; end

end
