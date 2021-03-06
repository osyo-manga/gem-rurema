class Zlib::Deflate
  # --- <<(string) -> self
  # 
  # [[m:Zlib::Deflate#deflate]] と同じように string を
  # 圧縮ストリームに入力しますが、Zlib::Deflate オブジェクト
  # そのものを返します。圧縮ストリームからの出力は、
  # 出力バッファに保存されます。
  # 
  # @param string  圧縮する文字列を指定します。
  # 
  #   require 'zlib'
  # 
  #   dez = Zlib::Deflate.new
  #   dez << "123" * 5 << "ugougo" << "123" * 5 << "hogehoge"
  #   dezstr = dez.finish
  #   p dezstr #=> "x\2343426DB\245\351\371@d\210*\230\221\237\236\n\302\000\356\275\v\271"
  def <<; end

  # --- deflate(string, flush = Zlib::NO_FLUSH) -> String
  # 
  # string を圧縮ストリームに入力します。処理後、ストリームからの
  # 出力を返します。このメソッドを呼ぶと出力バッファ及び入力バッファは
  # 空になります。string が nil の場合はストリームへの入力を
  # 終了します。([[m:Zlib::ZStream#finish]] と同じ)。
  # flush には [[m:Zlib::NO_FLUSH]], [[m:Zlib::SYNC_FLUSH]],
  # [[m:Zlib::FULL_FLUSH]], [[m:Zlib::FINISH]] のいずれかを指定します。
  # 詳しくは zlib.h を参照して下さい。
  # 
  # @param string 圧縮する文字列を指定します。
  # @param flush [[m:Zlib::NO_FLUSH]], [[m:Zlib::SYNC_FLUSH]],
  #              [[m:Zlib::FULL_FLUSH]], [[m:Zlib::FINISH]] のいずれかを指定します。
  # 
  #   require 'zlib'
  # 
  #   dez = Zlib::Deflate.new
  #   p dez.deflate("123" * 20, Zlib::FINISH) #=> "x\2343426$\027\001\000e\217\v\271"
  def deflate; end

  # --- finish -> String
  # 
  # 圧縮ストリームを終了します。deflate('', Zlib::FINISH) と同じです。
  # 
  #   require 'zlib'
  # 
  #   dez = Zlib::Deflate.new
  #   dez << "123" * 5 << "ugougo" << "123" * 5 << "hogehoge"
  #   dezstr = dez.finish
  #   p dezstr #=> "x\2343426DB\245\351\371@d\210*\230\221\237\236\n\302\000\356\275\v\271"
  def finish; end

  # --- flush(flush = Zlib::SYNC_FLUSH) -> String
  # 
  # deflate('', flush) と同じです。flush が
  # 省略された時は [[m:Zlib::SYNC_FLUSH]] が使用されます。
  # このメソッドはスクリプトの可読性のために提供されています。
  # 
  # @param flush [[m:Zlib::NO_FLUSH]] [[m:Zlib::SYNC_FLUSH]] [[m:Zlib::FULL_FLUSH]] などを指定します。
  # 
  #   require 'zlib'
  # 
  #   def case1
  #     dez = Zlib::Deflate.new
  #     comp_str = dez.deflate('hoge')
  #     comp_str << dez.deflate(' fuga')
  #     comp_str << dez.deflate(' end', Zlib::FINISH)
  #     dez.close
  #     p comp_str
  #     p Zlib::Inflate.inflate(comp_str)
  #   end
  # 
  #   def case2
  #     dez = Zlib::Deflate.new
  #     comp_str = dez.deflate('hoge')
  #     comp_str << dez.flush
  #     comp_str << dez.deflate(' fuga')
  #     comp_str << dez.flush
  #     comp_str << dez.deflate(' end', Zlib::FINISH)
  #     dez.close
  #     p comp_str
  #     p Zlib::Inflate.inflate(comp_str)
  #   end
  # 
  #   case1
  #   case2
  #   #=> "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   #=> "hoge fuga end"
  #   #=> "x\234\312\310OO\005\000\000\000\377\377RH+MO\004\000\000\000\377\377SH\315K\001\000!\251\004\276"
  #   #=> "hoge fuga end"
  def flush; end

  # --- params(level, strategy) -> nil
  # 
  # 圧縮ストリームの設定を変更します。詳しくは zlib.h を
  # 参照して下さい。設定の変更に伴うストリームからの出力は
  # 出力バッファに保存されます。
  # 
  # @param level 0-9の範囲の整数, または [[m:Zlib::DEFAULT_COMPRESSION]] を指定します。
  #              詳細はzlib.hを参照してください。
  # @param strategy [[m:Zlib::FILTERED]], [[m:Zlib::HUFFMAN_ONLY]],
  #                 [[m:Zlib::DEFAULT_STRATEGY]] など指定します。詳細は zlib.h を参照してください。
  # 
  #   require 'zlib'
  # 
  #   def case1
  #     dez = Zlib::Deflate.new
  #     comp_str = dez.deflate('hoge'*5);
  #     comp_str << dez.deflate('0'*80)
  #     comp_str << dez.finish
  #     p comp_str
  #     p Zlib::Inflate.inflate(comp_str)
  #   end
  # 
  #   def case2
  #     dez = Zlib::Deflate.new
  #     comp_str = dez.deflate('hoge'*5);
  #     dez.params(Zlib::BEST_COMPRESSION, Zlib::HUFFMAN_ONLY)
  #     comp_str << dez.deflate('0'*80)
  #     comp_str << dez.finish
  #     p comp_str
  #     p Zlib::Inflate.inflate(comp_str)
  #   end
  # 
  #   case1
  #   case2
  #   #=> "x\234\313\310OO\315@\303\006T\006\000D\367\0270"
  #   #=> "hogehogehogehogehoge00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  #   #=> "x\234\005\3011\r\000\000\f\003 K\230j\326\257\376\277Aw\351.\335\245\273t\027\000\000\000\000\000\000\000\000\000\200\aD\367\0270"
  #   #=> "hogehogehogehogehoge00000000000000000000000000000000000000000000000000000000000000000000000000000000"
  def params; end

  # --- set_dictionary(string) -> String
  # 
  # 圧縮に用いる辞書を指定します。string を返します。
  # このメソッドは [[m:Zlib::Deflate.new]], [[m:Zlib::ZStream#reset]]
  # を呼び出した直後にのみ有効です。詳細は zlib.h を参照して下さい。
  # 
  # @param string 辞書に用いる文字列を指定します。詳しくは zlib.h を参照してください。
  # @return 辞書に用いる文字列を返します。 
  # 
  #   require 'zlib'
  # 
  #   def case1(str)
  #     dez = Zlib::Deflate.new
  #     comp_str =  dez.deflate(str)
  #     comp_str << dez.finish
  #     comp_str.size
  #   end
  # 
  #   def case2(str, dict)
  #     dez = Zlib::Deflate.new
  #     p dez.set_dictionary(dict)
  #     comp_str = dez.deflate(str)
  #     comp_str << dez.finish
  #     comp_str.size
  #   end
  # 
  #   i = 10
  #   dict = 'hoge_fuga_ugougo'
  #   sset = [ dict, 'taeagbamike', 'ugotagma', 'fugebogya' ]
  #   g = [ 0, 1, 1, 1, 0, 0, 0, 3, 3, 3, 0, 0, 1, 1, 0, 0, 0, 1, 2, 2, 0, 0, 0, 2, 0, 1, 1, 0, 0, 0, 0, 0]
  #   str = (1..i).collect{|m| t = rand(g.size); sset.at(g[t])}.join("")
  # 
  #   printf "%d normal:%d, dict:%d\n", i, case1(str), case2(str, dict)
  def set_dictionary; end

  # --- deflate(string, level = Zlib::DEFAULT_COMPRESSION ) -> String
  # 
  # string を圧縮します。level の有効な値は
  # [[m:Zlib::NO_COMPRESSION]], [[m:Zlib::BEST_SPEED]],
  # [[m:Zlib::BEST_COMPRESSION]], [[m:Zlib::DEFAULT_COMPRESSION]]
  # 及び 0 から 9 の整数です。
  # 
  # ちなみに、このメソッドは以下のコードとほぼ同じです:
  # 
  #   require 'zlib'
  # 
  #   def deflate(string, level)
  #     z = Zlib::Deflate.new(level)
  #     dst = z.deflate(string, Zlib::FINISH)
  #     z.close
  #     dst
  #   end
  # 
  # @param string 圧縮する文字列を指定します。 
  # @param level 圧縮の水準を詳細に指定します。
  #              有効な値は Zlib::NO_COMPRESSION, Zlib::BEST_SPEED,
  #              Zlib::BEST_COMPRESSION, Zlib::DEFAULT_COMPRESSION 及び 0 から 9 の整数です。
  # 
  # 使用例
  #   require 'zlib'
  # 
  #   srand(1)
  #   str = (1..500).collect{
  #     ['A', 'T', 'C', 'G'].at(rand(4))
  #   }.join
  # 
  #   p str.size #=> 500
  # 
  #   [ Zlib::NO_COMPRESSION,
  #     Zlib::BEST_SPEED,
  #     Zlib::BEST_COMPRESSION,
  #     Zlib::DEFAULT_COMPRESSION ].each { |level|
  #     deflate_str = Zlib::Deflate.deflate(str, level)
  #     p deflate_str.size
  #     # 展開する場合は、下記を実行する
  #     #puts Zlib::Inflate.inflate(str)
  #   }
  #   #出力例
  #   #=> 511
  #   #=> 200
  #   #=> 194
  #   #=> 194
  def deflate; end

  # --- new(level = Zlib::DEFAULT_COMPRESSION, windowBits = Zlib::MAX_WBITS, memlevel = Zlib::DEF_MEM_LEVEL, strategy = Zlib::DEFAULT_STRATEGY) -> Zlib::Deflate
  # 
  # 圧縮ストリームを作成します。各引数の詳細は zlib.h を
  # 参照して下さい。nil の場合はデフォルトの値を使用します。
  # 
  # @param level 0-9の範囲の整数, またはZlib::DEFAULT_COMPRESSIONを指定します。詳細はzlib.hを参照してください。
  # @param windowBits ウィンドウの大きさを整数で指定します。詳細はzlib.hを参照してください。
  # @param memlevel 0-9の範囲の整数で指定します。詳細はzlib.hを参照してください。
  # @param strategy [[m:Zlib::FILTERED]], [[m:Zlib::HUFFMAN_ONLY]], [[m:Zlib::DEFAULT_STRATEGY]]など指定します。詳細はzlib.h を参照してください。
  # 
  #   require 'zlib'
  # 
  #   dez = Zlib::Deflate.new(9, nil, 9)
  #   dez << "123" * 20
  #   dezstr = dez.finish
  #   p dezstr #=> "x\3323426$\027\001\000e\217\v\271"
  # 
  #   inz = Zlib::Inflate.new
  #   inzstr = inz.inflate(dezstr)
  #   p inzstr  #=> "123123123123123123123123123123123123123123123123123123123123"
  def new; end

end
