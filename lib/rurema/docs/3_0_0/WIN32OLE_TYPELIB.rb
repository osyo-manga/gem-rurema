class WIN32OLE_TYPELIB
  # --- guid -> String
  # TypeLibのGUIDを取得します。
  # 
  # @return TypeLibのGUIDを文字列で返します。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.guid # => '{00020813-0000-0000-C000-000000000046}'
  def guid; end

  # --- library_name -> String
  # TypeLibのヘルプファイル用ドキュメント文字列からTypeLibの名前を取得します。
  # 
  # @return TypeLibの名前を文字列で返します。
  # @raise WIN32OLERuntimeError ドキュメント文字列が取得できなかった場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    tlib.library_name # => Excel
  def library_name; end

  # --- major_version -> Integer
  # TypeLibのメジャーバージョン番号を取得します。
  # 
  # @return TypeLibのメジャーバージョン番号を整数で返します。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.major_version # => 1
  def major_version; end

  # --- minor_version -> Integer
  # TypeLibのマイナーバージョン番号を取得します。
  # 
  # @return TypeLibのマイナーバージョン番号を整数で返します。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.minor_version # => 7
  def minor_version; end

  # --- name -> String
  # --- to_s -> String
  # 
  # TypeLibのドキュメント文字列を取得します。
  # 
  # ドキュメント文字列は、コンテキストヘルプなどに利用可能なTypeLibの簡単な
  # 説明文で、通常バージョン番号を含みます。
  # 
  # @return TypeLibのドキュメント文字列を返します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.name # => 'Microsoft Excel 14.0 Object Library'
  def name; end

  # --- ole_types -> [WIN32OLE_TYPE]
  # --- ole_classes -> [WIN32OLE_TYPE]
  # 
  # TypeLibに格納されているすべての型を取得します。
  # 
  # TypeLibに格納されている型には、クラス（CoClass——コンポーネントクラス）
  # やEnum（列挙子）、構造体などがあります。
  # 
  # @return TypeLibに格納されているすべての型を[[c:WIN32OLE_TYPE]]オブジェ
  #         クトの配列として返します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    classes = tlib.ole_types.map{|k| k.name} # => ["Adjustments", "CalloutFormat", ...]
  def ole_classes; end

  # --- path -> String
  # TypeLibのパス名を取得します。
  # 
  # @return TypeLibのパス名を文字列で返します。この値はレジストリの登録値を
  #         そのまま利用するため、Rubyのパス名形式（ディレクトリ区切りは
  #         「/」）ではなく、Windowsのパス名形式（ディレクトリ区切りは「\」）
  #         です。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.path # => 'C:\...\EXCEL.EXE'
  # 
  # TypeLibは拡張子TLB（まれにOLB）という独立したファイルの場合と、サーバの
  # DLLやEXE内にリソースとして組み込まれている場合とがあります。
  def path; end

  # --- version -> Float
  # TypeLibのバージョン番号を取得します。
  # 
  # @return TypeLibのバージョン番号を整数部にメジャーバージョン番号、小数点
  #         数部にマイナーバージョン番号を設定したFloatで返します。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.version # => 1.7
  def version; end

  # --- visible? -> bool
  # TypeLibの情報が公開情報かどうかを照会します。
  # 
  # このメソッドは、TypeLibの属性（TLIBATTR）のフラグ値が0、制限
  # (LIBFLAG_FRESTRICTED)、コントロール内部使用(LIBFLAG_FHIDDEN)のいずれか
  # であれば非公開TypeLibとみなして偽を返します。
  # 
  # @return TypeLibが公開可能であれば真を返します。
  # @raise WIN32OLERuntimeError TypeLibの属性が読み取れない場合に通知します。
  # 
  #    tlib = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #    puts tlib.visible? # => true
  def visible?; end

  # --- new(libname, mjv = nil, miv = nil) -> WIN32OLE_TYPELIB
  # WIN32OLE_TYPELIBオブジェクトを生成します。
  # 
  # @param libname 生成するTypeLibのレジストリ上のドキュメント文字列
  #               （[[m:WIN32OLE_TYPELIB#name]]）または
  #                GUID（[[m:WIN32OLE_TYPELIB#guid]]）またはTLBファイル名を
  #                文字列で指定します。
  # @param mjv 作成するTypeLibのメジャーバージョン番号をIntegerで指定します。
  #            または整数部にメジャーバージョン、小数点数部にマイナーバージョ
  #            ンを指定したFloatで指定します。libnameに名前を指定した場合は
  #            無視します。
  # @param miv 作成するTypeLibのマイナーバージョン番号を整数で指定します。
  #            mjvにFloatを与えた場合およびlibnameに名前を指定した場合は無
  #            視します。
  # @return libnameで指定したWIN32OLE_TYPELIBオブジェクトを返します。
  # @raise WIN32OLERuntimeError 引数で指定したTypeLibが見つかりません。
  # 
  #     tlib1 = WIN32OLE_TYPELIB.new('Microsoft Excel 14.0 Object Library')
  #     tlib2 = WIN32OLE_TYPELIB.new('{00020813-0000-0000-C000-000000000046}')
  #     tlib3 = WIN32OLE_TYPELIB.new('{00020813-0000-0000-C000-000000000046}', 1.7)
  #     tlib4 = WIN32OLE_TYPELIB.new('{00020813-0000-0000-C000-000000000046}', 1, 7)
  #     tlib5 = WIN32OLE_TYPELIB.new("C:\\WINDOWS\\SYSTEM32\\SHELL32.DLL")
  #     puts tlib1.name  # => 'Microsoft Excel 14.0 Object Library'
  #     puts tlib2.name  # => 'Microsoft Excel 14.0 Object Library'
  #     puts tlib3.name  # => 'Microsoft Excel 14.0 Object Library'
  #     puts tlib4.name  # => 'Microsoft Excel 14.0 Object Library'
  #     puts tlib5.name  # => 'Microsoft Shell Controls And Automation'
  # 
  # TypeLibは、レジストリのHKEY_CLASS_ROOT\TypeLibキーの下にGUIDをキーとし
  # て格納されています。GUIDキーの下にバージョン番号キーが並び、ドキュメン
  # ト文字列はバージョン番号キーの既定値に設定されています。
  # 
  # ドキュメント文字列は、コンテキストヘルプなどに利用可能なTypeLibの簡単な
  # 説明文で、通常バージョン番号を含みます。
  def new; end

  # --- typelibs -> [WIN32OLE_TYPELIB]
  # 
  # システムに登録されているすべてのTypeLibを取得します。
  # 
  # @return 登録されているすべてのTypeLibを元にWIN32OLE_TYPELIBオブジェクト
  #         の配列を返します。
  # 
  #    tlibs = WIN32OLE_TYPELIB.typelibs
  def typelibs; end

end
