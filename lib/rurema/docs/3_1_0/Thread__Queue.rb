class Thread::Queue
  # --- push(value) -> ()
  # --- <<(value)   -> ()
  # --- enq(value)  -> ()
  # 
  # キューの値を追加します。待っているスレッドがいれば実行を再開
  # させます。返り値は不定です。
  def <<; end

  # --- clear -> ()
  # 
  # キューを空にします。返り値は不定です。
  # 
  # //emlist[例][ruby]{
  # q = Queue.new
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r| q.push(r) }
  # 
  # q.length # => 4
  # q.clear
  # q.length # => 0
  # //}
  def clear; end

  # --- close -> self
  # 
  # キューを close します。close 済みのキューを再度 open することはできません。
  # 
  # close 後は以下のように動作します。
  # 
  #  * [[m:Thread::Queue#closed?]] は true を返します
  #  * [[m:Thread::Queue#close]] は無視されます
  #  * [[m:Thread::Queue#enq]]/push/<< は [[c:ClosedQueueError]] を発生します
  #  * [[m:Thread::Queue#empty?]] が false を返す場合は [[m:Thread::Queue#deq]]/pop/shift は通常通りオブジェクトを返します
  # 
  # また、[[c:ClosedQueueError]] は [[c:StopIteration]] を継承しているため、
  # close する事でループから脱出する事もできます。
  # 
  # 例:
  # 
  #   q = Queue.new
  #   Thread.new{
  #     while e = q.deq # wait for nil to break loop
  #       # ...
  #     end
  #   }
  #   q.close
  def close; end

  # --- closed? -> bool
  # 
  # キューが close されている時に true を返します。
  # 
  # //emlist[例][ruby]{
  # q = Queue.new
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r| q.push(r) }
  # 
  # q.closed? # => false
  # q.close
  # q.closed? # => true
  # //}
  def closed?; end

  # --- pop(non_block = false) -> object
  # --- shift(non_block = false) -> object
  # --- deq(non_block = false) -> object
  # 
  # キューからひとつ値を取り出します。キューが空の時、呼出元のスレッドは停止します。
  # 
  # @param non_block true を与えると、キューが空の時に例外 [[c:ThreadError]] が発生します。
  # 
  # //emlist[例][ruby]{
  # require 'thread'
  # 
  # q = Queue.new
  # 
  # th1 = Thread.start do
  #   while resource = q.pop
  #     puts resource
  #   end
  # end
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r|
  #   q.push(r)
  # }
  # 
  # th1.join
  # //}
  # 
  # //emlist[例: nonblock = true][ruby]{
  # require 'thread'
  # 
  # q = Queue.new
  # 
  # th1 = Thread.start do
  #   while resource = q.pop
  #     puts resource
  #   end
  # end
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r|
  #   q.push(r)
  # }
  # 
  # begin
  #   th1.join
  #   q.pop(true)
  # rescue => e
  #   p e
  # end
  # 
  # # => resource1
  # # resource2
  # # resource3
  # # => #<ThreadError: queue empty>
  # # => "queue empty"
  # //}
  def deq; end

  # --- empty? -> bool
  # 
  # キューが空の時、真を返します。
  # 
  # //emlist[例][ruby]{
  # q = Queue.new
  # q.empty? # => true
  # q.push(:resource)
  # q.empty? # => false
  # //}
  def empty?; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # キューの長さを返します。
  # 
  # //emlist[例][ruby]{
  # q = Queue.new
  # 
  # [:resource1, :resource2, :resource3, nil].each { |r| q.push(r) }
  # 
  # q.length # => 4
  # //}
  def length; end

  # --- num_waiting -> Integer
  # 
  # キューを待っているスレッドの数を返します。
  # 
  # //emlist[例][ruby]{
  # require 'thread'
  # 
  # q = SizedQueue.new(1)
  # q.push(1)
  # t = Thread.new { q.push(2) }
  # sleep 0.05 until t.stop?
  # q.num_waiting # => 1
  # 
  # q.pop
  # t.join
  # //}
  def num_waiting; end

  # --- new -> Thread::Queue
  # --- new(items) -> Thread::Queue
  # 
  # 新しいキューオブジェクトを生成します。
  # 
  # @param items 初期値を Enumerable で指定します。
  # 
  # //emlist[][ruby]{
  # q = Queue.new
  # q = Queue.new([a, b, c])
  # q = Queue.new(items)
  # //}
  def new; end

end
