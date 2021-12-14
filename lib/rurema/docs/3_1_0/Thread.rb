class Thread
  # --- [](name)    -> object | nil
  # 
  # name に対応したスレッドに固有のデータを取り出します。
  # name に対応するスレッド固有データがなければ nil を返し
  # ます。
  # 
  # @param name スレッド固有データのキーを文字列か [[c:Symbol]] で指定します。
  # 
  # //emlist[例][ruby]{
  # [
  #   Thread.new { Thread.current["name"] = "A" },
  #   Thread.new { Thread.current[:name]  = "B" },
  #   Thread.new { Thread.current["name"] = "C" }
  # ].each do |th|
  #   th.join
  #   puts "#{th.inspect}: #{th[:name]}"
  # end
  # 
  # # => #<Thread:0x00000002a54220 dead>: A
  # # => #<Thread:0x00000002a541a8 dead>: B
  # # => #<Thread:0x00000002a54130 dead>: C
  # //}
  # 
  # [[m:Thread#[] ]] と [[m:Thread#[]=]] を用いたスレッド固有の変数は
  # Fiber を切り替えると異なる変数を返す事に注意してください。
  # 
  # //emlist[][ruby]{
  # def meth(newvalue)
  #   begin
  #     oldvalue = Thread.current[:name]
  #     Thread.current[:name] = newvalue
  #     yield
  #   ensure
  #     Thread.current[:name] = oldvalue
  #   end
  # end
  # //}
  # 
  # この関数に与えるブロックがFiberを切り替える場合は動的スコープとしては
  # 正しく動作しません。
  # 
  # //emlist[][ruby]{
  # f = Fiber.new {
  #   meth(1) {
  #     Fiber.yield
  #   }
  # }
  # meth(2) {
  #   f.resume
  # }
  # f.resume
  # p Thread.current[:name]
  # # => nil if fiber-local
  # # => 2 if thread-local (The value 2 is leaked to outside of meth method.)
  # //}
  # 
  # Fiber を切り替えても同じ変数を返したい場合は
  # [[m:Thread#thread_variable_get]] と [[m:Thread#thread_variable_set]]
  # を使用してください。
  # 
  # @see [[m:Thread#fetch]], [[m:Thread#[]=]]
  def []; end

  # --- []=(name,val)
  # 
  # val を name に対応するスレッド固有のデータとして格納します。
  # 
  # @param name スレッド固有データのキーを文字列か [[c:Symbol]] で指定します。文字列を指定した場合は [[m:String#to_sym]] によりシンボルに変換されます。
  # 
  # @param val スレッド固有データを指定します。nil を指定するとそのスレッド固有データは削除されます。
  # 
  # 
  # @see [[m:Thread#[] ]]
  def []=; end

  # --- abort_on_exception               -> bool
  # --- abort_on_exception=(newstate)
  # 
  # 真の場合、そのスレッドが例外によって終了した時に、インタプリタ
  # 全体を中断させます。false の場合、あるスレッドで起こった例
  # 外は、[[m:Thread#join]] などで検出されない限りそのスレッ
  # ドだけをなにも警告を出さずに終了させます。
  # 
  # デフォルトは偽です。[[ref:c:Thread#exception]]を参照してください。
  # 
  # @param newstate 自身を実行中に例外発生した場合、インタプリタ全体を終了させるかどうかを true か false で指定します。
  # 
  # //emlist[例][ruby]{
  # thread = Thread.new { sleep 1 }
  # thread.abort_on_exception # => false
  # thread.abort_on_exception = true
  # thread.abort_on_exception # => true
  # //}
  def abort_on_exception; end

  # --- add_trace_func(pr) -> Proc
  # 
  # スレッドにトレース用ハンドラを追加します。
  # 
  # 追加したハンドラを返します。
  # 
  # @param pr トレースハンドラ([[c:Proc]] オブジェクト)
  # 
  # //emlist[例][ruby]{
  # th = Thread.new do
  #   class Trace
  #   end
  #   43.to_s
  # end
  # th.add_trace_func lambda {|*arg| p arg }
  # th.join
  # 
  # # => ["line", "example.rb", 4, nil, #<Binding:0x00007f98e107d0d8>, nil]
  # # => ["c-call", "example.rb", 4, :inherited, #<Binding:0x00007f98e1087448>, Class]
  # # => ["c-return", "example.rb", 4, :inherited, #<Binding:0x00007f98e1085d00>, Class]
  # # => ["class", "example.rb", 4, nil, #<Binding:0x00007f98e108f210>, nil]
  # # => ["end", "example.rb", 5, nil, #<Binding:0x00007f98e108e5e0>, nil]
  # # => ["line", "example.rb", 6, nil, #<Binding:0x00007f98e108d4b0>, nil]
  # # => ["c-call", "example.rb", 6, :to_s, #<Binding:0x00007f98e1097aa0>, Integer]
  # # => ["c-return", "example.rb", 6, :to_s, #<Binding:0x00007f98e1095cc8>, Integer]
  # //}
  # 
  # @see [[m:Thread#set_trace_func]] [[m:Kernel.#set_trace_func]]
  def add_trace_func; end

  # --- alive?     -> bool
  # 
  # スレッドが「生きている」時、true を返します。
  # 
  # 例:
  #   thr = Thread.new { }
  #   thr.join                # => #<Thread:0x401b3fb0 dead>
  #   Thread.current.alive?   # => true
  #   thr.alive?              # => false
  # 
  # [[m:Thread#status]] が真を返すなら、このメソッドも真です。
  # 
  # @see [[m:Thread#status]], [[m:Thread#stop?]]
  def alive?; end

  # --- backtrace    -> [String] | nil
  # スレッドの現在のバックトレースを返します。
  # 
  # スレッドがすでに終了している場合は nil を返します。
  # 
  # //emlist[例][ruby]{
  # class C1
  #   def m1
  #     sleep 5
  #   end
  #   def m2
  #     m1
  #   end
  # end
  # 
  # th = Thread.new {C1.new.m2; Thread.stop}
  # th.backtrace
  # # => [
  # #      [0] "(irb):3:in `sleep'",
  # #      [1] "(irb):3:in `m1'",
  # #      [2] "(irb):6:in `m2'",
  # #      [3] "(irb):10:in `block in irb_binding'"
  # #    ]
  # 
  # th.kill
  # th.backtrace   # => nil
  # //}
  def backtrace; end

  # --- backtrace_locations(start = 0, length = nil) -> [Thread::Backtrace::Location] | nil
  # --- backtrace_locations(range)                   -> [Thread::Backtrace::Location] | nil
  # 
  # スレッドの現在のバックトレースを [[c:Thread::Backtrace::Location]] の配
  # 列で返します。
  # 
  # 引数で指定した値が範囲外の場合、スレッドがすでに終了している場合は nil
  # を返します。
  # 
  # @param start 開始フレームの位置を数値で指定します。
  # 
  # @param length 取得するフレームの個数を指定します。
  # 
  # @param range 取得したいフレームの範囲を示す Range オブジェクトを指定します。
  # 
  # [[m:Kernel.#caller_locations]] と似ていますが、本メソッドは self に限定
  # した情報を返します。
  # 
  # //emlist[例][ruby]{
  # thread = Thread.new { sleep 1 }
  # thread.run
  # thread.backtrace_locations # => ["/path/to/test.rb:1:in `sleep'", "/path/to/test.rb:1:in `block in <main>'"]
  # //}
  # 
  # @see [[c:Thread::Backtrace::Location]]
  def backtrace_locations; end

  # --- exit         -> self
  # --- kill         -> self
  # --- terminate    -> self
  # 
  # スレッドの実行を終了させます。終了時に ensure 節が実行されます。
  # 
  # ただし、スレッドは終了処理中(aborting)にはなりますが、
  # 直ちに終了するとは限りません。すでに終了している場合は何もしません。このメソッドにより
  # 終了したスレッドの [[m:Thread#value]] の返り値は不定です。
  # 自身がメインスレッドであるか最後のスレッドである場合は、プロセスを [[m:Kernel.#exit]](0) 
  # により終了します。
  # 
  # [[m:Kernel.#exit]] と違い例外  [[c:SystemExit]] を発生しません。
  # 
  #   th1 = Thread.new do
  #     begin
  #       sleep 10
  #     ensure
  #       p "this will be displayed"
  #     end
  #   end
  # 
  #   sleep 0.1
  #   th1.kill
  # 
  #   #=> "this will be displayed"
  # 
  # @see [[m:Kernel.#exit]], [[m:Kernel.#exit!]]
  def exit; end

  # --- fetch(name, default = nil) {|name| ... } -> object
  # 
  # name に関連づけられたスレッドに固有のデータを返します。
  # name に対応するスレッド固有データがない時には、引数 default が
  # 与えられていればその値を、ブロックが与えられていれば
  # そのブロックを評価した値を返します。
  # 
  # @param name スレッド固有データのキーを文字列か [[c:Symbol]] で指定します。
  # @param default name に対応するスレッド固有データがない時の返り値を指定します。
  # @raise KeyError 引数defaultもブロックも与えられてない時、
  #                 name に対応するスレッド固有データがないと発生します。
  # 
  # //emlist[例][ruby]{
  # th = Thread.new { Thread.current[:name] = 'A' }
  # th.join
  # th.fetch(:name)   # => "A"
  # th.fetch(:fetch, 'B')   # => "B"
  # th.fetch('name')  {|name| "Thread" + name}  # => "A"
  # th.fetch('fetch') {|name| "Thread" + name}  # => "Threadfetch"
  # //}
  # 
  # @see [[m:Thread#[] ]]
  def fetch; end

  # --- group    -> ThreadGroup
  # 
  # スレッドが属している [[c:ThreadGroup]] オブジェクトを返します。
  # 
  #     p Thread.current.group == ThreadGroup::Default
  #     # => true
  def group; end

  # --- inspect -> String
  # --- to_s -> String
  # 
  # 自身を人間が読める形式に変換した文字列を返します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.current
  # a.inspect   # => "#<Thread:0x00007fdbaf07ddb0 run>"
  # b = Thread.new{}
  # b.inspect   # => "#<Thread:0x00007fdbaf8f7d10@(irb):3 dead>"
  # //}
  def inspect; end

  # --- join           -> self
  # --- join(limit)    -> self | nil
  # 
  # スレッド self の実行が終了するまで、カレントスレッドを停止し
  # ます。self が例外により終了していれば、その例外がカレントス
  # レッドに対して発生します。
  # 
  # limit を指定して、limit 秒過ぎても自身が終了しない場合、nil を返します。
  # 
  # @param limit タイムアウトする時間を整数か小数で指定します。単位は秒です。
  # 
  # @raise ThreadError join を実行することによってデッドロックが起きる場合に発生します。またカレントスレッドを join したときにも発生します。
  # 
  # 以下は、生成したすべてのスレッドの終了を待つ例です。
  # 
  #    threads = []
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  # 
  #    threads.each {|t| t.join}
  def join; end

  # --- key?(name)     -> bool
  # 
  # name に対応したスレッドに固有のデータが定義されていれば
  # true を返します。
  # 
  # @param name 文字列か [[c:Symbol]] で指定します。
  # 
  # //emlist[例][ruby]{
  # me = Thread.current
  # me[:oliver] = "a"
  # me.key?(:oliver)    # => true
  # me.key?(:stanley)   # => false
  # //}
  def key?; end

  # --- keys    -> [Symbol]
  # 
  # スレッド固有データに関連づけられたキーの配列を返します。キーは
  # [[c:Symbol]] で返されます。
  # 
  #     th = Thread.current
  #     th[:foo] = 'FOO'
  #     th['bar'] = 'BAR'
  #     p th.keys
  # 
  #     #=> [:bar, :foo]
  def keys; end

  # --- name -> String
  # 
  # self の名前を返します。
  # 
  # 
  # @see [[m:Thread#name=]]
  def name; end

  # --- name=(name) -> String
  # 
  # self の名前を name に設定します。
  # 
  # プラットフォームによっては pthread やカーネルにも設定を行う場合があります。
  # 
  # @raise ArgumentError 引数に ASCII 互換ではないエンコーディングのものを
  #                      指定した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.new{}
  # a.name = 'named'
  # a.name      # => "named"
  # a.inspect   # => "#<Thread:0x00007f85ac8721f0@named@(irb):1 dead>"
  # //}
  # 
  # @see [[m:Thread#name]]
  def name=; end

  # --- pending_interrupt?(error = nil) -> bool
  # 
  # self の非同期例外のキューが空かどうかを返します。
  # 
  # @param error 対象の例外クラスを指定します。
  # 
  # 
  # @see [[m:Thread.pending_interrupt?]]
  def pending_interrupt?; end

  # --- priority    -> Integer
  # --- priority=(val)
  # 
  # スレッドの優先度を返します。この値が大きいほど優先度が高くなります。
  # メインスレッドのデフォルト値は 0 です。新しく生成されたスレッドは親スレッドの
  # priority を引き継ぎます。
  # 
  # @param val スレッドの優先度を指定します。プラットフォームに依存します。
  # 
  # //emlist[例][ruby]{
  # Thread.current.priority   # => 0
  # 
  # count1 = count2 = 0
  # a = Thread.new do
  #       loop { count1 += 1 }
  #     end
  # a.priority = -1
  # 
  # b = Thread.new do
  #       loop { count2 += 1 }
  #     end
  # b.priority = -2
  # count1 = count2 = 0 # reset
  # sleep 1   # => 1
  # count1    # => 13809431
  # count2    # => 11571921
  # //}
  def priority; end

  # --- raise(error_type, message, traceback)     -> ()
  # 
  # 自身が表すスレッドで強制的に例外を発生させます。
  # 
  # @param error_type [[m:Kernel.#raise]] を参照してください。
  # 
  # @param message [[m:Kernel.#raise]] を参照してください。
  # 
  # @param traceback [[m:Kernel.#raise]] を参照してください。
  # 
  #   Thread.new {
  #     sleep 1
  #     Thread.main.raise "foobar"
  #   }
  # 
  #   begin
  #     sleep
  #   rescue
  #     p $!, $@
  #   end
  # 
  #   => #<RuntimeError: foobar>
  #      ["-:3"]
  def raise; end

  # --- report_on_exception               -> bool
  # --- report_on_exception=(newstate)
  # 
  # 真の場合、そのスレッドが例外によって終了した時に、その内容を $stderr に報告します。
  # 
  # デフォルトはスレッド作成時の [[m:Thread.report_on_exception]] です。
  # 
  # @param newstate スレッド実行中に例外発生した場合、その内容を報告するかどうかを true か false で指定します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.new{ Thread.stop; raise }
  # a.report_on_exception = true
  # a.report_on_exception   # => true
  # a.run
  # # => #<Thread:0x00007fc3f48c7908@(irb):1 run> terminated with exception (report_on_exception is true):
  # #    Traceback (most recent call last):
  # #    (irb):1:in `block in irb_binding': unhandled exception
  # #    #<Thread:0x00007fc3f48c7908@(irb):1 dead>
  # b = Thread.new{ Thread.stop; raise }
  # b.report_on_exception = false
  # b.run   # => #<Thread:0x00007fc3f48aefc0@(irb):4 dead>
  # //}
  # 
  # @see [[m:Thread.report_on_exception]]
  def report_on_exception; end

  # --- run    -> self
  # 
  # 停止状態(stop)のスレッドを再開させます。
  # [[m:Thread#wakeup]] と異なりすぐにスレッドの切り替え
  # を行います。
  # 
  # @raise ThreadError 死んでいるスレッドに対して実行すると発生します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.new { puts "a"; Thread.stop; puts "c" }
  # sleep 0.1 while a.status!='sleep'
  # puts "Got here"
  # a.run
  # a.join
  # # => a
  # # => Got here
  # # => c
  # //}
  # 
  # @see [[m:Thread#wakeup]], [[m:Thread.stop]]
  def run; end

  # --- safe_level    -> Integer
  # 
  # セーフレベルを返します。
  # 
  # Ruby 2.6 から[[m:$SAFE]]がプロセスグローバルになったため、このメソッドは obsolete になりました。
  # 単純に [[m:$SAFE]] をチェックしてください。
  # 
  # セーフレベルについては[[d:spec/safelevel]]を参照してください。
  # 
  # //emlist[例][ruby]{
  # thr = Thread.new { $SAFE = 1; sleep }
  # Thread.current.safe_level   # => 0
  # thr.safe_level              # => 1
  # //}
  def safe_level; end

  # --- set_trace_func(pr) -> Proc | nil
  # 
  # スレッドにトレース用ハンドラを設定します。
  # 
  # nil を渡すとトレースを解除します。
  # 
  # 設定したハンドラを返します。
  # 
  # //emlist[例][ruby]{
  # th = Thread.new do
  #   class Trace
  #   end
  #   2.to_s
  #   Thread.current.set_trace_func nil
  #   3.to_s
  # end
  # th.set_trace_func lambda {|*arg| p arg }
  # th.join
  # 
  # # => ["line", "example.rb", 2, nil, #<Binding:0x00007fc8de87cb08>, nil]
  # # => ["c-call", "example.rb", 2, :inherited, #<Binding:0x00007fc8de886770>, Class]
  # # => ["c-return", "example.rb", 2, :inherited, #<Binding:0x00007fc8de8844e8>, Class]
  # # => ["class", "example.rb", 2, nil, #<Binding:0x00007fc8de88e830>, nil]
  # # => ["end", "example.rb", 3, nil, #<Binding:0x00007fc8de88d6b0>, nil]
  # # => ["line", "example.rb", 4, nil, #<Binding:0x00007fc8de88c440>, nil]
  # # => ["c-call", "example.rb", 4, :to_s, #<Binding:0x00007fc8de896f30>, Integer]
  # # => ["c-return", "example.rb", 4, :to_s, #<Binding:0x00007fc8de894a50>, Integer]
  # # => ["line", "example.rb", 5, nil, #<Binding:0x00007fc8de967b08>, nil]
  # # => ["c-call", "example.rb", 5, :current, #<Binding:0x00007fc8de967798>, Thread]
  # # => ["c-return", "example.rb", 5, :current, #<Binding:0x00007fc8de9673b0>, Thread]
  # # => ["c-call", "example.rb", 5, :set_trace_func, #<Binding:0x00007fc8de966fc8>, Thread]
  # //}
  # 
  # @param pr トレースハンドラ([[c:Proc]] オブジェクト) もしくは nil
  # @see [[m:Thread#add_trace_func]] [[m:Kernel.#set_trace_func]]
  def set_trace_func; end

  # --- status    -> String | false | nil
  # 
  # 生きているスレッドの状態を文字列 "run"、"sleep", "aborting" のいず
  # れかで返します。正常終了したスレッドに対して false、例外によ
  # り終了したスレッドに対して nil を返します。
  # 
  # [[m:Thread#alive?]] が真を返すなら、このメソッドも真です。
  # 
  # 例:
  #   a = Thread.new { raise("die now") }
  #   b = Thread.new { Thread.stop }
  #   c = Thread.new { Thread.exit }
  #   d = Thread.new { sleep }
  #   d.kill                  #=> #<Thread:0x401b3678 aborting>
  #   a.status                #=> nil
  #   b.status                #=> "sleep"
  #   c.status                #=> false
  #   d.status                #=> "aborting"
  #   Thread.current.status   #=> "run"
  # 
  # @see [[m:Thread#alive?]], [[m:Thread#stop?]]
  def status; end

  # --- stop?    -> bool
  # 
  # スレッドが終了(dead)あるいは停止(stop)している時、true を返します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.new { Thread.stop }
  # b = Thread.current
  # a.stop?   # => true
  # b.stop?   # => false
  # //}
  # 
  # @see [[m:Thread#alive?]], [[m:Thread#status]]
  def stop?; end

  # --- thread_variable?(key) -> bool
  # 
  # 引数 key で指定した名前のスレッドローカル変数が存在する場合に true、そ
  # うでない場合に false を返します。
  # 
  # @param key 変数名を [[c:String]] か [[c:Symbol]] で指定します。
  # 
  #    me = Thread.current
  #    me.thread_variable_set(:oliver, "a")
  #    me.thread_variable?(:oliver)    # => true
  #    me.thread_variable?(:stanley)   # => false
  # 
  # [注意]: [[m:Thread#[] ]] でセットしたローカル変数(Fiber ローカル変数)が
  # 対象ではない事に注意してください。
  # 
  # @see [[m:Thread#thread_variable_get]], [[m:Thread#[] ]]
  def thread_variable?; end

  # --- thread_variable_get(key) -> object | nil
  # 
  # 引数 key で指定した名前のスレッドローカル変数を返します。
  # 
  # [注意]: [[m:Thread#[] ]] でセットしたローカル変数(Fiber ローカル変数)と
  # 異なり、Fiber を切り替えても同じ変数を返す事に注意してください。
  # 
  # 例:
  # 
  #   Thread.new {
  #     Thread.current.thread_variable_set("foo", "bar") # スレッドローカル
  #     Thread.current["foo"] = "bar"                    # Fiber ローカル
  # 
  #     Fiber.new {
  #       Fiber.yield [
  #         Thread.current.thread_variable_get("foo"), # スレッドローカル
  #         Thread.current["foo"],                     # Fiber ローカル
  #       ]
  #     }.resume
  #   }.join.value # => ['bar', nil]
  # 
  # この例の "bar" は [[m:Thread#thread_variable_get]] により得られ
  # た値で、nil は[[m:Thread#[] ]] により得られた値です。
  # 
  # @see [[m:Thread#thread_variable_set]], [[m:Thread#[] ]]
  # 
  # @see [[url:https://magazine.rubyist.net/articles/0041/0041-200Special-note.html]]
  def thread_variable_get; end

  # --- thread_variable_set(key, value)
  # 
  # 引数 key で指定した名前のスレッドローカル変数に引数 value をセットしま
  # す。
  # 
  # [注意]: [[m:Thread#[] ]] でセットしたローカル変数(Fiber ローカル変数)と
  # 異なり、セットした変数は Fiber を切り替えても共通で使える事に注意してく
  # ださい。
  # 
  # //emlist[例][ruby]{
  # thr = Thread.new do
  #   Thread.current.thread_variable_set(:cat, 'meow')
  #   Thread.current.thread_variable_set("dog", 'woof')
  # end
  # thr.join               # => #<Thread:0x401b3f10 dead>
  # thr.thread_variables   # => [:dog, :cat]
  # //}
  # 
  # @see [[m:Thread#thread_variable_get]], [[m:Thread#[] ]]
  def thread_variable_set; end

  # --- value    -> object 
  # 
  # スレッド self が終了するまで待ち([[m:Thread#join]] と同じ)、
  # そのスレッドのブロックが返した値を返します。スレッド実行中に例外が
  # 発生した場合には、その例外を再発生させます。
  # 
  # スレッドが [[m:Thread#kill]] によって終了した場合は、返り値は不定です。
  # 
  # 以下は、生成したすべてのスレッドの終了を待ち結果を出力する例です。
  # 
  #    threads = []
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  #    threads.push(Thread.new { n = rand(5); sleep n; n })
  # 
  #    threads.each {|t| p t.value}
  # 
  # 最後の行で、待ち合わせを行っていることがわかりにくいと思うなら以下
  # のように書くこともできます。
  # 
  #    threads.each {|t| p t.join.value}
  def value; end

  # --- wakeup    -> self
  # 
  # 停止状態(stop)のスレッドを実行可能状態(run)にします。
  # 
  # @raise ThreadError 死んでいるスレッドに対して実行すると発生します。
  # 
  # //emlist[例][ruby]{
  # c = Thread.new { Thread.stop; puts "hey!" }
  # sleep 0.1 while c.status!='sleep'
  # c.wakeup
  # c.join
  # # => "hey!"
  # //}
  # 
  # @see [[m:Thread#run]], [[m:Thread.stop]]
  def wakeup; end

  # --- DEBUG -> Integer
  # 
  # スレッドのデバッグレベルを返します。
  # 
  # スレッドのデバッグレベルが 0 のときはなにもしません。
  # それ以外の場合は、スレッドのデバッグログを標準出力に出力します。
  # 初期値は 0 です。
  # 使用するためには、THREAD_DEBUG を -1 にして Ruby をコンパイルする必要が
  # あります。
  # 
  # //emlist[例][ruby]{
  # Thread.DEBUG # => 0
  # //}
  # 
  # @see [[m:Thread.DEBUG=]]
  def DEBUG; end

  # --- DEBUG=(val)
  # 
  # スレッドのデバッグレベルを val に設定します。
  # 
  # val が 真 のときは Integer に変換してから設定します。
  # 偽 のときは 0 を設定します。
  # 使用するためには、THREAD_DEBUG を -1 にして Ruby をコンパイルする必要が
  # あります。
  # 
  # //emlist[例][ruby]{
  # Thread.DEBUG # => 0
  # Thread.DEBUG = 1
  # Thread.DEBUG # => 1
  # //}
  # 
  # @see [[m:Thread.DEBUG]]
  def DEBUG=; end

  # --- abort_on_exception             -> bool
  # --- abort_on_exception=(newstate)
  # 
  # 真の時は、いずれかのスレッドが例外によって終了した時に、インタプリタ
  # 全体を中断させます。false の場合、あるスレッドで起こった例外は、[[m:Thread#join]]
  # などで検出されない限りそのスレッドだけをなにも警告を出さずに終了させます。
  # 
  # デフォルトは false です。
  # 
  # [[ref:c:Thread#exception]]を参照してください。
  # 
  # @param newstate スレッド実行中に例外発生した場合、インタプリタ全体を終了させるかどうかを true か false で指定します。
  # 
  # //emlist[例][ruby]{
  # Thread.abort_on_exception # => false
  # Thread.abort_on_exception = true
  # Thread.abort_on_exception # => true
  # //}
  def abort_on_exception; end

  # --- current    -> Thread
  # 
  # 現在実行中のスレッド(カレントスレッド)を返します。
  # 
  #   p Thread.current #=> #<Thread:0x4022e6fc run>
  def current; end

  # --- exclusive { ... }  -> object
  # VM グローバルの Mutex をロックし、ブロックを実行します。
  # 
  # このクラスメソッドの挙動は 1.8 以前とは違います。
  # Thread.exclusive は VM グローバルの Mutex の
  # synchronize を呼び出しているだけで、Thread.exclusive していないスレッドは動きます。
  # [[c:Thread::Mutex]] や [[c:Monitor]] などの他の排他制御の方法を検討してください。
  def exclusive; end

  # --- exit    -> ()
  # 
  # カレントスレッドに対して [[m:Thread#exit]] を呼びます。
  def exit; end

  # --- start(*arg) {|*arg| ... }       -> Thread
  # --- fork(*arg) {|*arg| ... }        -> Thread
  # 
  # スレッドを生成して、ブロックの評価を開始します。
  # 生成したスレッドを返します。
  # 
  # 基本的に [[m:Thread.new]] と同じですが、
  # new メソッドと違い initialize メソッドを呼びません。
  # 
  # @param arg 引数 arg はそのままブロックに渡されます。スレッドの開始と同時にその
  #            スレッド固有のローカル変数に値を渡すために使用します。
  # 
  # @raise ThreadError 現在のスレッドが属する [[c:ThreadGroup]] が freeze されている場合に発生します。またブロックを与えられずに呼ばれた場合にも発生します。
  # 
  # 
  # 注意:
  # 
  # 例えば、以下のコードは間違いです。スレッドの実行が開始される前に
  # 変数 i が書き変わる可能性があるからです。
  # 
  #   for i in 1..5
  #      Thread.start { p i }
  #   end
  # 
  # 上の例は以下のように書き直すべきです。
  # 
  #   for i in 1..5
  #      Thread.start(i) {|t| p t }
  #   end
  def fork; end

  # --- handle_interrupt(hash) { ... } -> object
  # 
  # スレッドの割り込みのタイミングを引数で指定した内容に変更してブロックを
  # 実行します。
  # 
  # 「割り込み」とは、非同期イベントや [[m:Thread#raise]] や
  # [[m:Thread#kill]]、[[m:Signal.#trap]](未サポート)、メインスレッドの終了
  # (メインスレッドが終了すると、他のスレッドも終了されます)を意味します。
  # 
  # @param hash 例外クラスがキー、割り込みのタイミングを指定する
  #             [[c:Symbol]] が値の [[c:Hash]] を指定します。
  #             値の内容は以下のいずれかです。
  # 
  # : :immediate
  # 
  #   すぐに割り込みます。
  # 
  # : :on_blocking
  # 
  #   ブロッキング処理(後述)の間は割り込みが発生します。
  # 
  # : :never
  # 
  #   まったく割り込みません。
  # 
  # 「ブロッキング処理」とは、読み込み処理や書き込み処理のような呼び出し元
  # のスレッドをブロックするような処理を意味します。CRuby の実装では、GVL
  # を解放して実行する処理は全てブロッキング処理に含まれます。
  # 
  # また、マスクされた非同期割り込みは再度有効にされるまで延期されます。本
  # メソッドは [[man:sigprocmask(3)]] に似ています。
  # 
  # @return ブロックの評価結果を返します。
  # 
  # @raise ArgumentError ブロックを指定しなかった場合に発生します。
  # 
  # === 注意
  # 
  # 非同期割り込みの利用は難しいため、スレッド間での通信を実現する場合はま
  # ずはキューのような他の方法を検討してください。それでも非同期割り込みを
  # 利用する場合は本メソッドをよく理解してから利用してください。
  # 
  # === 使い方
  # 
  # 例:[[c:Thread#raise]] 発生のタイミングを制御する例
  # 
  #   th = Thread.new do
  #     Thread.handle_interrupt(RuntimeError => :never) {
  #       begin
  #         # 安全にリソースの割り当てが可能
  #         Thread.handle_interrupt(RuntimeError => :immediate) {
  #           # ...
  #         }
  #       ensure
  #         # 安全にリソースの解放が可能
  #       end
  #     }
  #   end
  #   Thread.pass
  #   # ...
  #   th.raise "stop"
  # 
  # [[c:RuntimeError]] を無視(延期)している間はリソースの割り当てや ensure
  # 節でリソースの解放を安全に行う事ができます。
  # 
  # ==== TimeoutError 対策
  # 
  # 例:[[c:TimeoutError]] 発生のタイミングを制御する例
  # 
  #   require 'timeout'
  #   Thread.handle_interrupt(TimeoutError => :never) {
  #     timeout(10){
  #       # TimeoutError => :never の指定により、ここでは TimeoutError が発生しない。
  #       Thread.handle_interrupt(TimeoutError => :on_blocking) {
  #         # :on_blocking な処理は TimeoutError が発生し得る。
  #       }
  #       # TimeoutError => :never の指定により、ここでは TimeoutError が発生しない。
  #     }
  #   }
  # 
  # この例を ensure 節での [[c:TimeoutError]] 発生に応用する事でリソースリー
  # クに備える事ができます。[[m:Timeout.#timeout]] はスレッドを使って実装さ
  # れているため、Thread.handle_interrupt による制御が有効です。
  # 
  # ==== Stack control settings
  # 
  # It's possible to stack multiple levels of ::handle_interrupt blocks in order
  # to control more than one ExceptionClass and TimingSymbol at a time.
  # 
  #   Thread.handle_interrupt(FooError => :never) {
  #     Thread.handle_interrupt(BarError => :never) {
  #        # FooError and BarError are prohibited.
  #     }
  #   }
  # 
  # ==== 例外クラスの継承関係
  # 
  # 本メソッドでは引数 hash のキーに指定した例外クラスの全てのサブクラスが
  # 処理の対象になります。
  # 
  # 例:
  # 
  #   Thread.handle_interrupt(Exception => :never) {
  #     # Exception を継承する全ての例外クラスの例外の発生を延期。
  #   }
  # 
  # @see [[m:Thread.pending_interrupt?]], [[m:Thread#pending_interrupt?]]
  def handle_interrupt; end

  # --- kill(thread)    -> Thread
  # 
  # 指定したスレッド thread に対して [[m:Thread#exit]] を呼びます。終了したスレッドを返します。
  # 
  # @param thread 終了したい Thread オブジェクトを指定します。
  # 
  #   th = Thread.new do
  #   end
  #     
  #   p Thread.kill(th)     #=> #<Thread:0x40221bc8 dead>
  def kill; end

  # --- list    -> [Thread]
  # 
  # 全ての生きているスレッドを含む配列を生成して返します。aborting 状態であるスレッド
  # も要素に含まれます。
  # 
  #   Thread.new do
  #     sleep 
  #   end
  #   sleep 0.1
  #   
  #   p Thread.list   #=> [#<Thread:0x40377a54 sleep>, #<Thread:0x4022e6fc run>]
  def list; end

  # --- main    -> Thread
  # 
  # メインスレッドを返します。
  # 
  #   p Thread.main #=> #<Thread:0x4022e6fc run>
  def main; end

  # --- new(*arg) {|*arg| ... }         -> Thread
  # 
  # スレッドを生成して、ブロックの評価を開始します。
  # 生成したスレッドを返します。
  # 
  # @param arg 引数 arg はそのままブロックに渡されます。スレッドの開始と同時にその
  #            スレッド固有のローカル変数に値を渡すために使用します。
  # 
  # @raise ThreadError 現在のスレッドが属する [[c:ThreadGroup]] が freeze されている場合に発生します。またブロックを与えられずに呼ばれた場合にも発生します。
  # 
  # 注意:
  # 
  # 例えば、以下のコードは間違いです。スレッドの実行が開始される前に
  # 変数 i が書き変わる可能性があるからです。
  # 
  #   for i in 1..5
  #      Thread.new { p i }
  #   end
  # 
  # 上の例は以下のように書き直すべきです。
  # 
  #   for i in 1..5
  #      Thread.new(i) {|t| p t }
  #   end
  def new; end

  # --- pass    -> nil
  # 
  # 他のスレッドに実行権を譲ります。実行中のスレッドの状態を変えずに、
  # 他の実行可能状態のスレッドに制御を移します。
  # 
  #  Thread.new do
  #    (1..3).each{|i|
  #      p i
  #      Thread.pass
  #    }
  #    exit
  #  end
  #  
  #  loop do
  #    Thread.pass
  #    p :main
  #  end
  # 
  #  #=>
  #  1
  #  :main
  #  2
  #  :main
  #  3
  #  :main
  def pass; end

  # --- pending_interrupt?(error = nil) -> bool
  # 
  # 非同期割り込みのキューが空かどうかを返します。
  # 
  # [[m:Thread.handle_interrupt]] は非同期割り込みの発生を延期させるのに使
  # 用しますが、本メソッドは任意の非同期割り込みが存在するかどうかを確認す
  # るのに使用します。
  # 
  # 本メソッドが true を返した場合、[[m:Thread.handle_interrupt]] で例外の
  # 発生を延期するブロックを終了すると延期させられていた例外を発生させるこ
  # とができます。
  # 
  # @param error 対象の例外クラスを指定します。省略した場合は全ての例外を対
  #              象に確認を行います。
  # 
  # 例: 延期させられていた例外をただちに発生させる。
  # 
  #   def Thread.kick_interrupt_immediately
  #     Thread.handle_interrupt(Object => :immediate) {
  #       Thread.pass
  #     }
  #   end
  # 
  # === 使い方
  # 
  #   th = Thread.new{
  #     Thread.handle_interrupt(RuntimeError => :on_blocking){
  #       while true
  #         ...
  #         # ここまでで割り込みが発生しても安全な状態になった。
  #         if Thread.pending_interrupt?
  #           Thread.handle_interrupt(Object => :immediate){}
  #         end
  #         ...
  #       end
  #     }
  #   }
  #   ...
  #   th.raise # スレッド停止。
  # 
  # この例は以下のように記述する事もできます。
  # 
  #   flag = true
  #   th = Thread.new{
  #     Thread.handle_interrupt(RuntimeError => :on_blocking){
  #       while true
  #         ...
  #         # ここまでで割り込みが発生しても安全な状態になった。
  #         break if flag == false
  #         ...
  #       end
  #     }
  #   }
  #   ...
  #   flag = false # スレッド停止
  # 
  # @see [[m:Thread#pending_interrupt?]], [[m:Thread.handle_interrupt]]
  def pending_interrupt?; end

  # --- report_on_exception             -> bool
  # --- report_on_exception=(newstate)
  # 
  # 真の時は、いずれかのスレッドが例外によって終了した時に、その内容を $stderr に報告します。
  # 
  # デフォルトは true です。
  # 
  #   Thread.new { 1.times { raise } }
  # 
  # は $stderr に以下のように出力します:
  # 
  #   #<Thread:...> terminated with exception (report_on_exception is true):
  #   Traceback (most recent call last):
  #           2: from -e:1:in `block in <main>'
  #           1: from -e:1:in `times'
  # 
  # これによってスレッドのエラーを早期に捕捉できるようになります。
  # いくつかのケースでは、この出力を望まないかもしれません。
  # 出力を抑制するには複数の方法があります:
  # 
  #  * 例外が意図したものではない場合、原因を修正して例外が発生しないようにする方法が最善です。
  #  * 例外が意図したものの場合、例外が発生する場所により近い場所で rescue して、
  #    その例外でスレッドが終了しないようにするのがより良い方法です。
  #  * [[m:Thread#join]] や [[m:Thread#value]] でそのスレッドの終了を待つことが保証できるなら、
  #    スレッド開始時に Thread.current.report_on_exception = false でレポートを無効化しても
  #    安全です。しかし、この場合、例外をハンドルするのが遅れたり、親スレッドがブロックされていて
  #    終了を待つことができなかったりするかもしれません。
  # 
  # スレッドごとに設定する方法は [[m:Thread#report_on_exception=]] を参照してください。
  # 
  # @param newstate スレッド実行中に例外発生した場合、その内容を報告するかどうかを true か false で指定します。
  def report_on_exception; end

  # --- stop     -> nil
  # 
  # 他のスレッドから [[m:Thread#run]] メソッドで再起動されるまで、カレ
  # ントスレッドの実行を停止します。
  # 
  # //emlist[例][ruby]{
  # a = Thread.new { print "a"; Thread.stop; print "c" }
  # sleep 0.1 while a.status!='sleep'
  # print "b"
  # a.run
  # a.join
  # # => "abc"
  # //}
  # 
  # @see [[m:Thread#run]], [[m:Thread#wakeup]]
  def stop; end

end
