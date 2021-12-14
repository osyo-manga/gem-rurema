class ThreadGroup
  # --- add(thread)    -> self
  # 
  # スレッド thread が属するグループを自身に変更します。
  # 
  # @param thread 自身に加えたいスレッドを指定します。
  # 
  # @raise ThreadError 自身が freeze されているか enclose されている場合に、発生します。また引数 thread が属する ThreadGroup が freeze されているか enclose されている場合にも発生します。
  # 
  # //emlist[例][ruby]{
  # puts "Initial group is #{ThreadGroup::Default.list}"
  # # => Initial group is [#<Thread:0x4a49168 run>]
  # 
  # tg = ThreadGroup.new
  # t1 = Thread.new { sleep }
  # t2 = Thread.new { sleep }
  # puts "t1 is #{t1}" # => t1 is #<Thread:0x50bef60>
  # puts "t2 is #{t2}" # => t2 is #<Thread:0x50beed0>
  # tg.add(t1)
  # puts "Initial group now #{ThreadGroup::Default.list}"
  # # => Initial group now [#<Thread:0x3039168 run>, #<Thread:0x50beed0 run>]
  # puts "tg group now #{tg.list}"
  # # => tg group now [#<Thread:0x50bef60 run>]
  # //}
  def add; end

  # --- enclose    -> self
  # 
  # 自身への [[m:ThreadGroup#add]] によるスレッドの追加・削除を禁止します。
  # enclose された ThreadGroup に追加や削除を行うと例外 [[c:ThreadError]] が発生します。
  # 
  # ただし、[[m:Thread.new]] によるスレッドの追加は禁止されません。enclose されたスレッドグループ A に
  # 属するスレッドが新たにスレッドを生成した場合、生成されたスレッドはスレッドグループ A に属します。
  # 
  # 追加の例:
  # 
  #   thg = ThreadGroup.new.enclose
  #   thg.add Thread.new {}
  # 
  #   => -:2:in `add': can't move to the enclosed thread group (ThreadError)
  # 
  # 削除の例:
  # 
  #   thg1 = ThreadGroup.new
  #   thg2 = ThreadGroup.new
  # 
  #   th = Thread.new {sleep 1}
  # 
  #   thg1.add th
  #   thg1.enclose
  #   thg2.add th
  # 
  #   => -:8:in `add': can't move from the enclosed thread group (ThreadError)
  def enclose; end

  # --- enclosed?    -> bool
  # 
  # 自身が enclose されているなら true を返します。そうでないなら false を返します。デフォルトは false です。
  # 
  # freeze された ThreadGroup には Thread の追加/削除ができませんが、enclosed? は false を返します。
  # 
  #     thg = ThreadGroup.new
  #     p thg.enclosed?         # => false
  #     thg.enclose
  #     p thg.enclosed?         # => true
  # 
  #     thg = ThreadGroup.new
  #     p thg.enclosed?         # => false
  #     thg.freeze
  #     p thg.enclosed?         # => false
  # 
  # @see [[m:ThreadGroup#enclose]]
  def enclosed?; end

  # --- list    -> [Thread] 
  # 
  # self に属するスレッドの配列を返します。
  # version 1.8 では、aborting 状態であるスレッド
  # も要素に含まれます。つまり「生きている」スレッドの配列を返します。
  # 
  # //emlist[例][ruby]{
  # ThreadGroup::Default.list   # => [#<Thread:0x00007f8f13867078 run>]
  # //}
  def list; end

  # --- new    -> ThreadGroup
  # 
  # 新たな ThreadGroup を生成して返します。
  # 
  # //emlist[例][ruby]{
  # thread_group = ThreadGroup.new
  # thread_group.add Thread.new { sleep 0.1; Thread.new { sleep 1 }; sleep 1 }
  # thread_group.add Thread.new { sleep 2 }
  # sleep 0.5
  # thread_group.list # => [#<Thread:0x007fc6f1842d70 sleep>, #<Thread:0x007fc6f1842c80 sleep>, #<Thread:0x007fc6f080dba8 sleep>]
  # //}
  def new; end

  # --- Default -> ThreadGroup
  # 
  # デフォルトで定義されている [[c:ThreadGroup]] です。メインスレッド
  # は最初このグループに属します。
  def Default; end

end
