module OpenSSL::Buffering
  # --- <<(s) -> self
  # 文字列 s を書き込みます。
  # 
  # [[m:IO#<<]] と同様です。
  # 
  # @param s 出力する文字列
  def <<; end

  # --- close -> nil
  # 接続を閉じます。
  # 
  # [[m:OpenSSL::Buffering#flush]] を呼んでから閉じます。
  def close; end

  # --- each(eol=$/){|line| ... } -> ()
  # --- each_line(eol=$/){|line| ... } -> ()
  # 現在の読み込み位置から1行ずつ文字列として読み込み、
  # それを引数としてブロックを呼び出します。
  # 
  # [[m:IO#each]] と同様ですが、区切り文字列に
  # "" を渡した場合や、nil を渡したときの意味が異なり、
  # これらの場合は正しく動作しません。
  # 
  # 
  # @param eol 行区切り文字列/正規表現
  def each; end

  # --- each_byte{|ch| ... } -> ()
  # 
  # 現在の読み込み位置から 1 バイトずつ読み込み、
  # それを文字列としてブロックの引数として呼び出します。
  # 
  # [[m:IO#each_byte]] と同様です。
  def each_byte; end

  # --- eof? -> bool
  # --- eof -> bool
  # 相手からの通信が終端に達したら true を返します。
  # 
  # [[m:IO#eof?]] と同様です。
  def eof; end

  # --- flush -> ()
  # 内部バッファに残っているデータをすべて出力し、
  # バッファをフラッシュします。
  # 
  # [[m:IO#flush]] と同様です。
  # 
  # バッファがすべて出力されるまでブロックします。
  def flush; end

  # --- getc -> String | nil
  # バッファから1文字読み込み、それ返します。
  # 
  # 読み込みが終端に到達した場合は nil を返します。
  # 
  # [[m:IO#getc]] と同様です。
  def getc; end

  # --- gets(eol=$/, limit=nil) -> String | nil
  # 通信路から一行読み込んで、それを返します。
  # 
  # 行区切りは eol で指定した文字列/正規表現になります。
  # 
  # 最大 limit バイトの文字列を返します。1 行がそれより
  # 長い場合はそこで切られます。limit が nil の場合は
  # eol に到達するまで読み込みます。
  # 
  # 読み込みが終端に到達した場合は nil を返します。
  # 
  # [[m:IO#gets]] と同様ですが、区切り文字列に
  # "" を渡した場合や、nil を渡したときの意味が異なり、
  # これらの場合は正しく動作しません。
  # 
  # @param eol 行区切り文字列/正規表現
  # @param limit 最大の読み込みバイト数
  def gets; end

  # --- print(*args) -> nil
  # args を順に出力します。
  # 
  # args の各要素を to_s で文字列に変換して
  # 出力します。
  # [[m:IO#print]] とほぼ同様ですが、引数を省略した場合に $_ を出力する
  # 機能はありません。
  # 
  # @param args 出力するオブジェクト
  def print; end

  # --- printf(format, *args) -> nil
  # format に従い引数 args を文字列に変換して
  # 出力します。
  # 
  # [[m:IO#printf]] と同様です。
  # 
  # @param format 出力フォーマット文字列
  # @param arg 出力するオブジェクト
  # @see [[m:Kernel.#printf]]
  def printf; end

  # --- puts(*objs) -> nil
  # 各オブジェクトを出力し、それぞれの後に改行を出力します。
  # 
  # [[m:IO#puts]] と同様です。
  # 
  # @param objs 出力したいオブジェクト
  def puts; end

  # --- read(length=nil, buf=nil) -> String | nil
  # 文字列を通信路から読み込み、返します。
  # 
  # 読み込みが終端に到達している場合は nil を返します。
  # 
  # length で読み込むバイト数を指定します。
  # length に 0 を渡した場合は空文字列を返します。
  # length に nil を渡した場合(省略した場合)は最後
  # までのデータを読み込みます。
  # 
  # bufに文字列を渡した場合はその領域が出力用のバッファとして利用されます。
  # 
  # [[m:IO#read]] と同様です。
  # 
  # @param length 読み込むバイト数
  # @param buf 読み込みバッファ
  def read; end

  # --- read_nonblock(maxlen, buf) -> String
  # 通信路から maxlen  バイトを上限としてデータを読み込み、
  # 文字列として返します。
  # 
  # 即座に得られるデータが 1byte でも存在すればブロックしません。
  # 内部バッファが空でない場合はバッファのデータを返します。
  # 即座に得られるデータが存在しないときには例外が発生します。
  # 例外が発生した場合、内部のソケットが利用可能になってから
  # 再びこのメソッドを呼んでください。
  # 
  # 基本的には [[m:IO#read_nonblock]] と同様です。しかし以下のような
  # 違いもあります。
  # 
  # このメソッドはソケットが書き込み不可能([[c:IO::WaitWritable]])という理由で
  # 例外を発生させる可能性があります。暗号プロトコルの関係上
  # データの読み込みになんらかのデータの送受信が必要になる場合があるからです。
  # 
  # 内部のソケットが読み込み/書き込み可能である場合でも、このメソッドが
  # 文字列を得られず、例外が発生する場合があります。
  # というのは、暗号プロトコルによっては(とくにブロック暗号では)
  # 通信データをある程度の大きさのブロック単位で暗号化/復号化
  # するためです。
  # 
  # 
  # 
  # @param maxlen 読み込む長さの上限(整数)
  # @param buf 読み込みバッファ
  # @raise EOFError 読み込みが既に終端に到達している場合に発生します
  # @raise OpenSSL::SSL::SSLError ソケットが読み込み/書き込み可能状態になるのを
  #        待つ必要がある場合に発生します。
  #        読み込み可能状態を待つ必要がある場合には [[c:IO::WaitReadable]] を、
  #        書き込み可能状態を待つ必要がある場合には [[c:IO::WaitWritable]] を、
  #        それぞれ extend した例外オブジェクトが生成されます。
  def read_nonblock; end

  # --- readchar -> String
  # バッファから1文字読み込み、それ返します。
  # 
  # 読み込みが終端に到達している場合は例外 EOFError を返します。
  # 
  # [[m:IO#readchar]] と同様です。
  # 
  # @raise EOFError 読み込みが終端に到達した場合に発生します。
  def readchar; end

  # --- readline(eol=$/) -> String
  # 通信路から一行読み込んで、それを返します。
  # 
  # 行区切りは eol で指定した文字列/正規表現になります。
  # 
  # 読み込みが終端に到達した場合は例外 EOFError を発生します。
  # 
  # [[m:IO#readline]] と同様ですが、区切り文字列に
  # "" を渡した場合や、nil を渡したときの意味が異なり、
  # これらの場合は正しく動作しません。
  # 
  # @param eol 行区切り文字列/正規表現
  # @raise EOFError 読み込みが終端に到達した場合に発生します。
  def readline; end

  # --- readlines(eol=$/) -> [String]
  # データを通信路から末端まで全て読み込んで、
  # 各行を要素として持つ配列を返します。
  # 
  # 行区切りは eol で指定した文字列/正規表現になります。
  # 
  # [[m:IO#readlines]] と同様ですが、区切り文字列に
  # "" を渡した場合や、nil を渡したときの意味が異なり、
  # これらの場合は正しく動作しません。
  # 
  # @param eol 行区切り文字列/正規表現
  def readlines; end

  # --- readpartial(maxlen, buf=nil) -> String | nil
  # 通信路から長さ maxlen  バイトを上限としてデータを読み込み、
  # 文字列として返します。
  # 即座に得られるデータが存在しないときにはブロックしてデータの到着を待ちます。
  # 即座に得られるデータが 1byte でも存在すればブロックしません。
  # 
  # [[m:IO#readpartial]] と同様です。
  # 
  # @param maxlen 読み込む長さの上限(整数)
  # @param buf 読み込みバッファ
  # @raise EOFError 読み込みが既に終端に到達している場合に発生します
  def readpartial; end

  # --- sync -> bool
  # 出力が同期モードなら true を返します。
  # 
  # @see [[m:OpenSSL::Buffering#sync=]]
  def sync; end

  # --- sync=(sync)
  # 出力の同期モードを設定します。
  # 
  # true に設定すると同期モードになり、
  # [[m:OpenSSL::Buffering#write_nonblock]] と
  # [[m:OpenSSL::SSL::SSLSocket#syswrite]] を除くすべての書き込み
  # ([[m:OpenSSL::Buffering#write]], [[m:OpenSSL::Buffering#print]] など)
  # はバッファリングされずに出力されます。
  # 
  # false に設定すると書き込みはバッファリングされます。
  # 
  # @param sync 設定するモード(真偽値)
  # @see [[m:OpenSSL::Buffering#sync]]
  def sync=; end

  # --- ungetc(char) -> ()
  # 指定した文字 char をバッファに読み戻します。
  # 
  # char には String か Integer を渡します。
  # 
  # [[m:IO#ungetc]] と同様です。
  # 
  # @param char 読み戻す文字
  def ungetc; end

  # --- write(str) -> Integer
  # str を出力します。
  # 
  # 書き込んだデータの長さを返します。
  # 
  # [[m:IO#write]] と同様です。
  # 
  # @param str 出力する文字列
  def write; end

  # --- write_nonblock(s) -> Integer
  # 文字列 s をノンブロッキングモードで書き込みます。
  # 
  # 成功した場合、書き込んだバイト数を返します。
  # 
  # 1 バイトも書くことができず、ソケットの状態が変化するのを
  # 待つ必要がある場合は例外を発生させます。
  # 例外が発生した場合、内部のソケットが利用可能になってから
  # 再びこのメソッドを呼んでください。
  # 
  # ただし内部バッファに書き込んでいないデータが残っている場合は、
  # まずバッファの内容をすべて出力してします。この時点で
  # ブロックする可能性があります。
  # 
  # 基本的には [[m:IO#write_nonblock]] と同様です。しかし以下のような
  # 違いもあります。
  # 
  # このメソッドはソケットが読み込み不可能([[c:IO::WaitReadable]])
  # という理由で
  # 例外を発生させる可能性があります。暗号プロトコルの関係上
  # データの書き込みになんらかのデータの
  # 送受信が必要になる場合があるからです。
  # 
  # 内部のソケットが読み込み/書き込み可能である場合でも、このメソッドで
  # 文字列を書き込めず、例外が発生する場合があります。
  # というのは、暗号プロトコルによっては(とくにブロック暗号では)
  # 通信データをある程度の大きさのブロック単位で暗号化/復号化
  # するためです。
  # 
  # @param s 出力する文字列
  # @raise OpenSSL::SSL::SSLError ソケットが読み込み/書き込み可能状態になるのを
  #        待つ必要がある場合に発生します。
  #        読み込み可能状態を待つ必要がある場合には [[c:IO::WaitReadable]] を、
  #        書き込み可能状態を待つ必要がある場合には [[c:IO::WaitWritable]] を、
  #        それぞれ extend した例外オブジェクトが生成されます。
  def write_nonblock; end

  # --- BLOCK_SIZE -> Integer
  # 内部のバッファのサイズを返します。
  def BLOCK_SIZE; end

end
