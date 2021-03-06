class WIN32OLE
  # --- [](key...) -> object
  # オブジェクトのデフォルトプロパティを参照します。
  # 
  # OLEオートメーションにはデフォルトプロパティというプロパティ名を指定せず
  # にアクセスできるプロパティがあります。
  # 
  # WIN32OLEからデフォルトプロパティにアクセスするには、[]内に必要なキーを
  # 「,」で区切って記述します。シンボルは文字列として扱います。
  # 
  # なおデフォルトプロパティは記述が省略できるプロパティ名に意味がないため、
  # OLEオートメーション規約ではItemと命名することが決められています。
  # 
  # @param key プロパティでアクセスする情報を特定するキーを指定します。プロ
  #            パティの特定に複数のキーが必要な場合は「,」で区切って列記します。
  # 
  # @return プロパティ値を返します。
  # 
  #   fsys = WIN32OLE.new('Scripting.FileSystemObject')
  #   fsys.Drives[:c].FreeSpace #=> Cドライブの空き容量
  def []; end

  # --- []=(key..., value) -> ()
  # オブジェクトのデフォルトプロパティを設定します。
  # 
  # OLEオートメーションにはデフォルトプロパティというプロパティ名を指定せず
  # にアクセスできるプロパティがあります。
  # 
  # WIN32OLEからデフォルトプロパティにアクセスするには、[]内に必要なキーを
  # 記述します。
  # 
  # なおデフォルトプロパティは記述が省略できるプロパティ名には意味がありま
  # せん。このためOLEオートメーション規約では一律にItemと命名することが決め
  # られています。
  # 
  # @param key プロパティでアクセスする情報を特定するキーを指定します。プロ
  #            パティの特定に複数のキーが必要な場合は「,」で区切って列記し
  #            ます。
  # 
  # @param value プロパティに設定する値を指定します。
  # 
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #   dict = WIN32OLE.new('Scripting.Dictionary')
  #   dict[:a] = 0x41
  #   dict[:b] = 0x42
  #   dict[:a] #=> 65
  #   dict[:b] #=> 66
  def []=; end

  # --- _getproperty(dispid, args, types) -> object
  # DISPIDとパラメータの型を指定してオブジェクトのプロパティを参照します。
  # 
  # アクセスするプロパティのインターフェイスを事前に知っている場合に、
  # DISPIDとパラメータの型を指定してプロパティを参照します。
  # 
  # @param dispid プロパティのDISPID（メソッドを一意に特定する数値）を指定
  #               します。
  # 
  # @param args プロパティが引数を取る場合に配列で指定します。引数の順序は
  #             最左端の引数のインデックスを0とします。引数が不要な場合は空
  #             配列を指定します。
  # 
  # @param types プロパティが引数を取る場合に配列で引数の型を指定します。引
  #              数の順序は最左端の引数のインデックスを0とします。型の指定
  #              には、[[c:WIN32OLE::VARIANT]]の定数を利用します。引数が不
  #              要な場合は空配列を指定します。
  # 
  # このメソッドはCOMアーリーバインディングを利用することで外部プロセスサー
  # バとのラウンドトリップを減らして処理速度を向上させることを目的としたも
  # のです。このため、DLLの形式で型情報（TypeLib）を提供しているサーバに対
  # してはあまり意味を持ちません。
  # 
  # @return プロパティ値を返します。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #    DISPID_CELLS = 238
  #    include WIN32OLE::VARIANT
  #    excel = WIN32OLE.new('Excel.Application')
  #    puts excel._getproperty(558, [], []) # VisibleプロパティのDISPIDは558
  #    workbook = excel.Workbooks.Add
  #    sheet = workbook.Worksheets[1]
  #    sheet._setproperty(DISPID_CELLS, [1, 2, 'hello'], [VT_I2, VT_I2, VT_BSTR])
  #    puts sheet._getproperty(DISPID_CELLS, [1, 2], [VT_I2, VT_I2]).value  #=> 'hello'
  #    workbook.Close(:SaveChanges => false)
  #    excel.Quit
  # 
  # DISPIDは[[m:WIN32OLE_METHOD#dispid]]から取得できます。
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def _getproperty; end

  # --- _invoke(dispid, args, types) -> object | nil
  # DISPIDとパラメータの型を指定してオブジェクトのメソッドを呼び出します。
  # 
  # 呼び出すメソッドのインターフェイスを事前に知っている場合に、DISPIDとパ
  # ラメータの型を指定してメソッドを呼び出します。
  # 
  # このメソッドは引数の変換方法をプログラマが制御できるようにすることと、
  # COMアーリーバインディングを利用して外部プロセスサーバとのラウンドトリッ
  # プを減らして処理速度を向上させることを目的としたものです。後者の目的に
  # ついては、DLLの形式で型情報（TypeLib）を提供しているサーバに対してはあ
  # まり意味を持ちません。そのため、型の高精度な制御が不要な場合は、直接メ
  # ソッド名を指定したメソッド呼び出しを行うことを、プログラムの可読性の点
  # から推奨します。
  # 
  # @param dispid メソッドのDISPID（メソッドを一意に特定する数値）を指定し
  #               ます。
  # 
  # @param args メソッドの引数を配列で指定します。引数の順序は最左端の引数
  #             のインデックスを0とします。引数が不要な場合は空配列を指定し
  #             ます。
  # 
  # @param types メソッドの引数の型を配列で指定します。引数の順序は最左端の
  #              引数のインデックスを0とします。型の指定には、
  #              [[c:WIN32OLE::VARIANT]]の定数を利用します。引数が不要な場
  #              合は空配列を指定します。
  # 
  # @return メソッドの返り値。ただし返り値を持たないメソッドの場合はnil。
  # 
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    excel._invoke(302, [], []) #  DISPID 302は、Quitメソッド
  # 
  # MFCの制約により、バイト配列の型情報は通常
  # [[m:WIN32OLE::VARIANT::VT_VARIANT]]となります。このような場合に、バイト
  # 配列を与えるつもりで
  # 
  #  include WIN32OLE::VARIANT
  #  obj.method(DISPID, [[0, 1, 2, 3]], [VT_VARIANT])
  # 
  # のように記述すると、単に32ビット整数（VT_I4）の配列が送られることになり
  # 空間効率が低下します。
  # 
  # 引数の最終的な型がわかっている場合は、下記の例のように型指定パラメータ
  # には実際の型を指定してください。
  # 
  #  include WIN32OLE::VARIANT
  #  obj.method(DISPID, [[0, 1, 2, 3]], [VT_BYREF | VT_ARRAY | VT_UI1])
  # 
  # なお、VB6で作成したCOMコンポーネントのパラメータに配列を与える場合は、
  # [[m:WIN32OLE::VARIANT::VT_BYREF]]の指定が必須です。
  # 
  # DISPIDは[[m:WIN32OLE_METHOD#dispid]]から取得できます。
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def _invoke; end

  # --- _setproperty(dispid, args, types) -> ()
  # DISPIDとパラメータの型を指定してオブジェクトのプロパティを設定します。
  # 
  # アクセスするプロパティのインターフェイスを事前に知っている場合に、
  # DISPIDとパラメータの型を指定してプロパティを設定します。
  # 
  # このメソッドはCOMアーリーバインディングを利用することで外部プロセスサー
  # バとのラウンドトリップを減らして処理速度を向上させることを目的としたも
  # のです。このため、DLLの形式で型情報（TypeLib）を提供しているサーバに対
  # してはあまり意味を持ちません。
  # 
  # @param dispid プロパティのDISPID（メソッドを一意に特定する数値）を指定
  #               します。
  # 
  # @param args 引数を配列で指定します。引数の順序は最左端の引数のインデッ
  #             クスを0とします。プロパティに対する設定値は最右端の要素です。
  # 
  # @param types プロパティの引数の型を配列で指定します。引数の順序は最左端
  #              の引数のインデックスを0とします。型の指定には、
  #              [[c:WIN32OLE::VARIANT]]の定数を利用します。
  # 
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #    DISPID_CELLS = 238
  #    include WIN32OLE::VARIANT
  #    excel = WIN32OLE.new('Excel.Application')
  #    puts excel._setproperty(558,      # VisibleプロパティのDISPIDは558
  #                           [true], [VT_BOOL])
  #    workbook = excel.Workbooks.Add
  #    sheet = workbook.Worksheets[1]
  #    sheet._setproperty(DISPID_CELLS, [1, 2, 'hello'], [VT_I2, VT_I2, VT_BSTR])
  #    puts sheet._getproperty(DISPID_CELLS, [1, 2], [VT_I2, VT_I2]).value  #=> 'hello'
  #    workbook.Close(:SaveChanges => false)
  #    excel.Quit
  # 
  # DISPIDは[[m:WIN32OLE_METHOD#dispid]]から取得できます。
  # 
  # @see [[c:WIN32OLE::VARIANT]]
  def _setproperty; end

  # --- each {|i|...} -> ()
  # 
  # オブジェクトの列挙インターフェイスを呼び出してアイテム単位にブロックを
  # 実行します。
  # 
  # OLEオートメーションサーバの中には、コレクション用インターフェイスを持つ
  # ものがあります。eachメソッドは、このようなオブジェクトの列挙メソッドを
  # 呼び出して、アイテム毎のイテレーションを行います。
  # 
  # @param i コレクション内のアイテム
  # 
  # @raise WIN32OLERuntimeError selfが列挙インターフェイスをサポートしてい
  #                             ない場合に通知します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    book = excel.workbooks.add
  #    sheets = book.worksheets(1)
  #    cells = sheets.cells("A1:A5")
  #    cells.each do |cell|
  #      cell.value = 10
  #    end
  #    excel.Quit
  def each; end

  # --- invoke(name, *args) -> object | nil
  # メソッド名を指定してオブジェクトのメソッドを呼び出します。
  # 
  # OLEオートメーションサーバのメソッドを動的に呼び出したい場合に利用します。
  # 
  # なお、OLEオートメーションの仕様により、メソッド名の大文字、小文字は区別
  # されません。
  # 
  # @param name メソッド名を文字列またはシンボルで指定します。
  # @param args メソッドの引数を指定します。また、最後の引数に[[c:Hash]]を
  #             与えることで、名前付き引数を指定できます。この場合、キーに
  #             文字列またはシンボルでパラメータ名、値に引数を指定します。
  # @return メソッドの返り値。ただし返り値を持たないメソッドの場合はnil。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  #   excel = WIN32OLE.new('Excel.Application')
  #   workbook = excel.workbooks.invoke(:Open, :FileName => 'c:\\users\\public\\test.xml',
  #                                            :ReadOnly => true,
  #                                            :Password => 'secret')
  #   excel.invoke(:Quit)
  # 
  # このリストは、以下の記述と同等です。
  # 
  #   excel = WIN32OLE.new('Excel.Application')
  #   workbook = excel.workbooks.Open(:FileName => 'c:\\users\\public\\test.xml',
  #                                   :ReadOnly => true,
  #                                   :Password => 'secret')
  #   excel.Quit
  def invoke; end

  # --- method_missing(id, *args) -> object | nil
  # [[m:WIN32OLE#invoke]]メソッドを実行します。
  # 
  # WIN32OLEのインスタンスに対して、このリファレンスに明記されていないメソッ
  # ドを呼び出した場合、OLEオートメーションサーバのメソッド（プロパティ）呼
  # び出しと解釈します。
  # 
  # @param id メソッド名をシンボルで指定します。
  # @param args メソッドの引数を指定します。
  # @return メソッドの返り値。ただし返り値を持たないメソッドの場合はnil。
  # @raise RuntimeError idが有効なシンボルではありません。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  # WIN32OLEはOLEオートメーションオブジェクトのメソッド呼び出しを
  # method_missingを利用して実行します。このためWIN32OLEを継承するクラスを
  # 作成してmethod_missingをオーバーライドする場合、superを呼び出してくださ
  # い。
  # 
  # @see [[m:WIN32OLE#invoke]]
  def method_missing; end

  # --- ole_activex_initialize -> nil
  # 
  # ActiveXコントロール用の初期化を行います。
  # 
  # ole_activex_initializeメソッドは、スクリプト内でActiveXコントロールを利
  # 用できるように、オブジェクトが持つ永続化データを初期化します。
  # 
  # ActiveXコントロール（OCX）は、主にUI用に利用されるOLEオートメーションサー
  # バです。ActiveXコントロールは、IDEを利用した開発時と、プログラムの実行
  # 時の2種類の実行モードを持ちます。これは、開発時の設定を永続化するためで
  # す。
  # 
  # 幾つかのActiveXコントロールは、上記の動作を前提に組まれているため、実行
  # に先だって永続化データの転送をデータの有無と関係なく要求します。この場
  # 合、もし永続化データを初期化しないと、実行時モード状態へ遷移せず、後続
  # のメソッド呼び出しがすべてエラーとなります。
  # 
  # @raise WIN32OLERuntimeError オブジェクトがActiveXコントロールの永続化イ
  #                             ンターフェイスを持たない場合に通知します。
  # 
  #    obj = WIN32OLE.new("ProgID_or_GUID_of_ActiveX_Control")
  #    obj.ole_activex_initialize
  #    obj.method(...)
  # 
  # なお、生成したOLEオートメーションサーバが永続化データの初期化を必要とす
  # るActiveXコントロールか、そうでないかを簡単に区別する方法はありません。
  # そのため、とりあえず普通にメソッドを呼び出し、その結果
  # WIN32OLERuntimeErrorが通知され、メッセージにHRESULT 0x8000ffffと示され
  # ている場合にのみ、オブジェクト生成直後に当メソッドを呼び出してみてくだ
  # さい。
  # 
  # また、オブジェクトによっては、当メソッドの呼び出しにより後続のデータを
  # 要求してハングアップする場合があります。その場合は、Ctrl-Cなどによって
  # 実行を中止してください。
  def ole_activex_initialize; end

  # --- ole_free -> ()
  # 
  # selfが参照するCOMオブジェクトを解放します。
  # 
  # selfが参照するCOMオブジェクトのIUnknown::Releaseを呼び出すことで、COMオ
  # ブジェクトを開放します。ole_freeを呼び出した後は、このオブジェクトに対
  # する操作は行えません。
  # 
  #   excel = WIN32OLE.new('Excel.Application')
  #   excel.ole_free  # オブジェクトの解放
  #   excel.Quit      #=> RuntimeError (failed to get Dispatch Interface)
  # 
  # 通常は利用されなくなったWIN32OLEオブジェクトはGCのタイミングで自動的に
  # 解放されるため、当メソッドを呼び出す必要はありません。Officeのような外
  # 部プロセスサーバ呼び出し時に、スクリプト終了後もサーバが解放されない場
  # 合に強制的にサーバを終了するために当メソッドを利用できます。ただし、現
  # 実には途中で生成される子オブジェクトからの逆参照などがあるため、
  # WIN32OLEがIUnknown::Releaseを呼び出してもオブジェクトが解放されるとは限
  # りません。
  # 
  #   excel = WIN32OLE.new('Excel.Application')
  #   workbook = excel.Workbooks.Open('workbook.xls') 
  #   workbook.Close(:SaveChanges => false)
  #   workbook.ole_free
  #   excel.ole_free
  #   # この時点でExcel.EXEは終了しない
  # 
  # 上の例では、excel.Workbooks.Openの行で、excel.Workbooksオブジェクトが生
  # 成されています。しかし、後続の処理で該当オブジェクトが解放されていない
  # ため、Workbooksオブジェクトによって参照されているexcelオブジェクトは解
  # 放されません。それに対して下の例では正しく解放されます。
  # 
  #   excel = WIN32OLE.new('Excel.Application')
  #   books = excel.Workbooks
  #   workbook = books.Open('workbook.xls')
  #   books.ole_free
  #   workbook.Close(:SaveChanges => false)
  #   workbook.ole_free
  #   excel.ole_free
  def ole_free; end

  # --- ole_func_methods -> [WIN32OLE_METHOD]
  # オブジェクトのファンクション情報を[[c:WIN32OLE_METHOD]]の配列として返し
  # ます。
  # 
  # ole_func_methodsメソッドは、OLEオートメーションサーバのメソッドのうちファ
  # ンクション（何らかの機能的な操作）に属するものを[[c:WIN32OLE_METHOD]]の
  # 配列として返します。
  # 
  # @return [[c:WIN32OLE_METHOD]]の配列。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             型情報ライブラリ(TypeLib)が提供されていない場合などに発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    excel.visible = true
  #    excel.ole_func_methods.each do |fun|
  #      if fun.name.upcase == 'QUIT'
  #        excel._invoke(fun.dispid, [], [])
  #        break
  #      end
  #    end
  # 
  # @see [[m:WIN32OLE#ole_methods]], [[m:WIN32OLE#ole_get_methods]],
  #      [[m:WIN32OLE#ole_put_methods]]
  def ole_func_methods; end

  # --- ole_get_methods -> [WIN32OLE_METHOD]
  # オブジェクトの参照可能プロパティ情報を[[c:WIN32OLE_METHOD]]の配列として
  # 返します。
  # 
  # ole_get_methodsメソッドは、OLEオートメーションサーバのメソッドのうち読
  # み取り可能なプロパティを[[c:WIN32OLE_METHOD]]の配列として返します。
  # 
  # @return [[c:WIN32OLE_METHOD]]の配列。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             型情報ライブラリ(TypeLib)が提供されていない場合などに発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    excel.ole_get_methods.each do |prop|
  #      begin
  #        puts "#{prop.name}=#{excel._getproperty(prop.dispid, [], [])}"
  #      rescue WIN32OLERuntimeError
  #        puts "can't read #{prop.name} property"
  #      end
  #    end
  # 
  # @see [[m:WIN32OLE#ole_methods]], [[m:WIN32OLE#ole_func_methods]],
  #      [[m:WIN32OLE#ole_put_methods]]
  def ole_get_methods; end

  # --- ole_method(method) -> WIN32OLE_METHOD
  # --- ole_method_help(method) -> WIN32OLE_METHOD
  # 
  # メソッド名を指定して対応する[[c:WIN32OLE_METHOD]]オブジェクトを取得しま
  # す。
  # 
  # OLEオートメーションの仕様により、メソッド名の大文字、小文字は区別されま
  # せん。
  # 
  # @param method メソッド情報を取り出す対象のメソッド名を文字列で指定します。
  # @return [[c:WIN32OLE_METHOD]]オブジェクト。
  # @raise WIN32OLERuntimeError 指定したメソッド名が未定義あるいは型情報ラ
  #                             イブラリ(TypeLib)が提供されていない場合など
  #                             に発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    method = excel.ole_method_help('Quit')
  def ole_method; end

  # --- ole_methods -> [WIN32OLE_METHOD]
  # オブジェクトのメソッド情報を[[c:WIN32OLE_METHOD]]の配列として返します。
  # 
  # ole_methodsメソッドは、OLEオートメーションサーバが提供するすべてのメソッ
  # ドを[[c:WIN32OLE_METHOD]]の配列として返します。
  # 
  # @return [[c:WIN32OLE_METHOD]]の配列。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             型情報ライブラリ(TypeLib)が提供されていない場合などに発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    methods = excel.ole_methods
  # 
  # @see [[m:WIN32OLE#ole_func_methods]], [[m:WIN32OLE#ole_put_methods]]
  def ole_methods; end

  # --- ole_obj_help -> WIN32OLE_TYPE | nil
  # --- ole_type -> WIN32OLE_TYPE | nil
  # [[c:WIN32OLE_TYPE]]オブジェクトを返します。
  # 
  # [[c:WIN32OLE_TYPE]]オブジェクトは、WIN32OLEオブジェクトの文書情報と型情
  # 報を保持するオブジェクトです。
  # 
  # @return オブジェクトに関連する[[c:WIN32OLE_TYPE]]オブジェクトを返します。
  #         オブジェクトがドキュメント情報を持たない場合はnilを返します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    tobj = excel.ole_obj_help
  # 
  # @see [[c:WIN32OLE_TYPE]]
  def ole_obj_help; end

  # --- ole_put_methods -> [WIN32OLE_METHOD]
  # 
  # オブジェクトの設定可能プロパティ情報を[[c:WIN32OLE_METHOD]]の配列として
  # 返します。
  # 
  # ole_put_methodsメソッドは、OLEオートメーションサーバのメソッドのうちプ
  # ロパティ設定メソッドに属するものを[[c:WIN32OLE_METHOD]]の配列として返し
  # ます。
  # 
  # @return [[c:WIN32OLE_METHOD]]の配列。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             型情報ライブラリ(TypeLib)が提供されていない場合などに発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    properties = excel.ole_put_methods
  # 
  # @see [[m:WIN32OLE#ole_methods]], [[m:WIN32OLE#ole_func_methods]],
  #      [[m:WIN32OLE#ole_get_methods]]
  def ole_put_methods; end

  # --- ole_query_interface(iid) -> WIN32OLE
  # 
  # IID（インターフェイスID）を指定してオブジェクトの別のインターフェイスを
  # 持つオブジェクトを取得します。
  # 
  # オブジェクトが複数のオートメーション用インターフェイスを持つ場合に、当
  # メソッドを利用して既定のインターフェイスとは異なるインターフェイスを取
  # 得します。
  # 
  # @param iid 取得するインターフェイスのIIDを文字列で指定します。
  # @return iidパラメータで指定したインターフェイスを持つWIN32OLEオブジェクト
  # @raise WIN32OLERuntimeError 指定したIIDをオブジェクトが持たない場合に通知されます。
  # 
  #     ie = WIN32OLE.new('InternetExplorer.Application')
  #     ie_web_app = ie.ole_query_interface('{0002DF05-0000-0000-C000-000000000046}')
  # 
  # 上例のie_web_appは、ieと同じインスタンスとなります。
  # 
  # COMの仕様では1つのインターフェイスについて同じIID問い合わせに対しては常
  # に同一のインターフェイスを返すことが決められています。
  # 
  # このため、正しく実装されたOLEオートメーションサーバでは本メソッドが意味
  # を持つことはありません。というのは、2つ以上の異なるWIN32OLEで操作可能な
  # インターフェイスを持つということは、IID_IDispatch（OLEオートメーション
  # のインターフェイスID）を指定した問い合わせに対して異なるインターフェイ
  # スを返すということになるからです。これは、結果的に呼び出し側プログラム
  # がいつでも間違えたインターフェイスを呼び出す可能性を持つということを意
  # 味します。当然、それはサーバ実装のバグです。
  # 
  # 問題は、C++のvtblアクセスや.NET FrameworkのCOM Interopのために静的型情
  # 報が必要となることです。このため、一度あるインターフェイスを返すことに
  # 決めた場合、実際に返すインターフェイスが元のインターフェイスを継承して
  # いたとしても、ドキュメント上は異なるインターフェイスとして定義しなけれ
  # ば追加のメソッドが呼び出せません。
  # 
  # たとえば、当メソッドの存在理由である
  # [[url:http://www.ruby-forum.com/topic/109954]]（なお、元のパッチと異な
  # りGUIDの統一フォーマットを利用するように改造されているため、IIDの前後に
  # {}が必要です）には、Solutionオブジェクトに対してSolution2オブジェクトの
  # 取得を依頼するために、必要ということになっています。実際、Solutionプロ
  # パティが返すのは、この場合はSolutionインターフェイスを継承した
  # Solution2インターフェイスです。しかし、Solutionプロパティの型情報は
  # Solutionインターフェイスを返すことになっているため、静的に型を解決して
  # いる場合は、追加のメソッドの呼び出しを記述できません。
  # 
  # しかし、WIN32OLEが利用するIDispatchインターフェイスは、メソッド名による
  # 動的なメソッド検索が行われます。このため、Solutionオブジェクト（しかし
  # その実態はSolution2オブジェクト）に対してSolution2で追加されたメソッド
  # （たとえばGetProjectTemplate）を指定したとしても正しく呼び出せます。つ
  # まり、[[url:http://www.ruby-forum.com/topic/109954]]で例示されているよ
  # うなole_query_interfaceメソッドの呼び出しは不要です。
  # 
  # もし、当メソッドの呼び出しが本当に必要なのであれば、まず、該当するOLEオー
  # トメーションサーバの修正を依頼してください。その実装は正しくありません。
  # 
  # 正しく実装されたオブジェクトに対して当メソッドを適用すると、結果として、
  # 同一オブジェクトの参照カウント値を無駄に増加させることになります。
  # 
  # なお、サポートしているインターフェイスのバージョンを調べたい場合に、以
  # 下のような方法で、インターフェイスのバージョンを調べることができます。
  # 
  #   def check_solution_version(obj)
  #     [['{CDA7305C-78B6-4D9D-90AD-93EBE71F9341}', 4],
  #      ['{DF23915F-FDA3-4DD5-9CAA-2E1372C2BB16}', 3],
  #      ['{FA238614-FBB1-4314-A7F7-49AE8BB6C6BA}', 2]].each do |iid, ver|
  #       begin
  #         intf = obj.ole_query_interface(iid)
  #         intf.ole_free
  #         return ver
  #       rescue WIN32OLERuntimeError
  #       end
  #     end
  #     1
  #   end
  # 
  # しかし、ole_query_interfaceのような特異なメソッドを利用するよりも、
  # WIN32OLE.new('VisualStudio.DTE.8.0') のように生成時にバージョン番号（こ
  # の例では8.0）を指定するほうが良いスタイルです。
  # 
  # また、単に特定のメソッドをサポートしているかどうかを知りたいだけであれ
  # ば、[[m:WIN32OLE#ole_respond_to?]]を利用したダックタイピングをしてくだ
  # さい。
  def ole_query_interface; end

  # --- ole_respond_to?(name) -> bool
  # 指定したメソッドをオブジェクトがサポートしているか調べます。
  # 
  # OLEオートメーションサーバが引数で指定した名前のメソッド（プロパティ）を
  # サポートしているかどうかを調べます。
  # 
  # なお、OLEオートメーションの仕様により、メソッド名の大文字、小文字は区別
  # されません。
  # 
  # @param name 調べるメソッド名を文字列またはシンボルで指定します。
  # 
  # @return nameで指定したメソッドをオブジェクトが提供していれば真を返します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    excel.ole_respond_to?(:quit) #=> true
  #    excel.ole_respond_to?(:exit) #=> false
  def ole_respond_to?; end

  # --- ole_typelib -> WIN32OLE_TYPELIB
  # 
  # オブジェクトに対応する型情報ライブラリ（TypeLib）を
  # [[c:WIN32OLE_TYPELIB]]として返します。
  # 
  # OLEオートメーションではクラス、インターフェイス、メソッド、引数などの型
  # 情報と文書情報を型情報ライブラリとして利用します。型情報ライブラリは独
  # 立したファイル（拡張子tlb）の場合もあれば、オブジェクトのバイナリへリソー
  # スとして埋め込まれている場合があります。
  # 
  # OLEオートメーションでは型情報ライブラリの提供方法を問わずに統一したイン
  # ターフェイスでアプリケーションが参照できるように、オブジェクトの形式
  # （ITypeInfoインターフェイス）で提供します。WIN32OLEは、このオブジェクト
  # をラップして[[c:WIN32OLE_TYPELIB]]として提供します。
  # 
  # @return オブジェクトに対応する[[c:WIN32OLE_TYPELIB]]オブジェクト。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             型情報ライブラリ(TypeLib)が提供されていない場合などに発生します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    tlib = excel.ole_typelib
  #    puts tlib.name  # => 'Microsoft Excel 9.0 Object Library'
  def ole_typelib; end

  # --- setproperty(name, val) -> ()
  # --- setproperty(name, args..., val) -> ()
  # 
  # オブジェクトのプロパティを設定します。
  # 
  # プロパティ名を指定してOLEオートメーションオブジェクトのプロパティ
  # （Rubyの属性に相当）を設定します。
  # 
  # なお、OLEオートメーションの仕様により、プロパティ名の大文字、小文字は区
  # 別されません。
  # 
  # @param name プロパティ名を文字列またはシンボルで指定します。
  # @param val プロパティに設定する値を指定します。
  # @param args 集合的なプロパティに対する設定項目を特定するための引数を指
  #             定します。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  # OLEオートメーションのプロパティはRubyの属性と異なり、パラメータを取るこ
  # とができます。
  # 
  # たとえばExcelのWorksheetオブジェクトのCellsプロパティは桁位置と行番号の
  # 2つのパラメータを取ります。
  # 
  # これはVBでは次のように記述できます。
  # 
  #   sheet.Cells(1, 1) = sheet.Cells(1, 2) ' セルB1の内容をセルA1へ
  # 
  # Rubyでは上記のコードの右辺をVBと同じく「sheet.Cells(1, 2)」のように記述
  # できますが、左辺の記述はできません。
  # 
  # そのため、次の例のようにsetpropertyメソッドを利用して、パラメータ付きプ
  # ロパティを設定します。
  # 
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    excel.visible = true
  #    sheet = excel.Workbooks.Add.Worksheets[1]
  #    sheet.setproperty(:Cells, 1, 2, 32)
  #    sheet.setproperty(:Cells, 1, 1, sheet.Cells(1, 2))
  def setproperty; end

  # --- codepage -> Integer
  # 
  # WIN32OLEがOLEオートメーションのインターフェイスに利用するコードページを
  # 取得します。
  # 
  # OLEオートメーションに利用する文字列はUnicodeでエンコードします。
  # WIN32OLEはここで示されたコードページを利用してRubyのStringとUnicodeの相
  # 互変換を行います。
  # 
  # ロード時の既定値はEncoding.default_internal、または
  # Encoding.default_internalがnilの場合はEncoding.default_externalによって
  # 求めたエンコーディングに対応するコードページです。もし、該当するコード
  # ページが見つからない場合は、[[m:WIN32OLE::CP_ACP]]を利用します。
  # 
  # @return WIN32OLEがオートメーション呼び出しの文字列変換に利用するコード
  #         ページを返します。
  # 
  #    WIN32OLE.codepage   # => 932 （日本語Windowsの既定値）
  def codepage; end

  # --- codepage=(cp) -> nil
  # 
  # WIN32OLEがOLEオートメーションのインターフェイスに利用するコードページを
  # 設定します。
  # 
  # WIN32OLEは、OLEオートメーション呼び出しに利用する文字列のUnicode変換に
  # ここで設定したコードページを利用します。通常、WIN32OLEはロード時の
  # Encoding.default_internalまたはEncoding.default_externalから適切なコー
  # ドページを判断し、それを利用します。したがって、当メソッドを呼び出す必
  # 要があるのは、WIN32OLEをrequireしたスクリプトと異なるエンコーディングを
  # 利用しているスクリプトや、異なるエンコーディングを利用しているファイル
  # から読み込んだ文字列を利用してWIN32OLEを呼び出す場合です。
  # 
  # @param cp コードページを指定します。
  # 
  # 
  #    WIN32OLE.codepage = WIN32OLE::CP_UTF8
  def codepage=; end

  # --- connect(ole) -> WIN32OLE
  # 
  # 現在実行中のOLEオートメーションサーバに接続します。
  # 
  # connectメソッドは、COMのモニカを利用して、現在実行中のOLEオートメーショ
  # ンサーバを検索し、接続します。接続に成功した場合、該当サーバを操作可能
  # なWIN32OLEオブジェクトが返ります。
  # 
  # @param ole 接続対象のサーバを示すPROGID、CLSIDまたはモニカ（別名）を指定します。
  # 
  # @return ole引数で特定されるWIN32OLEオブジェクトを返します。
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #    WIN32OLE.connect('Excel.Application') # => WIN32OLE object which represents running Excel.
  # 
  # : PROGID
  #   OLEオートメーションサーバを識別するための文字列。通常「ベンダー名.ア
  #   プリケーション名.インターフェイス名」の形式を取ります。レジストリの
  #   HKEY_CLASSES_ROOTの「.」で始まらないキーとして登録されます。
  # : CLSID
  #   OLEオートメーションサーバを含むCOMのクラスを識別するための128ビット
  #   GUID。文字列表現は、レジストリのHKEY_CLASSES_ROOT\CLSID下のキーとして登
  #   録されます。
  # : モニカ
  #   モニカは、URIのようにWindows上のリソースを一意に識別するためのオブジェ
  #   クトのインターフェイスで、文字表現を持ちます。詳細については
  #   [[url:http://msdn.microsoft.com/en-us/library/ms691261(v=VS.85).aspx]]
  #   を参照してください。
  def connect; end

  # --- const_load(ole, mod = WIN32OLE) -> ()
  # 
  # OLEオートメーションサーバが保持する定数を読み込み、指定されたモジュール
  # に組み込みます。
  # 
  # OLEオートメーションサーバは、定数をクライアントへ提供できます。
  # 
  # const_loadメソッドはこれらの定数を読み込み、指定したモジュールに組み込
  # むことで参照可能とします。
  # 
  # @param ole 定数を読み込む対象のWIN32OLEオブジェクトまたはタイプライブラ
  #            リ名（文字列）を指定します。
  # 
  # @param mod 定数を定義する対象のモジュールを指定します。省略時は
  #            WIN32OLEに組み込まれます。
  # 
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  # OLEオートメーションの定数は通常、VBのコード規約に準じて、vbConstantsの
  # ように小文字で始まります。しかし、Rubyの定数は大文字で開始する規則のた
  # め、WIN32OLEによってVbConstantsのように自動的に先頭が大文字化されます。
  # 
  # また、先頭が英字で始まらない定数については、CONSTANTSハッシュに登録され
  # ます。この場合、元の定数名がキーとなります。
  # 
  #    module EXCEL_CONST
  #    end
  #  
  #    excel = WIN32OLE.new('Excel.Application')
  #    WIN32OLE.const_load(excel, EXCEL_CONST)
  #    puts EXCEL_CONST::XlTop # => -4160
  #    puts EXCEL_CONST::CONSTANTS['_xlDialogChartSourceData'] # => 541
  # 
  # モジュール名を省略した例
  # 
  #    WIN32OLE.const_load(excel)
  #    puts WIN32OLE::XlTop # => -4160
  # 
  # タイプライブラリ名を指定した例
  # 
  #    module MSO
  #    end
  #  
  #    WIN32OLE.const_load('Microsoft Office 9.0 Object Library', MSO) 
  #    puts MSO::MsoLineSingle # => 1
  def const_load; end

  # --- create_guid -> String
  # 
  # GUID(グローバル一意識別子：Global Unique Identifier)を生成します。
  # 
  # GUIDは、COMのクラス識別子(CLSID)、インターフェイス識別子(IID)など多数の
  # 領域でWindows上のオブジェクトの識別に利用される128ビットの値です。
  # 
  # WIN32OLEが生成するGUIDは以下の形式によるGUIDの文字列表現です。なお00〜
  # FFはGUIDの先頭からのバイト位置を示します。これはレジストリのキーとして
  # 利用される形式です。
  # 
  #   {33221100-5544-7766-8899-AABBCCDDEEFF}
  # 
  # @return GUIDの文字列表現を返します。
  # 
  #    WIN32OLE.create_guid   # => "{????????-????-????-????-????????????}"
  def create_guid; end

  # --- locale -> Integer
  # 
  # WIN32OLEがオートメーション呼び出し時に設定するロケール識別子(LCID)を取
  # 得します。
  # 
  # OLEオートメーションでは、UNIXで利用される"ja_JP"などの国名と言語名を「_」
  # で接続した文字列ではなく、32ビット整数で示します。32ビットの内訳は上位
  # 16ビットが予約領域で0、下位16ビットが言語ID(LANGID）です。LANGIDは、0〜
  # 9ビットでプライマリ言語ID、10〜15ビットでサブ言語IDを示します。
  # 
  # ロード時の既定値は[[m:WIN32OLE::LOCALE_SYSTEM_DEFAULT]]です。
  # 
  # @return WIN32OLEがオートメーション呼び出し時に設定するロケール識別子
  #         (LCID)を返します。
  # 
  #    lcid = WIN32OLE.locale
  def locale; end

  # --- locale=(lcid) -> nil
  # 
  # WIN32OLEがオートメーション呼び出し時に設定するロケール識別子(LCID)を設
  # 定します。
  # 
  # OLEオートメーションでは、UNIXで利用される"ja_JP"などの国名と言語名を「_」
  # で接続した文字列ではなく、32ビット整数で示します。32ビットの内訳は上位
  # 16ビットが予約領域で0、下位16ビットが言語ID(LANGID）です。LANGIDは、0〜
  # 9ビットでプライマリ言語ID、10〜15ビットでサブ言語IDを示します。
  # 
  # @param lcid 新たに設定するロケール識別子を整数で指定します。
  # 
  # @raise WIN32OLERuntimeError システムにインストールされていないロケール
  #                             を指定すると発生します。
  # 
  #    WIN32OLE.locale = 1033 # set locale English(U.S)
  #    obj = WIN32OLE_VARIANT.new("$100,000", WIN32OLE::VARIANT::VT_CY)
  # 
  # オブジェクトがサポートしていないロケールを設定した場合、オブジェクトのメソッド呼び出し時にDISP_E_UNKNOWNLCID(HRESULT error code:0x8002000C)や、TYPE_E_INVDATAREAD(HRESULT error code:0x80028018)などを理由としたWIN32OLERuntimeError例外となります。ほとんどすべての場合において、既定値を変更する必要はありません。
  def locale=; end

  # --- new(server, host=nil) -> WIN32OLE
  # OLEオートメーションサーバを生成します。
  # 
  # 引数で指定したCLSIDまたはPROGIDを持つOLEオートメーションサーバを生成し
  # ます。生成に成功した場合、該当サーバを操作可能なWIN32OLEオブジェクトが
  # 返ります。
  # 
  # CLSIDおよびPROGIDについては[[m:WIN32OLE.connect]]を参照してください。
  # 
  # @param server OLEオートメーションサーバを示すPROGIDまたはCLSIDを文字列
  #               で指定します。
  # 
  # @param host サーバを生成するホストのホスト名またはIPアドレスを文字列で
  #             指定します。省略時は現在スクリプトを実行中のホストで生成し
  #             ます。
  # 
  # @return hostで指定したホスト上のserver引数で指定したWIN32OLEオブジェク
  #         トを返します。
  # 
  # @raise WIN32OLERuntimeError オートメーションサーバの呼び出しに失敗しました。
  #                             理由はメッセージのHRESULTを調べてください。
  # 
  #     WIN32OLE.new('Excel.Application') # => Excel OLE Automation WIN32OLE object.
  # 
  #     WIN32OLE.new('{00024500-0000-0000-C000-000000000046}') # => Excel OLE Automation WIN32OLE object.
  def new; end

  # --- ole_free(aWIN32OLE) -> Integer
  # 
  # 引数で指定したオブジェクトを解放します。
  # 
  # このメソッドは主にWIN32OLEのデバッグおよびWIN32OLEを利用するミドルウェ
  # アの実装のために用意されています。このため、メソッドの内部動作は不定で
  # す。COMの仕様とWIN32OLEの内部処理に熟知していない場合は使用しないでくだ
  # さい。
  # 
  # @param aWIN32OLE 解放するWIN32OLEオブジェクト。
  # 
  # @return Releaseの戻り値。COMの仕様上は現在のオブジェクトの参照カウント
  #         値を示します。
  def ole_free; end

  # --- ole_reference_count(aWIN32OLE) -> Integer
  # 
  # 引数で指定したオブジェクトの現在の参照カウント値を返します。
  # 
  # このメソッドは主にWIN32OLEのデバッグおよびWIN32OLEを利用するミドルウェ
  # アの実装のために用意されています。このため、メソッドの内部動作は不定で
  # す。COMの仕様とWIN32OLEの内部処理に熟知していない場合は使用しないでくだ
  # さい。
  # 
  # @param aWIN32OLE 参照カウント値を求めるWIN32OLEオブジェクト。
  # 
  # @return AddRef呼び出し後のReleaseの戻り値。COMの仕様上は現在のオブジェ
  #         クトの参照カウント値を示します。
  def ole_reference_count; end

  # --- ole_show_help(obj, helpcontext = nil) -> ()
  # 
  # WIN32OLEオブジェクトのヘルプファイルを表示します。
  # 
  # Windows標準のヘルプ表示コンポーネントのHHCtrl.OCXを利用して、オブジェク
  # トに関連付けられたヘルプファイル（chmファイル）を表示します。
  # 
  # また、chmファイルのフルパス名を指定して表示させることも可能です。
  # 
  # @param obj [[c:WIN32OLE_TYPE]]オブジェクトまたは[[c:WIN32OLE_METHOD]]オ
  #            ブジェクト。直接ヘルプファイルのフルパス名を指定することも可
  #            能です。
  # 
  # @param helpcontext obj引数に[[c:WIN32OLE_TYPE]]オブジェクトまたは
  #                   [[c:WIN32OLE_METHOD]]オブジェクトを指定した場合は、こ
  #                   れらのオブジェクトの設定値を利用するため指定不要です。
  #                   obj引数にヘルプファイルのフルパス名を設定した場合は
  #                   0を指定してください。
  # 
  # @raise RuntimeError オブジェクトが関連するヘルプファイルを持たない場合
  #                     (no helpfile of `オブジェクト名') や、ヘルプファイル
  #                     がインストールされていない場合 (failed to open
  #                     help file `ファイル名') に通知します。
  # 
  #    excel = WIN32OLE.new('Excel.Application')
  #    typeobj = excel.ole_obj_help
  #    WIN32OLE.ole_show_help(typeobj) if typeobj.helpfile
  def ole_show_help; end

  # --- ARGV -> [object]
  # 
  # 直前のメソッド呼び出しの引数を格納した配列です。
  # 
  # OLEオートメーションでは呼び出し先が引数に対して値を設定できます。しかし、
  # Rubyのメソッド引数は値のみを取るため、そのままでは呼び出し先が設定した
  # 値を参照できません。このような場合、ARGVを参照することで呼び出し先の設
  # 定値を参照できます。
  # 
  # 以下のリストは、VBで開発したオブジェクトのメソッド呼び出しを例としてい
  # ます。このメソッド（Accm）は、第1引数で指定した演算を第2引数と第3引数に
  # 適用し、結果を第2引数に設定します。
  # 
  #   ' VB (OLE Automation server)
  #   Public Sub Accm(ByVal Operator, ByRef Accumulator, ByVal Operand)
  #       If Operator = "*" Then
  #           Accmulator = Accmulator * Operand
  #       Else If Operator = "+" Then
  #           Accmulator = Accmulator + Operand
  #       End If
  #   End Sub
  #  
  #   # Ruby
  #   x = 10
  #   obj.Accm '*', x, 11
  #   p x               # => 10 …… 呼び出しによって影響を受けない
  #   p WIN32OLE::ARGV  # => ['*', 110, 11] …… 結果はARGVの対応する引数に反映される
  #   obj.Accm '+', 10, 11
  #   p WIN32OLE::ARGV  # => ['+', 21, 11]
  # 
  # 直前のメソッド呼び出しが例外となった場合、ARGVの設定内容は呼び出し前の
  # 状態が保たれます。つまり、WIN32OLE自身がARGVの内容を消去するのは、メソッ
  # ド呼び出しに成功した場合のみです。このため最後のメソッド呼び出しが引数
  # にオブジェクトを返すタイプのメソッドだった場合、GCにオブジェクトを回収
  # させるために、呼び出し側でARGVを消去してください。
  # 
  #   ' VB (OLE Automation server)
  #   Public Sub GetInterface(ByRef obj)
  #       Set Obj = New OleObject
  #   End Sub
  # 
  #   # Ruby
  #   obj.GetInterface nil   # 引数の数を合わせるためダミー引数を指定
  #   WIN32OLE::ARGV.clear   # 通常は、後続のメソッド呼び出しによって消去される
  def ARGV; end

  # --- CP_ACP -> Integer
  # 
  # Windows既定のANSIコードページ（0）を示します。
  def CP_ACP; end

  # --- CP_MACCP -> Integer
  # 
  # Macintoshコードページ（2）を示します。
  def CP_MACCP; end

  # --- CP_OEMCP -> Integer
  # 
  # OEMコードページ（1）を示します。
  def CP_OEMCP; end

  # --- CP_SYMBOL -> Integer
  # 
  # 文字コードの変換にシンボルを利用することを示します（42）。
  def CP_SYMBOL; end

  # --- CP_THREAD_ACP -> Integer
  # 
  # 現在実行中のスレッドの既定のコードページ（3）を示します。
  # 
  # Windowsのコードページはスレッド毎に異なる値を設定できます。
  def CP_THREAD_ACP; end

  # --- CP_UTF7 -> Integer
  # 
  # 文字コードの変換にUTF-7を利用することを示します（65000）。
  def CP_UTF7; end

  # --- CP_UTF8 -> Integer
  # 
  # 文字コードの変換にUTF-8を利用することを示します（65001）。
  def CP_UTF8; end

  # --- LOCALE_SYSTEM_DEFAULT  -> Integer
  # 
  # システム既定のロケールを示すLCID(0x0800)です。WIN32OLEがオートメーショ
  # ンを利用する場合の既定値です。
  def LOCALE_SYSTEM_DEFAULT; end

  # --- LOCALE_USER_DEFAULT  -> Integer
  # 
  # ユーザ既定のロケールを示すLCID(0x0400)です。
  def LOCALE_USER_DEFAULT; end

  # --- VERSION  -> String
  # 
  # Major.Minor.Patch形式のWIN32OLEのバージョン番号を示す文字列です。
  def VERSION; end

end
