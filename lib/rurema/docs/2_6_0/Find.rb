module Find
  # --- find(*dirs, ignore_error: true)              -> Enumerator
  # --- find(*dirs, ignore_error: true){|file| ... } -> nil
  # 
  # [[man:find(1)]] のように dir 配下のすべてのファイルや
  # ディレクトリを一つずつ引数 file に渡してブロックを実行します。
  # 
  # ディレクトリのシンボリックリンクは辿りません。
  # また file に渡される順序は不定です。
  # 
  # ブロックを省略した場合は [[c:Enumerator]] を返します。
  # 
  # @param dirs 探索するディレクトリを一つ以上指定します。
  # 
  # @param ignore_error 探索中に発生した例外を無視するかどうかを指定します。
  # 
  # 例:
  # 
  #   require 'find'
  #   
  #   Find.find('/tmp') {|f|
  #     Find.prune if f == "/tmp/bar"
  #     ...
  #   }
  # 
  # あるディレクトリ配下の探索を省略したい場合は上記のように、
  # [[m:Find.#prune]] を使用します。この例では "/tmp/bar"
  # 配下のファイルやディレクトリを探索しません。prune の代わりに
  # [[ref:d:spec/control#next]] を使用した場合、"/tmp/bar" 自体をスキップする
  # だけで、その配下の探索は続行されます。
  # 
  # @see [[man:find(1)]], [[m:Find.#prune]]
  def find; end

  # --- prune -> ()
  # 
  # [[m:Find.#find]] メソッドのブロックにディレクトリが渡されたときにこ
  # のメソッドを実行すると、そのディレクトリ配下の探索を無視します。
  def prune; end

end
