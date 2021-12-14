class Prime
  # --- each(upper_bound = nil, generator = EratosthenesGenerator.new){|prime| ... } -> object
  # --- each(upper_bound = nil, generator = EratosthenesGenerator.new)               -> Enumerator
  # 
  # 全ての素数を順番に与えられたブロックに渡して評価します。
  # 
  # @param upper_bound 任意の正の整数を指定します。列挙の上界です。
  #                    nil が与えられた場合は無限に列挙し続けます。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return ブロックの最後に評価された値を返します。
  #         ブロックが与えられなかった場合は、[[c:Enumerator]] と互換性のある外部イテレータを返します。
  # 
  # //emlist[例][ruby]{
  # require 'prime'
  # Prime.each(6){|prime| prime }  # => 5
  # Prime.each(7){|prime| prime }  # => 7
  # Prime.each(10){|prime| prime } # => 7
  # Prime.each(11){|prime| prime } # => 11
  # //}
  # 
  # //emlist[例: 30以下の双子素数][ruby]{
  # require 'prime'
  # Prime.each(30).each_cons(2).select{|p,r| r-p == 2}
  # #=> [[3, 5], [5, 7], [11, 13], [17, 19]]
  # //}
  # 
  # === 注
  # このメソッドに、真の素数列でない擬似素数を与えるべきではありません。
  # 
  # このメソッドは、素数列の外部イテレータを内部イテレータに変換してRubyらしいプログラミングを提供することが責務です。独自に素数性の保障するのはメソッドの責務ではありません。従って、次のように精度の低い素数生成器を与えると、真に素数とは限らない数列が発生します。
  # //emlist[例][ruby]{
  # require 'prime'
  # Prime.each(50, Prime::Generator23.new) do |n|
  #   p n #=> [2, 3, 5, 7, 11, 13, 17, 19, 23, 25, 29, 31, 35, 37, 41, 43, 47, 49]
  # end
  # //}
  # 
  # @see [[m:Prime.each]], [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]
  def each; end

  # --- int_from_prime_division(pd) -> Integer
  # 
  # 素因数分解された結果を元の数値に戻します。
  # 
  # 引数が [[p_1, e_1], [p_2, e_2], ...., [p_n, e_n]] のようであるとき、
  # 結果は  p_1**e_1 * p_2**e_2 * .... * p_n**e_n となります。
  # 
  # @param pd 整数のペアの配列を指定します。含まれているペアの第一要素は素因数を、
  #           第二要素はその素因数の指数をあらわします。
  # 
  # //emlist[例][ruby]{
  # require 'prime'
  # Prime.int_from_prime_division([[2,2], [3,1]])  #=> 12
  # Prime.int_from_prime_division([[2,2], [3,2]])  #=> 36
  # //}
  # 
  # @see [[m:Prime.int_from_prime_division]]
  def int_from_prime_division; end

  # --- prime?(value, generator = Prime::Generator23.new) -> bool
  # 
  # 与えられた整数が素数である場合は、真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param value 素数かどうかチェックする任意の整数を指定します。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return 素数かどうかを返します。
  #         引数 value に負の数を指定した場合は常に false を返します。
  # 
  # @see [[m:Prime.prime?]], [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]
  def prime?; end

  # --- prime_division(value, generator= Prime::Generator23.new) -> [[Integer, Integer]]
  # 
  # 与えられた整数を素因数分解します。
  # 
  # @param value 素因数分解する任意の整数を指定します。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return 素因数とその指数から成るペアを要素とする配列です。つまり、戻り値の各要素は2要素の配列 [n,e] であり、それぞれの内部配列の第1要素 n は value の素因数、第2要素は n**e が value を割り切る最大の自然数 e です。
  # 
  # @raise ZeroDivisionError 与えられた数値がゼロである場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require 'prime'
  # Prime.prime_division(12) #=> [[2,2], [3,1]]
  # Prime.prime_division(10) #=> [[2,1], [5,1]]
  # //}
  # 
  # @see [[m:Prime.prime_division]], [[c:Prime::EratosthenesGenerator]], [[c:Prime::TrialDivisionGenerator]], [[c:Prime::Generator23]]
  def prime_division; end

  # --- each(upper_bound = nil, generator = EratosthenesGenerator.new){|prime| ... } -> object
  # --- each(upper_bound = nil, generator = EratosthenesGenerator.new)               -> Enumerator
  # 
  # Prime.instance.each と同じです。
  # 
  # @param upper_bound 任意の正の整数を指定します。列挙の上界です。
  #                    nil が与えられた場合は無限に列挙し続けます。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return ブロックの最後に評価された値を返します。
  #         ブロックが与えられなかった場合は、[[c:Enumerator]] と互換性のある外部イテレータを返します。
  # 
  # 
  # @see [[m:Prime#each]]
  def each; end

  # --- instance -> Prime
  # 
  # [[c:Prime]] のデフォルトのインスタンスを返します。
  def instance; end

  # --- int_from_prime_division(pd) -> Integer
  # 
  # Prime.instance.int_from_prime_division と同じです。
  # 
  # @param pd 整数のペアの配列を指定します。含まれているペアの第一要素は素因数を、
  #           第二要素はその素因数の指数をあらわします。
  # 
  # 
  # @see [[m:Prime#int_from_prime_division]]
  def int_from_prime_division; end

  # --- prime?(value, generator = Prime::Generator23.new) -> bool
  # 
  # Prime.instance.prime? と同じです。
  # 
  # @param value 素数かどうかチェックする任意の整数を指定します。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return 素数かどうかを返します。
  #         引数 value に負の数を指定した場合は常に false を返します。
  # 
  # 
  # @see [[m:Prime#prime?]]
  def prime?; end

  # --- prime_division(value, generator= Prime::Generator23.new) -> [[Integer, Integer]]
  # 
  # Prime.instance.prime_division と同じです。
  # 
  # @param value 素因数分解する任意の整数を指定します。
  # 
  # @param generator 素数生成器のインスタンスを指定します。
  # 
  # @return 素因数とその指数から成るペアを要素とする配列です。つまり、戻り値の各要素は2要素の配列 [n,e] であり、それぞれの内部配列の第1要素 n は value の素因数、第2要素は n**e が value を割り切る最大の自然数 e です。
  # 
  # @raise ZeroDivisionError 与えられた数値がゼロである場合に発生します。
  # 
  # @see [[m:Prime#prime_division]]
  def prime_division; end

end
