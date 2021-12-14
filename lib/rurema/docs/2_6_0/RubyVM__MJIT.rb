module RubyVM::MJIT
  # --- enabled? -> bool
  # 
  # JIT が有効かどうかを返します。
  # 
  # @see [[m:RubyVM::MJIT.pause]], [[m:RubyVM::MJIT.resume]]
  def enabled?; end

  # --- pause(wait: true) -> bool
  # 
  # MJIT を一時停止します。
  # 
  # @param wait 真のときは JIT キューが空になるまで待ちます。
  # @return 停止したときは true を、すでに停止していたときは false を返します。
  # @raise RuntimeError JIT が有効ではないときに発生します。
  # 
  # @see [[m:RubyVM::MJIT.enabled?]], [[m:RubyVM::MJIT.resume]]
  def pause; end

  # --- resume -> bool
  # 
  # [[m:RubyVM::MJIT.pause]] で一時停止した JIT を再開します。
  # 
  # @return 再開したときは true を、すでに動いているときは false を返します。
  # @raise RuntimeError JIT が有効ではないときに発生します。
  # @raise RuntimeError JIT の再開に失敗した時に発生します。
  # 
  # @see [[m:RubyVM::MJIT.enabled?]], [[m:RubyVM::MJIT.pause]]
  def resume; end

end
