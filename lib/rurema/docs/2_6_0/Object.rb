class Object
  # --- !~(other) -> bool
  # 
  # 自身が other とマッチしない事を判定します。
  # 
  # self#=~(obj) を反転した結果と同じ結果を返します。
  # 
  # @param other 判定するオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # obj = 'regexp'
  # p (obj !~ /re/) # => false
  # 
  # obj = nil
  # p (obj !~ /re/) # => true
  # //}
  # 
  # @see [[m:Object#=~]]
  def !~; end

  # --- <=>(other) -> 0 | nil
  # 
  # self === other である場合に 0 を返します。そうでない場合には nil を返します。
  # 
  # //emlist[例][ruby]{
  # a = Object.new
  # b = Object.new
  # a <=> a # => 0
  # a <=> b # => nil
  # //}
  # 
  # @see [[m:Object#===]]
  def <=>; end

  # --- ==(other) -> bool
  # 
  # オブジェクトと other が等しければ真を返します。
  # 
  # このメソッドは各クラスの性質に合わせて再定義すべきです。
  # 多くの場合、オブジェクトの内容が等しければ真を返すように
  # （同値性を判定するように）再定義されることが期待されています。
  # 
  # デフォルトでは equal? と同じオブジェクト
  # の同一性判定になっています。
  # 
  # @param other 比較するオブジェクトです。
  # 
  # //emlist[][ruby]{
  # p("foo" == "bar") #=> false
  # p("foo" == "foo") #=> true
  # 
  # p(4 == 4) #=> true
  # p(4 == 4.0) #=> true
  # //}
  # 
  # @see [[m:Object#equal?]],[[m:Object#eql?]]
  def ==; end

  # --- ===(other) -> bool
  # 
  # メソッド [[m:Object#==]] の別名です。
  # case 式で使用されます。このメソッドは case 式での振る舞いを考慮して、
  # 各クラスの性質に合わせて再定義すべきです。
  # 
  # 一般的に所属性のチェックを実現するため適宜再定義されます。
  # 
  # when 節の式をレシーバーとして === を呼び出すことに注意してください。
  # 
  # また [[m:Enumerable#grep]] でも使用されます。
  # 
  # @param other 比較するオブジェクトです。
  # 
  # //emlist[][ruby]{
  # age = 12
  # result =
  # case age
  # when 0 .. 2
  #   "baby"
  # when 3 .. 6
  #   "little child"
  # when 7 .. 12
  #   "child"
  # when 13 .. 18
  #   "youth"
  # else
  #   "adult"
  # end
  # 
  # puts result #=> "child"
  # 
  # def check arg
  #   case arg
  #   when /ruby(?!\s*on\s*rails)/i
  #     "hit! #{arg}"
  #   when String
  #     "Instance of String class. But don't hit."
  #   else
  #     "unknown"
  #   end
  # end
  # 
  # puts check([]) #=> unknown
  # puts check("mash-up in Ruby on Rails") #=> instance of String class. But not hit...
  # puts check("<Ruby's world>") #=> hit! <Ruby's world>
  # //}
  # 
  # @see [[m:Object#==]], [[m:Range#===]], [[m:Module#===]], [[m:Regexp#===]], [[m:Enumerable#grep]]
  def ===; end

  # --- =~(other) -> nil
  # 
  # 右辺に正規表現オブジェクトを置いた正規表現マッチ obj =~ /RE/
  # をサポートするためのメソッドです。常に nil を返します。
  # 
  # このメソッドは Ruby 2.6 から deprecated です。
  # 
  # 意図せずに Array などに対して呼ばれた時にバグの原因になっていたため、
  # 代わりに [[m:NilClass#=~]] が定義されています。
  # 
  # @param other 任意のオブジェクトです。結果に影響しません。
  # 
  # //emlist[例][ruby]{
  # obj = 'regexp'
  # p(obj =~ /re/) #=> 0
  # 
  # obj = nil
  # p(obj =~ /re/) #=> nil
  # //}
  # 
  # @see [[m:String#=~]]
  def =~; end

  # --- _dump(limit) -> String
  # 
  # [[m:Marshal.#dump]] において出力するオブジェクトがメソッド _dump
  # を定義している場合には、そのメソッドの結果が書き出されます。
  # 
  # バージョン1.8.0以降では[[m:Object#marshal_dump]], [[m:Object#marshal_load]]の使用
  # が推奨されます。 Marshal.dump するオブジェクトが _dump と marshal_dump の両方の
  # メソッドを持つ場合は marshal_dump が優先されます。
  # 
  # メソッド _dump は引数として再帰を制限するレベル limit を受
  # け取り、オブジェクトを文字列化したものを返します。
  # 
  # インスタンスがメソッド _dump を持つクラスは必ず同じフォー
  # マットを読み戻すクラスメソッド _load を定義する必要があり
  # ます。_load はオブジェクトを表現した文字列を受け取り、それ
  # をオブジェクトに戻したものを返す必要があります。
  # 
  # @param limit 再帰の制限レベルを表す整数です。
  # @return オブジェクトを文字列化したものを返すように定義すべきです。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def initialize(arg)
  #     @foo = arg
  #   end
  #   def _dump(limit)
  #     Marshal.dump(@foo, limit)
  #   end
  #   def self._load(obj)
  #     p obj
  #     Foo.new(Marshal.load(obj))
  #   end
  # end
  # foo = Foo.new(['foo', 'bar'])
  # p foo                      #=> #<Foo:0xbaf234 @foo=["foo", "bar"]>
  # dms = Marshal.dump(foo)
  # p dms                      #=> "\004\bu:\bFoo\023\004\b[\a\"\bfoo\"\bbar"
  # result = Marshal.load(dms) #=> "\004\b[\a\"\bfoo\"\bbar" # self._load の引数
  # p result                   #=> #<Foo:0xbaf07c @foo=["foo", "bar"]>
  # //}
  # 
  # インスタンス変数の情報は普通マーシャルデータに含まれるので、上例
  # のように _dump を定義する必要はありません(ただし _dump を定義すると
  # インスタンス変数の情報は dump されなくなります)。
  # _dump/_load はより高度な制御を行いたい場合や拡張ライブラリで定義し
  # たクラスのインスタンスがインスタンス変数以外に情報を保持する場合に
  # 利用します。(例えば、クラス [[c:Time]] は、_dump/_load を定義して
  # います)
  # 
  # @see [[m:Object#marshal_dump]], [[m:Object#marshal_load]], [[m:Class#_load]]
  def _dump; end

  # --- class -> Class
  # 
  # レシーバのクラスを返します。
  # 
  # //emlist[][ruby]{
  # p "ruby".class #=> String
  # p 100.class #=> Integer
  # p ARGV.class #=> Array
  # p self.class #=> Object
  # p Class.class #=> Class
  # p Kernel.class #=> Module
  # //}
  # 
  # @see [[m:Class#superclass]],[[m:Object#kind_of?]],[[m:Object#instance_of?]]
  def class; end

  # --- clone(freeze: true) -> object
  # --- dup -> object
  # 
  # オブジェクトの複製を作成して返します。
  # 
  # dup はオブジェクトの内容, taint 情報をコピーし、
  # clone はそれに加えて freeze, 特異メソッドなどの情報も含めた完全な複製を作成します。
  # 
  # clone や dup は浅い(shallow)コピーであることに注意してください。後述。
  # 
  # [[c:TrueClass]], [[c:FalseClass]], [[c:NilClass]], [[c:Symbol]], そして [[c:Numeric]] クラスのインスタンスなど一部のオブジェクトは複製ではなくインスタンス自身を返します。
  # 
  # @param freeze false を指定すると freeze されていないコピーを返します。
  # @raise ArgumentError [[c:TrueClass]] などの常に freeze されているオブジェクトの freeze されていないコピーを作成しようとしたときに発生します。
  # 
  # //emlist[][ruby]{
  # obj = "string"
  # obj.taint
  # def obj.fuga
  # end
  # obj.freeze
  # 
  # p(obj.equal?(obj))          #=> true
  # p(obj == obj)               #=> true
  # p(obj.tainted?)             #=> true
  # p(obj.frozen?)              #=> true
  # p(obj.respond_to?(:fuga))   #=> true
  # 
  # obj_c = obj.clone
  # 
  # p(obj.equal?(obj_c))        #=> false
  # p(obj == obj_c)             #=> true
  # p(obj_c.tainted?)           #=> true
  # p(obj_c.frozen?)            #=> true
  # p(obj_c.respond_to?(:fuga)) #=> true
  # 
  # obj_d = obj.dup
  # 
  # p(obj.equal?(obj_d))        #=> false
  # p(obj == obj_d)             #=> true
  # p(obj_d.tainted?)           #=> true
  # p(obj_d.frozen?)            #=> false
  # p(obj_d.respond_to?(:fuga)) #=> false
  # //}
  # 
  # @see [[m:Object#initialize_copy]]
  # 
  # === 深いコピーと浅いコピー
  # 
  # clone や dup はオブジェクト自身を複製するだけで、オブジェクトの指し
  # ている先(たとえば配列の要素など)までは複製しません。これを浅いコピー(shallow copy)といいます。
  # 
  # 深い(deep)コピーが必要な場合には、
  # [[c:Marshal]]モジュールを利用して
  # //emlist[][ruby]{
  # Marshal.load(Marshal.dump(obj))
  # //}
  # このように複製を作成する方法があります。ただしMarshal出来ないオブジェクトが
  # 含まれている場合には使えません。
  # 
  # //emlist[][ruby]{
  # obj = ["a","b","c"]
  # 
  # obj_d = obj.dup
  # obj_d[0] << "PLUS"
  # 
  # p obj   #=> ["aPLUS", "b", "c"]
  # p obj_d #=> ["aPLUS", "b", "c"]
  # 
  # obj_m = Marshal.load(Marshal.dump(obj))
  # obj_m[1] << "PLUS"
  # 
  # p obj   #=> ["aPLUS", "b", "c"]
  # p obj_m #=> ["aPLUS", "bPLUS", "c"]
  # //}
  def clone; end

  # --- define_singleton_method(symbol, method) -> Symbol
  # --- define_singleton_method(symbol) { ... } -> Symbol
  # 
  # self に特異メソッド name を定義します。
  # 
  # @param symbol メソッド名を [[c:String]] または [[c:Symbol]] で指定します。
  # 
  # @param method [[c:Proc]]、[[c:Method]] あるいは [[c:UnboundMethod]] の
  #               いずれかのインスタンスを指定します。
  # 
  # @return メソッド名を表す [[c:Symbol]] を返します。
  # 
  # //emlist[][ruby]{
  # class A
  #   class << self
  #     def class_name
  #       to_s
  #     end
  #   end
  # end
  # A.define_singleton_method(:who_am_i) do
  #   "I am: #{class_name}"
  # end
  # A.who_am_i   # ==> "I am: A"
  # 
  # guy = "Bob"
  # guy.define_singleton_method(:hello) { "#{self}: Hello there!" }
  # guy.hello    #=>  "Bob: Hello there!"
  # //}
  def define_singleton_method; end

  # --- display(out = $stdout) -> nil
  # 
  # オブジェクトを out に出力します。
  # 
  # 以下のように定義されています。
  # 
  # //emlist[][ruby]{
  # class Object
  #   def display(out = $stdout)
  #     out.write self
  #     nil
  #   end
  # end
  # //}
  # 
  # @param out 出力先のIOオブジェクトです。指定しない場合は標準出力に出力されます。
  # @return nil を返します。
  # 
  # //emlist[][ruby]{
  # Object.new.display #=> #<Object:0xbb0210>
  # //}
  # 
  # @see [[m:$stdout]]
  def display; end

  # --- to_enum(method = :each, *args) -> Enumerator
  # --- enum_for(method = :each, *args) -> Enumerator
  # --- to_enum(method = :each, *args) {|*args| ... }  -> Enumerator
  # --- enum_for(method = :each, *args) {|*args| ... } -> Enumerator
  # 
  # [[m:Enumerator.new]](self, method, *args) を返します。
  # 
  # ブロックを指定した場合は [[m:Enumerator#size]] がブロックの評価結果を返
  # します。ブロックパラメータは引数 args です。
  # 
  # 
  # @param method メソッド名の文字列かシンボルです。
  # @param args 呼び出すメソッドに渡される引数です。
  # 
  # //emlist[][ruby]{
  # str = "xyz"
  # 
  # enum = str.enum_for(:each_byte)
  # p(a = enum.map{|b| '%02x' % b }) #=> ["78", "79", "7a"]
  # 
  # # protects an array from being modified
  # a = [1, 2, 3]
  # p(a.to_enum) #=> #<Enumerator: [1, 2, 3]:each>
  # //}
  # 
  # //emlist[例(ブロックを指定する場合)][ruby]{
  # module Enumerable
  #   def repeat(n)
  #     raise ArgumentError, "#{n} is negative!" if n < 0
  #     unless block_given?
  #       # __method__ はここでは :repeat
  #       return to_enum(__method__, n) do
  #         # size メソッドが nil でなければ size * n を返す。
  #         sz = size
  #         sz * n if sz
  #       end
  #     end
  #     each do |*val|
  #       n.times { yield *val }
  #     end
  #   end
  # end
  # 
  # %i[hello world].repeat(2) { |w| puts w }
  # # => 'hello', 'hello', 'world', 'world'
  # enum = (1..14).repeat(3)
  # # => #<Enumerator: 1..14:repeat(3)>
  # enum.first(4) # => [1, 1, 1, 2]
  # enum.size # => 42
  # //}
  # 
  # @see [[c:Enumerator]], [[m:Enumerator#size]]
  def enum_for; end

  # --- eql?(other) -> bool
  # 
  # オブジェクトと other が等しければ真を返します。[[c:Hash]] で二つのキー
  # が等しいかどうかを判定するのに使われます。
  # 
  # このメソッドは各クラスの性質に合わせて再定義すべきです。
  # 多くの場合、 == と同様に同値性の判定をするように再定義されていますが、
  # 適切にキー判定ができるようにより厳しくなっている場合もあります。
  # 
  # デフォルトでは equal? と同じオブジェクト
  # の同一性判定になっています。
  # 
  # このメソッドを再定義した時には [[m:Object#hash]] メソッ
  # ドも再定義しなければなりません。
  # 
  # @param other 比較するオブジェクトです。
  # 
  # //emlist[][ruby]{
  # p("foo".eql?("bar")) #=> false
  # p("foo".eql?("foo")) #=> true
  # 
  # p(4.eql?(4)) #=> true
  # p(4.eql?(4.0)) #=> false
  # //}
  # 
  # @see [[m:Object#hash]],[[m:Object#equal?]],[[m:Object#==]]
  def eql?; end

  # --- equal?(other) -> bool
  # 
  # other が self 自身の時、真を返します。
  # 
  # 二つのオブジェクトが同一のものかどうか調べる時に使用します。
  # このメソッドを再定義してはいけません。
  # 
  # お互いの[[m:Object#object_id]]が一致する
  # かどうかを調べます。
  # 
  # @param other 比較するオブジェクトです。
  # 
  # //emlist[][ruby]{
  # p("foo".equal?("bar")) #=> false
  # p("foo".equal?("foo")) #=> false
  # 
  # p(4.equal?(4)) #=> true
  # p(4.equal?(4.0)) #=> false
  # 
  # p(:foo.equal? :foo) #=> true
  # //}
  # 
  # @see [[m:Object#object_id]],[[m:Object#==]],[[m:Object#eql?]],[[c:Symbol]]
  def equal?; end

  # --- extend(*modules) -> self
  # 
  # 引数で指定したモジュールのインスタンスメソッドを self の特異
  # メソッドとして追加します。
  # 
  # [[m:Module#include]] は、クラス(のインスタンス)に機能を追加します
  # が、extend は、ある特定のオブジェクトだけにモジュールの機能を追加
  # したいときに使用します。
  # 
  # 引数に複数のモジュールを指定した場合、最後
  # の引数から逆順に extend を行います。
  # 
  # @param modules モジュールを任意個指定します（クラスは不可）。
  # @return self を返します。
  # 
  # //emlist[][ruby]{
  # module Foo
  #   def a
  #     'ok Foo'
  #   end
  # end
  # 
  # module Bar
  #   def b
  #     'ok Bar'
  #   end
  # end
  # 
  # obj = Object.new
  # obj.extend Foo, Bar
  # p obj.a #=> "ok Foo"
  # p obj.b #=> "ok Bar"
  # 
  # class Klass
  #   include Foo
  #   extend Bar
  # end
  # 
  # p Klass.new.a #=> "ok Foo"
  # p Klass.b     #=> "ok Bar"
  # //}
  # 
  # extend の機能は、「特異クラスに対する [[m:Module#include]]」
  # と言い替えることもできます。
  # ただしその場合、フック用のメソッド
  # が [[m:Module#extended]] ではなく [[m:Module#included]] になるという違いがあります。
  # 
  # //emlist[][ruby]{
  # # obj.extend Foo, Bar とほぼ同じ
  # class << obj
  #   include Foo, Bar
  # end
  # //}
  # 
  # @see [[m:Module#extend_object]],[[m:Module#include]],[[m:Module#extended]]
  def extend; end

  # --- freeze -> self
  # 
  # オブジェクトを凍結（内容の変更を禁止）します。
  # 
  # 凍結されたオブジェクトの変更は
  # 例外 [[c:FrozenError]] を発生させます。
  # いったん凍結されたオブジェクトを元に戻す方法はありません。
  # 
  # 凍結されるのはオブジェクトであり、変数ではありません。代入などで変数の指す
  # オブジェクトが変化してしまうことは freeze では防げません。 freeze が防ぐのは、
  # `破壊的な操作' と呼ばれるもの一般です。変数への参照自体を凍結したい
  # 場合は、グローバル変数なら [[m:Kernel.#trace_var]] が使えます。
  # 
  # @return self を返します。
  # 
  # //emlist[][ruby]{
  # a1 = "foo".freeze
  # a1 = "bar"
  # p a1 #=> "bar"
  # 
  # a2 = "foo".freeze
  # a2.replace("bar") # can't modify frozen String (FrozenError)
  # //}
  # 
  # 凍結を解除することはできませんが、[[m:Object#dup]] を使えばほぼ同じ内容の凍結されていない
  # オブジェクトを得ることはできます。
  # 
  # //emlist[][ruby]{
  # a = [1].freeze
  # p a.frozen?     #=> true
  # 
  # a[0] = "foo"
  # p a             # can't modify frozen Array (FrozenError)
  # 
  # b = a.dup
  # p b             #=> [1]
  # p b.frozen?     #=> false
  # 
  # b[0] = "foo"
  # p b             #=> ["foo"]
  # //}
  # 
  # @see [[m:Object#frozen?]],[[m:Object#dup]],[[m:Kernel.#trace_var]]
  def freeze; end

  # --- frozen? -> bool
  # 
  # オブジェクトが凍結（内容の変更を禁止）されているときに真を返します。
  # 
  # //emlist[][ruby]{
  # obj = "someone"
  # p obj.frozen? #=> false
  # obj.freeze
  # p obj.frozen? #=> true
  # //}
  # 
  # @see [[m:Object#freeze]]
  def frozen?; end

  # --- hash -> Integer
  # 
  # オブジェクトのハッシュ値を返します。[[c:Hash]] クラスでオブジェク
  # トを格納するのに用いられています。
  # 
  # メソッド hash は [[m:Object#eql?]] と組み合わせて Hash クラスで利用されます。その際
  # 
  #   A.eql?(B) ならば A.hash == B.hash
  # 
  # の関係を必ず満たしていなければいけません。eql? を再定義した時には必ずこちらも合わせ
  # て再定義してください。
  # 
  # デフォルトでは、[[m:Object#object_id]] と同じ値を返します。
  # ただし、[[c:Integer]], [[c:Symbol]], [[c:String]] だけは組込みのハッ
  # シュ関数が使用されます(これを変えることはできません)。
  # 
  # hash を再定義する場合は、一様に分布する任意の整数を返すようにします。
  # 
  # @return ハッシュ値を返します。Ruby 内部の固定長整数 fixnum に収まらない場合は切り捨てられます。
  # 
  # //emlist[][ruby]{
  # p self.hash #=> 2013505522753096494
  # p 0.hash    #=> 2647535320520409998
  # p 0.0.hash  #=> -2975129765814025835
  # p nil.hash  #=> 2401531420355998067
  # 
  # p "ruby".hash #=> 4460896024486900438
  # p "ruby".hash #=> 4460896024486900438
  # p :ruby.hash  #=> 3979895509189707770
  # p :ruby.hash  #=> 3979895509189707770
  # //}
  # 
  # @see [[m:Object#eql?]],[[m:BasicObject#__id__]]
  def hash; end

  # --- initialize(*args, &block) -> object
  # 
  # ユーザ定義クラスのオブジェクト初期化メソッド。
  # 
  # このメソッドは [[m:Class#new]] から新しく生成されたオブ
  # ジェクトの初期化のために呼び出されます。他の言語のコンストラクタに相当します。
  # デフォルトの動作ではなにもしません。
  # 
  # initialize には
  # [[m:Class#new]] に与えられた引数がそのまま渡されます。
  # 
  # サブクラスではこのメソッドを必要に応じて再定義されること
  # が期待されています。
  # 
  # initialize という名前のメソッドは自動的に private に設定され
  # ます。
  # 
  # @param args 初期化時の引数です。
  # @param block 初期化時のブロック引数です。必須ではありません。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def initialize name
  #     puts "initialize Foo"
  #     @name = name
  #   end
  # end
  # 
  # class Bar < Foo
  #   def initialize name, pass
  #     puts "initialize Bar"
  #     super name
  #     @pass = pass
  #   end
  # end
  # 
  # it = Bar.new('myname','0500')
  # p it
  # #=> initialize Bar
  # #   initialize Foo
  # #   #<Bar:0x2b68f08 @name="myname", @pass="0500">
  # //}
  # 
  # @see [[m:Class#new]]
  def initialize; end

  # --- initialize_copy(obj) -> object
  # 
  # (拡張ライブラリによる) ユーザ定義クラスのオブジェクトコピーの初期化メソッド。
  # 
  # このメソッドは self を obj の内容で置き換えます。ただ
  # し、self のインスタンス変数や特異メソッドは変化しません。
  # [[m:Object#clone]], [[m:Object#dup]]の内部で使われています。
  # 
  # initialize_copy は、Ruby インタプリタが知り得ない情報をコピーするた
  # めに使用(定義)されます。例えば C 言語でクラスを実装する場合、情報
  # をインスタンス変数に保持させない場合がありますが、そういった内部情
  # 報を initialize_copy でコピーするよう定義しておくことで、dup や clone
  # を再定義する必要がなくなります。
  # 
  # デフォルトの Object#initialize_copy は、 freeze チェックおよび型のチェックを行い self
  # を返すだけのメソッドです。
  # 
  # initialize_copy という名前のメソッドは
  # 自動的に private に設定されます。
  # 
  # @raise TypeError レシーバが freeze されているか、obj のクラスがレシーバ
  #   のクラスと異なる場合に発生します。
  # @see [[m:Object#clone]],[[m:Object#dup]]
  # 
  # 以下に例として、dup や clone がこのメソッドをどのように利用しているかを示します。
  # 
  # obj.dup は、新たに生成したオブジェクトに対して
  # initialize_copy を呼び
  # 
  # //emlist[][ruby]{
  # obj2 = obj.class.allocate
  # obj2.initialize_copy(obj)
  # //}
  # 
  # obj2 に対してさらに obj の汚染状態、インスタンス変数、ファイナライ
  # ザをコピーすることで複製を作ります。 obj.clone は、さらに
  # 特異メソッドのコピーも行います。
  # 
  # //emlist[][ruby]{
  # obj = Object.new
  # class <<obj
  #   attr_accessor :foo
  #   def bar
  #     :bar
  #   end
  # end
  # 
  # def check(obj)
  #   puts "instance variables: #{obj.inspect}"
  #   puts "tainted?: #{obj.tainted?}"
  #   print "singleton methods: "
  #   begin
  #     p obj.bar
  #   rescue NameError
  #     p $!
  #   end
  # end
  # 
  # obj.foo = 1
  # obj.taint
  # 
  # check Object.new.send(:initialize_copy, obj)
  #         #=> instance variables: #<Object:0x4019c9d4>
  #         #   tainted?: false
  #         #   singleton methods: #<NoMethodError: ...>
  # check obj.dup
  #         #=> instance variables: #<Object:0x4019c9c0 @foo=1>
  #         #   tainted?: true
  #         #   singleton methods: #<NoMethodError: ...>
  # check obj.clone
  #         #=> instance variables: #<Object:0x4019c880 @foo=1>
  #         #   tainted?: true
  #         #   singleton methods: :bar
  # //}
  def initialize_copy; end

  # --- inspect -> String
  # 
  # オブジェクトを人間が読める形式に変換した文字列を返します。
  # 
  # 組み込み関数 [[m:Kernel.#p]] は、このメソッドの結果を使用して
  # オブジェクトを表示します。
  # 
  # //emlist[][ruby]{
  # [ 1, 2, 3..4, 'five' ].inspect   # => "[1, 2, 3..4, \"five\"]"
  # Time.new.inspect                 # => "2008-03-08 19:43:39 +0900"
  # //}
  # 
  # inspect メソッドをオーバーライドしなかった場合、クラス名とインスタンス
  # 変数の名前、値の組を元にした文字列を返します。
  # 
  # //emlist[][ruby]{
  # class Foo
  # end
  # Foo.new.inspect                  # => "#<Foo:0x0300c868>"
  # 
  # class Bar
  #   def initialize
  #     @bar = 1
  #   end
  # end
  # Bar.new.inspect                  # => "#<Bar:0x0300c868 @bar=1>"
  # //}
  # 
  # @see [[m:Kernel.#p]]
  def inspect; end

  # --- instance_of?(klass) -> bool
  # 
  # オブジェクトがクラス klass の直接のインスタンスである時真を返します。
  # 
  # obj.instance_of?(c) が成立する時には、常に obj.kind_of?(c) も成立します。
  # 
  # @param klass [[c:Class]]かそのサブクラスのインスタンスです。
  # 
  # //emlist[][ruby]{
  # class C < Object
  # end
  # class S < C
  # end
  # 
  # obj = S.new
  # p obj.instance_of?(S)       # true
  # p obj.instance_of?(C)       # false
  # //}
  # 
  # @see [[m:Object#kind_of?]],[[m:Object#class]]
  def instance_of?; end

  # --- instance_variable_defined?(var) -> bool
  # 
  # インスタンス変数 var が定義されていたら真を返します。
  # 
  # @param var インスタンス変数名を文字列か [[c:Symbol]] で指定します。
  # 
  # //emlist[][ruby]{
  # class Fred
  #   def initialize(p1, p2)
  #     @a, @b = p1, p2
  #   end
  # end
  # fred = Fred.new('cat', 99)
  # p fred.instance_variable_defined?(:@a)    #=> true
  # p fred.instance_variable_defined?("@b")   #=> true
  # p fred.instance_variable_defined?("@c")   #=> false
  # //}
  # 
  # @see [[m:Object#instance_variable_get]],[[m:Object#instance_variable_set]],[[m:Object#instance_variables]]
  def instance_variable_defined?; end

  # --- instance_variable_get(var) -> object | nil
  # 
  # オブジェクトのインスタンス変数の値を取得して返します。
  # 
  # インスタンス変数が定義されていなければ nil を返します。
  # 
  # @param var インスタンス変数名を文字列か [[c:Symbol]] で指定します。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def initialize
  #     @foo = 1
  #   end
  # end
  # 
  # obj = Foo.new
  # p obj.instance_variable_get("@foo")     #=> 1
  # p obj.instance_variable_get(:@foo)      #=> 1
  # p obj.instance_variable_get(:@bar)      #=> nil
  # //}
  # 
  # @see [[m:Object#instance_variable_set]],[[m:Object#instance_variables]],[[m:Object#instance_variable_defined?]]
  def instance_variable_get; end

  # --- instance_variable_set(var, value) -> object
  # 
  # オブジェクトのインスタンス変数 var に値 value を設定します。
  # 
  # インスタンス変数が定義されていなければ新たに定義されます。
  # 
  # @param var インスタンス変数名を文字列か [[c:Symbol]] で指定します。
  # @param value 設定する値です。
  # @return value を返します。
  # 
  # //emlist[][ruby]{
  # obj = Object.new
  # p obj.instance_variable_set("@foo", 1)  #=> 1
  # p obj.instance_variable_set(:@foo, 2)   #=> 2
  # p obj.instance_variable_get(:@foo)      #=> 2
  # //}
  # 
  # @see [[m:Object#instance_variable_get]],[[m:Object#instance_variables]],[[m:Object#instance_variable_defined?]]
  def instance_variable_set; end

  # --- instance_variables -> [Symbol]
  # オブジェクトのインスタンス変数名をシンボルの配列として返します。
  # 
  # //emlist[][ruby]{
  # obj = Object.new
  # obj.instance_eval { @foo, @bar = nil }
  # p obj.instance_variables
  # 
  # #=> [:@foo, :@bar]
  # //}
  # 
  # @see [[m:Object#instance_variable_get]], [[m:Kernel.#local_variables]], [[m:Kernel.#global_variables]], [[m:Module.constants]], [[m:Module#constants]], [[m:Module#class_variables]]
  def instance_variables; end

  # --- is_a?(mod) -> bool
  # --- kind_of?(mod) -> bool
  # 
  # オブジェクトが指定されたクラス mod かそのサブクラスのインスタンスであるとき真を返します。
  # 
  # また、オブジェクトがモジュール mod をインクルードしたクラスかそのサブクラス
  # のインスタンスである場合にも真を返します。
  # [[m:Module#include]]だけではなく、[[m:Object#extend]]や[[m:Module#prepend]]に
  # よってサブクラスのインスタンスになる場合も含みます。
  # 上記のいずれでもない場合に false を返します。
  # 
  # @param mod クラスやモジュールなど、[[c:Module]]かそのサブクラスのインスタンスです。
  # 
  # //emlist[][ruby]{
  # module M
  # end
  # class C < Object
  #   include M
  # end
  # class S < C
  # end
  # 
  # obj = S.new
  # p obj.is_a?(S)       # true
  # p obj.is_a?(C)       # true
  # p obj.is_a?(Object)  # true
  # p obj.is_a?(M)       # true
  # p obj.is_a?(Hash)    # false
  # //}
  # 
  # @see [[m:Object#instance_of?]],[[m:Module#===]],[[m:Object#class]]
  def is_a?; end

  # --- itself -> object
  # 
  # self を返します。
  # 
  # //emlist[][ruby]{
  # string = 'my string' # => "my string"
  # string.itself.object_id == string.object_id # => true
  # //}
  def itself; end

  # --- marshal_dump -> object
  # 
  # [[m:Marshal.#dump]] を制御するメソッドです。
  # 
  # Marshal.dump(some) において、出力するオブジェクト some がメソッド marshal_dump を
  # 持つ場合には、その返り値がダンプされたものが Marshal.dump(some) の返り値となります。
  # 
  # marshal_dump/marshal_load の仕組みは Ruby 1.8.0 から導入されました。
  # これから書くプログラムでは _dump/_load ではなく
  # marshal_dump/marshal_load を使うべきです。
  # 
  # @return 任意のオブジェクトで marshal_load の引数に利用できます。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def initialize(arg)
  #     @foo = arg
  #   end
  #   def marshal_dump
  #     @foo
  #   end
  #   def marshal_load(obj)
  #     p obj
  #     @foo = obj
  #   end
  # end
  # foo = Foo.new(['foo', 'bar'])
  # p foo                      #=> #<Foo:0xbaf3b0 @foo=["foo", "bar"]>
  # dms = Marshal.dump(foo)
  # p dms                      #=> "\004\bU:\bFoo[\a\"\bfoo\"\bbar"
  # result = Marshal.load(dms) #=> ["foo", "bar"] # marshal_load の引数
  # p result                   #=> #<Foo:0xbaf2ac @foo=["foo", "bar"]>
  # //}
  # 
  # インスタンス変数の情報は普通マーシャルデータに含まれるので、
  # 上例のように marshal_dump を定義する必要はありません
  # (ただし marshal_dump を定義するとインスタンス変数の情報は
  # ダンプされなくなるので、marshal_dump/marshal_load で扱う必要があります)。
  # marshal_dump/marshal_load はより高度な制御を行いたい場合や
  # 拡張ライブラリで定義したクラスのインスタンスがインスタンス変数以外
  # に情報を保持する場合に利用します。
  # 
  # 特に、marshal_dump/marshal_load を定義したオブジェクトは
  # 特異メソッドが定義されていてもマーシャルできるようになります
  # (特異メソッドの情報が自動的に dump されるようになるわけではなく、
  # marshal_dump/marshal_load によりそれを実現する余地があるということです)。
  # 
  # @see [[m:Object#marshal_load]], [[c:Marshal]]
  def marshal_dump; end

  # --- marshal_load(obj) -> object
  # 
  # [[m:Marshal.#load]] を制御するメソッドです。
  # 
  # some のダンプ結果（Marshal.dump(some)） をロードする（Marshal.load(Marshal.dump(some))）に
  # は some がメソッド marshal_load を持っていなければなりません。
  # このとき、marshal_dump の返り値が marshal_load の引数に利用されます。
  # marshal_load 時の self は、生成されたばかり（[[m:Class#allocate]] されたばかり） の状態です。
  # 
  # marshal_dump/marshal_load の仕組みは Ruby 1.8.0 から導入されました。
  # これから書くプログラムでは _dump/_load ではなく
  # marshal_dump/marshal_load を使うべきです。
  # 
  # @param obj marshal_dump の返り値のコピーです。
  # 
  # @return   返り値は無視されます。
  # 
  # 
  # @see [[m:Object#marshal_dump]], [[c:Marshal]]
  def marshal_load; end

  # --- method(name) -> Method
  # 
  # オブジェクトのメソッド name をオブジェクト化した
  # [[c:Method]] オブジェクトを返します。
  # 
  # @param name メソッド名を[[c:Symbol]] または[[c:String]]で指定します。
  # @raise NameError 定義されていないメソッド名を引数として与えると発生します。
  # 
  # //emlist[][ruby]{
  # me = -365.method(:abs)
  # p me #=> #<Method: Integer#abs>
  # p me.call #=> 365
  # //}
  # 
  # @see [[m:Module#instance_method]], [[c:Method]], [[m:BasicObject#__send__]], [[m:Object#send]], [[m:Kernel.#eval]], [[m:Object#singleton_method]]
  def method; end

  # --- methods(include_inherited = true) -> [Symbol]
  # そのオブジェクトに対して呼び出せるメソッド名の一覧を返します。
  # このメソッドは public メソッドおよび protected メソッドの名前を返します。
  # 
  # ただし特別に、引数が偽の時は [[m:Object#singleton_methods]](false) と同じになっています。
  # 
  # 
  # @param include_inherited 引数が偽の時は [[m:Object#singleton_methods]](false) と同じになります。
  # 
  # //emlist[例1][ruby]{
  # class Parent
  #   private;   def private_parent()   end
  #   protected; def protected_parent() end
  #   public;    def public_parent()    end
  # end
  # 
  # class Foo < Parent
  #   private;   def private_foo()   end
  #   protected; def protected_foo() end
  #   public;    def public_foo()    end
  # end
  # 
  # obj = Foo.new
  # class <<obj
  #     private;   def private_singleton()   end
  #     protected; def protected_singleton() end
  #     public;    def public_singleton()    end
  # end
  # 
  # # あるオブジェクトの応答できるメソッドの一覧を得る。
  # p obj.methods(false)
  # p obj.public_methods(false)
  # p obj.private_methods(false)
  # p obj.protected_methods(false)
  # 
  # # 実行結果
  # [:protected_singleton, :public_singleton]
  # [:public_singleton, :public_foo]
  # [:private_singleton, :private_foo]
  # [:protected_singleton, :protected_foo]
  # //}
  # 
  # 
  # //emlist[例2][ruby]{
  # # あるオブジェクトの応答できるメソッドの一覧を得る。
  # # 自身のクラスの親クラスのインスタンスメソッドも含めるために true を指定して
  # # いるが、Object のインスタンスメソッドは一覧から排除している。
  # p obj.methods(true)           - Object.instance_methods(true)
  # p obj.public_methods(true)    - Object.public_instance_methods(true)
  # p obj.private_methods(true)   - Object.private_instance_methods(true)
  # p obj.protected_methods(true) - Object.protected_instance_methods(true)
  # 
  # # 実行結果
  # [:protected_singleton, :public_singleton, :protected_foo, :public_foo, :protected_parent, :public_parent]
  # [:public_singleton, :public_foo, :public_parent]
  # [:private_singleton, :private_foo, :private_parent]
  # [:protected_singleton, :protected_foo, :protected_parent]
  # //}
  # 
  # @see [[m:Module#instance_methods]],[[m:Object#singleton_methods]]
  def methods; end

  # --- nil? -> bool
  # 
  # レシーバが nil であれば真を返します。
  # 
  #   p false.nil? #=> false
  #   p nil.nil? #=> true
  # 
  # @see [[c:NilClass]]
  def nil?; end

  # --- object_id -> Integer
  # 
  # 各オブジェクトに対して一意な整数を返します。あるオブジェクトに対し
  # てどのような整数が割り当てられるかは不定です。
  # 
  # Rubyでは、(Garbage Collectされていない)アクティブなオブジェクト間で
  # 重複しない整数(object_id)が各オブジェクトにひとつずつ割り当てられています。この
  # メソッドはその値を返します。
  # 
  # [[c:TrueClass]], [[c:FalseClass]], [[c:NilClass]], [[c:Symbol]], [[c:Integer]] クラス
  # のインスタンスなど Immutable（変更不可）なオブジェクトの一部は同じ内容ならば必ず同じ object_id になります。
  # 
  # これは、Immutable ならば複数の場所から参照されても`破壊的操作'による問題が発生しないので、
  # 同じ内容のインスタンスを複数生成しないという内部実装が理由です。
  # 
  # //emlist[][ruby]{
  # p "ruby".object_id #=> 60
  # p "ruby".object_id #=> 80
  # 
  # p [].object_id #=> 100
  # p [].object_id #=> 120
  # 
  # p :ruby.object_id #=> 710428
  # p :ruby.object_id #=> 710428
  # 
  # p 11.object_id #=> 23
  # p 11.object_id #=> 23
  # 
  # p true.object_id #=> 20
  # p true.object_id #=> 20
  # //}
  # 
  # @see [[m:Object#equal?]],[[c:Symbol]]
  def object_id; end

  # --- pretty_inspect    -> String
  # 
  # self を pp で表示したときの結果を文字列として返します。
  def pretty_inspect; end

  # --- pretty_print(pp)    -> ()
  # 
  # [[m:PP.pp]] や [[m:Kernel.#pp]] がオブジェクトの内容を出力するときに
  # 呼ばれるメソッドです。[[c:PP]] オブジェクト pp を引数として呼ばれます。
  # 
  # あるクラスの pp の出力をカスタマイズしたい場合は、このメソッドを再定義します。
  # そのとき pretty_print メソッドは指定された pp に対して表示したい自身の内容を追加して
  # いかなければいけません。いくつかの組み込みクラスについて、
  # [[lib:pp]] ライブラリはあらかじめ pretty_print メソッドを定義しています。
  # 
  # @param pp [[c:PP]] オブジェクトです。
  # 
  # //emlist[][ruby]{
  # class Array
  #   def pretty_print(q)
  #     q.group(1, '[', ']') {
  #       q.seplist(self) {|v|
  #         q.pp v
  #       }
  #     }
  #   end
  # end
  # //}
  # 
  # @see [[m:Object#pretty_print_cycle]], [[m:Object#inspect]], [[m:PrettyPrint#text]], [[m:PrettyPrint#group]], [[m:PrettyPrint#breakable]]
  def pretty_print; end

  # --- pretty_print_cycle(pp)    -> ()
  # 
  # プリティプリント時にオブジェクトの循環参照が検出された場合、
  # [[m:Object#pretty_print]] の代わりに呼ばれるメソッドです。
  # 
  # あるクラスの pp の出力をカスタマイズしたい場合は、
  # このメソッドも再定義する必要があります。
  # 
  # @param pp [[c:PP]] オブジェクトです。
  # 
  # //emlist[][ruby]{
  # class Array
  #   def pretty_print_cycle(q)
  #     q.text(empty? ? '[]' : '[...]')
  #   end
  # end
  # //}
  # 
  # @see [[m:Object#pretty_print]]
  def pretty_print_cycle; end

  # --- pretty_print_inspect    -> String
  # 
  # [[m:Object#pretty_print]] を使って [[m:Object#inspect]] と同様に
  # オブジェクトを人間が読める形式に変換した文字列を返します。
  # 
  # 出力する全てのオブジェクトに [[m:Object#pretty_print]] が定義されている必要があります。
  # そうでない場合には [[c:RuntimeError]] が発生します。
  # 
  # @raise RuntimeError 出力する全てのオブジェクトに [[m:Object#pretty_print]] が定義されて
  #                     いない場合に発生します。
  def pretty_print_inspect; end

  # --- pretty_print_instance_variables    -> [String | Symbol]
  # 
  # プリティプリント時に表示すべき自身のインスタンス変数名の配列をソートして返します。
  # 返されたインスタンス変数はプリティプリント時に表示されます。
  # 
  # pp に表示したくないインスタンス変数がある場合にこのメソッドを再定義します。
  def pretty_print_instance_variables; end

  # --- private_methods(include_inherited = true) -> [Symbol]
  # 
  # そのオブジェクトが理解できる private メソッド名の一覧を返します。
  # 
  # @param include_inherited 偽となる値を指定すると自身のクラスのスーパークラスで定義されたメソッドを除きます。
  # 
  # 
  # @see [[m:Module#private_instance_methods]],[[m:Object#methods]],[[m:Object#singleton_methods]]
  def private_methods; end

  # --- protected_methods(include_inherited = true) -> [Symbol]
  # 
  # そのオブジェクトが理解できる protected メソッド名の一覧を返します。
  # 
  # @param include_inherited 偽となる値を指定すると自身のクラスのスーパークラスで定義されたメソッドを除きます。
  # 
  # 
  # @see [[m:Module#protected_instance_methods]],[[m:Object#methods]],[[m:Object#singleton_methods]]
  def protected_methods; end

  # --- to_yaml(options = {}) -> String
  # --- psych_to_yaml(options = {}) -> String
  # オブジェクトを YAML document に変換します。
  # 
  # options でオプションを指定できます。
  # [[m:Psych.dump]] と同じなので詳しくはそちらを参照してください。
  # 
  # [[lib:syck]] に to_yaml メソッドがあるため、
  # psych_to_yaml が別名として定義されています。将来的に
  # syck が廃止された場合  psych_to_yaml は廃止
  # される予定であるため、特別の事情がない限り to_yaml を用いてください。
  # 
  # @param options 出力オプション
  # @see [[m:Psych.dump]]
  def psych_to_yaml; end

  # --- public_method(name) -> Method
  # 
  # オブジェクトの public メソッド name をオブジェクト化した
  # [[c:Method]] オブジェクトを返します。
  # 
  # @param name メソッド名を [[c:Symbol]] または [[c:String]] で指定します。
  # @raise NameError 定義されていないメソッド名や、
  #        protected メソッド名、 private メソッド名を引数として与えると発生します。
  # 
  # //emlist[][ruby]{
  # 1.public_method(:to_int) #=> #<Method: Integer#to_int>
  # 1.public_method(:p)      #   method `p' for class `Integer' is private (NameError)
  # //}
  # 
  # @see [[m:Object#method]],[[m:Object#public_send]],[[m:Module#public_instance_method]]
  def public_method; end

  # --- public_methods(include_inherited = true) -> [Symbol]
  # 
  # そのオブジェクトが理解できる public メソッド名の一覧を返します。
  # 
  # @param include_inherited 偽となる値を指定すると自身のクラスのスーパークラスで定義されたメソッドを除きます。
  # 
  # 
  # @see [[m:Module#public_instance_methods]],[[m:Object#methods]],[[m:Object#singleton_methods]]
  def public_methods; end

  # --- public_send(name, *args) -> object
  # --- public_send(name, *args) { .... } -> object
  # 
  # オブジェクトの public メソッド name を args を引数にして呼び出し、メソッ
  # ドの実行結果を返します。
  # 
  # ブロック付きで呼ばれたときはブロックもそのまま引き渡します。
  # 
  # //emlist[][ruby]{
  # 1.public_send(:+, 2)  # => 3
  # //}
  # 
  # @param name 文字列か[[c:Symbol]] で指定するメソッド名です。
  # 
  # @param args 呼び出すメソッドに渡す引数です。
  # 
  # @raise ArgumentError name を指定しなかった場合に発生します。
  # 
  # @raise NoMethodError protected メソッドや private メソッドに対して実行
  #                      した場合に発生します。
  # 
  # //emlist[][ruby]{
  # 1.public_send(:puts, "hello")  # => NoMethodError
  # //}
  # 
  # @see [[m:BasicObject#__send__]], [[m:Object#send]]
  def public_send; end

  # --- remove_instance_variable(name) -> object
  # 
  # オブジェクトからインスタンス変数 name を取り除き、そのインス
  # タンス変数に設定されていた値を返します。
  # 
  # @param name 削除するインスタンス変数の名前をシンボルか文字列で指定します。
  # @raise NameError オブジェクトがインスタンス変数 name を持たない場合に発生します。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def foo
  #     @foo = 1
  #     p remove_instance_variable(:@foo) #=> 1
  #     p remove_instance_variable(:@foo) # instance variable @foo not defined (NameError)
  #   end
  # end
  # Foo.new.foo
  # //}
  # 
  # @see [[m:Module#remove_class_variable]],[[m:Module#remove_const]]
  def remove_instance_variable; end

  # --- respond_to?(name, include_all = false) -> bool
  # 
  # オブジェクトがメソッド name を持つとき真を返します。
  # 
  # オブジェクトが メソッド name を持つというのは、
  # オブジェクトが メソッド name に応答できることをいいます。
  # 
  # Windows での [[m:Process.fork]] や GNU/Linux での [[m:File.lchmod]] の
  # ような [[c:NotImplementedError]] が発生する場合は false を返します。
  # 
  # ※ NotImplementedError が発生する場合に false を返すのは
  # Rubyの組み込みライブラリや標準ライブラリなど、C言語で実装されているメソッドのみです。
  # Rubyで実装されたメソッドで NotImplementedError が発生する場合は true を返します。
  # 
  # メソッドが定義されていない場合は、[[m:Object#respond_to_missing?]] を呼
  # び出してその結果を返します。
  # 
  # @param name [[c:Symbol]] または文字列で指定するメソッド名です。
  # 
  # @param include_all private メソッドと protected メソッドを確認の対象に
  #                    含めるかを true か false で指定します。省略した場合
  #                    は false(含めない) を指定した事になります。
  # 
  # //emlist[][ruby]{
  # class F
  #   def hello
  #     "Bonjour"
  #   end
  # end
  # 
  # class D
  #   private
  #   def hello
  #     "Guten Tag"
  #   end
  # end
  # list = [F.new,D.new]
  # 
  # list.each{|it| puts it.hello if it.respond_to?(:hello)}
  # #=> Bonjour
  # 
  # list.each{|it| it.instance_eval("puts hello if it.respond_to?(:hello, true)")}
  # #=> Bonjour
  # #   Guten Tag
  # 
  # module Template
  #   def main
  #     start
  #     template_method
  #     finish
  #   end
  # 
  #   def start
  #     puts "start"
  #   end
  # 
  #   def template_method
  #     raise NotImplementedError.new
  #   end
  # 
  #   def finish
  #     puts "finish"
  #   end
  # end
  # 
  # class ImplTemplateMethod
  #   include Template
  #   def template_method
  #     "implement template_method"
  #   end
  # end
  # 
  # class NotImplTemplateMethod
  #   include Template
  # 
  #   # not implement template_method
  # end
  # 
  # puts ImplTemplateMethod.new.respond_to?(:template_method) # => true
  # # NotImplementedError が発生しているが、Rubyによる実装部のため true を返す
  # puts NotImplTemplateMethod.new.respond_to?(:template_method) # => true
  # # GNU/Linux で実行。C言語による実装部のため false を返す
  # puts File.respond_to?(:lchmod)         # => false
  # //}
  # 
  # @see [[m:Module#method_defined?]]
  def respond_to?; end

  # --- respond_to_missing?(symbol, include_private) -> bool
  # 
  # 自身が symbol で表されるメソッドに対し
  # [[m:BasicObject#method_missing]] で反応するつもりならば真を返します。
  # 
  # [[m:Object#respond_to?]] はメソッドが定義されていない場合、
  # デフォルトでこのメソッドを呼びだし問合せます。
  # 
  # [[m:BasicObject#method_missing]] を override した場合にこのメソッドも
  # override されるべきです。
  # 
  # false を返します。
  # 
  # @param symbol メソッド名シンボル
  # @param include_private private method も含めたい場合に true が渡されます
  # 
  # //emlist[例][ruby]{
  # class Sample
  #   def method_missing(name, *args)
  #     if name =~ /^to_*/
  #       [name, *args] # => [:to_sample, "sample args1", "sample args2"]
  #       return
  #     else
  #       super
  #     end
  #   end
  # 
  #   def respond_to_missing?(sym, include_private)
  #     (sym =~ /^to_*/) ? true : super
  #   end
  # end
  # 
  # s = Sample.new
  # s.to_sample("sample args1", "sample args2")
  # s.respond_to?(:to_sample)  # => true
  # s.respond_to?(:sample)    # => false
  # //}
  # 
  # @see [[m:Object#respond_to?]], [[m:BasicObject#method_missing]]
  def respond_to_missing?; end

  # --- send(name, *args) -> object
  # --- send(name, *args) { .... } -> object
  # 
  # オブジェクトのメソッド name を args を引数に
  # して呼び出し、メソッドの実行結果を返します。
  # 
  # ブロック付きで呼ばれたときはブロックもそのまま引き渡します。
  # 
  # send が再定義された場合に備えて別名 __send__ も
  # 用意されており、ライブラリではこちらを使うべきです。また
  # __send__ は再定義すべきではありません。
  # 
  # send, __send__ は、メソッドの呼び出し制限
  # にかかわらず任意のメソッドを呼び出せます。
  # [[ref:d:spec/def#limit]] も参照してください。
  # 
  # public メソッドだけ呼び出せれば良い場合は
  # [[m:Object#public_send]] を使う方が良いでしょう。
  # 
  # @param name 文字列か[[c:Symbol]] で指定するメソッド名です。
  # @param args 呼び出すメソッドに渡す引数です。
  # 
  # //emlist[][ruby]{
  # p -365.send(:abs) #=> 365
  # p "ruby".send(:sub,/./,"R") #=> "Ruby"
  # 
  # 
  # class Foo
  #   def foo() "foo" end
  #   def bar() "bar" end
  #   def baz() "baz" end
  # end
  # 
  # # 任意のキーとメソッド(の名前)の関係をハッシュに保持しておく
  # # レシーバの情報がここにはないことに注意
  # methods = {1 => :foo,
  #   2 => :bar,
  #   3 => :baz}
  # 
  # # キーを使って関連するメソッドを呼び出す
  # # レシーバは任意(Foo クラスのインスタンスである必要もない)
  # p Foo.new.send(methods[1])      # => "foo"
  # p Foo.new.send(methods[2])      # => "bar"
  # p Foo.new.send(methods[3])      # => "baz"
  # //}
  # 
  # @see [[m:Object#public_send]], [[m:BasicObject#__send__]], [[m:Object#method]], [[m:Kernel.#eval]], [[c:Proc]], [[c:Method]]
  def send; end

  # --- singleton_class -> Class
  # 
  # レシーバの特異クラスを返します。
  # まだ特異クラスがなければ、新しく作成します。
  # 
  # レシーバが nil か true か false なら、それぞれ NilClass, TrueClass,
  # FalseClass を返します。
  # 
  # @raise TypeError レシーバが [[c:Integer]]、[[c:Float]]、[[c:Symbol]] の場合に発生します。
  # 
  # //emlist[][ruby]{
  # Object.new.singleton_class  #=> #<Class:#<Object:0xb7ce1e24>>
  # String.singleton_class      #=> #<Class:String>
  # nil.singleton_class         #=> NilClass
  # //}
  # 
  # @see [[m:Object#class]]
  def singleton_class; end

  # --- singleton_method(name) -> Method
  # 
  # オブジェクトの特異メソッド name をオブジェクト化した [[c:Method]] オブ
  # ジェクトを返します。
  # 
  # @param name メソッド名を[[c:Symbol]] または[[c:String]]で指定します。
  # @raise NameError 定義されていないメソッド名を引数として与えると発生します。
  # 
  # //emlist[][ruby]{
  # class Demo
  #   def initialize(n)
  #     @iv = n
  #   end
  #   def hello()
  #     "Hello, @iv = #{@iv}"
  #   end
  # end
  # 
  # k = Demo.new(99)
  # def k.hi
  #   "Hi, @iv = #{@iv}"
  # end
  # m = k.singleton_method(:hi)    # => #<Method: #<Demo:0xf8b0c3c4 @iv=99>.hi>
  # m.call   #=> "Hi, @iv = 99"
  # m = k.singleton_method(:hello) # => NameError
  # //}
  # 
  # @see [[m:Module#instance_method]], [[c:Method]], [[m:BasicObject#__send__]], [[m:Object#send]], [[m:Kernel.#eval]], [[m:Object#method]]
  def singleton_method; end

  # --- singleton_methods(inherited_too = true) -> [Symbol]
  # そのオブジェクトに対して定義されている特異メソッド名
  # (public あるいは protected メソッド) の一覧を返します。
  # 
  # inherited_too が真のときは継承した特異メソッドを含みます。
  # 継承した特異メソッドとは [[m:Object#extend]] によって追加された特異メソッドや、
  # self がクラスの場合はスーパークラスのクラスメソッド([[c:Class]]のインスタンスの特異メソッド)などです。
  # 
  # singleton_methods(false) は、[[m:Object#methods]](false) と同じです。
  # 
  # @param inherited_too 継承した特異メソッドを含める場合は真を、
  #                      そうでない場合は偽を指定します。
  # 
  # //emlist[例1][ruby]{
  # Parent = Class.new
  # 
  # class <<Parent
  #   private;   def private_class_parent() end
  #   protected; def protected_class_parent() end
  #   public;    def public_class_parent() end
  # end
  # 
  # Foo = Class.new(Parent)
  # 
  # class <<Foo
  #   private;   def private_class_foo() end
  #   protected; def protected_class_foo() end
  #   public;    def public_class_foo() end
  # end
  # 
  # module Bar
  #   private;   def private_bar()   end
  #   protected; def protected_bar() end
  #   public;    def public_bar()    end
  # end
  # 
  # obj = Foo.new
  # class <<obj
  #   include Bar
  #   private;   def private_self()   end
  #   protected; def protected_self() end
  #   public;    def public_self()    end
  # end
  # 
  # # あるオブジェクトの特異メソッドの一覧を得る。
  # p obj.singleton_methods(false)
  # p obj.methods(false)
  # p Foo.singleton_methods(false)
  # 
  # #実行結果
  # 
  # [:protected_self, :public_self]
  # [:protected_self, :public_self]
  # [:protected_class_foo, :public_class_foo]
  # //}
  # 
  # 
  # //emlist[例2][ruby]{
  # # あるオブジェクトの特異メソッドの一覧を得る。
  # # 親クラスのクラスメソッドも含まれるよう true を指定したが、
  # # Object のクラスメソッドは一覧から排除している。
  # 
  # p obj.singleton_methods(true)
  # p Foo.singleton_methods(true) - Object.singleton_methods(true)
  # 
  # #実行結果
  # 
  # [:protected_self, :public_self, :protected_bar, :public_bar]
  # [:protected_class_foo, :public_class_foo, :protected_class_parent, :public_class_parent]
  # //}
  # 
  # @see [[m:Object#methods]],[[m:Object#extend]]
  def singleton_methods; end

  # --- taint -> self
  # 
  # このメソッドは Ruby 2.7 から deprecated で、Ruby 3.2 で削除予定です。
  # 
  # オブジェクトの「汚染マーク」をセットします。
  # 
  # 環境変数（[[c:ENV]]で得られる文字列）など一部のオブジェクトは最初から汚染されています。
  # オブジェクトの汚染に関しては[[d:spec/safelevel]]を参照してください。
  # 
  # //emlist[][ruby]{
  # $SAFE = 1
  # 
  # some = "puts '@&%&(#!'"
  # p some.tainted? #=> false
  # eval(some) #=> @&%&(#!
  # 
  # some.taint
  # p some.tainted? #=> true
  # eval(some) # Insecure operation - eval (SecurityError)
  # 
  # some.untaint
  # p some.tainted? #=> false
  # eval(some) #=> @&%&(#!
  # 
  # p ENV['OS'].tainted? #=> true
  # //}
  # 
  # @see [[m:Object#tainted?]],[[m:Object#untaint]],[[m:Object#freeze]]
  def taint; end

  # --- tainted? -> bool
  # 
  # 
  # オブジェクトの「汚染マーク」がセットされている時真を返します。
  # 
  # オブジェクトの汚染に関しては[[d:spec/safelevel]]を参照してください。
  # 
  # //emlist[][ruby]{
  # p String.new.tainted? #=> false
  # p ENV['OS'].tainted? #=> true
  # //}
  # 
  # このメソッドは Ruby 2.7から deprecated で、Ruby 3.2 で削除予定です。
  # 
  # @see [[m:Object#taint]],[[m:Object#untaint]]
  def tainted?; end

  # --- tap{|x| ... } -> self
  # 
  # self を引数としてブロックを評価し、self を返します。
  # 
  # メソッドチェインの途中で直ちに操作結果を表示するために
  # メソッドチェインに "入り込む" ことが、このメソッドの主目的です。
  # 
  # //emlist[][ruby]{
  # (1..10)                  .tap {|x| puts "original: #{x}" }
  #   .to_a                  .tap {|x| puts "array:    #{x}" }
  #   .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
  #   .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }
  # //}
  # 
  # @see [[m:Object#yield_self]]
  def tap; end

  # --- yield_self {|x| ... } -> object
  # --- yield_self            -> Enumerator
  # --- then {|x| ... } -> object
  # --- then            -> Enumerator
  # 
  # self を引数としてブロックを評価し、ブロックの結果を返します。
  # 
  # //emlist[例][ruby]{
  # 3.next.then {|x| x**x }.to_s             # => "256"
  # "my string".yield_self {|s| s.upcase }   # => "MY STRING"
  # //}
  # 
  # 値をメソッドチェインのパイプラインに次々と渡すのは良い使い方です。
  # 
  # //emlist[メソッドチェインのパイプライン][ruby]{
  # require 'open-uri'
  # require 'json'
  # 
  # construct_url(arguments).
  #   yield_self {|url| URI(url).read }.
  #   yield_self {|response| JSON.parse(response) }
  # //}
  # 
  # ブロックなしで呼び出されたときは Enumerator を返します。
  # 例えば条件によって値を捨てるのに使えます。
  # 
  # //emlist[][ruby]{
  # # 条件にあうので何もしない
  # 1.yield_self.detect(&:odd?)            # => 1
  # # 条件に合わないので値を捨てる
  # 2.yield_self.detect(&:odd?)            # => nil
  # //}
  # 
  # @see [[m:Object#tap]]
  def then; end

  # --- to_a -> Array
  # 
  # オブジェクトを配列に変換した結果を返します。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # //emlist[][ruby]{
  # p( {'a'=>1}.to_a )  # [["a", 1]]
  # p ['array'].to_a    # ["array"]
  # p nil.to_a          # []
  # //}
  # 
  # @see [[m:Object#to_ary]],[[m:Kernel.#Array]]
  def to_a; end

  # --- to_ary -> Array
  # 
  # オブジェクトの [[c:Array]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * 配列が使われるすべての場面で代置可能であるような、
  #  * 配列そのものとみなせるようなもの
  # という厳しいものになっています。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_ary
  #     [3,4]
  #   end
  # end
  # 
  # it = Foo.new
  # p([1,2] + it) #=> [1, 2, 3, 4]
  # //}
  # 
  # @see [[m:Object#to_a]],[[m:Kernel.#Array]]
  def to_ary; end

  # --- to_hash -> Hash
  # 
  # オブジェクトの [[c:Hash]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * ハッシュが使われるすべての場面で代置可能であるような、
  #  * ハッシュそのものとみなせるようなもの
  # という厳しいものになっています。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_hash
  #     {'as' => 24}
  #   end
  # end
  # 
  # it = Foo.new
  # p({:as => 12}.merge(it)) #=> {"as"=>24, :as=>12}
  # //}
  def to_hash; end

  # --- to_int -> Integer
  # 
  # オブジェクトの [[c:Integer]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * 整数が使われるすべての場面で代置可能であるような、
  #  * 整数そのものとみなせるようなもの
  # という厳しいものになっています。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_int
  #     1
  #   end
  # end
  # 
  # ary = [:a, :b, :c]
  # p(ary[Foo.new]) # => :b
  # //}
  # 
  # @see [[m:Kernel.#Integer]]
  def to_int; end

  # --- to_io -> IO
  # 
  # オブジェクトの [[c:IO]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * IOオブジェクトが使われるすべての場面で代置可能であるような、
  #  * IOオブジェクトそのものとみなせるようなもの
  # という厳しいものになっています。
  def to_io; end

  # --- to_proc -> Proc
  # 
  # オブジェクトの [[c:Proc]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # //emlist[][ruby]{
  # def doing
  #   yield
  # end
  # 
  # class Foo
  #   def to_proc
  #     Proc.new{p 'ok'}
  #   end
  # end
  # 
  # it = Foo.new
  # doing(&it) #=> "ok"
  # //}
  def to_proc; end

  # --- to_regexp -> Regexp
  # 
  # オブジェクトの [[c:Regexp]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * 正規表現が使われるすべての場面で代置可能であるような、
  #  * 正規表現そのものとみなせるようなもの
  # という厳しいものになっています。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_regexp
  #     /[\d]+/
  #   end
  # end
  # 
  # it = Foo.new
  # p Regexp.union(/^at/, it) #=> /(?-mix:^at)|(?-mix:[\d]+)/
  # //}
  def to_regexp; end

  # --- to_s -> String
  # 
  # オブジェクトの文字列表現を返します。
  # 
  # [[m:Kernel.#print]] や [[m:Kernel.#sprintf]] は文字列以外の
  # オブジェクトが引数に渡された場合このメソッドを使って文字列に変換し
  # ます。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def initialize num
  #     @num = num
  #   end
  # end
  # it = Foo.new(40)
  # 
  # puts it #=> #<Foo:0x2b69110>
  # 
  # class Foo
  #   def to_s
  #     "Class:Foo Number:#{@num}"
  #   end
  # end
  # 
  # puts it #=> Class:Foo Number:40
  # //}
  # 
  # @see [[m:Object#to_str]],[[m:Kernel.#String]]
  def to_s; end

  # --- to_str -> String
  # 
  # オブジェクトの [[c:String]] への暗黙の変換が必要なときに内部で呼ばれます。
  # デフォルトでは定義されていません。
  # 
  # 説明のためここに記載してありますが、
  # このメソッドは実際には Object クラスには定義されていません。
  # 必要に応じてサブクラスで定義すべきものです。
  # 
  # このメソッドを定義する条件は、
  #  * 文字列が使われるすべての場面で代置可能であるような、
  #  * 文字列そのものとみなせるようなもの
  # という厳しいものになっています。
  # 
  # //emlist[][ruby]{
  # class Foo
  #   def to_str
  #     'Edition'
  #   end
  # end
  # 
  # it = Foo.new
  # p('Second' + it) #=> "SecondEdition"
  # //}
  # 
  # @see [[m:Object#to_s]],[[m:Kernel.#String]]
  def to_str; end

  # --- trust -> self
  # 
  # このメソッドは Ruby 2.1 から deprecated で、Ruby 3.2 で削除予定です。
  # [[m:Object#untaint]] と同じ動作をします。
  # 
  # 
  # @see [[m:Object#untrusted?]],[[m:Object#untrust]]
  def trust; end

  # --- untaint -> self
  # 
  # オブジェクトの「汚染マーク」を取り除きます。
  # 
  # 汚染マークを取り除くことによる危険性はプログラマが責任を負う必要が
  # あります。
  # 
  # オブジェクトの汚染に関しては[[d:spec/safelevel]]を参照してください。
  # 
  # 
  #   ruby -e 'p ARGV[0].tainted?;t=+ARGV[0];t.untaint;p t.tainted?' hoge
  #   # => true
  #   # false
  # 
  # このメソッドは Ruby 2.7 から deprecated で、Ruby 3.2 で削除予定です。
  # 
  # 
  # @see [[m:Object#taint]],[[m:Object#tainted?]]
  def untaint; end

  # --- untrust -> self
  # 
  # このメソッドは Ruby 2.1 から deprecated で、Ruby 3.2 で削除予定です。
  # [[m:Object#taint]] と同じ動作をします。
  # 
  # 
  # @see [[m:Object#trust]],[[m:Object#untrusted?]]
  def untrust; end

  # --- untrusted? -> bool
  # 
  # このメソッドは Ruby 2.1 から deprecated で、Ruby 3.2 で削除予定です。
  # [[m:Object#tainted?]] と同じ動作をします。
  # 
  # 
  # @see [[m:Object#trust]],[[m:Object#untrust]]
  def untrusted?; end

  # --- new -> Object
  # 
  # Objectクラスのインスタンスを生成して返します。
  # 
  # //emlist[][ruby]{
  # some = Object.new
  # p some #=> #<Object:0x2b696d8>
  # //}
  def new; end

  # --- yaml_tag(tag) -> ()
  # クラスと tag の間を関連付けます。
  # 
  # これによって tag 付けされた YAML ドキュメントを Ruby のオブジェクトに
  # 変換したりその逆をしたりすることができます。
  # 
  # @param tag 対象のクラスに関連付けるタグの文字列
  # 
  # === Example
  #   require 'psych'
  #   
  #   class Foo
  #     def initialize(x)
  #       @x = x
  #     end
  #   
  #     attr_reader :x
  #   end
  #   
  #   # Dumps Ruby object normally  
  #   p Psych.dump(Foo.new(3)) 
  #   # =>
  #   # --- !ruby/object:Foo
  #   # x: 3
  #   
  #   # Registers tag with class Foo
  #   Foo.yaml_as("tag:example.com,2013:foo")
  #   # ... and dumps the object of Foo class
  #   Psych.dump(Foo.new(3), STDOUT)
  #   # =>
  #   # --- !<tag:example.com,2013:foo>
  #   # x: 3 
  #   
  #   # Loads the object from the tagged YAML node
  #   p Psych.load(<<EOS)
  #   --- !<tag:example.com,2012:foo>
  #   x: 8
  #   EOS
  #   # => #<Foo:0x0000000130f48 @x=8>
  # 
  #    
  #  
  def yaml_tag; end

  # --- ARGF -> Object
  # 引数 (なければ標準入力) で構成される仮想ファイル
  # (詳細は [[c:ARGF]]、[[c:ARGF.class]] を参照)。
  # 
  # つまり [[m:Kernel.#gets]] は [[m:ARGF.class#gets]] と同じ意味です。
  # [[m:ARGF.class#file]] で現在読み込み中のファイルオブジェクトが、
  # [[m:ARGF.class#filename]] で現在読み込み中のファイル名が得られます。
  def ARGF; end

  # --- ARGV -> Array
  # Ruby スクリプトに与えられた引数を表す配列です。
  # 
  # 組み込み変数 [[m:$*]] の別名です。
  # Ruby 自身に対する引数は取り除かれています。
  # 
  # 例:
  # 
  # スクリプト argv.rb の内容が
  #     p ARGV
  # であったとします。このときシェルから次を実行すると、
  #     $ ruby argv.rb foo bar baz
  # 結果は以下のように出力されます。
  #     ["foo", "bar", "baz"]
  def ARGV; end

  # --- ARGV -> Array
  # 
  # Ruby スクリプトに与えられた引数を表す配列です。
  # 
  # [[lib:optparse]] を require することにより、ARGV は
  # OptionParser::Arguable を [[m:Object#extend]] します。
  # 
  # @see [[c:OptionParser::Arguable]]
  def ARGV; end

  # --- DATA -> File
  # スクリプトの __END__
  # プログラムの終り以降をアクセスする [[c:File]] オブジェクト。
  # 
  # [[ref:d:spec/program#terminate]]も参照。
  # 
  # ソースファイルの __END__ 以降は解析・実行の対象にならないので
  # その部分にプログラムが利用するためのデータを書き込んでおくことができます。
  # DATA 定数はそのデータ部分にアクセスするための [[c:File]] オブジェクトを保持しています。
  # 
  # __END__ を含まないプログラムにおいては DATA は定義されません。
  # 
  # === 注意
  # 
  #     * DATA.rewind で移動する読みとり位置は __END__ 直後ではなく、
  #       スクリプトファイルの先頭です。
  #     * スクリプトが標準入力から読みこまれた場合は標準入力になります。
  #     * スクリプトがファイルや標準入力から読みこまれなかった場合や、
  #       __END__ で終っていない場合には定義されません。
  #     * [[m:Kernel.#require]] や [[m:Kernel.#load]] で
  #       読み込まれたファイルの中であってもそのファイル (__FILE__, [[ref:d:spec/variables#pseudo]])
  #       ではなく実行されたファイル ([[m:$0]]) を指します。
  # 
  # === 例1
  #     print DATA.gets # => 故人西辞黄鶴楼
  #     print DATA.gets # => 烟花三月下揚州
  #     print DATA.gets # => 孤帆遠影碧空尽
  #     print DATA.gets # => 唯見長江天際流
  #     DATA.gets       # => nil
  #     
  #     __END__
  #     故人西辞黄鶴楼
  #     烟花三月下揚州
  #     孤帆遠影碧空尽
  #     唯見長江天際流
  # 
  # === 例2
  #     sum = 0
  #     DATA.each_line do |line|
  #       sum += line.to_i
  #     end
  #     
  #     DATA.rewind
  #     p DATA.gets    # => "sum = 0¥n"
  #     
  #     __END__
  #     17
  #     19
  #     23
  #     29
  #     31
  # 
  # === 例3
  #     DATA.gets    # => uninitialized constant DATA (NameError)
  # 
  # === 例4
  # 
  # ファイル library.rb と app.rb の内容が以下であったとします。
  # 
  # library.rb:
  #     print DATA.gets
  #     
  #     __END__
  #     data from library
  # 
  # app.rb:
  #     require 'library.rb'
  # 
  #     __END__
  #     data from app
  # 
  # このときシェルから次を実行すると
  #     $ ruby app.rb
  # 結果は以下のように出力されます。
  #     data from app
  def DATA; end

  # --- ENV -> Object
  # 環境変数を表す (擬似) 連想配列 (詳細は [[c:ENV]] を参照)。
  # 
  # この連想配列の値を変更すると子プロセスの環境として引き継がれます。
  def ENV; end

  # --- FALSE -> FalseClass
  # 非推奨です。代表的な偽の値。false と同じ。
  # 
  # この定数は過去との互換性のために提供されています。擬似変数 false を使ってください。
  # Ruby では false と nil が偽として扱われます。
  # 偽でない値(false でも nil でもない値) は全て真とみなされます。
  def FALSE; end

  # --- NIL -> NilClass
  # 非推奨です。 nil と同じ。
  # 
  # この定数は過去との互換性のために提供されています。擬似変数 nil を使ってください。
  # 
  # Ruby では false と nil が偽として扱われます。
  # 偽でない値(false でも nil でもない値) は全て真とみなされます。
  def NIL; end

  # --- RUBY_COPYRIGHT -> String
  # Ruby のコピーライトを表す文字列。
  def RUBY_COPYRIGHT; end

  # --- RUBY_DESCRIPTION -> String
  # Ruby の詳細を表す文字列。
  # 
  # ruby -v で表示される内容が格納されています。
  def RUBY_DESCRIPTION; end

  # --- RUBY_ENGINE -> String
  # Ruby処理系実装の種類を表す文字列。
  # 
  # 例:
  #   $ ruby-1.9.1 -ve 'p RUBY_ENGINE'
  #   ruby 1.9.1p0 (2009-03-04 revision 22762) [x86_64-linux]
  #   "ruby"
  #   $ jruby -ve 'p RUBY_ENGINE'
  #   jruby 1.2.0 (ruby 1.8.6 patchlevel 287) (2009-03-16 rev 9419) [i386-java]
  #   "jruby"
  def RUBY_ENGINE; end

  # --- RUBY_ENGINE_VERSION -> String
  # Ruby処理系実装のバージョンを表す文字列。
  def RUBY_ENGINE_VERSION; end

  # --- RUBY_PATCHLEVEL -> Integer
  # Ruby のパッチレベルを表す [[c:Integer]] オブジェクトです。
  # 
  # パッチレベルはRubyの各バージョンに対するバグ修正パッチの適用をカウントしています。
  # teeny リリースのそれぞれについてパッチレベルは 0 から始まり、
  # その teeny リリースに対してバグ修正パッチが適用される度に増えていきます。
  # 
  # パッチレベルという概念および RUBY_PATCHLEVEL 定数は、 Ruby 1.8.5-p1 以降、 1.8.6 以降で導入されました。
  # 1.8.5やそれ以前のバージョンでは定義されていません。
  def RUBY_PATCHLEVEL; end

  # --- RUBY_PLATFORM -> String
  # 
  # プラットフォームを表す文字列。
  def RUBY_PLATFORM; end

  # --- RUBY_RELEASE_DATE -> String
  # 
  # Ruby のリリース日を表す文字列。
  def RUBY_RELEASE_DATE; end

  # --- RUBY_REVISION -> Integer
  # 
  # Ruby の Subversion でのリビジョン番号を表す [[c:Integer]] オブジェクトです。
  def RUBY_REVISION; end

  # --- RUBY_VERSION -> String
  # 
  # Ruby のバージョンを表す文字列。
  # 
  # Ruby のバージョンは、major.minor.teeny という形式です。
  def RUBY_VERSION; end

  # --- SCRIPT_LINES__ -> Hash
  # 
  # ソースファイル別にまとめられたソースコードの各行。
  # 
  # この定数は、デフォルトでは定義されていません。
  # この定数がハッシュとして定義された後にソースがコンパイルされると、
  # そのソースファイル名をキーに、
  # ソースを行毎に分割した配列を値にしたハッシュ要素が設定されます。
  # 
  # この定数はデバッガ ([[lib:debug]]) などで利用されています。
  # 
  # なお、 [[m:$SAFE]] レベルが 0 でなければ有効にはなりません。
  # また、 [[m:Kernel.#eval]] によるコンパイルは対象にはなりません。
  # 
  # 
  # 例:
  #     require 'pp'
  #     SCRIPT_LINES__ = {}
  #     require 'English'
  #     pp SCRIPT_LINES__
  # 
  #     # => {"/usr/local/lib/ruby/1.6/English.rb"=>
  #     #     ["alias $ERROR_INFO              $!\n",
  #     #      "alias $ERROR_POSITION          $@\n",
  #     #      "alias $LOADED_FEATURES         $\"\n",
  #     #               :
  #     #               :
  #     #      "alias $POSTMATCH               $'\n",
  #     #      "alias $LAST_PAREN_MATCH        $+\n"]}
  def SCRIPT_LINES__; end

  # --- STDERR -> IO
  # 標準エラー出力。[[m:$stderr]] のデフォルト値。 [[m:$stderr]] も参照してください。
  # 
  # STDERR は、 ruby プロセスが起動された時点での標準エラー出力を表します。
  # 起動時点では [[m:$stderr]] も同じ値に初期化されています。
  # 
  # [[m:$stderr]] に他の出力オブジェクトを代入することで簡易なリダイレクトを実現できます。
  # そして、 [[m:$stderr]] に STDERR を代入すればこのリダイレクトを復元できるわけです。
  # 
  # === 注意
  # STDERR は ruby 自体が起動された時点での標準エラー出力です。
  # 「システムにおける標準のエラー出力ストリーム」とは異なります。
  # 
  # 多くのシステムでは標準のエラー出力ストリームは端末です。
  # ruby 自体が他のストリームに向けてエラー出力をリダイレクトされた状態で起動された場合、
  # STDERR が保持するのは端末ではなく、リダイレクト先のストリームです。
  def STDERR; end

  # --- STDIN -> IO
  # 標準入力。[[m:$stdin]] のデフォルト値。 [[m:$stdin]] も参照してください。
  # 
  # STDIN は、 ruby プロセスが起動された時点での標準入力を表します。
  # 起動時点では [[m:$stdin]] も同じ値に初期化されています。
  # 
  # [[m:$stdin]] に他の入力オブジェクトを代入することで簡易なリダイレクトを実現できます。
  # そして、 [[m:$stdin]] に STDIN を代入すればこのリダイレクトを復元できるわけです。
  # 
  # === 注意
  # STDIN は ruby 自体が起動された時点での標準入力です。
  # 「システムにおける標準の入力ストリーム」とは異なります。
  # 
  # 多くのシステムでは標準の入力ストリームは端末です。
  # ruby 自体が他のストリームに向けて入力をリダイレクトされた状態で起動された場合、
  # STDIN が保持するのは端末ではなく、リダイレクト先のストリームです。
  def STDIN; end

  # --- STDOUT -> IO
  # 標準出力。[[m:$stdout]] のデフォルト値。 [[m:$stdout]] も参照してください。
  # 
  # STDOUT は、 ruby プロセスが起動された時点での標準出力を表します。
  # 起動時点では [[m:$stdout]] も同じ値に初期化されています。
  # 
  # [[m:$stdout]] に他の出力オブジェクトを代入することで簡易なリダイレクトを実現できます。
  # そして、 [[m:$stdout]] に STDOUT を代入すればこのリダイレクトを復元できるわけです。
  # 
  # === 注意
  # STDOUT は ruby 自体が起動された時点での標準出力です。
  # 「システムにおける標準の出力ストリーム」とは異なります。
  # 
  # 多くのシステムでは標準の出力ストリームは端末です。
  # ruby 自体が他のストリームに向けて出力をリダイレクトされた状態で起動された場合、
  # STDOUT が保持するのは端末ではなく、リダイレクト先のストリームです。
  def STDOUT; end

  # --- TOPLEVEL_BINDING -> Binding
  # 
  # トップレベルでの [[c:Binding]] オブジェクト。
  # 
  # 詳細は [[c:Binding]] を参照してください。
  def TOPLEVEL_BINDING; end

  # --- TRUE -> TrueClass
  # 非推奨です。代表的な真の値。true と同じ。
  # 
  # この定数は過去との互換性のために提供されています。擬似変数 true を使ってください。
  # 
  # Ruby では false と nil が偽として扱われます。
  # 偽でない値(false でも nil でもない値) は全て真とみなされます。
  def TRUE; end

end
