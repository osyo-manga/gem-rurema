class Coverage
  # --- line_stub(file)  -> Array
  # 
  # 行カバレッジの配列のスタブを返します。
  # 
  # 測定対象となる行の要素は 0, 空行やコメントなどにより測定対象外となる行の要素は nil となります。
  # 
  # //emlist[foo.rb][ruby]{
  # s = 0
  # 10.times do |x|
  #   s += x
  # end
  # 
  # if s == 45
  #   p :ok
  # else
  #   p :ng
  # end
  # //}
  # 
  # このファイルに対して line_stub を実行すると、次のようになります。
  # 
  # //emlist[][ruby]{
  # require "coverage"
  # p Coverage.line_stub("foo.rb")  #=> [0, 0, 0, nil, nil, 0, 0, nil, 0, nil]
  # //}
  # 
  # この例において、空行, else, end の行は測定対象外であるため、nil となっています。
  # 
  # @param file ファイル名を表す文字列
  def line_stub; end

  # --- peek_result -> Hash
  # 
  # 測定を止めることなく、測定中のその時の結果をハッシュで返します。
  # 測定結果の詳細は、[[lib:coverage]] ライブラリ を参照してください。
  # 
  # これは、Coverage.result(stop: false, clear: false) と同じです。
  # 
  # @return 測定途中結果を表すハッシュ
  # 
  # @raise RuntimeError [[m:Coverage.start]] を実行する前に実行された場合に
  #                     発生します。
  # 
  # //emlist[bool.rb][ruby]{
  # def bool(obj)
  #   if obj
  #     true
  #   else
  #     false
  #   end
  # end
  # //}
  # 
  # //emlist[][ruby]{
  # require "coverage"
  # 
  # Coverage.start
  # 
  # load "bool.rb"
  # p Coverage.peek_result  #=> {"bool.rb"=>[1, 0, 0, nil, 0, nil, nil]}
  # 
  # bool(true)
  # p Coverage.peek_result  #=> {"bool.rb"=>[1, 1, 1, nil, 0, nil, nil]}
  # 
  # bool(false)
  # p Coverage.peek_result  #=> {"bool.rb"=>[1, 2, 1, nil, 1, nil, nil]}
  # //}
  # 
  # @see [[m:Coverage.result]]
  def peek_result; end

  # --- result(stop: true, clear: true)  -> Hash
  # 
  # 対象ファイル名をキー、測定結果を値したハッシュを返します。
  # 測定結果の詳細は、[[lib:coverage]] ライブラリ を参照してください。
  # 
  # @param stop true であれば、カバレッジの測定を終了します。
  # @param clear true であれば、測定記録をクリアします。
  # 
  # @return 測定結果を表すハッシュ
  # 
  # @raise RuntimeError [[m:Coverage.start]] を実行する前に実行された場合に
  #                     発生します。
  # 
  # //emlist[bool.rb][ruby]{
  # def bool(obj)
  #   if obj
  #     true
  #   else
  #     false
  #   end
  # end
  # //}
  # 
  # //emlist[][ruby]{
  # require "coverage"
  # Coverage.start
  # load "bool.rb"
  # p Coverage.result  #=> {"bool.rb"=>[1, 0, 0, nil, 0, nil, nil]}
  # bool(0)
  # p Coverage.result  # coverage measurement is not enabled (RuntimeError)
  # //}
  # 
  # Ruby 2.6 以降では、オプションを指定できます。
  # Coverage.result(clear: true, stop: false) と指定することで、続けて新しく実行された行だけを記録することができます。
  # 
  # //emlist[][ruby]{
  # require "coverage"
  # Coverage.start(oneshot_lines: true)
  # load "bool.rb"
  # p Coverage.result(clear: true, stop: false)  #=> {"bool.rb"=>{:oneshot_lines=>[1]}}
  # bool(0)
  # p Coverage.result(clear: true, stop: false)  #=> {"bool.rb"=>{:oneshot_lines=>[2, 3]}}
  # bool(nil)
  # p Coverage.result(clear: true, stop: false)  #=> {"bool.rb"=>{:oneshot_lines=>[5]}}
  # //}
  # 
  # 上記のコード例で、bool(0) で実行された2行目の条件式は、測定記録がクリアされたあと bool(nil) で実行されても新しく記録されません。
  # 測定記録をクリアしても、記録を開始してから実行されたことまでリセットされているわけではないことに注意して下さい。
  # 
  # @see [[m:Coverage.peek_result]]
  def result; end

  # --- running? -> bool
  # 
  # カバレッジ測定中かどうかを返します。カバレッジの測定中とは、Coverage.start の
  # 呼び出し後から Coverage.result の呼び出し前です。
  # 
  # //emlist[][ruby]{
  # require 'coverage'
  # p Coverage.running?    #=> false
  # Coverage.start
  # p Coverage.running?    #=> true
  # p Coverage.peek_result #=> {}
  # p Coverage.running?    #=> true
  # p Coverage.result      #=> {}
  # p Coverage.running?    #=> false
  # //}
  def running?; end

  # --- start(option = {})  -> nil
  # カバレッジの測定を開始します。既に実行されていた場合には何も起こりません。
  # ただし、カバレッジ計測中に測定対象を変更しようとした場合は、RuntimeError となります。
  # 
  # @param option カバレッジの計測モードを指定します。
  #               :all か "all" を指定すると、全ての種類を計測します。
  #               個別に指定する場合は、ハッシュを渡します。
  #               詳細は、[[lib:coverage]] ライブラリ を参照してください。
  # 
  # //emlist[bool.rb][ruby]{
  # def bool(obj)
  #   if obj
  #     true
  #   else
  #     false
  #   end
  # end
  # //}
  # 
  # //emlist[][ruby]{
  # require "coverage"
  # 
  # Coverage.start(:all)
  # load "bool.rb"
  # bool(0)
  # pp Coverage.result
  # # {"bool.rb"=>
  # #   {:lines=>[1, 1, 1, nil, 0, nil, nil],
  # #    :branches=>
  # #     {[:if, 0, 2, 2, 6, 5]=>
  # #       {[:then, 1, 3, 4, 3, 8]=>1, [:else, 2, 5, 4, 5, 9]=>0}},
  # #    :methods=>{[Object, :bool, 1, 0, 7, 3]=>1}}}
  # 
  # Coverage.start(methods: true)
  # load "bool.rb"
  # bool(0)
  # pp Coverage.result  #=> {"bool.rb"=>{:methods=>{[Object, :bool, 1, 0, 7, 3]=>1}}}
  # //}
  def start; end

end
