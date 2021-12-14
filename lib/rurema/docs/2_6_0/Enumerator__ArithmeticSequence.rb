class Enumerator::ArithmeticSequence
  # --- ==(other) -> bool
  # 
  # Enumerable::ArithmeticSequence として等しいか判定します。
  # 
  # other が Enumerable::ArithmeticSequence で
  # begin, end, step, exclude_end? が等しい時に
  # true を返します。
  # 
  # @param other 自身と比較する Enumerable::ArithmeticSequence
  def ==; end

  # --- begin -> Numeric
  # 
  # 初項 (始端) を返します。
  # 
  # @see [[m:Enumerator::ArithmeticSequence#end]]
  def begin; end

  # --- each {|n| ... }   -> self
  # --- each              -> self
  # 
  # 各要素に対してブロックを評価します。
  # 
  # @return self を返します。
  def each; end

  # --- end -> Numeric | nil
  # 
  # 末項（終端）を返します。
  # 
  # @see [[m:Enumerator::ArithmeticSequence#begin]]
  def end; end

  # --- exclude_end? -> bool
  # 
  # 末項（終端）を含まないとき真を返します。
  def exclude_end?; end

  # --- first      -> Numeric | nil
  # --- first(n)   -> [Numeric]
  # 
  # 等差数列の最初の要素、もしくは最初の n 要素を返します。
  # 
  # @param n 取得する要素数。
  def first; end

  # --- hash -> Integer
  # 
  # 自身のハッシュ値を返します。
  # 
  # begin, end, step, exclude_end? が等しい Enumerable::ArithmeticSequence は
  # 同じハッシュ値を返します。
  def hash; end

  # --- inspect -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  def inspect; end

  # --- last      -> Numeric | nil
  # --- last(n)   -> [Numeric]
  # 
  # 等差数列の最後の要素、もしくは最後の n 要素を返します。
  # 
  # @param n 取得する要素数。
  def last; end

  # --- size -> Integer | nil
  # 
  # 有限なら要素数を返します。
  # そうでなければ nil を返します。
  # 
  # @return 要素数または nil を返します。
  def size; end

  # --- step -> Numeric
  # 
  # 公差 (各ステップの大きさ) を返します。
  def step; end

end
