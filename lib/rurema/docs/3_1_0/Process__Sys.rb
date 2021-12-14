module Process::Sys
  # --- getegid    -> Integer
  # 
  # システムコールの [[man:getegid(2)]] を呼びます。返り値を整数で返します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  def getegid; end

  # --- geteuid    -> Integer
  # 
  # システムコールの [[man:geteuid(2)]] を呼びます。返り値を整数で返します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  def geteuid; end

  # --- getgid    -> Integer
  # 
  # システムコールの [[man:getgid(2)]] を呼びます。返り値を整数で返します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  def getgid; end

  # --- getuid    -> Integer
  # 
  # システムコールの [[man:getuid(2)]] を呼びます。返り値を整数で返します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  def getuid; end

  # --- issetugid    -> bool
  # 
  # システムコールの issetugid() を呼びます。
  # 
  # プロセスが setuid もしくは setgid ビットを使って
  # 起動されている場合に真を返します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  def issetugid; end

  # --- setegid(id)    -> nil
  # 
  # システムコールの [[man:setegid(2)]] を呼びます。
  # 
  # @param id システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setegid; end

  # --- seteuid(id)    -> nil
  # 
  # システムコールの [[man:seteuid(2)]] を呼びます。
  # 
  # @param id システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def seteuid; end

  # --- setgid(id)    -> nil
  # 
  # システムコールの [[man:setgid(2)]] を呼びます。
  # 
  # @param id システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setgid; end

  # --- setregid(rid, eid)    -> nil
  # 
  # システムコールの [[man:setregid(2)]] を呼びます。
  # 
  # @param rid システムコールの引数を整数で指定します。
  # 
  # @param eid システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setregid; end

  # --- setresgid(rid, eid, sid)    -> nil
  # 
  # システムコールの setresgid を呼びます。
  # 
  # @param rid システムコールの引数を整数で指定します。
  # 
  # @param eid システムコールの引数を整数で指定します。
  # 
  # @param sid システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setresgid; end

  # --- setresuid(rid, eid, sid)    -> nil
  # 
  # システムコールの setresuid を呼びます。
  # 
  # @param rid システムコールの引数を整数で指定します。
  # 
  # @param eid システムコールの引数を整数で指定します。
  # 
  # @param sid システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setresuid; end

  # --- setreuid(rid, eid)    -> nil
  # 
  # システムコールの [[man:setreuid(2)]] を呼びます。
  # 
  # @param rid システムコールの引数を整数で指定します。
  # 
  # @param eid システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setreuid; end

  # --- setrgid(id)    -> nil
  # 
  # システムコールの setrgid を呼びます。
  # 
  # @param id システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setrgid; end

  # --- setruid(id)    -> nil
  # 
  # システムコールの setruid を呼びます。
  # 
  # @param id システムコールの引数を整数で指定します。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setruid; end

  # --- setuid(id)    -> nil
  # 
  # システムコールの [[man:setuid(2)]] を呼びます。
  # 
  # @raise NotImplementedError システムコールが現在のプラットフォームで提供されていない場合に発生します。
  # 
  # @raise Errno::EXXX システムコールに失敗した場合に発生します。
  def setuid; end

end
