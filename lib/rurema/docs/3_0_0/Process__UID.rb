module Process::UID
  # --- change_privilege(id)    -> Integer
  # 
  # 実ユーザ ID・実効ユーザ ID・保存ユーザ ID のすべてを指定された id に変更します。
  # 成功したら id を返します。主に root 権限を完全に放棄するために使います。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @param id ユーザ ID を整数で指定します。
  # 
  # @raise ArgumentError 変更できないユーザ ID があった場合に発生します。例外の発生時にこのメソッドを呼び出す前の各ユーザ ID の値が保存されているかどうかは保証されません。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    [Process.uid, Process.euid]          #=> [0, 0]
  #    Process::UID.change_privilege(33)    #=> 33
  #    [Process.uid, Process.euid]          #=> [33, 33]
  def change_privilege; end

  # --- eid    -> Integer
  # 
  # 現在の実効ユーザ ID を返します。
  def eid; end

  # --- grant_privilege(id)    -> Integer
  # --- eid=(id)
  # 
  # 現在のプロセスの実効ユーザ ID を id に変更します。成功したら id を返します。
  # 
  # 実ユーザ ID は変更されないことが保証されます。
  # 保存ユーザ ID が変更されないかもしれないので root 権限の完全放棄には使えません。
  # 保存ユーザ ID が変化するかどうかは [[m:Process::UID.#re_exchangeable?]]
  # が true を返すかどうかで決まります。
  # 
  #  * true の環境では、実ユーザ ID と異なる値を設定した場合、保存ユーザ ID は新しい実効ユーザ ID の値に設定されます。
  #  * false の環境では保存ユーザ ID は変化しません。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @param id ユーザ ID を整数で指定します。
  # 
  # @raise Errno::EXXX 変更できない場合に発生します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #    [Process.uid, Process.euid]          #=> [0, 0]
  #    Process::UID.grant_privilege(33)     #=> 33
  #    [Process.uid, Process.euid]          #=> [0, 33]
  def eid=; end

  # --- from_name(name) -> Integer
  # 
  # 引数で指定した名前の実ユーザ ID を返します。
  # 
  #   Process::UID.from_name("root") # => 0
  #   Process::UID.from_name("nosuchuser") # => can't find user for nosuchuser (ArgumentError)
  # 
  # @param name ユーザ名を指定します。
  # 
  # @raise ArgumentError 引数で指定したユーザが存在しない場合に発生します。
  def from_name; end

  # --- re_exchange    -> Integer
  # 
  # 実ユーザ ID と実効ユーザ ID とを入れ換えます。
  # 保存ユーザ ID は新しい実効ユーザ ID と同じになります。
  # 新しい実効ユーザ ID を返します。
  # 
  # 利用できるかはプラットフォームに依存します。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  def re_exchange; end

  # --- re_exchangeable?    -> bool
  # 
  # [[m:Process::UID.#re_exchange]] が実装されているならば true を返します。そうでない場合に false を返します。
  def re_exchangeable?; end

  # --- rid    -> Integer
  # 
  # 現在の実ユーザ ID を返します。
  def rid; end

  # --- sid_available?    -> bool
  # 
  # 保存ユーザ ID を持つ環境かどうかを真偽値で返します。
  # 保存ユーザ ID を持つなら true を返します。
  # 
  # ただし、このメソッドの値には保証がありません。
  # 現在は次の条件のいずれかが満足される場合には
  # 保存ユーザ ID を持つものと判定しています。
  # 
  #   * setresuid() を持つ
  #   * seteuid() を持つ
  #   * _POSIX_SAVED_IDS が真として定義されている
  def sid_available?; end

  # --- switch          -> Integer
  # --- switch { .... } -> object
  # 
  # 実効ユーザ ID を一時的に変更するために使います。
  # 
  # 実効ユーザ ID を実ユーザ ID に変更します。実効ユーザ ID と実ユーザ ID が
  # 等しい場合には、実効ユーザ ID を保存ユーザ ID に変更します。
  # 変更前の実効ユーザ ID を返します。
  # 
  # ブロックが指定された場合、実効ユーザ ID を実ユーザ ID へ
  # 変更しブロックを実行します。ブロック終了時に実効ユーザ ID を元の
  # 値に戻します。ブロックの実行結果を返します。
  # 
  # なお、保存ユーザ ID を持たない環境でこのメソッドを実行すると
  # 実ユーザ ID が変化します。
  # 
  # @raise Errno::EPERM 各ユーザ ID がこのメソッドを実行するのに適切な状態でない場合、
  #                     つまり、実ユーザ ID・実効ユーザ ID・保存ユーザ ID が全て
  #                     同じ場合に発生します。ブロック付きの場合は、なんらかの原因で元の
  #                     権限に復帰できないにも発生します。ブロック内でユーザ ID が変更
  #                     されたなどの理由が挙げられます。
  # 
  # @raise NotImplementedError メソッドが現在のプラットフォームで実装されていない場合に発生します。
  # 
  #  include Process
  #  # (r, e, s) == (500, 505, 505)
  #  p [uid, euid]           #=> [500, 505]
  #  Process::UID.switch do
  #    p [uid, euid]         #=> [500, 500]
  #  end
  #  p [uid, euid]           #=> [500, 505]
  def switch; end

end
