class Zlib::Inflate
  # --- <<(string) -> self
  # 
  # [[m:Zlib::Inflate#inflate]] と同じように string を
  # 展開ストリームに入力しますが、Zlib::Inflate オブジェクト
  # そのものを返します。展開ストリームからの出力は、
  # 出力バッファに保存されます。
  # 
  #   require 'zlib'
  # 
  #   cstr = "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   inz = Zlib::Inflate.new
  #   inz << cstr[0, 10]
  #   p inz.flush_next_out #=> "hoge fu"
  # 
  #   inz << cstr[10..-1]
  #   p inz.flush_next_out #=> "ga end"
  def <<; end

  # --- finish -> String
  # 
  # 展開ストリームを終了します。
  # 
  # ストリーム内に残っていたデータ (つまり圧縮データの後についていた
  # ゴミデータ) を返します。
  # [[m:Zlib::ZStream#finished?]] が真でない時に finish を呼ぶと
  # 例外が発生します。
  # 
  # 展開ストリームは圧縮データ内に終了コードを発見した時点で
  # 自ら終了するため、明示的に finish を呼ぶ必要は必ずしも
  # ありませんが、このメソッドは圧縮データが正しく終了しているかを
  # 確認するのに便利です。
  # 
  #   require 'zlib'
  # 
  #   cstr = "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   inz = Zlib::Inflate.new
  #   inz << cstr
  #   p inz.finish #=> "hoge fuga end"
  def finish; end

  # --- inflate(string) -> String
  # 
  # string を展開ストリームに入力します。
  # 
  # 処理後、ストリームからの出力を返します。
  # このメソッドを呼ぶと出力バッファ及び入力バッファは空になります。
  # string が nil の場合はストリームへの入力を
  # 終了します。([[m:Zlib::ZStream#finish]] と同じ)。
  # 
  # @param string 展開する文字列を入力します。
  # 
  # @raise Zlib::NeedDict 展開に辞書が必要な場合に発生します。
  #                       [[m:Zlib::Inflate#set_dictionary]] メソッドで辞書をセットした
  #                       後で、空文字列と共にこのメソッドを再度呼び出して下さい。
  # 
  #   require 'zlib'
  # 
  #   cstr = "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   inz = Zlib::Inflate.new
  #   p inz.inflate(cstr) #=> "hoge fuga end"
  def inflate; end

  # --- set_dictionary(string) -> String
  # 
  # 展開に用いる辞書を指定します。string を返します。
  # このメソッドは [[c:Zlib::NeedDict]] 例外が発生した直後のみ
  # 有効です。詳細は zlib.h を参照して下さい。
  # 
  # @param string 展開に用いる辞書を文字列で指定します。
  # 
  #   require 'zlib'
  # 
  #   def case2(str, dict)
  #     dez = Zlib::Deflate.new
  #     dez.set_dictionary(dict)
  #     comp_str = dez.deflate(str)
  #     comp_str << dez.finish
  #     comp_str.size
  #     inz = Zlib::Inflate.new
  #     begin
  #       inz.inflate(comp_str)
  #     rescue Zlib::NeedDict
  #     end
  #     # 展開に用いる辞書が必要です。
  #     inz.set_dictionary(dict) 
  #     p inz.inflate(comp_str)
  #   end
  #   dict = 'hoge_fuga_ugougo'
  #   sset = [ dict, 'taeagbamike', 'ugotagma', 'fugebogya' ]
  #   g = [ 0, 0, 0, 1, 1, 1, 0, 0, 0, 3, 3, 3, 0, 0, 1, 1, 
  #         0, 0, 0, 1, 2, 2, 0, 0, 0, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0]
  #   str = g.collect{|m| sset.at(m)}.join("")
  # 
  #   case2(str, dict)
  def set_dictionary; end

  # --- sync(string) -> bool
  # 
  # string を入力バッファの末尾に追加し、次の full flush
  # point まで読み飛ばします。入力バッファ内に full flush point
  # が存在しない場合は、入力バッファを空にし false を返します。
  # 入力バッファ内に full flush point が見つかった場合は
  # true を返し、残りのデータは入力バッファ内に保持されます。
  # 
  # @param string 入力バッファの末尾に追加する文字列を指定します。
  def sync; end

  # --- sync_point? -> bool
  # @todo zlib.h にもドキュメントが無い？
  # 
  # What is this?
  def sync_point?; end

  # --- inflate(string) -> String
  # 
  # string を展開します。
  # 
  # ちなみに、このメソッドは以下のコードとほぼ同じです:
  # 
  #   require 'zlib'
  # 
  #   def inflate(string)
  #     zstream = Zlib::Inflate.new
  #     buf = zstream.inflate(string)
  #     zstream.finish
  #     zstream.close
  #     buf
  #   end
  # 
  # @param string 展開する文字列を指定します。
  # 
  # @raise Zlib::NeedDict 展開に辞書が必要な場合に発生します。
  # 
  #   require 'zlib'
  # 
  #   cstr = "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   p Zlib::Inflate.inflate(cstr) #=> "hoge fuga end"
  def inflate; end

  # --- new(window_bits = Zlib::MAX_WBITS) -> Zlib::Inflate
  # 
  # 展開ストリームを作成します。
  # 
  # @param window_bits ウィンドウの大きさを整数で指定します。
  #                    nil の場合はデフォルトの値を使用します。
  #                    詳細は zlib.h を参照してください。
  # 
  #   require 'zlib'
  # 
  #   cstr = "x\234\313\310OOUH+MOTH\315K\001\000!\251\004\276"
  #   inz = Zlib::Inflate.new(15)
  #   inz << cstr
  #   p inz.finish #=> "hoge fuga end"
  def new; end

end
