module MonitorMixin
  # --- mon_enter -> ()
  # 
  # モニターをロックします。
  # 
  # 一度に一つのスレッドだけがモニターをロックできます。
  # 既にモニターがロックされている場合は、ロックが開放されるまで
  # そのスレッドは待ちます。
  # 
  # [[m:Thread::Mutex#lock]] に相当します。
  # Mutex#lock と違うのは現在のモニターの所有者が現在実行されているスレッドである場合、
  # 何度でもロックできる点です。ロックした回数だけ mon_exit を呼ばなければモニターは
  # 解放されません。
  # 
  # //emlist[例][ruby]{
  # require 'monitor'
  # buf = []
  # buf.extend(MonitorMixin)
  # buf.mon_enter
  # buf.mon_enter
  # //}
  # 
  # Mutex#lock ではデッドロックが起きます。
  # 
  # //emlist[Mutex でデッドロックする例][ruby]{
  # m = Mutex.new
  # m.lock
  # m.lock # => deadlock; recursive locking (ThreadError)
  # //}
  def mon_enter; end

  # --- mon_exit -> ()
  # 
  # モニターのロックを解放します。
  # 
  # mon_enter でロックした回数だけ mon_exit を
  # 呼ばなければモニターは解放されません。
  # 
  # モニターが解放されればモニターのロック待ちになっていた
  # スレッドが一つ実行を再開します。
  # 
  # @raise ThreadError ロックを持っていないスレッドが呼びだした場合に発生します
  def mon_exit; end

  # --- mon_locked? -> bool
  # モニターがロックされているときに true を返します。
  def mon_locked?; end

  # --- mon_owned? -> bool
  # カレントスレッドがモニターをロックしているときに true を返します。
  def mon_owned?; end

  # --- mon_synchronize { ... } -> object
  # --- synchronize     { ... } -> object
  # 
  # モニターをロックし、ブロックを実行します。実行後に必ずモニターのロックを解放します。
  # 
  # ブロックの評価値を返り値として返します。
  # 
  # @see [[m:MonitorMixin#mon_enter]]
  def mon_synchronize; end

  # --- mon_try_enter -> bool
  # --- try_mon_enter -> bool
  # 
  # モニターのロックを取得しようと試みます。
  # ロックに成功した(ロックが開放状態だった、もしくは
  # ロックを取得していたスレッドが自分自身であった)場合には
  # 真を返します。
  # 
  # ロックができなかった場合は偽を返し、実行を継続します。この場合には
  # スレッドはブロックしません。
  def mon_try_enter; end

  # --- new_cond -> MonitorMixin::ConditionVariable
  # モニターに関連付けられた、新しい [[c:MonitorMixin::ConditionVariable]] を生成して返します。
  def new_cond; end

end
