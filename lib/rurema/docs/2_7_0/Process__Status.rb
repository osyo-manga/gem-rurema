class Process::Status
  # --- &(other)    -> Integer
  # 
  # self.to_i & other と同じです。
  # このメソッドは後方互換性のためにあります。
  # 
  # @param other 自身との & 演算をしたい整数を指定します。
  def &; end

  # --- ==(other)    -> bool
  # 
  # 同じステータスの場合に真を返します。
  # 
  # other が数値の場合、self.to_i との比較が行われます。こ
  # れは後方互換性のためです。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  def ==; end

  # --- >>(num)    -> Integer
  # 
  # self.to_i >> num と同じです。
  # 
  # @param num 整数を指定します。
  # 
  #    fork { exit 99 }   #=> 26563
  #    Process.wait       #=> 26563
  #    $?.to_i            #=> 25344
  #    $? >> 8            #=> 99
  def >>; end

  # --- coredump?    -> bool
  # 
  # 終了時にコアダンプしていたら真を返します。
  # 
  # このメソッドは signaled? が真のときにしか意味を持ちません。
  # 
  # このメソッドはシステムに依存します。サポートしないプラットフォー
  # ムでは常に false を返します。
  def coredump?; end

  # --- exited?    -> bool
  # 
  # プロセスが [[man:exit(2)]] などにより正常に終了した場合に、真を返します。
  # そうでない場合に false を返します。
  def exited?; end

  # --- exitstatus    -> Integer | nil
  # 
  # exited? が真の場合プロセスが返した終了ステータスの整数を、そ
  # うでない場合は nil を返します。
  def exitstatus; end

  # --- inspect    -> String
  # 
  # 自身を人間が読みやすい形の文字列表現にして返します。
  # 
  # プロセスの状態を以下のフォーマットで返します。
  # 
  # : 正常終了のとき
  #  #<Process::Status: pid=18262,exited(nnn)>
  # : シグナルによる停止のとき
  #  #<Process::Status: pid=18262,stopped(SIGxxx=nnn)>
  # : シグナルによる終了のとき
  #  #<Process::Status: pid=18262,signaled(SIGxxx=nnn)>
  # : コアダンプしたとき(このステータスの表示はシステムに依存します)
  #  #<Process::Status: pid=18262,coredumped>
  def inspect; end

  # --- pid    -> Integer
  # 
  # 終了したプロセスのプロセス ID を返します。
  def pid; end

  # --- signaled?    -> bool
  # 
  # プロセスがハンドラを定義していないシグナルを受けて終了した場合に真
  # を返します。
  def signaled?; end

  # --- stopped?    -> bool
  # 
  # プロセスが現在停止(終了ではない)している場合に真を返します。
  # [[m:Process.#waitpid]] に [[m:Process::WUNTRACED]] フラグを設定した
  # 場合にだけ真になりえます。
  def stopped?; end

  # --- stopsig    -> Integer | nil
  # 
  # stopped? が真の場合そのシグナルの番号を、そうでない場合は
  # nil を返します。
  def stopsig; end

  # --- success?    -> bool
  # 
  # プロセスの終了状態が成功である場合に true を返します。
  # そうでない場合に false を返します。
  def success?; end

  # --- termsig    -> Integer | nil
  # 
  # signaled? が真の場合プロセスを終了させたシグナル番号を、
  # そうでない場合は nil を返します。
  def termsig; end

  # --- to_i    -> Integer
  # 
  # C 言語での終了ステータス表現の整数を返します。
  # 
  # 多くのシステムの実装では、この値の上位 8 bit に [[man:exit(2)]]
  # に渡した終了ステータスが、下位 8 bit にシグナル等で終了した等の情
  # 報が入っています。
  def to_i; end

  # --- to_s    -> String
  # 
  # to_i.to_s と同じです。
  def to_s; end

end
