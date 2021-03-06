class DateTime
  # --- hour -> Integer
  # 時間を返します (0-23)。
  def hour; end

  # --- iso8601(n = 0) -> String
  # --- rfc3339(n = 0) -> String
  # --- xmlschema(n = 0) -> String
  # [[ISO:8601]] 書式の文字列を返します (XML Schema の dateTime 相当)。
  # 省略可能な引数により、印字する秒の小数点以下の桁数を与えることができます。
  # 
  # strftime('%FT%T%:z') と等価です。
  # 
  # @param n 小数点以下の桁数
  # 
  # 例:
  # 
  #   require 'date'
  #   DateTime.parse('2001-02-03T04:05:06.123456789+07:00').iso8601(9)
  #   #=> "2001-02-03T04:05:06.123456789+07:00"
  def iso8601; end

  # --- jisx0301(n = 0) -> String
  # [[JIS:X 0301]] 書式の文字列を返します。
  # 省略可能な引数により、印字する秒の小数点以下の桁数を与えることができます。
  # 
  # @param n 小数点以下の桁数
  # 
  # 例:
  # 
  #   require 'date'
  #   DateTime.parse('2001-02-03T04:05:06.123456789+07:00').jisx0301(9)
  #   #=> "H13.02.03T04:05:06.123456789+07:00"
  def jisx0301; end

  # --- min -> Integer
  # --- minute -> Integer
  # 分を返します (0-59)。
  def min; end

  # --- new_offset(offset = 0) -> DateTime
  # self を複製して、その時差を設定しなおします。
  # 引数を省略した場合は、零 (協定世界時) になります。
  # 
  # [[m:DateTime.new]] も参照してください。
  # 
  # @param offset 時差
  def new_offset; end

  # --- offset -> Rational
  # 時差を返します。
  def offset; end

  # --- sec -> Integer
  # --- second -> Integer
  # 秒を返します (0-59)。
  def sec; end

  # --- sec_fraction -> Rational
  # --- second_fraction -> Rational
  # 秒の小数点以下の部分を表す分数を返します。
  def sec_fraction; end

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
  # DateTime.now.to_json
  # # => "{\"json_class\":\"DateTime\",\"y\":2018,\"m\":12,\"d\":10,\"H\":1,\"M\":28,\"S\":57,\"of\":\"3/8\",\"sg\":2299161.0}"
  # //}
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- zone -> String
  # タイムゾーンを返します。
  # 
  # これは、正確には時差をあらわす文字列です。
  def zone; end

  # --- _strptime(str, format = '%FT%T%z') -> Hash
  # 
  # 与えられた雛型で日時表現を解析し、その情報に基づいてハッシュを生成します。
  # 
  # @param str 日時をあらわす文字列
  # @param format 書式
  # 
  # 例:
  # 
  #   require 'date'
  #   DateTime._strptime('2001-02-03T12:13:14Z')
  #   # => {:year=>2001, :mon=>2, :mday=>3, :hour=>12, :min=>13, :sec=>14, :zone=>"Z", :offset=>0}
  # 
  # [[m:DateTime.strptime]] の内部で使用されています。
  # 
  # @see [[m:Date._strptime]], [[m:DateTime.strptime]]
  def _strptime; end

  # --- civil(year = -4712, mon = 1, mday = 1, hour = 0, min = 0, sec = 0, offset = 0, start = Date::ITALY) -> DateTime
  # --- new(year = -4712, mon = 1, mday = 1, hour = 0, min = 0, sec = 0, offset = 0, start = Date::ITALY) -> DateTime
  # 暦日付に相当する日時オブジェクトを生成します。
  # 
  # 時差の単位は日です。
  # 1.8.6 以降では、"+0900" のような時差をあらわす文字列もつかえます。
  # 
  # @param year 年
  # @param mon 月
  # @param mday 日
  # @param hour 時
  # @param min 分
  # @param sec 秒
  # @param offset 時差
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時
  def civil; end

  # --- commercial(cwyear = -4712, cweek = 1, cwday = 1, hour = 0, min = 0, sec = 0, offset = 0, start = Date::ITALY) -> DateTime
  # 暦週日付に相当する日時オブジェクトを生成します。
  # 
  # [[m:DateTime.new]] も参照してください。
  # 
  # @param cwyear 年
  # @param cweek 週
  # @param cwday 週の日 (曜日)
  # @param hour 時
  # @param min 分
  # @param sec 秒
  # @param offset 時差
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時
  def commercial; end

  # --- httpdate(str = 'Mon, 01 Jan -4712 00:00:00 GMT', start = Date::ITALY) -> DateTime
  # [[RFC:2616]] で定められた書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._httpdate]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def httpdate; end

  # --- iso8601(str = '-4712-01-01T00:00:00+00:00', start = Date::ITALY) -> DateTime
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

  # --- jd(jd = 0, hour = 0, min = 0, sec = 0, offset = 0, start = Date::ITALY) -> DateTime
  # ユリウス日に相当する日時オブジェクトを生成します。
  # 
  # [[m:DateTime.new]] も参照してください。
  # 
  # @param jd ユリウス日
  # @param hour 時
  # @param min 分
  # @param sec 秒
  # @param offset 時差
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時
  def jd; end

  # --- jisx0301(str = '-4712-01-01T00:00:00+00:00', start = Date::ITALY) -> DateTime
  # いくつかの代表的な [[JIS:X 0301]] 書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._jisx0301]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def jisx0301; end

  # --- json_create(hash) -> DateTime
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- now(start = Date::ITALY) -> DateTime
  # 現在の時刻に相当する日時オブジェクトを生成します。
  # 
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def now; end

  # --- ordinal(year = -4712, yday = 1, hour = 0, min = 0, sec = 0, offset = 0, start = Date::ITALY) -> DateTime
  # 年日付に相当する日時オブジェクトを生成します。
  # 
  # [[m:DateTime.new]] も参照してください。
  # 
  # @param year 年
  # @param yday 年の日
  # @param hour 時
  # @param min 分
  # @param sec 秒
  # @param offset 時差
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時
  def ordinal; end

  # --- parse(str = '-4712-01-01T00:00:00+00:00', complete = true, start = Date::ITALY) -> DateTime
  # 与えられた日時表現を解析し、
  # その情報に基づいて DateTime オブジェクトを生成します。
  # 
  # 年が "00" から "99" の範囲であれば、
  # 年の下2桁表現であるとみなしこれを補います。
  # この振舞いを抑止したい場合は、ヒントとして、complete に false を与えます。
  # 
  # @param str 日時をあらわす文字列
  # @param complete 年を補完するか
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時になる組み合わせである場合に発生します。
  # 
  # 例:
  # 
  #   require 'date'
  #   DateTime.parse('2001-02-03T12:13:14Z').to_s
  #   # => "2001-02-03T12:13:14+00:00"
  # 
  # @see [[m:Date._parse]], [[m:Date.parse]]
  def parse; end

  # --- rfc2822(str = 'Mon, 1 Jan -4712 00:00:00 +0000', start = Date::ITALY) -> DateTime
  # --- rfc822(str = 'Mon, 1 Jan -4712 00:00:00 +0000', start = Date::ITALY) -> DateTime
  # [[RFC:2822]] で定められた書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._rfc2822]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def rfc2822; end

  # --- rfc3339(str = '-4712-01-01T00:00:00+00:00', start = Date::ITALY) -> DateTime
  # [[RFC:3339]] 書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._rfc3339]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def rfc3339; end

  # --- strptime(str = '-4712-01-01T00:00:00+00:00', format = '%FT%T%z', start = Date::ITALY) -> DateTime
  # 
  # 与えられた雛型で日時表現を解析し、
  # その情報に基づいて DateTime オブジェクトを生成します。
  # 
  # @param str 日時をあらわす文字列
  # @param format 書式
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  # @raise ArgumentError 正しくない日時になる組み合わせである場合に発生します。
  # 
  # 例:
  # 
  #   require 'date'
  #   DateTime.strptime('2001-02-03T12:13:14Z').to_s
  #   # => "2001-02-03T12:13:14+00:00"
  # 
  # @see [[m:Date.strptime]], [[m:DateTime._strptime]], [[man:strptime(3)]], [[m:Date#strftime]]
  def strptime; end

  # --- today(start = Date::ITALY) -> Date
  # このクラスでは利用できません。
  # 
  # [[m:DateTime.now]] を参照してください。
  # 
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def today; end

  # --- xmlschema(str = '-4712-01-01T00:00:00+00:00', start = Date::ITALY) -> DateTime
  # XML Schema による書式の日付を解析し、
  # その情報に基づいて日付オブジェクトを生成します。
  # 
  # [[m:Date._xmlschema]] も参照してください。
  # 
  # @param str 日付をあらわす文字列
  # @param start グレゴリオ暦をつかい始めた日をあらわすユリウス日
  def xmlschema; end

end
