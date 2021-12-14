class Benchmark::Report
  # --- item(label = "", *fmt){ ... } -> Benchmark::Tms
  # --- report(label = "", *fmt){ ... } -> Benchmark::Tms
  # 
  # ラベルと与えられたブロックの実行時間を標準出力に出力します。
  # 
  # 出力のフォーマットは [[m:Benchmark::Tms#format]] が行います。
  # 
  # @param label ラベル
  # @param fmt   結果に出力したいオブジェクト
  # 
  # @see [[m:Benchmark::Tms#format]]
  def item; end

  # --- list -> [Benchmark::Tms]
  # 
  # [[m:Benchmark::Report#item]] 実行時に作成された [[c:Benchmark::Tms]] オ
  # ブジェクトの一覧を返します。
  # 
  # @see [[m:Benchmark::Report#item]]
  def list; end

  # --- new(width = 0, fmtstr = nil) -> Benchmark::Report
  # 
  # [[c:Benchmark::Report]] のインスタンスを初期化して返します。
  # 
  # 通常このメソッドがユーザーによって直接呼び出されることはありません。
  # 
  # @param width  ラベルの幅
  # @param fmtstr フォーマット文字列
  def new; end

end
