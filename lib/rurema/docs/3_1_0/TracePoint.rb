class TracePoint
  # --- binding -> Binding
  # 
  # 発生したイベントによって生成された [[c:Binding]] オブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.binding.local_variables # => [:ret]
  # end
  # trace.enable
  # foo 1
  # //}
  def binding; end

  # --- callee_id -> Symbol | nil
  # 
  # イベントが発生したメソッドの呼ばれた名前を [[c:Symbol]] で返します。
  # トップレベルであった場合は nil を返します。
  # 
  # @raise RuntimeError イベントフックの外側で実行した場合に発生します。
  # 
  # //emlist[][ruby]{
  # class C
  #   def method_name
  #   end
  #   alias alias_name method_name
  # end
  # 
  # trace = TracePoint.new(:call) do |tp|
  #   p [tp.method_id, tp.callee_id] # => [:method_name, :alias_name]
  # end
  # trace.enable do
  #   C.new.alias_name
  # end
  # //}
  # 
  # @see [[m:TracePoint#method_id]]
  def callee_id; end

  # --- defined_class -> Class | module
  # 
  # メソッドを定義したクラスかモジュールを返します。
  # 
  # //emlist[例][ruby]{
  # class C; def foo; end; end
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.defined_class # => C
  # end.enable do
  #   C.new.foo
  # end
  # //}
  # 
  # メソッドがモジュールで定義されていた場合も(include に関係なく)モジュー
  # ルを返します。
  # 
  # //emlist[例][ruby]{
  # module M; def foo; end; end
  # class C; include M; end;
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.defined_class # => M
  # end.enable do
  #   C.new.foo
  # end
  # //}
  # 
  # [注意] 特異メソッドを実行した場合は TracePoint#defined_class は特異クラ
  # スを返します。また、[[m:Kernel.#set_trace_func]] の 6 番目のブロックパ
  # ラメータは特異クラスではなく元のクラスを返します。
  # 
  # //emlist[例][ruby]{
  # class C; def self.foo; end; end
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.defined_class # => #<Class:C>
  # end.enable do
  #   C.foo
  # end
  # //}
  # 
  # [[m:Kernel.#set_trace_func]] と [[c:TracePoint]] の上記の差分に注意して
  # ください。
  # 
  # @see [[ruby-core:50864]]
  def defined_class; end

  # --- disable         -> bool
  # --- disable { ... } -> object
  # 
  # self のトレースを無効にします。
  # 
  # 実行前の [[m:TracePoint#enabled?]] を返します。(トレースが既に有効であっ
  # た場合は true を返します。そうでなければ false を返します)
  # 
  # //emlist[例][ruby]{
  # trace.enabled? # => true
  # trace.disable  # => false (実行前の状態)
  # trace.enabled? # => false
  # trace.disable  # => false
  # //}
  # 
  # ブロックが与えられた場合、ブロック内でのみトレースが無効になります。
  # この場合はブロックの評価結果を返します。
  # 
  # //emlist[例][ruby]{
  # trace.enabled?   # => true
  # 
  # trace.disable do
  #   trace.enabled? # => false
  # end
  # 
  # trace.enabled?   # => true
  # //}
  # 
  # [注意] イベントフックのためのメソッドに、ブロックの外側で参照した場合は
  # [[c:RuntimeError]] が発生する事に注意してください。
  # 
  #   trace.enable { p trace.lineno }
  #   # => RuntimeError: access from outside
  # 
  # @see [[m:TracePoint#enable]], [[m:TracePoint#enabled?]]
  def disable; end

  # --- enable         -> bool
  # --- enable { ... } -> object
  # 
  # self のトレースを有効にします。
  # 
  # 実行前の [[m:TracePoint#enabled?]] を返します。(トレースが既に有効であっ
  # た場合は true を返します。そうでなければ false を返します)
  # 
  # //emlist[例][ruby]{
  # trace.enabled?  # => false
  # trace.enable    # => false (実行前の状態)
  # 
  # # トレースが有効
  # 
  # trace.enabled?  # => true
  # trace.enable    # => true (実行前の状態)
  # 
  # # 引き続きトレースが有効
  # //}
  # 
  # ブロックが与えられた場合、ブロック内でのみトレースが有効になります。
  # この場合はブロックの評価結果を返します。
  # 
  # //emlist[例][ruby]{
  # trace.enabled?   # => false
  # 
  # trace.enable do
  #   trace.enabled? # => true
  # end
  # 
  # trace.enabled?   # => false
  # //}
  # 
  # [注意] イベントフックのためのメソッドにブロックの外側で参照した場合は
  # [[c:RuntimeError]] が発生する事に注意してください。
  # 
  # //emlist[例][ruby]{
  # trace.enable { p trace.lineno }
  # # => RuntimeError: access from outside
  # //}
  # 
  # @see [[m:TracePoint#disable]], [[m:TracePoint#enabled?]]
  def enable; end

  # --- enabled? -> bool
  # 
  # self のトレースが有効な場合に true を、そうでない場合に false を返しま
  # す。
  # 
  # 
  # @see [[m:TracePoint#enable]], [[m:TracePoint#disable]]
  def enabled?; end

  # --- event -> Symbol
  # 
  # 発生したイベントの種類を [[c:Symbol]] で返します。
  # 
  # 発生するイベントの詳細については、[[m:TracePoint.new]] を参照してくださ
  # い。
  # 
  # @raise RuntimeError イベントフックの外側で実行した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:call, :return) do |tp|
  #   p tp.event
  # end
  # trace.enable
  # foo 1
  # # => :call
  # # :return
  # //}
  def event; end

  # --- inspect -> String
  # 
  # self の状態を人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.inspect # "#<TracePoint:call `foo'@/path/to/test.rb:1>"
  # end
  # trace.enable
  # foo 1
  # //}
  def inspect; end

  # --- lineno -> Integer
  # 
  # 発生したイベントの行番号を返します。
  # 
  # @raise RuntimeError イベントフックの外側で実行した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:call, :return) do |tp|
  #   tp.lineno
  # end
  # trace.enable
  # foo 1
  # # => 1
  # # 3
  # //}
  def lineno; end

  # --- method_id -> Symbol | nil
  # 
  # イベントが発生したメソッドの定義時の名前を [[c:Symbol]] で返します。
  # トップレベルであった場合は nil を返します。
  # 
  # @raise RuntimeError イベントフックの外側で実行した場合に発生します。
  # 
  # //emlist[][ruby]{
  # class C
  #   def method_name
  #   end
  #   alias alias_name method_name
  # end
  # 
  # trace = TracePoint.new(:call) do |tp|
  #   p [tp.method_id, tp.callee_id] # => [:method_name, :alias_name]
  # end
  # trace.enable do
  #   C.new.alias_name
  # end
  # //}
  # 
  # @see [[m:TracePoint#callee_id]]
  def method_id; end

  # --- path -> String
  # 
  # イベントが発生したファイルのパスを返します。
  # 
  # @raise RuntimeError イベントフックの外側で実行した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:call) do |tp|
  #   p tp.path # => "/path/to/test.rb"
  # end
  # trace.enable
  # foo 1
  # //}
  def path; end

  # --- raised_exception -> Exception
  # 
  # 発生した例外を返します。
  # 
  # @raise RuntimeError :raise イベントのためのイベントフックの外側で実行し
  #                     た場合に発生します。
  # 
  # //emlist[例][ruby]{
  # trace = TracePoint.new(:raise) do |tp|
  #   tp.raised_exception # => #<ZeroDivisionError: divided by 0>
  # end
  # trace.enable
  # begin
  #   0/0
  # rescue
  # end
  # //}
  def raised_exception; end

  # --- return_value -> object
  # 
  # メソッドやブロックの戻り値を返します。
  # 
  # @raise RuntimeError :return、:c_return、:b_return イベントのためのイベ
  #                     ントフックの外側で実行した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo(ret)
  #   ret
  # end
  # trace = TracePoint.new(:return) do |tp|
  #   p tp.return_value # => 1
  # end
  # trace.enable
  # foo 1
  # //}
  def return_value; end

  # --- self -> object
  # 
  # イベントを発生させたオブジェクトを返します。
  # 
  # 以下のようにする事で同じ値を取得できます。
  # 
  # //emlist[例][ruby]{
  # trace.binding.eval('self')
  # //}
  # 
  # @see [[m:TracePoint#binding]]
  def self; end

  # --- new(*events) {|obj| ... } -> TracePoint
  # 
  # 新しい [[c:TracePoint]] オブジェクトを作成して返します。トレースを有効
  # にするには [[m:TracePoint#enable]] を実行してください。
  # 
  # //emlist[例:irb で実行した場合][ruby]{
  # trace = TracePoint.new(:call) do |tp|
  #     p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
  # end
  # # => #<TracePoint:0x007f17372cdb20>
  # 
  # trace.enable
  # # => false
  # 
  # puts "Hello, TracePoint!"
  # # ...
  # # [69, IRB::Notifier::AbstractNotifier, :printf, :call]
  # # ...
  # //}
  # 
  # トレースを無効にするには [[m:TracePoint#disable]] を実行してください。
  # 
  # //emlist[][ruby]{
  # trace.disable
  # //}
  # 
  # @param events トレースするイベントを [[c:String]] か [[c:Symbol]] で任
  #               意の数指定します。
  # 
  # : :line
  # 
  #   式の評価。
  # 
  # : :class
  # 
  #   クラス定義、特異クラス定義、モジュール定義への突入。
  # 
  # : :end
  # 
  #    クラス定義、特異クラス定義、モジュール定義の終了。
  # 
  # : :call
  # 
  #   Ruby で記述されたメソッドの呼び出し。
  # 
  # : :return
  # 
  #   Ruby で記述されたメソッド呼び出しからのリターン。
  # 
  # : :c_call
  # 
  #   C で記述されたメソッドの呼び出し。
  # 
  # : :c_return
  # 
  #   C で記述されたメソッド呼び出しからのリターン。
  # 
  # : :raise
  # 
  #   例外の発生。
  # 
  # : :b_call
  # 
  #   ブロックの開始。
  # 
  # : :b_return
  # 
  #   ブロックの終了。
  # 
  # : :thread_begin
  # 
  #   スレッドの開始。
  # 
  # : :thread_end
  # 
  #   スレッドの終了。
  # 
  # : :fiber_switch
  # 
  #   ファイバーの切り替え。
  # 
  # 指定イベントに関連しない情報を取得するメソッドを実行した場合には
  # [[c:RuntimeError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # TracePoint.trace(:line) do |tp|
  #     p tp.raised_exception
  # end
  # # => RuntimeError: 'raised_exception' not supported by this event
  # //}
  # 
  # イベントフックの外側で、発生したイベントに関連する情報を取得するメソッ
  # ドを実行した場合には [[c:RuntimeError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # TracePoint.trace(:line) do |tp|
  #   $tp = tp
  # end
  # $tp.lineno # => access from outside (RuntimeError)
  # //}
  # 
  # 他のスレッドから参照する事も禁じられています。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  def new; end

  # --- stat -> object
  # TracePoint の内部情報を返します。
  # 
  # 返り値の内容は実装依存です。
  # 将来変更される可能性があります。
  # 
  # このメソッドは TracePoint 自身のデバッグ用です。
  def stat; end

  # --- trace(*events) {|obj| ... } -> TracePoint
  # 
  # 新しい [[c:TracePoint]] オブジェクトを作成して自動的にトレースを開始し
  # ます。[[m:TracePoint.new]] のコンビニエンスメソッドです。
  # 
  # @param events トレースするイベントを [[c:String]] か [[c:Symbol]] で任
  #               意の数指定します。指定できる値については
  #               [[m:TracePoint.new]] を参照してください。
  # 
  # //emlist[例][ruby]{
  # trace = TracePoint.trace(:call) { |tp| [tp.lineno, tp.event] }
  # # => #<TracePoint:0x007f786a452448>
  # 
  # trace.enabled? # => true
  # //}
  # 
  # @raise ThreadError ブロックを指定しなかった場合に発生します。
  def trace; end

end
