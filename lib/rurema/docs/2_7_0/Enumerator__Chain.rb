class Enumerator::Chain
  # --- each(*args) { |*args| ...} -> object
  # --- each(*args) -> Enumerator
  # 
  # まず最初の繰り返し可能なオブジェクトの each メソッドを
  # args 引数とともに呼び出した後、続く繰り返し可能なオブジェクト
  # も同様に呼び出します。
  # 
  # ブロックが渡されない場合は [[c:Enumerator]] を返します。
  def each; end

  # --- inspect -> String
  # 
  # self を人間が読みやすい形式で文字列として返します。
  def inspect; end

  # --- rewind -> object
  # 
  # 列挙状態を巻き戻します。
  # 
  # self が持つ繰り返し可能なオブジェクトに対して、逆順で rewind メソッドを呼びます。
  # ただし rewind メソッドを持たないオブジェクトに対しては rewind メソッドを呼びません。
  def rewind; end

  # --- size -> Integer | Float::INFINITY | nil
  # 
  # 合計の要素数を返します。
  # 
  # それぞれの列挙可能なオブジェクトのサイズの合計値を返します。
  # ただし、列挙可能なオブジェクトが1つでも nil か [[m:Float::INFINITY]]
  # を返した場合、それを合計の要素数として返します。
  def size; end

  # --- new(*enums) -> Enumerator::Chain
  # 
  # 複数の Enumerable から、1つの新しい Enumerator を作って返します。
  # 
  # //emlist[例][ruby]{
  # e = Enumerator::Chain.new(1..3, [4, 5])
  # e.to_a #=> [1, 2, 3, 4, 5]
  # e.size #=> 5
  # //}
  def new; end

end
