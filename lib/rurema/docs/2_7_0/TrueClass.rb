class TrueClass
  # --- &(other)    -> bool
  # 
  # other が真なら true を, 偽なら false を返します。
  # 
  # @param other 論理積を行なう式です。
  # 
  # & は再定義可能な演算子に分類されていますので、通常は true & other のように使われます。
  # 
  # //emlist[例][ruby]{
  # p true & true     #=> true
  # p true & false    #=> false
  # p true & nil      #=> false
  # p true & (1 == 1) #=> true
  # p true & (1 + 1)  #=> true
  # 
  # p true.&(true)    #=> true
  # p true.&(false)   #=> false
  # p true.&(nil)     #=> false
  # p true.&(1 == 1)  #=> true
  # p true.&(1 + 1)   #=> true
  # //}
  def &; end

  # --- ^(other)    -> bool
  # 
  # other が真なら false を, 偽なら true を返します。
  # 
  # @param other 排他的論理和を行なう式です。
  # 
  # ^ は再定義可能な演算子に分類されていますので、通常は true ^ other のように使われます。
  # 
  # //emlist[例][ruby]{
  # p true ^ true     #=> false
  # p true ^ false    #=> true
  # p true ^ nil      #=> true
  # p true ^ (1 == 1) #=> false
  # p true ^ (1 + 1)  #=> false
  # 
  # p true.^(true)    #=> false
  # p true.^(false)   #=> true
  # p true.^(nil)     #=> true
  # p true.^(1 == 1)  #=> false
  # p true.^(1 + 1)   #=> false
  # //}
  def ^; end

  # --- inspect -> String
  # 
  # 常に文字列 "true" を返します。
  # 
  # //emlist[例][ruby]{
  # true.inspect   # => "true"
  # //}
  def inspect; end

  # --- to_s    -> String
  # 
  # 常に文字列 "true" を返します。
  # 
  # //emlist[例][ruby]{
  # true.to_s      # => "true"
  # //}
  def to_s; end

  # --- |(other)    -> bool
  # 
  # 常に true を返します。
  # 
  # @param other 論理和を行なう式です。
  # 
  # | は再定義可能な演算子に分類されていますので、通常は true | other のように使われます。
  # 
  # //emlist[例][ruby]{
  # p true | true     #=> true
  # p true | false    #=> true
  # p true | nil      #=> true
  # p true | (1 == 1) #=> true
  # p true | (1 + 1)  #=> true
  # 
  # p true.|(true)    #=> true
  # p true.|(false)   #=> true
  # p true.|(nil)     #=> true
  # p true.|(1 == 1)  #=> true
  # p true.|(1 + 1)   #=> true
  # //}
  def |; end

end
