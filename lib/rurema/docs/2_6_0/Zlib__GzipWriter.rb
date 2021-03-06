class Zlib::GzipWriter
  # --- <<(str) -> self
  # 
  # str を出力します。str が文字列でない場合は to_s を用いて
  # 文字列に変換します。
  # 
  # @param str 出力したいオブジェクトを与えます。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz << "hoge" << "fuga"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=> hogefuga
  # 
  # @see [[m:IO#<<]]
  def <<; end

  # --- close -> File
  # --- finish -> File
  # 
  # フッターを書き出し、GzipWriter オブジェクトをクローズします。close と
  # finish の違いは [[m:Zlib::GzipFile#close]], [[m:Zlib::GzipFile#finish]] を
  # 参照して下さい。
  # 
  # 注意: Ruby の finalizer の制約のため、GzipWriter オブジェクトは
  # 必ずクローズしてください。そうしなければフッターを書き出すことが
  # できず、壊れた gzip ファイルを生成してしまう可能性があります。
  # 
  #   require 'zlib'
  #    
  #   def case_finish
  #     filename='hoge1.gz'
  #     gz = Zlib::GzipWriter.open(filename, 9)
  #     gz.puts "hogehoge\n" * 100
  #     f = gz.finish
  #     p f.atime
  #     # 例
  #     #=> Sun Jul 06 15:43:57 +0900 2008
  #   end
  #  
  #   def case_close
  #     filename='hoge1.gz'
  #     gz = Zlib::GzipWriter.open(filename, 9)
  #     gz.puts "hogehoge\n" * 100
  #     f = gz.close
  #     begin
  #       p f.atime
  #     rescue IOError => err
  #       puts err #=> closed stream
  #     end
  #   end
  #  
  #   case_finish
  #   case_close
  def close; end

  # --- comment=(string)
  # 
  # gzip ファイルのヘッダーに記録するコメントを指定します。
  # 
  # [[m:Zlib::GzipWriter#write]] 等の書き込み系メソッドを
  # 呼んだ後で指定しようとすると [[c:Zlib::GzipFile::Error]] 例外が
  # 発生します。
  # 
  # @param string gzip ファイルのヘッダーに記録するコメントを文字列で指定します。
  # @return string を返します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.comment = "hogehoge"
  #     p gz.comment #=> "hogehoge"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.comment #=> hogehoge
  #   }
  def comment=; end

  # --- flush(flush = Zlib::SYNC_FLUSH) -> self
  # 
  # まだ書き出されていないデータをフラッシュします。
  # 
  # flush は [[m:Zlib::Deflate#deflate]] と同じです。
  # 省略時は [[m:Zlib::SYNC_FLUSH]] が使用されます。
  # flush に [[m:Zlib::NO_FLUSH]] を指定することは無意味です。
  # 
  # @param flush [[m:Zlib::NO_FLUSH]] [[m:Zlib::SYNC_FLUSH]] [[m:Zlib::FULL_FLUSH]] などを指定します。
  # 
  #   require 'zlib'
  #  
  #   def case1
  #     filename='hoge1.gz'
  #     fw = File.open(filename, "w")
  #     Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #       gz.puts "fuga"
  #       gz.puts "ugo"
  #     }
  #     p File.read(filename)
  #   end
  #    
  #   def case2
  #     filename='hoge1.gz'
  #     fw = File.open(filename, "w")
  #     Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #       gz.puts "fuga"
  #       gz.flush
  #       gz.puts "ugo\n"
  #       gz.flush
  #     }
  #     p File.read(filename)
  #   end
  #  
  #   case1
  #   #=> "\037\213\b\000p\257pH\002\003K+MO\344*M\317\347\002\000<\326\000\371\t\000\000\000"
  #   case2
  #   #=> "\037\213\b\000p\257pH\002\003J+MO\344\002\000\000\000\377\377*M\317\347\002\000\000\000\377\377\003\000<\326\000\371\t\000\000\000"
  def flush; end

  # --- mtime=(time)
  # 
  # gzip ファイルのヘッダーに記録する最終更新時間を指定します。
  # 
  # [[m:Zlib::GzipWriter#write]] 等の書き込み系メソッドを
  # 呼んだ後で指定しようとすると [[c:Zlib::GzipFile::Error]] 例外が
  # 発生します。
  # 
  # @param time gzip ファイルのヘッダーに記録する最終更新時間を整数で指定します。
  # @return time を返します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     p gz.mtime = 1 #=> 1
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.mtime
  #     # 例
  #     #=> Thu Jan 01 09:00:01 +0900 1970
  #   }
  def mtime=; end

  # --- orig_name=(filename)
  # 
  # gzip ファイルのヘッダーに記録する元ファイル名を指定します。
  # 
  # [[m:Zlib::GzipWriter#write]] 等の書き込み系メソッドを
  # 呼んだ後で指定しようとすると [[c:Zlib::GzipFile::Error]] 例外が
  # 発生します。
  # 
  # @param filename gzip ファイルのヘッダーに記録する元ファイル名を文字列で指定します。
  # @return filename を返します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.orig_name = "hogehoge"
  #     p gz.orig_name #=> "hogehoge"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.orig_name #=> hogehoge
  #   }
  def orig_name=; end

  # --- pos -> Integer
  # --- tell -> Integer
  # 
  # 現在までに圧縮したデータの長さの合計を返します。
  # ファイルポインタの位置ではないことに注意して下さい。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   f = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(f, Zlib::BEST_COMPRESSION){|gz|
  #     (1..10).each {|i|
  #       gz.print i
  #       puts gz.pos
  #     }
  #   }
  #   #=> 1
  #   #=> 2
  #   #=> 3
  #   ...
  def pos; end

  # --- print(*str) -> nil
  # 
  # 引数を自身に順に出力します。引数を省略した場合は、[[m:$_]] を出力します。
  # 
  # @param str 出力するオブジェクトを指定します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.print "ugo"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=> ugo
  # 
  # @see [[m:IO#print]], [[m:Kernel.#print]]
  def print; end

  # --- printf(format, *args) -> nil
  # 
  # C 言語の printf と同じように、format に従い引数
  # を文字列に変換して、自身に出力します。
  # 
  # @param format フォーマット文字列を指定します。[[d:print_format]] を参照してください。
  # 
  # @param args フォーマットされるオブジェクトを指定します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.printf("\n%9s", "bar")
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=>       bar
  # 
  # @see [[m:IO#printf]], [[m:Kernel.#printf]]
  def printf; end

  # --- putc(ch) -> object
  # 
  # 文字 ch を自身に出力します。
  # 
  # ch が数値なら 0 〜 255 の範囲の対応する文字を出力します。
  # ch が文字列なら、その先頭 1byte を出力します。
  # どちらでもない場合は、ch.to_int で整数に変換を試みます。
  # 
  # @param ch 出力する文字を数値または文字列で指定します。
  # 
  # @return ch を返します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.putc ?u
  #     gz.putc ?g
  #     gz.putc ?o
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=> ugo
  # 
  # @see [[m:IO#putc]], [[m:Kernel.#putc]]
  def putc; end

  # --- puts(*str) -> nil
  # 
  # 各引数を自身に出力し、それぞれの後に改行を出力します。
  # 
  # @param str 出力したいオブジェクトを指定します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.puts "fuga"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=> fuga
  # 
  # @see [[m:IO#puts]], [[m:Kernel.#puts]]
  def puts; end

  # --- write(*str) -> Integer
  # 
  # 自身に str を出力します。str が文字列でなけ
  # れば to_s による文字列化を試みます。
  # 
  # @param str 出力する文字列を指定します。文字列でない場合は to_s で文字列に変換します。
  # 
  # @return 実際に出力できたバイト数を返します。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   fw = File.open(filename, "w")
  #   Zlib::GzipWriter.wrap(fw, Zlib::BEST_COMPRESSION){|gz|
  #     gz.write "foo"
  #   }
  #   fr = File.open(filename)
  #   Zlib::GzipReader.wrap(fr){|gz|
  #     puts gz.read
  #   }
  #   #=> foo
  # 
  # @see [[m:IO#write]]
  def write; end

  # --- new(io, level = Zlib::DEFAULT_COMPRESSION, strategy = Zlib::DEFAULT_STRATEGY) -> Zlib::GzipWriter
  # 
  # io と関連付けられた GzipWriter オブジェクトを作成します。
  # level, strategy は [[m:Zlib::Deflate.new]] と同じです。
  # GzipWriter オブジェクトは io に gzip 形式のデータを
  # 逐次ライトします。io には少なくとも、[[m:IO#write]] と
  # 同じ動作をする write メソッドが定義されている必要があります。
  # 
  # @param io  IOオブジェクト、もしくは少なくとも、
  #            [[m:IO#write]] と 同じ動作をする write メソッドが定義されている必要があります。
  # @param level  0-9の範囲の整数を指定します。詳細はzlib.hを参照してください。 
  # @param strategy [[m:Zlib::FILTERED]], [[m:Zlib::HUFFMAN_ONLY]], [[m:Zlib::DEFAULT_STRATEGY]]など指定します。詳細はzlib.h を>参照してください。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   f = File.open(filename, "w")
  #   gz = Zlib::GzipWriter.new(f)
  #   gz.puts "hogehoge" * 100
  #   gz.close  
  #   p gz.closed? #=> true
  #   p FileTest.size(filename) #=> 32
  def new; end

  # --- open(filename, level = Zlib::DEFAULT_COMPRESSION, strategy = Zlib::DEFAULT_STRATEGY) -> Zlib::GzipWriter
  # --- open(filename, level = Zlib::DEFAULT_COMPRESSION, strategy = Zlib::DEFAULT_STRATEGY) {|gz| ... } -> object
  # 
  # filename で指定されるファイルを gzip 圧縮データの
  # 書き出し用にオープンします。GzipWriter オブジェクトを返します。
  # その他詳細は [[m:Zlib::GzipWriter.new]] や [[m:Zlib::GzipWriter.wrap]] と
  # 同じです。
  # 
  # @param filename ファイル名を文字列で指定します。
  # @param level 0-9の範囲の整数、または [[m:Zlib::NO_COMPRESSION]], [[m:Zlib::BEST_SPEED]], 
  #              [[m:Zlib::BEST_COMPRESSION]], [[m:Zlib::DEFAULT_COMPRESSION]] を指定します。
  #              詳細はzlib.hを参照してください。 
  # @param strategy [[m:Zlib::FILTERED]], [[m:Zlib::HUFFMAN_ONLY]], [[m:Zlib::DEFAULT_STRATEGY]]など指定します。
  #                 詳細はzlib.h を参照してください。
  # 
  #   require 'zlib'
  # 
  #   filename='hoge1.gz'
  #   gz = Zlib::GzipWriter.open(filename)
  #   gz.puts "hogehoge" * 100
  #   gz.close
  #   p gz.closed? #=> true
  #   p FileTest.size(filename) #=> 32
  def open; end

  # --- wrap(io, level = Zlib::DEFAULT_COMPRESSION, strategy = Zlib::DEFAULT_STRATEGY) -> Zlib::GzipWriter
  # --- wrap(io, level = Zlib::DEFAULT_COMPRESSION, strategy = Zlib::DEFAULT_STRATEGY) {|gz| ... } -> object
  # 
  # io と関連付けられた GzipWriter オブジェクトを作成します。
  # ブロックが与えられた場合、
  # それを引数としてブロックを実行します。
  # ブロックの実行が終了すると、GzipWriter オブジェクトは自動的に
  # クローズされます。関連付けられている IO オブジェクトまで
  # クローズしたくない時は、ブロック中で [[m:Zlib::GzipFile#finish]]
  # メソッドを呼び出して下さい。
  # 
  # @param io  IOオブジェクト、もしくは少なくとも、
  #            [[m:IO#write]] と 同じ動作をする write メソッドが定義されている必要があります。
  # @param level  0-9の範囲の整数を指定します。詳細はzlib.hを参照してください。 
  # @param strategy [[m:Zlib::FILTERED]], [[m:Zlib::HUFFMAN_ONLY]], [[m:Zlib::DEFAULT_STRATEGY]]など指定します。
  #                 詳細はzlib.h を参照してください。
  # 
  #   require 'zlib'
  #   
  #   def case1
  #     filename='hoge1.txt'
  #     f = File.open(filename, "w")
  #     Zlib::GzipWriter.wrap(f, Zlib::NO_COMPRESSION){|gz|
  #       gz.puts "hogehoge" * 100
  #     }
  #     p f.closed? #=> true
  #     p FileTest.size(filename) #=> 824
  #   end
  #   
  #   def case2
  #     filename='hoge1.gz'
  #     f = File.open(filename, "w")
  #     Zlib::GzipWriter.wrap(f, Zlib::BEST_COMPRESSION){|gz|
  #       gz.puts "hogehoge" * 100
  #       gz.finish
  #     }
  #     p f.closed? #=> false
  #     f.close
  #     p FileTest.size(filename) #=> 32
  #   end
  #   
  #   case1
  #   case2
  def wrap; end

end
