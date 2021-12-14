class Regexp
  # --- ==(other) -> bool
  # --- eql?(other) -> bool
  # otherが同じパターン、オプション、文字コードの正規表現であったらtrueを返します。
  # 
  # @param other 正規表現を指定します。
  # 
  # //emlist[例][ruby]{
  # p /^eee$/   == /~eee$/x   # => false
  # p /^eee$/   == /~eee$/i   # => false
  # p /^eee$/e  == /~eee$/u   # => false
  # p /^eee$/ == Regexp.new("^eee$") # => true
  # p /^eee$/.eql?(/^eee$/)          # => true
  # //}
  def ==; end

  # --- ===(string) -> bool
  # 文字列 string との正規表現マッチを行います。
  # マッチした場合は真を返します。
  # 
  # string が文字列でもシンボルでもない場合には false を返します。
  # 
  # このメソッドは主にcase文での比較に用いられます。
  # 
  # @param string マッチ対象文字列
  # 
  # //emlist[例][ruby]{
  # a = "HELLO"
  # case a
  # when /\A[a-z]*\z/; puts "Lower case"
  # when /\A[A-Z]*\z/; puts "Upper case"
  # else;              puts "Mixed case"
  # end
  # # => Upper case
  # 
  # /\A[a-z]*\z/ === "HELLO" # => false
  # /\A[A-Z]*\z/ === "HELLO" # => true
  # //}
  # 
  # @see [[m:Enumerable#grep]], [[m:Object#===]]
  def ===; end

  # --- =~(string) -> Integer | nil
  # 
  # 文字列 string との正規表現マッチを行います。マッチした場合、
  # マッチした位置のインデックスを返します(先頭は0)。マッチしなかった
  # 場合、あるいは string が nil の場合には nil を返
  # します。
  # 
  # //emlist[例][ruby]{
  # p /foo/ =~ "foo"  # => 0
  # p /foo/ =~ "afoo" # => 1
  # p /foo/ =~ "bar"  # => nil
  # //}
  # 
  # 組み込み変数 [[m:$~]] もしくは [[m:Regexp.last_match]] にマッチに関する情報 [[c:MatchData]] が設定されます。
  # 
  # 文字列のかわりに[[c:Symbol]]をマッチさせることができます。
  # 
  # @param string マッチ対象文字列
  # 
  # @raise TypeError string が nil でも [[c:String]] オブジェクト
  #                  でも [[c:Symbol]] でもない場合発生します。
  # 
  # //emlist[例][ruby]{
  # p /foo/ =~ "foo"        # => 0
  # p Regexp.last_match(0)  # => "foo"
  # p /foo/ =~ "afoo"       # => 1
  # p $~[0]                 # => "foo"
  # p /foo/ =~ "bar"        # => nil
  # 
  # unless /foo/ === "bar"
  #   puts "not match " # => not match
  # end
  # 
  # str = []
  # begin
  #   /ugo/ =~ str
  # rescue TypeError
  #   printf "! %s\t%s\n", $!, $@ # => ! can't convert Array into String       r5.rb:15
  # end
  # //}
  def =~; end

  # --- casefold? -> bool
  # 
  # 正規表現が大文字小文字の判定をしないようにコンパイルされている時、
  # 真を返します。
  # 
  # //emlist[例][ruby]{
  # reg = Regexp.new("foobar", Regexp::IGNORECASE)
  # p reg.casefold? # => true
  # 
  # reg = Regexp.new("hogehoge")
  # p reg.casefold? # => false
  # //}
  def casefold?; end

  # --- encoding   -> Encoding
  # 正規表現オブジェクトのエンコーディングを表す [[c:Encoding]] オブジェクト
  # を返します。
  # 
  # 
  # @see [[ref:d:spec/regexp#encoding]]
  def encoding; end

  # --- fixed_encoding? -> bool
  # 
  # 正規表現が任意の ASCII 互換エンコーディングとマッチ可能な時に false を返します。
  # 
  # //emlist[例][ruby]{
  # # -*- coding:utf-8 -*-
  # 
  # r = /a/
  # r.fixed_encoding?                               # => false
  # r.encoding                                      # => #<Encoding:US-ASCII>
  # r =~ "\u{6666} a"                               # => 2
  # r =~ "\xa1\xa2 a".force_encoding("euc-jp")      # => 2
  # r =~ "abc".force_encoding("euc-jp")             # => 0
  # 
  # r = /a/u
  # r.fixed_encoding?                               # => true
  # r.encoding                                      # => #<Encoding:UTF-8>
  # r =~ "\u{6666} a"                               # => 2
  # begin
  #   r =~ "\xa1\xa2".force_encoding("euc-jp")
  # rescue => e
  #   e.class                                       # => Encoding::CompatibilityError
  # end
  # r =~ "abc".force_encoding("euc-jp")             # => 0
  # 
  # r = /\u{6666}/
  # r.fixed_encoding?                               # => true
  # r.encoding                                      # => #<Encoding:UTF-8>
  # r =~ "\u{6666} a"                               # => 0
  # begin
  #   r =~ "\xa1\xa2".force_encoding("euc-jp")
  # rescue => e
  #   e.class                                       # => Encoding::CompatibilityError
  # end
  # r =~ "abc".force_encoding("euc-jp")             # => nil
  # //}
  def fixed_encoding?; end

  # --- hash -> Integer
  # 正規表現のオプションやテキストに基づいたハッシュ値を返します。
  # 
  # //emlist[例][ruby]{
  # p /abc/i.hash # => 4893115
  # p /abc/.hash  # => 4856055
  # //}
  def hash; end

  # --- inspect -> String
  # [[m:Regexp#to_s]] より自然な文字列を返します。
  # 
  # //emlist[例][ruby]{
  # p /^ugou.*?/i.to_s    # => "(?i-mx:^ugou.*?)"
  # p /^ugou.*?/i.inspect # => "/^ugou.*?/i"
  # //}
  # 
  # @see [[m:Regexp#to_s]]
  def inspect; end

  # --- match(str, pos = 0) -> MatchData | nil
  # --- match(str, pos = 0) {|m| ... } -> object | nil
  # 
  # 指定された文字列 str に対して位置 pos から自身が表す正規表現によるマッ
  # チングを行います。マッチした場合には結果を MatchData オブジェクトで返し
  # ます。
  # マッチしなかった場合 nil を返します。
  # 
  # 省略可能な第二引数 pos を指定すると、マッチの開始位置を pos から行
  # うよう制御できます(pos のデフォルト値は 0)。
  # 
  # //emlist[例][ruby]{
  # p(/(.).(.)/.match("foobar", 3).captures)   # => ["b", "r"]
  # p(/(.).(.)/.match("foobar", -3).captures)  # => ["b", "r"]
  # //}
  # 
  # pos を指定しても [[m:MatchData#offset]] 等の結果
  # には影響しません。つまり、
  # //emlist[][ruby]{
  # re.match(str[pos..-1])
  # //}
  # と
  # //emlist[][ruby]{
  # re.match(str, pos)
  # //}
  # は異なります。
  # 
  # 
  # ブロックを渡すと、マッチした場合に限り MatchData オブジェクトがブロック引数に渡されて実行されます。
  # マッチした場合はブロックの値を返し、マッチしなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # results = []
  # /((.)\2)/.match("foo") {|m| results << m[0] } # => ["oo"] 
  # /((.)\2)/.match("bar") {|m| results << m[0] } # => nil
  # results # => ["oo"]
  # //}
  # 
  # @param str 文字列を指定します。str との正規表現マッチを行います。
  # 
  # @param pos 整数を指定します。マッチの開始位置を pos から行うよう制御できます(pos のデフォルト値は 0)。
  # 
  # //emlist[例][ruby]{
  # reg = Regexp.new("foo")
  # 
  # if reg.match("foobar")
  #   puts "match"
  # end
  # # => match
  # 
  # p reg.match("foobar") # => #<MatchData:0x29403fc>
  # p reg.match("bar")    # => nil
  # 
  # p /(foo)(bar)(baz)/.match("foobarbaz").to_a.values_at(1,2,3) # => ["foo", "bar", "baz"]
  # //}
  # 
  # === 便利な使いかた
  # 正規表現にマッチした部分文字列だけが必要な場合に、
  # 
  # //emlist[][ruby]{
  # bar = /foo(.*)baz/.match("foobarbaz").to_a[1]
  # 
  # foo, bar, baz = /(foo)(bar)(baz)/.match("foobarbaz").to_a.values_at(1,2,3)
  # //}
  # 
  # のように使用できます。(to_a は、マッチに失敗した場合を考慮しています。)
  # 
  # 多重代入の規則では右辺が配列でない一つのオブジェクトで to_a
  # メソッドを持つ場合、右辺に * を付けることで to_a の結果を利用でき
  # ます。つまり、上記は以下のように書くことができます。(ここでの
  # `_' は、[[m:$&]] を捨てるために適当に選んだ変数名)
  # 
  # //emlist[例][ruby]{
  # _, foo, bar, baz = */(foo)(bar)(baz)/.match("foobarbaz")
  # p [foo, bar, baz]
  # 
  # # => ["foo", "bar", "baz"]
  # //}
  # 
  # このような用途に [[m:MatchData#captures]] が使
  # えると考えるかも知れませんが、captures では、マッチに失敗した場合、
  # nil.captures を呼び出そうとして例外 [[c:NoMethodError]] が発生して
  # しまいます。
  # 
  # //emlist[例][ruby]{
  # foo, bar, baz = /(foo)(bar)(baz)/.match("foobar").captures
  # 
  # # => -:1: undefined method `captures' for nil:NilClass (NoMethodError)
  # //}
  # 
  # @see [[m:Regexp#match?]]
  def match; end

  # --- match?(str, pos = 0) -> bool
  # 
  # 指定された文字列 str に対して 位置 pos から自身が表す正規表現によるマッチングを行います。
  # マッチした場合 true を返し、マッチしない場合には false を返します。
  # また、[[m:$~]] などパターンマッチに関する組み込み変数の値は変更されません。
  # 
  # //emlist[例][ruby]{
  # /R.../.match?("Ruby")    # => true
  # /R.../.match?("Ruby", 1) # => false
  # /P.../.match?("Ruby")    # => false
  # $&                       # => nil
  # //}
  # 
  # @see [[m:Regexp#match]]
  def match?; end

  # --- named_captures -> { String => [Integer] }
  # 正規表現に含まれる名前付きキャプチャ(named capture)の情報を
  # [[c:Hash]] で返します。
  # 
  # Hash のキーは名前付きキャプチャの名前で、値は
  # その名前に関連付けられたキャプチャの index のリストを返します。
  # 
  # //emlist[例][ruby]{
  # /(?<foo>.)(?<bar>.)/.named_captures
  # # => {"foo"=>[1], "bar"=>[2]}
  # 
  # /(?<foo>.)(?<foo>.)/.named_captures
  # # => {"foo"=>[1, 2]}
  # 
  # # 名前付きキャプチャを持たないときは空の Hash を返します。
  # /(.)(.)/.named_captures
  # # => {}
  # //}
  def named_captures; end

  # --- names -> [String]
  # 正規表現に含まれる名前付きキャプチャ(named capture)の名前を
  # 文字列の配列で返します。
  # 
  # //emlist[例][ruby]{
  # /(?<foo>.)(?<bar>.)(?<baz>.)/.names
  # 
  # # => ["foo", "bar", "baz"]
  #    /(?<foo>.)(?<foo>.)/.names
  # # => ["foo"]
  # 
  # /(.)(.)/.names
  # # => []
  # //}
  def names; end

  # --- options -> Integer
  # 
  # 正規表現の生成時に指定されたオプションを返します。戻り値は、
  # [[m:Regexp::EXTENDED]], [[m:Regexp::IGNORECASE]],
  # [[m:Regexp::MULTILINE]],
  # [[m:Regexp::FIXEDENCODING]],
  # [[m:Regexp::NOENCODING]],
  # の論理和です。
  # 
  # これで得られるオプションには生成時に指定したもの以外の
  # オプションを含んでいる場合があります。これらのビットは
  # 内部的に用いられているもので、[[m:Regexp.new]] にこれらを
  # 渡しても無視されます。
  # 
  # //emlist[例][ruby]{
  # p Regexp::IGNORECASE # => 1
  # p //i.options        # => 1
  # 
  # p Regexp.new("foo", Regexp::IGNORECASE ).options # => 1
  # p Regexp.new("foo", Regexp::EXTENDED).options    # => 2
  # p Regexp.new("foo", Regexp::IGNORECASE | Regexp::EXTENDED).options # => 3
  # p Regexp.new("foo", Regexp::MULTILINE).options # => 4
  # p Regexp.new("foo", Regexp::IGNORECASE | Regexp::MULTILINE ).options # => 5
  # p Regexp.new("foo", Regexp::MULTILINE | Regexp::EXTENDED).options # =>6
  # p Regexp.new("foo", Regexp::IGNORECASE | Regexp::MULTILINE | Regexp::EXTENDED).options # => 7
  # //}
  def options; end

  # --- source -> String
  # 
  # その正規表現のもととなった文字列表現を生成して返します。
  # 
  # //emlist[例][ruby]{
  # re = /foo|bar|baz/i
  # p re.source     # => "foo|bar|baz"
  # //}
  def source; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数には何の意味もありません。
  # 
  # //emlist[例][ruby]{
  # require "json/add/core"
  # 
  # /0\d{1,4}-\d{1,4}-\d{4}/.to_json # => "{\"json_class\":\"Regexp\",\"o\":0,\"s\":\"0\\\\d{1,4}-\\\\d{1,4}-\\\\d{4}\"}"
  # //}
  def to_json; end

  # --- to_s -> String
  # 
  # 正規表現の文字列表現を生成して返します。返される文字列は他の正規表
  # 現に埋め込んでもその意味が保持されるようになっています。
  # 
  # //emlist[][ruby]{
  # re = /foo|bar|baz/i
  # p re.to_s       # => "(?i-mx:foo|bar|baz)"
  # p /#{re}+/o     # => /(?i-mx:foo|bar|baz)+/
  # //}
  # 
  # ただし、後方参照を含む正規表現は意図通りにはならない場合があります。
  # この場合は名前付きキャプチャを使用すると影響を受けにくくなります。
  # 
  # //emlist[][ruby]{
  # re = /(foo|bar)\1/      # \1 は、foo か bar
  # p /(baz)#{re}/          # \1 は、baz
  # 
  # # => /(baz)(?-mix:(foo|bar)\1)/
  # //}
  # 
  # //emlist[使用例][ruby]{
  # re = /foo|bar|baz/i
  # p re.to_s       # => "(?i-mx:foo|bar|baz)"
  # p /#{re}+/o     # => /(?i-mx:foo|bar|baz)+/
  # //}
  # 
  # @see [[m:Regexp#inspect]]
  def to_s; end

  # --- ~ -> Integer | nil
  # 
  # 変数 [[m:$_]] の値との間でのマッチをとります。
  # 
  # ちょうど以下と同じ意味です。
  # 
  # //emlist[][ruby]{
  # self =~ $_
  # //}
  # 
  # //emlist[例][ruby]{
  # $_ = "hogehoge"
  # 
  # if  /foo/
  #   puts "match"
  # else
  #   puts "no match"
  # end
  # # => no match
  # # ただし、警告がでる。warning: regex literal in condition
  # 
  # reg = Regexp.compile("foo")
  # 
  # if ~ reg
  #   puts "match" 
  # else
  #   puts "no match" 
  # end
  # # => no match
  # 
  # if reg
  #   puts "match" 
  # else
  #   puts "no match"
  # end
  # # => match
  # # reg は nil でも false でも無いので常にtrue
  # //}
  def ~; end

  # --- compile(string, option = nil, code = nil) -> Regexp
  # --- new(string, option = nil, code = nil) -> Regexp
  # 
  # 文字列 string をコンパイルして正規表現オブジェクトを生成して返します。
  # 
  # 第一引数が正規表現であれば第一引数を複製して返します。第二、第三引数は警告の上無視されます。
  # 
  # @param string 正規表現を文字列として与えます。
  # 
  # @param option [[m:Regexp::IGNORECASE]], [[m:Regexp::MULTILINE]],
  #               [[m:Regexp::EXTENDED]]
  #               の論理和を指定します。
  #               [[c:Integer]] 以外であれば真偽値の指定として見なされ
  #               、真(nil, false 以外)であれば
  #               [[m:Regexp::IGNORECASE]] の指定と同じになります。
  # 
  # @param code "n", "N" が与えられた時には、生成された正規表現のエンコーディングは ASCII-8BIT になります。
  #             それ以外の指定は警告を出力します。
  # 
  # @raise  RegexpError 正規表現のコンパイルに失敗した場合発生します。
  # 
  # //emlist[例][ruby]{
  # str = "This is Regexp"
  # t1 = Regexp.compile("this is regexp", Regexp::IGNORECASE)
  # t1.match(str)
  # p $~ # => "This is Regexp"
  # 
  # t2 = Regexp.compile('
  # this         # ここは使用されない
  # \ is
  # \ regexp     # ここも使用されない
  # ', Regexp::EXTENDED | Regexp::IGNORECASE)
  # t2.match(str)
  # p Regexp.last_match # => "This is Regexp"
  # 
  # str = "ふるいけや\nかわずとびこむ\nみずのおと"
  # t2 = Regexp.compile("ふる.*?と", Regexp::MULTILINE)
  # p t2.match(str)[0]  # => "ふるいけや\nかわずと"
  # //}
  def compile; end

  # --- escape(string) -> String
  # --- quote(string) -> String
  # 
  # string の中で正規表現において特別な意味を持つ文字の直前にエ
  # スケープ文字(バックスラッシュ)を挿入した文字列を返します。
  # 
  # @param string 正規表現において特別な意味をもつ文字をもつ文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # rp = Regexp.escape("$bc^")
  # p rp # => "\\$bc\\^"
  # //}
  def escape; end

  # --- json_create(hash) -> Regexp
  # 
  # JSON のオブジェクトから Ruby のオブジェクトを生成して返します。
  # 
  # @param hash 適切なキーを持つハッシュを指定します。
  def json_create; end

  # --- last_match -> MatchData
  # 
  # カレントスコープで最後に行った正規表現マッチの [[c:MatchData]] オ
  # ブジェクトを返します。このメソッドの呼び出しは [[m:$~]]
  # の参照と同じです。
  # 
  # //emlist[例][ruby]{
  # /(.)(.)/ =~ "ab"
  # p Regexp.last_match      # => #<MatchData:0x4599e58>
  # p Regexp.last_match[0]   # => "ab"
  # p Regexp.last_match[1]   # => "a"
  # p Regexp.last_match[2]   # => "b"
  # p Regexp.last_match[3]   # => nil
  # //}
  # 
  # --- last_match(nth) -> String | nil
  # 
  # 整数 nth が 0 の場合、マッチした文字列を返します
  # ([[m:$&]])。それ以外では、nth 番目の括弧にマッチ
  # した部分文字列を返します([[m:$1]],[[m:$2]],...)。
  # 対応する括弧がない場合やマッチしなかった場合には nil を返し
  # ます。
  # 
  # //emlist[例][ruby]{
  # /(.)(.)/ =~ "ab"
  # p Regexp.last_match      # => #<MatchData:0x4599e58>
  # p Regexp.last_match(0)   # => "ab"
  # p Regexp.last_match(1)   # => "a"
  # p Regexp.last_match(2)   # => "b"
  # p Regexp.last_match(3)   # => nil
  # //}
  # 
  # 正規表現全体がマッチしなかった場合、引数なしの
  # Regexp.last_match はnil を返すため、
  # last_match[1] の形式では例外 [[c:NoMethodError]] が発生します。
  # 対して、last_match(1) は nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "This is Regexp"
  # /That is Regexp/ =~ str
  # p Regexp.last_match # => nil
  # begin
  #   p Regexp.last_match[1] # 例外が発生する
  # rescue 
  #   puts $! # => undefined method `[]' for nil:NilClass
  # end
  # p Regexp.last_match(1) # => nil
  # //}
  # 
  # @param nth 整数を指定します。
  # 	整数 nth が 0 の場合、マッチした文字列を返します。それ以外では、nth 番目の括弧にマッチした部分文字列を返します。
  def last_match; end

  # --- try_convert(obj) -> Regexp | nil
  # 
  # obj を to_regexp メソッドで Regexp オブジェクトに変換しようと
  # 試みます。
  # 
  # 変換に成功した場合はそれを返し、失敗時には nil を返します。
  # 
  # //emlist[例][ruby]{
  # Regexp.try_convert(/re/)      # => /re/
  # Regexp.try_convert("re")      # => nil
  # //}
  def try_convert; end

  # --- union(*pattern) -> Regexp
  # 
  # 引数として与えた pattern を選択 | で連結し、Regexp として返します。
  # 結果の Regexp は与えた pattern のどれかにマッチする場合にマッチするものになります。
  # 
  # //emlist[][ruby]{
  # p Regexp.union(/a/, /b/, /c/) # => /(?-mix:a)|(?-mix:b)|(?-mix:c)/
  # //}
  # 
  # 引数を一つだけ与える場合は、[[c:Array]] を与えても Regexp を生成します。
  # つまり、以下のように書くことができます。
  # 
  # //emlist[][ruby]{
  # arr = [/a/, /b/, /c/]
  # p Regexp.union(arr)  # => /(?-mix:a)|(?-mix:b)|(?-mix:c)/
  # # 1.8.7 より前は、以下のように書く必要があった
  # p Regexp.union(*arr) # => /(?-mix:a)|(?-mix:b)|(?-mix:c)/
  # //}
  # 
  # pattern は Regexp または String で与えます。
  # String で与えた場合、それ自身と等しい文字列にマッチするものと解釈され、
  # エスケープされて結果の Regexp に組み込まれます。
  # 
  # //emlist[][ruby]{
  # p Regexp.union("a", "?", "b") # => /a|\?|b/
  # p Regexp.union(/a/, "*") # => /(?-mix:a)|\*/
  # //}
  # 
  # 引数をひとつも与えなかった場合、決してマッチしない Regexp を返します。
  # 
  # //emlist[][ruby]{
  # p Regexp.union() # => /(?!)/
  # //}
  # 
  # 結果の Regexp が対応する文字コードは引数として与えた Regexp が扱う文字コードに
  # 一致します。
  # 固定コードに対してコンパイルされている Regexp を複数与える場合、
  # それらのコードは一致していなければなりません。
  # 異なる固定コードに対してコンパイルされている Regexp が存在する場合、
  # [[c:ArgumentError]] が発生します。
  # 
  # //emlist[][ruby]{
  # p Regexp.union(/a/e, /b/e) # => /(?-mix:a)|(?-mix:b)/e
  # p Regexp.union(/a/e, /b/s) # => ArgumentError
  # //}
  # 
  # コードが固定されている Regexp とコードが固定されていない Regexp を混ぜた場合、
  # 結果の Regexp は固定されているコードに対応するものになります。
  # 
  # //emlist[][ruby]{
  # p Regexp.union(/a/e, /b/) # => /(?-mix:a)|(?-mix:b)/e
  # //}
  # 
  # @param pattern | で連結したい正規表現を指定します
  # 
  # 
  # //emlist[例][ruby]{
  # # オプションは合成されない
  # p Regexp.union(/foo/i, /bar/x, /hoge/m) # => /(?i-mx:foo)|(?x-mi:bar)|(?m-ix:hoge)/
  # 
  # # 文字列そのものにマッチする
  # rep1 = [ "foo", "bar", "hoge"] 
  # p Regexp.union(*rep1) # => /foo|bar|hoge/
  # p Regexp.union(rep1)  # => /foo|bar|hoge/
  # 
  # # 下記の場合オプションがつくのは最初だけ
  # rep2 = [ /foo/x, "bar", "hoge"] 
  # p Regexp.union(*rep2) # => /(?x-mi:foo)|bar|hoge/
  # p Regexp.union(rep2)  # => /(?x-mi:foo)|bar|hoge/
  # //}
  def union; end

  # --- EXTENDED -> Integer
  # 
  # バックスラッシュでエスケープされていない空白と # から改行までを無
  # 視します。正規表現リテラルの //x オプションと同じ
  # です。(空白を入れる場合は\でエスケープして\ (<-空白)と
  # 指定します)
  def EXTENDED; end

  # --- FIXEDENCODING -> Integer
  # 
  # 正規表現が特定のエンコーディングの文字列にしかマッチしないことを意味します。
  # 
  # @see [[m:Regexp#fixed_encoding?]]
  def FIXEDENCODING; end

  # --- IGNORECASE -> Integer
  # 
  # 文字の大小の違いを無視します。
  # 正規表現リテラルの //i オプションと同じです。
  def IGNORECASE; end

  # --- MULTILINE -> Integer
  # 
  # 複数行モード。正規表現 "." が改行にマッチするようになります。
  # 正規表現リテラルの //m オプションと同じです。
  def MULTILINE; end

  # --- NOENCODING -> Integer
  # 
  # 正規表現のマッチ時に文字列のエンコーディングを無視し、
  # バイト列としてマッチすることを意味します。
  # 
  # 正規表現リテラルの n オプションに対応します。
  def NOENCODING; end

end
