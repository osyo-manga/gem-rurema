module Process::GID
  # --- change_privilege(id)    -> Integer
  # 
  # 実グループ ID・実効グループ ID・保存グループ ID のすべてを指定された id に変更します。
  # 成功したら id を返します。主に root 権限を完全に放棄するために使います。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @param id グループ ID を整数で指定します。
  # 
  # @raise ArgumentError 変更できないグループ ID があった場合に発生します。例外の発生時にこのメソッドを呼び出す前の各グループ ID の値が保存されているかどうかは保証されません。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    [Process.gid, Process.egid]          #=> [0, 0]
  #    Process::GID.change_privilege(33)    #=> 33
  #    [Process.gid, Process.egid]          #=> [33, 33]
  def change_privilege; end

  # --- eid    -> Integer
  # 
  # 現在のプロセスの実効グループ ID を返します。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    Process.egid   #=> 500
  def eid; end

  # --- grant_privilege(id)    -> Integer
  # --- eid=(id)
  # 
  # 現在のプロセスの実効グループ ID を id に変更します。成功したら id を返します。
  # 
  # 実グループ ID は変更されないことが保証されます。
  # 保存グループ ID が変更されないかもしれないので root 権限の完全放棄には使えません。
  # 保存グループ ID が変化するかどうかは [[m:Process::GID.#re_exchangeable?]]
  # が true を返すかどうかで決まります。
  #  * true の環境では、実グループ ID と異なる値を設定した場合、保存グループ ID は新しい実効グループ ID の値に設定されます。
  #  * false の環境では保存グループ ID は変化しません。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @param id グループ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 設定できない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    [Process.gid, Process.egid]          #=> [0, 0]
  #    Process::GID.grant_privilege(33)     #=> 33
  #    [Process.gid, Process.egid]          #=> [0, 33]
  def eid=; end

  # --- from_name(name) -> Integer
  # 
  # 引数で指定した名前の実グループ ID を返します。
  # 
  #   Process::GID.from_name("wheel") # => 0
  #   Process::GID.from_name("nosuchgroup") # => can't find group for nosuchgroup (ArgumentError)
  # 
  # @param name グループ名を指定します。
  # 
  # @raise ArgumentError 引数で指定したグループが存在しない場合に発生します。
  def from_name; end

  # --- re_exchange    -> Integer
  # 
  # 現在のプロセスの実グループ ID と実効グループ ID を入れ替えます。
  # 保存ユーザ ID は新しい実効ユーザ ID と同じになります。
  # 新しい実効グループ ID を返します。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    [Process.gid, Process.egid]   #=> [0, 33]
  #    Process::GID.re_exchange      #=> 0
  #    [Process.gid, Process.egid]   #=> [33, 0]
  def re_exchange; end

  # --- re_exchangeable?    -> bool
  # 
  # 現在のプラットフォームで [[m:Process::GID.#re_exchange]] が実装されている
  # なら true を返します。そうでない場合に false を返します。
  def re_exchangeable?; end

  # --- rid    -> Integer
  # 
  # 現在のプロセスの実グループ ID を返します。
  # 
  #    Process.rid   #=> 500
  def rid; end

  # --- sid_available?    -> bool
  # 
  # 現在のプラットフォームが保存グループ ID を持つなら true を返します。
  # そうでない場合に false を返します。
  # 
  # ただし、このメソッドの値には保証がありません。
  # 現在は次の条件のいずれかが満足される場合には
  # 保存グループ ID を持つものと判定しています。
  # 
  #   * setresgid() を持つ
  #   * setegid() を持つ
  #   * _POSIX_SAVED_IDS が真として定義されている
  def sid_available?; end

  # --- switch               -> Integer
  # --- switch {...}    -> object
  # 
  # 実効グループ ID を一時的に変更するために使います。
  # 
  # 実効グループ ID を実グループ ID に変更します。実効グループ ID と実グループ ID が
  # 等しい場合には、実効グループ ID を保存グループ ID に変更します。
  # 変更前の実効グループ ID を返します。
  # 
  # ブロックが指定された場合、実効グループ ID を実グループ ID へ
  # 変更しブロックを実行します。ブロック終了時に実効グループ ID を元の
  # 値に戻します。ブロックの実行結果を返します。
  # 
  # なお、保存グループ ID を持たない環境でこのメソッドを実行すると
  # 実グループ ID が変化します。
  # 
  # @raise Errno::EPERM 各グループ ID がこのメソッドを実行するのに適切な状態でない場合、
  #                     つまり、実グループ ID・実効グループ ID・保存グループ ID が全て
  #                     同じ場合に発生します。ブロック付きの場合は、なんらかの原因で元の
  #                     権限に復帰できないにも発生します。ブロック内でグループ ID が変更
  #                     されたなどの理由が挙げられます。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #  include Process
  #  # (r, e, s) == (500, 505, 505)
  #  p [gid, egid]           #=> [500, 505]
  #  Process::GID.switch do
  #    p [gid, egid]         #=> [500, 500]
  #  end
  #  p [gid, egid]           #=> [500, 505]
  def switch; end

end
