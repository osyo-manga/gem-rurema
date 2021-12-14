class MonitorMixin::ConditionVariable
  # --- broadcast -> ()
  # その条件変数で
  # 待っている全てのスレッドの実行を再開します。
  # 
  # @see [[m:MonitorMixin::ConditionVariable#signal]]
  def broadcast; end

  # --- signal -> ()
  # 
  # その条件変数で待っているスレッドがあれば実行を再開させます。
  # 
  # 複数のスレッドが待っている場合には1つのスレッドのみ
  # 実行を再開します。
  # 
  # @see [[m:MonitorMixin::ConditionVariable#broadcast]]
  def signal; end

  # --- wait(timeout = nil) -> bool
  # 
  # モニタのロックを開放し、現在のスレッドを停止します。
  # 
  # これを呼ぶスレッドはモニタのロックを保持している必要があります。
  # 
  # [[m:MonitorMixin::ConditionVariable#signal]] や
  # [[m:MonitorMixin::ConditionVariable#broadcast]]
  # で起こされるまでスレッドは停止し続けます。
  # 
  # timeout を与えた場合は最大 timeout 秒まで停止した後にスレッドを
  # 再開します。
  # 
  # 実行を再開したスレッドはモニタのロックを保持した状態になります。
  # これによって危険領域(critical section)上で動作している
  # スレッドはただ一つになり、排他を実現します。
  # 
  # true を返します。timeout が与えられていて待ち時間が timeout を
  # 越えた場合は false を返します。
  # 
  # @param timeout タイムアウトまでの秒数。指定しなかった場合はタイムアウトしません。
  # 
  # @raise ThreadError ロックを持っていないスレッドがこのメソッドを呼びだした場合に発生します
  # 
  # @see [[m:MonitorMixin::ConditionVariable#wait_while]], [[m:MonitorMixin::ConditionVariable#wait_until]]
  def wait; end

  # --- wait_until { ... } -> ()
  # モニタのロックを開放し、現在のスレッドを
  # ブロックで指定した条件を満たすまで停止します。
  # 
  # [[m:MonitorMixin::ConditionVariable#signal]] や
  # [[m:MonitorMixin::ConditionVariable#broadcast]] で
  # スレッドが起こされると、ロックを取得し、ブロックを評価し
  # その結果によってこのメソッドから抜け処理を継続するか
  # 再びロックを開放しスレッドを停止するかを決めます。
  # 
  # @see [[m:MonitorMixin::ConditionVariable#wait]]
  def wait_until; end

  # --- wait_while { ... } -> ()
  # モニタのロックを開放し、現在のスレッドを
  # ブロックで指定した条件を満たしている間停止します。
  # 
  # [[m:MonitorMixin::ConditionVariable#signal]] や
  # [[m:MonitorMixin::ConditionVariable#broadcast]] で
  # スレッドが起こされると、ロックを取得し、ブロックを評価し
  # その結果によってこのメソッドから抜け処理を継続するか
  # 再びロックを開放しスレッドを停止するかを決めます。
  # 
  # @raise ThreadError ロックを持っていないスレッドがこのメソッドを呼びだした場合に発生します
  # @see [[m:MonitorMixin::ConditionVariable#wait]]
  def wait_while; end

end
