class Gem::Package::TarWriter
  # --- add_file(name, mode) -> self
  # --- add_file(name, mode){|io| ... } -> self
  # 
  # 自身に関連付けられた IO にファイルを追加します。
  # 
  # ブロックを与えると、自身に関連付けられた IO をブロックに渡してブロック
  # を評価します。
  # 
  # @param name 追加するファイルの名前を指定します。
  # 
  # @param mode 追加するファイルのパーミッションを指定します。
  def add_file; end

  # --- add_file_simple(name, mode, size) -> self
  # --- add_file_simple(name, mode, size){|io| ... } -> self
  # 
  # 自身に関連付けられた IO にファイルを追加します。
  # 
  # ブロックを与えると、自身に関連付けられた IO をブロックに渡してブロック
  # を評価します。
  # 
  # @param name 追加するファイルの名前を指定します。
  # 
  # @param mode 追加するファイルのパーミッションを指定します。
  # 
  # @param size 追加するファイルのサイズを指定します。
  def add_file_simple; end

  # --- check_closed
  # 自身に関連付けられた IO が既に close されているかどうかチェックします。
  # 
  # @raise IOError 自身に関連付けられた IO が既に close されている場合に発
  #                生します。
  def check_closed; end

  # --- close -> true
  # 
  # 自身を close します。
  def close; end

  # --- closed? -> bool
  # 
  # 自身が既に close されている場合は、真を返します。
  # そうでない場合は、偽を返します。
  def closed?; end

  # --- flush
  # 自身に関連付けられた IO をフラッシュします。
  def flush; end

  # --- mkdir(name, mode) -> self
  # 
  # 自身に関連付けられた IO にディレクトリを追加します。
  # 
  # @param name 追加するディレクトリの名前を指定します。
  # 
  # @param mode 追加するディレクトリのパーミッションを指定します。
  def mkdir; end

  # --- new(io) -> Gem::Package::TarWriter
  # 
  # 自身を初期化します。
  # 
  # @param io 自身に関連付ける IO を指定します。
  def new; end

end
