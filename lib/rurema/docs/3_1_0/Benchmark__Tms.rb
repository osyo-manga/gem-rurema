class Benchmark::Tms
  # --- *(x) -> Benchmark::Tms
  # 
  # self と x の乗算を計算します。
  # 
  # @param x [[c:Benchmark::Tms]] のオブジェクトか [[c:Float]] に暗黙の変換ができるオブジェクトです。
  # 
  # @return 計算結果は新しい [[c:Benchmark::Tms]] オブジェクトです。
  # 
  # @see [[m:Benchmark::Tms#memberwise]]
  def *; end

  # --- +(x) -> Benchmark::Tms
  # 
  # self と x の加算を計算します。
  # 
  # @param x [[c:Benchmark::Tms]] のオブジェクトか [[c:Float]] に暗黙の変換ができるオブジェクトです。
  # 
  # @return 計算結果は新しい [[c:Benchmark::Tms]] オブジェクトです。
  # 
  # @see [[m:Benchmark::Tms#memberwise]]
  def +; end

  # --- -(x) -> Benchmark::Tms
  # 
  # self と x の減算を計算します。
  # 
  # @param x [[c:Benchmark::Tms]] のオブジェクトか [[c:Float]] に暗黙の変換ができるオブジェクトです。
  # 
  # @return 計算結果は新しい [[c:Benchmark::Tms]] オブジェクトです。
  # 
  # @see [[m:Benchmark::Tms#memberwise]]
  def -; end

  # --- /(x) -> Benchmark::Tms
  # 
  # self と x の除算を計算します。
  # 
  # @param x [[c:Benchmark::Tms]] のオブジェクトか [[c:Float]] に暗黙の変換ができるオブジェクトです。
  # 
  # @return 計算結果は新しい [[c:Benchmark::Tms]] オブジェクトです。
  # 
  # @see [[m:Benchmark::Tms#memberwise]]
  def /; end

  # --- add { ... } -> Benchmark::Tms
  # 
  # 与えられたブロックの実行時間を self に加算して
  # 新しい [[c:Benchmark::Tms]] オブジェクトを生成して返します。
  # 
  # @see [[m:Benchmark.#measure]]
  def add; end

  # --- add!{ ... } -> self
  # 
  # 与えられたブロックの実行時間を self に加算して返します。
  # 
  # このメソッドは self を破壊的に変更します。
  # 
  # @see [[m:Benchmark.#measure]]
  def add!; end

  # --- cstime -> Float
  # 
  # 子プロセスの System CPU time
  def cstime; end

  # --- cutime -> Float
  # 
  # 子プロセスの User CPU time
  def cutime; end

  # --- format(fmtstr = nil, *args) -> String
  # 
  # self を指定されたフォーマットで整形して返します。
  # 
  # このメソッドは [[m:Kernel.#format]] のようにオブジェクトを整形しますが、
  # 以下の拡張を使用することができます。
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
  # @param fmtstr フォーマット文字列です。
  #               省略された場合は、[[m:Benchmark::Tms::FORMAT]] が使用されます。
  # @param args  フォーマットされる引数です。
  def format; end

  # --- label -> String
  # 
  # ラベル。
  def label; end

  # --- memberwise(op, x) -> Benchmark::Tms
  # 
  # [[c:Benchmark::Tms]] の四則演算を実行するために内部で使用されるメソッドです。
  # 
  # @param op 演算子をシンボルで与えます。
  # @param x [[c:Benchmark::Tms]] のオブジェクトか [[c:Float]] に暗黙の変換ができるオブジェクトです。
  # 
  # @return 計算結果は新しい [[c:Benchmark::Tms]] オブジェクトです。
  def memberwise; end

  # --- real -> Float
  # 
  # 実経過時間。
  def real; end

  # --- stime -> Float
  # 
  # System CPU time
  def stime; end

  # --- to_a -> Array
  # 
  # 6 要素の配列を返します。
  # 
  # 要素は以下の順番で配列に格納されています。
  #   * ラベル
  #   * user CPU time
  #   * system CPU time,
  #   * 子プロセスの user CPU time
  #   * 子プロセスの system CPU time,
  #   * 実経過時間
  def to_a; end

  # --- to_s -> String
  # 
  # 引数を省略して [[m:Benchmark::Tms#format]] を呼び出すのと同じです。
  def to_s; end

  # --- total -> Float
  # 
  # 合計時間。(utime + stime + cutime + cstime)
  def total; end

  # --- utime -> Float
  # 
  # User CPU time
  def utime; end

  # --- new(utime = 0.0, stime = 0.0, cutime = 0.0, cstime = 0.0, real = 0.0, label = nil) -> Benchmark::Tms
  # 
  # 新しい [[c:Benchmark::Tms]] オブジェクトを生成して返します。
  # 
  # @param utime  User CPU time
  # @param stime  System CPU time
  # @param cutime 子プロセスの User CPU time
  # @param cstime 子プロセスの System CPU time
  # @param real   実経過時間
  # @param label  ラベル
  def new; end

  # --- CAPTION -> String
  # 
  # [[m:Benchmark.#bm]] の内部などで使用されます。
  # 
  # @see [[m:Benchmark::CAPTION]]
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
  # @see [[m:Benchmark.#benchmark]], [[m:Benchmark::FORMAT]]
  def FORMAT; end

end
