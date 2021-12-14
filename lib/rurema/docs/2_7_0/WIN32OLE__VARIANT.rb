module WIN32OLE::VARIANT
  # --- VT_ARRAY -> Integer
  # 配列（SafeArray）を示します（0x2000）。
  def VT_ARRAY; end

  # --- VT_BOOL -> Integer
  # 真偽値を示します（11）。
  def VT_BOOL; end

  # --- VT_BSTR -> Integer
  # 文字列（BSTR）を示します（8）。
  # 
  # OLEオートメーションのBSTRはUnicodeで表現された長さ付き文字列です。Ruby
  # のStringとBSTRの相互変換は、WIN32OLEが[[m:WIN32OLE#codepage]]に基づいて
  # 自動的に行います。
  def VT_BSTR; end

  # --- VT_BYREF -> Integer
  # 参照を示します（0x4000）。
  # 
  # VT_BYREFは型ではなく、参照を示す型属性です。OLEオートメーションサーバが
  # 結果を引数に戻す場合、参照先の型を示す値と論理和を取るために利用します。
  def VT_BYREF; end

  # --- VT_CY -> Integer
  # 通貨型（CURRENCY）を示します（6）。
  # 
  # OLEオートメーションのCURRENCY型は、符号付き64ビット整数を10進表記した時
  # の下4桁を小数点以下とすることで、加減算について誤差を生じさせない小数点
  # 数を表現します。
  # 
  # CURRENCY型の有効範囲は-922337203685477.5808から922337203685477.5807です。
  # 
  # WIN32OLEはオートメーション呼び出しの返り値がCURRENCY型の場合、文字列に
  # 変換します。
  def VT_CY; end

  # --- VT_DATE -> Integer
  # 日付型（DATE）を示します（7）。
  # 
  # OLEオートメーションのDATE型は、1899年12月30日0時00分からの日時を示す64
  # ビット浮動小数点数型です。
  # 
  # WIN32OLEは、RubyのTime型と自動的に変換します。
  def VT_DATE; end

  # --- VT_DISPATCH -> Integer
  # OLEオートメーションオブジェクトを示します（9）。
  # 
  # RubyのオブジェクトをOLEオートメーションサーバへ与える場合に利用します。
  def VT_DISPATCH; end

  # --- VT_EMPTY -> Integer
  # 空（初期化状態）のオブジェクトを示します（0）。
  def VT_EMPTY; end

  # --- VT_ERROR -> Integer
  # HRESULTを示します（10）。
  # 
  # HRESULTは、COMを含むWindowsのサービスがアプリケーションへ通知する統一的
  # なエラーコードです。
  # 
  # HRESULT: [[url:http://msdn.microsoft.com/en-us/library/cc704587(v=PROT.10).aspx]]
  def VT_ERROR; end

  # --- VT_I1 -> Integer
  # 符号付き8ビット整数（char）を示します（16）。
  # 
  # OLEオートメーションの仕様上は利用できません。
  def VT_I1; end

  # --- VT_I2 -> Integer
  # 符号付き16ビット整数（short）を示します（2）。
  def VT_I2; end

  # --- VT_I4 -> Integer
  # 符号付き32ビット整数（int）を示します（3）。
  def VT_I4; end

  # --- VT_INT -> Integer
  # 符号付き整数（int）を示します（22）。
  def VT_INT; end

  # --- VT_NULL -> Integer
  # NULL型の値を示します（1）。
  # 
  # [[m:WIN32OLE::VARIANT.VT_EMPTY]]と異なり、NULLという値（たとえばSQLパラ
  # メータでNULLを指定する場合など）を示します。
  def VT_NULL; end

  # --- VT_PTR -> Integer
  # ポインタ型を示します（26）。
  # 
  # VT_PTRは、VOID*に相当するため、OLEオートメーションでは利用できません。
  def VT_PTR; end

  # --- VT_R4 -> Integer
  # 単精度浮動小数点数を示します（4）。
  def VT_R4; end

  # --- VT_R8 -> Integer
  # 倍精度浮動小数点数を示します（5）。
  def VT_R8; end

  # --- VT_UI1 -> Integer
  # 符号なし8ビット整数（unsigned char）を示します（17）。
  def VT_UI1; end

  # --- VT_UI2 -> Integer
  # 符号なし16ビット整数（unsigned short）を示します（18）。
  # 
  # OLEオートメーションでは利用できません。代わりにVT_I2を利用してください。
  def VT_UI2; end

  # --- VT_UI4 -> Integer
  # 符号なし32ビット整数（unsigned int）を示します（19）。
  # 
  # OLEオートメーションでは利用できません。代わりにVT_I4を利用してください。
  def VT_UI4; end

  # --- VT_UINT -> Integer
  # 符号なし整数（unsigned int）を示します（23）。
  # 
  # OLEオートメーションでは利用できません。代わりにVT_I4を利用してください。
  def VT_UINT; end

  # --- VT_UNKNOWN -> Integer
  # COMインターフェイスを示します（13）。
  def VT_UNKNOWN; end

  # --- VT_USERDEFINED -> Integer
  # ユーザ定義型を示します（29）。
  # 
  # OLEオートメーションでは利用できません。代わりにVT_I4を利用してください。
  def VT_USERDEFINED; end

  # --- VT_VARIANT -> Integer
  # VARIANT型を示します（12）。
  def VT_VARIANT; end

end
