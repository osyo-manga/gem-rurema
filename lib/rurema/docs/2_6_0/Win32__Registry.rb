class Win32::Registry
  # --- [](name, wtype = nil)
  # @todo
  # 
  # レジストリ値 name に value を書き込みます。
  # 
  # オプション引数 wtype を指定した場合は，その型で書き込みます。
  # 指定しなかった場合，value のクラスに応じて次の型で書き込みます:
  #   * Integer
  #     REG_DWORD
  #   * String
  #     REG_SZ
  #   * Array
  #     REG_MULTI_SZ
  def []; end

  # --- []=(name, rtype, value = nil)
  # @todo
  def []=; end

  # --- _dump
  # @todo
  def _dump; end

  # --- close
  # @todo
  # 
  # 開かれているキーを閉じます。
  # 
  # 閉じられた後では，多くのメソッドは例外を発生します。
  def close; end

  # --- create(subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED)
  # @todo
  # 
  # [[m:Win32::Registry.create]](self, subkey, desired, opt) と同じです。
  def create; end

  # --- created?
  # @todo
  # 
  # キーが新しく作成された場合，真を返します。
  # (⇒[[m:Win32::Registry.create]])
  def created?; end

  # --- delete(name)
  # --- delete_value(name)
  # @todo
  # 
  # レジストリ値 name を削除します。
  # (標準) レジストリ値を削除することはできません。
  def delete; end

  # --- delete_key(name, recursive = false)
  # @todo
  # 
  # サブキー name とそのキーが持つすべての値を削除します。
  # 
  # recursive が false の場合，そのサブキーはサブキーを持っていてはなりません。
  # true の場合，キーは再帰的に削除されます。
  def delete_key; end

  # --- num_keys
  # --- max_key_length
  # --- num_values
  # --- max_value_name_length
  # --- max_value_length
  # --- descriptor_length
  # --- wtime
  # @todo
  # 
  # キー情報の個々の値を返します。
  def descriptor_length; end

  # --- disposition
  # @todo
  # 
  # キーの disposition 値を返します。
  # (REG_CREATED_NEW_KEY または REG_OPENED_EXISTING_KEY)
  def disposition; end

  # --- each {|name, type, value| ... }
  # --- each_value {|name, type, value| ... }
  # @todo
  # 
  # キーが持つレジストリ値を列挙します。
  def each; end

  # --- each_key {|subkey, wtime| ... }
  # @todo
  # 
  # キーのサブキーを列挙します。
  # 
  # subkey はサブキーの名前を表す String です。
  # wtime は最終更新時刻を表す FILETIME (64-bit 整数) です。
  # (⇒[[m:Win32::Registry.wtime2time]])
  def each_key; end

  # --- flush
  # @todo
  # 
  # キーの全てのデータをレジストリファイルに書き込みます。
  def flush; end

  # --- hkey
  # @todo
  def hkey; end

  # --- info
  # @todo
  # 
  # キー情報を以下の値の配列で返します:
  #   * num_keys
  #     サブキーの個数
  #   * max_key_length
  #     サブキー名の最大長
  #   * num_values
  #     値の個数
  #   * max_value_name_length
  #     値の名前の最大長
  #   * max_value_length
  #     値の最大長
  #   * descriptor_length
  #     セキュリティ記述子の長さ
  #   * wtime
  #     最終更新時刻 (FILETIME)
  # 
  # 詳細は以下の Win32 API を参照してください。
  # 
  #  * RegQueryInfoKey: [[url:http://msdn.microsoft.com/library/en-us/sysinfo/base/regqueryinfokey.asp]]
  def info; end

  # --- inspect
  # @todo
  def inspect; end

  # --- keyname
  # @todo
  # 
  # [[m:Win32::Registry.open]] または [[m:Win32::Registry.create]] に指定された
  # subkey の値を返します。
  def keyname; end

  # --- keys
  # @todo
  def keys; end

  # --- name
  # --- to_s
  # @todo
  # 
  # キーのフルパスを 'HKEY_CURRENT_USER\SOFTWARE\foo\bar'
  # のような形で返します。
  def name; end

  # --- open(subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)
  # @todo
  # 
  # [[m:Win32::Registry.open]](self, subkey, desired, opt) と同じです。
  def open; end

  # --- open?
  # @todo
  def open?; end

  # --- opened?
  # @todo
  # 
  # キーがまだ閉じられていない場合，真を返します。
  def opened?; end

  # --- parent
  # @todo
  # 
  # 親のキーを表す Win32::Registry オブジェクトを返します。
  # 定義済キーでは nil を返します。
  def parent; end

  # --- read(name, *rtype)
  # @todo
  # 
  # レジストリ値 name を読み，[ type, data ]
  # の配列で返します。
  # name が nil の場合，(標準) レジストリ値が読み込まれます。
  # 
  # type はレジストリ値の型です。(⇒[[c:Win32::Registry::Constants]])
  # data はレジストリ値のデータで，クラスは以下の通りです:
  #   * REG_SZ, REG_EXPAND_SZ
  #     String
  #   * REG_MULTI_SZ
  #     String の配列
  #   * REG_DWORD, REG_DWORD_BIG_ENDIAN, REG_QWORD
  #     Integer
  #   * REG_BINARY, REG_NONE
  #     String (バイナリデータを含みます)
  # 
  # オプション引数 rtype が指定されていた場合，レジストリ値の型が
  # 与えられた rtype の配列に存在するかチェックされ，存在しない場合に
  # [[c:TypeError]] が発生します。
  def read; end

  # --- read_s(name)
  # --- read_i(name)
  # --- read_bin(name)
  # @todo
  # 
  # 型がそれぞれ REG_SZ(read_s), REG_DWORD(read_i), REG_BINARY(read_bin)
  # であるレジストリ値 name を読み，その値を返します。
  # 
  # 型がマッチしなかった場合，TypeError が発生します。
  def read_bin; end

  # --- read_s_expand(name)
  # @todo
  # 
  # 型が REG_SZ または REG_EXPAND_SZ であるレジストリ値 name を読み，
  # その値を返します。
  # 
  # 型が REG_EXPAND_SZ だった場合，環境変数が置換された値が返ります。
  # REG_SZ または REG_EXPAND_SZ 以外だった場合，TypeError が発生します。
  def read_s_expand; end

  # --- write(name, type, data)
  # @todo
  # 
  # レジストリ値 name に型 type で data を書き込みます。
  # name が nil の場合，(標準) レジストリ値に書き込みます。
  # 
  # type はレジストリ値の型です。(⇒[[c:Win32::Registry::Constants]])
  # data のクラスは [[m:Win32::Registry#read]]
  # メソッドに準じていなければなりません。
  def write; end

  # --- write_s(name, value)
  # --- write_i(name, value)
  # --- write_bin(name, value)
  # @todo
  # 
  # レジストリ値 name に value を書き込みます。
  # 
  # レジストリ値の型はそれぞれ REG_SZ(write_s), REG_DWORD(write_i),
  # REG_BINARY(write_bin) です。
  def write_bin; end

  # --- create(key, subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED)
  # --- create(key, subkey, desired = KEY_ALL_ACCESS, opt = REG_OPTION_RESERVED) {|reg| ... }
  # @todo
  # 
  # レジストリキー key 下にキー subkey を作成し，
  # 開いたキーを表す Win32::Registry オブジェクトを返します。
  # key は親のキーを Win32::Registry オブジェクトで指定します。
  # 親のキーには定義済キー HKEY_* を使用できます (⇒[[c:Win32::Registry::Constants]])
  # 
  # サブキーが既に存在していればキーはただ開かれ，[[m:Win32::Registry#created?]]
  # メソッドが false を返します。
  # 
  # ブロックが与えられると，キーは自動的に閉じられます。
  def create; end

  # --- expand_environ(str)
  # @todo
  # 
  # str の %\w+% という並びを環境変数に置換します。
  # REG_EXPAND_SZ で用いられます。
  # 
  # 詳細は以下の Win32 API を参照してください。
  # 
  #  * ExpandEnvironmentStrings: [[url:http://msdn.microsoft.com/library/en-us/sysinfo/base/expandenvironmentstrings.asp]]
  def expand_environ; end

  # --- new(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)
  # --- new(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED) {|reg| ... }
  # --- open(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED)
  # --- open(key, subkey, desired = KEY_READ, opt = REG_OPTION_RESERVED) {|reg| ... }
  # @todo
  # 
  # レジストリキー key 下のキー subkey を開き，
  # 開いたキーを表す Win32::Registry オブジェクトを返します。
  # key は親のキーを Win32::Registry オブジェクトで指定します。
  # 親のキーには定義済キー HKEY_* を使用できます (⇒[[c:Win32::Registry::Constants]])
  # 
  # desired はアクセスマスクです。opt はキーのオプションです。
  # 詳細は以下の MSDN Library を参照してください。
  # 
  #  * Registry Key Security and Access Rights: [[url:http://msdn.microsoft.com/library/en-us/sysinfo/base/registry_key_security_and_access_rights.asp]]
  # 
  # ブロックが与えられると，キーは自動的に閉じられます。
  def new; end

  # --- time2wtime(time)
  # @todo
  # 
  # Time オブジェクトまたは Integer オブジェクトを受け取り，
  # 64bit の FILETIME に変換します。
  def time2wtime; end

  # --- type2name(type)
  # @todo
  # 
  # レジストリ値の型を整数から可読文字列に変換します。
  def type2name; end

  # --- wtime2time(wtime)
  # @todo
  # 
  # 64bit の FILETIME を Time オブジェクトに変換します。
  # 
  # 詳細は以下の MSDN Library を参照してください。
  # 
  #  * FILETIME Structure: [[url:http://msdn.microsoft.com/library/en-us/sysinfo/base/filetime_str.asp]]
  def wtime2time; end

  # --- HKEY_CLASSES_ROOT        -> Win32::Registry
  # --- HKEY_CURRENT_USER        -> Win32::Registry
  # --- HKEY_LOCAL_MACHINE       -> Win32::Registry
  # --- HKEY_USERS               -> Win32::Registry
  # --- HKEY_PERFORMANCE_DATA    -> Win32::Registry
  # --- HKEY_PERFORMANCE_TEXT    -> Win32::Registry
  # --- HKEY_PERFORMANCE_NLSTEXT -> Win32::Registry
  # --- HKEY_CURRENT_CONFIG      -> Win32::Registry
  # --- HKEY_DYN_DATA            -> Win32::Registry
  # @todo
  # 
  # それぞれの定義済キーを表す Win32::Registry オブジェクトです。
  # 
  # 詳細は以下の MSDN Library を参照してください。
  # 
  #  * Predefined Keys: [[url:http://msdn.microsoft.com/library/en-us/sysinfo/base/predefined_keys.asp]]
  def HKEY_CLASSES_ROOT; end

end
