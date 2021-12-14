class Rake::Task
  # --- actions -> Array
  # 
  # 自身に関連するアクションのリストを返します。
  def actions; end

  # --- add_description(description)
  # 
  # 自身に詳細説明を追加します。
  def add_description; end

  # --- application -> Rake::Application
  # 
  # 自身を所有している [[c:Rake::Application]] のインスタンスを返します。
  def application; end

  # --- application=(app)
  # 
  # 自身を所有している [[c:Rake::Application]] のインスタンスをセットします。
  # 
  # @param app 自身を所有しているアプリケーションを指定します。
  def application=; end

  # --- arg_description
  def arg_description; end

  # --- arg_names -> Array
  # 
  # 自身のパラメータ名のリストを返します。
  def arg_names; end

  # --- clear -> self
  # 
  # 自身に登録されているアクションと事前タスクをクリアします。
  def clear; end

  # --- clear_actions -> self
  # 
  # 自身に登録されているアクションをクリアします。
  def clear_actions; end

  # --- clear_prerequisites -> self
  # 
  # 自身に登録されている事前タスクをクリアします。
  def clear_prerequisites; end

  # --- comment -> String
  # 
  # 自身の短いコメントを返します。
  def comment; end

  # --- comment=(comment)
  # 
  # 自身のコメントをセットします。
  # 
  # 与えられた文字列が 50 文字を越える場合や複数行である場合は文字列を切り詰めます。
  # 
  # @param comment コメントをあらわす文字列を指定します。
  def comment=; end

  # --- enhance(deps = nil){ ... }  -> self
  # 
  # 自身に事前タスクとアクションを追加します。
  def enhance; end

  # --- execute(args = nil)
  # 
  # 自身に関連付けられているアクションを実行します。
  def execute; end

  # --- full_comment -> String
  # 
  # 自身のコメントを全て返します。
  def full_comment; end

  # --- inspect -> String
  # 
  # 自身の情報を人間に読める形式で返します。
  def inspect; end

  # --- investigation -> String
  # 
  # 自身の詳しい内部状態を文字列化して返します。
  # 
  # このメソッドはデバッグに便利です。
  def investigation; end

  # --- invoke(*args)
  # 
  # 必要であれば自身を実行します。最初に事前タスクを実行します。
  def invoke; end

  # --- name -> String
  # 
  # ネームスペースを含むタスクの名前を返します。
  def name; end

  # --- needed? -> true
  # 
  # このタスクが必要ならば真を返します。
  def needed?; end

  # --- prerequisites -> Array
  # 
  # 事前タスクのリストを返します。
  def prerequisites; end

  # --- reenable -> false
  # 
  # 自身をもう一度実行出来るようにします。
  def reenable; end

  # --- scope
  def scope; end

  # --- set_arg_names(args)
  # 
  # 自身のパラメータの名前のリストをセットします。
  # 
  # @param args シンボルのリストを指定します。
  def set_arg_names; end

  # --- source -> String
  # 
  # [[m:Rake::Task#sources]] の最初の要素を返します。
  def source; end

  # --- sources -> Array
  # 
  # 自身が依存するファイルのリストを返します。
  def sources; end

  # --- sources=(sources)
  # 
  # 自身が依存するファイルのリストをセットします。
  # 
  # @param sources 自身が依存するファイルのリストを指定します。
  def sources=; end

  # --- timestamp -> Time
  # 
  # 自身のタイムスタンプを返します。
  # 
  # 基本的なタスクは現在時刻を返しますが、高度なタスクはタイムスタンプを
  # 計算して返します。
  def timestamp; end

  # --- to_s -> String
  # 
  # 自身の名前を返します。
  def to_s; end

  # --- [](task_name) -> Rake::Task
  # 
  # 与えられた名前のタスクを返します。
  # 
  # 与えられた名前のタスクが存在しない場合は、ルールからタスク名を合成しようとします。
  # ルールからタスク名を合成出来なかったが、与えられたタスク名にマッチするファイルが存在する
  # 場合は、ファイルタスクがアクションや事前タスク無しで存在していると仮定します。
  # 
  # @param task_name タスクの名前を指定します。
  def []; end

  # --- clear
  # 
  # タスクリストをクリアします。
  # 
  # このメソッドはユニットテスト用です。
  def clear; end

  # --- create_rule(*args){ ... } -> Rake::Task
  # 
  # タスクを合成するためのルールを作成します。
  def create_rule; end

  # --- define_task(*args){ ... } -> Rake::Task
  # 
  # 与えられたパラメータと省略可能なブロックを用いてタスクを定義します。
  # 
  # 同名のタスクが存在する場合は、事前タスクとアクションを既に存在するタスクに追加します。
  # 
  # @param args パラメータを指定します。
  def define_task; end

  # --- new(task_name, app)
  # 
  # 与えられたタスク名とアプリケーションで自身を初期化します。
  # 
  # このメソッドで作成したタスクは、アクションや事前タスクを持っていません。
  # それらを追加する場合は [[m:Rake::Task#enhance]] を使用してください。
  # 
  # @see [[m:Rake::Task#enhance]]
  def new; end

  # --- scope_name(scope, task_name) -> String
  # 
  # 与えられたスコープとタスク名をコロンで連結して返します。
  def scope_name; end

  # --- task_defined?(task_name) -> bool
  # 
  # 与えられたタスク名が既に定義されている場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param task_name タスク名を指定します。
  def task_defined?; end

  # --- tasks -> Array
  # 
  # 定義されているタスクのリストを返します。
  def tasks; end

end
