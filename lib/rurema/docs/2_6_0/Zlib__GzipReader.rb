class Zlib::GzipReader
  # --- each(rs = $/){|line| ... } -> self
  # --- each_line(rs = $/){|line| ... } -> self
  # --- each(rs = $/) -> Enumerator
  # --- each_line(rs = $/) -> Enumerator
  # 
  # IO クラスの同名メソッド[[m:IO#each]], [[m:IO#each_line]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param rs 行の区切りを文字列で指定します。
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     gz.each { |line|
  #       puts line
  #     }
  #   }
  # 
  # @see [[m:IO#each]], [[m:IO#each_line]]
  def each; end

  # --- each_byte{|byte| ... } -> nil
  # --- each_byte -> Enumerator
  # IO クラスの同名メソッド[[m:IO#each_byte]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     gz.each_byte { |b|
  #       printf "%d -> %c\n", b, b
  #     }
  #   }
  #   #=> 104 -> h
  #   #=> 111 -> o
  #   #=> 103 -> g
  #   #=> 101 -> e
  #   #=> 10 -> 
  # 
  # @see [[m:IO#each_byte]]
  def each_byte; end

  # --- eof -> bool
  # --- eof? -> bool
  # 
  # 圧縮データの終端に達した場合真を返します。
  # フッターが読み込まれていなくても真を返すことに注意して下さい。
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合はこれで作成する。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #     gz.puts 'foga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz'){|gz|
  #     gz.each_line{|line|
  #       puts line
  #     }
  #     p gz.eof? #=> true
  #   }
  def eof; end

  # --- getc -> Integer | nil
  # IO クラスの同名メソッド[[m:IO#getc]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     while c = gz.getc
  #       puts c
  #     end
  #   }
  #   #=> 104
  #   #=> 111
  #   #=> 103
  #   #=> 101
  #   #=> 10
  # 
  # 
  # @see [[m:IO#getc]]
  def getc; end

  # --- gets(rs = $/) -> String | nil
  # IO クラスの同名メソッド[[m:IO#gets]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param rs 行の区切りを文字列で指定します。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     while l = gz.gets
  #       puts l
  #     end
  #   }
  #   #=> hoge
  #   #=> fuga
  def gets; end

  # --- lineno -> Integer
  # IO クラスの同名メソッド[[m:IO#lineno]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'h'
  #     gz.puts 'o'
  #     gz.puts 'g'
  #     gz.puts 'e'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     while l = gz.gets
  #       l.chomp!
  #       printf "%s %d\n", l, gz.lineno
  #     end
  #   }
  #   #=> h 1
  #   #=> o 2
  #   #=> g 3
  #   #=> e 4
  # 
  # @see [[m:IO#lineno]]
  def lineno; end

  # --- lineno=(num)
  # IO クラスの同名メソッド[[m:IO#lineno=]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param num 新たな行番号を整数で指定します。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'h'
  #     gz.puts 'o'
  #     gz.puts 'g'
  #     gz.puts 'e'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     while l = gz.gets
  #       l.chomp!
  #       gz.lineno = 1000 if l == "o"
  #       printf "%s %d\n", l, gz.lineno
  #     end
  #   }
  #   #=> h 1
  #   #=> o 1001
  #   #=> g 1002
  #   #=> e 1003
  # 
  # @see [[m:IO#lineno=]]
  def lineno=; end

  # --- pos -> Integer
  # --- tell -> Integer
  # 
  # 現在までに展開したデータの長さの合計を返します。
  # ファイルポインタの位置ではないことに注意して下さい。
  # 
  #   require 'zlib'
  # 
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  # 
  #   Zlib::GzipReader.open('hoge.gz'){|gz|
  #     while c = gz.getc
  #       printf "%c, %d\n", c, gz.pos
  #     end
  #   }
  #   # 実行例
  #   #=> h, 1
  #   #=> o, 2
  #   #=> g, 3
  #   #=> e, 4
  #   #=>  
  #   #=> , 5
  def pos; end

  # --- read(length = nil) -> String | nil
  # IO クラスの同名メソッド[[m:IO#read]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param length 読み込む文字列の文字数を整数で指定します。
  #               省略した場合は、全てのデータを読み込みます。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge_fuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     p gz.read(4)  #=> "hoge"
  #     p gz.read     #=> "_fuga\n"
  #     p gz.read(1)  #=> nil
  #   }
  # 
  # @see [[m:IO#read]]
  def read; end

  # --- readchar -> Integer
  # IO クラスの同名メソッド[[m:IO#readchar]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @raise EOFError  EOF に到達したとき発生します。
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     begin
  #       puts gz.readchar
  #     rescue EOFError => err
  #       puts err
  #       break
  #     end while true
  #   }
  #   #=> 104
  #   #=> 111
  #   #=> 103
  #   #=> 101
  #   #=> 10
  #   #=> end of file reached
  def readchar; end

  # --- readline(rs = $/) -> String
  # IO クラスの同名メソッド[[m:IO#readline]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param rs 行の区切りを文字列で指定します。
  # 
  # @raise EOFError  EOF に到達したとき発生します。
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     begin
  #       puts gz.readline
  #     rescue EOFError => err
  #       puts err
  #       break
  #     end while true
  #   }
  #   #=> hoge
  #   #=> fuga
  #   #=> end of file reached
  # 
  # @see [[m:IO#readline]]
  def readline; end

  # --- readlines(rs = $/) -> Array
  # IO クラスの同名メソッド[[m:IO#readlines]]と同じです。
  # 
  # 但し、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # [[c:Zlib::GzipFile::NoFooter]], [[c:Zlib::GzipFile::CRCError]],
  # [[c:Zlib::GzipFile::LengthError]] 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param rs 行の区切りを文字列で指定します。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合は下記で作成できる。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     p gz.readlines #=>  ["hoge\n", "fuga\n"]
  #   }
  # 
  # @see [[m:IO#readlines]]
  def readlines; end

  # --- readpartial(maxlen, outbuf = nil) -> String
  # IO クラスの同名メソッド [[m:IO#readpartial]] と同じです。
  # 
  # @param maxlen 読み込む長さの上限を整数で指定します。
  # 
  # @param outbuf 文字列で指定します。読み込んだデータを outbuf に破壊的に格納し、
  #               返り値は outbuf となります。outbuf は一旦 maxlen 長に拡張(あるいは縮小)されたあと、
  #               実際に読み込んだデータのサイズになります。
  # 
  # @raise ArgumentError maxlen に負の値が入力された場合発生します。
  # 
  # @see [[m:IO#readpartial]]
  def readpartial; end

  # --- rewind -> 0
  # 
  # ファイルポインタを [[m:Zlib::GzipReader.new]] を呼び出した直後の
  # 時点に戻します。関連付けられている IO オブジェクトに
  # seek メソッドが定義されている必要があります。
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合はこれで作成する。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #     gz.puts 'fuga'
  #   }
  #   =end
  # 
  #   gz = Zlib::GzipReader.open('hoge.gz')
  #   puts gz.gets #=> hoge
  #   puts gz.gets #=> fuga
  #   gz.rewind  #=> 0
  #   puts gz.gets #=> hoge
  #   gz.close
  def rewind; end

  # --- ungetc(char) -> nil
  # IO クラスの同名メソッド [[m:IO#ungetc]] と同じです。
  # 
  # IO クラスの同名メソッドと同じですが、gzip ファイル中に
  # エラーがあった場合 [[c:Zlib::Error]] 例外や
  # [[c:Zlib::GzipFile::Error]] 例外が発生します。
  # 
  # gzip ファイルのフッターの処理に注意して下さい。
  # gzip ファイルのフッターには圧縮前データのチェックサムが
  # 記録されています。GzipReader オブジェクトは、次の時に展開した
  # データとフッターの照合を行い、エラーがあった場合は
  # Zlib::GzipFile::NoFooter, Zlib::GzipFile::CRCError,
  # Zlib::GzipFile::LengthError 例外を発生させます。
  # 
  #   * EOF (圧縮データの最後) を越えて読み込み要求を受けた時。
  #     すなわち [[m:Zlib::GzipReader#read]],
  #     [[m:Zlib::GzipReader#gets]] メソッド等が nil を返す時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipFile#close]] メソッドが
  #     呼び出された時。
  #   * EOF まで読み込んだ後、[[m:Zlib::GzipReader#unused]] メソッドが
  #     呼び出された時。
  # 
  # @param char 読み戻したい1文字かそのコードポイントを指定します。
  # 
  # @raise Zlib::Error [[c:Zlib::Error]] を参照
  # @raise Zlib::GzipFile::Error [[c:Zlib::GzipFile::Error]]を参照
  # @raise Zlib::GzipFile::NoFooter [[c:Zlib::GzipFile::NoFooter]]を参照
  # @raise Zlib::GzipFile::CRCError [[c:Zlib::GzipFile::CRCError]]を参照
  # @raise Zlib::GzipFile::LengthError [[c:Zlib::GzipFile::LengthError]]を参照
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合はこれで作成する。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.print 'hogefuga'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz') { |gz|
  #     begin
  #       c1 = gz.getc
  #       c2 = gz.getc
  #       break if c2.nil?
  #       printf "%c -> %c\n", c1, c2
  #       gz.ungetc(c2)
  #     end while true
  #   }
  # 
  #   #=> h -> o
  #   #=> o -> g
  #   #=> g -> e
  #   #=> e -> f
  #   #=> f -> u
  #   #=> u -> g
  #   #=> g -> a
  #   
  # @see [[m:IO#ungetc]]
  def ungetc; end

  # --- unused -> String | nil
  # 
  # gzip フォーマットの解析のために読み込んだ余剰のデータを返します。
  # gzip ファイルが最後まで解析されていない場合は nil を返します。
  def unused; end

  # --- new(io) -> Zlib::GzipReader
  # 
  # io と関連付けられた GzipReader オブジェクトを作成します。
  # 
  # GzipReader オブジェクトは io からデータを逐次リードして
  # 解析/展開を行います。io には少なくとも、[[m:IO#read]] と
  # 同じ動作をする read メソッドが定義されている必要があります。
  # 
  # @param io IO オブジェクト、もしくは少なくとも [[m:IO#read]] と同じ動作を
  #           する read メソッドが定義されているオブジェクト
  # 
  # @raise Zlib::GzipFile::Error ヘッダーの解析に失敗した場合発生します。
  # 
  #   require 'zlib'
  # 
  #   File.open('hoge.txt', "w") { |fp|
  #     fp.puts 'hoge'
  #   }
  # 
  #   f = File.open('hoge.txt')
  #   begin
  #     Zlib::GzipReader.new(f)
  #   rescue Zlib::GzipFile::Error => err
  #     puts "error", err #=> error
  #                       #=> not in gzip format
  #   end
  def new; end

  # --- open(filename) -> Zlib::GzipReader
  # --- open(filename) {|gz| ... } -> object
  # 
  # filename で指定されるファイルを gzip ファイルとして
  # オープンします。GzipReader オブジェクトを返します。
  # その他詳細は [[m:Zlib::GzipReader.new]] や [[m:Zlib::GzipReader.wrap]] と
  # 同じです。
  # 
  # @param filename gzip ファイル名を文字列で指定します。
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合はこれで作成する。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  #   =end
  # 
  #   Zlib::GzipReader.open('hoge.gz'){|gz|
  #     print gz.read
  #   }
  def open; end

  # --- wrap(io) -> Zlib::GzipReader
  # --- wrap(io) {|gz| ... } -> object
  # 
  # io と関連付けられた GzipReader オブジェクトを作成します。
  # 
  # ブロックが与えられた場合は、それを引数としてブロックを実行します。
  # ブロックの実行が終了すると、GzipReader オブジェクトは自動的に
  # クローズされます。関連付けられている IO オブジェクトまで
  # クローズしたくない時は、ブロック中で [[m:Zlib::GzipFile#finish]]
  # メソッドを呼び出して下さい。
  # 
  # @param io IO オブジェクトを指定します。
  # 
  #   require 'zlib'
  # 
  #   =begin
  #   # hoge.gz がない場合はこれで作成する。
  #   Zlib::GzipWriter.open('hoge.gz') { |gz|
  #     gz.puts 'hoge'
  #   }
  #   =end
  # 
  #   f = File.open('hoge.gz')
  #   Zlib::GzipReader.wrap(f){|gz|
  #     print gz.read
  #   }
  #   p f.closed? #=> true
  # 
  #   f = File.open('hoge.gz')
  #   Zlib::GzipReader.wrap(f){|gz|
  #     print gz.read
  #     gz.finish
  #   }
  #   p f.closed? #=> false
  def wrap; end

end
