module Fiddle
  # --- dlopen(lib)                    -> Fiddle::Handle
  # 
  # ダイナミックライブラリ lib をロードし、
  # [[c:Fiddle::Handle]] として返します。
  # 
  # [[m:Fiddle::Handle.new]](lib) と等価です。
  # 
  # @param lib ロードしたいライブラリを文字列で与えます。
  # 
  # @raise Fiddle::DLError [[man:dlopen(3)]] に失敗した時に発生します。
  def dlopen; end

  # --- dlunwrap(addr)  -> object
  # 
  # 指定されたアドレスの Ruby オブジェクトを返します。
  # 
  # @param addr [[m:Fiddle.#dlwrap]] が返した Ruby オブジェクトのアドレス(整数)を指定します。
  # 
  # 例:
  # 
  #   require 'fiddle'
  #   s = 'abc'
  #   p addr = Fiddle.dlwrap(s)   #=> 136122440
  #   p Fiddle.dlunwrap(addr)     #=> "abc"
  def dlunwrap; end

  # --- dlwrap(obj)    -> Integer
  # 
  # 指定されたオブジェクト obj のアドレスを表す整数を返します。
  # 
  # @param obj Ruby のオブジェクトを指定します。
  # 
  # 例:
  # 
  #   require 'fiddle'
  #   s = 'abc'
  #   p addr = Fiddle.dlwrap(s)   #=> 136122440
  #   p Fiddle.dlunwrap(addr)     #=> "abc"
  def dlwrap; end

  # --- free(addr)      -> nil
  # 
  # 指定された addr が指すメモリ領域を開放します。
  # 
  # 必ず [[m:Fiddle.#malloc]] が返した整数を addr に与えなければいけません。
  # そうでない場合、ruby インタプリタが異常終了します。
  # 
  # @param addr [[m:Fiddle.#malloc]] で確保されたメモリ領域を指す整数を指定します。
  # 
  # 例:
  #   require 'fiddle'
  #   addr = Fiddle.malloc(10)
  #   p addr               #=> 136942800
  #   Fiddle.free(addr)
  def free; end

  # --- malloc(size)    -> Integer
  # 
  # size バイトのメモリ領域を確保し、その領域を指す整数を返します。
  # 
  # メモリを確保できなかった場合、例外 NoMemoryError が発生するか、あるいは ruby インタプリタが強制終了します。
  # 
  # @param size 必要なメモリ領域のサイズを整数で指定します。
  def malloc; end

  # --- realloc(addr, size)   -> Integer
  # 
  # addr で指定したメモリ領域を size バイトにリサイズし、その領域を指す整数
  # を返します。
  # 
  # addr には [[m:Fiddle.#malloc]] で確保したメモリ領域を渡します。
  # また、リサイズの結果、返り値が addr と異なる場合があります。
  # 
  # @param addr リサイズしたいメモリアドレス整数
  # @param size リサイズ後のバイト数
  # @see [[m:Fiddle.#malloc]]
  def realloc; end

  # --- last_error -> Integer
  # 最後に [[m:Fiddle::Function#call]] で C の関数を呼び出した
  # 結果設定された errno を返します。
  # 
  # この値はスレッドローカルです。
  def last_error; end

  # --- last_error=(errno)
  # [[m:Fiddle.last_error]] で返される値を設定します。
  # 
  # errno は fiddle が設定するのでユーザはこのメソッドを使わないでください。
  # 
  # @param errno 設定する errno
  def last_error=; end

  # --- win32_last_error -> Integer
  # 最後に [[m:Fiddle::Function#call]] で C の関数を呼び出した
  # 結果設定された errno を返します。
  # 
  # このメソッドは Windows 環境でのみ定義されています。
  # 
  # この値はスレッドローカルです。
  def win32_last_error; end

  # --- win32_last_error=(errno)
  # [[m:Fiddle.win32_last_error]] で返される値を設定します。
  # 
  # errno は fiddle が設定するのでユーザはこのメソッドを使わないでください。
  # 
  # このメソッドは Windows 環境でのみ定義されています。
  # 
  # @param errno 設定する errno
  def win32_last_error=; end

  # --- ALIGN_CHAR -> Integer
  # C の構造体における char のアライメントの値。
  def ALIGN_CHAR; end

  # --- ALIGN_DOUBLE -> Integer
  # C の構造体における double のアライメントの値。
  def ALIGN_DOUBLE; end

  # --- ALIGN_FLOAT -> Integer
  # C の構造体における float のアライメントの値。
  def ALIGN_FLOAT; end

  # --- ALIGN_INT -> Integer
  # C の構造体における int のアライメントの値。
  def ALIGN_INT; end

  # --- ALIGN_INTPTR_T -> Integer
  # C の構造体における intptr_t のアライメントの値。
  def ALIGN_INTPTR_T; end

  # --- ALIGN_LONG -> Integer
  # C の構造体における long のアライメントの値。
  def ALIGN_LONG; end

  # --- ALIGN_LONG_LONG -> Integer
  # C の構造体における long long のアライメントの値。
  def ALIGN_LONG_LONG; end

  # --- ALIGN_PTRDIFF_T -> Integer
  # C の構造体における ptrdiff_t のアライメントの値。
  def ALIGN_PTRDIFF_T; end

  # --- ALIGN_SHORT -> Integer
  # C の構造体における short のアライメントの値。
  def ALIGN_SHORT; end

  # --- ALIGN_SIZE_T -> Integer
  # C の構造体における size_t のアライメントの値。
  def ALIGN_SIZE_T; end

  # --- ALIGN_SSIZE_T -> Integer
  # C の構造体における ssize_t のアライメントの値。
  def ALIGN_SSIZE_T; end

  # --- ALIGN_UINTPTR_T -> Integer
  # C の構造体における uintptr_t のアライメントの値。
  def ALIGN_UINTPTR_T; end

  # --- ALIGN_VOIDP -> Integer
  # C の構造体における void* のアライメントの値。
  def ALIGN_VOIDP; end

  # --- BUILD_RUBY_PLATFORM -> String
  # ビルドに用いた ruby のプラットフォームを表す文字列。
  # 
  # 通常、[[m:Object::RUBY_PLATFORM]] と同じ。
  def BUILD_RUBY_PLATFORM; end

  # --- NULL -> DL::CPtr
  # C の NULL ポインタ
  def NULL; end

  # --- RUBY_FREE -> Integer
  # ruby_xfree の関数ポインタのアドレスの値。
  def RUBY_FREE; end

  # --- SIZEOF_CHAR -> Integer
  # Cでの sizeof(char) の値
  def SIZEOF_CHAR; end

  # --- SIZEOF_DOUBLE -> Integer
  # Cでの sizeof(double) の値
  def SIZEOF_DOUBLE; end

  # --- SIZEOF_FLOAT -> Integer
  # Cでの sizeof(float) の値
  def SIZEOF_FLOAT; end

  # --- SIZEOF_INT -> Integer
  # Cでの sizeof(int) の値
  def SIZEOF_INT; end

  # --- SIZEOF_INTPTR_T -> Integer
  # Cでの sizeof(intptr_t) の値
  def SIZEOF_INTPTR_T; end

  # --- SIZEOF_LONG -> Integer
  # Cでの sizeof(long) の値
  def SIZEOF_LONG; end

  # --- SIZEOF_LONG_LONG -> Integer
  # Cでの sizeof(long long) の値
  def SIZEOF_LONG_LONG; end

  # --- SIZEOF_PTRDIFF_T -> Integer
  # Cでの sizeof(ptrdiff_t) の値
  def SIZEOF_PTRDIFF_T; end

  # --- SIZEOF_SHORT -> Integer
  # Cでの sizeof(short) の値
  def SIZEOF_SHORT; end

  # --- SIZEOF_SIZE_T -> Integer
  # Cでの sizeof(size_t) の値
  def SIZEOF_SIZE_T; end

  # --- SIZEOF_SSIZE_T -> Integer
  # Cでの sizeof(ssize_t) の値
  def SIZEOF_SSIZE_T; end

  # --- SIZEOF_UINTPTR_T -> Integer
  # Cでの sizeof(uintptr_t) の値
  def SIZEOF_UINTPTR_T; end

  # --- SIZEOF_VOIDP -> Integer
  # Cでの sizeof(void*) の値
  def SIZEOF_VOIDP; end

  # --- TYPE_CHAR -> Integer
  # C の char 型を表す定数。
  # 
  # unsigned char を表すには符号を逆転させます。
  #          
  def TYPE_CHAR; end

  # --- TYPE_DOUBLE -> Integer
  # C の double 型を表す定数。
  def TYPE_DOUBLE; end

  # --- TYPE_FLOAT -> Integer
  # C の float 型を表す定数。
  def TYPE_FLOAT; end

  # --- TYPE_INT -> Integer
  # C の int 型を表す定数。
  # 
  # unsigned int を表すには符号を逆転させます。
  def TYPE_INT; end

  # --- TYPE_INTPTR_T -> Integer
  # C の intptr_t 型を表す定数。
  def TYPE_INTPTR_T; end

  # --- TYPE_LONG -> Integer
  # C の long 型を表す定数。
  # 
  # unsigned long を表すには符号を逆転させます。
  def TYPE_LONG; end

  # --- TYPE_LONG_LONG -> Integer
  # C の long long 型を表す定数。
  # 
  # unsigned long long を表すには符号を逆転させます。
  def TYPE_LONG_LONG; end

  # --- TYPE_PTRDIFF_T -> Integer
  # C の ptrdiff_t 型を表す定数。
  def TYPE_PTRDIFF_T; end

  # --- TYPE_SHORT -> Integer
  # C の short 型を表す定数。
  # 
  # unsigned short を表すには符号を逆転させます。
  def TYPE_SHORT; end

  # --- TYPE_SIZE_T -> Integer
  # C の size_t 型を表す定数。
  def TYPE_SIZE_T; end

  # --- TYPE_SSIZE_T -> Integer
  # C の ssize_t 型を表す定数。
  def TYPE_SSIZE_T; end

  # --- TYPE_UINTPTR_T -> Integer
  # C の uintptr_t 型を表す定数。
  def TYPE_UINTPTR_T; end

  # --- TYPE_VOID -> Integer
  # C の void を表す定数。
  def TYPE_VOID; end

  # --- TYPE_VOIDP -> Integer
  # C の void* 型を表す定数。
  def TYPE_VOIDP; end

  # --- WINDOWS -> bool
  # Windows 上ならば真です。
  def WINDOWS; end

end
