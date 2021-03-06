class WIN32OLE_PARAM
  # --- default -> object | nil
  # パラメータを指定しなかった場合の既定値を取得します。
  # 
  # 当パラメータが必須パラメータの場合はnilを返します。
  # 
  # @return パラメータを指定しなかった場合の既定値。必須パラメータならばnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    method.params.each do |param|
  #      if param.default
  #        puts "#{param.name} (= #{param.default})"
  #      else
  #        puts "#{param}"
  #      end
  #    end
  def default; end

  # --- input? -> bool
  # パラメータがクライアントからサーバへ与えるものかを判定します。
  # 
  # OLEオートメーションのパラメータは、in(クライアントからサーバへ与える。
  # [[m:WIN32OLE_PARAM#input?]]が真)、out（サーバがクライアントへ与える。
  # [[m:WIN32OLE_PARAM#output?]]が真)および、inout（クライアントからサーバ
  # へ与え、サーバがクライアントへ与える）の3種類の方向属性のいずれかを持ち
  # ます。
  # 
  # input?メソッドはin属性またはinout属性なら真を返します。
  # 
  # @return メソッドの方向属性がinまたはinoutならば真を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    param1 = method.params[0]
  #    puts param1.input? # => true
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/library/aa367051(v=VS.85).aspx]]
  def input?; end

  # --- name -> String
  # --- to_s -> String
  # パラメータ名を取得します。
  # 
  # @return パラメータ名を返します。名前付き引数形式でメソッドを呼び出すときに指定します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    param1 = method.params[0]
  #    puts param1.name # => Filename
  def name; end

  # --- ole_type -> String
  # パラメータの型名を取得します。
  # 
  # @return パラメータの型名を示す文字列を返します。
  #         パラメータの型情報が見つからない場合は、"unknown type"を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    param1 = method.params[0]
  #    puts param1.ole_type # => VARIANT
  # 
  # OLEオートメーションの型名は、対応する[[c:WIN32OLE::VARIANT]]の定数の先
  # 頭の「VT_」を削除した名称を持ちます。
  # 
  # たとえば、32ビット符号付き整数であれば「I4」となります。
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def ole_type; end

  # --- ole_type_detail -> [String]
  # パラメータの属性を取得します。
  # 
  # @return 型の属性を文字列配列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'IWorksheetFunction')
  #    method = WIN32OLE_METHOD.new(tobj, 'SumIf')
  #    param1 = method.params[0]
  #    p param1.ole_type_detail # => ["PTR", "USERDEFINED", "Range"]
  # 
  # パラメータの取り得る属性値はCOMのIDL（インターフェイス定義言語）によって規定されています。
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/library/aa367042(VS.85).aspx]]
  def ole_type_detail; end

  # --- optional? -> bool
  # パラメータがオプションかどうかを取得します。
  # 
  # @return パラメータがオプション（省略可能）であれば真を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 9.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    param1 = method.params[0]
  #    puts "#{param1.name} #{param1.optional?}" # => Filename true
  def optional?; end

  # --- output? -> bool
  # パラメータがクライアントからの結果を受け取るためのものかを判定します。
  # 
  # OLEオートメーションのパラメータは、in(クライアントからサーバへ与える。
  # [[m:WIN32OLE_PARAM#input?]]が真)、out（サーバがクライアントへ与える。
  # [[m:WIN32OLE_PARAM#output?]]が真)および、inout（クライアントからサーバ
  # へ与え、サーバがクライアントへ与える）の3種類の方向属性のいずれかを持ち
  # ます。
  # 
  # output?メソッドはout属性またはinout属性なら真を返します。
  # 
  # @return メソッドの方向属性がoutまたはinoutならば真を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'DWebBrowserEvents')
  #    method = WIN32OLE_METHOD.new(tobj, 'NewWindow')
  #    method.params.each do |param|
  #      puts "#{param.name} #{param.output?}"
  #    end
  # 
  #    The result of above script is following:
  #      URL false
  #      Flags false
  #      TargetFrameName false
  #      PostData false
  #      Headers false
  #      Processed true
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/library/aa367136(v=VS.85).aspx]]
  def output?; end

  # --- retval? -> bool
  # パラメータが戻り値かどうかを判定します。
  # 
  # OLEオートメーションの規定では、メソッドの戻り値は引数リストの最右端のパ
  # ラメータをout属性（[[m:WIN32OLE_PARAM#output?]]が真）とすることで実現し
  # ます。ただし、そのパラメータをOLEオートメーション呼び出しを記述する言語
  # が戻り値のように扱うか、それとも引数リストに並べるかはretval属性によっ
  # て決定されます。
  # 
  # retval?メソッドは、戻り値として記述する場合に真となります。
  # 
  # @return パラメータが戻り値として扱われる場合に真を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('DirectX 7 for Visual Basic Type Library',
  #                             'DirectPlayLobbyConnection')
  #    method = WIN32OLE_METHOD.new(tobj, 'GetPlayerShortName')
  #    param = method.params[0]
  #    puts "#{param.name} #{param.retval?}"  # => name true
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/library/aa367158(v=VS.85).aspx]]
  def retval?; end

  # --- new(ole_method,  index) -> WIN32OLE_PARAM
  # 
  # メソッドとパラメータ位置を指定してWIN32OLE_PARAMのインスタンスを作成します。
  # 
  # アプリケーションプログラムでは、WIN32OLE_PARAMオブジェクトをnewメソッド
  # で生成するよりも、[[m:WIN32OLE_METHOD#params]]を参照するほうが簡単です。
  # 
  # @param ole_method パラメータを取得する[[c:WIN32OLE_METHOD]]のインスタンス。
  # @param index パラメータの位置。最左端を1とします。
  # @return メソッドの指定位置のパラメータの情報を持つオブジェクトを返します。
  # @raise TypeError ole_methodパラメータが[[c:WIN32OLE_METHOD]]のインスタンスではありません。
  # @raise IndexError indexパラメータが1からパラメータの数の範囲にありません。
  # @raise RuntimeError 該当メソッドのメタデータが取得できません。
  # 
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    method = excel.ole_method('Run')
  #    param1 = WIN32OLE_PARAM.new(method, 1)
  #    puts "#{param1.ole_type} #{param1.name}"
  def new; end

end
