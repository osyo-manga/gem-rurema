module GC::Profiler
  # --- clear -> nil
  # 
  # 蓄積している GC のプロファイル情報をすべて削除します。
  # 
  # 例:
  #   GC::Profiler.enable
  #   GC.start
  #   GC.start
  #   GC::Profiler.report #=> 2 回分の GC のプロファイル情報出力する。
  #   GC::Profiler.clear
  #   GC.start
  #   GC::Profiler.report #=> 1 回分の GC のプロファイル情報出力する。
  def clear; end

  # --- disable -> nil
  # 
  # GC のプロファイラを停止します。
  # 
  # 例:
  #   GC::Profiler.disable
  #   GC::Profiler.enabled? #=> false
  # 
  # このメソッドでは、蓄積したプロファイル情報は破棄しません。
  # 破棄したい場合は [[m:GC::Profiler.clear]] を呼び出してください。
  # 
  # @see [[m:GC::Profiler.enable]], [[m:GC::Profiler.enabled?]]
  def disable; end

  # --- enable -> nil
  # 
  # GC のプロファイラを起動します。
  # 
  # このメソッドを呼び出してから GC が発生すると、
  # GC についてプロファイル情報を取得します。
  # 
  # 例:
  #   GC::Profiler.enable
  #   GC::Profiler.enabled? #=> true
  # 
  # @see [[m:GC::Profiler.disable]], [[m:GC::Profiler.enabled?]]
  def enable; end

  # --- enabled? -> bool
  # 
  # GC のプロファイラを起動中であれば true、停止中であれば false を返します。
  # 
  # 例:
  #   GC::Profiler.enabled? #=> false
  #   GC::Profiler.enable
  #   GC::Profiler.enabled? #=> true
  #   GC::Profiler.disable
  #   GC::Profiler.enabled? #=> false
  # 
  # @see [[m:GC::Profiler.enable]], [[m:GC::Profiler.disable]]
  def enabled?; end

  # --- raw_data -> [Hash, ...] | nil
  # 
  # GC のプロファイル情報を GC の発生ごとに [[c:Hash]] の配列
  # (:GC_INVOKE_TIME が早いもの順)で返します。[[c:GC::Profiler]] が有効になっ
  # ていない場合は nil を返します。
  # 
  # 例:
  # 
  #   GC::Profiler.enable
  #   GC.start
  #   GC::Profiler.raw_data
  #   # => [
  #     {
  #        :GC_TIME=>1.3000000000000858e-05,
  #        :GC_INVOKE_TIME=>0.010634999999999999,
  #        :HEAP_USE_SIZE=>289640,
  #        :HEAP_TOTAL_SIZE=>588960,
  #        :HEAP_TOTAL_OBJECTS=>14724,
  #        :GC_IS_MARKED=>false
  #     },
  #     # ...
  #   ]
  # 
  # 各項目の意味を以下に示します。
  # 
  # : :GC_TIME
  # 
  #   GC の処理時間(秒)
  # 
  # : :GC_INVOKE_TIME
  # 
  #   Ruby が起動してから GC が起動するまでに経過した時間(秒)
  # 
  # : :HEAP_USE_SIZE
  # 
  #   ヒープ内での使用サイズ(バイト)
  # 
  # : :HEAP_TOTAL_SIZE
  # 
  #   ヒープ全体のサイズ(バイト)
  # 
  # : :HEAP_TOTAL_OBJECTS
  # 
  #   ヒープ内に存在するオブジェクトの個数
  # 
  # : :GC_IS_MARKED
  # 
  #   GC がマークフェイズかどうか
  # 
  # また、GC_PROFILE_MORE_DETAIL を有効にして Ruby をビルドした場合、以下の
  # キーも参照できます。
  # 
  #  * :GC_MARK_TIME
  #  * :GC_SWEEP_TIME
  #  * :ALLOCATE_INCREASE
  #  * :ALLOCATE_LIMIT
  #  * :HEAP_USE_SLOTS
  #  * :HEAP_LIVE_OBJECTS
  #  * :HEAP_FREE_OBJECTS
  #  * :HAVE_FINALIZE
  # 
  # @see [[m:GC::Profiler.report]], [[m:GC::Profiler.result]]
  def raw_data; end

  # --- report(out = $stdout) -> nil
  # 
  # [[m:GC::Profiler.result]] の結果を out に出力します。
  # 
  # @param out 結果の出力先を指定します。デフォルトは $stdout です。
  # 
  # //emlist[例][ruby]{
  # GC::Profiler.enable
  # GC.start
  # GC::Profiler.report
  # 
  # # => GC 4 invokes.
  # # Index    Invoke Time(sec)       Use Size(byte)     Total Size(byte)         Total Object                    GC Time(ms)
  # #     1               0.019               303720              1269840                31746         1.25899999999999967493
  # //}
  # 
  # @see [[m:GC::Profiler.result]]
  def report; end

  # --- result -> String
  # 
  # GC のプロファイル情報をフォーマットし、文字列として返します。
  # 
  # プロファイル情報は、GC の発生ごとに集計します。
  # 以下は、5 回 GC が発生した場合の実行例です。
  # 
  #   $ ruby -e "GC::Profiler.enable; a = Array.new(100000){ 'aa' }; puts GC::Profiler.result"
  #   GC 5 invokes.
  #   Index    Invoke Time(sec)       Use Size(byte)     Total Size(byte)         Total Object                    GC Time(ms)
  #       1               0.012               165600               212940                10647         0.00000000000000000000
  #       2               0.016               343700               360360                18018         0.00000000000000014129
  #       3               0.024               605620               622440                31122         0.00000000000000008843
  #       4               0.028              1080280              1097460                54873         0.40010000000000001119
  #       5               0.044              1931420              1949220                97461         0.40009999999999984466
  # 
  # 各項目の意味を以下に示します。
  # 
  # : GC invokes
  #   GC の起動回数
  # : Invoke Time
  #   Ruby が起動してから GC が起動するまでに経過した時間
  # : Use Size
  #   ヒープ内での使用サイズ
  # : Total Size
  #   ヒープ全体のサイズ
  # : Total Object
  #   ヒープ内に存在するオブジェクトの個数
  # : GC Time
  #   GC の処理時間
  # 
  # @see [[m:GC::Profiler.report]]
  def result; end

  # --- total_time -> Float
  # GC のプロファイル情報から GC の総計時間を計算し、msec 単位で返します。
  # 
  # //emlist[例][ruby]{
  # GC::Profiler.enable
  # GC.start
  # GC::Profiler.total_time # => 0.0011530000000000012
  # //}
  def total_time; end

end
