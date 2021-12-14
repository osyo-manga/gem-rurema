class Fiddle::Function
  # --- abi -> Integer
  # 呼出規約を返します。
  # 
  # @see [[m:Fiddle::Function.new]]
  def abi; end

  # --- call(*args) -> Integer|DL::CPtr|nil
  # 関数を呼び出します。
  # 
  # [[m:Fiddle::Function.new]] で指定した引数と返り値の型に基いて
  # Ruby のオブジェクトを適切に C のデータに変換して C の関数を呼び出し、
  # その返り値を Ruby のオブジェクトに変換して返します。
  # 
  # 引数の変換は以下の通りです。
  # 
  # : void* (つまり任意のポインタ型)
  #   nil ならば C の NULL に変換されます
  #   [[c:Fiddle::Pointer]] は保持している C ポインタに変換されます。
  #   文字列であればその先頭ポインタになります。
  #   [[c:IO]] オブジェクトであれば FILE* が渡されます。
  #   整数であればそれがアドレスとみなされます。
  #   to_ptr を持っているならば、それを呼びだし Fiddle::Pointer に
  #   変換したものを用います。
  #   to_i を持っているならば、それを呼びだし結果の整数を
  #   アドレスと見なします
  #     
  # : (unsigned) char/short/int/long/long long
  #   Ruby の整数を C の整数に変換します。
  # 
  # : double/float
  #   Ruby の整数 or 浮動小数点数を C の浮動小数点数に変換します
  #   
  # 返り値の変換は以下の通りです。
  # 
  # : void
  #   nil を返します
  # 
  # : (unsigned) char/short/int/long/long long
  #   C の整数を Ruby の整数に変換します
  # 
  # : void*(つまり任意のポインタ型)
  #   C のポインタを保持した [[c:Fiddle::Pointer]] を返します。
  # 
  # @param args 関数の引数
  # @see [[m:Fiddle::Function.new]]
  def call; end

  # --- name -> nil | String
  # 関数の名前を返します。
  # 
  # 名前が定義されていない場合は nil を返します。
  # 
  # @see [[m:Fiddle::Function.new]]
  def name; end

  # --- ptr -> Integer | Fiddle::Function
  # 関数ポインタを返します。
  # 
  # [[m:Fiddle::Function.new]] の第1引数として指定したものを返します。
  def ptr; end

  # --- to_i -> Integer
  # 関数ポインタのアドレスを整数で返します。
  # 
  # @see [[m:Fiddle::Function#ptr]]
  def to_i; end

  # --- new(ptr, args, ret_type, abi=Fiddle::Function::DEFAULT, name: nil) -> Fiddle::Function
  # ptr (関数ポインタ)から Fiddle::Function オブジェクトを
  # 生成します。
  # 
  # ptr には [[c:Fiddle::Handle]] から [[m:Fiddle::Handle#sym]] などで取りだした
  # 関数ポインタ(を表す整数)、もしくは関数を指している
  # [[c:Fiddle::Pointer]] を渡します。
  # 
  # args、ret_type で関数の引数と返り値の型を指定します。これには以下の
  # 定数が利用できます。「-TYPE_INT」 のように符号を反転させると unsigned を
  # 意味します。
  #   * [[m:Fiddle::TYPE_VOID]]
  #   * [[m:Fiddle::TYPE_VOIDP]]
  #   * [[m:Fiddle::TYPE_CHAR]]
  #   * [[m:Fiddle::TYPE_SHORT]]
  #   * [[m:Fiddle::TYPE_INT]]
  #   * [[m:Fiddle::TYPE_LONG]]
  #   * [[m:Fiddle::TYPE_LONG_LONG]]
  #   * [[m:Fiddle::TYPE_FLOAT]]
  #   * [[m:Fiddle::TYPE_DOUBLE]]
  #   * [[m:Fiddle::TYPE_INTPTR_T]]
  #   * [[m:Fiddle::TYPE_UINTPTR_T]]
  #   * [[m:Fiddle::TYPE_PTRDIFF_T]]
  #   * [[m:Fiddle::TYPE_SIZE_T]]
  #   * [[m:Fiddle::TYPE_SSIZE_T]]
  # 
  # 
  # abi で呼出規約を指定します。
  #   * [[m:Fiddle::Function::DEFAULT]]
  #   * [[m:Fiddle::Function::STDCALL]]
  # のどちらかを指定します。
  # 
  #   require 'fiddle'
  #   
  #   h = Fiddle::Handle.new('libc.so.6')
  #   func = Fiddle::Function.new(h.sym("strlen"), [Fiddle::TYPE_VOIDP], 
  #                               Fiddle::TYPE_INT, name: "strlen")
  #   p func.ptr == h.sym("strlen") # => true
  #   p func.call("abc") # => 3
  #   p func.name # => "strlen"
  # 
  # @param ptr C の関数を指す [[c:Fiddle::Pointer]] オブジェクトもしくは
  #        アドレスを表す整数
  # @param args 引数の型を表す配列
  # @param ret_type 返り値の型
  # @param abi 呼出規約
  # @param name 関数の名前(文字列)
  def new; end

  # --- DEFAULT -> Integer
  # デフォルトの呼出規約を表します。
  # 
  # @see [[m:Fiddle::Function.new]]
  def DEFAULT; end

  # --- STDCALL -> Integer
  # Windows の stdcall 呼出規約を表します。
  # 
  # stdcall 呼出規約を持つ環境でのみ定義されます。
  # 
  # @see [[m:Fiddle::Function.new]]
  def STDCALL; end

end
