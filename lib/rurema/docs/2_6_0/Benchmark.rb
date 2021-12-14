module Benchmark
  # --- benchmark(caption = "", label_width = nil, fmtstr = nil, *labels){|rep| ...} -> [Benchmark::Tms]
  # 
  # [[c:Benchmark::Report]] オブジェクトを生成し、それを引数として与えられたブロックを実行します。
  # 
  # 基本的には以下のように使います。
  # ブロックが [[c:Benchmark::Tms]] オブジェクトの配列を返した場合は、
  # それらの数値も追加の行に表示されます。
  # 
  # @param caption     レポートの一行目に表示する文字列を指定します。
  # @param label_width ラベルの幅を指定します。
  # @param fmtstr      フォーマット文字列を指定します。
  #                    この引数を省略すると [[m:Benchmark::FORMAT]] が使用されます。
  # @param labels  ブロックが [[c:Benchmark::Tms]] オブジェクトの配列を返す場合に指定します。
  # 
  # === フォーマット文字列
  # 
  # フォーマット文字列として以下が使用できます。
  # 
  # : %u
  #   user CPU time で置き換えられます。[[m:Benchmark::Tms#utime]]
  # : %y
  #   system CPU time で置き換えられます(Mnemonic: y of "s*y*stem")。[[m:Benchmark::Tms#stime]]
  # : %U
  #   子プロセスの user CPU time で置き換えられます。[[m:Benchmark::Tms#cutime]]
  # : %Y
  #   子プロセスの system CPU time で置き換えられます。[[m:Benchmark::Tms#cstime]]
  # : %t
  #   total CPU time で置き換えられます。[[m:Benchmark::Tms#total]]
  # : %r
  #   実経過時間で置き換えられます。[[m:Benchmark::Tms#real]]
  # : %n
  #   ラベルで置き換えられます(Mnemonic: n of "*n*ame")。[[m:Benchmark::Tms#label]]
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # n = 50000
  # 
  # # これは
  # #    Benchmark.bm(7, ">total:", ">avg:") do |x| ... end
  # # と同じ
  # Benchmark.benchmark(" "*7 + Benchmark::CAPTION,
  #                     7,
  #                     Benchmark::FORMAT,
  #                     ">total:",
  #                     ">avg:") do |x|
  # 
  #   tf = x.report("for:")   { for i in 1..n; a = "1"; end }
  #   tt = x.report("times:") { n.times do   ; a = "1"; end }
  #   tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  # 
  #   [tf+tt+tu, (tf+tt+tu)/3]
  # end
  # 
  # #=>
  # #
  # #              user     system      total        real
  # # for:     1.016667   0.016667   1.033333 (  0.485749)
  # # times:   1.450000   0.016667   1.466667 (  0.681367)
  # # upto:    1.533333   0.000000   1.533333 (  0.722166)
  # # >total:  4.000000   0.033333   4.033333 (  1.889282)
  # # >avg:    1.333333   0.011111   1.344444 (  0.629761)
  # //}
  def benchmark; end

  # --- bm(label_width = 0, *labels) {|rep| ... } -> [Benchmark::Tms]
  # 
  # [[m:Benchmark.#benchmark]] メソッドの引数を簡略化したものです。
  # 
  # [[m:Benchmark.#benchmark]] メソッドと同様に働きます。
  # 
  # @param label_width ラベルの幅を指定します。
  # @param labels     ブロックが [[c:Benchmark::Tms]] オブジェクトの配列を返す場合に指定します。
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # n = 50000
  # Benchmark.bm do |x|
  # x.report { for i in 1..n; a = "1"; end }
  # x.report { n.times do   ; a = "1"; end }
  # x.report { 1.upto(n) do ; a = "1"; end }
  # end
  # 
  # #=>
  # #
  # #     user     system      total        real
  # # 1.033333   0.016667   1.016667 (  0.492106)
  # # 1.483333   0.000000   1.483333 (  0.694605)
  # # 1.516667   0.000000   1.516667 (  0.711077)
  # //}
  # 
  # 以下のようにも書けます。
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # n = 50000
  # Benchmark.bm(7) do |x|
  #   x.report("for:")   { for i in 1..n; a = "1"; end }
  #   x.report("times:") { n.times do   ; a = "1"; end }
  #   x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  # end
  # 
  # #=>
  # #              user     system      total        real
  # # for:     1.050000   0.000000   1.050000 (  0.503462)
  # # times:   1.533333   0.016667   1.550000 (  0.735473)
  # # upto:    1.500000   0.016667   1.516667 (  0.711239)
  # //}
  # 
  # 集計を付けた場合
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # n = 50000
  # Benchmark.bm(7, ">total:", ">avg:") do |x|
  #   tf = x.report("for:")   { for i in 1..n; a = "1"; end }
  #   tt = x.report("times:") { n.times do   ; a = "1"; end }
  #   tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
  #   [tf + tt + tu, (tf + tt + tu) / 3]
  # end
  # 
  # #=>
  # #               user     system      total        real
  # # for:      0.001467   0.004727   0.006194 (  0.006193)
  # # times:    0.003814   0.000000   0.003814 (  0.003814)
  # # upto:     0.003855   0.000003   0.003858 (  0.003859)
  # # >total:   0.009136   0.004730   0.013866 (  0.013867)
  # # >avg:     0.003045   0.001577   0.004622 (  0.004622)
  # //}
  # 
  # @see [[m:Benchmark.#benchmark]]
  def bm; end

  # --- bmbm(width = 0) {|job| ... } -> [Benchmark::Tms]
  # 
  # [[c:Benchmark::Job]] オブジェクトを生成して、それを引数として与えられたブロックを
  # 実行します。
  # 
  # ベンチマークの結果は GC の影響によって歪められてしまうことがあります。
  # このメソッドは与えられたブロックを二度実行する事によってこの影響を最小化します。
  # 一回目は実行環境を安定化するためにリハーサルとして実行します。二回目は本番として
  # 実行します。
  # 
  # 二回目のブロック実行の前に [[m:GC.start]] を実行しますが、この実行時間は計測には
  # 含まれません。しかし、実際にはこのメソッドを使用しても、GC などの影響を分離する
  # ことは保証されません。
  # 
  # @param width ラベルの幅を指定します。
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # array = (1..1000000).map { rand }
  # 
  # Benchmark.bmbm do |x|
  #   x.report("sort!") { array.dup.sort! }
  #   x.report("sort")  { array.dup.sort  }
  # end
  # 
  # #=>
  # #
  # # Rehearsal -----------------------------------------
  # # sort!  11.928000   0.010000  11.938000 ( 12.756000)
  # # sort   13.048000   0.020000  13.068000 ( 13.857000)
  # # ------------------------------- total: 25.006000sec
  # #
  # #             user     system      total        real
  # # sort!  12.959000   0.010000  12.969000 ( 13.793000)
  # # sort   12.007000   0.000000  12.007000 ( 12.791000)
  # //}
  def bmbm; end

  # --- measure(label = "") { ... }  -> Benchmark::Tms
  # 
  # 与えられたブロックを実行して、経過した時間を [[m:Process.#times]] で計り、
  # [[c:Benchmark::Tms]] オブジェクトを生成して返します。
  # 
  # Benchmark::Tms オブジェクトには to_s が定義されているので、
  # 基本的には以下のように使います。
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # 
  # puts Benchmark::CAPTION
  # puts Benchmark.measure { "a"*1_000_000 }
  # 
  # #=>
  # #
  # #     user     system      total        real
  # # 1.166667   0.050000   1.216667 (  0.571355)
  # //}
  def measure; end

  # --- realtime { ... } -> Float
  # 
  # 与えられたブロックを評価して実行時間を計測して返します。
  # 返り値の単位は、秒です。
  # 
  # //emlist[][ruby]{
  # require 'benchmark'
  # puts Benchmark.realtime { [0] * (10**8) } # => 1.0929416846483946
  # //}
  def realtime; end

  # --- BENCHMARK_VERSION -> String
  # 
  # benchmark ライブラリのバージョンを表します。
  def BENCHMARK_VERSION; end

  # --- CAPTION -> String
  # 
  # [[m:Benchmark.#bm]] の内部などで使用されます。
  # 
  # 実際の定義は [[m:Benchmark::Tms::CAPTION]] でされています。
  # 
  # @see [[m:Benchmark::Tms::CAPTION]]
  def CAPTION; end

  # --- FORMAT -> String
  # 
  # [[m:Benchmark.#benchmark]] の第三引数のデフォルト値。
  # 
  # : %u
  #   user CPU time で置き換えられます。[[m:Benchmark::Tms#utime]]
  # : %y
  #   system CPU time で置き換えられます(Mnemonic: y of "s*y*stem")。[[m:Benchmark::Tms#stime]]
  # : %U
  #   子プロセスの user CPU time で置き換えられます。[[m:Benchmark::Tms#cutime]]
  # : %Y
  #   子プロセスの system CPU time で置き換えられます。[[m:Benchmark::Tms#cstime]]
  # : %t
  #   total CPU time で置き換えられます。[[m:Benchmark::Tms#total]]
  # : %r
  #   実経過時間で置き換えられます。[[m:Benchmark::Tms#real]]
  # : %n
  #   ラベルで置き換えられます(Mnemonic: n of "*n*ame")。[[m:Benchmark::Tms#label]]
  # 
  # 上記のフォーマット文字列を使用しています。
  # この定数の内容は以下の通りです。
  # 
  # //emlist[][ruby]{
  # "%10.6u %10.6y %10.6t %10.6r\n"
  # //}
  # 
  # @see [[m:Benchmark.#benchmark]], [[m:Benchmark::Tms::FORMAT]]
  def FORMAT; end

end
