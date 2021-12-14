class Enumerator::Yielder
  # --- <<(object) -> ()
  # 
  # [[m:Enumerator.new]] で使うメソッドです。
  # 
  # 生成された Enumerator オブジェクトの each メソッドを呼ぶと
  # Enumerator::Yielder オブジェクトが渡されたブロックが実行され、
  # ブロック内の << が呼ばれるたびに each に渡されたブロックが
  # << に渡された値とともに繰り返されます。
  # 
  # //emlist[例][ruby]{
  # enum = Enumerator.new do |y|
  #   y << 1
  #   y << 2
  #   y << 3
  # end
  # 
  # enum.each do |v|
  #   p v
  # end
  # # => 1
  # #    2
  # #    3
  # //}
  def <<; end

  # --- to_proc -> Proc
  # 
  # [[m:Enumerator.new]] で使うメソッドです。
  # 
  # 引数を [[m:Enumerator::Yielder#yield]] に渡す [[c:Proc]] を返します。
  # これは Enumerator::Yielder オブジェクトを他のメソッドにブロック引数と
  # して直接渡すために使えます。
  # 
  # //emlist[例][ruby]{
  # text = <<-END
  # Hello
  # こんにちは
  # END
  # 
  # enum = Enumerator.new do |y|
  #   text.each_line(&y)
  # end
  # 
  # enum.each do |line|
  #   p line
  # end
  # # => "Hello\n"
  # #    "こんにちは\n"
  # //}
  def to_proc; end

  # --- yield(*object) -> ()
  # 
  # [[m:Enumerator.new]] で使うメソッドです。
  # 
  # 生成された Enumerator オブジェクトの each メソッドを呼ぶと
  # Enumerator::Yielder オブジェクトが渡されたブロックが実行され、
  # ブロック内の yield メソッドが呼ばれるたびに each に渡された
  # ブロックが yield メソッドに渡された値とともに繰り返されます。
  # 
  # //emlist[例][ruby]{
  # enum = Enumerator.new do |y|
  #   y.yield 1, 2, 3
  # end
  # 
  # enum.each do |x, y, z|
  #   p [x, y, z]
  # end
  # # => [1, 2, 3]
  # //}
  def yield; end

end
