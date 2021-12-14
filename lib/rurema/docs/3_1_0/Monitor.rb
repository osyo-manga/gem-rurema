class Monitor
  # --- enter -> ()
  # --- mon_enter -> ()
  # モニターをロックします。
  # 
  # 一度に一つのスレッドだけがモニターをロックできます。
  # 既にモニターがロックされている場合は、ロックが開放されるまで
  # そのスレッドは待ちます。
  # 
  # [[m:Thread::Mutex#lock]] に相当します。
  # Thread::Mutex#lock と違うのは現在のモニターの所有者が現在実行されているスレッドである場合、
  # 何度でもロックできる点です。ロックした回数だけ [[m:Monitor#exit]] を呼ばなければモニターは
  # 解放されません。
  # 
  # //emlist[例][ruby]{
  # require 'monitor'
  # mon = Monitor.new
  # mon.enter
  # mon.enter
  # //}
  # 
  # Thread::Mutex#lock ではデッドロックが起きます。
  # 
  # //emlist[Mutex でデッドロックする例][ruby]{
  # m = Mutex.new
  # m.lock
  # m.lock # => deadlock; recursive locking (ThreadError)
  # //}
  def enter; end

  # --- exit -> ()
  # --- mon_exit -> ()
  # モニターのロックを解放します。
  # 
  # enter でロックした回数だけ exit を呼ばなければモニターは解放されません。
  # 
  # モニターが解放されればモニターのロック待ちになっていた
  # スレッドが一つ実行を再開します。
  # 
  # @raise ThreadError ロックを持っていないスレッドが呼びだした場合に発生します
  # 
  # //emlist[例][ruby]{
  # require 'monitor'
  # mon = Monitor.new
  # mon.enter
  # mon.enter
  # mon.exit
  # mon.exit
  # mon.exit # => current thread not owner (ThreadError)
  # //}
  def exit; end

  # --- mon_check_owner -> nil
  # [[c:MonitorMixin]] 用の内部メソッドです。
  # 
  # @raise ThreadError ロックを持っていないスレッドが呼びだした場合に発生します
  def mon_check_owner; end

  # --- mon_locked? -> bool
  # モニターがロックされているときに true を返します。
  def mon_locked?; end

  # --- mon_owned? -> bool
  # カレントスレッドがモニターをロックしているときに true を返します。
  def mon_owned?; end

  # --- synchronize     { ... } -> object
  # --- mon_synchronize { ... } -> object
  # 
  # モニターをロックし、ブロックを実行します。実行後に必ずモニターのロックを解放します。
  # 
  # ブロックの評価値を返り値として返します。
  # 
  # @see [[m:Monitor#enter]]
  def mon_synchronize; end

  # --- try_enter     -> bool
  # --- try_mon_enter -> bool
  # --- mon_try_enter -> bool
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

  # --- wait_for_cond(cond, timeout) -> bool
  # [[c:MonitorMixin::ConditionVariable]] 用の内部メソッドです。
  # 
  # @param cond [[c:Thread::ConditionVariable]] を指定します。
  # @param timeout タイムアウトまでの秒数。指定しなかった場合はタイムアウトしません。
  # 
  # @return タイムアウトしたときは false を返します。それ以外は true を返します。
  # 
  # //emlist[例][ruby]{
  # require 'monitor'
  # m = Monitor.new
  # cv = Thread::ConditionVariable.new
  # m.enter
  # m.wait_for_cond(cv, 1)
  # //}
  def wait_for_cond; end

  # --- new -> Monitor
  # 新しい Monitor オブジェクトを生成します。
  def new; end

end
