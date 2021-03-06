class WIN32OLE_VARIABLE
  # --- name -> String
  # --- to_s -> String
  # 
  # 変数名を取得します。
  # 
  # @return 変数名を文字列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    variables = tobj.variables
  #    variables.each do |variable|
  #      puts "#{variable.name}"   # => xlChart, xlDialogSheet, ...
  #    end
  def name; end

  # --- ole_type -> String
  # 
  # 変数の型を取得します。
  # 
  # @return 変数の型名を文字列で返します。型名を文字列に変換できない場合は、
  #        「Unknown Type nn」（nnはバリアント型を示す数値）の形式の文字列
  #         を返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #   variables = tobj.variables
  #   variables.each do |variable|
  #     puts "#{variable.ole_type} #{variable.name}"
  #   end
  # 
  # OLEオートメーションの型名は、対応する[[c:WIN32OLE::VARIANT]]の定数の先
  # 頭の「VT_」を削除した名称を持ちます。
  def ole_type; end

  # --- ole_type_detail -> [String]
  # 
  # 変数の型と属性を取得します。
  # 
  # @return 変数の型と属性を文字列配列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft XML, v5.0', 'tagSTATSTG')
  #    tobj.variables.each do |v|
  #      puts "#{v.ole_type} [#{v.ole_type_detail.join(', ')}] #{v.name}"
  #    end
  # 
  # 出力結果
  # 
  #  Unknown Type 31 [] pwcsName   # => VT_LPWSTR はWIN32OLE::VARIANTで未定義なので変換できない
  #  UI4 [UI4] type
  #  _ULARGE_INTEGER [USERDEFINED, _ULARGE_INTEGER] cbSize
  #  _FILETIME [USERDEFINED, _FILETIME] mtime
  #  _FILETIME [USERDEFINED, _FILETIME] ctime
  #  _FILETIME [USERDEFINED, _FILETIME] atime
  #  UI4 [UI4] grfMode
  #  UI4 [UI4] grfLocksSupported
  #  GUID [USERDEFINED, GUID] clsid
  #  UI4 [UI4] grfStateBits
  #  UI4 [UI4] reserved
  # 
  # 上例のように、WIN32OLE_VARIABLEで取得できる変数あるいはその元となる構造
  # 体は、必ずしもOLEオートメーション互換データというわけではありません。こ
  # のようなデータはWIN32OLEからは利用できません。
  def ole_type_detail; end

  # --- value -> object | nil
  # 変数の値を取得します。
  # 
  # 変数情報によってはenum値のように定数値を持つものがあります。valueメソッ
  # ドはこのような定数値を返します。
  # 
  # @return この変数が持つ定数値。値を持たない場合はnilを返します。
  # 
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    variables = tobj.variables
  #    variables.each do |variable|
  #      puts "#{variable.name}=#{variable.value}"
  #    end
  # 
  # 実行結果は以下となります。
  # 
  #  xlChart=-4109
  #  xlDialogSheet=-4116
  #  xlExcel4IntlMacroSheet=4
  #  xlExcel4MacroSheet=3
  #  xlWorksheet=-4167
  def value; end

  # --- variable_kind -> String
  # 変数の種類（VARKIND）を取得します。
  # 
  # この変数の種類を示す文字列を返します。
  # 
  # @return VARKINDに対応する文字列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    puts tobj.variables.map {|v| v.variable_kind}.uniq # => CONSTANT
  # 
  # 返送値は以下のいずれかとなります。
  # 
  # : PERINSTANCE
  #   インスタンス毎の変数。構造体やユーザ定義体のフィールド。(0)
  # : STATIC
  #   クラスの静的変数。(1)
  # : CONSTANT
  #   定数。enumやモジュールのメンバ。(2)
  # : DISPATCH
  #   変数アクセスにオートメーションを利用。旧型式のプロパティ。(3)
  # 
  # @see [[m:WIN32OLE_VARIABLE#varkind]]
  def variable_kind; end

  # --- varkind -> Integer
  # 変数の種類（VARKIND）を取得します。
  # 
  # この変数の種類を示す数値を返します。
  # 
  # @return VARKINDに対応する数値を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    puts tobj.variables.map {|v| v.varkind}.uniq # => 2
  # 
  # 数値の意味については、[[m:WIN32OLE_VARIABLE#variable_kind]]の説明を参照してください。
  def varkind; end

  # --- visible? -> bool
  # 
  # 変数の可視性を取得します。
  # 
  # @return publicアクセス可能であれば真を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    puts tobj.variables.map {|v| v.visible?}.uniq # => true
  def visible?; end

end
