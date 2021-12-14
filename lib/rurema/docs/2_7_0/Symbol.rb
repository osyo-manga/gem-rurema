class Symbol
  # --- <=>(other) -> -1 | 0 | 1 | nil
  # 
  # self と other のシンボルに対応する文字列を ASCII コード順で比較して、
  # self が小さい時には -1、等しい時には 0、大きい時には 1 を返します。
  # 
  # other がシンボルではなく比較できない時には nil を返します。
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # //emlist[][ruby]{
  # p :aaa <=> :xxx  # => -1
  # p :aaa <=> :aaa  # => 0
  # p :xxx <=> :aaa  # => 1
  # p :foo <=> "foo" # => nil
  # //}
  # 
  # @see [[m:String#<=>]], [[m:Symbol#casecmp]]
  def <=>; end

  # --- ==(other)        -> true | false
  # 
  # other が同じシンボルの時に真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # 例:
  # 
  #   :aaa == :aaa    #=> true
  #   :aaa == :xxx    #=> false
  def ==; end

  # --- =~(other) -> Integer | nil
  # 
  # 正規表現 other とのマッチを行います。
  # 
  # (self.to_s =~ other と同じです。)
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # @return マッチが成功すればマッチした位置のインデックスを、そうでなければ nil を返します。
  # 
  #   p :foo =~ /foo/    # => 0
  #   p :foobar =~ /bar/ # => 3
  #   p :foo =~ /bar/    # => nil
  # 
  # @see [[m:String#=~]]
  def =~; end

  # --- [](nth) -> String | nil
  # --- slice(nth) -> String | nil
  # 
  # nth 番目の文字を返します。
  # 
  # (self.to_s[nth] と同じです。)
  # 
  # @param nth 文字の位置を表す整数を指定します。
  # 
  #   :foo[0] # => "f"
  #   :foo[1] # => "o"
  #   :foo[2] # => "o"
  # 
  # --- [](nth, len) -> String | nil
  # --- slice(nth, len) -> String | nil
  # 
  # nth 番目から長さ len の部分文字列を新しく作って返します。
  # 
  # (self.to_s[nth, len] と同じです。)
  # 
  # @param nth 文字の位置を表す整数を指定します。
  # @param len 文字列の長さを指定します。
  # 
  #   :foo[1, 2] # => "oo"
  # 
  # --- [](substr) -> String | nil
  # --- slice(substr) -> String | nil
  # 
  # self が substr を含む場合、一致した文字列を新しく作って返します。
  # 
  # (self.to_s[substr] と同じです。)
  # 
  # 例:
  #   :foobar.slice("foo")   # => "foo"
  #   :foobar.slice("baz")   # => nil
  # 
  # --- [](regexp, nth = 0) -> String | nil
  # --- slice(regexp, nth = 0) -> String | nil
  # 
  # 正規表現 regexp の nth 番目の括弧にマッチする最初の部分文字列を返します。
  # 
  # (self.to_s[regexp, nth] と同じです。)
  # 
  # @param regexp 正規表現を指定します。
  # 
  # @param nth 取得したい正規表現レジスタのインデックスを指定します。
  # 
  #   :foobar[/bar/] # => "bar"
  #   :foobarbaz[/(ba.)(ba.)/, 0] # => "barbaz"
  #   :foobarbaz[/(ba.)(ba.)/, 1] # => "bar"
  #   :foobarbaz[/(ba.)(ba.)/, 2] # => "baz"
  # 
  # --- [](range) -> String | nil
  # --- slice(range) -> String | nil
  # 
  # rangeで指定したインデックスの範囲に含まれる部分文字列を返します。
  # 
  # (self.to_s[range] と同じです。)
  # 
  # @param range 取得したい文字列の範囲を示す [[c:Range]] オブジェクトを指定します。
  # 
  #   :foo[0..1] # => "fo"
  # 
  # @see [[m:String#[] ]], [[m:String#slice]]
  def []; end

  # --- capitalize(*options) -> Symbol
  # 
  # シンボルに対応する文字列の先頭の文字を大文字に、残りを小文字に変更した
  # シンボルを返します。
  # 
  # (self.to_s.capitalize.intern と同じです。)
  # 
  #   :foobar.capitalize     #=> :Foobar
  #   :fooBar.capitalize     #=> :Foobar
  #   :FOOBAR.capitalize     #=> :Foobar
  #   :"foobar--".capitalize # => "Foobar--"
  # 
  # @see [[m:String#capitalize]]
  def capitalize; end

  # --- casecmp(other) -> -1 | 0 | 1 | nil
  # 
  # [[m:Symbol#<=>]] と同様にシンボルに対応する文字列の順序を比較しますが、
  # アルファベットの大文字小文字の違いを無視します。
  # 
  # [[m:Symbol#casecmp?]] と違って大文字小文字の違いを無視するのは
  # Unicode 全体ではなく、A-Z/a-z だけです。
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # //emlist[][ruby]{
  # :aBcDeF.casecmp(:abcde)     #=> 1
  # :aBcDeF.casecmp(:abcdef)    #=> 0
  # :aBcDeF.casecmp(:abcdefg)   #=> -1
  # :abcdef.casecmp(:ABCDEF)    #=> 0
  # :"\u{e4 f6 fc}".casecmp(:"\u{c4 d6 dc}") #=> 1
  # //}
  # 
  # other がシンボルではない場合や、文字列のエンコーディングが非互換の場合は、nil を返します。
  # 
  # //emlist[][ruby]{
  # :foo.casecmp("foo")   #=> nil
  # "\u{e4 f6 fc}".encode("ISO-8859-1").to_sym.casecmp(:"\u{c4 d6 dc}")   #=> nil
  # //}
  # 
  # @see [[m:String#casecmp]], [[m:Symbol#<=>]], [[m:Symbol#casecmp?]]
  def casecmp; end

  # --- casecmp?(other) -> bool | nil
  # 
  # 大文字小文字の違いを無視しシンボルを比較します。
  # シンボルが一致する場合には true を返し、一致しない場合には false を返します。
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # //emlist[][ruby]{
  # :abcdef.casecmp?(:abcde)     #=> false
  # :aBcDeF.casecmp?(:abcdef)    #=> true
  # :abcdef.casecmp?(:abcdefg)   #=> false
  # :abcdef.casecmp?(:ABCDEF)    #=> true
  # :"\u{e4 f6 fc}".casecmp?(:"\u{c4 d6 dc}") #=> true
  # //}
  # 
  # other がシンボルではない場合や、文字列のエンコーディングが非互換の場合は、nil を返します。
  # 
  # //emlist[][ruby]{
  # :foo.casecmp?("foo")   #=> nil
  # "\u{e4 f6 fc}".encode("ISO-8859-1").to_sym.casecmp?(:"\u{c4 d6 dc}")   #=> nil
  # //}
  # 
  # @see [[m:String#casecmp?]], [[m:Symbol#casecmp]]
  def casecmp?; end

  # --- downcase(*options) -> Symbol
  # 
  # 大文字を小文字に変換したシンボルを返します。
  # 
  # (self.to_s.downcase.intern と同じです。)
  # 
  #   :FOO.downcase #=> :foo
  # 
  # @see [[m:String#downcase]]
  def downcase; end

  # --- empty? -> bool
  # 
  # 自身が :"" (length が 0 のシンボル)かどうかを返します。
  # 
  #   :"".empty?  #=> true
  #   :foo.empty? #=> false
  # 
  # @see [[m:String#empty?]]
  def empty?; end

  # --- encoding   -> Encoding
  # 
  # シンボルに対応する文字列のエンコーディング情報を表現した [[c:Encoding]] オブ
  # ジェクトを返します。
  # 
  # 例:
  # 
  #   # encoding: utf-8
  # 
  #   :foo.encoding        # => #<Encoding:US-ASCII>
  #   :あかさたな.encoding   # => #<Encoding:UTF-8>
  # 
  # @see [[m:String#encoding]]
  def encoding; end

  # --- end_with?(*suffixes)   -> bool
  # 
  # self の末尾が suffixes のいずれかであるとき true を返します。
  # 
  # (self.to_s.end_with?と同じです。)
  # 
  # @param suffixes パターンを表す文字列 (のリスト)
  # 
  # @see [[m:Symbol#start_with?]]
  # 
  # @see [[m:String#end_with?]]
  # 
  # //emlist[][ruby]{
  # :hello.end_with?("ello")               #=> true
  # 
  # # returns true if one of the +suffixes+ matches.
  # :hello.end_with?("heaven", "ello")     #=> true
  # :hello.end_with?("heaven", "paradise") #=> false
  # //}
  def end_with?; end

  # --- id2name -> String
  # --- to_s -> String
  # 
  # シンボルに対応する文字列を返します。
  # 
  # 逆に、文字列に対応するシンボルを得るには
  # [[m:String#intern]] を使います。
  # 
  #   p :foo.id2name  # => "foo"
  #   p :foo.id2name.intern == :foo  # => true
  # 
  # @see [[m:String#intern]]
  def id2name; end

  # --- inspect    -> String
  # 
  # 自身を人間に読みやすい文字列にして返します。
  # 
  #   :fred.inspect   #=> ":fred"
  def inspect; end

  # --- intern -> self
  # --- to_sym -> self
  # self を返します。
  # 
  # 例:
  # 
  #   :foo.intern   # => :foo
  # 
  # @see [[m:String#intern]]
  def intern; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # シンボルに対応する文字列の長さを返します。
  # 
  # (self.to_s.length と同じです。)
  # 
  #   :foo.length #=> 3
  # 
  # @see [[m:String#length]], [[m:String#size]]
  def length; end

  # --- match(other) -> MatchData | nil
  # 
  # 正規表現 other とのマッチを行います。
  # 
  # (self.to_s.match(other) と同じです。)
  # 
  # @param other 比較対象のシンボルを指定します。
  # 
  # @return マッチが成功すれば MatchData オブジェクトを、そうでなければ nil を返します。
  # 
  #   p :foo.match(/foo/)    # => #<MatchData "foo">
  #   p :foobar.match(/bar/) # => #<MatchData "bar">
  #   p :foo.match(/bar/)    # => nil
  # 
  # @see [[m:String#match]]
  # @see [[m:Symbol#match?]]
  def match; end

  # --- match?(regexp, pos = 0) -> bool
  # 
  # regexp.match?(self, pos) と同じです。
  # regexp が文字列の場合は、正規表現にコンパイルします。
  # 詳しくは [[m:Regexp#match?]] を参照してください。
  # 
  # 例:
  # 
  #   :Ruby.match?(/R.../)    # => true
  #   :Ruby.match?('Ruby')    # => true
  #   :Ruby.match?('Ruby',1)  # => false
  #   :Ruby.match?('uby',1)   # => true
  #   :Ruby.match?(/P.../)    # => false
  #   $&                      # => nil
  # 
  # @see [[m:Regexp#match?]], [[m:String#match?]]
  def match?; end

  # --- succ -> Symbol
  # --- next -> Symbol
  # 
  # シンボルに対応する文字列の「次の」文字列に対応するシンボルを返します。
  # 
  # (self.to_s.next.intern と同じです。)
  # 
  #   :a.next   # => :b
  #   :foo.next # => :fop
  # 
  # @see [[m:String#succ]]
  def next; end

  # --- start_with?(*prefixes)   -> bool
  # 
  # self の先頭が prefixes のいずれかであるとき true を返します。
  # 
  # (self.to_s.start_with?と同じです。)
  # 
  # @param prefixes パターンを表す文字列または正規表現 (のリスト)
  # 
  # @see [[m:Symbol#end_with?]]
  # 
  # @see [[m:String#start_with?]]
  # 
  # //emlist[][ruby]{
  # :hello.start_with?("hell")               #=> true
  # :hello.start_with?(/H/i)                 #=> true
  # 
  # # returns true if one of the prefixes matches.
  # :hello.start_with?("heaven", "hell")     #=> true
  # :hello.start_with?("heaven", "paradise") #=> false
  # //}
  def start_with?; end

  # --- swapcase(*options) -> Symbol
  # 
  # 'A' から 'Z' までのアルファベット大文字を小文字に、'a' から 'z' までの
  # アルファベット小文字を大文字に変更したシンボルを返します。
  # 
  # (self.to_s.swapcase.intern と同じです。)
  # 
  #   p :ABCxyz.swapcase   # => :abcXYZ
  #   p :Access.swapcase   # => :aCCESS
  # 
  # @see [[m:String#swapcase]]
  def swapcase; end

  # --- to_json(*args) -> String
  # 
  # 自身を JSON 形式の文字列に変換して返します。
  # 
  # 内部的にはハッシュにデータをセットしてから [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] を呼び出しています。
  # 
  # @param args 引数はそのまま [[m:JSON::Generator::GeneratorMethods::Hash#to_json]] に渡されます。
  # 
  # @see [[m:JSON::Generator::GeneratorMethods::Hash#to_json]]
  def to_json; end

  # --- to_proc -> Proc
  # self に対応する Proc オブジェクトを返します。
  # 
  # 生成される Proc オブジェクトを呼びだす([[m:Proc#call]])と、
  # Proc#callの第一引数をレシーバとして、 self という名前のメソッドを
  # 残りの引数を渡して呼びだします。
  # 
  # 
  # //emlist[明示的に呼ぶ例][ruby]{
  # :to_i.to_proc["ff", 16]  # => 255 ← "ff".to_i(16)と同じ
  # //}
  # 
  # //emlist[暗黙に呼ばれる例][ruby]{
  # # メソッドに & とともにシンボルを渡すと
  # # to_proc が呼ばれて Proc 化され、
  # # それがブロックとして渡される。
  # (1..3).collect(&:to_s)  # => ["1", "2", "3"]
  # (1..3).select(&:odd?)   # => [1, 3]
  # //}
  # 
  # @see [[ref:d:spec/call#block]]
  def to_proc; end

  # --- upcase(*options) -> Symbol
  # 
  # 小文字を大文字に変換したシンボルを返します。
  # 
  # (self.to_s.upcase.intern と同じです。)
  # 
  #   :foo.upcase #=> :FOO
  # 
  # @see [[m:String#upcase]]
  def upcase; end

  # --- all_symbols -> [Symbol]
  # 
  # 定義済みの全てのシンボルオブジェクトの配列を返します。
  # 
  #     p Symbol.all_symbols #=> [:RUBY_PLATFORM, :RUBY_VERSION, ...]
  # 
  # リテラルで表記したシンボルのうち、コンパイル時に値が決まるものはその時に生成されます。
  # それ以外の式展開を含むリテラルや、メソッドで表記されたものは式の評価時に生成されます。
  # (何にも使われないシンボルは最適化により生成されないことがあります)
  # 
  #   def number
  #     'make_3'
  #   end
  # 
  #   p Symbol.all_symbols.select{|sym|sym.to_s.include? 'make'}
  #   #=> [:make_1, :make_2]
  # 
  #   re  = #確実に生成されるように代入操作を行う
  #   :make_1,
  #   :'make_2',
  #   :"#{number}",
  #   'make_4'.intern
  # 
  #   p Symbol.all_symbols.select{|sym|sym.to_s.include? 'make'}
  #   #=> [:make_1, :make_2, :make_3, :make_4]
  def all_symbols; end

  # --- json_create(hash) -> Symbol
  # 
  # JSON のオブジェクトから [[c:Symbol]] のオブジェクトを生成して返します。
  # 
  # @param hash 文字列をキー 's' に持つハッシュを指定します。
  def json_create; end

end
