module FileTest
  # --- blockdev?(file)    -> bool
  # 
  # ファイルがブロックスペシャルファイルである時に真を返します。
  # そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   Dir.glob("/dev/*") { |file|
  #     puts file if FileTest.blockdev?(file)
  #   }
  #   # /dev/disk0
  #   # /dev/disk0s3
  #   # ...
  def blockdev?; end

  # --- chardev?(file)    -> bool
  # 
  # ファイルがキャラクタスペシャルファイルの時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   Dir.glob("/dev/*") { |file|
  #     puts file if FileTest.chardev?(file)
  #   }
  #   # /dev/console
  #   # /dev/tty
  #   # ...
  def chardev?; end

  # --- directory?(file)    -> bool
  # 
  # ファイルがディレクトリの時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   FileTest.directory?('/etc') # => true
  #   FileTest.directory?('/etc/passwd') # => false
  # 
  #   f = File.open('/etc')
  #   FileTest.directory?(f) # => true
  #   f.close
  #   FileTest.directory?(f) # => IOError: closed stream
  def directory?; end

  # --- zero?(file)    -> bool
  # --- empty?(file)   -> bool
  # 
  # ファイルが存在して、そのサイズが 0 である時に真を返します。
  # そうでない場合、あるいはシステムコールに失敗した場合には false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例:][ruby]{
  # IO.write("zero.txt", "")
  # FileTest.zero?("zero.txt")      # => true
  # IO.write("nonzero.txt", "1")
  # FileTest.zero?("nonzero.txt")  # => false
  # //}
  # 
  # @see [[m:FileTest.#size]], [[m:FileTest.#size?]]
  def empty?; end

  # --- executable?(file)    -> bool
  # 
  # ファイルがカレントプロセスにより実行できる時に真を返しま
  # す。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # 例:
  #   FileTest.executable?('/bin') # => true
  #   FileTest.executable?('/bin/bash') # => true
  def executable?; end

  # --- executable_real?(file)    -> bool
  # 
  # ファイルがカレントプロセスの実ユーザか実グループで実行できる時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # IO.write("empty.txt", "")
  # File.chmod(0744, "empty.txt")
  # FileTest.executable_real?("empty.txt")      # => true
  # File.chmod(0644, "empty.txt")
  # FileTest.executable_real?("empty.txt")      # => false
  # //}
  def executable_real?; end

  # --- exist?(file)    -> bool
  # 
  # ファイルが存在する時に真を返します。そうでない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   FileTest.exist?('/etc/passwd') # => true
  #   FileTest.exist?('/etc') # => true
  #   FileTest.exist?('/etc/no_such_file') # => false
  #   FileTest.exist?('/etc/no_such_directory') # => false
  def exist?; end

  # --- exists?(file)    -> bool
  # 
  # このメソッドは Ruby 2.1 から deprecated です。[[m:FileTest.#exist?]] を使用してください。
  def exists?; end

  # --- file?(file)    -> bool
  # 
  # ファイルが通常ファイルである時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   FileTest.file?('/bin/bash') # => true
  #   FileTest.file?('/bin') # => false
  #   FileTest.file?('/no_such_file') # => false
  def file?; end

  # --- grpowned?(file)    -> bool
  # 
  # ファイルのグループ ID がカレントプロセスの実効グループ ID と等しい時に真を返
  # します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "")
  # File.chown(-1, Process.gid, "testfile")
  # FileTest.grpowned?("testfile")      # => true
  # File.chown(-1, Process.gid + 10, "testfile")
  # FileTest.grpowned?("testfile")      # => false
  # //}
  def grpowned?; end

  # --- identical?(file1, file2)    -> bool
  # 
  # file1 と file2 が同じファイルを指している時に真を返します。
  # そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # ruby 1.8.3 以前では[[m:Kernel.#test]](?-, file1, file2)を使ってください。
  # 
  #   open("a", "w") {}
  #   p File.identical?("a", "a")      #=> true
  #   p File.identical?("a", "./a")    #=> true
  #   File.link("a", "b")
  #   p File.identical?("a", "b")      #=> true
  #   File.symlink("a", "c")
  #   p File.identical?("a", "c")      #=> true
  #   open("d", "w") {}
  #   p File.identical?("a", "d")      #=> false
  # 
  # @param file1 ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @param file2 ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file1, file2 が既に close されていた場合に発生します。
  def identical?; end

  # --- owned?(file)    -> bool
  # 
  # ファイルのユーザがカレントプロセスの実効ユーザと等しい時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "")
  # File.chown(Process.uid, -1, "testfile")
  # FileTest.owned?("testfile")      # => true
  # File.chown(501, -1, "testfile")
  # FileTest.owned?("testfile")      # => false
  # //}
  def owned?; end

  # --- pipe?(file)    -> bool
  # 
  # 指定したファイルがパイプである時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # 例:
  #   r, w = IO.pipe
  #   FileTest.pipe?(r) # => true
  #   FileTest.pipe?(w) # => true
  def pipe?; end

  # --- readable?(file)    -> bool
  # 
  # ファイルがカレントプロセスにより読み込み可能な時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "")
  # File.chmod(0644, "testfile")
  # FileTest.readable?("testfile")      # => true
  # File.chmod(0200, "testfile")
  # FileTest.readable?("testfile")      # => false
  # //}
  def readable?; end

  # --- readable_real?(file)    -> bool
  # 
  # ファイルがカレントプロセスの実ユーザか実グループによって読み込み可能な時に真を
  # 返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # 
  # @see [[m:FileTest.#readable?]]
  def readable_real?; end

  # --- setgid?(file)    -> bool
  # 
  # ファイルが [[man:setgid(2)]] されている時に真を返
  # します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'fileutils'
  # IO.write("testfile", "")
  # FileUtils.chmod("g+s", "testfile")
  # FileTest.setgid?("testfile")      # => true
  # FileUtils.chmod("g-s", "testfile")
  # FileTest.setgid?("testfile")      # => false
  # //}
  def setgid?; end

  # --- setuid?(file)    -> bool
  # 
  # ファイルが [[man:setuid(2)]] されている時に真を返
  # します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require 'fileutils'
  # IO.write("testfile", "")
  # FileUtils.chmod("u+s", "testfile")
  # FileTest.setuid?("testfile")      # => true
  # FileUtils.chmod("u-s", "testfile")
  # FileTest.setuid?("testfile")      # => false
  # //}
  def setuid?; end

  # --- size(file)    -> Integer
  # 
  # ファイルのサイズを返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise Errno::EXXX file が存在しない場合、あるいはシステムコールに失敗した場合に発生します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # @see [[m:FileTest.#size?]], [[m:FileTest.#zero?]]
  # 
  # 例:
  #   FileTest.size('/etc/passwd') # => 5925
  def size; end

  # --- size?(file)    -> Integer | nil
  # 
  # ファイルのサイズを返します。ファイルが存在しない時や
  # ファイルのサイズが0の時には nil を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # FileTest.size?("testfile")      # => 4
  # File.delete("testfile")
  # FileTest.size?("testfile")      # => nil
  # //}
  # 
  # @see [[m:FileTest.#size]], [[m:FileTest.#zero?]] 
  def size?; end

  # --- socket?(file)    -> bool
  # 
  # ファイルがソケットである時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # @raise IOError 指定された IO オブジェクト file が既に close されていた場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require "socket"
  # 
  # IO.write("testfile", "test")
  # p FileTest.socket?("testfile")                                           # => false
  # Socket.unix_server_socket('testsock') { p FileTest.socket?('testsock') } # => true
  # //}
  def socket?; end

  # --- sticky?(file)    -> bool
  # 
  # ファイルの sticky ビット([[man:chmod(2)]] 参照)が
  # 立っている時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列か IO オブジェクトを指定します。
  # 
  # //emlist[例][ruby]{
  # require 'fileutils'
  # IO.write("testfile", "")
  # FileUtils.chmod("o+t", "testfile")
  # FileTest.sticky?("testfile")      # => true
  # FileUtils.chmod("o-t", "testfile")
  # FileTest.sticky?("testfile")      # => false
  # //}
  def sticky?; end

  # --- symlink?(file)    -> bool
  # 
  # ファイルがシンボリックリンクである時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # FileTest.symlink?("testfile")      # => false
  # File.symlink("testfile", "testlink")
  # FileTest.symlink?("testlink")      # => true
  # //}
  def symlink?; end

  # --- world_readable?(path)    -> Integer | nil
  # 
  # path が全てのユーザから読めるならばそのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # @param path パスを表す文字列を指定します。
  # 
  #    m = FileTest.world_readable?("/etc/passwd")
  #    "%o" % m                               # => "644"
  def world_readable?; end

  # --- world_writable?(path)    -> bool
  # 
  # path が全てのユーザから書き込めるならば、そのファイルのパーミッションを表す
  # 整数を返します。そうでない場合は nil を返します。
  # 
  # 整数の意味はプラットフォームに依存します。
  # 
  # @param path パスを表す文字列を指定します。
  # 
  #    m = FileTest.world_writable?("/tmp")
  #    "%o" % m                               #=> "777"
  def world_writable?; end

  # --- writable?(file)    -> bool
  # 
  # ファイルがカレントプロセスにより書き込み可能である時に真を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # //emlist[例][ruby]{
  # IO.write("testfile", "test")
  # File.chmod(0600, "testfile")
  # FileTest.writable?("testfile")      # => true
  # File.chmod(0400, "testfile")
  # FileTest.writable?("testfile")      # => false
  # //}
  def writable?; end

  # --- writable_real?(file)    -> bool
  # 
  # ファイルがカレントプロセスの実ユーザか実グループによって書き込み可能である時に真
  # を返します。そうでない場合、ファイルが存在しない場合、あるいはシステムコールに失敗した場合などには false を返します。
  # 
  # @param file ファイル名を表す文字列を指定します。
  # 
  # 
  # @see [[m:FileTest.#writable?]]
  def writable_real?; end

end
