class Gem::CommandManager
  # --- [](command_name) -> Gem::Command | nil
  # 
  # 引数で指定されたコマンド名に対応するクラスのインスタンスを返します。
  # 
  # @param command_name コマンド名を文字列で指定します。
  def []; end

  # --- command_names -> Array
  # 
  # 登録されているコマンド名の配列を返します。
  def command_names; end

  # --- find_command(command_name) -> Gem::Command | nil
  # 
  # 登録されているコマンドからマッチしたものを返します。
  # 
  # @param command_name コマンド名を文字列で指定します。
  # 
  # @return [[c:Gem::Command]] のサブクラスのインスタンスを返します。
  # 
  # @raise RuntimeError マッチする可能性のあるコマンドが複数ある場合に発生します。
  #                     また、マッチするコマンドが無かった場合にも発生します。
  def find_command; end

  # --- find_command_possibilities(command_name) -> Array
  # 
  # 登録されているコマンドでマッチする可能性のあるものを返します。
  # 
  # @param command_name コマンド名を文字列で指定します。
  def find_command_possibilities; end

  # --- process_args(args) -> ()
  # 
  # 引数 args を処理して gem コマンドを実行するために必要な処理を行います。
  # 
  # @param args コマンドラインから受け取った引数を指定します。
  def process_args; end

  # --- register_command(command_name) -> false
  # 
  # コマンドを自身に登録します。
  # 
  # @param command_name コマンド名をシンボルで指定します。
  def register_command; end

  # --- run(args) -> ()
  # 
  # 引数 args を処理して gem コマンドを実行中のエラーを捕捉します。
  # 
  # @param args コマンドラインから受け取った引数を指定します。
  def run; end

  # --- instance -> Gem::CommandManager
  # 
  # 自身をインスタンス化します。
  def instance; end

end
