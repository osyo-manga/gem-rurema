class Dir
  # --- children -> [String]
  # ディレクトリのファイルエントリ名のうち、
  # "." と ".." をのぞいた配列を返します。
  # 
  # @raise IOError 既に self が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open('.'){|d|
  #   p d.children # => ["bar", "foo"]
  # }
  # //}
  # 
  # @see [[m:Dir.children]]
  def children; end

  # --- close    -> nil
  # 
  # ディレクトリストリームをクローズします。
  # クローズに成功すれば nil を返します。
  # 
  # //emlist[例][ruby]{
  # d = Dir.new(".")
  # d.close  # => nil
  # //}
  def close; end

  # --- each {|item| ... }    -> self
  # --- each                  -> Enumerator
  # 
  # ディレクトリの各エントリを表す文字列を引数として、ブロックを評価します。
  # 
  # ブロックが与えられなかった場合、各エントリを文字列として保持する
  # [[c:Enumerator]]
  # オブジェクトを返します。
  # 
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open('.').each{|f|
  #   p f
  # }
  # #=> "."
  # #   ".."
  # #   "bar"
  # #   "foo"
  # //}
  # 
  # @see [[m:Dir#each_child]]
  def each; end

  # --- each_child {|item| ... }    -> self
  # --- each_child                  -> Enumerator
  # 
  # ディレクトリの "." と ".." をのぞく各エントリを表す文字列を引数として、
  # ブロックを評価します。
  # 
  # ブロックが与えられなかった場合、各エントリを文字列として保持する
  # [[c:Enumerator]]
  # オブジェクトを返します。
  # 
  # @raise IOError 既に self が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open('.').each_child{|f|
  #   p f
  # }
  # #=> "bar"
  # #   "foo"
  # //}
  # 
  # @see [[m:Dir#each]]
  # @see [[m:Dir.each_child]]
  def each_child; end

  # --- fileno -> Integer
  # 
  # self に関連づけられたファイル記述子を表す整数を返します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("..") { |d| d.fileno } # => 8
  # //}
  # 
  # 本メソッドでは POSIX 2008 で定義されている dirfd() 関数を使用します。
  # 
  # @raise NotImplementedError Windows などの dirfd() 関数が存在しないプラッ
  #                            トフォームで発生します。
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # @see [[m:IO#fileno]]
  def fileno; end

  # --- inspect -> String
  # 
  # self の情報を人間に読みやすい文字列にして返します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("/") { |d| d.inspect } # => "#<Dir:/>"
  # //}
  def inspect; end

  # --- path    -> String
  # --- to_path -> String
  # 
  # オープンしているディレクトリのパス名を文字列で返します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("..") do |d|
  #   d.path      # => ".."
  #   d.to_path   # => ".."
  # end
  # //}
  def path; end

  # --- pos     -> Integer
  # --- tell    -> Integer
  # 
  # ディレクトリストリームの現在の位置を整数で返します。
  # 
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("/tmp") {|d|
  #   d.each {|f|
  #     p d.pos
  #   }
  # }
  # //}
  def pos; end

  # --- pos=(pos)
  # --- seek(pos)    -> self
  # 
  # ディレクトリストリームの読み込み位置を pos に移動させます。
  # pos は [[m:Dir#tell]] で与えられた値でなければなりま
  # せん。
  # 
  # @param pos 変更したい位置を整数で与えます。
  # 
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("testdir") do |d|
  #   d.read                   # => "."
  #   i = d.tell               # => 12
  #   d.read                   # => ".."
  #   d.seek(i)                # => #<Dir:0x401b3c40>
  #   d.read                   # => ".."
  # end
  # //}
  def pos=; end

  # --- read    -> String | nil
  # 
  # ディレクトリストリームから次の要素を読み出して返します。最後の要素
  # まで読み出していれば nil を返します。
  # 
  # @raise Errno::EXXX ディレクトリの読み出しに失敗した場合に発生します。
  # 
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # require 'tmpdir'
  # 
  # Dir.mktmpdir do |tmpdir|
  #   File.open("#{tmpdir}/test1.txt", "w") { |f| f.puts("test1") }
  #   File.open("#{tmpdir}/test2.txt", "w") { |f| f.puts("test2") }
  #   Dir.open(tmpdir) do |d|
  #     p d.read   # => "."
  #     p d.read   # => ".."
  #     p d.read   # => "test1.txt"
  #     p d.read   # => "test2.txt"
  #     p d.read   # => nil
  #   end
  # end
  # //}
  def read; end

  # --- rewind    -> self
  # 
  # ディレクトリストリームの読み込み位置を先頭に移動させます。
  # 
  # @raise IOError 既に自身が close している場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.open("testdir") do |d|
  #   d.read     # => "."
  #   d.rewind   # => #<Dir:0x401b3fb0>
  #   d.read     # => "."
  # end
  # //}
  def rewind; end

  # --- [](*pattern, base: nil)                            -> [String]
  # --- glob(pattern, flags = 0, base: nil)                -> [String]
  # --- glob(pattern, flags = 0, base: nil) {|file| ...}   -> nil
  # 
  # ワイルドカードの展開を行い、
  # パターンにマッチするファイル名を文字列の配列として返します。
  # パターンにマッチするファイルがない場合は空の配列を返します。
  # 
  # ブロックが与えられたときはワイルドカードにマッチしたファイルを
  # 引数にそのブロックを 1 つずつ評価して nil を返します
  # 
  # @param pattern パターンを文字列か配列で指定します。
  #                配列を指定すると複数のパターンを指定できます。
  #                パターンを文字列で指定する場合、パターンを "\0" で区切って
  #                1 度に複数のパターンを指定することもできます。
  #                パターンの区切りには "\0" のみ指定できます。
  # 
  # @param flags [[m:File.fnmatch]] に指定できるフラグと同様のフラグを指定できます。
  #              このフラグを指定することでマッチの挙動を変更することができます。
  # 
  # //emlist[][ruby]{
  # Dir.glob("*")                      #=> ["bar", "foo"]
  # Dir.glob("*", File::FNM_DOTMATCH)  #=> [".", "..", "bar", "foo"]
  # //}
  # 
  # @param base カレントディレクトリの代わりに相対パスの基準にするベースディレクトリを指定します。
  #             指定した場合、結果の頭にはベースディレクトリはつかないので、
  #             絶対パスが必要な場合はベースディレクトリを追加する必要があるでしょう。
  # 
  # ワイルドカードには以下のものがあります。これらはバックスラッシュに
  # よりエスケープすることができます。ダブルクォートの文字列中では 2
  # 重にエスケープする必要があることに注意してください。
  # ワイルドカードはデフォルトではファイル名の先頭の "." にマッチしません。
  # 
  # : *
  #     空文字列を含む任意の文字列と一致します。
  # : ?
  #     任意の一文字と一致します。
  # : [ ]
  #     鈎括弧内のいずれかの文字と一致します。- でつな
  #     がれた文字は範囲を表します。鈎括弧の中の最初の文字が
  #     ^ である時には含まれない文字と一致します。
  #     ^ の代わりに ksh や POSIX shell のように ! も同じ意
  #     味で使えます。
  # : { }
  #     コンマで区切られた文字列の組合せに展開します。例えば、
  #     foo{a,b,c} は fooa, foob, fooc
  #     に展開されそれぞれに対してマッチ判定を行います。
  # 
  #     括弧は入れ子にすることができます。例えば、
  #     {foo,bar{foo,bar}} は foo, barfoo, barbar
  #     のそれぞれにマッチします。
  # : **/
  #     ワイルドカード */ の0回以上の繰り返しを意味し、
  #     ディレクトリを再帰的にたどってマッチを行います。
  #     例えば,
  #     foo/**/bar は foo/bar, foo/*/bar,
  #     foo/*/*/bar ... (以下無限に続く)に対してそれぞれ
  #     マッチ判定を行います。
  # 
  # //emlist[][ruby]{
  # # 一般的な例
  # p Dir.glob("*")          #=> ["foo", "bar", "baz"]
  # p Dir.glob("./b*")       #=> ["./bar", "./baz"]      先頭に "./" が付いている。
  # p Dir.glob("*/")         #=> ["foo/"]                ディレクトリのみにマッチする。
  # p Dir.glob("wrong_name") #=> []                      マッチしないと空の配列を返す。
  # 
  # Dir.glob("b*") {|f| p f }
  # 
  # #=> "bar"
  # #   "baz"
  # 
  # # 複数のパターンを指定する例
  # p Dir.glob(["f*", "b*"]) # => ["foo", "bar"]
  # p Dir["f*", "b*"]        # => ["foo", "bar"]
  # p Dir.glob("f*\0b*")     # => ["foo", "bar"]
  # 
  # # ワイルドカードの例
  # Dir.glob("*")            #=> ["foo", "bar"]
  # Dir.glob("fo?")          #=> ["foo"]
  # Dir.glob("[^f]*")        #=> ["bar"]
  # Dir.glob("{b,f}*")       #=> ["bar", "foo"]
  # 
  # # ベースディレクトリの例
  # rbfiles = File.join("**", "*.rb")
  # Dir.glob(rbfiles)                   #=> ["main.rb",
  #                                     #    "lib/song.rb",
  #                                     #    "lib/song/karaoke.rb"]
  # Dir.glob(rbfiles, base: "lib")      #=> ["song.rb",
  #                                     #    "song/karaoke.rb"]
  # //}
  def []; end

  # --- chdir           -> 0
  # --- chdir(path)     -> 0
  # --- chdir {|path| ... }          -> object
  # --- chdir(path) {|path| ... }    -> object
  # 
  # カレントディレクトリを path に変更します。
  # 
  # path を省略した場合、環境変数 HOME または LOGDIR
  # が設定されていればそのディレクトリに移動します。
  # カレントディレクトリの変更に成功すれば 0 を返します。
  # 
  # ブロックが指定された場合、カレントディレクトリの変更はブロックの実行中に限
  # られます。ブロックの実行結果を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.chdir("/var/spool/mail")
  # p Dir.pwd                    #=> "/var/spool/mail"
  # Dir.chdir("/tmp") do
  #   p Dir.pwd                  #=> "/tmp"
  # end 
  # p Dir.pwd                    #=> "/var/spool/mail"
  # //}
  def chdir; end

  # --- children(path)                -> [String]
  # --- children(path, encoding: enc) -> [String]
  # 
  # ディレクトリ path に含まれるファイルエントリ名のうち、
  # "." と ".." をのぞいた配列を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param encoding ディレクトリのエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します。省略した場合は
  #                 ファイルシステムのエンコーディングと同じになります。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.children('.') #=> ["bar", "foo"]
  # //}
  # 
  # @see [[m:Dir#children]]
  # @see [[m:Dir.each_child]]
  # @see [[m:Dir.entries]]
  def children; end

  # --- chroot(path)    -> 0
  # 
  # ルートディレクトリを path に変更します。
  # 
  # スーパーユーザだけがルートディレクトリを変更できます。
  # ルートディレクトリの変更に成功すれば 0 を返します。
  # 各プラットフォームのマニュアルの chroot の項も参照して下さい。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p Dir.glob("*")   #=> ["file1", "file2]
  # Dir.chroot("./")
  # p Dir.glob("/*")  #=> ["/file1", "/file2]
  # //}
  # 
  # @see [[url:http://opengroup.org/onlinepubs/007908799/xsh/chroot.html]]
  def chroot; end

  # --- delete(path)    -> 0
  # --- rmdir(path)     -> 0
  # --- unlink(path)    -> 0
  # 
  # ディレクトリを削除します。ディレクトリは空でなければいけませ
  # ん。ディレクトリの削除に成功すれば 0 を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.delete("/tmp/hoge-jbrYBh.tmp")
  # //}
  def delete; end

  # --- each_child(path) {|file| ...}                -> nil
  # --- each_child(path, encoding: enc) {|file| ...} -> nil
  # --- each_child(path)                             -> Enumerator
  # --- each_child(path, encoding: enc)              -> Enumerator
  # 
  # ディレクトリ path の "." と ".." をのぞく各エントリを表す文字列を引数として、
  # ブロックを評価します。
  # 
  # ブロックが与えられなかった場合、各エントリを文字列として保持する
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param encoding ディレクトリのエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します。省略した場合は
  #                 ファイルシステムのエンコーディングと同じになります。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.each_child('.'){|f|
  #   p f
  # }
  # #=> "bar"
  # #   "foo"
  # //}
  # 
  # @see [[m:Dir.foreach]]
  # @see [[m:Dir.children]]
  # @see [[m:Dir#each_child]]
  def each_child; end

  # --- empty?(path_name)    -> bool
  # 
  # path_name で与えられたディレクトリが空の場合に真を返します。
  # ディレクトリでない場合や空でない場合に偽を返します。
  # 
  # //emlist[例][ruby]{
  # Dir.empty?('.')      #=> false
  # Dir.empty?(IO::NULL) #=> false
  # require 'tmpdir'
  # Dir.mktmpdir { |dir| Dir.empty?(dir) } #=> true
  # //}
  # 
  # @param path_name 確認したいディレクトリ名。
  def empty?; end

  # --- entries(path)                                        -> [String]
  # --- entries(path, encoding: Encoding.find("filesystem")) -> [String]
  # 
  # ディレクトリ path に含まれるファイルエントリ名の
  # 配列を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param encoding ディレクトリのエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します。省略した場合は
  #                 ファイルシステムのエンコーディングと同じになります。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.entries('.') #=> [".", "..", "bar", "foo"]
  # //}
  # 
  # @see [[m:Dir.foreach]]
  # @see [[m:Dir.children]]
  def entries; end

  # --- exist?(file_name)    -> bool
  # 
  # file_name で与えられたディレクトリが存在する場合に真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param file_name 存在を確認したいディレクトリ名。
  # 
  # //emlist[例][ruby]{
  # Dir.exist?(".")      # => true
  # Dir.exists?(".")     # => true
  # File.directory?(".") # => true
  # //}
  # 
  # @see [[m:File.directory?]]
  def exist?; end

  # --- exists?(file_name)    -> bool
  # 
  # このメソッドは Ruby 2.1 から deprecated です。[[m:Dir.exist?]] を使用してください。
  def exists?; end

  # --- foreach(path) {|file| ...}                                        -> nil
  # --- foreach(path, encoding: Encoding.find("filesystem")) {|file| ...} -> nil
  # --- foreach(path)                                                     -> Enumerator
  # --- foreach(path, encoding: Encoding.find("filesystem"))              -> Enumerator
  # 
  # ディレクトリ path の各エントリを表す文字列を引数として、ブロックを評価します。
  # 
  # ブロックが与えられなかった場合、各エントリを文字列として保持する
  # [[c:Enumerator]] オブジェクトを返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param encoding ディレクトリのエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します。省略した場合は
  #                 ファイルシステムのエンコーディングと同じになります。
  # 
  # @raise Errno::EXXX 失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # Dir.foreach('.'){|f|
  #   p f
  # }
  # #=> "."
  # #   ".."
  # #   "bar"
  # #   "foo"
  # //}
  # 
  # @see [[m:Dir.entries]]
  # @see [[m:Dir.each_child]]
  def foreach; end

  # --- getwd    -> String
  # --- pwd      -> String
  # 
  # カレントディレクトリのフルパスを文字列で返します。
  # 
  # @raise Errno::EXXX カレントディレクトリの取得に失敗した場合に発生します(が、普通は失敗することはありません)。
  # 
  # //emlist[例][ruby]{
  # Dir.chdir("/tmp")   #=> 0
  # Dir.getwd           #=> "/tmp"
  # //}
  def getwd; end

  # --- home          -> String | nil
  # --- home(user)    -> String | nil
  # 
  # 現在のユーザまたは指定されたユーザのホームディレクトリを返します。
  # 
  # Dir.home や Dir.home("root") は
  # File.expand_path("~") や File.expand_path("~root") と
  # ほぼ同じです。
  # 
  # //emlist[例][ruby]{
  # Dir.home          # => "/home/vagrant"
  # Dir.home("root")  # => "/root"
  # //}
  # 
  # @see [[m:File.expand_path]]
  def home; end

  # --- mkdir(path, mode = 0777)    -> 0
  # 
  # path で指定された新しいディレクトリを作ります。パーミッションは
  # mode で指定された値に umask をかけた値 (mode & ~umask) になります。
  # [[man:mkdir(2)]] も参照して下さい。
  # ディレクトリの作成に成功すれば 0 を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param mode ディレクトリのモードを整数で与えます。
  # 
  # @raise Errno::EXXX ディレクトリの作成に失敗した場合に発生します。
  # 
  # //emlist[例][ruby]{
  # p File.umask                                  #=> 2
  # Dir.mkdir('t', 0666)
  # p "%#o" % (07777 & File.stat('t').mode)  #=> "0664"
  # //}
  # 
  # @see [[m:FileUtils.#makedirs]]
  def mkdir; end

  # --- mktmpdir(prefix_suffix = nil, tmpdir = nil)             -> String
  # --- mktmpdir(prefix_suffix = nil, tmpdir = nil){|dir| ... } -> object
  # 
  # 一時ディレクトリを作成します。
  # 
  # 作成されたディレクトリのパーミッションは 0700 です。
  # 
  # ブロックが与えられた場合は、ブロックの評価が終わると
  # 作成された一時ディレクトリやその配下にあったファイルを
  # [[m:FileUtils.#remove_entry]] を用いて削除し、ブロックの値をかえします。
  # ブロックが与えられなかった場合は、作成した一時ディレクトリのパスを
  # 返します。この場合、このメソッドは作成した一時ディレクトリを削除しません。
  # 
  # @param prefix_suffix nil の場合は、'd' をデフォルトのプレフィクスとして使用します。サフィックスは付きません。
  #                      文字列が与えられた場合は、その文字列をプレフィクスとして使用します。サフィックスは付きません。
  #                      2 要素の配列が与えられた場合は、一つ目の要素をプレフィクス、二つ目の要素をサフィックスとして使用します。
  # 
  # @param tmpdir nil の場合は [[m:Dir.tmpdir]] を使用します。
  #               そうでない場合は、そのディレクトリを使用します。
  # 
  # 
  # 使用例
  #   require 'tmpdir'
  # 
  #   puts Dir.tmpdir
  #   # 出力例: 動作環境により出力は異なります。
  #   #=> /cygdrive/c/DOCUME~1/kouya/LOCALS~1/Temp
  #   Dir.mktmpdir{|dir| 
  #     puts dir
  #     # 出力例: 一時ディレクトリ の名前の先頭に'd' をつける。
  #     #=> /cygdrive/c/DOCUME~1/kouya/LOCALS~1/Temp/d20081011-4524-1m69psi
  #     #                                            ^                    
  #   }
  #   Dir.mktmpdir("foo"){|dir|
  #     puts dir
  #     # 出力例:一時ディレクトリ の名前の先頭に'foo' をつける。
  #     #=> /cygdrive/c/DOCUME~1/kouya/LOCALS~1/Temp/foo20081011-4824-pjvhwx
  #     #                                            ^^^                    
  #   }
  #   Dir.mktmpdir(["foo", "bar"]){|dir| 
  #     puts dir
  #     # 出力例: 一時ディレクトリの名前の先頭に'foo' 、最後に'bar'をつける。
  #     #=> /cygdrive/c/DOCUME~1/kouya/LOCALS~1/Temp/foo20081011-5624-1hyxrqbbar
  #     #                                            ^^^                     ^^^
  #   }
  #   
  #   Dir.mktmpdir(nil, "/var/tmp") {|dir|
  #     puts dir
  #     # 出力例: tmpdir の作成先が'/var/tmp'となる。
  #     #         さらに、一時ディレクトリ の名前の先頭に'd' をつける。
  #     #=> /var/tmp/d20081011-5304-h6b13j
  #   }
  #   
  #   memory_dir = nil
  #   Dir.mktmpdir {|dir|
  #     memory_dir = dir
  #     File.open("#{dir}/foo", "w") { |fp|
  #      fp.puts "hogehoge"
  #     }
  #   }
  #   # ブロックを抜けたら、テンポラリディレクトリは消される。
  #   p FileTest.directory?(memory_dir) #=> false
  #   
  #   dir = Dir.mktmpdir
  #   # ブロックを与えない場合は、ディレクトリは存在する。
  #   begin
  #     File.open("#{dir}/foo", "w") { |fp|
  #       fp.puts "hogehoge"
  #     }
  #   ensure
  #     FileUtils.remove_entry_secure dir
  #   end
  #   p FileTest.directory?(dir) #=> false
  # 
  # @raise ArgumentError tmpdirが全てのユーザから書き込み可能かつ、sticky
  #                      ビットが立っていない場合に発生します。作成する一時
  #                      ディレクトリを安全に削除できないためです。
  #                      アプリケーションは一時ディレクトリを他のユーザか
  #                      ら書き込める権限に変更すべきではありません。
  def mktmpdir; end

  # --- new(path)                                                      -> Dir
  # --- new(path, encoding: Encoding.find("filesystem"))               -> Dir
  # --- open(path)                                                     -> Dir
  # --- open(path, encoding: Encoding.find("filesystem"))              -> Dir
  # --- open(path) {|dir| ...}                                         -> object
  # --- open(path, encoding: Encoding.find("filesystem")) {|dir| ...}  -> object
  # 
  # path に対するディレクトリストリームをオープンして返します。
  # 
  # ブロックを指定して呼び出した場合は、ディレクトリストリームを
  # 引数としてブロックを実行します。ブロックの実行が終了すると、
  # ディレクトリは自動的にクローズされます。
  # ブロックの実行結果を返します。
  # 
  # @param path ディレクトリのパスを文字列で指定します。
  # 
  # @param encoding ディレクトリのエンコーディングを文字列か
  #                 [[c:Encoding]] オブジェクトで指定します。省略した場合は
  #                 ファイルシステムのエンコーディングと同じになります。
  # 
  # @raise Errno::EXXX オープンに失敗した場合に発生します。
  # 
  # //emlist[例: Dir.new][ruby]{
  # require 'tmpdir'
  # 
  # Dir.mktmpdir do |tmpdir|
  #   d = Dir.new(tmpdir)
  #   p d.class         # => Dir
  #   p d.read.encoding # => #<Encoding:UTF-8>
  #   d.close
  # 
  #   d = Dir.new(tmpdir, encoding: Encoding::UTF_8)
  #   p d.class         # => Dir
  #   p d.read.encoding # => #<Encoding:UTF-8>
  #   d.close
  # end
  # //}
  # 
  # //emlist[例: Dir.open][ruby]{
  # require 'tmpdir'
  # 
  # Dir.mktmpdir do |tmpdir|
  #   d = Dir.open(tmpdir, encoding: Encoding::UTF_8)
  #   p d.class         # => Dir
  #   p d.read.encoding # => #<Encoding:UTF-8>
  #   d.close
  # 
  #   Dir.open(tmpdir, encoding: Encoding::UTF_8) do |d|
  #     p d.class         # => Dir
  #     p d.read.encoding # => #<Encoding:UTF-8>
  #   end
  # end
  # //}
  def new; end

  # --- tmpdir    -> String
  # 
  # テンポラリファイルを作成するのに使うディレクトリ(テンポラリディレクトリ)の絶対パスを
  # 文字列として返します。
  # [[m:$SAFE]] によって返す文字列は変わります。
  # 
  #   # WindowsXPの場合
  # 
  #   require "tmpdir"
  # 
  #   p Dir.tmpdir #=> "C:/DOCUME~1/taro3/LOCALS~1/Temp"
  #   $SAFE = 1
  #   p Dir.tmpdir #=> "C:/WINDOWS/temp"
  # 
  #   # Linuxの場合 /tmp に加え、環境変数 ENV['TMPDIR'], ENV['TMP'], ENV['TEMP'], ENV['USERPROFILE']を参照します
  #   
  def tmpdir; end

end
