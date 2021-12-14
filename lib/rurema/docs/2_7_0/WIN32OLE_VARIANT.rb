class WIN32OLE_VARIANT
  # --- [](i...) -> object
  # 配列型のWIN32OLE_VARIANTの要素を取得します。
  # 
  # selfは、[[m:WIN32OLE_VARIANT.array]]または引数に配列を指定して
  # [[m:WIN32OLE_VARIANT.new]]で作成したインスタンスの必要があります。
  # 
  # @param i 各次元の0からのインデックスを「,」で区切って次元数分指定します。
  #          インデックスは0から要素数-1までのIntegerで指定してください。
  # @return 引数で指定したインデックスの要素を返します。
  # @raise ArgError 引数の数が次元数と一致していません。
  # 
  # @raise WIN32OLERuntimeError selfが配列型のWIN32OLE_VARIANTではありませ
  #                             ん。あるいはインデックスが0未満または要素数
  #                             以上を指定しています。
  # 
  #    obj = WIN32OLE_VARIANT.new([[1,2,3],[4,5,6]])
  #    p obj[0,0] # => 1
  #    p obj[1,0] # => 4
  #    p obj[2,0] # => WIN32OLERuntimeError
  #    p obj[0, -1] # => WIN32OLERuntimeError
  def []; end

  # --- []=(i..., val) -> object
  # 配列型のWIN32OLE_VARIANTの要素を設定します。
  # 
  # selfは、[[m:WIN32OLE_VARIANT.array]]または引数に配列を指定して
  # [[m:WIN32OLE_VARIANT.new]]で作成したインスタンスの必要があります。
  # 
  # @param i 各次元の0からのインデックスを「,」で区切って次元数分指定します。
  #          インデックスは0から要素数-1までのIntegerで指定してください。
  # @param val 設定値を指定します。Array、String、Integer、Float、
  #            TrueClass、FalseClass、NilClass以外のオブジェクトはオートメー
  #            ションオブジェクト（WIN32OLEオブジェクト）に変換します。
  # @return 引数で指定したインデックスの要素を返します。
  # @raise ArgError 引数の数が次元数と一致していません。
  # 
  # @raise WIN32OLERuntimeError selfが配列型のWIN32OLE_VARIANTではありませ
  #                             ん。あるいはインデックスが0未満または要素数
  #                             以上を指定しています。
  # 
  #    obj = WIN32OLE_VARIANT.new([[1,2,3],[4,5,6]])
  #    obj[0,0] = 7
  #    obj[1,0] = 8
  #    p obj.value # => [[7,2,3], [8,5,6]]
  #    obj[2,0] = 9 # => WIN32OLERuntimeError
  #    obj[0, -1] = 9 # => WIN32OLERuntimeError
  def []=; end

  # --- value -> object
  # 値に対応するRubyオブジェクトを取得します。
  # 
  # @return 値に対応するRubyのオブジェクトを返します。
  # 
  #    obj = WIN32OLE_VARIANT.new(1, WIN32OLE::VARIANT::VT_BSTR)
  #    obj.value # => "1" (VT_BSTRを指定して生成したので、Stringオブジェクトとなる)
  def value; end

  # --- value=(val) -> ()
  # WIN32OLE_VARIANTの値を再設定します。
  # 
  # 指定した値でselfを再設定します。指定値が元のVARIANT型に合わない場合は元
  # のVARIANT型に合うように引数を変換します。変換は、引数を一度VARIANT型に
  # 変換してからCOMのVARIANT型変換関数（VariantChangeTypeEx）を呼び出すこと
  # で実現します。
  # 
  # @param val 設定値を指定します。
  # @raise WIN32OLERuntimeError selfが配列型です。あるいは、型変換に失敗し
  #                             ました。
  # 
  #    obj = WIN32OLE_VARIANT.new(1) # VARIANT型にWIN32OLE::VARIANT::VT_I4を設定
  #    obj.value = 3.2      # 3.2から新たなVARIANT型を作成し、それをVT_I4に変換
  #    p obj.value # => 3   # VT_I4に変換した結果が設定される
  # 
  # selfが配列型のWIN32OLE_VARIANTの場合、バイト配列かつ引数が文字列の場合
  # を除いて[[c:WIN32OLERuntimeError]]を通知します。配列型の場合は、
  # [[m:WIN32OLE_VARIANT#[]=]]を利用してください。
  def value=; end

  # --- vartype -> Integer
  # selfの型情報を取得します。
  # 
  # 型情報は、[[c:WIN32OLE::VARIANT]]の定数値の組み合わせです。
  # 
  #    obj = WIN32OLE_VARIANT.new("string")
  #    obj.vartype   # => 8 (WIN32OLE::VARIANT::VT_BSTR)
  #    bytes = WIN32OLE_VARIANT.new([1,2,3,4,5], VT_UI1 | VT_ARRAY)
  #    bytes.vartype # => 8209 (WIN32OLE::VARIANT::VT_ARRAY | VT_UI1)
  def vartype; end

  # --- array(dims, vt) -> WIN32OLE_VARIANT
  # 配列用のVARIANTオブジェクトを生成します。
  # 
  # オートメーションメソッド呼び出し用の配列を生成します。なお、OLEオートメー
  # ションの配列の次元と添え字の関係はVB型だという点に注意してください。こ
  # れはCと逆順の並びです。
  # 
  # @param dims 各次元の要素数を示す配列を与えます。たとえば4要素のベクター
  #             であれば[4]、各3要素の2次元配列であれば[3, 3]とします。
  # @param vt 配列要素の型を[[c:WIN32OLE::VARIANT]]の定数で指定します。
  # @return 指定された次元/要素数を持つWIN32OLE_VARIANTオブジェクト。
  # 
  # 次の例は、最初の次元が3要素、次の次元が4要素の2次元配列を生成する例です。
  # 
  #    ole_ary = WIN32OLE_VARIANT.array([3,4], WIN32OLE::VARIANT::VT_I4)
  #    ruby_ary = ole_ary.value # => [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
  # 
  # @see [[m:WIN32OLE_VARIANT#value]], [[c:WIN32OLE::VARIANT]]
  def array; end

  # --- new(val, vartype = nil) -> WIN32OLE_VARIANT
  # 指定したオブジェクトを値とするWIN32OLE_VARIANTオブジェクトを生成します。
  # 
  # @param val ラップするRubyオブジェクトを指定します。
  # @param vartype 省略時はWIN32OLEが自動型変換を行います。指定する場合は
  #                [[c:WIN32OLE::VARIANT]]の定数を指定してください。
  # @return val引数を値として持つWIN32OLE_VARIANTオブジェクトを返します。
  # 
  # @raise TypeError val引数の型がArray、String、Integer、Float、Time、
  #                  WIN32OLE、WIN32OLE_VARIANT、TrueClass、FalseClass、
  #                  NilClass のいずれでもありません。
  # 
  #    shell = WIN32OLE.new('Shell.Application')
  #    folder = shell.NameSpace('C:\\Users\\Public\\Documents')
  #    item = folder.ParseName('test.txt')
  #    v = WIN32OLE_VARIANT.new('Delete')
  #    item.invokeVerb(v)     # => ゴミ箱への移動ダイアログを表示
  # 
  # バイト配列を生成するには、以下のようにvartype引数にVT_UI1 | VT_ARRAYを
  # 設定します。バイト配列の値のRuby表現はエンコーディングをASCII-8BITに設
  # 定した文字列となります。
  # 
  #    include WIN32OLE::VARIANT
  #    bytes = WIN32OLE_VARIANT.new([1,2,3,4,5], VT_UI1 | VT_ARRAY)
  #    bytes.value          #=> "\x01\x02\x03\x04\x05"
  #    bytes.value.encoding #=> #<Encoding:ASCII-8BIT>
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def new; end

  # --- Empty -> WIN32OLE_VARIANT
  # EMPTY型のWIN32OLE_VARIANTオブジェクトです。
  # 
  # このオブジェクトは、VOID型の戻り値や、値が空なことを明示しなければなら
  # ない特殊な引数に利用します。
  # 
  # @see [[m:WIN32OLE::VARIANT::VT_EMPTY]]
  def Empty; end

  # --- Nothing -> WIN32OLE_VARIANT
  # DISPATCH型の空のオブジェクトです。
  # 
  # @see [[m:WIN32OLE::VARIANT::VT_DISPATCH]]
  def Nothing; end

  # --- Null -> WIN32OLE_VARIANT
  # NULL型のWIN32OLE_VARIANTオブジェクトです。
  # 
  # このオブジェクトは、ADOなどのデータベースインターフェイスでNULLを指定す
  # るのに利用可能です。
  # 
  # @see [[m:WIN32OLE::VARIANT::VT_NULL]]
  def Null; end

end
