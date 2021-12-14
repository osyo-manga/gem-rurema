class NilClass
  # --- &(other) -> false
  # 
  # 常に false を返します。
  # 
  # @param other 論理積を行なう式です
  # 
  # //emlist[例][ruby]{
  # nil & true  # => false
  # nil & false # => false
  # nil & nil   # => false
  # nil & "a"   # => false
  # //}
  def &; end

  # --- =~(other) -> nil
  # 
  # 右辺に正規表現オブジェクトを置いた正規表現マッチ obj =~ /RE/
  # をサポートするためのメソッドです。常に nil を返します。
  # 
  # 
  # @param other 任意のオブジェクトです。結果に影響しません。
  # 
  # //emlist[例][ruby]{
  # obj = 'regexp'
  # p(obj =~ /re/) #=> 0
  # 
  # obj = nil
  # p(obj =~ /re/) #=> nil
  # //}
  # 
  # @see [[m:String#=~]]
  def =~; end

  # --- ^(other) -> bool
  # 
  # other が真なら true を, 偽なら false を返します。
  # 
  # @param other 排他的論理和を行なう式です
  # 
  # //emlist[例][ruby]{
  # nil ^ true  # => true
  # nil ^ false # => false
  # nil ^ nil   # => false
  # nil ^ "a"   # => true
  # //}
  def ^; end

  # --- nil? -> bool
  # 
  # 常に true を返します。
  # 
  # //emlist[例][ruby]{
  # nil.nil?   # => true
  # //}
  def nil?; end

  # --- rationalize      -> Rational
  # --- rationalize(eps) -> Rational
  # 
  # 0/1 を返します。
  # 
  # @param eps 許容する誤差
  # 
  # 引数 eps は常に無視されます。
  # 
  # //emlist[例][ruby]{
  # nil.rationalize      # => (0/1)
  # nil.rationalize(100) # => (0/1)
  # nil.rationalize(0.1) # => (0/1)
  # //}
  def rationalize; end

  # --- to_a -> Array
  # 
  # 空配列 [] を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_a   #=> []
  # //}
  def to_a; end

  # --- to_c -> Complex
  # 
  # 0+0i を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_c # => (0+0i)
  # //}
  def to_c; end

  # --- to_d -> BigDecimal
  # 
  # [[c:BigDecimal]] オブジェクトの 0.0 を返します。
  # 
  # Ruby 2.6 で追加されたメソッドです。
  # 
  # //emlist[][ruby]{
  # require "bigdecimal"
  # require "bigdecimal/util"
  # 
  # p nil.to_d  # => 0.0
  # //}
  def to_d; end

  # --- to_f -> Float
  # 
  # 0.0 を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_f   #=> 0.0
  # //}
  def to_f; end

  # --- to_h -> {}
  # 
  # {} を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_h   #=> {}
  # //}
  def to_h; end

  # --- to_i -> Integer
  # 
  # 0 を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_i   #=> 0
  # //}
  def to_i; end

  # --- to_r -> Rational
  # 
  # 0/1 を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_r # => (0/1)
  # //}
  def to_r; end

  # --- to_s -> String
  # 
  # 空文字列 "" を返します。
  # 
  # //emlist[例][ruby]{
  # nil.to_s   # => ""
  # //}
  def to_s; end

  # --- |(other) -> bool
  # 
  # other が真なら true を, 偽なら false を返します。
  # 
  # @param other 論理和を行なう式です
  # 
  # //emlist[例][ruby]{
  # nil | true   # => true
  # nil | false  # => false
  # nil | nil    # => false
  # nil | "a"    # => true
  # //}
  def |; end

end
