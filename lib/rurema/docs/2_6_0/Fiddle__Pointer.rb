class Fiddle::Pointer
  # --- +(n)   -> Fiddle::Pointer
  # 
  # 自身のアドレスに n バイトを足した新しい Pointer オブジェクトを返します。
  # 
  # この返り値には、free 関数がセットされず、size は 0 とされます。
  # 
  # @param n アドレスの増分を整数で指定します。
  # 
  # 例:
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr = Fiddle::Pointer[s]
  #  p cptr[0,1]         #=> "a"
  #  cptr += 1
  #  p cptr[0,1]         #=> "b"
  def +; end

  # --- ptr   -> Fiddle::Pointer
  # --- +@    -> Fiddle::Pointer
  # 
  # 自身の指す値を Pointer にして返します。
  # 
  # 自身の指す値はポインタであると仮定します。
  # C 言語におけるポインタのポインタに対する間接参照 *p と同じです。 
  # 
  # この返り値には、free 関数がセットされず、size は 0 とされます。
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr = Fiddle::Pointer[s]
  #  cref = cptr.ref
  #  p cref.to_s(4).unpack('l*')[0]  #=> 136121648
  #  p cptr.to_i                     #=> 136121648
  #  p cref.ptr.to_s                 #=> "abc"
  def +@; end

  # --- -(n)   -> Fiddle::Pointer
  # 
  # 自身のアドレスから n バイトを引いた新しい Pointer オブジェクトを返します。
  # 
  # この返り値には、free 関数がセットされず、size は 0 とされます。
  # 
  # @param n アドレスの差分を整数で指定します。
  # 
  # 例:
  #  require 'fiddle' 
  #  
  #  s = 'abc'
  #  cptr = Fiddle::Pointer[s]
  #  cptr += 1
  #  p cptr[0,1]         #=> "b"
  #  cptr -= 1
  #  p cptr[0,1]         #=> "a"
  def -; end

  # --- ref   -> Fiddle::Pointer
  # --- -@    -> Fiddle::Pointer
  # 
  # 自身を指す Pointer オブジェクトを返します。
  # C 言語におけるポインタへのアドレス演算子の適用 &p と同じです。
  # 
  # この返り値には、free 関数がセットされず、size は 0 とされます。
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr = Fiddle::Pointer[s]
  #  cref = cptr.ref
  #  p cref.to_s(4).unpack('l*')[0]  #=> 136121648
  #  p cptr.to_i                     #=> 136121648
  #  p cref.ptr.to_s                 #=> "abc"
  def -@; end

  # --- <=>(other)    -> Integer
  # 
  # ポインタの指すアドレスの大小を比較します。
  # 
  # other より小さい場合は -1, 等しい場合は 0、other より大きい場合は
  # 1を返します。
  # 
  # @param other 比較対象の Pointer オブジェクト
  def <=>; end

  # --- eql?(other)     -> bool
  # --- ==(other)       -> bool
  # 
  # ポインタの指すアドレスが同一ならばtrueを返します。
  # 
  # @param other 比較対象の Pointer オブジェクト
  # 
  # 例:
  # 
  #  require 'fiddle' 
  #  
  #  s = 'abc'
  #  cptr  = Fiddle::Pointer[s]
  #  cptr0 = Fiddle::Pointer[s]
  #  cptr1 = cptr + 1
  #  
  #  p cptr == cptr1     #=> false
  #  p cptr == cptr0     #=> true
  def ==; end

  # --- [](offset)            -> Integer
  # 
  # 自身の指すアドレスに offset バイトを足したメモリ領域の先頭を整数として返します。
  # 
  # @param offset 値を得たい領域のアドレスまでのオフセット
  # @raise Fiddle::DLError self の保持するポインタが NULL である場合に発生します
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr  = Fiddle::Pointer[s]
  #  p cptr[0]            #=> 97           
  #  p cptr[1]            #=> 98
  # 
  # --- [](offset, len)       -> String
  # 
  # 自身の指すアドレスに offset バイトを足したメモリ領域の先頭 len バイトを複製し、
  # 文字列として返します。
  # 
  # (self + offset).to_s(len) と同等です。
  # offset + len が自身のサイズより小さいかを検証しません。
  # 
  # @param offset 値を得たい領域の先頭のアドレスまでのオフセットを整数で与えます。
  # 
  # @param len 値を得たい領域のサイズを指定します。
  # @raise Fiddle::DLError self の保持するポインタが NULL である場合に発生します
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr  = Fiddle::Pointer[s]
  #  p cptr[0, 1]            #=> "a"
  #  p cptr[1, 2]            #=> "bc"
  def []; end

  # --- []=(offset, n)
  # 
  # 自身の指すアドレスに offset バイトを足したメモリ領域を指定された n に書き換えます。
  # 
  # @param n 整数を指定します。
  # @raise Fiddle::DLError self の保持するポインタが NULL である場合に発生します
  # 
  # 例:
  # 
  #  require 'fiddle'
  # 
  #  s = 'abc'
  #  cptr  = Fiddle::Pointer[s]
  #  cptr[0] = 65
  #  p cptr.to_s         #=> "Bbc"
  # 
  # 
  # --- []=(offset, len, v) 
  # 
  # 自身の指すアドレスに offset バイトを足したメモリ領域の先頭 len バイトに
  # 文字列 v をコピーします。
  # 
  # str のサイズが len より小さい場合は、残りの領域を 0 で埋めます。
  # コピー先の領域が len より大きいか検証しません。
  # 
  # @param offset 書き換えたいメモリ領域のオフセットを整数で与えます。
  # 
  # @param len 書き換えたいメモリ領域のサイズを整数で指定します。
  # 
  # @param v メモリ領域にセットしたいバイト列を文字列で指定します。
  # 
  # @raise Fiddle::DLError self の保持するポインタが NULL である場合に発生します
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  cptr  = Fiddle::Pointer[s]
  #  p cptr[1,2] = "AA"
  #  p cptr.to_s         #=> "aAA"
  def []=; end

  # --- free     -> Fiddle::CFunc
  # 
  # GC がメモリを解放するのに使用する [[c:Fiddle::CFunc]] オブジェクトを返します。
  # 
  # これは普通 [[m:Fiddle::Pointer#free=]] や [[m:Fiddle::Pointer.new]] によって設定されます。
  def free; end

  # --- free=(cfunc)
  # 
  # GC が自身を解放するのに使う関数を [[c:Fiddle::CFunc]] で指定します。
  # 
  # @param cfunc 自身を解放するのに使われる関数を [[c:Fiddle::CFunc]] か整数で指定します。
  def free=; end

  # --- null?    -> bool
  # 
  # 自身が NULL なら true を返します。そうでないなら false を返します。
  def null?; end

  # --- size        -> Integer
  # 自身の指す領域のサイズを返します。
  # 
  # 基本的には [[m:Fiddle::Pointer.new]] で指定したサイズが返されます。
  # [[m:Fiddle::Pointer.to_ptr]] で文字列を変換したときは、そのバイト数が返されます。
  # [[m:Fiddle::Pointer#size=]] でこの値を変更することができます。
  def size; end

  # --- size=(s)
  # 
  # 自身の指す領域のサイズを変えます。
  # 
  # 変更してもメモリの再割り当てはしません。単にオブジェクトが記録している
  # size の情報が変更されるだけです。
  # 
  # @param s 自身が指すメモリのサイズを整数で指定します。
  def size=; end

  # --- to_i    -> Integer
  # --- to_int  -> Integer
  # 
  # 自身が指すアドレスを整数で返します。
  def to_i; end

  # --- to_s         -> String
  # --- to_s(len)    -> String
  # 
  # 自身が指す領域から長さ len の文字列を複製して返します。
  # 
  # len を省略した場合は、文字列の終りは '\0' であると仮定して、
  # [[man:strlen(3)]] を使って長さを算出します。
  # 
  # @param len 文字列の長さを整数で指定します。
  def to_s; end

  # --- to_str         -> String
  # --- to_str(len)    -> String
  # 
  # 自身が指す領域から長さ len の文字列を複製して返します。
  # 
  # len を省略した場合は、self.size をその代わりに使います。
  # 
  # @param len 文字列の長さを整数で指定します。
  def to_str; end

  # --- to_value    -> object
  # 
  # 自身はヒープに確保された Ruby のオブジェクトを指すポインタであると仮定して、
  # 自身が指すオブジェクトを返します。
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  
  #  s = 'abc'
  #  i = Fiddle.dlwrap(s)
  #  cptr = Fiddle::Pointer.new(i)
  #  p cptr.to_value   #=> "abc"
  def to_value; end

  # --- [](val)       -> Fiddle::Pointer
  # --- to_ptr(val)   -> Fiddle::Pointer
  # 
  # 与えられた val と関連した Pointer オブジェクトを生成して返します。
  # 
  # val が文字列の場合は文字列が格納されているメモリ領域を指す Pointer 
  # オブジェクトを返します。
  # 
  # IO オブジェクトの場合は FILE ポインタを表す Pointer オブジェクトを返します。
  # 
  # val に to_ptr メソッドが定義されている場合は、val.to_ptr を呼び、
  # Pointer オブジェクトに変換したものを返します。
  # 
  # val が整数の場合はそれをアドレスとする Pointer オブジェクトを返します。
  # 
  # 上以外の場合は、整数に変換(to_int)し
  # それをアドレスとする Pointer オブジェクトを返します。
  # 
  # 
  # @param val Ruby オブジェクトを指定します。
  # 
  # @raise Fiddle::DLError to_ptr の返り値が Pointer オブジェクトでない場合に発生します
  # @raise TypeError 上記のいずれの変換も不可能であった場合に発生します
  # 
  # 例:
  # 
  #  require 'fiddle'
  #  s = "abc"
  #  p Fiddle::Pointer[s].to_i                 #=> 136186388
  #  p [s].pack('p*').unpack('l!*')[0]  #=> 136186388
  def []; end

  # --- malloc(size, free = nil)   -> Fiddle::Pointer
  # 
  # 与えられた長さ size のメモリ領域を確保し、それを表す Pointer オブジェクトを生成して返します。
  # 
  # @param size 確保したいメモリ領域のサイズを整数で指定します。
  # 
  # @param free GC 時に呼ばれる Pointer オブジェクトの free 関数を 
  #        [[c:Fiddle::Function]] オブジェクトか整数で指定します。
  def malloc; end

  # --- new(addr, size = 0, free = nil)   -> Fiddle::Pointer
  # 
  # 与えられた addr が指すメモリ領域を表す Pointer オブジェクトを生成して返します。
  # 
  # size を指定した場合、アドレス addr に確保されているメモリ領域のサイズは
  # size であると仮定されます。GC は free 関数を使用してメモリを解放します。
  # 
  # @param addr 生成する Pointer オブジェクトが指すアドレスを整数で指定します。
  # 
  # @param size 生成する Pointer オブジェクトが指すメモリ領域のサイズを整数で指定します。
  # 
  # @param free GC 時に呼ばれる free 関数を [[c:Fiddle::Function]] オブジェクトか
  #        整数で指定します。
  def new; end

end
