class String
  # --- %(args) -> String
  # 
  # printf と同じ規則に従って args をフォーマットします。
  # 
  # args が配列であれば [[m:Kernel.#sprintf]](self, *args) と同じです。
  # それ以外の場合は [[m:Kernel.#sprintf]](self, args) と同じです。
  # 
  # @param args     フォーマットする値、もしくはその配列
  # @return         フォーマットされた文字列
  # 
  # //emlist[例][ruby]{
  # p "i = %d" % 10       # => "i = 10"
  # p "i = %x" % 10       # => "i = a"
  # p "i = %o" % 10       # => "i = 12"
  # 
  # p "i = %#d" % 10      # => "i = 10"
  # p "i = %#x" % 10      # => "i = 0xa"
  # p "i = %#o" % 10      # => "i = 012"
  # 
  # p "%d" % 10           # => "10"
  # p "%d,%o" % [10, 10]  # => "10,12"
  # //}
  # 
  # === sprintf フォーマット
  # 
  # Ruby の sprintf フォーマットは基本的に C 言語の [[man:sprintf(3)]]
  # のものと同じです。ただし、short や long などの C 特有の型に対する修飾子が
  # ないこと、2進数の指示子(%b, %B)が存在すること、sprintf のすべての方言をサ
  # ポートしていないこと(%': 3桁区切り)などの違いがあります。
  # 
  # Ruby には整数の大きさに上限がないので、%b, %B, %o, %x, %X
  # に負の数を与えると (左側に無限に1が続くとみなせるので)
  # ..f のような表示をします。絶対値に符号を付けた形式
  # で出力するためには %+x、% x のように指定します。
  # 
  # 
  # 以下は sprintf フォーマットの書式です。[] で囲まれた部分は省略可
  # 能であることを示しています。
  # 
  #  %[nth$][フラグ][幅][.精度]指示子
  #  %[<name>][フラグ][幅][.精度]指示子
  # 
  # `%' 自身を出力するには `%%' とします。
  # 
  # 以下それぞれの要素に関して説明します。
  # 
  # === フラグ
  # 
  # フラグには #, +, ' '(スペース), -, 0 の5種類があります。
  # 
  # : #
  # 
  #  2進、8進、16進の指示子(b, B, o, x, X) ではそれぞれプレフィック
  #  スとして "0b", "0B", "0", "0x", "0X" を付加します。
  #  C 言語と同様引数が 0 の場合にはプレフィックスが付加されません。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#b", 10) #=> "0b1010"
  # p sprintf("%#B", 10) #=> "0B1010"
  # p sprintf("%#b", 0)  #=> "0"
  # p sprintf("%#o", 10) #=> "012"
  # p sprintf("%#x", 10) #=> "0xa"
  # p sprintf("%#X", 10) #=> "0XA"
  # //}
  # 
  #  浮動小数点数 (f, e, E, g, G) に対しては必ず出力に"."をつけます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.0f", 10) #=> "10"
  # p sprintf("%#.0f", 10) #=> "10."
  # p sprintf("%.0e", 10) #=> "1e+01"
  # p sprintf("%#.0e", 10) #=> "1.e+01"
  # //}
  # 
  #  また g, G では上記に加えて末尾の余分な0が残ります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.05g", 10) #=> "10"
  # p sprintf("%#.05g", 10) #=> "10.000"
  # //}
  # 
  # : +
  # 
  #  出力文字列を符号付きにします。特に正の数では`+'が付加されます。
  #  数値の指示子
  #  (d, i, b, B, o, x, X, u, f, e, E, g, G)
  #  に対してだけ意味を持ちます。
  #  また、特に b, B, o, x, X, u に対しては、負数に対して "-"
  #  を付加することを示します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%d", 1)   #=> "1"
  # p sprintf("%+d", 1)  #=> "+1"
  # 
  # p sprintf("%x", -1)  #=> "..f"  # ".." は無限に f が続くことを表している
  # p sprintf("%+x", -1) #=> "-1"
  # //}
  # 
  # : ' '(スペース)
  # 
  #  `+' と同じですが正の符号 `+' の代わりに空白を用います。数値の指示子
  #  (d, i, b, B, o, x, X, u, f, e, E, g, G)
  #  に対してだけ意味を持ちます。
  # //emlist[][ruby]{
  # p sprintf("%d", 1)   #=> "1"
  # p sprintf("%+d", 1)  #=> "+1"
  # p sprintf("% d", 1)  #=> " 1"
  # 
  # p sprintf("%x", -1)  #=> "..f"
  # p sprintf("% x", 1)  #=> " 1"
  # p sprintf("% x", -1) #=> "-1"
  # //}
  # 
  # : -
  # 
  #  出力を左詰めにします。幅の指定がなければ
  #  意味がありません。
  # 
  # : 0
  # 
  #  出力が右詰めの場合に余った部分に空白の代わりに "0" を詰めます。
  # 
  #  数値の指示子の一部(d, i, b, B, o, x, X, u, f, g, G)に対し
  #  てだけ意味を持ちます(e, E には意味がない)
  # //emlist[][ruby]{
  # p sprintf("%010d", 10)   #=> "0000000010"
  # //}
  #  `#' と一緒に指定した場合の出力は以下のようになります。
  # //emlist[][ruby]{
  # p sprintf("%#010x", 10)  #=> "0x0000000a"
  # p sprintf("%#010o", 10)  #=> "0000000012"
  # p sprintf("%#010b", 10)  #=> "0b00001010"
  # //}
  # 
  #  これは、以下と同じです。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#10.8x", 10) #=> "0x0000000a"
  # p sprintf("%#10.9o", 10) #=> "0000000012"
  # p sprintf("%#10.8b", 10) #=> "0b00001010"
  # //}
  # 
  #  通常は、以下のようになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#10x", 10)   #=> "       0xa"
  # p sprintf("%#10o", 10)   #=> "       012"
  # p sprintf("%#10b", 10)   #=> "    0b1010"
  # //}
  # 
  # === 幅
  # 
  # 0以外の数字で始まる数字列は幅指定になります。幅は生成文字列の長さを示
  # します。後述の精度の値によらずこの幅分だ
  # けの文字列が生成されます。
  # 
  # 幅の指定はフラグで付与される " ", "+",
  # "-", "0b", "0B", "0", "0x", "0X" の長さも考慮されます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%+5d", 11)  #=> "  +11"
  # p sprintf("%+-5d", 11) #=> "+11  "
  # p sprintf("%+05d", 11) #=> "+0011"
  # //}
  # 
  # 幅は「最低限必要な幅」の指定になります。結果の文字列が指定した幅を超
  # える場合は幅の指定は無効になります。
  # 
  # 幅として `*' を指定すると幅の値を引数から得ることになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#05x", 10)    #=> "0x00a"
  # p sprintf("%#0*x", 5, 10) #=> "0x00a"
  # //}
  # 
  # === 精度
  # 
  # "." の後に続く数字列は精度を表します("." のみの場合 ".0" と同じです)。精度は
  # 整数の指示子
  # (d, i, b, B, o, x, X, u)
  # に対しては、数値列部分の長さを意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5d", 1)  #=> "     00001"
  # p sprintf("%#10.5x", 1) #=> "   0x00001"
  # p sprintf("%+10.5x", 1) #=> "    +00001"
  # //}
  # 
  # 浮動小数点数の指示子
  # (f)
  # に対しては小数部の桁数を意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5f", 1)   #=> "   1.00000"
  # p sprintf("%10.5f", 10)  #=> "  10.00000"
  # //}
  # 
  # 浮動小数点数の指示子
  # (e, E, g, G)
  # に対しては有効桁数を意味します。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.5e", 1)   #=> "1.00000e+00"
  # p sprintf("%10.5e", 10)  #=> "1.00000e+01"
  # p sprintf("%10.5g",  10)  #=> "        10"
  # p sprintf("%#10.5G", 10)  #=> "    10.000"
  # //}
  # 
  # 文字列の指示子(s, p)
  # に対しては引数の文字列のうち指定した数を超える分を切り捨てます。
  # 幅と精度を同じ値にすれば、どのような引数に対してもその
  # 長さだけの出力を行うことになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%10.2s", "foo")  #=> "        fo"
  # 
  # p sprintf("%5.5s", "foo")     #=> "  foo"
  # p sprintf("%5.5s", "foobar")  #=> "fooba"
  # //}
  # 
  # 精度として `*' を指定すると精度の値を引数から得ることになります。
  # 
  # //emlist[][ruby]{
  # p sprintf("%.5s", "foobar")    #=> "fooba"
  # p sprintf("%.*s", 5, "foobar") #=> "fooba"
  # //}
  # 
  # === 指示子
  # 
  # 指示子は引数の型の解釈を示します。指示子を省略することはできません。
  # 指示子には大きく分けて
  # 
  #  * 文字列を表す指示子: c, s, p
  #  * 整数を表す指示子: d, i, u, b, B, o, x, X,
  #  * 浮動小数点数を表す指示子: f, g, e, E, G
  # 
  # があります
  # 
  # : c
  # 
  #  引数の数値(0〜255)を文字コードとみなして対応する文字を出力します。
  #  引数が数値以外のオブジェクトの場合 to_int メソッドによる変換を試みます。
  #  引数として範囲内の一文字の文字列も受けつけます。文字そのものを出力します。
  # //emlist[][ruby]{
  # p sprintf("%c", 97)  #=> "a"
  # p sprintf("%c", 'a') #=> "a"
  # //}
  # 
  #  フラグ `-' と幅 の指定だけが意味を持ちます。
  # 
  # : s
  # 
  #  文字列を出力します。
  # 
  #  引数が [[c:String]] オブジェクトでなければ to_s メソッドにより文字列化
  #  したものを引数として扱います。
  # 
  # : p
  # 
  #  [[m:Object#inspect]] の結果を出力します。
  # //emlist[][ruby]{
  # p sprintf("%s", /e+/)  #=> "(?-mix:e+)"
  # p sprintf("%p", /e+/)  #=> "/e+/"
  # //}
  # 
  # 
  # : d
  # : i
  # 
  #  引数の数値を10進表現の整数として出力します。
  # 
  #  引数が整数でなければ関数 [[m:Kernel.#Integer]] と同じ規則で整数に
  #  変換されます。
  # 
  # //emlist[][ruby]{
  # p sprintf("%d", -1) #=> "-1"
  # p sprintf("%d", 3.1) #=> "3"
  # p sprintf("%d", '0b1010') #=> "10"
  # //}
  # 
  # : u
  # 
  #  引数の数値を符号なし整数とみなして10進表現の整数として出力します。
  # //emlist[][ruby]{
  # p sprintf("%u", '0b1010') #=> "10"
  # p sprintf("%u", -1) #=> "-1"
  # //}
  # 
  # 
  # : b
  # : B
  # : o
  # : x
  # : X
  # 
  #  整数をそれぞれ2進、2進(大文字)、8進、16進、16進(大文字)表現の文字列で出力します。
  # 
  #  `#' フラグを指定すれば "0b", "0B", "0", "0x", "0X" を先頭に付加します。
  # 
  #  `+', ` ' フラグがない場合、負の数には ".." が先頭(`#' フラグがあれば 
  #  "0x" などの後)に付加されます。これは最上位桁の文字が無限に続くことを
  #  意味し、2の補数表現で負の数を表しています。
  # 
  # //emlist[][ruby]{
  # p sprintf("%#b", 10)    #=> "0b1010"
  # p sprintf("%#B", 10)    #=> "0B1010"
  # p sprintf("%#o", 10)    #=> "012"
  # p sprintf("%#x", 10)    #=> "0xa"
  # p sprintf("%#X", 10)    #=> "0XA"
  # 
  # # 負の数に対して ".." が付加されます
  # p sprintf("%#b", -1)    #=> "0b..1"
  # p sprintf("%#o", -1)    #=> "0..7"
  # p sprintf("%#x", -1)    #=> "0x..f"
  # 
  # p sprintf("%10x", -1)   #=> "       ..f"
  # p sprintf("%-10x", -1)  #=> "..f       "
  # 
  # # ruby 1.9.1 以降では「精度」を指定した場合も、".." は付加されます 
  # p sprintf("%.10x", -1) #=> "..ffffffff" 
  # //}
  # 
  # : f
  # : e
  # : E
  # : g
  # : G
  # : a
  # : A
  # 
  #  f は小数点表現(xxx.xxx)で数値を出力します。
  # 
  #  e は指数表現(x.xxxe+xx)で数値を出力します。
  # 
  #  g は 指数が -4 より小さいか精度以上の場合に e と同じ出力を、それ以
  #  外では f と同じ出力を行います。ただし、小数部の末尾の0は取り除かれ
  #  ます。
  # 
  #  a, A は指数表現の16進数("-h.hhh±pd") で数値を出力します。ただし、[[m:Float::INFINITY]]、[[m:Float::NAN]] はそれぞれ 'Inf'、'NaN' になります。詳しくは [[ruby-dev:40650]] を参照してください。
  # 
  # //emlist[][ruby]{
  # p sprintf("%a", -0.0)            # => "-0x0p+0"
  # p sprintf("%a", 729.0/10)        # => "0x1.239999999999ap+6"
  # p sprintf("%a", Float::INFINITY) # => "Inf"
  # //}
  # 
  # 
  #  大文字の指示子(E, G)は出力のアルファベットを大文字にします。
  # //emlist[][ruby]{
  # p sprintf("%f", 1.0) #=> "1.000000"
  # p sprintf("%e", 1.0) #=> "1.000000e+00"
  # p sprintf("%g", 1.0) #=> "1"
  # 
  # p sprintf("%f", 10.1) #=> "10.100000"
  # p sprintf("%e", 10.1) #=> "1.010000e+01"
  # p sprintf("%g", 10.1) #=> "10.1"
  # 
  # p sprintf("%g", 10 ** 6)  #=> "1e+06"
  # p sprintf("%g", 10 ** -5) #=> "1e-05"
  # //}
  #  精度の省略値は 6 です。
  # 
  #  無限大、NaN(Not a Number) に対する出力は以下のとおりです。
  # //emlist[][ruby]{
  # p sprintf("%f",  1.0/0)  #=> "inf"
  # p sprintf("%f", -1.0/0)  #=> "-inf"
  # p sprintf("%f",  0.0/0)  #=> "nan"
  # 
  # p sprintf("%E",  1.0/0)  #=> "INF"
  # p sprintf("%E", -1.0/0)  #=> "-INF"
  # p sprintf("%E",  0.0/0)  #=> "NAN"
  # //}
  #  f, e, E, g, G に関しては [[man:sprintf(3)]] の結果を利用しています。従って出力結果は
  #  実際にはシステムに依存することになります。
  # 
  # === 引数指定
  # 
  # 利用頻度が低いので最後に説明します。
  # 
  # : nth$
  # 
  #  nth 番目の引数のフォーマットを行うことを示します。
  # //emlist[][ruby]{
  # p sprintf("%d, %x, %o", 1, 2, 3) #=> "1, 2, 3"
  # p sprintf("%3$d, %2$x, %1$o", 1, 2, 3) #=> "3, 2, 1"
  # 
  # p sprintf("%1$d, %1$x, %1$o", 10) #=> "10, a, 12"
  # //}
  #  状況によってフォーマットを変えたいが引数の順序を変えたくない場合に使
  #  用します。
  # //emlist[][ruby]{
  # case ENV['LC_TIME']
  # when /^ja_JP/
  #   fmt = "%1$d年%2$d月%3$d日"
  # else
  #   fmt = "%2$02d/%03$2d/%1$02d"
  # end
  # 
  # p sprintf(fmt, 1, 4, 22) #=> "04/22/01"
  # //}
  #  "*" の後に指定することで幅や
  #  精度を引数で指定することもできます。
  # //emlist[][ruby]{
  # p sprintf("%5.2f", 1)              #=> " 1.00"
  # p sprintf("%*.*f", 5, 2, 1)        #=> " 1.00"
  # p sprintf("%1$*2$.*3$f", 1, 5, 2)  #=> " 1.00"
  # //}
  # 
  # : %<name>
  # 
  #  Symbol のインスタンス name をキーとする Hash を引数にした場合、
  #  対応する値をフォーマットして参照します。
  # //emlist[][ruby]{
  # p sprintf('%<foo>f : %<bar>+d', foo: 1, bar: 2) #=> "1.000000 : +2"
  # //}
  # 
  # : %{name}
  # 
  #  Symbol のインスタンス name をキーとする Hash を引数にした場合、
  #  対応する値をフォーマットせずに参照します。
  #  幅や精度を指定するために使用することができます。
  # //emlist[][ruby]{
  # p sprintf('%{foo}f : %{bar}+d', foo: 1, bar: 2) #=> "1f : 2+d"
  # //}
  def %; end

  # --- *(times) -> String
  # 
  # 文字列の内容を times 回だけ繰り返した新しい文字列を作成して返します。
  # 
  # @param times    整数
  # @return         self を times 回繰り返した新しい文字列
  # 
  # @raise ArgumentError 引数に負数を指定したときに発生します。
  # 
  # //emlist[例][ruby]{
  # p "str" * 3   # => "strstrstr"
  # 
  # str = "abc"
  # p str * 4   # => "abcabcabcabc"
  # p str * 0   # => ""
  # p str       # => "abc"  (変化なし)
  # //}
  def *; end

  # --- +(other) -> String
  # 
  # 文字列と other を連結した新しい文字列を返します。
  # 
  # @param other    文字列
  # @return         self と other を連結した文字列
  # 
  # //emlist[例][ruby]{
  # p "str" + "ing"   # => "string"
  # 
  # a = "abc"
  # b = "def"
  # p a + b   # => "abcdef"
  # p a       # => "abc"  (変化なし)
  # p b       # => "def"
  # //}
  def +; end

  # --- +@ -> String | self
  # 
  # self が freeze されている文字列の場合、元の文字列の複製を返します。
  # freeze されていない場合は self を返します。
  # 
  # //emlist[例][ruby]{
  # # frozen_string_literal: false
  # 
  # original_text = "text"
  # unfrozen_text = +original_text
  # unfrozen_text.frozen?                 # => false
  # original_text == unfrozen_text        # => true
  # original_text.equal?(unfrozen_text)   # => true
  # 
  # original_text = "text".freeze
  # unfrozen_text = +original_text
  # unfrozen_text.frozen?                 # => false
  # original_text == unfrozen_text        # => true
  # original_text.equal?(unfrozen_text)   # => false
  # //}
  # 
  # @see [[m:String#-@]]
  def +@; end

  # --- -@ -> String | self
  # 
  # self が freeze されている文字列の場合、self を返します。
  # freeze されていない場合は元の文字列の freeze された (できる限り既存の) 複製を返します。
  # 
  # //emlist[例][ruby]{
  # # frozen_string_literal: false
  # 
  # original_text = "text"
  # frozen_text = -original_text
  # frozen_text.frozen?                 # => true
  # original_text == frozen_text        # => true
  # original_text.equal?(frozen_text)   # => false
  # 
  # original_text = "text".freeze
  # frozen_text = -original_text
  # frozen_text.frozen?                 # => true
  # original_text == frozen_text        # => true
  # original_text.equal?(frozen_text)   # => true
  # //}
  # 
  # @see [[m:String#+@]]
  def -@; end

  # --- <<(other) -> self
  # --- concat(other) -> self
  # 
  # self に文字列 other を破壊的に連結します。
  # other が 整数である場合は other.chr(self.encoding) 相当の文字を末尾に追加します。
  # 
  # self を返します。
  # 
  # @param other    文字列もしくは 0 以上の整数
  # 
  # //emlist[例][ruby]{
  # str = "string"
  # str.concat "XXX"
  # p str    # => "stringXXX"
  # 
  # str << "YYY"
  # p str    # => "stringXXXYYY"
  # 
  # str << 65  # 文字AのASCIIコード
  # p str    # => "stringXXXYYYA"
  # //}
  # 
  # --- concat(*arguments) -> self
  # 
  # self に複数の文字列を破壊的に連結します。
  # 
  # 引数の値が整数である場合は [[m:Integer#chr]] の結果に相当する文字を末尾に追加します。追加する文字のエンコーディングは self.encoding です。
  # 
  # self を返します。
  # 
  # @param arguments 複数の文字列もしくは 0 以上の整数
  # 
  # //emlist[例][ruby]{
  # str = "foo"
  # str.concat
  # p str    # => "foo"
  # 
  # str = "foo"
  # str.concat "bar", "baz"
  # p str    # => "foobarbaz"
  # 
  # str = "foo"
  # str.concat("!", 33, 33)
  # p str    # => "foo!!!"
  # //}
  def <<; end

  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self と other を ASCII コード順で比較して、
  # self が大きい時には 1、等しい時には 0、小さい時には -1 を返します。
  # このメソッドは Comparable モジュールのメソッドを実装するために使われます。
  # 
  # other が文字列でない場合、
  # other.to_str と other.<=> が定義されていれば
  # 0 - (other <=> self) の結果を返します。
  # そうでなければ nil を返します。
  # 
  # @param other    文字列
  # @return         比較結果の整数か nil
  # 
  # //emlist[例][ruby]{
  # p "aaa" <=> "xxx"   # => -1
  # p "aaa" <=> "aaa"   # => 0
  # p "xxx" <=> "aaa"   # => 1
  # 
  # p "string" <=> "stringAA"  # => -1
  # p "string" <=> "string"    # => 0
  # p "stringAA" <=> "string"  # => 1
  # //}
  def <=>; end

  # --- ==(other) -> bool
  # --- ===(other) -> bool
  # 
  # other が文字列の場合、[[m:String#eql?]] と同様に文字列の内容を比較します。
  # 
  # other が文字列でない場合、
  # other.to_str が定義されていれば
  # other == self の結果を返します。(ただし、 other.to_str は実行されません。)
  # そうでなければ false を返します。
  # 
  # @param other    任意のオブジェクト
  # @return         true か false
  # 
  # //emlist[例][ruby]{
  # stringlike = Object.new
  # 
  # def stringlike.==(other)
  #   "string" == other
  # end
  # 
  # p "string".eql?(stringlike) #=> false
  # p "string" == stringlike    #=> false
  # 
  # def stringlike.to_str
  #   raise
  # end
  # 
  # p "string".eql?(stringlike) #=> false
  # p "string" == stringlike    #=> true
  # //}
  # 
  # @see [[m:String#eql?]]
  def ==; end

  # --- =~(other) -> Integer | nil
  # 
  # 正規表現 other とのマッチを行います。
  # マッチが成功すればマッチした位置のインデックスを、そうでなければ nil を返します。
  # 
  # other が正規表現でも文字列でもない場合は
  # other =~ self を行います。
  # 
  # このメソッドが実行されると、組み込み変数 [[m:$~]], [[m:$1]], ...
  # にマッチに関する情報が設定されます。
  # 
  # @param other        正規表現もしくは =~ メソッドを持つオブジェクト
  # @raise TypeError    other が文字列の場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p "string" =~ /str/   # => 0
  # p "string" =~ /not/   # => nil
  # p "abcfoo" =~ /foo/   # => 3
  # //}
  def =~; end

  # --- [](nth) -> String | nil
  # --- slice(nth) -> String | nil
  # 
  # nth 番目の文字を返します。
  # nth が負の場合は文字列の末尾から数えます。
  # つまり、 self.size + nth 番目の文字を返します。
  # 
  # nth が範囲外を指す場合は nil を返します。
  # 
  # @param nth 文字の位置を表す整数
  # @return 指定した位置の文字を表す String オブジェクト
  # 
  # //emlist[例][ruby]{
  # p 'bar'[2]       # => "r"
  # p 'bar'[2] == ?r # => true
  # p 'bar'[-1]      # => "r"
  # p 'bar'[3]       # => nil
  # p 'bar'[-4]      # => nil
  # //}
  # 
  # このメソッドの仕様は 1.8.x 以前から大きく変更されていますので注意が必要
  # です。
  # 
  # --- [](nth, len) -> String | nil
  # --- slice(nth, len) -> String | nil
  # 
  # nth 文字目から長さ len 文字の部分文字列を新しく作って返します。
  # nth が負の場合は文字列の末尾から数えます。
  # 
  # @param nth    取得したい文字列の開始インデックスを整数で指定します。
  # @param len    取得したい文字列の長さを正の整数で指定します。
  # 
  # @return nth が範囲外を指す場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # str0 = "bar"
  # str0[2, 1]         #=> "r"
  # str0[2, 0]         #=> ""
  # str0[2, 100]       #=> "r"  (右側を超えても平気)
  # str0[-1, 1]        #=> "r"
  # str0[-1, 2]        #=> "r"  (右に向かって len 文字)
  # 
  # str0[3, 1]         #=> ""
  # str0[4, 1]         #=> nil
  # str0[-4, 1]        #=> nil
  # str1 = str0[0, 2]    # (str0 の「一部」を str1 とする)
  # str1               #=> "ba"
  # str1[0] = "XYZ"
  # str1               #=> "XYZa" (str1 の内容が破壊的に変更された)
  # str0               #=> "bar" (str0 は無傷、 str1 は str0 と内容を共有していない)
  # //}
  # 
  # --- [](substr) -> String | nil
  # --- slice(substr) -> String | nil
  # 
  # self が substr を含む場合、一致した文字列を新しく作って返します。
  # substr を含まなければ nil を返します。
  # 
  # @param substr    取得したい文字列のパターン。文字列
  # 
  # //emlist[例][ruby]{
  # substr = "bar"
  # result = "foobar"[substr]
  # p result   # => "bar"
  # p substr.equal?(result)   # => false
  # //}
  # 
  # --- [](regexp, nth = 0) -> String
  # --- slice(regexp, nth = 0) -> String
  # 
  # 正規表現 regexp の nth 番目の括弧にマッチする最初の部分文字列を返します。
  # nth を省略したときや 0 の場合は正規表現がマッチした部分文字列全体を返します。
  # 正規表現が self にマッチしなかった場合や nth に対応する括弧がないときは nil を返します。
  # 
  # このメソッドを実行すると、
  # マッチ結果に関する情報が組み込み変数 [[m:$~]] に設定されます。
  # 
  # @param regexp    取得したい文字列のパターンを示す正規表現
  # @param nth       取得したい正規表現レジスタのインデックス。整数
  # 
  # //emlist[例][ruby]{
  # p "foobar"[/bar/]  # => "bar"
  # p $~.begin(0)      # => 3
  # p "def getcnt(line)"[ /def\s+(\w+)/, 1 ]   # => "getcnt"
  # //}
  # 
  # --- [](regexp, name) -> String
  # --- slice(regexp, name) -> String
  # 
  # 正規表現 regexp の name で指定した名前付きキャプチャにマッチする最初の
  # 部分文字列を返します。正規表現が self にマッチしなかった場合は nil を返
  # します。
  # 
  # @param regexp 正規表現を指定します。
  # @param name 取得したい部分文字列のパターンを示す正規表現レジスタを示す名前
  # 
  # @raise IndexError name に対応する括弧がない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # s = "FooBar"
  # s[/(?<foo>[A-Z]..)(?<bar>[A-Z]..)/]        # => "FooBar"
  # s[/(?<foo>[A-Z]..)(?<bar>[A-Z]..)/, "foo"] # => "Foo"
  # s[/(?<foo>[A-Z]..)(?<bar>[A-Z]..)/, "bar"] # => "Bar"
  # s[/(?<foo>[A-Z]..)(?<bar>[A-Z]..)/, "baz"] # => IndexError
  # //}
  # 
  # --- [](range) -> String
  # --- slice(range) -> String
  # 
  # rangeで指定したインデックスの範囲に含まれる部分文字列を返します。
  # 
  # @param range   取得したい文字列の範囲を示す Range オブジェクト
  # 
  # === rangeオブジェクトが終端を含む場合
  # 
  # インデックスと文字列の対応については以下の対照図も参照してください。
  # 
  #     0   1   2   3   4   5   (インデックス)
  #    -6  -5  -4  -3  -2  -1   (負のインデックス)
  #   | a | b | c | d | e | f |
  #   |<--------->|                'abcdef'[0..2]  # => 'abc'
  #                   |<----->|    'abcdef'[4..5]  # => 'ef'
  #           |<--------->|        'abcdef'[2..4]  # => 'cde'
  # 
  # range.last が文字列の長さ以上のときは
  # (文字列の長さ - 1) を指定したものとみなされます。
  # 
  # range.first が 0 より小さいか文字列の長さより大きいときは nil を
  # 返します。ただし range.first および range.last のどちらか
  # または両方が負の数のときは一度だけ文字列の長さを足して
  # 再試行します。
  # 
  # //emlist[例][ruby]{
  # 'abcd'[ 2 ..  1] # => ""
  # 'abcd'[ 2 ..  2] # => "c"
  # 'abcd'[ 2 ..  3] # => "cd"
  # 'abcd'[ 2 ..  4] # => "cd"
  # 
  # 'abcd'[ 2 .. -1] # => "cd"   # str[f..-1] は「f 文字目から
  # 'abcd'[ 3 .. -1] # => "d"    # 文字列の最後まで」を表す慣用句
  # 
  # 'abcd'[ 1 ..  2] # => "bc"
  # 'abcd'[ 2 ..  2] # => "c"
  # 'abcd'[ 3 ..  2] # => ""
  # 'abcd'[ 4 ..  2] # => ""
  # 'abcd'[ 5 ..  2] # => nil
  # 
  # 'abcd'[-3 ..  2] # => "bc"
  # 'abcd'[-4 ..  2] # => "abc"
  # 'abcd'[-5 ..  2] # => nil
  # //}
  # 
  # === rangeオブジェクトが終端を含まない場合
  # 
  # 文字列と「隙間」の関係については以下の模式図を参照してください。
  # 
  #      0   1   2   3   4   5   6  (隙間番号)
  #     -6  -5  -4  -3  -2  -1      (負の隙間番号)
  #      | a | b | c | d | e | f |
  #      |<--------->|                'abcdef'[0...3]  # => 'abc'
  #                      |<----->|    'abcdef'[4...6]  # => 'ef'
  #              |<--------->|        'abcdef'[2...5]  # => 'cde'
  # 
  # range.last が文字列の長さよりも大きいときは文字列の長さを
  # 指定したものとみなされます。
  # 
  # range.first が 0 より小さいか文字列の長さより大きいときは nil を返します。
  # ただし range.first と range.last のどちらかまたは両方が負の数
  # であるときは一度だけ文字列の長さを足して再試行します。
  # 
  # //emlist[例][ruby]{
  # 'abcd'[ 2 ... 3] # => "c"
  # 'abcd'[ 2 ... 4] # => "cd"
  # 'abcd'[ 2 ... 5] # => "cd"
  # 
  # 'abcd'[ 1 ... 2] # => "b"
  # 'abcd'[ 2 ... 2] # => ""
  # 'abcd'[ 3 ... 2] # => ""
  # 'abcd'[ 4 ... 2] # => ""
  # 'abcd'[ 5 ... 2] # => nil
  # 
  # 'abcd'[-3 ... 2] # => "b"
  # 'abcd'[-4 ... 2] # => "ab"
  # 'abcd'[-5 ... 2] # => nil
  # //}
  def []; end

  # --- []=(nth, val)
  # 
  # nth 番目の文字を文字列 val で置き換えます。
  # 
  # @param nth 置き換えたい文字の位置を指定します。
  # @param val 置き換える文字列を指定します。
  # 
  # @return val を返します。
  # 
  # //emlist[例][ruby]{
  # buf = "string"
  # buf[1] = "!!"
  # p buf   # => "s!!ring"
  # //}
  # 
  # --- []=(nth, len, val)
  # 
  # nth 番目の文字から len 文字の部分文字列を文字列 val で置き換えます。
  # 
  # len が0 の場合は、単にnthの位置から文字列の追加が行われます。
  # nth が負の場合は文字列の末尾から数えます。
  # 
  # @param nth    置き換えたい部分文字列の開始インデックス
  # @param len    置き換えたい部分文字列の長さ
  # @param val    指定範囲の部分文字列と置き換える文字列
  # 
  # @return val を返します。
  # 
  # //emlist[例][ruby]{
  # buf = "string"
  # buf[1, 4] = "!!"
  # p buf   # => "s!!g"
  # 
  # buf = "string"
  # buf[1, 0] = "!!"
  # p buf   # => "s!!tring"
  # //}
  # 
  # --- []=(substr, val)
  # 
  # 文字列中の substr に一致する最初の部分文字列を文字列 val で置き換えます。
  # 
  # @param substr    置き換えたい部分文字列のパターンを示す文字列
  # @param val       指定範囲の部分文字列と置き換える文字列
  # 
  # @return val を返します。
  # 
  # @raise IndexError    self が部分文字列 substr を含まない場合に発生します。
  # 
  # //emlist[例][ruby]{
  # buf = "string"
  # buf["trin"] = "!!"
  # p buf   # => "s!!g"
  # 
  # buf = "string"
  # buf["nosuchstring"] = "!!"   # IndexError
  # //}
  # 
  # --- []=(regexp, nth, val)
  # 
  # 正規表現 regexp の nth 番目の括弧にマッチする
  # 最初の部分文字列を文字列 val で置き換えます。
  # 
  # nth が 0 の場合は、マッチした部分文字列全体を val で置き換えます。
  # 
  # @param regexp    置き換えたい部分文字列のパターンを示す正規表現
  # @param nth       置き換えたい部分文字列のパターンを示す正規表現レジスタの番号
  # @param val       指定範囲の部分文字列と置き換えたい文字列
  # 
  # @return val を返します。
  # 
  # @raise IndexError 正規表現がマッチしなかった場合に発生します。
  # 
  # //emlist[例][ruby]{
  # buf = "def exec(cmd)"
  # buf[/def\s+(\w+)/, 1] = "preprocess"
  # p buf    # => "def preprocess(cmd)"
  # //}
  # 
  # --- []=(regexp, name, val)
  # 
  # 正規表現 regexp の name で指定した名前付きキャプチャにマッチする最初の
  # 部分文字列を文字列 val で置き換えます。
  # 
  # @param regexp    置き換えたい部分文字列のパターンを示す正規表現
  # @param name      置き換えたい部分文字列のパターンを示す正規表現レジスタを示す名前
  # @param val       指定範囲の部分文字列と置き換えたい文字列
  # 
  # @return val を返します。
  # 
  # @raise IndexError name で指定した名前付きキャプチャが存在しない場合に発
  #                   生します。
  # 
  # //emlist[例][ruby]{
  # s = "FooBar"
  # s[/(?<foo>[A-Z]..)(?<bar>[A-Z]..)/, "foo"] = "Baz"
  # p s # => "BazBar"
  # //}
  # 
  # --- []=(regexp, val)
  # 
  # 正規表現 regexp にマッチした部分文字列全体を val で置き換えます。
  # 
  # @param regexp    置き換えたい部分文字列のパターンを示す正規表現
  # @param val       置き換えたい文字列
  # 
  # @return val を返します。
  # 
  # @raise IndexError 正規表現がマッチしなかった場合に発生します。
  # 
  # //emlist[例][ruby]{
  # buf = "string"
  # buf[/tr../] = "!!"
  # p buf   # => "s!!g"
  # //}
  # 
  # --- []=(range, val)
  # 
  # rangeで指定したインデックスの範囲に含まれる部分文字列を文字列 val で置き換えます。
  # 
  # @param range   置き換えたい範囲を示す [[c:Range]] オブジェクト
  # 
  # @return val を返します。
  def []=; end

  # --- ascii_only?  -> bool
  # 
  # 文字列がASCII文字のみで構成されている場合に true を返します。さもなくば
  # false を返します。
  # 
  # 例:
  # 
  #   'abc123'.ascii_only?        # => true
  #   ''.ascii_only?              # => true
  #   '日本語'.ascii_only?        # => false
  #   '日本語abc123'.ascii_only?  # => false
  def ascii_only?; end

  # --- b -> String
  # 
  # self の文字エンコーディングを ASCII-8BIT にした文字列の複製を返します。
  # 
  # //emlist[例][ruby]{
  # 'abc123'.encoding    # => #<Encoding:UTF-8>
  # 'abc123'.b.encoding  # => #<Encoding:ASCII-8BIT>
  # //}
  def b; end

  # --- bytes               -> [Integer]
  # --- bytes {|byte| ... } -> self
  # 
  # 文字列の各バイトを数値の配列で返します。(self.each_byte.to_a と同じです)
  # 
  # //emlist[例][ruby]{
  # "str".bytes # => [115, 116, 114]
  # //}
  # 
  # ブロックが指定された場合は [[m:String#each_byte]] と同じように動作します。
  # 
  # Ruby 2.6 までは deprecated の警告が出ますが、Ruby 2.7 で警告は削除されました。
  # 
  # @see [[m:String#each_byte]]
  def bytes; end

  # --- bytesize -> Integer
  # 
  # 文字列のバイト長を整数で返します。
  # 
  # //emlist[例][ruby]{
  # #coding:UTF-8
  # # 実行結果は文字コードによって異なります。
  # p "いろは".size     #=> 3
  # p "いろは".bytesize #=> 9
  # //}
  # 
  # @see [[m:String#size]]
  def bytesize; end

  # --- byteslice(nth)         -> String | nil
  # 
  # nth バイト目の文字を返します。nth が負の場合は文字列の末尾から数えます。
  # 引数が範囲外を指定した場合は nil を返します。
  # 
  # @param nth 文字の位置を表す整数を指定します。
  # 
  # @return 切り出した文字列を返します。戻り値の文字エンコーディングは自身
  #         と同じです。
  # 
  # //emlist[例][ruby]{
  # "hello".byteslice(1)  # => "e"
  # "hello".byteslice(-1) # => "o"
  # "\u3042".byteslice(0) # => "\xE3"
  # "\u3042".byteslice(1) # => "\x81"
  # //}
  # 
  # @see [[m:String#slice]]
  # 
  # --- byteslice(nth, len) -> String | nil
  # 
  # nth バイト目から長さ len バイトの部分文字列を新しく作って返します。
  # nth が負の場合は文字列の末尾から数えます。引数が範囲外を指定した場合は
  # nil を返します。
  # 
  # @param nth 取得したい文字列の開始バイトを整数で指定します。
  # 
  # @param len 取得したい文字列の長さを正の整数で指定します。
  # 
  # @return 切り出した文字列を返します。戻り値の文字エンコーディングは自身
  #         と同じです。
  # 
  # //emlist[例][ruby]{
  # "hello".byteslice(1, 2)              # => "el"
  # "\u3042\u3044\u3046".byteslice(0, 3) # => "\u3042"
  # //}
  # 
  # @see [[m:String#slice]]
  # 
  # --- byteslice(range)          -> String | nil
  # 
  # range で指定したバイトの範囲に含まれる部分文字列を返します。引数が範囲
  # 外を指定した場合は nil を返します。
  # 
  # @param range 取得したい文字列の範囲を示す Range オブジェクト
  # 
  # @return 切り出した文字列を返します。戻り値の文字エンコーディングは自身
  #         と同じです。
  # 
  # //emlist[例][ruby]{
  # "hello".byteslice(1..2)          # => "el"
  # "\x03\u3042\xff".byteslice(1..3) # => "\u3042"
  # //}
  # 
  # @see [[m:String#slice]]
  def byteslice; end

  # --- capitalize(*options) -> String
  # 
  # 文字列先頭の文字を大文字に、残りを小文字に変更した文字列を返します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # p "foobar--".capitalize   # => "Foobar--"
  # p "fooBAR--".capitalize   # => "Foobar--"
  # p "FOOBAR--".capitalize   # => "Foobar--"
  # //}
  # 
  # @see [[m:String#capitalize!]], [[m:String#upcase]],
  #      [[m:String#downcase]], [[m:String#swapcase]]
  def capitalize; end

  # --- capitalize!(*options) -> self | nil
  # 
  # 文字列先頭の文字を大文字に、残りを小文字に破壊的に変更します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # @return capitalize! は self を変更して返しますが、
  #         変更が起こらなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "foobar"
  # str.capitalize!
  # p str   # => "Foobar"
  # 
  # str = "fooBAR"
  # str.capitalize!
  # p str   # => "Foobar"
  # //}
  # 
  # @see [[m:String#capitalize]], [[m:String#upcase!]],
  #      [[m:String#downcase!]], [[m:String#swapcase!]]
  def capitalize!; end

  # --- casecmp(other) -> -1 | 0 | 1 | nil
  # 
  # [[m:String#<=>]] と同様に文字列の順序を比較しますが、
  # アルファベットの大文字小文字の違いを無視します。
  # 
  # このメソッドの動作は組み込み変数 [[m:$=]] には影響されません。
  # 
  # [[m:String#casecmp?]] と違って大文字小文字の違いを無視するのは
  # Unicode 全体ではなく、A-Z/a-z だけです。
  # 
  # @param other    self と比較する文字列
  # 
  # //emlist[例][ruby]{
  # "aBcDeF".casecmp("abcde")     #=> 1
  # "aBcDeF".casecmp("abcdef")    #=> 0
  # "aBcDeF".casecmp("abcdefg")   #=> -1
  # "abcdef".casecmp("ABCDEF")    #=> 0
  # //}
  # 
  # nil は文字列のエンコーディングが非互換の時に返されます。
  # 
  # //emlist[][ruby]{
  # "\u{e4 f6 fc}".encode("ISO-8859-1").casecmp("\u{c4 d6 dc}")   #=> nil
  # //}
  # 
  # @see [[m:String#<=>]], [[m:Encoding#compatible?]]
  def casecmp; end

  # --- casecmp?(other) -> bool | nil
  # 
  # 大文字小文字の違いを無視し文字列を比較します。
  # 文字列が一致する場合には true を返し、一致しない場合には false を返します。
  # 
  # @param other    self と比較する文字列
  # 
  # //emlist[例][ruby]{
  # "abcdef".casecmp?("abcde")     #=> false
  # "aBcDeF".casecmp?("abcdef")    #=> true
  # "abcdef".casecmp?("abcdefg")   #=> false
  # "abcdef".casecmp?("ABCDEF")    #=> true
  # "\u{e4 f6 fc}".casecmp?("\u{c4 d6 dc}") #=> true
  # //}
  # 
  # nil は文字列のエンコーディングが非互換の時に返されます。
  # 
  # //emlist[][ruby]{
  # "\u{e4 f6 fc}".encode("ISO-8859-1").casecmp?("\u{c4 d6 dc}")   #=> nil
  # //}
  # 
  # @see [[m:String#casecmp]]
  def casecmp?; end

  # --- center(width, padding = ' ') -> String
  # 
  # 長さ width の文字列に self を中央寄せした文字列を返します。
  # self の長さが width より長い時には元の文字列の複製を返します。
  # また、第 2 引数 padding を指定したときは
  # 空白文字の代わりに padding を詰めます。
  # 
  # @param width      返り値の文字列の最小の長さ
  # @param padding    長さが width になるまで self の両側に詰める文字
  # 
  # //emlist[例][ruby]{
  # p "foo".center(10)       # => "   foo    "
  # p "foo".center(9)        # => "   foo   "
  # p "foo".center(8)        # => "  foo   "
  # p "foo".center(7)        # => "  foo  "
  # p "foo".center(3)        # => "foo"
  # p "foo".center(2)        # => "foo"
  # p "foo".center(1)        # => "foo"
  # p "foo".center(10, "*")  # => "***foo****"
  # //}
  # 
  # @see [[m:String#ljust]], [[m:String#rjust]]
  def center; end

  # --- chars                 -> [String]
  # --- chars {|cstr| block } -> self
  # 
  # 文字列の各文字を文字列の配列で返します。(self.each_char.to_a と同じです)
  # 
  # //emlist[例][ruby]{
  # "hello世界".chars # => ["h", "e", "l", "l", "o", "世", "界"]
  # //}
  # 
  # ブロックが指定された場合は [[m:String#each_char]] と同じように動作します。
  # 
  # Ruby 2.6 までは deprecated の警告が出ますが、Ruby 2.7 で警告は削除されました。
  # 
  # @see [[m:String#each_char]]
  def chars; end

  # --- chomp(rs = $/) -> String
  # 
  # self の末尾から rs で指定する改行コードを取り除いた文字列を生成して返します。
  # ただし、rs が "\n" ($/ のデフォルト値) のときは、
  # 実行環境によらず "\r", "\r\n", "\n" のすべてを改行コードとみなして取り除きます。
  # 
  # rs に nil を指定した場合、このメソッドは何もしません。
  # 
  # rs に空文字列 ("") を指定した場合は「パラグラフモード」になり、
  # 実行環境によらず末尾の連続する改行コード("\r\n", "\n")をすべて取り除きます。
  # 
  # //emlist[例][ruby]{
  # p "foo\n".chomp             # => "foo"
  # p "foo\n".chomp("\n")       # => "foo"
  # p "foo\r\n".chomp("\r\n")   # => "foo"
  # 
  # $/ = "\n"   # デフォルト値と同じ
  # p "foo\r".chomp    # => "foo"
  # p "foo\r\n".chomp  # => "foo"
  # p "foo\n".chomp    # => "foo"
  # p "foo\n\r".chomp  # => "foo\n"
  # 
  # p "string\n".chomp(nil)  # => "string\n"
  # 
  # p "foo\r\n\n".chomp("")  # => "foo"
  # p "foo\n\r\n".chomp("")  # => "foo"
  # p "foo\n\r\r".chomp("")  # => "foo\n\r\r"
  # //}
  # 
  # @see [[m:String#chomp!]]
  # @see [[m:String#chop]]
  # @see [[m:String#delete_suffix]]
  def chomp; end

  # --- chomp!(rs = $/) -> self | nil
  # 
  # self の末尾から rs で指定する改行コードを取り除きます。
  # ただし rs が "\n" ($/ のデフォルト値) のときは、
  # 実行環境によらず "\r", "\r\n", "\n" のすべてを改行コードとみなして取り除きます。
  # 
  # rs に nil を指定した場合、このメソッドは何もしません。
  # 
  # rs に空文字列 ("") を指定した場合は「パラグラフモード」になり、
  # 実行環境によらず末尾の連続する改行コード("\r\n", "\n")をすべて取り除きます。
  # 
  # @return chomp! は通常 self を返しますが、取り除く改行がなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # buf = "string\n"
  # buf.chomp!  # => nil
  # p buf       # => "string"
  # 
  # $/ = "\n"   # デフォルトと同じ
  # p "foo\r".chomp!    # => "foo"
  # p "foo\r\n".chomp!  # => "foo"
  # p "foo\n".chomp!    # => "foo"
  # p "foo\n\r".chomp!  # => "foo\n"
  # 
  # buf = "string\n"
  # buf.chomp!(nil)  # => nil
  # p buf            # => "string\n"
  # 
  # p "foo\r\n\n".chomp!("")  # => "foo"
  # p "foo\n\r\n".chomp!("")  # => "foo"
  # p "foo\n\r\r".chomp!("")  # => nil
  # //}
  # 
  # @see [[m:String#chomp]]
  # @see [[m:String#chop!]]
  # @see [[m:String#delete_suffix!]]
  def chomp!; end

  # --- chop -> String
  # 
  # 文字列の最後の文字を取り除いた新しい文字列を生成して返します。
  # ただし、文字列の終端が "\r\n" であればその 2 文字を取り除きます。
  # 
  # //emlist[例][ruby]{
  # p "string\n".chop    # => "string"
  # p "string\r\n".chop  # => "string"
  # p "string".chop      # => "strin"
  # p "strin".chop       # => "stri"
  # p "".chop            # => ""
  # //}
  # 
  # @see [[m:String#chomp]]
  # @see [[m:String#chop!]]
  # @see [[m:String#delete_suffix]]
  def chop; end

  # --- chop! -> self | nil
  # 
  # 文字列の最後の文字を取り除きます。
  # ただし、終端が "\r\n" であればその 2 文字を取り除きます。
  # 
  # @return chop! は self を変更して返しますが、取り除く文字がなかった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "string\r\n"
  # ret = str.chop!
  # ret                  # => "string"
  # str                  # => "string"
  # str.chop!            # => "strin"
  # "".chop!             # => nil
  # //}
  # 
  # @see [[m:String#chomp!]]
  # @see [[m:String#chop]]
  # @see [[m:String#delete_suffix!]]
  def chop!; end

  # --- chr -> String
  # 
  # self の最初の文字だけを含む文字列を返します。
  # 
  # //emlist[例][ruby]{
  # a = "abcde"
  # a.chr    #=> "a"
  # //}
  # 
  # Ruby 1.9 で IO#getc の戻り値が Integer から String を返すように変更になりました。
  # Ruby 1.8 以前と1.9以降の互換性を保つために  String#chr が存在します。
  # 
  # 例:
  #   # ruby 1.8 系では STDIN.getc が 116 を返すため Integer#chr が呼び出される
  #   $ echo test | ruby -e "p STDIN.getc.chr" # => "t"
  #   # ruby 1.9 系以降では STDIN.getc が "t" を返すため String#chr が呼び出される
  #   $ echo test | ruby -e "p STDIN.getc.chr" # => "t"
  # 
  # @see [[m:String#ord]], [[m:Integer#chr]]
  def chr; end

  # --- clear -> self
  # 
  # 文字列の内容を削除して空にします。
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # str = "abc"
  # str.clear
  # p str     # => ""
  # 
  # str = ""
  # str.clear
  # p str   # => ""
  # //}
  def clear; end

  # --- codepoints                      -> [Integer]
  # --- codepoints {|codepoint| block } -> self
  # 
  # 文字列の各コードポイントの配列を返します。(self.each_codepoint.to_a と同じです)
  # 
  # //emlist[例][ruby]{
  # #coding:UTF-8
  # "hello わーるど".codepoints
  # # => [104, 101, 108, 108, 111, 32, 12431, 12540, 12427, 12393]
  # //}
  # 
  # ブロックが指定された場合は [[m:String#each_codepoint]] と同じように動作します。
  # 
  # Ruby 2.6 までは deprecated の警告が出ますが、Ruby 2.7 で警告は削除されました。
  # 
  # @see [[m:String#each_codepoint]]
  def codepoints; end

  # --- count(*chars) -> Integer
  # 
  # chars で指定された文字が文字列 self にいくつあるか数えます。
  # 
  # 検索する文字を示す引数 chars の形式は [[man:tr(1)]] と同じです。
  # つまり、「"a-c"」は文字 a から c を意味し、
  # 「"^0-9"」のように文字列の先頭が「^」の場合は
  # 指定文字以外を意味します。
  # 
  # 文字「-」は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 同様に、「^」も文字列の先頭にあるときだけ否定の効果を発揮します。
  # また、「-」「^」「\」は
  # バックスラッシュ (「\」) によりエスケープできます。
  # 
  # 引数を複数指定した場合は、
  # すべての引数にマッチした文字だけを数えます。
  # 
  # @param chars    出現回数を数える文字のパターン
  # 
  # //emlist[例][ruby]{
  # p 'abcdefg'.count('c')               # => 1
  # p '123456789'.count('2378')          # => 4
  # p '123456789'.count('2-8', '^4-6')   # => 4
  # 
  # # ファイルの行数を数える
  # n_lines = File.open("foo").read.count("\n")
  # 
  # # ファイルの末尾に改行コードがない場合にも対処する
  # buf = File.open("foo").read
  # n_lines = buf.count("\n")
  # n_lines += 1 if /[^\n]\z/ =~ buf
  #            # if /\n\z/ !~ buf だと空ファイルを 1 行として数えてしまうのでダメ
  # //}
  def count; end

  # --- crypt(salt) -> String
  # 
  # self と salt から暗号化された文字列を生成して返します。
  # salt には英数字、ドット (「.」)、スラッシュ (「/」) から構成される、
  # 2 バイト以上の文字列を指定します。
  # 
  # 暗号化された文字列から暗号化前の文字列 (self) を求めることは一般に困難で、
  # self を知っている者のみが同じ暗号化された文字列を生成できます。
  # このことから self を知っているかどうかの認証に使うことが出来ます。
  # 
  # salt には、以下の様になるべくランダムな文字列を選ぶべきです。
  # 他にも [[ruby-list:29297]] などがあります。
  # 
  # 注意:
  # 
  #   * Ruby 2.6 から非推奨になったため、引き続き必要な場合は
  #     string-crypt gem の使用を検討してください。
  #   * crypt の処理は [[man:crypt(3)]] の実装に依存しています。
  #     従って、crypt で処理される内容の詳細や salt の与え方については、
  #     利用環境の [[man:crypt(3)]] 等を見て確認してください。
  #   * crypt の結果は利用環境が異なると変わる場合があります。
  #     crypt の結果を、異なる利用環境間で使用する場合には注意して下さい。
  #   * 典型的な DES を使用した [[man:crypt(3)]] の場合、
  #     self の最初の 8 バイト、salt の最初の 2 バイトだけが使用されます。
  # 
  # @param salt    文字列を暗号化するための鍵となる文字列。
  #              英数字・「.」・「/」のいずれかで構成される 2 バイト以上の文字列
  # 
  # //emlist[例][ruby]{
  # # パスワードの暗号化
  # salt = [rand(64),rand(64)].pack("C*").tr("\x00-\x3f","A-Za-z0-9./")
  # passwd.crypt(salt)
  # 
  # # UNIX のログイン認証
  # require 'etc'
  # 
  # def valid_login?(user, password)
  #   ent = Etc.getpwnam(user)
  #   password.crypt(ent.passwd) == ent.passwd
  # end
  # 
  # p valid_login?("taro", "password")   # => 真偽値が得られる
  # //}
  def crypt; end

  # --- delete(*strs) -> String
  # 
  # self から strs に含まれる文字を取り除いた文字列を生成して返します。
  # 
  # str の形式は [[man:tr(1)]] と同じです。
  # つまり、`a-c' は a から c を意味し、"^0-9" のように
  # 文字列の先頭が `^' の場合は指定文字以外を意味します。
  # 
  # 「-」は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 「^」も文字列の先頭にあるときだけ効果を発揮します。
  # また、「-」「^」「\」はバックスラッシュ (「\」)
  # によってエスケープできます。
  # 
  # なお、引数を複数指定した場合は、
  # すべての引数にマッチする文字だけが削除されます。
  # 
  # @param strs    削除する文字列を示す文字列 (のリスト)
  # 
  # //emlist[例][ruby]{
  # p "123456789".delete("2378")         #=> "14569"
  # p "123456789".delete("2-8", "^4-6")  #=> "14569"
  # //}
  # 
  # @see [[m:String#delete!]]
  def delete; end

  # --- delete!(*strs) -> self | nil
  # 
  # self から strs に含まれる文字を破壊的に取り除きます。
  # 
  # str の形式は [[man:tr(1)]] と同じです。
  # つまり、「a-c」は a から c を意味し、"^0-9" のように
  # 文字列の先頭が「^」の場合は指定文字以外を意味します。
  # 
  # 「-」は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 「^」も文字列先頭にあるときだけ否定の効果を発揮します。
  # また、「-」「^」「\」はバックスラッシュ (「\」)
  # によってエスケープできます。
  # 
  # なお、引数を複数指定した場合は、
  # すべての引数にマッチする文字だけが削除されます。
  # 
  # @return 通常は self を返しますが、何も変更が起こらなかった場合は nil を返します。
  # 
  # @param strs    削除する文字列を示す文字列 (のリスト)
  # 
  # //emlist[例][ruby]{
  # str = "123456789"
  # p str.delete!("2378")         #=> "14569"
  # p str                         #=> "14569"
  # 
  # str = "123456789"
  # p str.delete!("2-8", "^4-6")  #=> "14569"
  # p str                         #=> "14569"
  # 
  # str = "abc"
  # p str.delete!("2378")         #=> "nil"
  # p str                         #=> "abc"
  # //}
  # 
  # @see [[m:String#delete]]
  def delete!; end

  # --- delete_prefix(prefix) -> String
  # 文字列の先頭から prefix を削除した文字列のコピーを返します。
  # 
  # @param prefix 先頭から削除する文字列を指定します。
  # 
  # @return 文字列の先頭から prefix を削除した文字列のコピー
  # 
  # //emlist[][ruby]{
  # "hello".delete_prefix("hel") # => "lo"
  # "hello".delete_prefix("llo") # => "hello"
  # //}
  # 
  # @see [[m:String#delete_prefix!]]
  # @see [[m:String#delete_suffix]]
  # @see [[m:String#start_with?]]
  def delete_prefix; end

  # --- delete_prefix!(prefix) -> self | nil
  # self の先頭から破壊的に prefix を削除します。
  # 
  # @param prefix 先頭から削除する文字列を指定します。
  # 
  # @return 削除した場合は self、変化しなかった場合は nil
  # 
  # //emlist[][ruby]{
  # "hello".delete_prefix!("hel") # => "lo"
  # "hello".delete_prefix!("llo") # => nil
  # //}
  # 
  # @see [[m:String#delete_prefix]]
  # @see [[m:String#delete_suffix!]]
  # @see [[m:String#start_with?]]
  def delete_prefix!; end

  # --- delete_suffix(suffix) -> String
  # 文字列の末尾から suffix を削除した文字列のコピーを返します。
  # 
  # @param suffix 末尾から削除する文字列を指定します。
  # 
  # @return 文字列の末尾から suffix を削除した文字列のコピー
  # 
  # //emlist[][ruby]{
  # "hello".delete_suffix("llo") # => "he"
  # "hello".delete_suffix("hel") # => "hello"
  # //}
  # 
  # @see [[m:String#chomp]]
  # @see [[m:String#chop]]
  # @see [[m:String#delete_prefix]]
  # @see [[m:String#delete_suffix!]]
  # @see [[m:String#end_with?]]
  def delete_suffix; end

  # --- delete_suffix!(suffix) -> self | nil
  # self の末尾から破壊的に suffix を削除します。
  # 
  # @param suffix 末尾から削除する文字列を指定します。
  # 
  # @return 削除した場合は self、変化しなかった場合は nil
  # 
  # //emlist[][ruby]{
  # "hello".delete_suffix!("llo") # => "he"
  # "hello".delete_suffix!("hel") # => nil
  # //}
  # 
  # @see [[m:String#chomp!]]
  # @see [[m:String#chop!]]
  # @see [[m:String#delete_prefix!]]
  # @see [[m:String#delete_suffix]]
  # @see [[m:String#end_with?]]
  def delete_suffix!; end

  # --- downcase(*options) -> String
  # 
  # 全ての大文字を対応する小文字に置き換えた文字列を返します。
  # どの文字がどう置き換えられるかは、オプションの有無や文字列のエンコーディングに依存します。
  # 
  # @param options オプションの意味は以下の通りです。
  # 
  # : オプションなし
  #   完全な Unicode ケースマッピングに対応し、ほとんどの言語に適しています。(例外は以下の :turkic,
  #   :lithuanian オプションを参照)
  #   Unicode 標準の表 3-14 で説明されている、コンテキスト依存のケースマッピングは、現在サポートされていません。
  # 
  # : :ascii
  #   ASCII の範囲内のみ (A-Z, a-z) が影響します。
  #   このオプションは他のオプションと組み合わせることはできません。
  # 
  # : :turkic
  #   チュルク語族 (トルコ語、アゼルバイジャン語など) に適合した完全な Unicode ケースマッピングです。
  #   これはたとえば大文字の I は小文字のドットなしの i (ı) にマッピングされることを意味します。
  # 
  # : :lithuanian
  #   現在は、ただの完全な Unicode ケースマッピングです。
  #   将来、リトアニア語に対応した完全な Unicode ケースマッピングです。
  #   (上にアクセントがあっても小文字の i のドットを維持します。)
  # 
  # : :fold
  #   downcase と downcase! のみで使えます。
  #   Unicode ケースフォールディングは Unicode ケースマッピングより広範囲です。
  #   このオプションは今の所、他のオプションと組み合わせることはできません。
  #   (すなわち現在チュルク語族のバリアントはありません。)
  # 
  # ASCII のみの大文字小文字変換で有効ないくつかの仮定は、より一般的なケース変換では
  # 成り立たないことに注意してください。例えば、結果の長さは入力の長さと同じとは
  # 限りません (文字数でもバイト数でも)。ラウンドトリップできるという仮定も
  # 成り立ちません (例えば str.downcase == str.upcase.downcase)。
  # そして、Unicode 正規化 (すなわち [[m:String#unicode_normalize]]) はケース
  # マッピング操作で必ずしも維持されるとは限りません。
  # 
  # 現在 ASCII 以外のケースマッピング/フォールディングは、UTF-8, UTF-16BE/LE,
  # UTF-32BE/LE, ISO-8859-1~16 の String/Symbol でサポートされています。
  # 他のエンコーディングもサポートされる予定です。
  # 
  # 
  # //emlist[例][ruby]{
  # p "STRing?".downcase   # => "string?"
  # //}
  # @see [[m:String#downcase!]], [[m:String#upcase]], [[m:String#swapcase]], [[m:String#capitalize]]
  def downcase; end

  # --- downcase!(*options) -> self | nil
  # 
  # 全ての大文字を対応する小文字に破壊的に置き換えます。
  # どの文字がどう置き換えられるかは、オプションの有無や文字列のエンコーディングに依存します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # @return self を変更して返します。変更が無かった場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "STRing?"
  # str.downcase!
  # p str   # => "string?"
  # //}
  # 
  # @see [[m:String#downcase]], [[m:String#upcase!]], [[m:String#swapcase!]], [[m:String#capitalize!]]
  def downcase!; end

  # --- dump -> String
  # 
  # 文字列中の非表示文字をバックスラッシュ記法に置き換えた文字列を返します。
  # str == eval(str.dump) となることが保証されています。
  # 
  # //emlist[例][ruby]{
  # # p だとさらにバックスラッシュが増えて見にくいので puts している
  # puts "abc\r\n\f\x00\b10\\\"".dump   # => "abc\r\n\f\000\01010\\\""
  # //}
  # 
  # @see [[m:String#undump]]
  def dump; end

  # --- each_byte {|byte| ... } -> self
  # --- each_byte -> Enumerator
  # 
  # 文字列の各バイトに対して繰り返します。
  # 
  # //emlist[例][ruby]{
  # "str".each_byte do |byte|
  #   p byte
  # end
  #     # => 115
  #     # => 116
  #     # => 114
  # 
  # "あ".each_byte do |byte|
  #   p byte
  # end
  #     # => 227
  #     # => 129
  #     # => 130
  # //}
  # 
  # @see [[m:String#bytes]]
  def each_byte; end

  # --- each_char {|cstr| block } -> self
  # --- each_char -> Enumerator
  # 
  # 文字列の各文字に対して繰り返します。
  # 
  # たとえば、
  # //emlist[][ruby]{
  # "hello世界".each_char {|c| print c, ' ' }
  # //}
  # は次のように出力されます。
  #   h e l l o 世 界
  # 
  # @see [[m:String#chars]]
  def each_char; end

  # --- each_codepoint {|codepoint| block } -> self
  # --- each_codepoint -> Enumerator
  # 
  # 文字列の各コードポイントに対して繰り返します。
  # 
  # UTF-8/UTF-16(BE|LE)/UTF-32(BE|LE) 以外のエンコーディングに対しては
  # 各文字のバイナリ表現由来の値になります。
  # 
  # //emlist[例][ruby]{
  # #coding:UTF-8
  # "hello わーるど".each_codepoint.to_a
  # # => [104, 101, 108, 108, 111, 32, 12431, 12540, 12427, 12393]
  # "hello わーるど".encode('euc-jp').each_codepoint.to_a
  # # => [104, 101, 108, 108, 111, 32, 42223, 41404, 42219, 42185]
  # //}
  # 
  # @see [[m:String#codepoints]]
  def each_codepoint; end

  # --- each_grapheme_cluster {|grapheme_cluster| block } -> self
  # --- each_grapheme_cluster -> Enumerator
  # 
  # 文字列の書記素クラスタに対して繰り返します。
  # 
  # [[m:String#each_char]] と違って、
  # Unicode Standard Annex #29 ([[url:https://unicode.org/reports/tr29/]])
  # で定義された書記素クラスタに対して繰り返します。
  # 
  # //emlist[例][ruby]{
  # "a\u0300".each_char.to_a.size # => 2
  # "a\u0300".each_grapheme_cluster.to_a.size # => 1
  # //}
  # 
  # @see [[m:String#grapheme_clusters]]
  def each_grapheme_cluster; end

  # --- each_line(rs = $/, chomp: false) {|line| ... } -> self
  # --- each_line(rs = $/, chomp: false)  -> Enumerator
  # 
  # 文字列中の各行に対して繰り返します。
  # 行の区切りは rs に指定した文字列で、
  # そのデフォルト値は変数 [[m:$/]] の値です。
  # 各 line には区切りの文字列も含みます。
  # 
  # rs に nil を指定すると行区切りなしとみなします。
  # rs に空文字列 "" を指定すると「パラグラフモード」になり、
  # 改行コードが 2 つ以上連続するところで文字列を分割します
  # (つまり空行で分割します)。
  # 
  # @param rs    行末を示す文字列
  # @param chomp true を指定すると各行の末尾から rs を取り除きます。
  # 
  # //emlist[例][ruby]{
  # "aa\nbb\ncc\n".each_line do |line|
  #   p line
  # end
  #     # => "aa\n"
  #     # => "bb\n"
  #     # => "cc\n"
  # 
  # p "aa\nbb\ncc\n".lines.to_a   # => ["aa\n", "bb\n", "cc\n"]
  # p "aa\n".lines.to_a           # => ["aa\n"]
  # p "".lines.to_a               # => []
  # 
  # s = "aa\nbb\ncc\n"
  # p s.lines("\n").to_a #=> ["aa\n", "bb\n", "cc\n"]
  # p s.lines("bb").to_a #=> ["aa\nbb", "\ncc\n"]
  # //}
  # 
  # @see [[m:String#lines]]
  def each_line; end

  # --- empty? -> bool
  # 
  # 文字列が空 (つまり長さ 0) の時、真を返します。
  # 
  # //emlist[例][ruby]{
  # "hello".empty?   #=> false
  # " ".empty?       #=> false
  # "".empty?        #=> true
  # //}
  def empty?; end

  # --- encode(encoding, options = nil) -> String
  # --- encode(encoding, from_encoding, options = nil) -> String
  # --- encode(options = nil) -> String
  # 
  # self を指定したエンコーディングに変換した文字列を作成して返します。引数
  # を2つ与えた場合、第二引数は変換元のエンコーディングを意味します。さもな
  # くば self のエンコーディングが使われます。
  # 無引数の場合は、[[m:Encoding.default_internal]] が nil でなければそれが変換先のエンコーディングになり、かつ :invalid => :replace と :undef => :replace が指定されたと見なされ、nil ならば変換は行われません。
  # 
  # @param encoding       変換先のエンコーディングを表す文字列か [[c:Encoding]] オブジェクトを指定します。
  # @param from_encoding  変換元のエンコーディングを表す文字列か [[c:Encoding]] オブジェクトを指定します。
  # @param option         変換オプションをハッシュで与えます。
  # @return               変換された文字列
  # 
  # 変換オプション
  # 
  # : :invalid => nil
  #   変換元のエンコーディングにおいて不正なバイトがあった場合に、例外 [[c:Encoding::InvalidByteSequenceError]] を投げます。(デフォルト)
  # : :invalid => :replace
  #   変換元のエンコーディングにおいて不正なバイトがあった場合に、不正なバイトを置換文字で置き換えます。
  # : :undef => nil
  #   変換先のエンコーディングにおいて文字が定義されていない場合に、例外 [[c:Encoding::UndefinedConversionError]] を投げます。(デフォルト)
  # : :undef => :replace
  #   変換先のエンコーディングにおいて文字が定義されていない場合に、未定義文字を置換文字で置き換えます。
  # : :replace => string
  #   前述の :invalid => :replace や :undef => :replace で用いられる置換文字を指定します。デフォルトは Unicode 系のエンコーディングならば U+FFFD、それ以外では "?" です。
  # : :fallback => Hash | Proc | Method
  #   未定義の文字に対する置換文字を設定します。このオプションに与えられるオブジェクトは [[c:Hash]], [[c:Proc]], [[c:Method]] のいずれかまたは [] メソッドを持つオブジェクトです。
  #   キーは現在のトランスコーダのソースエンコーディングで未定義の文字です。値は、変換先のエンコーディングでの変換後の文字です。
  # : :xml => :text
  #   文字列を XML の CharData として適するように処理します。具体的には、'&'、'<'、'>'、をそれぞれ '&amp;'、'&lt;'、'&gt;' に変換し、未定義文字を文字参照 (大文字16進数) に置き換えます。この出力は HTML の #PCDATA として利用することもできます。
  # : :xml => :attr
  #   文字列を XML の AttValue として適するように処理します。具体的には、'&'、'<'、'>'、'"'、をそれぞれ '&amp;'、'&lt;'、'&gt;'、'&quot;' に変換し、未定義文字を文字参照 (大文字16進数) に置き換えます。この出力は HTML の属性値として利用することもできます。
  # : :universal_newline => true
  #   CR 改行および CRLF 改行を LF 改行に置き換えます。
  # : :cr_newline => true
  #   LF 改行を CR 改行に置き換えます。(CRLF は CRCR になります)
  # : :crlf_newline => true
  #   LF 改行を CRLF 改行に置き換えます。(CRLF は CRCRLF になります)
  # 
  # これ以上細かい指定を行いたい場合は、[[m:Encoding::Converter#convert]] を用いましょう。
  # 
  # //emlist[例][ruby]{
  # #coding:UTF-8
  # s = "いろは"
  # s.encode("EUC-JP")
  # s.encode(Encoding::UTF_8)
  # 
  # # U+00B7 MIDDLE DOT, U+2014 EM DASH は対応する文字が Windows-31J には
  # # 存在しないのでそのまま変換しようとすると Encoding::UndefinedConversionError が発生する
  # str = "\u00b7\u2014"
  # str.encode("Windows-31J", fallback: { "\u00b7" => "\xA5".force_encoding("Windows-31J"),
  #                                       "\u2014" => "\x81\x5C".force_encoding("Windows-31J") })
  # //}
  # 
  # @see [[m:String#encode!]]
  def encode; end

  # --- encode!(encoding, options = nil)                -> self
  # --- encode!(encoding, from_encoding, options = nil) -> self
  # 
  # self を指定したエンコーディングに変換し、自身を置き換えます。引数を2つ
  # 与えた場合、第二引数は変換元のエンコーディングを意味します。さもなくば
  # self のエンコーディングが使われます。変換後の self を返します。
  # 
  # (gsub!などと異なり)変換が行なわれなくても self を返します。
  # 
  # @param encoding       変換先のエンコーディングを表す文字列か Encoding オブジェクトを指定します。
  # @param from_encoding  変換元のエンコーディングを表す文字列か Encoding オブジェクトを指定します。
  # @return               変換後のself
  # 
  # //emlist[例][ruby]{
  # #coding:UTF-8
  # s = "いろは"
  # s.encode!("EUC-JP")
  # s.encode!(Encoding::UTF_8)
  # //}
  # 
  # @see [[m:String#encode]]
  def encode!; end

  # --- encoding   -> Encoding
  # 
  # 文字列のエンコーディング情報を表現した Encoding オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # # encoding: utf-8
  # utf8_str = "test"
  # euc_str = utf8_str.encode("EUC-JP")
  # utf8_str.encoding   # => #<Encoding:UTF-8>
  # euc_str.encoding    # => #<Encoding:EUC-JP>
  # //}
  # 
  # @see [[c:Encoding]]
  def encoding; end

  # --- end_with?(*strs) -> bool
  # 
  # self の末尾が strs のいずれかであるとき true を返します。
  # 
  # @param strs    パターンを表す文字列 (のリスト)
  # 
  # //emlist[例][ruby]{
  # "string".end_with?("ing")          # => true
  # "string".end_with?("str")          # => false
  # "string".end_with?("str", "ing")   # => true
  # //}
  # 
  # @see [[m:String#start_with?]]
  # @see [[m:String#delete_suffix]], [[m:String#delete_suffix!]]
  def end_with?; end

  # --- eql?(other) -> bool
  # 
  # 文字列の内容が文字列 other の内容と等しいときに true を返します。
  # 等しくなければ false を返します。
  # 
  # このメソッドは文字列の内容を比較します。
  # 同一のオブジェクトかどうかを比較するわけではありません。
  # つまり、"string".eql?(str) という式を実行した場合には、
  # str が "string" という内容の文字列でありさえすれば常に true を返します。
  # 同一のオブジェクトであるかどうかを判定したいときは
  # [[m:Object#equal?]] を使ってください。
  # 
  # アルファベットの大文字小文字を無視して比較したい場合は
  # [[m:String#casecmp?]] を使ってください。
  # 
  # [[c:Hash]] クラス内での比較に使われます。
  # 
  # @param other    任意のオブジェクト
  # @return         true か false
  # 
  # //emlist[例][ruby]{
  # p "string".eql?("string")  # => true
  # p "string".eql?("STRING")  # => false
  # p "string".eql?("")        # => false
  # p "".eql?("string")        # => false
  # 
  # p "string".eql?("str" + "ing")   # => true   (内容が同じなら true)
  # p "string".eql?("stringX".chop)  # => true   (内容が同じなら true)
  # //}
  # 
  # @see [[c:Hash]], [[m:String#<=>]], [[m:String#casecmp]], [[m:String#==]]
  def eql?; end

  # --- ext(newext = '') -> String
  # 
  # 自身の拡張子を与えられた拡張子で置き換えます。
  # 
  # 自身に拡張子が無い場合は、与えられた拡張子を追加します。
  # 与えられた拡張子が空文字列の場合は、自身の拡張子を削除します。
  # 
  # @param newext 新しい拡張子を指定します。
  # 
  # 例:
  #   require "rake"
  # 
  #   "hoge".ext(".rb")          # => "hoge.rb"
  #   "hoge.rb".ext(".erb")      # => "hoge.erb"
  #   "hoge.tar.gz".ext(".bz2")  # => "hoge.tar.bz2"
  def ext; end

  # --- force_encoding(encoding)   -> self
  # 
  # 文字列の持つエンコーディング情報を指定された encoding に変えます。
  # 
  # このとき実際のエンコーディングは変換されず、検査もされません。
  # [[m:Array#pack]] などで得られたバイト列のエンコーディングを指定する時に使います。
  # 
  # @param encoding   変更するエンコーディング情報を表す文字列か Encoding オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # s = [164, 164, 164, 237, 164, 207].pack("C*")
  # p s.encoding                                  #=> ASCII-8BIT
  # p s.force_encoding("EUC-JP")                  #=> "いろは"
  # p s.force_encoding(Encoding::EUC_JP)          #=> "いろは"
  # 
  # u = [12411, 12408, 12392].pack("U*")
  # u.force_encoding("UTF-8")                     #=> "ほへと"
  # u.force_encoding(Encoding::UTF_8)             #=> "ほへと"
  # //}
  def force_encoding; end

  # --- getbyte(index) -> Integer | nil
  # 
  # index バイト目のバイトを整数で返します。
  # 
  # index に負を指定すると末尾から数えた位置のバイト
  # を取り出します。
  # 範囲外を指定した場合は nil を返します。
  # 
  # @param index バイトを取り出す位置
  # 
  # //emlist[例][ruby]{
  # s = "tester"
  # s.bytes             # => [116, 101, 115, 116, 101, 114]
  # s.getbyte(0)        # => 116
  # s.getbyte(1)        # => 101
  # s.getbyte(-1)       # => 114
  # s.getbyte(6)        # => nil
  # //}
  def getbyte; end

  # --- grapheme_clusters                             -> [String]
  # --- grapheme_clusters {|grapheme_cluster| block } -> self
  # 
  # 文字列の書記素クラスタの配列を返します。(self.each_grapheme_cluster.to_a と同じです)
  # 
  # //emlist[例][ruby]{
  # "a\u0300".grapheme_clusters # => ["à"]
  # //}
  # 
  # ブロックが指定された場合は [[m:String#each_grapheme_cluster]] と同じように動作します。
  # 
  # Ruby 2.6 までは deprecated の警告が出ますが、Ruby 2.7 で警告は削除されました。
  # 
  # @see [[m:String#each_grapheme_cluster]]
  def grapheme_clusters; end

  # --- gsub(pattern, replace) -> String
  # 
  # 文字列中で pattern にマッチする部分全てを
  # 文字列 replace で置き換えた文字列を生成して返します。
  # 
  # 置換文字列 replace 中の \& と \0 はマッチした部分文字列に、
  # \1 ... \9 は n 番目の括弧の内容に置き換えられます。
  # 置換文字列内では \`、\'、\+ も使えます。
  # これらは [[m:$`]]、[[m:$']]、[[m:$+]] に対応します。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # 
  # //emlist[例][ruby]{
  # p 'abcdefg'.gsub(/def/, '!!')          # => "abc!!g"
  # p 'abcabc'.gsub(/b/, '<<\&>>')         # => "a<<b>>ca<<b>>c"
  # p 'xxbbxbb'.gsub(/x+(b+)/, 'X<<\1>>')  # => "X<<bb>>X<<bb>>"
  # p '2.5'.gsub('.', ',') # => "2,5"
  # //}
  # 
  # 注意:
  # 
  # 第 2 引数 replace に [[m:$1]] を埋め込んでも意図した結果にはなりません。
  # この文字列が評価される時点ではまだ正規表現マッチが行われておらず、
  # $1 がセットされていないからです。
  # 
  # また、gsub では「\」が部分文字列との置き換えという特別な意味を持つため、
  # replace に「\」自身を入れたいときは
  # 「\」を二重にエスケープしなければなりません。
  # 
  # //emlist[ひとつめの括弧の内容に置き換えるときによくある間違い][ruby]{
  # p 'xbbb-xbbb'.gsub(/x(b+)/, "#{$1}")   # => "-"        # NG
  # p 'xbbb-xbbb'.gsub(/x(b+)/, "\1")      # => "1-1"      # NG
  # p 'xbbb-xbbb'.gsub(/x(b+)/, "\\1")     # => "bbb-bbb"  # OK
  # p 'xbbb-xbbb'.gsub(/x(b+)/, '\1')      # => "bbb-bbb"  # OK
  # p 'xbbb-xbbb'.gsub(/x(b+)/, '\\1')     # => "bbb-bbb"  # OK
  # //}
  # 
  # //emlist[バックスラッシュを倍にするときによくある間違い][ruby]{
  # puts '\n'.gsub(/\\/, "\\\\")      # => \n   # NG
  # puts '\n'.gsub(/\\/, '\\\\')      # => \n   # NG
  # puts '\n'.gsub(/\\/, "\\\\\\\\")  # => \\n  # OK
  # puts '\n'.gsub(/\\/, '\\\\\\\\')  # => \\n  # OK
  # //}
  # 
  # このような間違いを確実に防止し、コードの可読性を上げるには、
  # \& や \1 よりも下記のようにブロック付き形式の gsub を使うべきです。
  # 
  # //emlist[][ruby]{
  # p 'xbbb-xbbb'.gsub(/x(b+)/) { $1 }   # => "bbb-bbb"  # OK
  # 
  # puts '\n'.gsub(/\\/) { '\\\\' }      # => \\n        # OK
  # //}
  # 
  # @see [[m:String#sub]]
  # 
  # --- gsub(pattern) {|matched| .... } -> String
  # --- gsub(pattern) -> Enumerator
  # 
  # 文字列中で pattern にマッチした部分を順番にブロックに渡し、
  # その実行結果で置き換えた文字列を生成して返します。
  # ブロックなしの場合と違い、ブロックの中からは
  # 組み込み変数 [[m:$1]], $2, $3, ... を問題なく参照できます。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @return 新しい文字列
  # 
  # //emlist[例][ruby]{
  # p 'abcabc'.gsub(/[bc]/) {|s| s.upcase }  #=> "aBCaBC"
  # p 'abcabc'.gsub(/[bc]/) { $&.upcase }    #=> "aBCaBC"
  # //}
  # 
  # @see [[m:String#sub]], [[m:String#scan]]
  # 
  # --- gsub(pattern, hash) -> String
  # 
  # 文字列中の pattern にマッチした部分をキーにして hash を引いた値で置き換えます。
  # 
  # @param pattern    置き換える文字列のパターン
  # @param hash       置き換える文字列を与えるハッシュ
  # 
  # //emlist[例][ruby]{
  # hash = {'b'=>'B', 'c'=>'C'}
  # p "abcabc".gsub(/[bc]/){hash[$&]} #=> "aBCaBC"
  # p "abcabc".gsub(/[bc]/, hash)     #=> "aBCaBC"
  # //}
  def gsub; end

  # --- gsub!(pattern, replace) -> self | nil
  # 
  # 文字列中で pattern にマッチする部分全てを文字列 replace に破壊的に置き換えます。
  # 
  # 置換文字列 replace 中の \& と \0 はマッチした部分文字列に、
  # \1 ... \9 は n 番目の括弧の内容に置き換えられます。
  # 置換文字列内では \`、\'、\+ も使えます。
  # これらは [[m:$`]]、[[m:$']]、[[m:$+]] に対応します。
  # 
  # gsub! は通常 self を変更して返しますが、
  # 置換が起こらなかった場合は nil を返します。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # @return 置換した場合は self、置換しなかった場合は nil
  # 
  # //emlist[例][ruby]{
  # buf = "String-String"
  # buf.gsub!(/in./, "!!")
  # p buf   # => "Str!!-Str!!"
  # 
  # buf = "String.String"
  # buf.gsub!(/in./, '<<\&>>')
  # p buf   # => "Str<<ing>>-Str<<ing>>"
  # //}
  # 
  # 注意:
  # 
  # 引数 replace の中で [[m:$1]] を使うことはできません。
  # replace は gsub メソッドの呼び出しより先に評価されるので、
  # まだ gsub の正規表現マッチが行われておらず、
  # $1 がセットされていないからです。
  # 
  # また、gsub では「\」が部分文字列との置き換えという特別な意味を持つため、
  # replace に「\」自身を入れたいときは
  # 「\」を二重にエスケープしなければなりません。
  # 
  # //emlist[ひとつめの括弧にマッチした部分に置き換えるときによくやる間違い][ruby]{
  # 'abbbcd'.gsub!(/a(b+)/, "#{$1}")       # NG
  # 'abbbcd'.gsub!(/a(b+)/, "\1")          # NG
  # 'abbbcd'.gsub!(/a(b+)/, "\\1")         # OK
  # 'abbbcd'.gsub!(/a(b+)/, '\\1')         # OK
  # 'abbbcd'.gsub!(/a(b+)/, '\1')          # OK
  # 'abbbcd'.gsub!(/a(b+)/) { $1 }         # OK   これがもっとも安全
  # //}
  # 
  # @see [[m:String#sub]]
  # 
  # --- gsub!(pattern) {|matched| .... } -> self | nil
  # --- gsub!(pattern) -> Enumerator
  # 
  # 文字列中で pattern にマッチする部分全てを順番にブロックに渡し、
  # その評価結果に置き換えます。
  # 
  # また、ブロックなしの場合と違い、ブロックの中からは
  # 組み込み変数 [[m:$1]], $2, $3, ... を問題なく参照できます。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @return 置換した場合は self、置換しなかった場合は nil
  # 
  # //emlist[例][ruby]{
  # str = 'abcabc'
  # str.gsub!(/b/) {|s| s.upcase }
  # p str    #=> "aBcaBc"
  # 
  # str = 'abcabc'
  # str.gsub!(/b/) { $&.upcase }
  # p str    #=> "aBcaBc"
  # //}
  # 
  # @see [[m:String#sub]]
  # 
  # --- gsub!(pattern, hash) -> self | nil
  # 
  # 文字列中の pattern にマッチした部分をキーにして hash を引いた値へ破壊的に置き換えます。
  # 
  # @param pattern    置き換える文字列のパターン
  # @param hash       置き換える文字列を与えるハッシュ
  # 
  # //emlist[例][ruby]{
  # hash = {'b'=>'B', 'c'=>'C'}
  # str = "abcabc"
  # str.gsub!(/[bc]/){hash[$&]}
  # p str     #=> "aBCaBC"
  # 
  # str = "abcabc"
  # str.gsub!(/[bc]/, hash)
  # p str     #=> "aBCaBC"
  # //}
  def gsub!; end

  # --- hash -> Integer
  # 
  # self のハッシュ値を返します。
  # eql? で等しい文字列は、常にハッシュ値も等しくなります。
  # 
  # //emlist[例][ruby]{
  # "test".hash                        # => 4038258770210371295
  # ("te" + "st").hash == "test".hash  # => true
  # //}
  # 
  # @see [[c:Hash]]
  def hash; end

  # --- hex -> Integer
  # 
  # 文字列に 16 進数で数値が表現されていると解釈して整数に変換します。
  # 接頭辞 "0x", "0X" とアンダースコアは無視されます。
  # 文字列が [_0-9a-fA-F] 以外の文字を含むときはその文字以降を無視します。
  # 
  # self が空文字列のときは 0 を返します。
  # 
  # //emlist[例][ruby]{
  # p "10".hex    # => 16
  # p "ff".hex    # => 255
  # p "0x10".hex  # => 16
  # p "-0x10".hex # => -16
  # 
  # p "xyz".hex   # => 0
  # p "10z".hex   # => 16
  # p "1_0".hex   # => 16
  # 
  # p "".hex      # => 0
  # //}
  # 
  # @see [[m:String#oct]], [[m:String#to_i]], [[m:String#to_f]],
  #      [[m:Kernel.#Integer]], [[m:Kernel.#Float]]
  # 
  # このメソッドの逆に数値を文字列に変換するには
  # [[m:Kernel.#sprintf]], [[m:String#%]],
  # [[m:Integer#to_s]]
  # などを使ってください。
  def hex; end

  # --- include?(substr) -> bool
  # 
  # 文字列中に部分文字列 substr が含まれていれば真を返します。
  # 
  # @param substr    検索する文字列
  # 
  # //emlist[例][ruby]{
  # "hello".include? "lo"   #=> true
  # "hello".include? "ol"   #=> false
  # "hello".include? ?h     #=> true
  # //}
  def include?; end

  # --- index(pattern, pos = 0) -> Integer | nil
  # 
  # 文字列のインデックス pos から右に向かって pattern を検索し、
  # 最初に見つかった部分文字列の左端のインデックスを返します。
  # 見つからなければ nil を返します。
  # 
  # 引数 pattern は探索する部分文字列または正規表現で指定します。
  # 
  # pos が負の場合、文字列の末尾から数えた位置から探索します。
  # 
  # @param pattern    探索する部分文字列または正規表現
  # @param pos        探索を開始するインデックス
  # 
  # //emlist[例][ruby]{
  # p "astrochemistry".index("str")         # => 1
  # p "regexpindex".index(/e.*x/, 2)        # => 3
  # p "character".index(?c)                 # => 0
  # 
  # p "foobarfoobar".index("bar", 6)        # => 9
  # p "foobarfoobar".index("bar", -6)       # => 9
  # //}
  # 
  # @see [[m:String#rindex]]
  def index; end

  # --- insert(pos, other) -> self
  # 
  # pos 番目の文字の直前に文字列 other を挿入します。
  # self[pos, 0] = other と同じ操作です。
  # 
  # @param pos      文字列を挿入するインデックス
  # @param other    挿入する文字列
  # 
  # //emlist[例][ruby]{
  # str = "foobaz"
  # str.insert(3, "bar")
  # p str   # => "foobarbaz"
  # //}
  # 
  # @see [[m:String#[]=]]
  def insert; end

  # --- inspect -> String
  # 
  # 文字列オブジェクトの内容を、出力したときに人間が読みやすいような適当な形式に変換します。
  # 変換された文字列は印字可能な文字のみによって構成されます
  # 
  # 現在の実装では、Ruby のリテラル形式を使って、
  # 文字列中の不可視文字をエスケープシーケンスに変換します。
  # 
  # このメソッドは主にデバッグのために用意されています。
  # 永続化などの目的で文字列をダンプしたいときは、
  # [[m:String#dump]] を使うべきです。
  # 
  # //emlist[例][ruby]{
  # # p ではないことに注意
  # puts "string".inspect    # => "string"
  # puts "\t\r\n".inspect    # => "\t\r\n"
  # //}
  # 
  # @see [[m:String#dump]]
  def inspect; end

  # --- intern -> Symbol
  # --- to_sym -> Symbol
  # 
  # 文字列に対応するシンボル値 [[c:Symbol]] を返します。
  # 
  # なお、このメソッドの逆にシンボルに対応する文字列を得るには
  # [[m:Symbol#to_s]] または [[m:Symbol#id2name]] を使います。
  # 
  # シンボル文字列にはヌルキャラクタ("\0")、空の文字列の使用も可能です。
  # 
  # //emlist[例][ruby]{
  # p "foo".intern                 # => :foo
  # p "foo".intern.to_s == "foo"   # => true
  # //}
  def intern; end

  # --- iseuc -> bool
  # 
  # self が EUC-JP なバイト列として正当であるかどうかを判定します。
  # 
  # [[m:Kconv.#iseuc]](self) と同じです。
  # 
  # 例:
  #   require 'kconv'
  # 
  #   euc_str = "\
  #   \xa5\xaa\xa5\xd6\xa5\xb8\xa5\xa7\xa5\xaf\xa5\xc8\xbb\xd8\xb8\xfe\
  #   \xa5\xd7\xa5\xed\xa5\xb0\xa5\xe9\xa5\xdf\xa5\xf3\xa5\xb0\xb8\xc0\xb8\xec\
  #   \x52\x75\x62\x79".force_encoding('EUC-JP')
  # 
  #   sjis_str = "\
  #   \x83\x49\x83\x75\x83\x57\x83\x46\x83\x4e\x83\x67\x8e\x77\x8c\xfc\
  #   \x83\x76\x83\x8d\x83\x4f\x83\x89\x83\x7e\x83\x93\x83\x4f\x8c\xbe\x8c\xea\
  #   \x52\x75\x62\x79".force_encoding('Shift_JIS')
  # 
  #   euc_str.iseuc  # => true
  #   sjis_str.iseuc # => false
  def iseuc; end

  # --- isjis -> bool
  # 
  # self が ISO-2022-JP なバイト列として正当であるかどうかを判定します。
  # 
  # Kconv.isjis(self) と同じです。
  def isjis; end

  # --- issjis -> bool
  # 
  # self が Shift_JIS なバイト列として正当であるかどうかを判定します。
  # 
  # 
  # [[m:Kconv.#issjis]] と同じです。
  def issjis; end

  # --- isutf8 -> bool
  # 
  # self が UTF-8 なバイト列として正当であるかどうかを判定します。
  # 
  # [[m:Kconv.#isutf8]](self) と同じです。
  def isutf8; end

  # --- kconv(out_code, in_code = Kconv::AUTO) -> String
  # 
  # self のエンコーディングを out_code に変換した文字列を
  # 返します。
  # out_code in_code は [[c:Kconv]] の定数で指定します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]] を使ってください。
  # 
  # @param out_code 変換後のエンコーディングを [[c:Kconv]] の定数で指定します。
  # @param in_code 変換する文字列のエンコーディングを [[c:Kconv]] の定数で指定します。
  # 
  # @see [[m:Kconv.#kconv]]
  def kconv; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # 文字列の文字数を返します。バイト数を知りたいときは bytesize メソッドを使ってください。
  # 
  # //emlist[例][ruby]{
  # "test".length          # => 4
  # "test".size            # => 4
  # "テスト".length         # => 3
  # "テスト".size           # => 3
  # "\x80\u3042".length    # => 2
  # "\x80\u3042".size      # => 2
  # //}
  # 
  # @see [[m:String#bytesize]]
  def length; end

  # --- lines(rs = $/, chomp: false)               -> [String]
  # --- lines(rs = $/, chomp: false) {|line| ... } -> self
  # 
  # 文字列中の各行を文字列の配列で返します。(self.each_line.to_a と同じです)
  # 
  # //emlist[][ruby]{
  # "aa\nbb\ncc\n".lines # => ["aa\n", "bb\n", "cc\n"]
  # //}
  # 
  # 行の区切りは rs に指定した文字列で、 そのデフォルト値は変数 $/ の値です。
  # 各 line には区切りの文字列も含みます。
  # 
  # rs に nil を指定すると行区切りなしとみなします。 rs に空文字列 "" を指
  # 定すると「パラグラフモード」になり、 改行コードが 2 つ以上連続するとこ
  # ろで文字列を分割します (つまり空行で分割します)。
  # 
  # chomp に true を指定すると、分割した各行の末尾から rs を取り除きます。
  # 
  # //emlist[][ruby]{
  # "hello\nworld\n".lines              # => ["hello\n", "world\n"]
  # "hello\nworld\n".lines(chomp: true) # => ["hello", "world"]
  # //}
  # 
  # @param rs 行末を示す文字列
  # 
  # @param chomp 分割した各行に対して [[m:String#chomp]] と同等の結果を得
  #              る場合は true を、そうでない場合は false で指定します。
  #              省略した場合は false を指定したとみなされます。
  # 
  # ブロックが指定された場合は [[m:String#each_line]] と同じように動作します。
  # 
  # Ruby 2.6 までは deprecated の警告が出ますが、Ruby 2.7 で警告は削除されました。
  # 
  # @see [[m:String#each_line]]
  def lines; end

  # --- ljust(width, padding = ' ') -> String
  # 
  # 長さ width の文字列に self を左詰めした文字列を返します。
  # self の長さが width より長い時には元の文字列の複製を返します。
  # また、第 2 引数 padding を指定したときは
  # 空白文字の代わりに padding を詰めます。
  # 
  # @param width      返り値の文字列の最小の長さ
  # @param padding    長さが width になるまで self の右側に詰める文字
  # 
  # //emlist[例][ruby]{
  # p "foo".ljust(10)        # => "foo       "
  # p "foo".ljust(9)         # => "foo      "
  # p "foo".ljust(8)         # => "foo     "
  # p "foo".ljust(2)         # => "foo"
  # p "foo".ljust(1)         # => "foo"
  # p "foo".ljust(10, "*")   # => "foo*******"
  # //}
  # 
  # @see [[m:String#center]], [[m:String#rjust]]
  def ljust; end

  # --- lstrip -> String
  # 
  # 文字列の先頭にある空白文字を全て取り除いた新しい文字列を返します。
  # 空白文字の定義は " \t\r\n\f\v" です。
  # 
  # //emlist[例][ruby]{
  # p "  abc\n".lstrip     #=> "abc\n"
  # p "\t abc\n".lstrip    #=> "abc\n"
  # p "abc\n".lstrip       #=> "abc\n"
  # //}
  # 
  # @see [[m:String#strip]], [[m:String#rstrip]]
  def lstrip; end

  # --- lstrip! -> self | nil
  # 
  # 文字列の先頭にある空白文字を全て破壊的に取り除きます。
  # 空白文字の定義は " \t\r\n\f\v" です。
  # 
  # lstrip! は self を変更して返します。
  # ただし取り除く空白がなかったときは nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "  abc"
  # p str.lstrip!   # => "abc"
  # p str           # => "abc"
  # 
  # str = "abc"
  # p str.lstrip!   # => nil
  # p str           # => "abc"
  # //}
  def lstrip!; end

  # --- match(regexp, pos = 0) -> MatchData | nil
  # --- match(regexp, pos = 0) {|m| ... } -> object
  # 
  # regexp.match(self, pos) と同じです。
  # regexp が文字列の場合は、正規表現にコンパイルします。
  # 詳しくは [[m:Regexp#match]] を参照してください。
  # 
  # //emlist[例: regexp のみの場合][ruby]{
  # 'hello'.match('(.)\1')      # => #<MatchData "ll" 1:"l">
  # 'hello'.match('(.)\1')[0]   # => "ll"
  # 'hello'.match(/(.)\1/)[0]   # => "ll"
  # 'hello'.match('xx')         # => nil
  # //}
  # 
  # //emlist[例: regexp, pos を指定した場合][ruby]{
  # 'hoge hige hege bar'.match('h.ge', 0)     # => #<MatchData "hoge">
  # 'hoge hige hege bar'.match('h.ge', 1)     # => #<MatchData "hige">
  # //}
  # 
  # //emlist[例: ブロックを指定した場合][ruby]{
  # 'hello'.match('(.)\1'){|e|"match #{$1}"}  # => "match l"
  # 'hello'.match('xx'){|e|"match #{$1}"}     # マッチしないためブロックは実行されない
  # //}
  # 
  # @see [[m:Regexp#match]], [[m:Symbol#match]]
  def match; end

  # --- match?(regexp, pos = 0) -> bool
  # 
  # regexp.match?(self, pos) と同じです。
  # regexp が文字列の場合は、正規表現にコンパイルします。
  # 詳しくは [[m:Regexp#match?]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # "Ruby".match?(/R.../)    #=> true
  # "Ruby".match?(/R.../, 1) #=> false
  # "Ruby".match?(/P.../)    #=> false
  # $&                       #=> nil
  # //}
  # 
  # @see [[m:Regexp#match?]], [[m:Symbol#match?]]
  def match?; end

  # --- succ -> String
  # --- next -> String
  # 
  # self の「次の」文字列を返します。
  # 
  # 「次の」文字列は、対象の文字列の右端から
  # アルファベットなら アルファベット順(aの次はb, zの次はa, 大文字も同様)に、
  # 数字なら 10 進数(9 の次は 0)とみなして計算されます。
  # 
  # //emlist[][ruby]{
  # p "aa".succ        # => "ab"
  # p "88".succ.succ   # => "90"
  # //}
  # 
  # "99" → "100", "AZZ" → "BAA" のような繰り上げも行われます。
  # このとき負符号などは考慮されません。
  # 
  # //emlist[][ruby]{
  # p "99".succ   # => "100"
  # p "ZZ".succ   # => "AAA"
  # p "a9".succ   # => "b0"
  # p "-9".succ   # => "-10"
  # //}
  # 
  # self にアルファベットや数字とそれ以外の文字が混在している場合、
  # アルファベットと数字だけが「次の」文字になり、残りは保存されます。
  # 
  # //emlist[][ruby]{
  # p "1.9.9".succ # => # "2.0.0"
  # //}
  # 
  # 逆に self がアルファベットや数字をまったく含まない場合は、
  # 単純に文字コードを 1 増やします。
  # 
  # //emlist[][ruby]{
  # p ".".succ     # => "/"
  # //}
  # 
  # さらに、self が空文字列の場合は "" を返します。
  # このメソッドはマルチバイト文字を意識せず、
  # 単に文字列をバイト列として扱います。
  # 
  # なお、succ と逆の動作をするメソッドはありません。
  # また、succ という名前の由来は successor です。
  # 
  # 
  # //emlist[例][ruby]{
  # p "aa".succ   # => "ab"
  # 
  # # 繰り上がり
  # p "99".succ   # => "100"
  # p "a9".succ   # => "b0"
  # p "Az".succ   # => "Ba"
  # p "zz".succ   # => "aaa"
  # p "-9".succ   # => "-10"
  # p "9".succ    # => "10"
  # p "09".succ   # => "10"
  # 
  # # アルファベット・数字とそれ以外の混在
  # p "1.9.9".succ # => # "2.0.0"
  # 
  # # アルファベット・数字以外のみ
  # p ".".succ     # => "/"
  # p "\0".succ    # => "\001"
  # p "\377".succ  # => "\001\000"
  # //}
  # 
  # このメソッドは文字列の [[c:Range]] の内部で使用されます。
  def next; end

  # --- succ! -> String
  # --- next! -> String
  # 
  # self を「次の」文字列に置き換えます。
  # 「次の」文字列は、アルファベットなら 16 進数、
  # 数字なら 10 進数とみなして計算されます。
  # 「次の」文字列の計算では "99" → "100" のように繰り上げも行われます。
  # このとき負符号などは考慮されません。
  # 
  # self にアルファベットや数字とそれ以外の文字が混在している場合、
  # アルファベットと数字だけが「次の」文字になり、残りは保存されます。
  # 逆に self がアルファベットや数字をまったく含まない場合は、
  # 単純に文字コードを 1 増やします。
  # 
  # さらに、self が空文字列の場合は "" を返します。
  # 
  # このメソッドはマルチバイト文字を意識せず、
  # 単に文字列をバイト列として扱います。
  # 
  # なお、succ! と逆の動作をするメソッドはありません。
  # 
  # //emlist[例][ruby]{
  # p "aa".succ   # => "ab"
  # 
  # # 繰り上がり
  # p "99".succ   # => "100"
  # p "a9".succ   # => "b0"
  # p "Az".succ   # => "Ba"
  # p "zz".succ   # => "aaa"
  # p "-9".succ   # => "-10"
  # p "9".succ    # => "10"
  # p "09".succ   # => "10"
  # 
  # # アルファベット・数字とそれ以外の混在
  # p "1.9.9".succ # => # "2.0.0"
  # 
  # # アルファベット・数字以外のみ
  # p ".".succ     # => "/"
  # p "\0".succ    # => "\001"
  # p "\377".succ  # => "\001\000"
  # //}
  # 
  # @see [[m:String#succ]]
  def next!; end

  # --- oct -> Integer
  # 
  # 文字列を 8 進文字列であると解釈して、整数に変換します。
  # 
  # //emlist[例][ruby]{
  # p "10".oct  # => 8
  # p "010".oct # => 8
  # p "8".oct   # => 0
  # //}
  # 
  # oct は文字列の接頭辞 ("0", "0b", "0B", "0x", "0X") に応じて
  # 8 進以外の変換も行います。
  # 
  # //emlist[例][ruby]{
  # p "0b10".oct  # => 2
  # p "10".oct    # => 8
  # p "010".oct   # => 8
  # p "0x10".oct  # => 16
  # //}
  # 
  # 整数とみなせない文字があればそこまでを変換対象とします。
  # 変換対象が空文字列であれば 0 を返します。
  # 
  # 符号や _ が含まれる場合も変換対象になります。
  # 
  # //emlist[例][ruby]{
  # p "-010".oct     # => -8
  # p "-0x10".oct    # => -16
  # p "-0b10".oct    # => -2
  # 
  # p "1_0_1x".oct   # => 65
  # //}
  # 
  # @see [[m:String#hex]], [[m:String#to_i]], [[m:String#to_f]],
  #      [[m:Kernel.#Integer]], [[m:Kernel.#Float]]
  # 
  # 逆に、数値を文字列に変換するには[[m:Kernel.#sprintf]],
  # [[m:String#%]], [[m:Integer#to_s]] を使用します。
  def oct; end

  # --- ord -> Integer
  # 
  # 文字列の最初の文字の文字コードを整数で返します。
  # 
  # self が空文字列のときは例外を発生します。
  # 
  # @return                 文字コードを表す整数
  # @raise ArgumentError    self の長さが 0 のとき発生
  # 
  # //emlist[例][ruby]{
  # p "a".ord   # => 97
  # //}
  # 
  # @see [[m:Integer#chr]], [[m:String#chr]]
  def ord; end

  # --- parse_csv(**options) -> [String]
  # 
  # CSV.parse_line(self, options) と同様です。
  # 
  # 1 行の CSV 文字列を、文字列の配列に変換するためのショートカットです。
  # 
  # @param options [[m:CSV.new]] と同様のオプションを指定します。
  # 
  # //emlist[][ruby]{
  # require "csv"
  # 
  # p "Matz,Ruby\n".parse_csv                                   # => ["Matz", "Ruby"]
  # p "Matz|Ruby\r\n".parse_csv(col_sep: '|', row_sep: "\r\n")  # => ["Matz", "Ruby"]
  # //}
  # 
  # Ruby 2.6 (CSV 3.0.2) から、次のオプションが使えるようになりました。
  # 
  # //emlist[][ruby]{
  # require 'csv'
  # 
  # p "1,,3\n".parse_csv                        # => ["1", nil, "3"]
  # p "1,,3\n".parse_csv(nil_value: Float::NAN) # => ["1", NaN, "3"]
  # //}
  # 
  # 
  # @see [[m:CSV.new]], [[c:CSV.parse_line]]
  def parse_csv; end

  # --- partition(sep) -> [String, String, String]
  # 
  # セパレータ sep が最初に登場する部分で self を 3 つに分割し、
  # [最初のセパレータより前の部分, セパレータ, それ以降の部分]
  # の 3 要素の配列を返します。
  # 
  # self がセパレータを含まないときは、
  # 返り値の第 2 要素と第 3 要素が空文字列になります。
  # 
  # @param sep    セパレータを表す文字列か正規表現を指定します。
  # 
  # //emlist[例][ruby]{
  # p "axaxa".partition("x")   # => ["a", "x", "axa"]
  # p "aaaaa".partition("x")   # => ["aaaaa", "", ""]
  # p "aaaaa".partition("")    # => ["", "", "aaaaa"]
  # //}
  # 
  # @see [[m:String#rpartition]], [[m:String#split]]
  def partition; end

  # --- pathmap(spec = nil){ ... } -> String
  # 
  # 与えられた書式指定文字列に応じてパス(自身)を変換します。
  # 
  # 与えられた書式指定文字列は変換の詳細を制御します。
  # 指定できる書式指定文字列は以下の通りです。
  # 
  # : %p
  #   完全なパスを表します。
  # : %f
  #   拡張子付きのファイル名を表します。ディレクトリ名は含まれません。
  # : %n
  #   拡張子なしのファイル名を表します。
  # : %d
  #   パスに含まれるディレクトリのリストを表します。
  # : %x
  #   パスに含まれるファイルの拡張子を表します。拡張子が無い場合は空文字列を表します。
  # : %X
  #   拡張子以外すべてを表します。
  # : %s
  #   定義されていれば、代替のファイルセパレータを表します。
  #   定義されてい無い場合は、標準のファイルセパレータを表します。
  # : %%
  #   パーセント自身を表します。
  # 
  # 
  # %d は数値のプレフィクスを取ることができます。
  # 
  # 例:
  #    'a/b/c/d/file.txt'.pathmap("%2d")  # => 'a/b'
  #    'a/b/c/d/file.txt'.pathmap("%-2d") # => 'c/d'
  # 
  # また、%d, %p, %f, %n, %x, %X には単純な文字列置換を行うための
  # 置換パターンを表すパラメータを指定することが出来ます。
  # パターンと置換文字列はコンマで区切り全体を中括弧でくくります。
  # 置換指定は、% と指示子の間に置きます。(例: "%{old,new}d")
  # 複数の置換を行う場合はパターンをセミコロンで区切ってください。
  # (例: "%{old,new;src,bin}d")
  # 
  # 正規表現や後方参照をパターンとして使用することがあるかもしれません。
  # 中括弧、コンマ、セミコロンはパターンと置換文字列に使用しないでください。
  # 
  # 例:
  #     "src/org/onestepback/proj/A.java".pathmap("%{^src,bin}X.class")
  #     #=> "bin/org/onestepback/proj/A.class"
  # 
  # 置換文字列に '*' を指定した場合は、置換文字列を計算するためにブロックを評価します。
  # 
  # 例:
  # 
  #    "/path/to/file.TXT".pathmap("%X%{.*,*}x") { |ext| ext.downcase }
  #    #=> "/path/to/file.txt"
  def pathmap; end

  # --- pathmap_explode -> Array
  # 
  # 自身をパスを表す部分ごとに分解して配列にして返します。
  # [[m:String#pathmap]] で利用される protected メソッドです。
  # 
  # @see [[m:String#pathmap]]
  def pathmap_explode; end

  # --- pathmap_partial(n) -> String
  # 
  # 自身から与えられた階層分パスを抜粋します。
  # 
  # 与えられた数値が正である場合は左から、負である場合は右から抜粋します。
  def pathmap_partial; end

  # --- pathmap_replace(patterns){ ... } -> String
  # 
  # 与えられたパスを前もって置き換えます。
  # 
  # @param patterns 'pat1,rep1;pat2,rep2;...' のような形式で置換パターンを指定します。
  def pathmap_replace; end

  # --- prepend(other_str) -> String
  # 文字列 other_str を先頭に破壊的に追加します。
  # 
  # @param other_str 追加したい文字列を指定します。
  # 
  # 例:
  #   a = "world"
  #   a.prepend("hello ") # => "hello world"
  #   a                   # => "hello world"
  # 
  # --- prepend(*arguments) -> String
  # 複数の文字列を先頭に破壊的に追加します。
  # 
  # @param arguments 追加したい文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # a = "!!!"
  # a.prepend # => "!!!"
  # a         # => "!!!"
  # 
  # a = "!!!"
  # a.prepend "hello ", "world" # => "hello world!!!"
  # a                           # => "hello world!!!"
  # //}
  def prepend; end

  # --- replace(other) -> String
  # 
  # self の内容を other の内容で置き換えます。
  # 
  # //emlist[例][ruby]{
  # str = "foo"
  # str.replace "bar"
  # p str   # => "bar"
  # //}
  def replace; end

  # --- reverse -> String
  # 
  # 文字列を文字単位で左右逆転した文字列を返します。
  # 
  # //emlist[例][ruby]{
  # p "foobar".reverse   # => "raboof"
  # p "".reverse         # => ""
  # //}
  def reverse; end

  # --- reverse! -> self
  # 
  # 文字列を文字単位で左右逆転します。
  # 
  # //emlist[例][ruby]{
  # str = "foobar"
  # str.reverse!
  # p str   # => "raboof"
  # //}
  def reverse!; end

  # --- rindex(pattern, pos = self.size) -> Integer | nil
  # 
  # 文字列のインデックス pos から左に向かって pattern を探索します。
  # 最初に見つかった部分文字列の左端のインデックスを返します。
  # 見つからなければ nil を返します。
  # 
  # 引数 pattern は探索する部分文字列または正規表現で指定します。
  # 
  # pos が負の場合は、文字列の末尾から数えた位置から探索します。
  # 
  # rindex と [[m:String#index]] とでは、探索方向だけが逆になります。
  # 完全に左右が反転した動作をするわけではありません。
  # 探索はその開始位置を右から左にずらしながら行いますが、
  # 部分文字列の照合はどちらのメソッドも左から右に向かって行います。
  # 以下の例を参照してください。
  # 
  # //emlist[String#index の場合][ruby]{
  # p "stringstring".index("ing", 1)    # => 3
  #   # ing            # ここから探索を始める
  #   #  ing
  #   #   ing          # 右にずらしていってここで見つかる
  # //}
  # 
  # //emlist[String#rindex の場合][ruby]{
  # p "stringstring".rindex("ing", -1)  # => 9
  #   #           ing    # インデックス -1 の文字から探索を始める
  #   #          ing
  #   #         ing      # 左にずらしていってここで見つかる
  # //}
  # 
  # @param pattern    探索する部分文字列または正規表現
  # @param pos       探索を始めるインデックス
  # 
  # //emlist[例][ruby]{
  # p "astrochemistry".rindex("str")        # => 10
  # p "character".rindex(?c)                # => 5
  # p "regexprindex".rindex(/e.*x/, 2)      # => 1
  # 
  # p "foobarfoobar".rindex("bar", 6)       # => 3
  # p "foobarfoobar".rindex("bar", -6)      # => 3
  # //}
  # 
  # @see [[m:String#index]]
  def rindex; end

  # --- rjust(width, padding = ' ') -> String
  # 
  # 長さ width の文字列に self を右詰めした文字列を返します。
  # self の長さが width より長い時には元の文字列の複製を返します。
  # また、第 2 引数 padding を指定したときは
  # 空白文字の代わりに padding を詰めます。
  # 
  # @param width      返り値の文字列の最小の長さ
  # @param padding    長さが width になるまで self の左側に詰める文字
  # 
  # //emlist[例][ruby]{
  # p "foo".rjust(10)        # => "       foo"
  # p "foo".rjust(9)         # => "      foo"
  # p "foo".rjust(8)         # => "     foo"
  # p "foo".rjust(2)         # => "foo"
  # p "foo".rjust(1)         # => "foo"
  # p "foo".rjust(10, "*")   # => "*******foo"
  # //}
  # 
  # @see [[m:String#center]], [[m:String#ljust]]
  def rjust; end

  # --- rpartition(sep) -> [String, String, String]
  # 
  # セパレータ sep が最後に登場する部分で self を 3 つに分割し、
  # [最後のセパレータより前の部分, セパレータ, それ以降の部分]
  # の 3 要素の配列を返します。
  # 
  # self がセパレータを含まないときは、
  # 返り値の第 1 要素と第 2 要素が空文字列になります。
  # 
  # @param sep    セパレータを表す文字列か正規表現を指定します。
  # 
  # //emlist[例][ruby]{
  # p "axaxa".rpartition("x")   # => ["axa", "x", "a"]
  # p "aaaaa".rpartition("x")   # => ["", "", "aaaaa"]
  # //}
  # 
  # @see [[m:String#partition]], [[m:String#split]]
  def rpartition; end

  # --- rstrip -> String
  # 
  # 文字列の末尾にある空白文字を全て取り除いた新しい文字列を返します。
  # 空白文字の定義は " \t\r\n\f\v\0" です。
  # 
  # //emlist[例][ruby]{
  # p "  abc\n".rstrip          #=> "  abc"
  # p "  abc \t\r\n\0".rstrip   #=> "  abc"
  # p "  abc".rstrip            #=> "  abc"
  # p "  abc\0 ".rstrip         #=> "  abc"
  # 
  # str = "abc\n"
  # p str.rstrip    #=> "abc"
  # p str           #=> "abc\n"  (元の文字列は変化しない)
  # //}
  # 
  # @see [[m:String#lstrip]],[[m:String#strip]]
  def rstrip; end

  # --- rstrip! -> self | nil
  # 
  # 文字列の末尾にある空白文字を全て破壊的に取り除きます。
  # 空白文字の定義は " \t\r\n\f\v\0" です。
  # 
  # //emlist[例][ruby]{
  # str = "  abc\n"
  # p str.rstrip!   # => "  abc"
  # p str           # => "  abc"
  # 
  # str = "  abc \r\n\t\v\0"
  # p str.rstrip!   # => "  abc"
  # p str           # => "  abc"
  # //}
  # 
  # @see [[m:String#rstrip]], [[m:String#lstrip]]
  def rstrip!; end

  # --- scan(pattern) -> [String] | [[String]]
  # 
  # self に対して pattern を繰り返しマッチし、
  # マッチした部分文字列の配列を返します。
  # 
  # pattern が正規表現で括弧を含む場合は、
  # 括弧で括られたパターンにマッチした部分文字列の配列の配列を返します。
  # 
  # @param pattern 探索する部分文字列または正規表現
  # 
  # //emlist[例][ruby]{
  # p "foobar".scan(/../)               # => ["fo", "ob", "ar"]
  # p "foobar".scan("o")                # => ["o", "o"]
  # p "foobarbazfoobarbaz".scan(/ba./)  # => ["bar", "baz", "bar", "baz"]
  # 
  # p "foobar".scan(/(.)/) # => [["f"], ["o"], ["o"], ["b"], ["a"], ["r"]]
  # 
  # p "foobarbazfoobarbaz".scan(/(ba)(.)/) # => [["ba", "r"], ["ba", "z"], ["ba", "r"], ["ba", "z"]]
  # //}
  # 
  # --- scan(pattern) {|s| ... } -> self
  # 
  # pattern がマッチした部分文字列をブロックに渡して実行します。
  # pattern が正規表現で括弧を含む場合は、
  # 括弧で括られたパターンにマッチした文字列の配列を渡します。
  # 
  # @param pattern 探索する部分文字列または正規表現
  # 
  # //emlist[例][ruby]{
  # "foobarbazfoobarbaz".scan(/ba./) {|s| p s }
  # # "bar"
  # # "baz"
  # # "bar"
  # # "baz"
  # 
  # "foobarbazfoobarbaz".scan("ba") {|s| p s }
  # # "ba"
  # # "ba"
  # # "ba"
  # # "ba"
  # 
  # "foobarbazfoobarbaz".scan(/(ba)(.)/) {|s| p s }
  # # ["ba", "r"]
  # # ["ba", "z"]
  # # ["ba", "r"]
  # # ["ba", "z"]
  # //}
  def scan; end

  # --- scanf(format) -> Array
  # --- scanf(format) {|*ary| ...} -> Array
  # 
  # ブロックを指定しない場合、見つかった文字列を format に従って変
  # 換し、そのオブジェクトの配列を返します。
  # format で指定した文字列が見つからない場合は空の配列を
  # 生成して返します。
  # 
  #   require 'scanf'
  #   str = "123 abc 456 def 789 ghi"
  #   p str.scanf("%d%s") #=> [123, "abc"]
  # 
  # ブロックを指定した場合は scanf を継続して実行し、順次
  # 見つかった文字列を変換したオブジェクトの配列を引数に、ブロックを
  # 実行します。このとき、ブロックの実行結果を要素とする配列を返します。
  # 
  #   require 'scanf'
  #   str = "123 0x45 678 0x90"
  #   p str.scanf("%d%x"){|n, s| [n, s]}
  #   #=> [[123, 69], [678, 144]]
  # 
  # formatに完全にマッチしていなくても、部分的にマッチしていれば、
  # ブロックは実行されます。
  # 
  #   require 'scanf'
  #   str = "123 abc 456 def"
  #   ret = str.scanf("%s%d") { |s, n| [s, n] }
  #   p ret #=> [["123", nil], ["abc", 456], ["def", nil]]
  # 
  # 
  # @param format スキャンするフォーマットを文字列で指定します。
  #               詳細は、[[ref:m:String#scanf#format]] を参照してください。
  # 
  # 使用例:
  #   require 'scanf'
  #   str = "123 abc 456 def 789 ghi"
  #   p str.scanf("%d%s") #=> [123, "abc"]
  # 
  # ===[a:format] scanfフォーマット文字列
  # 
  # 文字 '%' と(s,d のような)指示子の間に、整数を指定する事により読み込む文字列の幅を
  # 指定する事ができます。もし幅が与えられなければ、無限大の値が既定値として使用されます。
  # (但し、%c では、この既定値は適用されません。)
  # 上記の幅が整数 n で与えられた場合、多くても n 個の文字列がマッチします。
  # このフォーマット文字列によるマッチの実行前、多くの場合入力文字列のスペースは読み飛ばされます。
  # つまり、スペースは幅の数として数えられない事になります。
  # 
  # 動作例;
  #   require 'scanf'
  #   p "a           10".scanf("%s %d")  # => ["a", 10]
  #   p "a10".scanf("%1s %d")      # => ["a", 10]
  # 
  # 
  # 使用例；
  #   require 'scanf'
  #   str = "1234"
  #   p str.scanf("%1s%3d")  #=> ["1", 234]
  # 
  # また、1.9 以降では、スペースには全角文字列が含まれます。
  # 
  # 動作例；
  #   # encoding: utf-8
  #   require 'scanf'
  # 
  #   str = "1　　　　　aaa"
  #   p str.scanf("%d %s") #=> [1, "aaa"]
  # 
  # 
  # 
  # : space
  #  フォーマット中の空白は(0個を含む)任意の数の空白にマッチします。
  # //emlist{
  #   require 'scanf'
  #   p "a           10".scanf("%s %d")  # => ["a", 10]
  #   p "a10".scanf("%1s %d")            # => ["a", 10]
  # //}
  # : %%
  #  % そのもの
  # 
  # : %d
  # : %u
  #  符号付き10進数
  # 
  # : %i
  #  [[m:Kernel.#Integer]]のように接頭辞を受け付ける符号付き整数
  # 
  # : %o
  #  符号付き8進数
  # 
  # : %x
  # : %X
  #  符号付き16進数
  # 
  # : %e
  # : %f
  # : %g
  # : %E
  # : %F
  # : %G
  # : %a
  # : %A
  #  符号付き浮動小数点数
  # 
  # : %s
  #  空白文字を含まない文字列
  #  (幅が指定されているときは指定された文字数か空白文字の直前までの短い方)
  # 
  # : %c
  #  1文字(幅が指定されているときは指定された文字数)
  # 
  # : [...]
  #  [[ref:d:spec/regexp#string]]
  def scanf; end

  # --- scrub               -> String
  # --- scrub(repl)         -> String
  # --- scrub{|bytes| ... } -> String
  # 
  # self が不正なバイト列を含む場合に別の文字列に置き換えた新しい文字列を返します。
  # 
  # @param repl 不正なバイト列を置き換える文字列を指定します。省略した場合
  #             は self の文字エンコーディングが [[m:Encoding::UTF_16BE]],
  #             [[m:Encoding::UTF_16LE]], [[m:Encoding::UTF_32BE]],
  #             [[m:Encoding::UTF_32LE]], [[m:Encoding::UTF_8]] のいずれか
  #             の場合は "\uFFFD" を表す文字で、それ以外の場合は "?" で置き
  #             換えられます。ブロックが指定された場合は不正なバイト列はブ
  #             ロックの戻り値で置き換えられます。
  # 
  # //emlist[例][ruby]{
  # "abc\u3042\x81".scrub      # => "abc\u3042\uFFFD"
  # "abc\u3042\x81".scrub("*") # => "abc\u3042*"
  # "abc\u3042\xE3\x80".scrub{|bytes| '<'+bytes.unpack('H*')[0]+'>' } # => "abc\u3042<e380>"
  # //}
  # 
  # @see [[m:String#scrub!]]
  def scrub; end

  # --- scrub!               -> String
  # --- scrub!(repl)         -> String
  # --- scrub!{|bytes| ... } -> String
  # 
  # self が不正なバイト列を含む場合に別の文字列に置き換えます。常に self を返します。
  # 
  # @param repl 不正なバイト列を置き換える文字列を指定します。省略した場合
  #             は self の文字エンコーディングが [[m:Encoding::UTF_16BE]],
  #             [[m:Encoding::UTF_16LE]], [[m:Encoding::UTF_32BE]],
  #             [[m:Encoding::UTF_32LE]], [[m:Encoding::UTF_8]] のいずれか
  #             の場合は "\uFFFD" を表す文字で、それ以外の場合は "?" で置き
  #             換えられます。ブロックが指定された場合は不正なバイト列はブ
  #             ロックの戻り値で置き換えられます。
  # 
  # //emlist[例][ruby]{
  # "abc\u3042\x81".scrub!      # => "abc\u3042\uFFFD"
  # "abc\u3042\x81".scrub!("*") # => "abc\u3042*"
  # "abc\u3042\xE3\x80".scrub!{|bytes| '<'+bytes.unpack('H*')[0]+'>' } # => "abc\u3042<e380>"
  # //}
  # 
  # @see [[m:String#scrub]]
  def scrub!; end

  # --- setbyte(index, b) -> Integer
  # 
  # index バイト目のバイトを b に変更します。
  # 
  # index に負を指定すると末尾から数えた位置を変更します。
  # 
  # セットした値を返します。
  # 
  # @param index バイトをセットする位置
  # @param b セットするバイト(0 から 255 までの整数)
  # @raise IndexError 範囲外に値をセットしようとした場合に発生します。
  # 
  # //emlist[例][ruby]{
  # s = "Sunday"
  # s.setbyte(0, 77)
  # s.setbyte(-5, 111)
  # s # => "Monday"
  # //}
  def setbyte; end

  # --- shellescape -> String
  # 文字列を Bourne シェルのコマンドライン中で安全に使えるようにエスケープします。
  # 
  # string.shellescape は、Shellwords.escape(string) と等価です。
  # 
  # @return エスケープされた文字列を返します。
  # @see [[m:Shellwords.#shellescape]]
  def shellescape; end

  # --- shellsplit -> [String]
  # Bourne シェルの単語分割規則に従った空白区切りの単語分割を行い、
  # 単語 (文字列) の配列を返します。
  # 
  # string.shellsplit は、Shellwords.shellsplit(string) と等価です。
  # 
  # @return 分割結果の各文字列を要素とする配列を返します。
  # @raise ArgumentError 引数の中に対でないシングルクォートまたはダブル
  #        クォートが現れた場合に発生します。
  # @see [[m:Shellwords.#shellsplit]]
  def shellsplit; end

  # --- slice!(nth) -> String
  # --- slice!(pos, len) -> String
  # --- slice!(substr) -> String
  # --- slice!(regexp, nth = 0) -> String
  # --- slice!(first..last) -> String
  # --- slice!(first...last) -> String
  # 
  # 指定した範囲 ([[m:String#[] ]] 参照) を
  # 文字列から取り除いたうえで取り除いた部分文字列を返します。
  # 
  # 引数が範囲外を指す場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # string = "this is a string"
  # string.slice!(2)        #=> "i"
  # string.slice!(3..6)     #=> " is "
  # string.slice!(/s.*t/)   #=> "sa st"
  # string.slice!("r")      #=> "r"
  # string                  #=> "thing"
  # //}
  def slice!; end

  # --- split(sep = $;, limit = 0) -> [String]
  # --- split(sep = $;, limit = 0) {|s| ... } -> self
  # 
  # 第 1 引数 sep で指定されたセパレータによって文字列を limit 個まで分割し、
  # 結果を文字列の配列で返します。
  # ブロックを指定すると、配列を返す代わりに分割した文字列で
  # ブロックを呼び出します。
  # 
  # 第 1 引数 sep は以下のいずれかです。
  # 
  # : 正規表現
  #     正規表現にマッチする部分で分割する。
  #     特に、括弧によるグルーピングがあればそのグループにマッチした
  #     文字列も結果の配列に含まれる (後述)。
  # : 文字列
  #     その文字列自体にマッチする部分で分割する。
  # : 1 バイトの空白文字 ' '
  #     先頭と末尾の空白を除いたうえで、空白文字列で分割する。
  # : nil
  #     常に $; で分割する。 $; も nil の場合は、先頭と末尾の空白を除いたうえで、空白文字列で分割する。
  # : 空文字列 '' あるいは空文字列にマッチする正規表現
  #     文字列を 1 文字ずつに分割する。マルチバイト文字を認識する。
  # 
  # sep が正規表現で、かつその正規表現に括弧が含まれている場合には、
  # 各括弧のパターンにマッチした文字列も配列に含まれます。
  # 括弧が複数ある場合は、マッチしたものだけが配列に含まれます。
  # 
  # 第 2 引数 limit は以下のいずれかです。
  # 
  # : limit > 0
  #      最大 limit 個の文字列に分割する
  # : limit == 0
  #      分割個数制限はなしで、配列末尾の空文字列を取り除く
  # : limit < 0
  #      分割個数の制限はなし
  # 
  # @param sep       文字列を分割するときのセパレータのパターン
  # @param limit     分割する最大個数
  # 
  # @return ブロックを渡した場合は self、ブロックなしの場合は配列
  # 
  # //emlist[例][ruby]{
  # p "   a \t  b \n  c".split(/\s+/) # => ["", "a", "b", "c"]
  # 
  # p "   a \t  b \n  c".split(nil)   # => ["a", "b", "c"]
  # p "   a \t  b \n  c".split(' ')   # => ["a", "b", "c"]   # split(nil) と同じ
  # p "   a \t  b \n  c".split        # => ["a", "b", "c"]   # split(nil) と同じ
  # //}
  # 
  # //emlist[括弧を含む正規表現][ruby]{
  # p '1-10,20'.split(/([-,])/)   # => ["1", "-", "10", ",", "20"]
  # //}
  # 
  # //emlist[正規表現が空文字列にマッチする場合は 1 文字に分割][ruby]{
  # p 'hi there'.split(/\s*/).join(':')  # => "h:i:t:h:e:r:e"
  # //}
  # 
  # //emlist[文字列全体を 1 文字ずつに分割する例][ruby]{
  # p 'hi there'.split(//).join(':')     # => "h:i: :t:h:e:r:e"
  # //}
  # 
  # //emlist[limit == 0 だと制限なく分割、配列末尾の空文字列は取り除かれる][ruby]{
  # p "a,b,c,,,".split(/,/, 0)   # => ["a", "b", "c"]
  # //}
  # 
  # //emlist[limit 省略時は 0 と同じ (最もよく使われるパターン)][ruby]{
  # p "a,b,c,,,".split(/,/)      # => ["a", "b", "c"]
  # //}
  # 
  # //emlist[正の limit 使用例][ruby]{
  # p "a,b,c,d,e".split(/,/, 1)  # => ["a,b,c,d,e"]
  # p "a,b,c,d,e".split(/,/, 2)  # => ["a", "b,c,d,e"]
  # p "a,b,c,d,e".split(/,/, 3)  # => ["a", "b", "c,d,e"]
  # p "a,b,c,d,e".split(/,/, 4)  # => ["a", "b", "c", "d,e"]
  # p "a,b,c,d,e".split(/,/, 5)  # => ["a", "b", "c", "d", "e"]
  # p "a,b,c,d,e".split(/,/, 6)  # => ["a", "b", "c", "d", "e"]
  # p "a,b,c,d,e".split(/,/, 7)  # => ["a", "b", "c", "d", "e"]
  # //}
  # 
  # //emlist[limit が負の数の場合は制限なく分割][ruby]{
  # p "a,b,c,,,".split(/,/, -1)    # => ["a", "b", "c", "", "", ""]
  # //}
  # 
  # @see [[m:String#partition]], [[m:String#rpartition]]
  def split; end

  # --- squeeze(*chars) -> String
  # 
  # chars に含まれる文字が複数並んでいたら 1 文字にまとめます。
  # 
  # chars の形式は [[man:tr(1)]] と同じです。つまり、
  # `a-c' は a から c を意味し、"^0-9" のように
  # 文字列の先頭が `^' の場合は指定文字以外を意味します。
  # 
  # `-' は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 同様に、`^' もその効果は文字列の先頭にあるときだけです。また、
  # `-', `^', `\' はバックスラッシュ(`\')によ
  # りエスケープすることができます。
  # 
  # 引数を 1 つも指定しない場合は、すべての連続した文字を 1 文字にまとめます。
  # 
  # 引数を複数指定した場合は、すべての引数にマッチする文字を 1 文字にまとめます。
  # 
  # @param chars １文字にまとめる文字。
  # 
  # //emlist[例][ruby]{
  # p "112233445566778899".squeeze          # =>"123456789"
  # p "112233445566778899".squeeze("2-8")   # =>"11234567899"
  # 
  # # 以下の 2 つは同じ意味
  # p "112233445566778899".squeeze("2378")          # =>"11234455667899"
  # p "112233445566778899".squeeze("2-8", "^4-6")   # =>"11234455667899"
  # //}
  def squeeze; end

  # --- squeeze!(*chars) -> self | nil
  # 
  # chars に含まれる文字が複数並んでいたら 1 文字にまとめます。
  # 
  # chars の形式は [[man:tr(1)]] と同じです。つまり、
  # `a-c' は a から c を意味し、"^0-9" のように
  # 文字列の先頭が `^' の場合は指定文字以外を意味します。
  # 
  # `-' は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 同様に、`^' もその効果は文字列の先頭にあるときだけです。また、
  # `-', `^', `\' はバックスラッシュ(`\')によ
  # りエスケープすることができます。
  # 
  # 引数を 1 つも指定しない場合は、すべての連続した文字を 1 文字にまとめます。
  # 
  # 引数を複数指定した場合は、すべての引数にマッチする文字を 1 文字にまとめます。
  # 
  # 1 文字もまとめられなかった場合は nil を返します。
  # 
  # @param chars １文字にまとめる文字。
  # 
  # //emlist[例][ruby]{
  # str = "112233445566778899"
  # str.squeeze!
  # p str    # =>"123456789"
  # 
  # str = "112233445566778899"
  # str.squeeze!("2-8")
  # p str    # =>"11234567899"
  # 
  # str = "123456789"
  # str.squeeze! # => nil
  # p str        # =>"123456789"
  # //}
  def squeeze!; end

  # --- start_with?(*prefixes) -> bool
  # 
  # self の先頭が prefixes のいずれかであるとき true を返します。
  # 
  # @param prefixes パターンを表す文字列または正規表現 (のリスト)
  # 
  # //emlist[例][ruby]{
  # "string".start_with?("str")          # => true
  # "string".start_with?("ing")          # => false
  # "string".start_with?("ing", "str")   # => true
  # "string".start_with?(/\w/)           # => true
  # "string".start_with?(/\d/)           # => false
  # //}
  # 
  # @see [[m:String#end_with?]]
  # @see [[m:String#delete_prefix]], [[m:String#delete_prefix!]]
  def start_with?; end

  # --- strip -> String
  # 
  # 文字列先頭と末尾の空白文字を全て取り除いた文字列を生成して返します。
  # 空白文字の定義は " \t\r\n\f\v" です。
  # また、文字列右側からは "\0" も取り除きますが、
  # 左側の "\0" は取り除きません。
  # 
  # //emlist[例][ruby]{
  # p "  abc  \r\n".strip    #=> "abc"
  # p "abc\n".strip          #=> "abc"
  # p "  abc".strip          #=> "abc"
  # p "abc".strip            #=> "abc"
  # p "  \0  abc  \0".strip  # => "\000  abc"   # 右側のみ "\0" も取り除く
  # 
  # str = "\tabc\n"
  # p str.strip              #=> "abc"
  # p str                    #=> "\tabc\n" (元の文字列は変化しない)
  # //}
  # 
  # @see [[m:String#lstrip]], [[m:String#rstrip]]
  def strip; end

  # --- strip! -> self | nil
  # 
  # 先頭と末尾の空白文字を全て破壊的に取り除きます。
  # 空白文字の定義は " \t\r\n\f\v" です。
  # また、文字列右側からは "\0" も取り除きますが、
  # 左側の "\0" は取り除きません。
  # 
  # strip! は、内容を変更した self を返します。
  # ただし取り除く空白がなかったときは nil を返します。
  # 
  # //emlist[例][ruby]{
  # str = "  abc\r\n"
  # p str.strip!     #=> "abc"
  # p str            #=> "abc"
  # 
  # str = "abc"
  # p str.strip!     #=> nil
  # p str            #=> "abc"
  # 
  # str = "  \0  abc  \0"
  # str.strip!
  # p str            # => "\000  abc"   # 右側の "\0" のみ取り除かれる
  # //}
  # 
  # @see [[m:String#strip]], [[m:String#lstrip]]
  def strip!; end

  # --- sub(pattern, replace) -> String
  # 
  # 文字列中で pattern にマッチした最初の部分を
  # 文字列 replace で置き換えた文字列を生成して返します。
  # 
  # 置換文字列 replace 中の \& と \0 はマッチした部分文字列に、
  # \1 ... \9 は n 番目の括弧の内容に置き換えられます。
  # 置換文字列内では \`、\'、\+ も使えます。
  # これらは [[m:$`]]、[[m:$']]、[[m:$+]] に対応します。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # 
  # //emlist[例][ruby]{
  # p 'abcdefg'.sub(/def/, '!!')          # => "abc!!g"
  # p 'abcabc'.sub(/b/, '<<\&>>')         # => "a<<b>>cabc"
  # p 'xxbbxbb'.sub(/x+(b+)/, 'X<<\1>>')  # => "X<<bb>>xbb"
  # //}
  # 
  # 注意:
  # 
  # 第 2 引数 replace に [[m:$1]] を埋め込んでも意図した結果にはなりません。
  # この文字列が評価される時点ではまだ正規表現マッチが行われておらず、
  # $1 がセットされていないからです。
  # 
  # また、sub では「\」が部分文字列との置き換えという特別な意味を持つため、
  # replace に「\」自身を入れたいときは
  # 「\」を二重にエスケープしなければなりません。
  # 
  # //emlist[ひとつめの括弧の内容に置き換えるときによくある間違い][ruby]{
  # p 'xbbb-xbbb'.sub(/x(b+)/, "#{$1}")   # => "-xbbb"     # NG
  # p 'xbbb-xbbb'.sub(/x(b+)/, "\1")      # => "1-xbbb"    # NG
  # p 'xbbb-xbbb'.sub(/x(b+)/, "\\1")     # => "bbb-xbbb"  # OK
  # p 'xbbb-xbbb'.sub(/x(b+)/, '\1')      # => "bbb-xbbb"  # OK
  # p 'xbbb-xbbb'.sub(/x(b+)/, '\\1')     # => "bbb-xbbb"  # OK
  # //}
  # 
  # //emlist[バックスラッシュを倍にするときによくある間違い][ruby]{
  # puts '\n'.sub(/\\/, "\\\\")      # => \n   # NG
  # puts '\n'.sub(/\\/, '\\\\')      # => \n   # NG
  # puts '\n'.sub(/\\/, "\\\\\\\\")  # => \\n  # OK
  # puts '\n'.sub(/\\/, '\\\\\\\\')  # => \\n  # OK
  # //}
  # 
  # このような間違いを確実に防止し、コードの可読性を上げるには、
  # \& や \1 よりも下記のようにブロック付き形式の sub を使うべきです。
  # 
  # //emlist[安全な例][ruby]{
  # p 'xbbb-xbbb'.sub(/x(b+)/) { $1 }   # => "bbb-xbbb"  # OK
  # 
  # puts '\n'.sub(/\\/) { '\\\\' }      # => \\n        # OK
  # //}
  # 
  # @see [[m:String#gsub]]
  # 
  # --- sub(pattern) {|matched| .... } -> String
  # 
  # 文字列中で pattern にマッチした最初の部分をブロックに渡し、
  # その評価結果で置き換えた新しい文字列を返します。
  # ブロックなしの sub と違い、ブロックの中からは
  # 組み込み変数 [[m:$1]], $2, $3, ... を問題なく参照できます。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # 
  # //emlist[例][ruby]{
  # p 'abcabc'.sub(/b/) {|s| s.upcase }  #=> "aBcabc"
  # p 'abcabc'.sub(/b/) { $&.upcase }    #=> "aBcabc"
  # //}
  # 
  # @see [[m:String#gsub]]
  # 
  # --- sub(pattern, hash) -> String
  # 
  # 文字列中の pattern にマッチした部分をキーにして hash を引いた値で置き換えます。
  # 
  # @param pattern    置き換える文字列のパターン
  # @param hash       置き換える文字列を与えるハッシュ
  # 
  # //emlist[例][ruby]{
  # hash = {'b'=>'B', 'c'=>'C'}
  # p "abcabc".sub(/[bc]/){hash[$&]} #=> "aBCabc"
  # p "abcabc".sub(/[bc]/, hash)     #=> "aBCabc"
  # //}
  def sub; end

  # --- sub!(pattern, replace) -> self | nil
  # 
  # 文字列中で pattern にマッチした最初の部分を文字列 replace へ破壊的に置き換えます。
  # 
  # 置換文字列 replace 中の \& と \0 はマッチした部分文字列に、
  # \1 ... \9 は n 番目の括弧の内容に置き換えられます。
  # 置換文字列内では \`、\'、\+ も使えます。
  # これらは [[m:$`]]、[[m:$']]、[[m:$+]] に対応します。
  # 
  # sub! は通常 self を変更して返しますが、
  # 置換が起こらなかった場合は nil を返します。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @param replace    pattern で指定した文字列と置き換える文字列
  # @return 置換した場合は self、置換しなかった場合は nil
  # 
  # //emlist[例][ruby]{
  # buf = "String-String"
  # buf.sub!(/in./, "!!")
  # p buf   # => "Str!!-String"
  # 
  # buf = "String.String"
  # buf.sub!(/in./, '<<\&>>')
  # p buf   # => "Str<<ing>>-String"
  # //}
  # 
  # 注意:
  # 
  # 引数 replace の中で [[m:$1]] を使うことはできません。
  # replace は sub メソッドの呼び出しより先に評価されるので、
  # まだ sub の正規表現マッチが行われておらず、
  # $1 がセットされていないからです。
  # 
  # また、sub では「\」が部分文字列との置き換えという特別な意味を持つため、
  # replace に「\」自身を入れたいときは
  # 「\」を二重にエスケープしなければなりません。
  # 
  # //emlist[ひとつめの括弧にマッチした部分に置き換えるときによくやる間違いと正しい例][ruby]{
  # 'abbbcd'.sub!(/a(b+)/, "#{$1}")       # NG
  # 'abbbcd'.sub!(/a(b+)/, "\1")          # NG
  # 'abbbcd'.sub!(/a(b+)/, "\\1")         # OK
  # 'abbbcd'.sub!(/a(b+)/, '\\1')         # OK
  # 'abbbcd'.sub!(/a(b+)/, '\1')          # OK
  # 'abbbcd'.sub!(/a(b+)/) { $1 }         # OK   これがもっとも安全
  # //}
  # 
  # @see [[m:String#gsub]]
  # 
  # --- sub!(pattern) {|matched| .... } -> self | nil
  # 
  # 文字列中で pattern にマッチした最初の部分をブロックに渡し、
  # その評価結果へ破壊的に置き換えます。
  # 
  # また、ブロックなしの sub と違い、ブロックの中からは
  # 組み込み変数 [[m:$1]], $2, $3, ... を問題なく参照できます。
  # 
  # @param pattern    置き換える文字列のパターンを表す文字列か正規表現。
  #                   文字列を指定した場合は全く同じ文字列にだけマッチする
  # @return 置換した場合は self、置換しなかった場合は nil
  # 
  # //emlist[例][ruby]{
  # str = 'abcabc'
  # str.sub!(/b/) {|s| s.upcase }
  # p str    #=> "aBcabc"
  # 
  # str = 'abcabc'
  # str.sub!(/b/) { $&.upcase }
  # p str    #=> "aBcabc"
  # //}
  # 
  # @see [[m:String#gsub]]
  # 
  # --- sub!(pattern, hash) -> String
  # 
  # 文字列中の pattern にマッチした部分をキーにして hash を引いた値で破壊的に置き換えます。
  # 
  # @param pattern    置き換える文字列のパターン
  # @param hash       置き換える文字列を与えるハッシュ
  # @return 置換した場合は self、置換しなかった場合は nil
  def sub!; end

  # --- sum(bits = 16) -> Integer
  # 
  # 文字列の bits ビットのチェックサムを計算します。
  # 
  # 以下と同じです。
  # 
  # //emlist[][ruby]{
  # def sum(bits)
  #   sum = 0
  #   each_byte {|c| sum += c }
  #   return 0 if sum == 0
  #   sum & ((1 << bits) - 1)
  # end
  # //}
  # 
  # 例えば以下のコードで UNIX System V の
  # [[man:sum(1)]] コマンドと同じ値が得られます。
  # 
  # //emlist[例][ruby]{
  # sum = 0
  # ARGF.each_line do |line|
  #   sum += line.sum
  # end
  # sum %= 65536
  # //}
  # 
  # @param bits    チェックサムのビット数
  def sum; end

  # --- swapcase(*options) -> String
  # 
  # 大文字を小文字に、小文字を大文字に変更した文字列を返します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # p "ABCxyz".swapcase   # => "abcXYZ"
  # p "Access".swapcase   # => "aCCESS"
  # //}
  # 
  # @see [[m:String#swapcase!]], [[m:String#upcase]], [[m:String#downcase]], [[m:String#capitalize]]
  def swapcase; end

  # --- swapcase!(*options) -> self | nil
  # 
  # 大文字を小文字に、小文字を大文字に破壊的に変更します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # swapcase! は self を変更して返しますが、
  # 置換が起こらなかった場合は nil を返します。
  # 
  # このメソッドはマルチバイト文字を認識しません。
  # 
  # //emlist[例][ruby]{
  # str = "ABCxyz"
  # str.swapcase!
  # p str   # => "abcXYZ"
  # //}
  # 
  # @see [[m:String#swapcase]], [[m:String#upcase!]], [[m:String#downcase!]], [[m:String#capitalize!]]
  def swapcase!; end

  # --- to_c -> Complex
  # 
  # 自身を複素数 ([[c:Complex]]) に変換した結果を返します。
  # 
  # 以下の形式を解析できます。i、j は大文字、小文字のどちらでも解析できます。
  # 
  #  * 実部+虚部i
  #  * 実部+虚部j
  #  * 絶対値@偏角
  # 
  # それぞれの数値は以下のいずれかの形式で指定します。先頭の空白文字や複素
  # 数値の後にある文字列は無視されます。また、数値オブジェクトと同様に各桁
  # の間に「_」を入れる事ができます。
  # 
  #  * "1/3" のような分数の形式
  #  * "0.3" のような10進数の形式
  #  * "0.3E0" のような x.xEn の形式
  # 
  # 自身が解析できない値であった場合は 0+0i を返します。
  # 
  # //emlist[例][ruby]{
  # '9'.to_c           # => (9+0i)
  # '2.5'.to_c         # => (2.5+0i)
  # '2.5/1'.to_c       # => ((5/2)+0i)
  # '-3/2'.to_c        # => ((-3/2)+0i)
  # '-i'.to_c          # => (0-1i)
  # '45i'.to_c         # => (0+45i)
  # '3-4i'.to_c        # => (3-4i)
  # '-4e2-4e-2i'.to_c  # => (-400.0-0.04i)
  # '-0.0-0.0i'.to_c   # => (-0.0-0.0i)
  # '1/2+3/4i'.to_c    # => ((1/2)+(3/4)*i)
  # '10@10'.to_c       # => (-8.390715290764524-5.440211108893697i)
  # '-0.3_3'.to_c      # => (-0.33+0i)
  # " \t\r\n5+3i".to_c # => (5+3i)
  # '5+3ix'.to_c       # => (5+3i)
  # 'ruby'.to_c        # => (0+0i)
  # //}
  def to_c; end

  # --- to_d -> BigDecimal
  # 
  # 自身を [[c:BigDecimal]] に変換します。BigDecimal(self) と同じです。
  # 
  # @return [[c:BigDecimal]] に変換したオブジェクト
  def to_d; end

  # --- to_f -> Float
  # 
  # 文字列を 10 進数表現と解釈して、浮動小数点数 [[c:Float]] に変換します。
  # 
  # 浮動小数点数とみなせなくなるところまでを変換対象とします。
  # 途中に変換できないような文字列がある場合、それより先の文字列は無視されます。
  # 
  # //emlist[][ruby]{
  # p "-10".to_f   # => -10.0
  # p "10e2".to_f  # => 1000.0
  # p "1e-2".to_f  # => 0.01
  # p ".1".to_f    # => 0.1
  # 
  # p "1_0_0".to_f # => 100.0  # 数値リテラルと同じように区切りに _ を使える
  # p " \n10".to_f # => 10.0   # 先頭の空白・改行は無視される
  # p "7xa.5".to_f # => 7.0
  # //}
  # 
  # 以下の例は、先頭に浮動小数点数とみなせるものがないため、0.0 を返します。
  # 変換対象が空文字列のケースでも、0.0 を返します。
  # 
  # //emlist[][ruby]{
  # p "".to_f      # => 0.0
  # p "nan".to_f   # => 0.0
  # p "INF".to_f   # => 0.0
  # p "-Inf".to_f  # => 0.0
  # //}
  # 
  # 変換後の [[c:Float]] が有限の値を取れないときは、[[m:Float::INFINITY]] を用います。
  # このとき、全ての警告を有効にすると、警告が表示されます。
  # 
  # //emlist[][ruby]{
  # #!ruby -W2
  # 
  # p ("10" * 1000).to_f   # => Infinity
  # # warning: Float 10101010101010101010... out of range
  # //}
  # 
  # なお、このメソッドとは逆に、数値を文字列に変換するには
  # [[m:Kernel.#sprintf]], [[m:String#%]], [[m:Integer#to_s]]
  # を使用します。
  # 
  # @see [[m:String#hex]], [[m:String#oct]], [[m:String#to_i]],
  #      [[m:Kernel.#Integer]], [[m:Kernel.#Float]]
  def to_f; end

  # --- to_i(base = 10) -> Integer
  # 
  # 文字列を 10 進数表現された整数であると解釈して、整数に変換します。
  # 
  # //emlist[例][ruby]{
  # p " 10".to_i    # => 10
  # p "+10".to_i    # => 10
  # p "-10".to_i    # => -10
  # 
  # p "010".to_i    # => 10
  # p "-010".to_i   # => -10
  # //}
  # 
  # 整数とみなせない文字があればそこまでを変換対象とします。
  # 変換対象が空文字列であれば 0 を返します。
  # 
  # //emlist[例][ruby]{
  # p "0x11".to_i   # => 0
  # p "".to_i       # => 0
  # //}
  # 
  # 基数を指定することでデフォルトの 10 進以外に 2 〜 36 進数表現へ変換できます。
  # それぞれ Ruby の整数リテラルで使用可能なプリフィクスは無視されます。
  # また、base に 0 を指定するとプリフィクスから基数を判断します。
  # 認識できるプリフィクスは、
  # 0b (2 進数)、0 (8 進数)、0o (8 進数)、0d (10 進数)、0x (16 進数) です。
  # 
  # 0, 2 〜 36 以外の引数を指定した場合は
  # 例外 [[c:ArgumentError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # p "01".to_i(2)    # => 1
  # p "0b1".to_i(2)   # => 1
  # 
  # p "07".to_i(8)    # => 7
  # p "0o7".to_i(8)   # => 7
  # 
  # p "1f".to_i(16)   # => 31
  # p "0x1f".to_i(16) # => 31
  # 
  # p "0b10".to_i(0)  # => 2
  # p "0o10".to_i(0)  # => 8
  # p "010".to_i(0)   # => 8
  # p "0d10".to_i(0)  # => 10
  # p "0x10".to_i(0)  # => 16
  # //}
  # 
  # @param base    進数を指定する整数。0 か、2〜36 の整数。
  # @return        整数
  # 
  # このメソッドの逆に数値を文字列に変換するには、
  # [[m:Kernel.#sprintf]], [[m:String#%]], [[m:Integer#to_s]]
  # を使用します。
  # 
  # [[m:String#hex]], [[m:String#oct]], [[m:String#to_f]],
  # [[m:Kernel.#Integer]], [[m:Kernel.#Float]]
  # も参照してください。
  def to_i; end

  # --- to_r -> Rational
  # 
  # 自身を有理数([[c:Rational]])に変換した結果を返します。
  # 
  # [[m:Kernel.#Rational]] に文字列を指定した時のように、以下のいずれかの形
  # 式で指定します。
  # 
  #  * "1/3" のような分数の形式
  #  * "0.3" のような10進数の形式
  #  * "0.3E0" のような x.xEn の形式
  #  * 数字をアンダースコアで繋いだ形式
  # 
  # //emlist[例][ruby]{
  # '  2  '.to_r       # => (2/1)
  # '1/3'.to_r         # => (1/3)
  # '-9.2'.to_r        # => (-46/5)
  # '-9.2E2'.to_r      # => (-920/1)
  # '1_234_567'.to_r   # => (1234567/1)
  # '1_234/5_678'.to_r # => (617/2839)
  # //}
  # 
  # [[m:Kernel.#Rational]] に文字列を指定した時とは異なる点もあります。
  # 
  # 途中に変換できないような文字列が入っていた場合は、それより先の文字列は
  # 無視されます。
  # 
  # //emlist[][ruby]{
  # '21 june 09'.to_r  # => (21/1)
  # '21/06/09'.to_r    # => (7/2)   # 21/6 を約分して 7/2。
  # //}
  # 
  # 変換できないような文字列を指定した場合は 0/1 を返します。
  # 
  # //emlist[][ruby]{
  # 'foo'.to_r         # => (0/1)
  # ''.to_r            # => (0/1)
  # 'bwv 1079'.to_r    # => (0/1)
  # //}
  # 
  # @see [[m:Kernel.#Rational]]
  def to_r; end

  # --- to_s -> String
  # --- to_str -> String
  # 
  # self を返します。
  # 
  # //emlist[例][ruby]{
  # p "str".to_s     # => "str"
  # p "str".to_str   # => "str"
  # //}
  # 
  # このメソッドは、文字列を他のクラスのインスタンスと混ぜて処理したいときに有効です。
  # 例えば返り値が文字列か nil であるメソッド some_method があるとき、
  # to_s メソッドを使うと以下のように統一的に処理できます。
  # 
  # //emlist[例][ruby]{
  # # some_method(5).downcase だと返り値が nil のときに
  # # エラーになるので to_s をはさむ
  # p some_method(5).to_s.downcase
  # //}
  def to_s; end

  # --- toeuc -> String
  # 
  # self のエンコーディングを EUC-JP に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-exm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#toeuc]]
  def toeuc; end

  # --- tojis -> String
  # 
  # self のエンコーディングを iso-2022-jp に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-jxm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#tojis]]
  def tojis; end

  # --- tolocale -> String
  # self のエンコーディングをロケールエンコーディングに変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # ロケールエンコーディングについては [[m:Encoding.locale_charmap]] を見てください。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:String#encode]]
  # を使ってください。
  # 
  # @see [[m:Kconv.#tolocale]]
  def tolocale; end

  # --- tosjis -> String
  # 
  # self のエンコーディングを shift_jis に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-sxm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#tosjis]]
  def tosjis; end

  # --- toutf16 -> String
  # 
  # self のエンコーディングを UTF-16BE に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-w16xm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#toutf16]]
  def toutf16; end

  # --- toutf32 -> String
  # 
  # self のエンコーディングを UTF-32 に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-w32xm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#toutf32]]
  def toutf32; end

  # --- toutf8 -> String
  # 
  # self のエンコーディングを UTF-8 に変換した文字列を
  # 返します。変換元のエンコーディングは文字列の内容から推測します。
  # 
  # このメソッドは MIME エンコードされた文字列を展開し、
  # いわゆる半角カナを全角に変換します。
  # これらを変換したくない場合は、 [[m:NKF.#nkf]]('-wxm0', str)
  # を使ってください。
  # 
  # @see [[m:Kconv.#toutf8]]
  def toutf8; end

  # --- tr(pattern, replace) -> String
  # 
  # pattern 文字列に含まれる文字を検索し、
  # それを replace 文字列の対応する文字に置き換えます。
  # 
  # pattern の形式は [[man:tr(1)]] と同じです。つまり、
  # `a-c' は a から c を意味し、"^0-9" のように
  # 文字列の先頭が `^' の場合は指定文字以外が置換の対象になります。
  # 
  # replace に対しても `-' による範囲指定が可能です。
  # 
  # `-' は文字列の両端にない場合にだけ範囲指定の意味になります。
  # `^' も文字列の先頭にあるときにだけ否定の効果を発揮します。
  # また、`-', `^', `\' はバックスラッシュ (`\') によりエスケープできます。
  # 
  # replace の範囲が pattern の範囲よりも小さい場合は、
  # replace の最後の文字が無限に続くものとして扱われます。
  # 
  # @param pattern    置き換える文字のパターン
  # @param replace    pattern で指定した文字を置き換える文字
  # 
  # //emlist[例][ruby]{
  # p "foo".tr("f", "X")      # => "Xoo"
  # p "foo".tr('a-z', 'A-Z')  # => "FOO"
  # p "FOO".tr('A-Z', 'a-z')  # => "foo"
  # 
  # # シーザー暗号の復号
  # p "ORYV".tr("A-Z", "D-ZA-C") # => "RUBY"
  # 
  # # 全角英数字といくつかの記号の半角化
  # email = "ｒｕｂｙ−ｌａｎｇ＠ｅｘａｍｐｌｅ．ｃｏｍ"
  # p email.tr("０-９ａ-ｚＡ-Ｚ．＠−", "0-9a-zA-Z.@-")
  # # => "ruby-lang@example.com"
  # //}
  # 
  # @see [[m:String#tr!]], [[m:String#tr_s]]
  def tr; end

  # --- tr!(pattern, replace) -> self | nil
  # 
  # pattern 文字列に含まれる文字を検索し、
  # それを replace 文字列の対応する文字に破壊的に置き換えます。
  # 
  # pattern の形式は [[man:tr(1)]] と同じです。
  # つまり、`a-c' は a から c を意味し、
  # "^0-9" のように文字列の先頭が `^' の場合は
  # 指定文字以外が置換の対象になります。
  # 
  # replace に対しても `-' による範囲指定が可能です。
  # 
  # `-' は文字列の両端にない場合にだけ範囲指定の意味になります。
  # `^' も文字列の先頭にあるときにだけ否定の効果を発揮します。
  # また、`-', `^', `\' はバックスラッシュ (`\') によりエスケープできます。
  # 
  # replace の範囲が pattern の範囲よりも小さい場合は、
  # replace の最後の文字が無限に続くものと扱われます。
  # 
  # tr! は self を変更して返しますが、
  # 置換が起こらなかった場合は nil を返します。
  # 
  # @param pattern    置き換える文字のパターン
  # @param replace    pattern で指定した文字を置き換える文字
  # 
  # @see [[m:String#tr]], [[m:String#tr_s]]
  def tr!; end

  # --- tr_s(pattern, replace) -> String
  # 
  # 文字列の中に pattern 文字列に含まれる文字が存在したら、
  # replace 文字列の対応する文字に置き換えます。さらに、
  # 置換した部分内に同一の文字の並びがあったらそれを 1 文字に圧縮します。
  # 
  # pattern の形式は [[man:tr(1)]] と同じです。
  # つまり「a-c」は a から c を意味し、
  # "^0-9" のように文字列の先頭が「^」の場合は指定した文字以外が置換の対象になります。
  # 
  # replace でも「-」を使って範囲を指定できます。
  # 
  # 「-」は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 同様に、「^」もその効果は文字列の先頭にあるときだけです。
  # また、「-」、「^」、「\」はバックスラッシュ (「\」) でエスケープできます。
  # 
  # replace の範囲が pattern の範囲よりも小さい場合、
  # replace の最後の文字が無限に続くものとして扱われます。
  # 
  # @param pattern    置き換える文字のパターン
  # @param replace    pattern で指定した文字を置き換える文字
  # 
  # //emlist[例][ruby]{
  # p "gooooogle".tr_s("o", "X")       # => "gXgle"
  # p "gooooogle".tr_s("a-z", "A-Z")   # => "GOGLE"
  # //}
  # 
  # 注意:
  # 一般に、tr_s を tr と squeeze で置き換えることはできません。
  # tr と squeeze の組みあわせでは tr の置換後の文字列全体を squeeze しますが、
  # tr_s は置換された部分だけを squeeze します。
  # 以下のコードを参照してください。
  # 
  # //emlist[例][ruby]{
  # p "foo".tr_s("o", "f")              # => "ff"
  # p "foo".tr("o", "f").squeeze("f")   # => "f"
  # //}
  # 
  # @see [[m:String#tr]]
  def tr_s; end

  # --- tr_s!(pattern, replace) -> self | nil
  # 
  # 文字列の中に pattern 文字列に含まれる文字が存在したら、
  # replace 文字列の対応する文字に置き換えます。さらに、
  # 置換した部分内に同一の文字の並びがあったらそれを 1 文字に圧縮します。
  # 
  # pattern の形式は [[man:tr(1)]] と同じです。
  # つまり「a-c」は a から c を意味し、
  # "^0-9" のように文字列の先頭が「^」の場合は指定した文字以外が置換の対象になります。
  # 
  # replace でも「-」を使って範囲を指定できます。
  # 
  # //emlist[][ruby]{
  # p "gooooogle".tr_s("a-z", "A-Z")   # => "GOGLE"
  # //}
  # 
  # 「-」は文字列の両端にない場合にだけ範囲指定の意味になります。
  # 同様に、「^」もその効果は文字列の先頭にあるときだけです。
  # また、「-」、「^」、「\」はバックスラッシュ (「\」) でエスケープできます。
  # 
  # replace の範囲が search の範囲よりも小さい場合、
  # replace の最後の文字が無限に続くものとして扱われます。
  # 
  # tr_s は置換後の文字列を生成して返します。
  # tr_s! は self を変更して返しますが、
  # 置換が起こらなかった場合は nil を返します。
  # 
  # 注意:
  # 一般に、tr_s! を tr! と squeeze! で置き換えることはできません。
  # tr! と squeeze! の組みあわせでは tr! の置換後の文字列全体を squeeze! しますが、
  # tr_s! は置換された部分だけを squeeze! します。
  # 以下のコードを参照してください。
  # 
  # //emlist[例][ruby]{
  # str = "foo"
  # str.tr_s!("o", "f")
  # p str   # => "ff"
  # 
  # str = "foo"
  # str.tr!("o", "f")
  # str.squeeze!("f")
  # p str   # => "f"
  # //}
  # 
  # @param pattern    置き換える文字のパターン
  # @param replace    pattern で指定した文字を置き換える文字
  # 
  # @see [[m:String#tr]], [[m:String#tr_s]]
  def tr_s!; end

  # --- undump -> String
  # self のエスケープを戻したものを返します。
  # 
  # [[m:String#dump]] の逆変換にあたります。
  # 
  # //emlist[例][ruby]{
  # "\"hello \\n ''\"".undump #=> "hello \n ''"
  # //}
  # 
  # @see [[m:String#dump]]
  def undump; end

  # --- unicode_normalize(form = :nfc) -> String
  # 
  # self を NFC、NFD、NFKC、NFKD のいずれかの正規化形式で Unicode 正規化し
  # た文字列を返します。
  # 
  # @param form 正規化形式を :nfc、:nfd、:nfkc、:nfkd のいずれかで指定しま
  #             す。省略した場合は :nfc になります。
  # 
  # @raise Encoding::CompatibilityError self が Unicode 文字列ではない場合
  #                                     に発生します。
  # 
  # このメソッドでの "Unicode 文字列" とは、UTF-8、UTF-16BE/LE、
  # UTF-32BE/LE だけではなく GB18030、UCS_2BE、and UCS_4BE を含みます。
  # 
  # また、self が UTF-8 以外のエンコーディングであった場合は一度 UTF-8 に変
  # 換してから正規化されるため、UTF-8 よりも遅くなっています。
  # 
  # //emlist[例][ruby]{
  # "a\u0300".unicode_normalize        # => 'à' ("\u00E0" と同じ)
  # "a\u0300".unicode_normalize(:nfc)  # => 'à' ("\u00E0" と同じ)
  # "\u00E0".unicode_normalize(:nfd)   # => 'à' ("a\u0300" と同じ)
  # "\xE0".force_encoding('ISO-8859-1').unicode_normalize(:nfd)
  #                                    # => Encoding::CompatibilityError raised
  # //}
  # 
  # @see [[m:String#unicode_normalize!]], [[m:String#unicode_normalized?]]
  def unicode_normalize; end

  # --- unicode_normalize!(form = :nfc) -> self
  # 
  # self を NFC、NFD、NFKC、NFKD のいずれかの正規化形式で Unicode 正規化し
  # た文字列に置き換えます。
  # 
  # (gsub!などと異なり)変換が行なわれなくても self を返します。
  # 
  # @param form 正規化形式を :nfc、:nfd、:nfkc、:nfkd のいずれかで指定しま
  #             す。省略した場合は :nfc になります。
  # 
  # @raise Encoding::CompatibilityError self が Unicode 文字列ではない場合
  #                                     に発生します。
  # 
  # //emlist[例][ruby]{
  # text = "a\u0300"
  # text.unicode_normalize!(:nfc)
  # text == "\u00E0"              # => true
  # text.unicode_normalize!(:nfd)
  # text == "a\u0300"             # => true
  # //}
  # 
  # @see [[m:String#unicode_normalize]], [[m:String#unicode_normalized?]]
  def unicode_normalize!; end

  # --- unicode_normalized?(form = :nfc) -> bool
  # 
  # self が引数 form で指定された正規化形式で Unicode 正規化された文字列か
  # どうかを返します。
  # 
  # @param form 正規化形式を :nfc、:nfd、:nfkc、:nfkd のいずれかで指定しま
  #             す。省略した場合は :nfc になります。
  # 
  # @raise Encoding::CompatibilityError self が Unicode 文字列ではない場合
  #                                     に発生します。
  # 
  # //emlist[例][ruby]{
  # "a\u0300".unicode_normalized?        # => false
  # "a\u0300".unicode_normalized?(:nfd)  # => true
  # "\u00E0".unicode_normalized?         # => true
  # "\u00E0".unicode_normalized?(:nfd)   # => false
  # "\xE0".force_encoding('ISO-8859-1').unicode_normalized?
  #                                      # => Encoding::CompatibilityError raised
  # //}
  # 
  # @see [[m:String#unicode_normalize]], [[m:String#unicode_normalize!]]
  def unicode_normalized?; end

  # --- unpack(template) -> Array
  # 
  # [[m:Array#pack]] で生成された文字列を
  # テンプレート文字列 template にしたがってアンパックし、
  # それらの要素を含む配列を返します。
  # 
  # @param template    pack テンプレート文字列
  # @return            オブジェクトの配列
  # 
  # 
  # 以下にあげるものは、[[m:Array#pack]]、[[m:String#unpack]]、[[m:String#unpack1]]
  # のテンプレート文字の一覧です。テンプレート文字は後に「長さ」を表す数字
  # を続けることができます。「長さ」の代わりに`*'とすることで「残り全て」
  # を表すこともできます。
  # 
  # 長さの意味はテンプレート文字により異なりますが大抵、
  #   "iiii"
  # のように連続するテンプレート文字は
  #   "i4"
  # と書き換えることができます。
  # 
  # テンプレート文字列中の空白類は無視されます。
  # また、`#' から改行あるいはテンプレート文字列の最後まではコメントとみな
  # され無視されます。
  # 
  # === 整数のテンプレート文字のシステム依存性
  # 
  # 各テンプレート文字の説明の中で、
  # short や long はシステムによらずそれぞれ 2, 4バイトサ
  # イズの数値(32ビットマシンで一般的なshort, longのサイズ)を意味していま
  # す。s, S, l, L に対しては直後に _ または ! を "s_" あるいは "s!" のように
  # 続けることでシステム依存の short, long のサイズにすることもできます。
  # 
  # i, I (int)のサイズは常にシステム依存であり、n, N, v, V
  # のサイズは常にシステム依存ではない(!をつけられない)ことに注意してください。
  # 
  # つまり、[[m:IO#ioctl]] などで C の構造体を渡すときのように、
  # システム依存のサイズとエンディアンに合わせる必要があるときには
  # s!, S!, i!, I!, l!, L!, q!, Q!, j!, J! を用います。
  # また、ネットワークプロトコルやファイルフォーマットのように、
  # システムに依存しないデータを扱うときには
  # n, N, v, V を用います。
  # 
  # 強制的にエンディアンを指定したいときは、
  # リトルエンディアンなら < を、
  # ビッグエンディアンなら >
  # を後ろにつけます。! と組み合わせることも可能です。
  # 
  # まとめると以下のようになります。
  # 
  # : エンディアン非依存、整数サイズ非依存 (ネットワークプロトコルなどに適切)
  # //emlist{
  #   n: big endian unsigned 16bit
  #   N: big endian unsigned 32bit
  #   v: little endian unsigned 16bit
  #   V: little endian unsigned 32bit
  # //}
  # 
  # : エンディアン依存、整数サイズ依存 (C の構造体などに適切)
  # //emlist{
  #   s!: signed short
  #   S!: unsigned short
  #   i,i!: signed int
  #   I,I!: unsigned int
  #   l!: signed long
  #   L!: unsigned long
  #   q!: signed long long
  #   Q!: unsigned long long
  #   j,j!: intptr_t
  #   J,J!: uintptr_t
  # //}
  # 
  # : エンディアン依存、整数サイズ非依存 (C99 の stdint.h にある厳密な幅を持つ整数型に適切)
  # //emlist{
  #   s: int16_t
  #   S: uint16_t
  #   l: int32_t
  #   L: uint32_t
  #   q: int64_t
  #   Q: uint64_t
  # //}
  # 
  # : エンディアンの強制指定(バイナリ解析などに適切)
  # //emlist{
  #   S>:  big endian unsigned 16bit(nと同じ)
  #   s>:  big endian int16_t
  #   s!>: big endian signed short
  #   l<:  little endian int32_t
  #   l!<: little endian signed long
  # //}
  # 
  # === 各テンプレート文字の説明
  # 
  # 説明中、[[m:Array#pack]] と [[m:String#unpack]] で違いのあるものは `/' で区切って
  # 「Array#pack の説明 / String#unpack の説明」としています。
  # 
  # : a
  # 
  #   ASCII文字列(ヌル文字を詰める/後続するヌル文字やスペースを残す)
  # //emlist[][ruby]{
  # ["abc"].pack("a")    # => "a"
  # ["abc"].pack("a*")   # => "abc"
  # ["abc"].pack("a4")   # => "abc\x00"
  # 
  # "abc\0".unpack("a4") # => ["abc\x00"]
  # "abc ".unpack("a4")  # => ["abc "]
  # //}
  # 
  # : A
  # 
  #   ASCII文字列(スペースを詰める/後続するヌル文字やスペースを削除)
  # //emlist[][ruby]{
  # ["abc"].pack("A")    # => "a"
  # ["abc"].pack("A*")   # => "abc"
  # ["abc"].pack("A4")   # => "abc "
  # 
  # "abc ".unpack("A4")  # => ["abc"]
  # "abc\0".unpack("A4") # => ["abc"]
  # //}
  # 
  # : Z
  # 
  #   ヌル終端文字列(長さが`*'の場合も含め、ヌル文字を詰める/後続するヌル文字を削除)
  # //emlist[][ruby]{
  # ["abc"].pack("Z")  # => "a"
  # ["abc"].pack("Z*") # => "abc\x00"
  # ["abc"].pack("Z5") # => "abc\x00\x00"
  # 
  # "abc\0".unpack("Z4") # => ["abc"]
  # "abc ".unpack("Z4")  # => ["abc "]
  # //}
  # 
  # : b
  # 
  #   ビットストリング(各バイトごとに下位ビットから上位ビット)
  # //emlist[][ruby]{
  # "\xFF\x00".unpack("b*") # => ["1111111100000000"]
  # "\x01\x02".unpack("b*") # => ["1000000001000000"]
  # "\x01\x02".unpack("b3") # => ["100"]
  # 
  # 
  # ["1000000001000000"].pack("b*") # => "\x01\x02"
  # //}
  # 
  # : B
  # 
  #   ビットストリング(各バイトごとに上位ビットから下位ビット)
  # //emlist[][ruby]{
  # "\xFF\x00".unpack("B*")  # => ["1111111100000000"]
  # "\x01\x02".unpack("B*")  # => ["0000000100000010"]
  # "\x01\x02".unpack("B9")  # => ["000000010"]
  # "\x01\x02".unpack("B15") # => ["000000010000001"]
  # 
  # ["0000000100000010"].pack("B*")  # => "\x01\x02"
  # ["0000000100000010"].pack("B0")  # => ""
  # ["0000000100000010"].pack("B1")  # => "\x00"
  # ["0000000100000010"].pack("B7")  # => "\x00"
  # ["0000000100000010"].pack("B8")  # => "\x01"
  # ["0000000100000010"].pack("B9")  # => "\x01\x00"
  # ["0000000100000010"].pack("B14") # => "\x01\x00"
  # ["0000000100000010"].pack("B15") # => "\x01\x02"
  # ["0000000100000010"].pack("B16") # => "\x01\x02"
  # //}
  # 
  # : h
  # 
  #   16進文字列(下位ニブルが先)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("h*") # => ["10ef"]
  # "\x01\xFE".unpack("h3") # => ["10e"]
  # 
  # ["10ef"].pack("h*") # => "\x01\xFE"
  # //}
  # 
  # : H
  # 
  #   16進文字列(上位ニブルが先)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("H*") # => ["01fe"]
  # "\x01\xFE".unpack("H3") # => ["01f"]
  # "~".unpack("H2")        # => ["7e"]
  # 
  # ["01fe"].pack("H*") # => "\x01\xFE"
  # ["7e"].pack("H2")   # => "~"
  # //}
  # 
  # : c
  # 
  #   char (8bit 符号つき整数)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("c*") # => [1, -2]
  # 
  # [1, -2].pack("c*")  # => "\x01\xFE"
  # [1, 254].pack("c*") # => "\x01\xFE"
  # //}
  # 
  # : C
  # 
  #   unsigned char (8bit 符号なし整数)
  # //emlist[][ruby]{
  # "\x01\xFE".unpack("C*") # => [1, 254]
  # 
  # [1, -2].pack("C*")  # => "\x01\xFE"
  # [1, 254].pack("C*") # => "\x01\xFE"
  # //}
  # 
  # : s
  # 
  #   short (16bit 符号つき整数, エンディアンに依存)
  #   (s! は 16bit でなく、short のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("s*") # => [513, -514]
  # 
  # [513, 65022].pack("s*") # => "\x01\x02\xFE\xFD"
  # [513, -514].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("s*") # => [258, -259]
  # 
  # [258, 65277].pack("s*") # => "\x01\x02\xFE\xFD"
  # [258, -259].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  # : S
  # 
  #   unsigned short (16bit 符号なし整数, エンディアンに依存)
  #   (S! は 16bit でなく、short のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("S*") # => [513, 65022]
  # 
  # [513, 65022].pack("s*") # => "\x01\x02\xFE\xFD"
  # [513, -514].pack("s*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  #   ビッグエンディアン:
  # 
  # //emlist[][ruby]{
  # "\x01\x02\xFE\xFD".unpack("S*") # => [258, 65277]
  # 
  # [258, 65277].pack("S*") # => "\x01\x02\xFE\xFD"
  # [258, -259].pack("S*")  # => "\x01\x02\xFE\xFD"
  # //}
  # 
  # : i
  # 
  #   int (符号つき整数, エンディアンと int のサイズに依存)
  # 
  #   リトルエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("i*") # => [67305985, -50462977]
  # 
  # [67305985, 4244504319].pack("i*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("i*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("i*") # => [16909060, -66052]
  # 
  # [16909060, 4294901244].pack("i*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("i*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # : I
  # 
  #   unsigned int (符号なし整数, エンディアンと int のサイズに依存)
  # 
  #   リトルエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("I*") # => [67305985, 4244504319]
  # 
  # [67305985, 4244504319].pack("I*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("I*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  #   ビッグエンディアン, 32bit int:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("I*") # => [16909060, 4294901244]
  # 
  # [16909060, 4294901244].pack("I*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("I*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : l
  # 
  #   long (32bit 符号つき整数, エンディアンに依存)
  #   (l! は 32bit でなく、long のサイズに依存)
  # 
  #   リトルエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("l*") # => [67305985, -50462977]
  # 
  # [67305985, 4244504319].pack("l*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("l*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("l*") # => [16909060, -66052]
  # 
  # [16909060, 4294901244].pack("l*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("l*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : L
  # 
  #   unsigned long (32bit 符号なし整数, エンディアンに依存)
  #   (L! は 32bit でなく、long のサイズに依存)
  # 
  #   リトルエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("L*") # => [67305985, 4244504319]
  # 
  # [67305985, 4244504319].pack("L*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [67305985, -50462977].pack("L*")  # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  #   ビッグエンディアン, 32bit long:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\xFF\xFE\xFD\xFC".unpack("L*") # => [16909060, 4294901244]
  # 
  # [16909060, 4294901244].pack("L*") # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # [16909060, -66052].pack("L*")     # => "\x01\x02\x03\x04\xFF\xFE\xFD\xFC"
  # //}
  # 
  # : q
  # 
  #   64bit 符号付き整数 (エンディアンに依存)
  #   (q! は 64bit でなく、long long のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("q*")
  # # => [578437695752307201, -506097522914230529]
  # 
  # [578437695752307201, -506097522914230529].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [578437695752307201, 17940646550795321087].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("q*")
  # # => [72623859790382856, -283686952306184]
  # 
  # [72623859790382856, -283686952306184].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [72623859790382856, 18446460386757245432].pack("q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # : Q
  # 
  #   64bit 符号なし整数 (エンディアンに依存)
  #   (Q! は 64bit でなく、long long のサイズに依存)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("Q*")
  # # => [578437695752307201, 17940646550795321087]
  # 
  # [578437695752307201, 17940646550795321087].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [578437695752307201, -506097522914230529].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # 
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # "\x01\x02\x03\x04\x05\x06\x07\x08\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8".unpack("Q*")
  # # => [72623859790382856, 18446460386757245432]
  # 
  # [72623859790382856, 18446460386757245432].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # [72623859790382856, -283686952306184].pack("Q*")
  # # => "\x01\x02\x03\x04\x05\x06\a\b\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
  # //}
  # : m
  # 
  #   base64された文字列。60 オクテットごと(と最後)に改行コードが付加されます。
  # 
  #   Base64は、3オクテット(8bits * 3 = 24bits)のバイナリコードをASCII文字の
  #   うちの65文字 ([A-Za-z0-9+/]の64文字とpaddingのための'=')だけを使用して
  #   4オクテット(6bits * 4 = 24bits)の印字可能文字列に変換するエンコーディ
  #   ング法です。[[RFC:2045]], [[RFC:4648]] で定義されています。
  # //emlist[][ruby]{
  # [""].pack("m")             # => ""
  # ["\0"].pack("m")           # => "AA==\n"
  # ["\0\0"].pack("m")         # => "AAA=\n"
  # ["\0\0\0"].pack("m")       # => "AAAA\n"
  # ["\xFF"].pack("m")         # => "/w==\n"
  # ["\xFF\xFF"].pack("m")     # => "//8=\n"
  # ["\xFF\xFF\xFF"].pack("m") # => "////\n"
  # 
  # ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"].pack("m")
  # # => "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJT\nVFVWV1hZWg==\n"
  # ["abcdefghijklmnopqrstuvwxyz"].pack("m3")
  # # => "YWJj\nZGVm\nZ2hp\namts\nbW5v\ncHFy\nc3R1\ndnd4\neXo=\n"
  # 
  # "".unpack("m")       # => [""]
  # "AA==\n".unpack("m") # => ["\x00"]
  # "AA==".unpack("m")   # => ["\x00"]
  # 
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJT\nVFVWV1hZWg==\n".unpack("m")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg==\n".unpack("m")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # //}
  #   m0 は [[RFC:4648]] 対応
  # //emlist[][ruby]{
  # [""].pack("m0")             # => ""
  # ["\0"].pack("m0")           # => "AA=="
  # ["\0\0"].pack("m0")         # => "AAA="
  # ["\0\0\0"].pack("m0")       # => "AAAA"
  # ["\xFF"].pack("m0")         # => "/w=="
  # ["\xFF\xFF"].pack("m0")     # => "//8="
  # ["\xFF\xFF\xFF"].pack("m0") # => "////"
  # 
  # ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"].pack("m0")
  # # => "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg=="
  # 
  # "".unpack("m0")       # => [""]
  # "AA==\n".unpack("m0") # => ArgumentError (invalid base64)
  # "AA==".unpack("m0")   # => ["\x00"]
  # 
  # "YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXpBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWg==".unpack("m0")
  # # => ["abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"]
  # //}
  # @see [[lib:base64]]
  # 
  # : M
  # 
  #   quoted-printable encoding された文字列
  # //emlist[][ruby]{
  # ["a b c\td \ne"].pack("M") # => "a b c\td =\n\ne=\n"
  # 
  # "a b c\td =\n\ne=\n".unpack("M") # => ["a b c\td \ne"]
  # //}
  # 
  # : n
  # 
  #   ネットワークバイトオーダー(ビッグエンディアン)のunsigned short (16bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1,32767,-32768,65535].pack("n*")
  # # => "\x00\x00\x00\x01\xFF\xFF\x7F\xFF\x80\x00\xFF\xFF"
  # 
  # "\x00\x00\x00\x01\xFF\xFF\x7F\xFF\x80\x00\xFF\xFF".unpack("n*")
  # # => [0, 1, 65535, 32767, 32768, 65535]
  # //}
  # 
  # : N
  # 
  #   ネットワークバイトオーダー(ビッグエンディアン)のunsigned long (32bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1].pack("N*") # => "\x00\x00\x00\x00\x00\x00\x00\x01\xFF\xFF\xFF\xFF"
  # 
  # "\x00\x00\x00\x00\x00\x00\x00\x01\xFF\xFF\xFF\xFF".unpack("N*") # => [0, 1, 4294967295]
  # //}
  # 
  # : v
  # 
  #   "VAX"バイトオーダー(リトルエンディアン)のunsigned short (16bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1,32767,-32768,65535].pack("v*")
  # # => "\x00\x00\x01\x00\xFF\xFF\xFF\x7F\x00\x80\xFF\xFF"
  # 
  # "\x00\x00\x01\x00\xFF\xFF\xFF\x7F\x00\x80\xFF\xFF".unpack("v*")
  # # => [0, 1, 65535, 32767, 32768, 65535]
  # //}
  # 
  # : V
  # 
  #   "VAX"バイトオーダー(リトルエンディアン)のunsigned long (32bit 符号なし整数)
  # //emlist[][ruby]{
  # [0,1,-1].pack("V*") # => "\x00\x00\x00\x00\x01\x00\x00\x00\xFF\xFF\xFF\xFF"
  # 
  # 
  # "\x00\x00\x00\x00\x01\x00\x00\x00\xFF\xFF\xFF\xFF".unpack("V*") # => [0, 1, 4294967295]
  # //}
  # 
  # : f
  # 
  #   単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754 単精度 リトルエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("f")      # => "\x00\x00\x80?"
  # [0.0/0.0].pack("f")  # => "\x00\x00\xC0\x7F"      # NaN
  # [1.0/0.0].pack("f")  # => "\x00\x00\x80\x7F"      # +Inf
  # [-1.0/0.0].pack("f") # => "\x00\x00\x80\xFF"      # -Inf
  # //}
  # 
  #   MIPS (IEEE754 単精度 ビッグエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("f")      # => "?\x80\x00\x00"
  # [0.0/0.0].pack("f")  # => "\x7F\xBF\xFF\xFF"      # NaN
  # [1.0/0.0].pack("f")  # => "\x7F\x80\x00\x00"      # +Inf
  # [-1.0/0.0].pack("f") # => "\xFF\x80\x00\x00"      # -Inf
  # //}
  # 
  #   VAX (NetBSD 3.0) (非IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("f") # => "\x80@\x00\x00"
  # //}
  # 
  # : d
  # 
  #   倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754 倍精度 リトルエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("d")      # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # [0.0/0.0].pack("d")  # => "\x00\x00\x00\x00\x00\x00\xF8\x7F"      # NaN
  # [1.0/0.0].pack("d")  # => "\x00\x00\x00\x00\x00\x00\xF0\x7F"      # +Inf
  # [-1.0/0.0].pack("d") # => "\x00\x00\x00\x00\x00\x00\xF0\xFF"      # -Inf
  # //}
  # 
  #   MIPS (IEEE754 倍精度 ビッグエンディアン):
  # //emlist[][ruby]{
  # [1.0].pack("d")      # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # [0.0/0.0].pack("d")  # => "\x7F\xF7\xFF\xFF\xFF\xFF\xFF\xFF"      # NaN
  # [1.0/0.0].pack("d")  # => "\x7F\xF0\x00\x00\x00\x00\x00\x00"      # +Inf
  # [-1.0/0.0].pack("d") # => "\xFF\xF0\x00\x00\x00\x00\x00\x00"      # -Inf
  # //}
  # 
  #   VAX (NetBSD 3.0) (非IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("d") # => "\x80@\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  # : e
  # 
  #   リトルエンディアンの単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("e") # => "\x00\x00\x80?"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("e") # => "\x00\x00\x80?"
  # //}
  # 
  # : E
  # 
  #   リトルエンディアンの倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("E") # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("E") # => "\x00\x00\x00\x00\x00\x00\xF0?"
  # //}
  # 
  # : g
  # 
  #   ビッグエンディアンの単精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("g") # => "?\x80\x00\x00"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("g") # => "?\x80\x00\x00"
  # //}
  # 
  #   IEEE754準拠な環境の場合、以下のようにして符号、指数部、仮数部を取り出せます。
  # //emlist[][ruby]{
  # s = [v].pack("g").unpack("B*")[0][0,1]      # 符号
  # e = [v].pack("g").unpack("B*")[0][1,8]      # 指数部
  # f = [v].pack("g").unpack("B*")[0][9,23]     # 仮数部
  # //}
  # 
  #   そして、s, e, f の意味は以下の通りです。
  # //emlist[][ruby]{
  # sgn = s == "0" ? +1.0 : -1.0
  # exp = Integer("0b" + e)
  # fra = Integer("0b" + f)
  # if exp == 0
  #   if fra == 0
  #     sgn * 0                     # ±0 (positive/negative zero)
  #   else
  #     sgn * fra * 2**(-126-23)    # 非正規化数 (denormalized number)
  #   end
  # elsif exp == 255
  #   if fra == 0
  #     sgn * Inf                   # ±∞ (positive/negative infinity)
  #   else
  #     NaN                         # 非数 (not a number)
  #   end
  # else
  #   fra += 1 << 23                # ゲタ
  #   sgn * fra * 2**(exp-127-23)   # 正規化数 (normalized number)
  # end
  # //}
  # 
  # : G
  # 
  #   ビッグエンディアンの倍精度浮動小数点数(機種依存)
  # 
  #   x86_64 (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("G") # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   MIPS (IEEE754):
  # //emlist[][ruby]{
  # [1.0].pack("G") # => "?\xF0\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   IEEE754準拠な環境の場合、以下のようにして符号、指数部、仮数部を取り出せます。
  # //emlist[][ruby]{
  # s = [v].pack("G").unpack("B*")[0][0,1]    # 符号
  # e = [v].pack("G").unpack("B*")[0][1,11]   # 指数部
  # f = [v].pack("G").unpack("B*")[0][12,52]  # 仮数部
  # //}
  # 
  #   そして、s, e, f の意味は以下の通りです。
  # //emlist[][ruby]{
  # sgn = s == "0" ? +1.0 : -1.0
  # exp = Integer("0b" + e)
  # fra = Integer("0b" + f)
  # if exp == 0
  #   if fra == 0
  #     sgn * 0                     # ±0 (positive/negative zero)
  #   else
  #     sgn * fra * 2**(-1022-52)   # 非正規化数 (denormalized number)
  #   end
  # elsif exp == 2047
  #   if fra == 0
  #     sgn * Inf                   # ±∞ (positive/negative infinity)
  #   else
  #     NaN                         # 非数 (not a number)
  #   end
  # else
  #   fra += 1 << 52                # ゲタ
  #   sgn * fra * 2**(exp-1023-52)  # 正規化数 (normalized number)
  # end
  # //}
  # 
  # : p
  # 
  #   ヌル終端の文字列へのポインタ
  # //emlist[][ruby]{
  # [""].pack("p")             # => "\x980\xBEf\x1CV\x00\x00"
  # ["a", "b", "c"].pack("p3") # => "\x98\xE5\x9ER\xD2U\x00\x00p\xE5\x9ER\xD2U\x00\x00H\xE5\x9ER\xD2U\x00\x00"
  # [nil].pack("p")            # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  # : P
  # 
  #   構造体(固定長文字列)へのポインタ
  # //emlist[][ruby]{
  # [nil].pack("P")    # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # ["abc"].pack("P3") # => "\xA0\xEE\er\x84U\x00\x00"
  # 
  # ["abc"].pack("P4") # => ArgumentError: too short buffer for P(3 for 4)
  # [""].pack("P")     # => ArgumentError: too short buffer for P(0 for 1)
  # //}
  # 
  # : u
  # 
  #   uuencodeされた文字列
  # //emlist[][ruby]{
  # [""].pack("u")           # => ""
  # ["a"].pack("u")          # => "!80``\n"
  # ["abc"].pack("u")        # => "#86)C\n"
  # ["abcd"].pack("u")       # => "$86)C9```\n"
  # ["a"*45].pack("u")       # => "M86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A\n"
  # ["a"*46].pack("u")       # => "M86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A86%A\n!80``\n"
  # ["abcdefghi"].pack("u6") # => "&86)C9&5F\n#9VAI\n"
  # //}
  # 
  # : U
  # 
  #   UTF-8
  # //emlist[][ruby]{
  # [0].pack("U")                               # => "\u0000"
  # [1].pack("U")                               # => "\u0001"
  # [0x7f].pack("U")                            # => "\u007F"
  # [0x80].pack("U")                            # => "\u0080"
  # [0x7fffffff].pack("U")                      # => "\xFD\xBF\xBF\xBF\xBF\xBF"
  # [0x80000000].pack("U")                      # => RangeError: pack(U): value out of range
  # [0,256,65536].pack("U3").b                  # => "\x00\xC4\x80\xF0\x90\x80\x80"
  # 
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U3") # => [0, 256, 65536]
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U")  # => [0]
  # "\x00\xC4\x80\xF0\x90\x80\x80".unpack("U*") # => [0, 256, 65536]
  # //}
  # 
  # : w
  # 
  #   BER圧縮整数
  # 
  #   1バイトあたり7ビットを使用して必要最小限のバイト数で任意サイズの
  #   0以上の整数を表す数値表現。各バイトの最上位ビットはデータの最後
  #   を除いて必ず1が立っている(つまり最上位ビットはどこまでデータがあ
  #   るかを示している)。
  # 
  #   ISO/IEC 8825-1:1995 : Information technology−ASN.1 encoding rules : Specification of Basic Encoding Rules(BER) に定められる整数の符号化方法。
  # 
  # //emlist[][ruby]{
  # [0].pack("w")             # => "\x00"
  # [1].pack("w")             # => "\x01"
  # [127].pack("w")           # => "\x7F"
  # [128].pack("w")           # => "\x81\x00"
  # [0x3fff].pack("w")        # => "\xFF\x7F"
  # [0x4000].pack("w")        # => "\x81\x80\x00"
  # [0x3fffffff].pack("w")    # => "\x83\xFF\xFF\xFF\x7F"
  # [0x40000000].pack("w")    # => "\x84\x80\x80\x80\x00"
  # [0xffffffff].pack("w")    # => "\x8F\xFF\xFF\xFF\x7F"
  # [0x100000000].pack("w")   # => "\x90\x80\x80\x80\x00"
  # 
  # "\x00".unpack("w")              # => [0]
  # "\x00\x81\x00\x01".unpack("w*") # => [0, 128, 1]
  # //}
  # 
  #   なお、BER圧縮整数でエンコードした結果は大小関係を保存しない。
  #   たとえば、[0x3fff].pack("w") > [0x4000].pack("w") である。
  # 
  # : x
  # 
  #   ヌルバイト（pack）／1バイト読み飛ばし（unpack）
  # //emlist[][ruby]{
  # [97, 98].pack("CxC")    # => "a\x00b"
  # [97, 98].pack("Cx3C")   # => "a\x00\x00\x00b"
  # 
  # "abc".unpack("CxC")  # => [97, 99]
  # "abc".unpack("Cx3C") # => ArgumentError: x outside of string
  # //}
  # 
  # : X
  # 
  #   1バイト後退
  # //emlist[][ruby]{
  # [97, 98, 99].pack("CCXC") # => "ac"
  # 
  # "abcdef".unpack("x*XC") # => [102]
  # //}
  # 
  # : @
  # 
  #   絶対位置への移動
  # //emlist[][ruby]{
  # [97, 98].pack("C @3 C") # => "a\x00\x00b"
  # 
  # "abcd".unpack("C @3 C") # => [97, 100]
  # //}
  # 
  # : j
  # 
  # intptr_t (ポインタの幅の符号つき整数, エンディアンに依存)
  # 
  # : J
  # 
  # uintptr_t (ポインタの幅の符号なし整数, エンディアンに依存)
  # 
  # === 使用例
  # 
  # 以下、pack/unpack の使用例の一部です。
  # 
  # pack を使用しなくても同じことができる場合はその例も載せています。
  # pack は暗号になりやすい面があることを考慮し、pack を使いたくない人
  # に別解を示すためです。
  # 
  # : 数値(文字コード)の配列を文字列に変換する例
  # //emlist[][ruby]{
  # [82, 117, 98, 121].pack("cccc")  # => "Ruby"
  # [82, 117, 98, 121].pack("c4")    # => "Ruby"
  # [82, 117, 98, 121].pack("c*")    # => "Ruby"
  # 
  # s = ""
  # [82, 117, 98, 121].each {|c| s << c}
  # s    # => "Ruby"
  # 
  # [82, 117, 98, 121].collect {|c| sprintf "%c", c}.join   # => "Ruby"
  # 
  # [82, 117, 98, 121].inject("") {|s, c| s << c}    # => "Ruby"
  # //}
  # 
  # : 文字列を数値(文字コード)の配列に変換する例
  # //emlist[][ruby]{
  # "Ruby".unpack('C*')    # => [82, 117, 98, 121]
  # 
  # a = []
  # "Ruby".each_byte {|c| a << c}
  # a    # => [82, 117, 98, 121]
  # //}
  # 
  # : "x" でヌルバイトを埋めることができる
  # //emlist[][ruby]{
  # [82, 117, 98, 121].pack("ccxxcc")    # => "Ru\x00\x00by"
  # //}
  # 
  # : "x" で文字を読み飛ばす事が出来る
  # //emlist[][ruby]{
  # "Ru\x00\x00by".unpack('ccxxcc')    # => [82, 117, 98, 121]
  # //}
  # 
  # : Hexダンプを数値の配列に変換する例
  # //emlist[][ruby]{
  # "61 62 63 64 65 66".delete(' ').lines.pack('H*').unpack('C*')
  # # => [97, 98, 99, 100, 101, 102]
  # 
  # "61 62 63 64 65 66".split.collect {|c| c.hex}
  # # => [97, 98, 99, 100, 101, 102]
  # //}
  # 
  # : バイナリと16進数のpackでは長さ指定は生成されるバイト数ではなく、ビットやニブルの個数を表す
  # //emlist[][ruby]{
  # [0b01010010, 0b01110101, 0b01100010, 0b01111001].pack("C4")
  # # => "Ruby"
  # ["01010010011101010110001001111001"].pack("B32") # 8 bits * 4
  # # => "Ruby"
  # 
  # [0x52, 0x75, 0x62, 0x79].pack("C4")
  # # => "Ruby"
  # ["52756279"].pack("H8")  # 2 nybbles * 4
  # # => "Ruby"
  # //}
  # 
  # : テンプレート文字'a'の長さ指定は1つの文字列だけに適用される
  # //emlist[][ruby]{
  # ["RUBY", "u", "b", "y"].pack("a4")
  # # => "RUBY"
  # 
  # ["RUBY", "u", "b", "y"].pack("aaaa")
  # # => "Ruby"
  # 
  # ["RUBY", "u", "b", "y"].pack("a*aaa")
  # # => "RUBYuby"
  # //}
  # 
  # : テンプレート文字"a"は、長さが足りない分をヌル文字で補う
  # //emlist[][ruby]{
  # ["Ruby"].pack("a8")
  # # => "Ruby\x00\x00\x00\x00"
  # //}
  # 
  # : リトルエンディアンとビッグエンディアン
  # //emlist[][ruby]{
  # [1,2].pack("s2")
  # # => "\x01\x00\002\x00" # リトルエンディアンのシステムでの出力
  # # => "\x00\x01\x00\002" # ビッグエンディアンのシステムでの出力
  # 
  # [1,2].pack("n2")
  # # => "\x00\x01\x00\002" # システムによらずビッグエンディアン
  # 
  # [1,2].pack("v2")
  # # => "\x01\x00\002\x00" # システムによらずリトルエンディアン
  # //}
  # 
  # : ネットワークバイトオーダの signed long
  # //emlist[][ruby]{
  # s = "\xFF\xFF\xFF\xFE"
  # n = s.unpack("N")[0]
  # if n[31] == 1
  #   n = -((n ^ 0xffff_ffff) + 1)
  # end
  # n # => -2
  # //}
  # 
  # : ネットワークバイトオーダの signed long(その2)
  # //emlist[][ruby]{
  # s = "\xFF\xFF\xFF\xFE"
  # n = s.unpack("N").pack("l").unpack("l")[0]
  # n # => -2
  # //}
  # 
  # : IPアドレス
  # //emlist[][ruby]{
  # require 'socket'
  # official_hostname, alias_hostnames, address_family, *address_list = Socket.gethostbyname("localhost")
  # address_list.find {|address| address.size == 4 }.unpack("C4").join(".")
  # # => "127.0.0.1"
  # 
  # "127.0.0.1".split(".").collect {|c| c.to_i}.pack("C4")
  # # => "\x7F\x00\x00\x01"
  # //}
  # 
  # : sockaddr_in 構造体
  # //emlist[][ruby]{
  # require 'socket'
  # [Socket::AF_INET,
  #  Socket.getservbyname('echo'),
  #  127, 0, 0, 1].pack("s n C4 x8")
  # # => "\x02\x00\x00\a\x7F\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00"
  # //}
  # 
  #   pack/unpack を使う代わりに
  #   [[m:Socket.pack_sockaddr_in]],
  #   [[m:Socket.unpack_sockaddr_in]] メソッドがあります。
  # 
  # : '\0'終端文字列のアドレス
  # 
  #   テンプレート文字 "p" や "P" は、C 言語レベルのインタフェースのた
  #   めにあります(例えば [[m:IO#ioctl]])。
  # //emlist[][ruby]{
  # ["foo"].pack("p")    # => "xp\xC2\x85\vV\x00\x00"
  # //}
  # 
  #   結果の文字列はゴミに見えますが、実際は文字列"foo\0"を指すアドレ
  #   ス(のバイナリ表現)です。以下のようにすれば見慣れた表記で見ること
  #   が出来ます
  # //emlist[][ruby]{
  # printf "%#014x\n", "xp\xC2\x85\vV\x00\x00".unpack("J")[0] # => 0x560b85c27078
  # //}
  # 
  #   アドレスが指す先のオブジェクト(この例で "foo\0") は、pack の結
  #   果が GC されるまではGCされないことが保証されています。
  # 
  #   unpack("p"), unpack("P") は、pack の結果からしか unpack できません。
  # //emlist[][ruby]{
  # ["foo"].pack("p").unpack("p") # => ["foo"]
  # "xp\xC2\x85\vV\x00\x00".unpack("p")
  # # => ArgumentError: no associated pointer
  # //}
  #   "p" や "P" は、nil を特別に扱い NULL
  #   ポインタとして解釈します。(以下は、64bitマシンで一般的な結果)
  # //emlist[][ruby]{
  # [nil].pack("p")        # => "\x00\x00\x00\x00\x00\x00\x00\x00"
  # "\x00\x00\x00\x00\x00\x00\x00\x00".unpack("p") # => [nil]
  # //}
  # 
  # : 構造体のアドレス
  # 
  #   例えば、
  # //emlist{
  #       struct {
  #         int   a;
  #         short b;
  #         long  c;
  #       } v = {1,2,3};
  # //}
  #   を表す文字列は
  # //emlist[][ruby]{
  # v = [1,2,3].pack("i!s!l!")
  # //}
  #   です。(byte alignment の問題から実際は適当な padding が必要に
  #   なるかもしれません)
  # 
  #   この構造体を指すアドレスは
  # //emlist[][ruby]{
  # [v].pack("P")  # => "\xC0\xCC2L\fV\x00\x00"
  # //}
  #   で得られます。
  # 
  # : UTF-8からUCS-2への変換 (サロゲートを処理していないので UTF-16 とはいえない)
  # 
  #   リトルエンディアン:
  # //emlist[][ruby]{
  # ("Comments").unpack("U*").pack("v*") # => "C\x00o\x00m\x00m\x00e\x00n\x00t\x00s\x00"
  # //}
  #   ビッグエンディアン:
  # //emlist[][ruby]{
  # ("Comments").unpack("U*").pack("n*") # => "\x00C\x00o\x00m\x00m\x00e\x00n\x00t\x00s"
  # //}
  # 
  # @see [[m:String#unpack1]], [[m:Array#pack]]
  def unpack; end

  # --- unpack1(format) -> object
  # 
  # formatにしたがって文字列をデコードし、展開された1つ目の値を返します。
  # unpackは配列を返しますがunpack1は配列の1つ目の要素のみを返します。
  # 
  # //emlist[例][ruby]{
  # "ABC".unpack1("C*") # => 65
  # "ABC".unpack("C*")  # => [65, 66, 67]
  # //}
  # 
  # @see [[m:String#unpack]], [[m:Array#pack]]
  def unpack1; end

  # --- upcase(*options) -> String
  # 
  # 全ての小文字を対応する大文字に置き換えた文字列を返します。
  # どの文字がどう置き換えられるかは、オプションの有無や文字列のエンコーディングに依存します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # p "stRIng? STring.".upcase   # => "STRING? STRING."
  # //}
  # 
  # @see [[m:String#upcase!]], [[m:String#downcase]],
  #      [[m:String#swapcase]], [[m:String#capitalize]]
  def upcase; end

  # --- upcase!(*options) -> self | nil
  # 
  # 全ての小文字を対応する大文字に破壊的に置き換えます。
  # どの文字がどう置き換えられるかは、オプションの有無や文字列のエンコーディングに依存します。
  # 
  # @param options オプションの詳細は [[m:String#downcase]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # buf = "stRIng? STring."
  # buf.upcase!
  # p buf   # => "STRING? STRING."
  # //}
  # 
  # @see [[m:String#upcase]], [[m:String#downcase!]],
  #      [[m:String#swapcase!]], [[m:String#capitalize!]]
  def upcase!; end

  # --- upto(max, exclusive = false) {|s| ... } -> self
  # 
  # self から始めて max まで
  # 「次の文字列」を順番にブロックに与えて繰り返します。
  # 「次」の定義については [[m:String#succ]] を参照してください。
  # 
  # たとえば以下のコードは a, b, c, ... z, aa, ... az, ..., za を
  # 出力します。
  # 
  # //emlist[][ruby]{
  # ("a" .. "za").each do |str|
  #   puts str
  # end
  # 'a'.upto('za') do |str|
  #   puts str
  # end
  # //}
  # 
  # @param max    繰り返しをやめる文字列
  # 
  # @param exclusive max を含むかどうか。false の場合は max を含む。
  def upto; end

  # --- valid_encoding?  -> bool
  # 
  # 文字列の内容が、現在のエンコーディングに照らしあわせて妥当であれば
  # true を返します。さもなくば false を返します。
  # 
  # //emlist[例][ruby]{
  # "\xc2\xa1".force_encoding("UTF-8").valid_encoding?  #=> true
  # "\xc2".force_encoding("UTF-8").valid_encoding?      #=> false
  # "\x80".force_encoding("UTF-8").valid_encoding?      #=> false
  # //}
  def valid_encoding?; end

  # --- new(string = "")                -> String
  # --- new(string = "", encoding: string.encoding, capacity: 127) -> String
  # --- new(string = "", encoding: string.encoding, capacity: string.bytesize) -> String
  # 
  # string と同じ内容の新しい文字列を作成して返します。
  # 引数を省略した場合は空文字列を生成して返します。
  # 
  # @param string   文字列
  # @param encoding 作成する文字列のエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します(変換は行われま
  #                 せん)。省略した場合は引数 string のエンコーディングと同
  #                 じになります(ただし、string が指定されていなかった場合は
  #                 [[m:Encoding::ASCII_8BIT]]になります)。
  # @param capacity 内部バッファのサイズを指定します。
  #                 指定することで、なんども文字列連結する
  #                 (そしてreallocがなんども呼ばれる)ときの
  #                 パフォーマンスが改善されるかもしれません。
  #                 省略した場合、引数stringのバイト数が127未満であれば127、
  #                 それ以上であればstring.bytesizeになります。
  # @return         引数 string と同じ内容の文字列オブジェクト
  # 
  # //emlist[例][ruby]{
  # text = "hoge".encode("EUC-JP")
  # no_option = String.new(text)                             # => "hoge"
  # no_option.encoding == Encoding::EUC_JP                   # => true
  # with_encoding = String.new(text, encoding: "UTF-8")      # => "hoge"
  # with_encoding.encoding == Encoding::UTF_8                # => true
  # String.new("test", encoding: "UTF-8", capacity: 100_000) # => "test"
  # //}
  def new; end

  # --- try_convert(obj) -> String | nil
  # 
  # obj を String に変換しようと試みます。変換には [[m:Object#to_str]] メソッ
  # ドが使われます。変換後の文字列を返すか、何らかの理由により変換できなかっ
  # た場合は nil が返されます。
  # 
  # @param obj   変換する任意のオブジェクト
  # @return      変換後の文字列または nil
  # 
  # //emlist[例][ruby]{
  # String.try_convert("str")     # => "str"
  # String.try_convert(/re/)      # => nil
  # //}
  def try_convert; end

end
