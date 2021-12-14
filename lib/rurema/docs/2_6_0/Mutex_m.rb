module Mutex_m
  # --- mu_lock -> ()
  # --- lock -> ()
  # self をロックします。一度にひとつのスレッドしかロックできません。
  # 既にロックされている mutex に対してロックを行おうとしたスレッドは
  # ロックが解放されるまで、実行が停止されます。
  def lock; end

  # --- mu_locked? -> bool
  # --- locked? -> bool
  # self がロックされている時、真を返します。
  def locked?; end

  # --- mu_extended -> Mutex
  # 
  # [[m:Mutex_m.extend_object]] から呼び出されます。
  # ユーザが直接使うことはありません。
  def mu_extended; end

  # --- mu_synchronize{ ... } -> object
  # --- synchronize{ ... } -> object
  # 
  # self のロックを取得し、ブロックを実行します。実行後に必ずロックを解放します。
  # 
  # ブロックで最後に評価した値を返します。
  def mu_synchronize; end

  # --- mu_try_lock -> bool
  # --- try_lock -> bool
  # self をロックしようとして、成功した場合、真を返し、ロックを得ます。
  # 
  # ロックできなかった場合にはブロックせず偽を返します。
  def mu_try_lock; end

  # --- mu_unlock -> ()
  # --- unlock -> ()
  # ロックを解放します。ロック待ちになっていたスレッドの実行は再開されます。
  # 
  # @raise ThreadError ロックされていない場合に unlock を呼ぶと発生します
  def mu_unlock; end

  # --- append_features(klass) -> Class | nil
  # 
  # ユーザが直接、使うことはありません。
  # 
  # @see [[m:Module#append_features]]
  def append_features; end

  # --- define_aliases(klass) -> Class
  # 
  # ユーザが直接、使うことはありません。
  def define_aliases; end

  # --- extend_object(module) -> Module
  # 
  # ユーザが直接、使うことはありません。
  # 
  # @see [[m:Module#extend_object]]
  def extend_object; end

end
