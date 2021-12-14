class WIN32OLE_METHOD
  # --- dispid -> Integer
  # メソッドのディスパッチID（DISPID）を取得します。
  # 
  # ディスパッチIDはメソッドの一意識別子です。WIN32OLEでは、
  # [[m:WIN32OLE#_invoke]]などのメソッドで、呼び出すサーバのメソッドを指定
  # するのに利用します。
  # 
  # @return メソッドのDISPIDを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.dispid # => 181
  # 
  # @see [[m:WIN32OLE#_invoke]], [[m:WIN32OLE#_getproperty]],
  #      [[m:WIN32OLE#_setproperty]]
  def dispid; end

  # --- event? -> bool
  # メソッドがイベントかどうかを取得します。
  # 
  # イベントとはこのサーバが実装しているメソッドではなく、クライアント側が
  # サーバ側の通知を受けるために実装するメソッドです。
  # 
  # @return メソッドがイベントであれば真。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SheetActivate')
  #    puts method.event? # => true
  # 
  # @see [[c:WIN32OLE_EVENT]]
  def event?; end

  # --- event_interface -> String | nil
  # メソッドがイベントの場合、イベントのインターフェイス名を取得します。
  # 
  # @return メソッドがイベントであれば、イベントのインターフェイス名を返し
  #         ます。イベントでなければnilを返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #   method = WIN32OLE_METHOD.new(tobj, 'SheetActivate')
  #   puts method.event_interface # =>  WorkbookEvents
  def event_interface; end

  # --- helpcontext -> Integer | nil
  # メソッドのヘルプコンテキストを取得します。
  # 
  # ヘルプコンテキストは、関連するヘルプファイル上のトピック位置を示す整数
  # 値です。
  # 
  # @return ヘルプコンテキストを返します。未定義の場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.helpcontext # => 65717
  # 
  # WIN32OLE_METHODオブジェクトを引数として、[[m:WIN32OLE.ole_show_help]]で
  # ヘルプファイルを表示する場合には、WIN32OLEが内部で当メソッドを呼び出し
  # ます。
  # 
  # @see [[m:WIN32OLE.ole_show_help]]
  def helpcontext; end

  # --- helpfile -> String | nil
  # ヘルプファイルのパス名を取得します。
  # 
  # メソッドにヘルプファイルが関連付けられている場合、該当ヘルプファイルの
  # パス名を返します。
  # 
  # @return ヘルプファイルのパス名を文字列で返します。ヘルプファイルが未定
  #         義ならばnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.helpfile # => C:\...\VBAXL9.CHM
  # 
  # メソッドにヘルプファイルが関連付けられている場合、[[m:WIN32OLE.ole_show_help]]にWIN32OLE_METHODオブジェクトを与えてヘルプファイルを表示できます。
  # 
  # @see [[m:WIN32OLE.ole_show_help]]
  def helpfile; end

  # --- helpstring -> String | nil
  # メソッドのヘルプ文字列を取得します。
  # 
  # helpstringは、IDEがメソッドのバルーンヘルプを表示するような場合に利用可
  # 能な、1行程度でメソッドを説明する文字列です。
  # 
  # @return ヘルプ文字列を返します。未定義ならばnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'IWebBrowser')
  #    method = WIN32OLE_METHOD.new(tobj, 'Navigate')
  #    puts method.helpstring # => Navigates to a URL or file.
  def helpstring; end

  # --- invkind -> Integer
  # メソッドの種類を示すINVOKEKIND列挙値を取得します。
  # 
  # ここで言うメソッドの種類というのは、OLEオートメーションクライアントの記
  # 述言語がどのような形式でサーバ呼び出しを記述すべきかを指定した属性値で
  # す。
  # 
  # @return メソッドのINVOKEKINDを返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #   method = WIN32OLE_METHOD.new(tobj, 'Add')
  #   puts method.invkind # => 1
  # 
  # INVOKEKIND列挙値は以下の通りです。メソッドの種類は以下の値の論理和で示
  # されます。
  # 
  # : INVOKE_FUNC(1)
  #   関数呼び出し形式で記述するメソッドです。
  # : INVOKE_PROPERTYGET(2)
  #   プロパティ参照形式で記述するメソッドです。
  # : INVOKE_PROPERTYPUT(4)
  #   プロパティに値を設定する形式で記述するメソッドです。
  # : INVOKE_PROPERTYPUTREF(8)
  #   プロパティに参照を設定する形式で記述するメソッドです。
  # 
  # なおINVOKE_PROPERTYPUTREFとINVOKE_PROPERTYPUTは、プロパティ設定形式が2
  # 種類ある言語用の区分です。Rubyでの記述時はどちらも「prop=(arg)」の形式
  # で記述します。
  def invkind; end

  # --- invoke_kind -> String
  # メソッドの種類を文字列で取得します。
  # 
  # ここで言うメソッドの種類というのは、OLEオートメーションクライアントの記
  # 述言語がどのような形式でサーバ呼び出しを記述すべきかを指定した属性値で
  # す。
  # 
  # @return メソッドの種類を示す文字列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.invoke_kind # => "FUNC"
  # 
  # 返送値は以下のいずれかとなります。値の意味は
  # [[m:WIN32OLE_METHOD#invkind]]の説明を参照してください。
  # 
  # : PORPERTY
  #   INVOKE_PROPETYGETとINVOKE_PROPETYPUTの両方が設定されています。
  # : PROPERTYGET
  #   INVOKE_PROPETYGETが設定されています。
  # : PROPERTYPUT
  #   INVOKE_PROPERTYPUTが設定されています。
  # : PROPERTYPUTREF
  #   INVOKE_PROPERTYPUTREFが設定されています。
  # : FUNC
  #   INVOKE_FUNCが設定されています。
  # : UNKNOWN
  #   上記のいずれにも当てはまりません。
  # 
  # @see [[m:WIN32OLE_METHOD#invkind]]
  def invoke_kind; end

  # --- name -> String
  # --- to_s -> String
  # メソッド名を取得します。
  # 
  # @return メソッド名を文字列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    puts method.name # => SaveAs
  def name; end

  # --- offset_vtbl -> Integer
  # このメソッドのVTBLのオフセットを取得します。
  # 
  # VTBLはC++やCでメソッドを呼び出すために利用する関数ポインタのテーブルです。
  # 
  # @return メソッドのVTBL上のオフセットを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.offset_vtbl # => 40
  def offset_vtbl; end

  # --- params -> [WIN32OLE_PARAM]
  # メソッドのパラメータ情報を取得します。
  # 
  # このメソッドのパラメータを[[c:WIN32OLE_PARAM]]の配列として返します。配
  # 列の最初の要素が最左端のパラメータに対応します。
  # 
  # @return [[c:WIN32OLE_PARAM]]の配列。無引数のメソッドであれば要素数0の配
  #         列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    p method.params # => [Filename, FileFormat, Password, WriteResPassword,
  #                          ReadOnlyRecommended, CreateBackup, AccessMode,
  #                          ConflictResolution, AddToMru, TextCodepage,
  #                          TextVisualLayout]
  def params; end

  # --- return_type -> String
  # メソッドの返り値の型名を取得します。
  # 
  # @return 返り値の型名を示す文字列を返します。
  # @raise WIN32OLERuntimeError メソッドの型情報を取得できなかった場合に通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #    method = WIN32OLE_METHOD.new(tobj, 'Visible')
  #    puts method.return_type # => BOOL
  # 
  # OLEオートメーションの型名は、対応する[[c:WIN32OLE::VARIANT]]の定数の先
  # 頭の「VT_」を削除した名称を持ちます。
  # 
  # たとえば、32ビット符号付き整数であれば「I4」となります。
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def return_type; end

  # --- return_type_detail -> [String]
  # 返り値の型と属性を取得します。
  # 
  # @return 返り値の型と属性を文字列配列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #    method = WIN32OLE_METHOD.new(tobj, 'Workbooks')
  #    p method.return_type_detail # => ["PTR", "USERDEFINED", "Workbooks"]
  # 
  # 属性が付加されていない場合は、[[m:WIN32OLE_METHOD#return_type]]を要素と
  # した配列が返ります。
  # 
  # 返り値の取り得る属性値はCOMのIDL（インターフェイス定義言語）によって規
  # 定されています。
  # 
  # @see [[url:http://msdn.microsoft.com/en-us/library/aa367042(VS.85).aspx]]
  def return_type_detail; end

  # --- return_vtype -> Integer
  # メソッドの返り値の型を示す数値を取得します。
  # 
  # @return 返り値の型を示す数値（VARENUM）を返します。
  # @raise WIN32OLERuntimeError メソッドの型情報を取得できなかった場合に通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #    method = WIN32OLE_METHOD.new(tobj, 'Visible')
  #    puts method.return_vtype # => 11
  # 
  # VARENUMの定義は、Platform SDKのwtypes.hにあります。
  def return_vtype; end

  # --- size_opt_params -> Integer | nil
  # オプションパラメータ数を取得します。
  # 
  # @return オプションパラメータ数を整数で返します。メソッドの詳細情報を取
  #         得できない場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    puts method.size_opt_params # => 5
  def size_opt_params; end

  # --- size_params -> Integer | nil
  # パラメータ数を取得します。
  # 
  # @return パラメータ数を整数で返します。メソッドの詳細情報を取得できない
  #         場合はnilを返します。
  # 
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  #    puts method.size_params # => 12
  def size_params; end

  # --- visible? -> bool
  # 
  # このメソッドがクライアントに対して公開されているか（可視性を持つか）ど
  # うかを返します。
  # 
  # @return メソッドが公開されていれば真。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbooks')
  #    method = WIN32OLE_METHOD.new(tobj, 'Add')
  #    puts method.visible? # => true
  def visible?; end

  # --- new(ole_type,  method) -> WIN32OLE_METHOD
  # [[c:WIN32OLE_TYPE]]とメソッド名を指定してWIN32OLE_METHODのインスタンス
  # を生成します。
  # 
  # OLEオートメーションサーバの型情報とメソッド名からWIN32OLE_METHODのイン
  # スタンスを生成します。
  # 
  # アプリケーションプログラムでは、WIN32OLE_METHODオブジェクトをnewメソッ
  # ドで生成するよりも、[[m:WIN32OLE#ole_method]]などのメソッドを参照するほ
  # うが簡単です。
  # 
  # @param ole_type [[c:WIN32OLE_TYPE]]のインスタンス。
  # @param method メソッド名を文字列で指定します。
  # @return methodパラメータに対応するWIN32OLE_METHODのインスタンス。
  # @raise WIN32OLERuntimeError methodパラメータで指定したメソッドが見つかりません。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Workbook')
  #    method = WIN32OLE_METHOD.new(tobj, 'SaveAs')
  def new; end

end
