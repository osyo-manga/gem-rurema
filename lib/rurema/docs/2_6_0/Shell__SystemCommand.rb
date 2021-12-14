class Shell::SystemCommand
  # --- active? -> bool
  # @todo
  def active?; end

  # --- command -> String
  # --- name    -> String
  # @todo
  # 
  # コマンド名を返します。
  def command; end

  # --- each(rs = nil){|line| ... }
  # @todo
  # 
  # @param rs
  def each; end

  # --- flush -> ()
  # @todo
  def flush; end

  # --- input=(inp)
  # @todo
  def input=; end

  # --- kill(signal) -> Integer
  # 
  # 自身のプロセスにシグナルを送ります。
  # 
  # @param signal シグナルを整数かその名前の文字列で指定します。
  #               負の値を持つシグナル(あるいはシグナル名の前に-)を指定すると、
  #               プロセスではなくプロセスグループにシグナルを送ります。 
  # 
  # @see [[m:Process.#kill]]
  def kill; end

  # --- notify(*opts) -> String
  # --- notify(*opts){|message| ... } -> String
  # @todo
  # 
  # @param opts
  # 
  # @see [[m:Shell#notify]]
  def notify; end

  # --- start -> ()
  # @todo
  def start; end

  # --- start_export
  # @todo
  def start_export; end

  # --- start_import -> ()
  # @todo
  def start_import; end

  # --- super_each -> ()
  # @todo
  # 
  # [[m:Shell::Filter#each]] です。
  def super_each; end

  # --- terminate -> ()
  # @todo
  def terminate; end

  # --- wait? -> bool
  # @todo
  def wait?; end

  # --- new(sh, command, *opts)
  # @todo
  # 
  # @param sh
  # 
  # @param command
  # 
  # @param opts
  def new; end

end
