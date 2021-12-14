class Monitor
  # --- enter -> ()
  # [[m:MonitorMixin#mon_enter]] の別名です。
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
  # [[m:MonitorMixin#mon_exit]] の別名です。
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

  # --- try_enter     -> bool
  # [[m:MonitorMixin#mon_try_enter]] の別名です。
  def try_enter; end

  # --- new -> Monitor
  # 新しい Monitor オブジェクトを生成します。
  def new; end

end
