class Fiddle::CStruct
  # --- to_i -> Integer
  # 保持している構造体の先頭アドレスを整数で返します。
  def to_i; end

  # --- to_ptr -> Fiddle::Pointer
  # 保持している構造体へのポインタを返します。
  def to_ptr; end

  # --- malloc -> Fiddle::CStruct
  # 構造体のためのメモリを確保し、Fiddle::CStruct の(子孫クラスの)
  # オブジェクトで返します。
  # 
  # C における
  #   return (struct foo*)malloc(sizeof(struct foo));
  # というコードと対応していると言えます。
  def malloc; end

  # --- new(addr) -> Fiddle::CStruct
  # addr のアドレスが指すメモリを構造体のアドレスとみなし、
  # 構造体を作ります。
  # 
  # C におけるキャストと似ています。
  #   return (struct foo*)addr;
  # というコードと対応していると言えます。
  # 
  # @param addr アドレス
  def new; end

  # --- size -> Integer
  # 構造体のサイズをバイト数で返します。
  # 
  # このメソッドが返す値は C の構造体としてのサイズです。
  # Ruby のオブジェクトとしてはより大きなメモリを消費しています。
  def size; end

end
