module Comparable
  # --- <(other)    -> bool
  # 
  # 比較演算子 <=> をもとにオブジェクト同士を比較します。
  # <=> が負の整数を返した場合に、true を返します。
  # それ以外の整数を返した場合に、false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # @raise ArgumentError <=> が nil を返したときに発生します。
  # 
  # //emlist[例][ruby]{
  # 1 < 1   # => false
  # 1 < 2   # => true
  # //}
  def <; end

  # --- <=(other)    -> bool
  # 
  # 比較演算子 <=> をもとにオブジェクト同士を比較します。
  # <=> が負の整数か 0 を返した場合に、true を返します。
  # それ以外の整数を返した場合に、false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # @raise ArgumentError <=> が nil を返したときに発生します。
  # 
  # //emlist[例][ruby]{
  # 1 <= 0   # => false
  # 1 <= 1   # => true
  # 1 <= 2   # => true
  # //}
  def <=; end

  # --- ==(other)    -> bool
  # 
  # 比較演算子 <=> をもとにオブジェクト同士を比較します。
  # <=> が 0 を返した時に、true を返します。
  # それ以外を返した場合は、false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # 1 == 1   # => true
  # 1 == 2   # => false
  # //}
  def ==; end

  # --- >(other)    -> bool
  # 
  # 比較演算子 <=> をもとにオブジェクト同士を比較します。
  # <=> が正の整数を返した場合に、true を返します。
  # それ以外の整数を返した場合に、false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # @raise ArgumentError <=> が nil を返したときに発生します。
  # 
  # //emlist[例][ruby]{
  # 1 > 0   # => true
  # 1 > 1   # => false
  # //}
  def >; end

  # --- >=(other)    -> bool
  # 
  # 比較演算子 <=> をもとにオブジェクト同士を比較します。
  # <=> が正の整数か 0 を返した場合に、true を返します。
  # それ以外の整数を返した場合に、false を返します。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  # @raise ArgumentError <=> が nil を返したときに発生します。
  # 
  # //emlist[例][ruby]{
  # 1 >= 0   # => true
  # 1 >= 1   # => true
  # 1 >= 2   # => false
  # //}
  def >=; end

  # --- between?(min, max)    -> bool
  # 
  # 比較演算子 <=> をもとに self が min と max の範囲内(min, max
  # を含みます)にあるかを判断します。
  # 
  # 以下のコードと同じです。
  # //emlist[][ruby]{
  # self >= min and self <= max
  # //}
  # 
  # @param min 範囲の下端を表すオブジェクトを指定します。
  # 
  # @param max 範囲の上端を表すオブジェクトを指定します。
  # 
  # @raise ArgumentError self <=> min か、self <=> max が nil を返
  #                      したときに発生します。
  # 
  # //emlist[例][ruby]{
  # 3.between?(1, 5)               # => true
  # 6.between?(1, 5)               # => false
  # 'cat'.between?('ant', 'dog')   # => true
  # 'gnu'.between?('ant', 'dog')   # => false
  # //}
  def between?; end

  # --- clamp(min, max)  -> object
  # 
  # self を範囲内に収めます。
  # 
  # self <=> min が負数を返したときは min を、
  # self <=> max が正数を返したときは max を、
  # それ以外の場合は self を返します。
  # 
  # 
  # @param min 範囲の下端を表すオブジェクトを指定します。
  # 
  # @param max 範囲の上端を表すオブジェクトを指定します。
  # 
  # 
  # //emlist[例][ruby]{
  # 12.clamp(0, 100)         #=> 12
  # 523.clamp(0, 100)        #=> 100
  # -3.123.clamp(0, 100)     #=> 0
  # 
  # 'd'.clamp('a', 'f')      #=> 'd'
  # 'z'.clamp('a', 'f')      #=> 'f'
  # //}
  def clamp; end

end
