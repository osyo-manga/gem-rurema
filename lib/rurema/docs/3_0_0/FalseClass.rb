class FalseClass
  # --- &(other)    -> false
  # 
  # 常に false を返します。
  # 
  # @param other 論理積を行なう式です。
  # 
  # & は再定義可能な演算子に分類されていますので、通常は false & other の形で使われます。
  # 
  # //emlist[例][ruby]{
  # p false & true     #=> false
  # p false & false    #=> false
  # p false & nil      #=> false
  # p false & (1 == 1) #=> false
  # p false & (1 + 1)  #=> false
  # 
  # p false.&(true)    #=> false
  # p false.&(false)   #=> false
  # p false.&(nil)     #=> false
  # p false.&(1 == 1)  #=> false
  # p false.&(1 + 1)   #=> false
  # //}
  def &; end

  # --- ^(other)    -> bool
  # 
  # other が真なら true を, 偽なら false を返します。
  # 
  # @param other 排他的論理和を行なう式です。
  # 
  # ^ は再定義可能な演算子に分類されていますので、通常は false ^ other の形で使われます。
  # 
  # //emlist[例][ruby]{
  # p false ^ true     #=> true
  # p false ^ false    #=> false
  # p false ^ nil      #=> false
  # p false ^ (1 == 1) #=> true
  # p false ^ (1 + 1)  #=> true
  # 
  # p false.^(true)    #=> true
  # p false.^(false)   #=> false
  # p false.^(nil)     #=> false
  # p false.^(1 == 1)  #=> true
  # p false.^(1 + 1)   #=> true
  # //}
  def ^; end

  # --- to_s    -> String
  # --- inspect -> String
  # 
  # 常に文字列 "false" を返します。
  # 
  # //emlist[例][ruby]{
  # false.to_s      # => "false"
  # //}
  def inspect; end

  # --- |(other)    -> bool
  # 
  # other が真なら true を, 偽なら false を返します。
  # 
  # @param other 論理和を行なう式です。
  # 
  # | は再定義可能な演算子に分類されていますので、通常は false | other の形で使われます。
  # 
  # //emlist[例][ruby]{
  # p false | true     #=> true
  # p false | false    #=> false
  # p false | nil      #=> false
  # p false | (1 == 1) #=> true
  # p false | (1 + 1)  #=> true
  # 
  # p false.|(true)    #=> true
  # p false.|(false)   #=> false
  # p false.|(nil)     #=> false
  # p false.|(1 == 1)  #=> true
  # p false.|(1 + 1)   #=> true
  # //}
  def |; end

end
