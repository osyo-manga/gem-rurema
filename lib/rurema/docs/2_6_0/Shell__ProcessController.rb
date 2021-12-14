class Shell::ProcessController
  # --- active_job?(job) -> bool
  # 
  # 指定されたジョブが実行中である場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param job ジョブを指定します。
  def active_job?; end

  # --- active_jobs -> Array
  # 
  # 実行中のジョブの配列を返します。
  def active_jobs; end

  # --- active_jobs_exist? -> bool
  # 
  # 実行中のジョブが存在する場合は真を返します。
  # そうでない場合は偽を返します。
  def active_jobs_exist?; end

  # --- add_schedule(command) -> ()
  # 
  # 指定されたコマンドを待機ジョブとして登録します。
  # ただし、実行中のジョブが存在しない場合は、そのジョブを直ちに実行します。
  # 
  # @param command コマンドを指定します。
  def add_schedule; end

  # --- jobs -> Array
  # 
  # 全てのジョブの配列を返します。
  def jobs; end

  # --- jobs_exist? -> bool
  # 
  # 実行中か待機中のジョブが存在する場合は真を返します。
  # そうでない場合は偽を返します。
  def jobs_exist?; end

  # --- kill_job(signal, command) -> Integer
  # 
  # 指定されたコマンドにシグナルを送ります。
  # 
  # @param signal シグナルを整数かその名前の文字列で指定します。
  #               負の値を持つシグナル(あるいはシグナル名の前に-)を指定すると、
  #               プロセスではなくプロセスグループにシグナルを送ります。 
  # 
  # @param command コマンドを指定します。
  # 
  # @see [[m:Process.#kill]]
  def kill_job; end

  # --- sfork(command){ ... } -> [Integer, IO, IO]
  # 
  # シンプルな fork です。
  # 
  # @param command コマンドを指定します。
  # 
  # @return [PID, 入力用 IO, 出力用 IO] からなる配列を返します。
  def sfork; end

  # --- shell -> Shell
  # @todo
  def shell; end

  # --- start_job(command = nil)
  # 
  # 指定されたコマンドの実行を開始します。
  # 
  # コマンドを省略した場合は、待ち状態のジョブのうち先頭のものを実行します。
  # 
  # @param command コマンドを指定します。
  def start_job; end

  # --- terminate_job(command)
  # 
  # 指定されたコマンドを終了します。
  # 
  # @param command コマンドを指定します。
  def terminate_job; end

  # --- wait_all_jobs_execution -> ()
  # 
  # 全てのジョブの実行が終わるまで待ちます。
  def wait_all_jobs_execution; end

  # --- waiting_job?(job) -> bool
  # 
  # 指定されたジョブが存在する場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param job ジョブを指定します。
  def waiting_job?; end

  # --- waiting_jobs -> Array
  # 
  # 待機中のジョブを返します。
  def waiting_jobs; end

  # --- waiting_jobs_exist? -> bool
  # 
  # 待機中のジョブが存在する場合は真を返します。
  # そうでない場合は偽を返します。
  def waiting_jobs_exist?; end

  # --- activate(pc) -> ()
  # @todo
  def activate; end

  # --- active_process_controllers -> ()
  # @todo
  def active_process_controllers; end

  # --- block_output_synchronize{ ... } -> ()
  # @todo
  def block_output_synchronize; end

  # --- each_active_object{|ref| ... } -> ()
  # @todo
  def each_active_object; end

  # --- inactivate(pc) -> ()
  # @todo
  def inactivate; end

  # --- new(shell)
  # 
  # 自身を初期化します。
  # 
  # @param shell [[c:Shell]] のインスタンスを指定します。
  def new; end

  # --- process_controllers_exclusive -> ()
  # @todo
  def process_controllers_exclusive; end

  # --- wait_to_finish_all_process_controllers -> ()
  # @todo
  def wait_to_finish_all_process_controllers; end

  # --- USING_AT_EXIT_WHEN_PROCESS_EXIT -> true
  # @todo
  def USING_AT_EXIT_WHEN_PROCESS_EXIT; end

end
