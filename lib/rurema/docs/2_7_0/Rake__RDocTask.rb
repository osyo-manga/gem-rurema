class Rake::RDocTask
  # --- define -> self
  # 
  # タスクを定義します。
  def define; end

  # --- external -> bool
  # 
  # この値が真の場合は外部のシェル経由で rdoc コマンドを実行します。
  # デフォルトは偽です。
  def external; end

  # --- external=(flag)
  # 
  # 外部のシェル経由で rdoc コマンドを実行するかどうかセットします。
  # 
  # @param flag 真または偽を指定します。
  def external=; end

  # --- main -> String
  # 
  # メインとして使用されるファイル名を返します。
  def main; end

  # --- main=(filename)
  # 
  # メインとして使用されるファイル名をセットします。
  def main=; end

  # --- name -> String
  # 
  # タスクの名前を返します。デフォルトは rdoc です。
  def name; end

  # --- name=(name)
  # 
  # タスクの名前をセットします。
  # 
  # @param name タスクの名前を指定します。
  def name=; end

  # --- option_list -> Array
  # 
  # rdoc コマンドに渡すオプションのリストを返します。
  def option_list; end

  # --- option_string -> String
  # 
  # rdoc コマンドに渡すオプションを文字列として返します。
  def option_string; end

  # --- options -> Array
  # 
  # rdoc コマンドに渡すオプションのリストを返します。
  # 
  # 指定できるオプションは -o, --main, --title, -T 以外です。
  def options; end

  # --- options=(options)
  # 
  # rdoc コマンドに渡すオプションのリストをセットします。
  # 
  # @param options rdoc コマンドに渡されるオプションを指定します。
  def options=; end

  # --- quote(str) -> String
  # 
  # [[m:Rake::RDocTask#external]] が真の場合は与えられた文字列をクオートします。
  # 
  # @param str クオートする文字列を指定します。
  def quote; end

  # --- rdoc_dir -> String
  # 
  # 作成した HTML ファイルを保存するディレクトリ名を返します。
  # デフォルトは html です。
  def rdoc_dir; end

  # --- rdoc_dir=(dir)
  # 
  # 作成した HTML ファイルを保存するディレクトリ名をセットします。
  def rdoc_dir=; end

  # --- rdoc_files -> Rake::FileList
  # 
  # RDoc の生成に使用するファイルリストを返します。
  # デフォルトは空です。
  def rdoc_files; end

  # --- rdoc_files=(filelist)
  # 
  # RDoc の生成に使用するファイルリストをセットします。
  # 
  # @param filelist ファイルリストを指定します。
  def rdoc_files=; end

  # --- template -> String
  # 
  # 使用するテンプレートを返します。
  # デフォルトは RDoc のデフォルトです。
  def template; end

  # --- template=(template)
  # 
  # 使用するテンプレートをセットします。
  # 
  # @param template 使用するテンプレートを指定します。
  def template=; end

  # --- title -> String
  # 
  # RDoc のタイトルを返します。
  # デフォルト値はありません。
  def title; end

  # --- title=(title)
  # 
  # RDoc のタイトルをセットします。
  # 
  # @param title タイトルを指定します。
  def title=; end

  # --- new(name = :rdoc){|pkg| ... } -> Rake::RDocTask
  # 
  # 自身を初期化して RDoc タスクを定義します。
  # 
  # ブロックが与えられた場合は、自身をブロックパラメータとして
  # ブロックを評価します。
  # 
  # @param name タスクの名前を指定します。
  def new; end

end
