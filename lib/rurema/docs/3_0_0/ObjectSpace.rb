module ObjectSpace
  # --- _id2ref(id)    -> object
  # 
  # オブジェクト ID([[m:BasicObject#__id__]])からオブジェクトを得ます。
  # 
  # @param id 取得したいオブジェクトの ID を整数で指定します。
  # 
  # @raise RangeError 対応するオブジェクトが存在しなければ発生します。
  # 
  # //emlist[例][ruby]{
  # a = "hoge"
  # p ObjectSpace._id2ref(a.__id__) #=> "hoge"
  # //}
  def _id2ref; end

  # --- allocation_sourcefile(object) -> String
  # 
  # objectの元となったソースファイル名を返します。
  # 
  # @param object 元となるソースファイル名を取得したいobjectを指定します。
  # @return objectの元となるソースファイル名を返します。存在しない場合はnilを返します。
  # 
  # //emlist[例:test.rbというファイルで下記のスクリプトを実行した場合][ruby]{
  # require 'objspace'
  # 
  # ObjectSpace::trace_object_allocations_start
  # obj = Object.new
  # puts "file:#{ObjectSpace::allocation_sourcefile(obj)}"   # => file:test.rb
  # ObjectSpace::trace_object_allocations_stop
  # //}
  # 
  # @see [[m:ObjectSpace.#trace_object_allocations_start]],
  #      [[m:ObjectSpace.#trace_object_allocations_stop]]
  def allocation_sourcefile; end

  # --- allocation_sourceline(object) -> Integer
  # 
  # objectの元となったソースファイルの行番号を返します。
  # 
  # @param object 元となるソースファイルの行番号を取得したいobjectを指定します。
  # @return objectの元となるソースファイルの行番号を返します。存在しない場合はnilを返します。
  # 
  # //emlist[例][ruby]{
  # require 'objspace'
  # 
  # ObjectSpace::trace_object_allocations_start
  # obj = Object.new
  # puts "line:#{ObjectSpace::allocation_sourceline(obj)}"  # => line:4
  # ObjectSpace::trace_object_allocations_stop
  # //}
  # 
  # @see [[m:ObjectSpace.#trace_object_allocations_start]],
  #      [[m:ObjectSpace.#trace_object_allocations_stop]]
  def allocation_sourceline; end

  # --- count_nodes(result_hash = nil) -> Hash
  # 
  # ノードの種類ごとの数を格納したハッシュを返します。
  # 
  # @param result_hash 戻り値のためのハッシュを指定します。省略した場合は新
  #                    しくハッシュを作成します。result_hash の内容は上書き
  #                    されます。プローブ効果を避けるために使用します。
  # 
  # @raise TypeError result_hash にハッシュ以外を指定した時に発生します。
  # 
  # 本メソッドは普通の Ruby プログラマ向けのメソッドではありません。パフォー
  # マンスやメモリ管理に興味のある C Ruby の開発者向けのものです。
  # 
  # 例:
  # 
  #   ObjectSpace.count_nodes
  #   # => {:NODE_METHOD=>2027, :NODE_FBODY=>1927, :NODE_CFUNC=>1798, ...}
  # 
  # 戻り値のハッシュは処理系に依存します。これは将来変更になるかもしれません。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  def count_nodes; end

  # --- count_objects(result_hash = {}) -> Hash
  # 
  # オブジェクトを種類ごとにカウントした結果を [[c:Hash]] として返します。
  # 
  # このメソッドは C Ruby 以外の Ruby では動かないでしょう。
  # 
  # @param result_hash ハッシュを指定します。与えられたハッシュは上書きして返されます。
  #                    これを利用すると測定による影響を避けることができます。
  # 
  # @raise TypeError 引数に [[c:Hash]] 以外を与えた場合、発生します。
  # 
  # //emlist[例][ruby]{
  # ObjectSpace.count_objects # => {:TOTAL=>10000, :FREE=>3011, :T_OBJECT=>6, :T_CLASS=>404, ...}
  # //}
  def count_objects; end

  # --- count_objects_size(result_hash = nil) -> Hash
  # 
  # 型ごとのオブジェクトサイズをバイト単位で格納したハッシュを返します。
  # 
  # @param result_hash 戻り値のためのハッシュを指定します。省略した場合は新
  #                    しくハッシュを作成します。result_hash の内容は上書き
  #                    されます。プローブ効果を避けるために使用します。
  # 
  # 戻り値の内容は完全ではない事に注意してください。この内容はあくまでもヒ
  # ントとして扱う必要があります。特に T_DATA の合計値は正しくないでしょう。
  # 
  # 例:
  # 
  #   ObjectSpace.count_objects_size
  #   # => {:TOTAL=>1461154, :T_CLASS=>158280, :T_MODULE=>20672, :T_STRING=>527249, ...}
  # 
  # @raise TypeError result_hash にハッシュ以外を指定した時に発生します。
  # 
  # 戻り値のハッシュは処理系に依存します。これは将来変更になるかもしれません。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  def count_objects_size; end

  # --- count_tdata_objects(result_hash = nil) -> Hash
  # 
  # T_DATA の種類ごとにオブジェクトの数を格納したハッシュを返します。
  # 
  # @param result_hash 戻り値のためのハッシュを指定します。省略した場合は新
  #                    しくハッシュを作成します。result_hash の内容は上書き
  #                    されます。プローブ効果を避けるために使用します。
  # 
  # @raise TypeError result_hash にハッシュ以外を指定した時に発生します。
  # 
  # 本メソッドは普通の Ruby プログラマ向けのメソッドではありません。パフォー
  # マンスに興味のある C Ruby の開発者向けのものです。
  # 
  # 例:
  # 
  #   ObjectSpace.count_tdata_objects
  #   # => {RubyVM::InstructionSequence=>504, :parser=>5, :barrier=>6,
  #         :mutex=>6, Proc=>60, RubyVM::Env=>57, Mutex=>1, Encoding=>99,
  #         ThreadGroup=>1, Binding=>1, Thread=>1, RubyVM=>1, :iseq=>1,
  #         Random=>1, ARGF.class=>1, Data=>1, :autoload=>3, Time=>2}
  # 
  # 現在のバージョンでは、戻り値のキーはクラスオブジェクトかシンボルのオブ
  # ジェクトです。
  # 
  # 普通の参照可能なオブジェクトの場合、キーはクラスオブジェクトです。それ
  # 以外の内部的なオブジェクトの場合、キーはシンボルです。シンボルの値は
  # rb_data_type_struct に格納された名前が使用されます。
  # 
  # 戻り値のハッシュは処理系に依存します。これは将来変更になるかもしれません。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  def count_tdata_objects; end

  # --- define_finalizer(obj, proc)         -> Array
  # --- define_finalizer(obj) {|id| ...}    -> Array
  # 
  # obj が解放されるときに実行されるファイナライザ proc を
  # 登録します。同じオブジェクトについて複数回呼ばれたときは置き換えで
  # はなく追加登録されます。固定値 0 と proc を配列にして返します。
  # 
  # ブロックを指定した場合は、そのブロックがファイナライザになります。
  # obj の回収時にブロックは obj の ID ([[m:BasicObject#__id__]])を引数とし
  # て実行されます。
  # しかし、後述の問題があるのでブロックでファイナライザを登録するのは難しいでしょう。
  # 
  # @param obj ファイナライザを登録したいオブジェクトを指定します。
  # 
  # @param proc ファイナライザとして [[c:Proc]] オブジェクトを指定します。proc は obj の回収時に obj の ID を引数として実行されます。
  # 
  # === 使い方の注意
  # 
  # 以下は、define_finalizer の使い方の悪い例です。
  # 
  # //emlist[悪い例][ruby]{
  # class Foo
  #   def initialize
  #     ObjectSpace.define_finalizer(self) {
  #       puts "foo"
  #     }
  #   end
  # end
  # Foo.new
  # GC.start
  # //}
  # 
  # これは、渡された proc の self が obj を参照しつ
  # づけるため。そのオブジェクトが GC の対象になりません。
  # 
  # [[lib:tempfile]] は、ファイナライザの使い方の
  # 良い例になっています。これは、クラスのコンテキストで [[c:Proc]] を
  # 生成することで上記の問題を回避しています。
  # 
  # //emlist[例][ruby]{
  # class Bar
  #   def Bar.callback
  #     proc {
  #       puts "bar"
  #     }
  #   end
  #   def initialize
  #     ObjectSpace.define_finalizer(self, Bar.callback)
  #   end
  # end
  # Bar.new
  # GC.start
  # //}
  # 
  # proc の呼び出しで発生した大域脱出(exitや例外)は無視されます。
  # これは、スクリプトのメイン処理が GC の発生によって非同期に中断され
  # るのを防ぐためです。不安なうちは -d オプションで
  # 事前に例外の発生の有無を確認しておいた方が良いでしょう。
  # 
  # //emlist[例][ruby]{
  # class Baz
  #   def initialize
  #     ObjectSpace.define_finalizer self, eval(%q{
  #       proc {
  #         raise "baz" rescue puts $!
  #         raise "baz2"
  #         puts "baz3"
  #       }
  #     }, TOPLEVEL_BINDING)
  #   end
  # end
  # Baz.new
  # GC.start
  # 
  # # => baz
  # //}
  # 
  # @see [[d:spec/rubycmd]]
  def define_finalizer; end

  # --- each_object        {|object| ...}    -> Integer
  # --- each_object(klass) {|object| ...}    -> Integer
  # --- each_object                          -> Enumerator
  # --- each_object(klass)                   -> Enumerator
  # 
  # 指定された klass と [[m:Object#kind_of?]] の関係にある全ての
  # オブジェクトに対して繰り返します。引数が省略された時には全てのオブ
  # ジェクトに対して繰り返します。
  # 繰り返した数を返します。
  # 
  # ブロックが与えられなかった場合は、
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # 次のクラスのオブジェクトについては繰り返しません
  # 
  #  * [[c:Fixnum]]
  #  * [[c:Symbol]]
  #  * [[c:TrueClass]]
  #  * [[c:FalseClass]]
  #  * [[c:NilClass]]
  # 
  # とくに、klass に [[c:Fixnum]] や [[c:Symbol]] などのクラスを指定した場合は、
  # 何も繰り返さないことになります。
  # なお、[[c:Symbol]] については、かわりに [[m:Symbol.all_symbols]] が使用できます。
  # 
  # @param klass クラスかモジュールを指定します。
  # 
  # //emlist[例: ブロックなし][ruby]{
  # p ObjectSpace.each_object
  # # => #<Enumerator: ObjectSpace:each_object(false)>
  # //}
  # 
  # //emlist[例: 全てのオブジェクトを扱う][ruby]{
  # ObjectSpace.each_object.take(5).each { |x| p x }
  # count = ObjectSpace.each_object { |x| x }
  # puts "Total count: #{count}"
  # 
  # # => "scope"
  # # => "scopes"
  # # => "sym"
  # # => "class_names"
  # # => "@corrections"
  # # => Total count: 9938
  # //}
  # 
  # //emlist[例: 任意のクラスを扱う][ruby]{
  # Person = Struct.new(:name)
  # s1 = Person.new("tanaka")
  # s2 = Person.new("sato")
  # 
  # count = ObjectSpace.each_object(Person) { |x| p x }
  # puts "Total count: #{count}"
  # 
  # # => #<struct Person name="sato">
  # # => #<struct Person name="tanaka">
  # # => Total count: 2
  # //}
  def each_object; end

  # --- garbage_collect(full_mark: true, immediate_sweep: true) -> nil
  # 
  # どこからも参照されなくなったオブジェクトを回収します。
  # [[m:GC.start]] と同じです。
  # 
  # @param full_mark マイナー GC を動作させる場合は false を、そうでない場
  #                  合は true を指定します。
  # 
  # @param immediate_sweep sweep を遅らせる(Lazy Sweep を行う)場合は false
  #                        を、そうでない場合は true を指定します。
  # 
  # 注意: これらのキーワード引数は Ruby の実装やバージョンによって異なりま
  # す。将来のバージョンとの互換性も保証されません。また、Ruby の実装がサポー
  # トしていない場合はキーワード引数を指定しても無視される可能性があります。
  # 
  # 
  # @see [[m:GC.start]]
  def garbage_collect; end

  # --- memsize_of(obj) -> Integer
  # 
  # obj が消費するメモリ使用量をバイト単位で返します。
  # 
  # @param obj 任意のオブジェクトを指定します。
  # 
  # 戻り値の内容は完全ではない事に注意してください。この内容はあくまでもヒ
  # ントとして扱う必要があります。特に T_DATA の値は正しくないでしょう。
  # 2.2 以降では RVALUE のサイズを含んだ結果を返します。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  # 
  # //emlist[例][ruby]{
  # require 'objspace'
  # 
  # ObjectSpace.memsize_of(10)            # => 0
  # ObjectSpace.memsize_of("12345" * 10)  # => 91
  # //}
  def memsize_of; end

  # --- memsize_of_all(klass = nil) -> Integer
  # 
  # すべての生存しているオブジェクトが消費しているメモリ使用量をバイト単位
  # で返します。
  # 
  # @param klass 指定したクラスのインスタンスのメモリ使用量を返します。省略
  #              した場合はすべてのクラスのインスタンスのメモリ使用量を返し
  #              ます。
  # 
  # 本メソッドは以下のような Ruby のコードで定義できます。
  # 
  #   def memsize_of_all klass = false
  #     total = 0
  #     ObjectSpace.each_object{|e|
  #       total += ObjectSpace.memsize_of(e) if klass == false || e.kind_of?(klass)
  #     }
  #     total
  #   end
  # 
  # 戻り値の内容は完全ではない事に注意してください。この内容はあくまでもヒ
  # ントとして扱う必要があります。特に T_DATA の値は正しくないでしょう。
  # 
  # また、同様に戻り値の内容は malloc されたメモリの合計でもない事に注意し
  # てください。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  def memsize_of_all; end

  # --- reachable_objects_from(obj) -> Array | nil
  # 
  # obj から到達可能なすべてのオブジェクトを返します。マーク不能なオブジェ
  # クトを指定した場合は nil を返します。本メソッドを使う事でメモリリークの
  # 調査が行えます。
  # 
  #   # 配列クラス(Array)と 'a'、'b'、'c' に到達可能。
  #   ObjectSpace.reachable_objects_from(['a', 'b', 'c'])
  #   # => [Array, 'a', 'b', 'c']
  # 
  # obj が 2 つ以上の同じオブジェクト x への参照を持つ場合、戻り値に含まれ
  # るオブジェクト x は 1 つだけです。
  # 
  #   # 配列クラス(Array)と v に到達可能。
  #   ObjectSpace.reachable_objects_from([v = 'a', v, v])
  #   # => [Array, 'a']
  # 
  #   # 配列クラス(Array)と 3 つの異なる 'a' オブジェクトに到達可能。
  #   ObjectSpace.reachable_objects_from(['a', 'a', 'a'])
  #   # => [Array, 'a', 'a', 'a']
  # 
  # obj にマーク不能なオブジェクト(true、false、nil、[[c:Symbol]]、
  # [[c:Fixnum]]、Flonum(即値の [[c:Float]] オブジェクト))を指定した場合は
  # nil を返します。
  # 
  #   # 1 はマーク不能
  #   ObjectSpace.reachable_objects_from(1)
  #   # => nil
  # 
  # obj が内部でオブジェクトへの参照を持つ場合、
  # ObjectSpace::InternalObjectWrapper オブジェクトが戻り値に含まれます。こ
  # のオブジェクトは obj が内部で持っているオブジェクトを持ちます。内部のオ
  # ブジェクトの型を確認する場合は ObjectSpace::InternalObjectWrapper#type
  # を参照してください。:T_CLASS のような [[c:Symbol]] を返します。
  # 
  # obj が ObjectSpace::InternalObjectWrapper オブジェクトであった場合、そ
  # のオブジェクトから参照される全てのオブジェクトを返します。
  # 
  # 本メソッドは C Ruby 以外では動作しません。
  # 
  # @see [[url:https://www.atdot.net/~ko1/diary/201212.html#d8]],
  #      [[url:https://www.atdot.net/~ko1/diary/201212.html#d9]]
  def reachable_objects_from; end

  # --- trace_object_allocations { ... }
  # 
  # 与えられたブロック内でオブジェクトのトレースを行います。　
  # 
  # //emlist[例][ruby]{
  # require 'objspace'
  # 
  # class C
  #   include ObjectSpace
  # 
  #   def foo
  #     trace_object_allocations do
  #       obj = Object.new
  #       p "#{allocation_sourcefile(obj)}:#{allocation_sourceline(obj)}"
  #     end
  #   end
  # end
  # 
  # C.new.foo #=> "objtrace.rb:8"
  # //}
  def trace_object_allocations; end

  # --- trace_object_allocations_start -> nil
  # 
  # オブジェクト割り当てのトレースを開始します。
  # 
  # @see [[m:ObjectSpace.#trace_object_allocations_stop]]
  def trace_object_allocations_start; end

  # --- trace_object_allocations_stop -> nil
  # 
  # オブジェクト割り当てのトレースを終了します。
  # 
  # トレースを終了する為には、[[m:ObjectSpace.#trace_object_allocations_start]]を呼んだ回数分だけこのメソッドを呼ぶ必要があります。
  # 
  # @see [[m:ObjectSpace.#trace_object_allocations_start]]
  def trace_object_allocations_stop; end

  # --- undefine_finalizer(obj)    -> object
  # 
  # obj に対するファイナライザをすべて解除します。
  # obj を返します。
  # 
  # @param obj ファイナライザを解除したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # class Sample
  #   def Sample.callback
  #     proc {
  #       puts "finalize"
  #     }
  #   end
  # 
  #   def initialize
  #     ObjectSpace.define_finalizer(self, Sample.callback)
  #   end
  # 
  #   def undef
  #     ObjectSpace.undefine_finalizer(self)
  #   end
  # end
  # 
  # Sample.new
  # GC.start
  # # => finalize
  # 
  # Sample.new
  # sample.undef
  # GC.start
  # # ※何も出力されない
  # //}
  # 
  # @see [[m:ObjectSpace.#define_finalizer]]
  def undefine_finalizer; end

end
