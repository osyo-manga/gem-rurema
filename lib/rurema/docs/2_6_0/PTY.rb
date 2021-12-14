module PTY
  # --- getpty(command)                          -> [IO, IO, Integer]
  # --- getpty(command){|read, write, pid| ... } -> nil
  # --- spawn(command)                           -> [IO, IO, Integer]
  # --- spawn(command){|read, write, pid| ... }  -> nil
  # 
  # 擬似 tty を確保し、指定されたコマンドをその擬似 tty の向こうで実行し、配列を返します。
  # 
  # プラットフォームに依存しますが、対応していれば、作られたプロセスはセッションリーダーに
  # なり、その制御端末は作成された擬似 tty に設定されます。
  # 
  # 
  # @param command 擬似 tty 上で実行するコマンド
  # 
  # @return 返値は3つの要素からなる配列です。最初の要素は擬似 tty から
  #         読み出すための IO オブジェクト、2番目の要素は書きこむための IO オブジェクト、
  #         3番目の要素は子プロセスのプロセス ID です。
  #         このメソッドがブロック付き呼ばれた場合、これらの要素はブロックパラメータとして渡され、
  #         メソッド自体は nil を返します。
  # 
  # 
  # @see [[m:Kernel.#spawn]], [[m:Kernel.#system]], [[m:IO.popen]], [[man:signal(2)]]
  def getpty; end

  # --- check(pid, raise = false) -> Process::Status | nil
  # 
  # pid で指定された子プロセスの状態をチェックし、変化があれば変化したステータスを
  # 返します。実行中、あるいは変化なしであれば nil を返します。
  # 
  # 状態が変化した後、その状態を取得することは一回しかできない（くりかえし check を
  # 呼んだら nil が返ってくる）ので注意してください。
  # 
  # 状態が変化して、終了したか停止した場合、第二引数が偽であれば、
  # 対応する [[c:Process::Status]] オブジェクトを返します。
  # 
  # @param pid チェックしたい子プロセスの PID を指定します。
  # 
  # @param raise 真を指定すると、子プロセスが終了または停止していた場合、
  #              例外 [[c:PTY::ChildExited]] が発生します。デフォルトは偽です。
  #              (なお、バグにより、1.9.2 pXXX より古い ruby では、終了または停止して
  #              いなくても、ただちに例外が発生します)
  def check; end

  # --- open -> [IO, File]
  # --- open{|master_io, slave_file| ... } -> object
  # 
  # 仮想 tty を確保し、マスター側に対応する [[c:IO]] オブジェクトとスレーブ側に
  # 対応する [[c:File]] オブジェクトの配列を返します。
  # 
  # ブロック付きで呼び出された場合は、これらの要素はブロックパラメータとして渡され、ブロッ
  # クから返された結果を返します。また、このマスター IO とスレーブ File は、ブロックを抜けるとき
  # にクローズ済みでなければクローズされます。
  def open; end

end
