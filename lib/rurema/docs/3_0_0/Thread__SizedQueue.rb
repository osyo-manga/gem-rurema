class Thread::SizedQueue
  # --- push(obj, non_block = false) -> ()
  # --- enq(obj, non_block = false)  -> ()
  # --- <<(obj)                      -> ()
  # 
  # キューに与えられたオブジェクトを追加します。
  # 
  # キューのサイズが [[m:Thread::SizedQueue#max]] に達している場合は、
  # non_block が真でなければ、キューのサイズが [[m:Thread::SizedQueue#max]]
  # より小さくなるまで他のスレッドに実行を譲ります。
  # その後、キューに与えられたオブジェクトを追加します。
  # 
  # @param obj キューに追加したいオブジェクトを指定します。
  # @param non_block true を与えると、キューが一杯の時に例外 [[c:ThreadError]] が発生します。
  # 
  # @see  [[m:Thread::Queue#push]]
  def <<; end

  # --- close -> self
  # 
  # キューを close します。詳しくは [[m:Thread::Queue#close]] を参照してください。
  # 
  # [[c:Thread::Queue]] とはキューにオブジェクトを追加するスレッドの動作が
  # 異なります。キューにオブジェクトを追加するスレッドを待機している場合は
  # [[c:ClosedQueueError]] が発生して中断されます。
  # 
  # //emlist[例][ruby]{
  # q = SizedQueue.new(4)
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r| q.push(r) }
  # 
  # q.closed? # => false
  # q.close
  # q.closed? # => true
  # //}
  # 
  # @see [[m:Thread::Queue#close]]
  def close; end

  # --- pop(non_block = false)   -> object
  # --- shift(non_block = false) -> object
  # --- deq(non_block = false)   -> object
  # 
  # キューからひとつ値を取り出します。
  # キューに push しようと待っているスレッドがあれば、実行を再開させます。
  # 
  # @param non_block true を与えると、キューが空の時に例外 [[c:ThreadError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # require 'thread'
  # 
  # q = SizedQueue.new(4)
  # 
  # th1 = Thread.start do
  #   while resource = q.pop
  #     puts resource
  #   end
  # end
  # 
  # [:resource1, :resource2, :resource3, nil].each{|r|
  #   q.push(r)
  # }
  # 
  # th1.join
  # # => resource1
  # # resource2
  # # resource3
  # //}
  # 
  # //emlist[例: nonblock = true][ruby]{
  # require 'thread'
  # 
  # q = SizedQueue.new(4)
  # 
  # th1 = Thread.start do
  #   while resource = q.pop
  #     puts resource
  #   end
  # end
  # 
  # [:resource1, :resource2, :resource3, nil].each{|r|
  #   q.push(r)
  # }
  # 
  # begin
  #   th1.join
  #   q.pop(true)
  # rescue => e
  #   p e
  #   p e.message
  # end
  # 
  # # => resource1
  # # resource2
  # # resource3
  # # => #<ThreadError: queue empty>
  # # => "queue empty"
  # //}
  # 
  # @see [[m:Thread::Queue#pop]]
  def deq; end

  # --- empty? -> bool
  # 
  # キューが空の時、真を返します。
  def empty?; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # キューの長さを返します。
  def length; end

  # --- max -> Integer
  # キューの最大サイズを返します。
  # 
  # //emlist[例][ruby]{
  # q = SizedQueue.new(4)
  # q.max # => 4
  # //}
  def max; end

  # --- max=(n)
  # キューの最大サイズを設定します。
  # 
  # @param n キューの最大サイズを指定します。
  # 
  # //emlist[例][ruby]{
  # q = SizedQueue.new(4)
  # q.max # => 4
  # q.max = 5
  # q.max # => 5
  # //}
  def max=; end

  # --- new(max) -> Thread::SizedQueue
  # Thread::SizedQueue オブジェクトを生成します。
  # 
  # @param max キューのサイズの最大値です。
  def new; end

end
