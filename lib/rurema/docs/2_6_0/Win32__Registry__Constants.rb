module Win32::Registry::Constants
  # --- HKEY_CLASSES_ROOT
  # --- HKEY_CURRENT_USER
  # --- HKEY_LOCAL_MACHINE
  # --- HKEY_USERS
  # --- HKEY_PERFORMANCE_DATA
  # --- HKEY_PERFORMANCE_TEXT
  # --- HKEY_PERFORMANCE_NLSTEXT
  # --- HKEY_CURRENT_CONFIG
  # --- HKEY_DYN_DATA
  # @todo
  # 
  # 定義済キー値。
  # これらは Integer で、Win32::Registry オブジェクトではありません。
  def HKEY_CLASSES_ROOT; end

  # --- STANDARD_RIGHTS_READ
  # --- STANDARD_RIGHTS_WRITE
  # --- KEY_QUERY_VALUE
  # --- KEY_SET_VALUE
  # --- KEY_CREATE_SUB_KEY
  # --- KEY_ENUMERATE_SUB_KEYS
  # --- KEY_NOTIFY
  # --- KEY_CREATE_LINK
  # --- KEY_READ
  # --- KEY_WRITE
  # --- KEY_EXECUTE
  # --- KEY_ALL_ACCESS
  # @todo
  # 
  # セキュリティアクセスマスク。
  def KEY_ALL_ACCESS; end

  # --- MAX_KEY_LENGTH
  # --- MAX_VALUE_LENGTH
  # @todo
  def MAX_KEY_LENGTH; end

  # --- REG_NONE
  # --- REG_SZ
  # --- REG_EXPAND_SZ
  # --- REG_BINARY
  # --- REG_DWORD
  # --- REG_DWORD_LITTLE_ENDIAN
  # --- REG_DWORD_BIG_ENDIAN
  # --- REG_LINK
  # --- REG_MULTI_SZ
  # --- REG_RESOURCE_LIST
  # --- REG_FULL_RESOURCE_DESCRIPTOR
  # --- REG_RESOURCE_REQUIREMENTS_LIST
  # --- REG_QWORD
  # --- REG_QWORD_LITTLE_ENDIAN
  # @todo
  # 
  # レジストリ値の型。
  def REG_BINARY; end

  # --- REG_CREATED_NEW_KEY
  # --- REG_OPENED_EXISTING_KEY
  # @todo
  # 
  # キーが新しく作られたか、既存キーが開かれたか。
  # [[m:Win32::Registry#disposition]] メソッドも参照してください。
  def REG_CREATED_NEW_KEY; end

  # --- REG_WHOLE_HIVE_VOLATILE
  # --- REG_REFRESH_HIVE
  # --- REG_NO_LAZY_FLUSH
  # --- REG_FORCE_RESTORE
  # @todo
  def REG_FORCE_RESTORE; end

  # --- REG_OPTION_RESERVED
  # --- REG_OPTION_NON_VOLATILE
  # --- REG_OPTION_VOLATILE
  # --- REG_OPTION_CREATE_LINK
  # --- REG_OPTION_BACKUP_RESTORE
  # --- REG_OPTION_OPEN_LINK
  # --- REG_LEGAL_OPTION
  # @todo
  def REG_LEGAL_OPTION; end

end
