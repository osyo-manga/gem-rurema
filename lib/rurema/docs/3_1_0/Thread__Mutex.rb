class Thread::Mutex
  # --- lock -> self
  # mutex オブジェクトをロックします。一度に一つのス
  # レッドだけが mutex をロックできます。既にロックされている mutex
  # に対してロックを行おうとしたスレッドは mutex のロックが解放さ
  # れるまで、実行が停止されます。
  # 
  # @raise ThreadError self 既にカレントスレッドにロックされている場合に発
  #                    生します。
  #                    また、[[m:Signal.#trap]] に指定したハンドラ内で実行
  #                    した場合に発生します。
  # 
  # 
  # @see [[m:Thread::Mutex#unlock]]
  def lock; end

  # --- locked? -> bool
  # mutex がロックされている時、真を返します。
  # 
  # //emlist[例][ruby]{
  # m = Mutex.new
  # m.locked? # => false
  # m.lock
  # m.locked? # => true
  # //}
  def locked?; end

  # --- owned? -> bool
  # 
  # self がカレントスレッドによってロックされている場合に true を返します。
  # そうでない場合に false を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # m = Mutex.new
  # m.owned? # => false
  # m.lock
  # Thread.new do
  #   m.owned? # => false
  # end.join
  # m.owned? # => true
  # //}
  def owned?; end

  # --- sleep(timeout = nil)    -> Integer
  # 
  # 与えられた秒数の間ロックを解除してスリープして、実行後にまたロックします。
  # 
  # @param timeout スリープする秒数を指定します。省略するとスリープし続けます。
  # 
  # @return タイムアウトした時は nil を、それ以外はスリープしていた秒数を返します。
  # 
  # @raise ThreadError 自身がカレントスレッドによってロックされていない場合に発生します。
  # 
  # [注意] 2.0 以降ではスリープ中でも、シグナルを受信した場合などに実行が再
  # 開(spurious wakeup)される場合がある点に注意してください。
  # 
  # //emlist[例][ruby]{
  # m = Mutex.new
  # th = Thread.new do
  #   m.lock
  #   m.sleep(2)
  # end
  # th.status # => "run"
  # sleep 1
  # th.status # => "sleep"
  # sleep 1
  # th.status # => false
  # //}
  def sleep; end

  # --- synchronize { ... } -> object
  # 
  # mutex をロックし、ブロックを実行します。実行後に必ず mutex のロックを解放します。
  # 
  # ブロックが最後に評価した値を返します。
  # 
  # @raise ThreadError self 既にカレントスレッドにロックされている場合に発
  #                    生します。
  #                    また、[[m:Signal.#trap]] に指定したハンドラ内で実行
  #                    した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # m = Mutex.new
  # result = m.synchronize do
  #   m.locked? # => true
  #   # critical part
  #   "result"
  # end
  # m.locked? # => false
  # result # => "result"
  # //}
  def synchronize; end

  # --- try_lock -> bool
  # mutex をロックしようとして、ロックが成功した場合、真を返します。
  # ロックできなかった場合にはブロックせず偽を返します。
  # 
  # //emlist[例][ruby]{
  # m = Mutex.new
  # m.try_lock # => true
  # m.try_lock # => false
  # //}
  def try_lock; end

  # --- unlock     -> self
  # mutex のロックを解放します。mutex のロック待ちになっていたスレッドの実行は再開されます。
  # 
  # @return self を返します。
  # 
  # 例:
  # 
  #  m = Mutex.new
  #  begin 
  #    m.lock
  #    # critical part
  #  ensure
  #    m.unlock
  #  end
  # 
  # Mutex はロックしたスレッド以外からロックを開放することは出来ません。
  # ロックしたスレッド以外から unlock が呼ばれると ThreadError が発生します。
  # 
  #  m = Mutex.new
  #  m.lock
  #  Thread.new do
  #    m.unlock # => ThreadError
  #  end.join
  # 
  # @raise ThreadError self がロックされていない場合や self をロックしたス
  #                    レッド以外から呼ばれた場合に発生します。
  #                    また、[[m:Signal.#trap]] に指定したハンドラ内で実行
  #                    した場合に発生します。
  def unlock; end

  # --- new -> Thread::Mutex
  # 新しい mutex を生成して返します。
  def new; end

end
