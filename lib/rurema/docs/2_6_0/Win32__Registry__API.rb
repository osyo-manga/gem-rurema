module Win32::Registry::API
  # --- CloseKey(hkey)
  # --- CreateKey(hkey, name, opt, desired)
  # --- DeleteKey(hkey, name)
  # --- DeleteValue(hkey, name)
  # --- EnumKey(hkey, index)
  # --- EnumValue(hkey, index)
  # --- FlushKey(hkey)
  # --- OpenKey(hkey, name, opt, desired)
  # --- QueryInfoKey(hkey)
  # --- QueryValue(hkey, name)
  # --- SetValue(hkey, name, type, data, size)
  # --- check(result)
  # --- packdw(dw)
  # --- packqw(qw)
  # --- unpackdw(dw)
  # --- unpackqw(qw)
  # @todo
  def CloseKey; end

  # --- RegCloseKey
  # --- RegCreateKeyExA
  # --- RegDeleteKey
  # --- RegDeleteValue
  # --- RegEnumKeyExA
  # --- RegEnumValueA
  # --- RegFlushKey
  # --- RegOpenKeyExA
  # --- RegQueryInfoKey
  # --- RegQueryValueExA
  # --- RegSetValueExA
  # @todo
  def RegCloseKey; end

end
