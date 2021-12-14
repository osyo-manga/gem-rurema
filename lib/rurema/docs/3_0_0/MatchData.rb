class MatchData
  # --- eql?(other) -> bool
  # --- ==(other)   -> bool
  # 
  # self と other のマッチ対象になった文字列、元になった正規表現オブジェク
  # ト、マッチした位置が等しければ true を返します。そうでない場合には
  # false を返します。
  # 
  # @param other 比較対象のオブジェクトを指定します。
  # 
  # //emlist[文字列][ruby]{
  # s = "abc"
  # m1 = s.match("a")
  # m2 = s.match("b")
  # m1 == m2  # => false
  # m2 = s.match("a")
  # m1 == m2  # => true
  # //}
  # 
  # //emlist[正規表現][ruby]{
  # r = /abc/
  # m1 = r.match("abc")   # => #<MatchData "abc">
  # m2 = r.match("abcde") # => #<MatchData "abc">
  # m1 == m2  # => false
  # m2 = r.match("abc")   # => #<MatchData "abc">
  # m1 == m2  # => true
  # //}
  # 
  # //emlist[正規表現のマッチした位置][ruby]{
  # r = /abc/
  # m1 = r.match("abcabc")    # => #<MatchData "abc">
  # m2 = r.match("abcabc", 3) # => #<MatchData "abc">
  # m1 == m2  # => false
  # m2 = r.match("abcabc", 0) # => #<MatchData "abc">
  # m1 == m2  # => true
  # //}
  def ==; end

  # --- [](n) -> String | nil
  # 
  # n 番目の部分文字列を返します。
  # 
  # 0 はマッチ全体を意味します。
  # n の値が負の時には末尾からのインデックスと見倣します(末尾の
  # 要素が -1 番目)。n 番目の要素が存在しない時には nil を返します。
  # 
  # @param n 返す部分文字列のインデックスを指定します。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.to_a       # => ["foobar", "foo", "bar", nil]
  # p $~[0]         # => "foobar"
  # p $~[1]         # => "foo"
  # p $~[2]         # => "bar"
  # p $~[3]         # => nil        (マッチしていない)
  # p $~[4]         # => nil        (範囲外)
  # p $~[-2]        # => "bar"
  # //}
  # 
  # --- [](range) -> [String]
  # 
  # [[c:Range]] オブジェクト range の範囲にある要素からなる部分配列を返します。
  # 
  # @param range start..end 範囲式。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)/ =~ "foobarbaz"
  # p $~[0..2]      # => ["foobar", "foo", "bar"]
  # //}
  # 
  # --- [](start, length) -> [String]
  # 
  # start 番目から length 個の要素を含む部分配列を返します。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)/ =~ "foobarbaz"
  # p $~[0, 3]      # => ["foobar", "foo", "bar"]
  # //}
  # 
  # @see [[m:Array#[] ]]
  # 
  # --- [](name) -> String | nil
  # 
  # name という名前付きグループにマッチした文字列を返します。
  # 
  # @param name 名前(シンボルか文字列)
  # @raise IndexError 指定した名前が正規表現内に含まれていない場合に発生します
  # 
  # //emlist[例][ruby]{
  # /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:cents] # => "67"
  # /(?<alpha>[a-zA-Z]+)|(?<num>\d+)/.match("aZq")[:num] # => nil
  # //}
  def []; end

  # --- begin(n) -> Integer | nil
  # 
  # n 番目の部分文字列先頭のオフセットを返します。
  # 
  # 0 はマッチ全体を意味します。
  # n 番目の部分文字列がマッチしていなければ nilを返します。
  # 
  # @param n 部分文字列を指定する数値。
  # 
  # @raise IndexError 範囲外の n を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.begin(0)   # => 0
  # p $~.begin(1)   # => 0
  # p $~.begin(2)   # => 3
  # p $~.begin(3)   # => nil
  # p $~.begin(4)   # => `begin': index 4 out of matches (IndexError)
  # //}
  # 
  # @see [[m:MatchData#end]]
  def begin; end

  # --- captures -> [String]
  # 
  # [[m:$1]], [[m:$2]], ... を格納した配列を返します。
  # 
  # [[m:MatchData#to_a]] と異なり [[m:$&]] を要素に含みません。
  # グループにマッチした部分文字列がなければ対応する要素は nil になります。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.to_a       # => ["foobar", "foo", "bar", nil]
  # p $~.captures   # => ["foo", "bar", nil]
  # //}
  # 
  # @see [[m:MatchData#to_a]], [[m:MatchData#named_captures]]
  def captures; end

  # --- end(n) -> Integer | nil
  # 
  # n 番目の部分文字列終端のオフセットを返します。
  # 
  # 0 はマッチ全体を意味します。
  # n 番目の部分文字列がマッチしていなければ nil を返します。
  # 
  # @param n 部分文字列を指定する数値。
  # 
  # @raise IndexError 範囲外の n を指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.end(0)   # => 6
  # p $~.end(1)   # => 3
  # p $~.end(2)   # => 6
  # p $~.end(3)   # => nil
  # p $~.end(4)   # => `end': index 4 out of matches (IndexError)
  # //}
  # 
  # @see [[m:MatchData#begin]]
  def end; end

  # --- hash -> Integer
  # 
  # self のマッチ対象になった文字列、元になった正規表現オブジェクト、マッチ
  # した位置を元にハッシュ値を計算して返します。
  def hash; end

  # --- inspect -> String
  # 
  # self の内容を人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # puts /.$/.match("foo").inspect
  # # => #<MatchData "o">
  # 
  # puts /(.)(.)(.)/.match("foo").inspect
  # # => #<MatchData "foo" 1:"f" 2:"o" 3:"o">
  # 
  # puts /(.)(.)?(.)/.match("fo").inspect
  # # => #<MatchData "fo" 1:"f" 2:nil 3:"o">
  # 
  # puts /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge").inspect
  # # => #<MatchData "hog" foo:"h" bar:"o" baz:"g">
  # //}
  def inspect; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # 部分文字列の数を返します(self.to_a.size と同じです)。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.size       # => 4
  # //}
  def length; end

  # --- named_captures -> Hash
  # 
  # 名前付きキャプチャをHashで返します。
  # 
  # Hashのキーは名前付きキャプチャの名前です。Hashの値はキーの名前に対応した名前付きグループのうち最後にマッチした文字列です。
  # 
  # //emlist[例][ruby]{
  # m = /(?<a>.)(?<b>.)/.match("01")
  # m.named_captures # => {"a" => "0", "b" => "1"}
  # 
  # m = /(?<a>.)(?<b>.)?/.match("0")
  # m.named_captures # => {"a" => "0", "b" => nil}
  # 
  # m = /(?<a>.)(?<a>.)/.match("01")
  # m.named_captures # => {"a" => "1"}
  # 
  # m = /(?<a>x)|(?<a>y)/.match("x")
  # m.named_captures # => {"a" => "x"}
  # //}
  # 
  # @see [[m:MatchData#captures]]
  def named_captures; end

  # --- names -> [String]
  # 
  # 名前付きキャプチャの名前を文字列配列で返します。
  # 
  # self.regexp.names と同じです。
  # 
  # //emlist[例][ruby]{
  # /(?<foo>.)(?<bar>.)(?<baz>.)/.match("hoge").names
  # # => ["foo", "bar", "baz"]
  # 
  # m = /(?<x>.)(?<y>.)?/.match("a") # => #<MatchData "a" x:"a" y:nil>
  # m.names                          # => ["x", "y"]
  # //}
  def names; end

  # --- offset(n) -> [Integer]
  # 
  # n 番目の部分文字列のオフセットの配列 [start, end] を返
  # します。
  # 
  # //emlist[例][ruby]{
  # [ self.begin(n), self.end(n) ]
  # //}
  # 
  # と同じです。n番目の部分文字列がマッチしていなければ
  # [nil, nil] を返します。
  # 
  # @param n 部分文字列を指定する数値
  # 
  # @raise IndexError 範囲外の n を指定した場合に発生します。
  # 
  # @see [[m:MatchData#begin]], [[m:MatchData#end]]
  def offset; end

  # --- post_match -> String
  # 
  # マッチした部分より後ろの文字列を返します([[m:$']]と同じ)。
  # 
  # //emlist[例][ruby]{
  # /(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.post_match # => "baz"
  # //}
  # 
  # @see [[m:MatchData#pre_match]]
  def post_match; end

  # --- pre_match -> String
  # 
  # マッチした部分より前の文字列を返します([[m:$`]]と同じ)。
  # 
  # //emlist[例][ruby]{
  # /(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.pre_match  # => "foo"
  # //}
  # 
  # @see [[m:MatchData#post_match]]
  def pre_match; end

  # --- regexp -> Regexp
  # 自身の元になった正規表現オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # m = /a.*b/.match("abc")
  # m.regexp # => /a.*b/
  # //}
  def regexp; end

  # --- string -> String
  # 
  # マッチ対象になった文字列の複製を返します。
  # 
  # 返す文字列はフリーズ([[m:Object#freeze]])されています。
  # 
  # //emlist[例][ruby]{
  # m = /(.)(.)(\d+)(\d)/.match("THX1138.")
  # m.string   # => "THX1138."
  # //}
  def string; end

  # --- to_a -> [String]
  # 
  # [[m:$&]], [[m:$1]], [[m:$2]],... を格納した配列を返します。
  # 
  # //emlist[例][ruby]{
  # /(foo)(bar)(BAZ)?/ =~ "foobarbaz"
  # p $~.to_a       # => ["foobar", "foo", "bar", nil]
  # //}
  # 
  # @see [[m:MatchData#captures]]
  def to_a; end

  # --- to_s -> String
  # 
  # マッチした文字列全体を返します。
  # 
  # //emlist[例][ruby]{
  # /bar/ =~ "foobarbaz"
  # p $~            # => #<MatchData:0x401b1be4>
  # p $~.to_s       # => "bar"
  # //}
  def to_s; end

  # --- values_at(*index) -> [String]
  # 
  # 正規表現中の n 番目の括弧にマッチした部分文字列の配列を返します。
  # 
  # 0 番目は [[m:$&]] のようにマッチした文字列全体を表します。
  # 
  # @param index インデックスを整数またはシンボル(名前付きキャプチャの場合)で 0 個以上指定します。
  # 
  # //emlist[例][ruby]{
  # m = /(foo)(bar)(baz)/.match("foobarbaz")
  # # same as m.to_a.values_at(...)
  # p m.values_at(0, 1, 2, 3, 4)      # => ["foobarbaz", "foo", "bar", "baz", nil]
  # p m.values_at(-1, -2, -3, -4, -5) # => ["baz", "bar", "foo", nil, nil]
  # 
  # m = /(?<a>\d+) *(?<op>[+\-*\/]) *(?<b>\d+)/.match("1 + 2")
  # m.to_a                   # => ["1 + 2", "1", "+", "2"]
  # m.values_at(:a, :b, :op) # => ["1", "2", "+"]
  # //}
  # 
  # @see [[m:Array#values_at]], [[m:Array#[] ]]
  def values_at; end

end
