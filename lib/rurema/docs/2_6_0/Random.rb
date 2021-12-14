class Random
  # --- ==(other) -> bool
  # 
  # 乱数生成器が等しい状態であるならばtrue を返します。
  # 
  # @param other 比較対象の乱数生成器
  # 
  # 
  # //emlist[例][ruby]{
  # r1 = Random.new(1)
  # r2 = Random.new(1)
  # 
  # p r1 == r2 # => true
  # r2.rand
  # p r1 == r2 # => false
  # r1.rand
  # p r1 == r2 # => true
  # //}
  def ==; end

  # --- bytes(size) -> String
  # 
  # ランダムなバイナリー文字列を返します。結果の文字列のサイズを指定できます。
  # 
  # @param size 結果の文字列のサイズをバイト数で指定します。
  # 
  # //emlist[例][ruby]{
  # r2 = Random.new(1)
  # p r2.bytes(10) # => "%\xF4\xC1j\xEB\x80G\xFF\x8C/"
  # //}
  # 
  # @see [[m:Random.bytes]]
  def bytes; end

  # --- left -> Integer
  # C言語レベルで定義されている構造体MTの変数leftを参照します。詳しくはrandom.c を参照してください。
  def left; end

  # --- marshal_dump -> Array
  # [[m:Random#marshal_load]] で復元可能な配列を返します。
  # 
  # //emlist[例][ruby]{
  # r1 = Random.new(1)
  # a1 = r1.marshal_dump
  # r2 = Random.new(3)
  # p r1 == r2 # => false
  # r3 = r2.marshal_load(a1)
  # 
  # p r1 == r2 # => true
  # p r1 == r3 # => true
  # //}
  def marshal_dump; end

  # --- marshal_load(array) -> Random
  # 
  # [[m:Random#marshal_dump]] で得られた配列を基に、Randomオブジェクトを復元します。
  # 
  # @param array 三要素以下からなる配列を指定します。
  #              何を指定するかは[[m:Random#marshal_dump]]を参考にしてください。
  # 
  # @raise ArgumentError array が3より大きい場合に発生します。
  # 
  # //emlist[例][ruby]{
  # r1 = Random.new(1)
  # a1 = r1.marshal_dump
  # r2 = Random.new(3)
  # r3 = r2.marshal_load(a1)
  # 
  # p r1 == r2 # => true
  # p r1 == r3 # => true
  # //}
  # 
  # @see [[m:Random#marshal_dump]]
  def marshal_load; end

  # --- rand -> Float
  # --- rand(max) -> Integer | Float
  # --- rand(range) -> Integer | Float | nil
  # 
  # 一様な擬似乱数を発生させます。
  # 
  # 最初の形式では 0.0 以上 1.0 未満の実数を返します。
  # 
  # 二番目の形式では 0 以上 max 未満の数を返します。
  # max が正の整数なら整数を、正の実数なら実数を返します。
  # 0 や負の数を指定することは出来ません。
  # 
  # 三番目の形式では range で指定された範囲の値を返します。
  # range の始端と終端が共に整数の場合は整数を、少なくとも片方が実数の場合は実数を返します。
  # range に含まれる数が無い場合は nil を返します。
  # rangeが終端を含まない(つまり ... で生成した場合)には終端の値は乱数の範囲から除かれます。
  # range.end - range.begin が整数を返す場合は range.begin + self.rand((range.end - range.begin) + e)
  # の値を返します(e は終端を含む場合は1、含まない場合は0です)。
  # range.end - range.begin が実数を返す場合も同様です。
  # このため range が [[c:Time]] の場合などにもうまく動作します。
  # 
  # 引数が実数でも範囲でもない場合は [[m:Object#to_int]] で変換した値が指定されたものとして扱います。
  # 
  # @param max   乱数値の上限を正の整数または実数で指定します。
  #              max 自体は乱数値の範囲に含まれません。
  # @param range 発生させる乱数値の範囲を [[c:Range]] オブジェクトで指定します。
  #              range.end - range.begin は数値である必要があり、
  #              range.begin + 数値 が適切な値を返す必要があります。
  # 
  # @raise ArgumentError 引数の数が0または1では無い時、引数に負の数値を与えた時に発生します。
  # 
  # //emlist[例][ruby]{
  # # Kernel.#rand とほぼ同様の使い勝手
  # prng = Random.new(1234)
  # prng.rand            # => 0.1915194503788923
  # srand(1234)
  # rand                 # => 0.1915194503788923
  # 
  # # max に実数も指定出来る
  # prng.rand(6.5)       # => 4.043707011758907
  # # (rand(6) と同等)
  # rand(6.5)            # => 5
  # 
  # # 引数には Range も指定できる
  # # 0 から 10までの整数が得られる
  # prng.rand(0..10) # => 4
  # # 0 から 9までの整数が得られる
  # prng.rand(0...10) # => 8
  # # 0 から 4.2までの実数が得られる (4.2 が得られる可能性もある)
  # prng.rand(0..4.2) # => 3.2397116600246867
  # # 0 から 4.2までの実数が得られる (4.2 は除く)
  # prng.rand(0...4.2) # => 3.6148130397862865
  # # 2012年のすべての(秒単位)時刻から一つ選ばれる
  # prng.rand(Time.new(2012, 1, 1) ... Time.new(2013,1,1)) # => 2012-02-25 03:11:42 +0900
  # require 'date'
  # prng.rand(Date.new(2012, 1, 1) ... Date.new(2013,1,1)) # => #<Date: 2012-01-31 ((2455958j,0s,0n),+0s,2299161j)>
  # # Kernel.#rand とほぼ同様の使い勝手
  # prng = Random.new(1234)
  # prng.rand            # => 0.1915194503788923
  # srand(1234)
  # rand                 # => 0.1915194503788923
  # 
  # # max に実数も指定出来る
  # prng.rand(6.5)       # => 4.043707011758907
  # # (rand(6) と同等)
  # rand(6.5)            # => 5
  # 
  # # 引数には Range も指定できる
  # # 0 から 10までの整数が得られる
  # prng.rand(0..10) # => 4
  # # 0 から 9までの整数が得られる
  # prng.rand(0...10) # => 8
  # # 0 から 4.2までの実数が得られる (4.2 が得られる可能性もある)
  # prng.rand(0..4.2) # => 3.2397116600246867
  # # 0 から 4.2までの実数が得られる (4.2 は除く)
  # prng.rand(0...4.2) # => 3.6148130397862865
  # # 2012年のすべての時刻から一つ選ばれる
  # # Time#- は秒数を float で返すため。
  # prng.rand(Time.new(2012, 1, 1) ... Time.new(2013,1,1)) # => 2012-02-25 03:11:42 +0900
  # # DateTime ではうまくいかない。というのは DateTime#- は
  # # Rational を返すため。
  # # Date#- も Rational を返すが通常は整数を表す Rational オブジェクトを返すためうまくいくように見える
  # 
  # # 上と同じ種で再初期化
  # prng = Random.new(1234)
  # srand(1234)
  # # Kernel.#rand は Array#sample などの影響を受けて値がずれることがある
  # [0, 1].sample
  # prng.rand            #=> 0.1915194503788923
  # rand                 #=> 0.6221087710398319
  # //}
  # 
  #   
  # @see [[m:Kernel.#rand]]
  def rand; end

  # --- seed -> Integer
  # 現在の乱数の種を返します。
  # 
  # //emlist[例][ruby]{
  # p Random.new(3).seed # => 3
  # //}
  def seed; end

  # --- state -> Integer
  # C言語レベルで定義されている構造体MTの状態を参照します。詳しくはrandom.c を参照してください。
  def state; end

  # --- bytes(size) -> String
  # 
  # ランダムなバイナリー文字列を返します。結果の文字列のサイズを指定できます。
  # 
  # @param size 結果の文字列のサイズをバイト数で指定します。
  # 
  # //emlist[][ruby]{
  # Random.bytes(10) # => "\xAC\n\x7F\x8C/\xAA\xC4\x97u\xA6"
  # //}
  # 
  # @see [[m:Random#bytes]]
  def bytes; end

  # --- left -> Integer
  # C言語レベルで定義されている構造体MTの静的変数default_randの変数leftを参照します。詳しくはrandom.c を参照してください。
  def left; end

  # --- new(seed = Random.new_seed) -> Random
  # メルセンヌ・ツイスタに基づく擬似乱数発生装置オブジェクトを作ります。
  # 引数が省略された場合は、[[m:Random.new_seed]]の値を使用します。
  # 
  # 
  # @param seed 擬似乱数生成器の種を整数で指定します。
  # 
  # //emlist[例： 種が同じなら同じ乱数列を発生できる。][ruby]{
  # prng = Random.new(1234)                                
  # [ prng.rand, prng.rand ]   #=> [0.1915194503788923, 0.6221087710398319]
  # [ prng.rand(10), prng.rand(1000) ]  #=> [4, 664] 
  # # 同じ乱数列を発生する。
  # prng = Random.new(1234)                                
  # [ prng.rand, prng.rand ]   #=> [0.1915194503788923, 0.6221087710398319]
  # [ prng.rand(10), prng.rand(1000) ]  #=> [4, 664] 
  # //}
  def new; end

  # --- new_seed -> Integer
  # 適切な乱数の種を返します。
  # 
  # //emlist[例][ruby]{
  # p Random.new_seed # => 184271600931914695177248627591520900872
  # //}
  def new_seed; end

  # --- rand -> Float
  # --- rand(max) -> Integer | Float
  # --- rand(range) -> Integer | Float | nil
  # 
  # 擬似乱数を発生させます。
  # 
  # [[m:Random::DEFAULT]].rand と同じです。
  # [[m:Random#rand]] を参照してください。
  # 
  # 擬似乱数生成器が [[m:Kernel.#rand]] と共通なため [[m:Kernel.#srand]] などの影響を受けます。
  # 
  # @param max   乱数値の上限を正の整数または実数で指定します。
  # @param range 発生させる乱数値の範囲を [[c:Range]] オブジェクトで指定します。
  #              range の境界は数値でなければなりません。
  # 
  # @raise Errno::EDOM rand(1..Float::INFINITY) などのように範囲に問題があるときに発生します。
  # 
  # //emlist[例][ruby]{
  # srand 1234 # 乱数の種を設定する。
  # Random.rand(10.0)  #=> 1.9151945037889229  (0.0 以上 10.0 未満の実数)
  # rand(10.0)         #=> 6                   (rand(10) と同じ)
  # //}
  # 
  # @see [[m:Random.srand]], [[m:Random#rand]], [[m:Random::DEFAULT]]
  def rand; end

  # --- srand -> Integer
  # --- srand(number) -> Integer
  # 
  # デフォルトの擬似乱数生成器の種を設定し、古い種を返します。
  # [[m:Kernel.#srand]] と同じです。
  # 
  # @param number 擬似乱数発生器の種を整数で指定します。
  # 
  # 
  # @see [[m:Kernel.#rand]], [[m:Random::DEFAULT]]
  def srand; end

  # --- state -> Integer
  # C言語レベルで定義されている構造体MTの静的変数default_randの状態を参照します。詳しくはrandom.c を参照してください。
  def state; end

  # --- urandom(size) -> String
  # 
  # プラットフォームの提供する機能を使って、文字列を返します。
  # 
  # @param size 結果の文字列のサイズをバイト数で指定します。
  # 
  # @return 返り値はバイナリ形式で、暗号的に安全な擬似乱数だと期待できます。
  # @raise RuntimeError プラットフォームの提供する機能の準備に失敗した場合に発生します。
  # 
  # 2017年の時点で、Linuxのmanpage([[man:random(7)]])には「今日256ビット以上の
  # セキュリティを約束できる暗号化プリミティブが入手可能だとは期待できません」と
  # 書いてあります。そのため、sizeとして32より大きい値を指定することには疑問の
  # 余地があります。
  # 
  # //emlist[例][ruby]{
  # Random.urandom(8)  #=> "\x78\x41\xBA\xAF\x7D\xEA\xD8\xEA"
  # //}
  def urandom; end

  # --- DEFAULT -> Random
  # 
  # Ruby 3.0.0 から非推奨です。代わりに Random クラスオブジェクトを擬似乱数生成器として使用してください。
  # 
  # デフォルトの擬似乱数生成器です。
  # [[m:Random.rand]] や [[m:Kernel.#rand]] などで使用されます。
  # 
  # @see [[m:Random.srand]], [[m:Kernel.#srand]]
  def DEFAULT; end

end
