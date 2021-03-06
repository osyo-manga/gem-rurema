class WIN32OLE_TYPE
  # --- default_event_sources -> [WIN32OLE_TYPE]
  # 型が持つソースインターフェイスを取得します。
  # 
  # default_event_sourcesメソッドは、selfがCoClass（コンポーネントクラス）
  # の場合、そのクラスがサポートするデフォルトのソースインターフェイス（イ
  # ベントの通知元となるインターフェイス）を返します。
  # 
  # @return デフォルトのソースインターフェイスを[[c:WIN32OLE_TYPE]]の配列と
  #         して返します。返すのは配列ですが、デフォルトのソースインターフェ
  #         イスは最大でも1インターフェイスです。ソースインターフェイスを持
  #         たない場合は空配列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    tobj.default_event_sources.map {|intf| intf.name} #=> ["DocEvents"]
  # 
  # [[m:WIN32OLE_EVENT.new]]でインターフェイス名を指定しない場合は、ここで
  # 返されたインターフェイスが選択されます。
  # 
  # 次のサンプルは、IEのnaviaget2メソッドによってどのようなイベントが通知さ
  # れるかを、実際にメソッド呼び出し（=イベント通知）をトレースして調べるプ
  # ログラムです。イベントを受け付けるために、
  # [[m:WIN32OLE_EVENT.message_loop]]の呼び出しが必要な点に注意してください。
  # ここでは最終イベントのStatusTextChangeイベントのメッセージについては既
  # 知としています。
  # 
  #  # coding : cp932
  #  require 'win32ole'
  #  
  #  type = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'InternetExplorer')
  #  ctl = WIN32OLE.new(type.progid)
  #  source = type.default_event_sources[0]
  #  class WebEvent
  #    def initialize
  #      @completed = false
  #    end
  #    attr_reader :completed
  #  end
  #  source.ole_methods.each do |m|
  #    WebEvent.module_eval do
  #      define_method("on#{m.name}") do |*arg|
  #        if arg[0] == "ページが表示されました"
  #          @completed = true
  #        end
  #        puts "#{Time.now}: #{m.name} was called"
  #        p arg
  #      end
  #    end
  #  end
  #  evt = WIN32OLE_EVENT.new(ctl)
  #  evt.handler = WebEvent.new
  #  ctl.navigate2 'http://www.ruby-lang.org/'
  #  loop do
  #    break if evt.handler.completed
  #    WIN32OLE_EVENT.message_loop
  #  end
  #  ctl.Quit
  # 
  # このプログラムを実行するとWindows7のIE8環境では以下のような出力を得られ
  # ます。
  # 
  #  2010-10-06 22:33:54 +0900: PropertyChange was called
  #  ["{265b75c1-4158-11d0-90f6-00c04fd497ea}"]
  #  2010-10-06 22:33:54 +0900: BeforeNavigate2 was called
  #  [#<WIN32OLE:0x9d08f0>, "http://www.ruby-lang.org/", 0, "", nil, "", false]
  #  2010-10-06 22:33:54 +0900: DownloadBegin was called
  #  []
  #  2010-10-06 22:33:54 +0900: PropertyChange was called
  #  ["{D0FCA420-D3F5-11CF-B211-00AA004AE837}"]
  #  2010-10-06 22:33:54 +0900: CommandStateChange was called
  #  [2, false]
  #  2010-10-06 22:33:54 +0900: CommandStateChange was called
  #  [1, false]
  #  2010-10-06 22:33:54 +0900: StatusTextChange was called
  #  ["www.ruby-lang.org を検索しています"]
  #  2010-10-06 22:33:54 +0900: ProgressChange was called
  #  [100, 10000]
  #  2010-10-06 22:33:54 +0900: StatusTextChange was called
  #  ["サイト 221.186.184.68 に接続しています"]
  #  2010-10-06 22:33:54 +0900: StatusTextChange was called
  #  ["Web サイトが見つかりました。応答を待っています..."]
  #  ……
  #  2010-10-06 22:33:54 +0900: TitleChange was called
  #  ["オブジェクト指向スクリプト言語 Ruby"]
  #  2010-10-06 22:33:54 +0900: StatusTextChange was called
  #  ["待機中: http://www.ruby-lang.org/ja/ ..."]
  #  2010-10-06 22:33:54 +0900: ProgressChange was called
  #  [10000, 10000]
  #  2010-10-06 22:33:54 +0900: ProgressChange was called
  #  [-1, 10000]
  #  2010-10-06 22:33:54 +0900: DownloadComplete was called
  #  []
  #  2010-10-06 22:33:54 +0900: ProgressChange was called
  #  [10000, 10000]
  #  2010-10-06 22:33:54 +0900: DocumentComplete was called
  #  [#<WIN32OLE:0x438a2f8>, "http://www.ruby-lang.org/ja/"]
  #  2010-10-06 22:33:54 +0900: StatusTextChange was called
  #  ["ページが表示されました"]
  # 
  # @see [[m:WIN32OLE_TYPE.new]], [[m:WIN32OLE_TYPE#progid]],
  #      [[m:WIN32OLE_TYPE#ole_methods]], [[m:WIN32OLE_METHOD#name]],
  #      [[m:WIN32OLE_EVENT.new]], [[m:WIN32OLE_EVENT#handler=]],
  #      [[m:WIN32OLE_EVENT.message_loop]]
  def default_event_sources; end

  # --- default_ole_types -> [WIN32OLE_TYPE]
  # 型が持つデフォルトのインターフェイスを取得します。
  # 
  # default_ole_typesメソッドは、selfがCoClass（コンポーネントクラス）の場
  # 合、そのクラスが実装しているデフォルトのインターフェイスと、サポートし
  # ていればデフォルトのソースインターフェイスを返します。
  # 
  # @return デフォルトインターフェイスを[[c:WIN32OLE_TYPE]]の配列として返し
  #         ます。デフォルトインターフェイスは、最大でも、クラス操作用のイ
  #         ンターフェイス（OLEオートメーション用）と、イベント用のソースイ
  #         ンターフェイスの2要素です。デフォルトインターフェイスを持たない
  #         場合は空配列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    tobj.default_ole_types.map {|intf| intf.name} #=> ["_Worksheet", "DocEvents"]
  def default_ole_types; end

  # --- guid -> String | nil
  # この型のGUID（グローバル一意識別子）を取得します。
  # 
  # @return GUIDを文字列で返します。GUIDを持たない型の場合はnilを返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #   puts tobj.guid  # => {00024500-0000-0000-C000-000000000046}
  # 
  # GUIDは、COMのクラス識別子(CLSID)、インターフェイス識別子(IID)など多数の
  # 領域でWindows上のオブジェクトの識別に利用される128ビットの値です。
  def guid; end

  # --- helpcontext -> Integer | nil
  # この型に関連するヘルプファイルのトピックID（ヘルプコンテキスト）を取得
  # します。
  # 
  # @return 型に関連するヘルプコンテキストを整数で返します。ヘルプコンテキ
  #         ストが登録されていない場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    puts tobj.helpcontext # => 131185
  def helpcontext; end

  # --- helpfile -> String | nil
  # オブジェクトに関連付けられたヘルプファイルのフルパス名。
  # 
  # ここで返されたヘルプファイルを表示するには、
  # [[m:WIN32OLE#ole_show_help]]メソッドを呼び出します。
  # 
  # オブジェクトがヘルプファイルを持たない場合はnilを返します。
  # 
  # @return オブジェクトに関連付けられたヘルプファイルのフルパス名を文字列で返します。
  #         ヘルプファイルが未定義の場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    puts tobj.helpfile # => C:\...\VBAXL9.CHM
  #    WIN32OLE.ole_show_help tobj.helpfile, tobj.helpcontext
  #    # 注）WIN32OLE.ole_show_help(tobj) の呼び出しが望ましい
  # 
  # 当メソッドがフルパス名を返しても、ヘルプファイルがインストールされてい
  # ない場合があることに注意してください。
  # 
  # また、返送値はOLEサーバの登録値をそのまま利用するため、Rubyのパス名形式
  # （ディレクトリ区切りは「/」）ではなく、Windowsのパス名形式（ディレクト
  # リ区切りは「\」）です。
  def helpfile; end

  # --- helpstring -> String | nil
  # 型のドキュメント文字列を取得します。
  # 
  # @return ドキュメント文字列を返します。未定義の場合はnilを返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Internet Controls', 'IWebBrowser')
  #   p tobj.helpstring   # => "Web Browser interface"
  # 
  # ドキュメント文字列は、コンテキストヘルプなどに利用可能な型の簡単な説明文です。
  def helpstring; end

  # --- implemented_ole_types -> [WIN32OLE_TYPE]
  # この型が実装するインターフェイスを取得します。
  # 
  # implemented_ole_typesメソッドは、selfがCoClass（コンポーネントクラス）
  # の場合、そのクラスが実装しているすべてのインターフェイスを返します。
  # 
  # @return クラスが実装するすべてのインターフェイスを[[c:WIN32OLE_TYPE]]の
  #         配列として返します。この型がインターフェイスを実装しない場合は、
  #         空配列を返します。
  # 
  # @raise WIN32OLERuntimeError 型属性が取得できない場合に通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    tobj.implemented_ole_types.map {|intf| intf.name} #=> ["_Worksheet", "DocEvents"]
  def implemented_ole_types; end

  # --- inspect -> String
  # selfを説明的な文字列で表現します。
  # 
  # @return "#<WIN32OLE_TYPE"と[[m:WIN32OLE_TYPE#to_s]]の結果を「:」で結合
  #         し、「>」で閉じた文字列を返します。
  # 
  #    x = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    puts x.inspect #=> #<WIN32OLE_TYPE:Worksheet>
  # 
  # @see [[m:WIN32OLE_TYPE#to_s]]
  def inspect; end

  # --- major_version -> Integer
  # 型のメジャーバージョン番号を取得します。
  # 
  # @return 型のメジャーバージョン番号を整数で返します。
  # @raise WIN32OLERuntimeError 型属性の読み取りに失敗すると通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Word 14.0 Object Library', 'Documents')
  #    p tobj.major_version   # => 8
  def major_version; end

  # --- minor_version -> Integer
  # 型のマイナーバージョン番号を取得します。
  # 
  # @return 型のマイナーバージョン番号を整数で返します。
  # @raise WIN32OLERuntimeError 型属性の読み取りに失敗すると通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Word 14.0 Object Library', 'Documents')
  #    p tobj.minor_version   # => 5
  def minor_version; end

  # --- name -> String
  # --- to_s -> String
  # selfの型名を取得します。
  # 
  # @return selfの型名を文字列で返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #    p tobj.name   # => "Application"
  def name; end

  # --- ole_methods -> [WIN32OLE_METHOD]
  # 型が持つメソッドのメタデータを取得します。
  # 
  # @return 型が持つメソッドのメタデータを[[c:WIN32OLE_METHOD]]の配列として返します。
  #         メソッドを持たない場合は空配列を返します。
  # 
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #   methods = tobj.ole_methods.map {|m| m.name }
  #                        # => ['QueryInterface', 'AddRef', 'Release',....]
  # 
  # @see [[c:WIN32OLE_METHOD]]
  def ole_methods; end

  # --- ole_type -> String | nil
  # selfの型の種類（TYPEKIND）を取得します。
  # 
  # @return selfの型の種類を文字列で返します。情報が取得できない場合はnilを返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #   p tobj.ole_type  # => Class
  # 
  # ole_typeには以下があります。
  # 
  # : Enum
  #   列挙子（0）
  # : Record
  #   ユーザ定義型（メソッドを持たない構造体）（1）
  # : Module
  #   モジュール（静的関数やデータだけを保持）（2）
  # : Interface
  #   COMのインターフェイス（メソッド定義の集合）（3）
  # : Dispatch
  #   OLEオートメーションサーバ（4）
  # : Class
  #   コンポーネントクラス（InterfaceやDispatchの実装）（5）
  # : Alias
  #   他の型の別名（6）
  # : Union
  #   共用体（7）
  # : Max
  #   型の種類を示す列挙体の終端マーカ（8）
  # 
  # MaxはTYPEKINDの終端マーカなので意味を持ちません。
  # 
  # @see [[m:WIN32OLE_TYPE#typekind]]
  def ole_type; end

  # --- ole_typelib -> WIN32OLE_TYPELIB | nil
  # この型を登録してある型情報ライブラリ（TypeLib）を取得します。
  # 
  # @return この型を登録しているTypeLibを[[c:WIN32OLE_TYPELIB]]オブジェクト
  #         として返します。見つからない場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    puts tobj.ole_typelib.name  # => 'Microsoft Excel 14.0 Object Library'
  def ole_typelib; end

  # --- progid -> String | nil
  # selfのPROGIDを取得します。
  # 
  # PROGIDは、生成可能なOLEオートメーションサーバのCoClass（コンポーネント
  # クラス）が持つレジストリ登録名です。[[m:WIN32OLE.new]]の引数に指定して
  # WIN32OLEオブジェクトを生成できます。
  # 
  # @return selfのPROGIDを文字列で返します。selfがPROGIDを持たない、または
  #         CoClassでない場合はnilを返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #    p tobj.progid   # => "Excel.Application.14"
  # 
  # この例は、ExcelのApplicationクラスが「Excel.Application.14」という
  # PROGIDを持つことを示します。
  # 
  # @see [[m:WIN32OLE.new]]
  def progid; end

  # --- source_ole_types -> [WIN32OLE_TYPE]
  # 型が持つソースインターフェイスを取得します。
  # 
  # source_ole_typesメソッドは、selfがCoClass（コンポーネントクラス）の場合、
  # そのクラスがサポートするすべてのソースインターフェイス（イベントの通知
  # 元となるインターフェイス）を返します。
  # 
  # ActiveXコントロールのようにイベント（[[c:WIN32OLE_EVENT]]）をサポートし
  # ているコンポーネントクラスの場合は、このメソッドの呼び出しによりイベン
  # トインターフェイスを調べることが可能です。
  # 
  # @return ソースインターフェイスを[[c:WIN32OLE_TYPE]]の配列として返します。
  #         ソースインターフェイスを持たない場合は空配列を返します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Worksheet')
  #    tobj.source_ole_types.map {|intf| intf.name} #=> ["DocEvents"]
  def source_ole_types; end

  # --- src_type -> String | nil
  # selfが他の型の別名ならば、元の型名を取得します。
  # 
  # @return selfが別名ならば元の型名を文字列で返します。別名でなければnilを
  #         返します。
  # 
  #    tobj =  WIN32OLE_TYPE.new('Microsoft Office 14.0 Object Library', 'MsoRGBType')
  #    p tobj.src_type   # => "I4"
  # 
  # この例は、OfficeのMsoRGBType型は符号付き32ビット整数（I4）の別名だとい
  # うことを示します。
  def src_type; end

  # --- typekind -> Integer
  # selfの種類を示す値を取得します。
  # 
  # 値の意味については、[[m:WIN32OLE_TYPE#ole_type]]を参照してください。
  # 
  # @return 型の種類を示す数値を返します。
  # @raise WIN32OLERuntimeError 型の種類（TYPEKIND）を取得できない場合に通知します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Word 14.0 Object Library', 'Documents')
  #   p tobj.typekind   # => 4
  # 
  # @see [[m:WIN32OLE_TYPE#ole_type]]
  def typekind; end

  # --- variables -> [WIN32OLE_VARIABLE]
  # 型が持つ変数を取得します。
  # 
  # 型がEnum（列挙型）やユーザ定義型の場合、メンバ変数の情報を
  # [[c:WIN32OLE_VARIABLE]]オブジェクトの配列として返します。
  # 
  # @return 型が持つ変数情報を[[c:WIN32OLE_VARIABLE]]の配列として返します。
  #         変数を持たない場合は空配列を返します。
  # @raise WIN32OLERuntimeError 型属性が取得できない場合に通知します。
  # 
  #    tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'XlSheetType')
  #    vars = tobj.variables
  #    vars.each do |v|
  #      puts "#{v.name} = #{v.value}"
  #    end
  # 
  # 上記を実行すると以下の出力が得られます。
  # 
  #      xlChart = -4109
  #      xlDialogSheet = -4116
  #      xlExcel4IntlMacroSheet = 4
  #      xlExcel4MacroSheet = 3
  #      xlWorksheet = -4167
  # 
  # @see [[c:WIN32OLE_VARIABLE]]
  def variables; end

  # --- visible? -> bool
  # この型が公開されているかどうかを照会します。
  # 
  # @return 公開されていれば真を返します。
  # 
  #   tobj = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #   p tobj.visible?  # => true
  def visible?; end

  # --- new(libname, ole_class) -> WIN32OLE_TYPE
  # WIN32OLE_TYPEオブジェクトを生成します。
  # 
  # @param libname 生成するTypeLibのレジストリ上のドキュメント文字列
  #               （[[m:WIN32OLE_TYPELIB#name]]）または
  #                GUID（[[m:WIN32OLE_TYPELIB#guid]]）またはTLBファイル名を
  #                文字列で指定します。
  # @param ole_class 型情報を取り出す型の名前を指定します。
  # @return 指定されたTypeLIbに定義された型の情報を格納したWIN32OLE_TYPEオブジェクトを返します。
  # @raise WIN32OLERuntimeError TypeLibが見つかりません。またはole_classで指定した型が未定義です。
  # 
  #   excel_app_type = WIN32OLE_TYPE.new('Microsoft Excel 14.0 Object Library', 'Application')
  #   puts excel_app_type.progid # => "Excel.Application.14"
  # 
  # TypeLibに定義されているすべての型を取得するには、
  # [[c:WIN32OLE_TYPELIB]]オブジェクトの[[m:WIN32OLE_TYPELIB#ole_types]]メ
  # ソッドを利用します。
  def new; end

  # --- ole_classes(libname) -> [WIN32OLE_TYPE]
  # TypeLibで定義されているすべての型情報を取得します。
  # 
  # @param libname 生成するTypeLibのレジストリ上のドキュメント文字列
  #               （[[m:WIN32OLE_TYPELIB#name]]）または
  #                GUID（[[m:WIN32OLE_TYPELIB#guid]]）またはTLBファイル名を
  #                文字列で指定します。
  # @return TypeLibに格納されているすべての型を[[c:WIN32OLE_TYPE]]オブジェクトの配列として返します。
  # @raise WIN32OLERuntimeError 引数で指定したTypeLibが見つかりません。
  # 
  #    types = WIN32OLE_TYPE.ole_classes('Microsoft Excel 14.0 Object Library')
  #    classes = types.map{|k| k.name} # => ["Adjustments", "CalloutFormat", ...]
  # 
  # Ruby-1.9.1からは、TypeLibに定義されているすべての型を取得するには、
  # [[c:WIN32OLE_TYPELIB]]オブジェクトの[[m:WIN32OLE_TYPELIB#ole_types]]メ
  # ソッドを利用してください。
  def ole_classes; end

  # --- progids -> [String]
  # システムに登録されているすべてのコンポーネントクラスのPROGIDを取得します。
  # 
  # @return システムに登録されているすべてのコンポーネントクラスのPROGIDを
  #         文字列配列で返します。
  # 
  #   excel = nil
  #   WIN32OLE_TYPE.progids.each do |pg|
  #     if pg =~ /excel\.application/i   # ExcelのPROGIDをバージョン無視で取り出す
  #       excel = WIN32OLE.new(pg)
  #       break
  #     end
  #   end
  #   unless excel
  #     $stderr.puts "Excel isn't installed"
  #     exit(1)
  #   end
  #   excel.visible = true
  #   # ...
  #   excel.Quit
  # 
  # PROGIDは、生成可能なOLEオートメーションサーバのCoClass（コンポーネント
  # クラス）が持つレジストリ登録名です。[[m:WIN32OLE.new]]の引数に指定して
  # WIN32OLEオブジェクトを生成できます。
  def progids; end

  # --- typelibs -> [String]
  # システムに登録されているすべてのTypeLibのドキュメント文字列を取得します。
  # 
  # @return システムに登録されているすべてのTypeLibのドキュメント文字列の配
  #         列を返します。
  # 
  # Ruby-1.9.1からは、すべてのTypeLibのドキュメント文字列を取得するには、
  # [[c:WIN32OLE_TYPELIB]]オブジェクトを利用して、以下のように記述してくだ
  # さい。
  # 
  #  WIN32OLE_TYPELIB.typelibs.map {|t| t.name}
  def typelibs; end

end
