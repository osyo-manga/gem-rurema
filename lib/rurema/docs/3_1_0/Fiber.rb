class Fiber
  # --- alive? -> bool
  # 
  # ファイバーが「生きている」時、真を返します。
  # 
  # このメソッドが真を返すのは以下の場合です。
  # 
  #  * まだ [[m:Fiber#resume]] されていない
  #  * ブロック内の評価が終了していない ([[m:Fiber.yield]] が呼ばれていない)
  # 
  # 例:
  # 
  #   fr = Fiber.new{
  #     Fiber.yield
  #     "a"
  #   }
  #   
  #   p fr.alive? # => true
  #   fr.resume   # Fiber.yieldで戻ってくる
  #   p fr.alive? # => true
  #   fr.resume   # ブロック内の評価を終えて戻ってくる
  #   p fr.alive? # => false
  def alive?; end

  # --- raise                                            -> object
  # --- raise(message)                                   -> object
  # --- raise(exception, message = nil, backtrace = nil) -> object
  # 
  # selfが表すファイバーが最後に [[m:Fiber.yield]] を呼んだ場所で例外を発生させます。
  # 
  # Fiber.yield が呼ばれていないかファイバーがすでに終了している場合、
  # [[c:FiberError]] が発生します。
  # 
  # 引数を渡さない場合、[[c:RuntimeError]] が発生します。
  # message 引数を渡した場合、message 引数をメッセージとした RuntimeError
  # が発生します。
  # 
  # その他のケースでは、最初の引数は [[c:Exception]] か Exception
  # のインスタンスを返す exception メソッドを持ったオブジェクトである
  # 必要があります。
  # この場合、2つ目の引数に例外のメッセージを渡せます。また3つ目の引数に
  # 例外発生時のスタックトレースを指定できます。
  # 
  # @param message 例外のメッセージとなる文字列です。
  # @param exception 発生させる例外です。
  # @param backtrace 例外発生時のスタックトレースです。文字列の配列で指定します。
  # 
  # //emlist[例][ruby]{
  # f = Fiber.new { Fiber.yield }
  # f.resume
  # f.raise "Error!" # => Error! (RuntimeError)
  # //}
  # 
  # //emlist[ファイバー内のイテレーションを終了させる例][ruby]{
  # f = Fiber.new do
  #   loop do
  #     Fiber.yield(:loop)
  #   end
  #   :exit
  # end
  # 
  # p f.resume              # => :loop
  # p f.raise StopIteration # => :exit
  # //}
  def raise; end

  # --- resume(*arg = nil)   -> object
  # 
  # 自身が表すファイバーへコンテキストを切り替えます。
  # 自身は resume を呼んだファイバーの子となります。
  # 
  # ただし、[[m:Fiber#transfer]] を呼び出した後に resume を呼び出す事はでき
  # ません。
  # 
  # @param arg self が表すファイバーに渡したいオブジェクトを指定します。
  # 
  # @return コンテキストの切り替えの際に [[m:Fiber.yield]] に与えられた引数
  #         を返します。ブロックの終了まで実行した場合はブロックの評価結果
  #         を返します。
  # 
  # @raise FiberError 自身が既に終了している場合、コンテキストの切替が
  #                   Thread クラスが表すスレッド間をまたがる場合、自身が resume を
  #                   呼んだファイバーの親かその祖先である場合に発生します。
  #                   また、[[m:Fiber#transfer]] を呼び出した後に resume を
  #                   呼び出した場合に発生します。
  # 
  # 例:
  # 
  #  f = Fiber.new do
  #    Fiber.yield(:hoge)
  #    :fuga
  #  end
  #   
  #  p f.resume() #=> :hoge
  #  p f.resume() #=> :fuga
  #  p f.resume() #=> FiberError: dead fiber called
  def resume; end

  # --- transfer(*args) -> object
  # 
  # 自身が表すファイバーへコンテキストを切り替えます。
  # 
  # 自身は [[m:Fiber#resume]] を呼んだファイバーの子となります。
  # [[m:Fiber#resume]] との違いは、ファイバーが終了したときや [[m:Fiber.yield]] が呼ばれたときは、
  # ファイバーの親へ戻らずにメインファイバーへ戻ります。
  # 
  # @param args メインファイバーから呼び出した [[m:Fiber#resume]] メソッドの返り値として渡したいオブジェクトを指定します。
  # 
  # @return コンテキスト切り替えの際に、[[m:Fiber#resume]] メソッドに与えられた引数を返します。
  # 
  # @raise FiberError 自身が既に終了している場合、コンテキストの切り替えが [[c:Thread]] クラスが表すスレッド間をまたがる場合、
  #                   [[m:Fiber#resume]] を呼んだファイバーがその親か先祖である場合に発生します。
  # 
  # 例:
  # 
  #   require 'fiber'
  #   
  #   fr1 = Fiber.new do |v|
  #     :fugafuga
  #   end
  #   
  #   fr2 = Fiber.new do |v|
  #     fr1.transfer
  #     :fuga
  #   end
  #   
  #   fr3 = Fiber.new do |v|
  #     fr2.resume
  #     :hoge
  #   end
  #   
  #   p fr3.resume # => :fugafuga
  def transfer; end

  # --- current -> Fiber
  # 
  # このメソッドが評価されたコンテキストにおける [[c:Fiber]] のインスタンスを返します。
  # 
  # 例:
  # 
  #    fr = Fiber.new do
  #      Fiber.current
  #    end
  #    
  #    fb = fr.resume
  #    p fb.equal?(fr) # => true
  #    
  #    p Fiber.current # => #<Fiber:0x91345e4>
  #    p Fiber.current # => #<Fiber:0x91345e4>
  #   
  def current; end

  # --- new{|obj| ... } -> Fiber
  # 
  # 与えられたブロックとともにファイバーを生成して返します。
  # ブロックは [[m:Fiber#resume]] に与えられた引数をその引数として実行されます。
  # 
  # ブロックが終了した場合は親にコンテキストが切り替わります。
  # その時ブロックの評価値が返されます。
  # 
  #  a = nil
  #  f = Fiber.new do |obj|
  #    a = obj
  #    :hoge
  #  end
  #   
  #  b = f.resume(:foo)
  #  p a  #=> :foo
  #  p b  #=> :hoge
  def new; end

  # --- yield(*arg = nil)   -> object
  # 
  # 現在のファイバーの親にコンテキストを切り替えます。
  # 
  # コンテキストの切り替えの際に [[m:Fiber#resume]] に与えられた引数を yield メソッドは返します。
  # 
  # @param arg 現在のファイバーの親に渡したいオブジェクトを指定します。
  # 
  # @raise FiberError Fiber でのルートファイバーで呼ばれた場合に発生します。
  # 
  # 
  # 例:
  # 
  #  a = nil
  #  f = Fiber.new do
  #    a = Fiber.yield()
  #  end
  #   
  #  f.resume()
  #  f.resume(:foo)
  # 
  #  p a  #=> :foo
  def yield; end

end
