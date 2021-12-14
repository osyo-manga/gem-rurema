class Binding
  # --- eval(expr, fname = __FILE__, lineno = 1)    -> object
  # 
  # 自身をコンテキストとし文字列 expr を
  # Ruby プログラムとして評価しその結果を返します。
  # 組み込み関数 [[m:Kernel.#eval]] を使って
  # eval(expr, self, fname, lineno) とするのと同じです。
  # 
  # @param expr  評価したい式を文字列で与えます。
  # 
  # @param fname ファイル名を文字列で与えます。式 expr が fname というファイル名にあるかのように実行されます。
  # 
  # @param lineno 行番号を整数で与えます。式 expr の先頭行の行番号が lineno であるかのように実行されます。
  # 
  # //emlist[例][ruby]{
  # def get_binding(str)
  #   binding
  # end
  # str = "hello"
  # p eval("str + ' Fred'")                      #=> "hello Fred"
  # p get_binding("bye").eval("str + ' Fred'")   #=> "bye Fred"
  # //}
  # 
  # @see [[m:Kernel.#eval]]
  def eval; end

  # --- irb -> object
  # REPLのセッションを開始します。
  # 
  # 2.5.0 からは require 'irb' せずに直接 binding.irb を呼び出しても使えるようになりました。
  # 
  # @see [[lib:irb]]
  def irb; end

  # --- local_variable_defined?(symbol) -> bool
  # 
  # 引数 symbol で指定した名前のローカル変数が定義されている場合に true を、
  # そうでない場合に false を返します。
  # 
  # @param symbol ローカル変数名を [[c:Symbol]] オブジェクトで指定します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   a = 1
  #   binding.local_variable_defined?(:a) # => true
  #   binding.local_variable_defined?(:b) # => false
  # end
  # //}
  # 
  # このメソッドは以下のコードの短縮形です。
  # 
  # //emlist[][ruby]{
  # binding.eval("defined?(#{symbol}) == 'local-variable'")
  # //}
  # 
  # @see [[m:Binding#local_variable_get]], [[m:Binding#local_variable_set]]
  def local_variable_defined?; end

  # --- local_variable_get(symbol) -> object
  # 
  # 引数 symbol で指定した名前のローカル変数に設定された値を返します。
  # 
  # @param symbol ローカル変数名を [[c:Symbol]] オブジェクトで指定します。
  # 
  # @raise NameError 引数 symbol で指定したローカル変数が未定義の場合に発生します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   a = 1
  #   binding.local_variable_get(:a) # => 1
  #   binding.local_variable_get(:b) # => NameError
  # end
  # //}
  # 
  # このメソッドは以下のコードの短縮形です。
  # 
  # //emlist[][ruby]{
  # binding.eval("#{symbol}")
  # //}
  # 
  # @see [[m:Binding#local_variable_set]], [[m:Binding#local_variable_defined?]]
  def local_variable_get; end

  # --- local_variable_set(symbol, obj)
  # 
  # 引数 symbol で指定した名前のローカル変数に引数 obj を設定します。
  # 
  # @param symbol ローカル変数名を [[c:Symbol]] オブジェクトで指定します。
  # 
  # @param obj 引数 symbol で指定したローカル変数に設定するオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   a = 1
  #   bind = binding
  #   bind.local_variable_set(:a, 2) # set existing local variable `a'
  #   bind.local_variable_set(:b, 3) # create new local variable `b'
  #                                  # `b' exists only in binding
  #   p bind.local_variable_get(:a)  # => 2
  #   p bind.local_variable_get(:b)  # => 3
  #   p a                            # => 2
  #   p b                            # => NameError
  # end
  # //}
  # 
  # このメソッドは以下のコード(ただし、obj が Ruby のコードで出力される場
  # 合)と同様の動作をします。
  # 
  # //emlist[][ruby]{
  # binding.eval("#{symbol} = #{obj}")
  # //}
  # 
  # @see [[m:Binding#local_variable_get]], [[m:Binding#local_variable_defined?]]
  def local_variable_set; end

  # --- local_variables -> [Symbol]
  # 
  # ローカル変数の一覧を [[c:Symbol]] の配列で返します。
  # 
  # //emlist[例][ruby]{
  # def foo
  #   a = 1
  #   2.times do |n|
  #     binding.local_variables #=> [:a, :n]
  #   end
  # end
  # //}
  # 
  # このメソッドは以下のコードと同様の動作をします。
  # 
  # //emlist[][ruby]{
  # binding.eval("local_variables")
  # //}
  def local_variables; end

  # --- receiver -> object
  # 
  # 保持するコンテキスト内での self を返します。
  # 
  # このメソッドは以下のコードと同様の動作をします。
  # 
  # //emlist[][ruby]{
  # binding.eval("self")
  # //}
  def receiver; end

  # --- source_location  -> [String, Integer]
  # 
  # self の Ruby のソースファイル名と行番号を返します。
  # 
  # [[ref:d:spec/variables#pseudo]] の __FILE__ と __LINE__ も参照してください。
  # 
  # //emlist[例][ruby]{
  # p binding.source_location # => ["test.rb", 1]
  # //}
  def source_location; end

end
