class Gem::StreamUI::SilentProgressReporter
  # --- count -> nil
  # 
  # 何もしません。
  def count; end

  # --- done -> nil
  # 
  # 何もしません。
  def done; end

  # --- updated(message) -> nil
  # 
  # 何もしません。
  # 
  # @param message 指定しても意味がありません。
  def updated; end

  # --- new(out_stream, size, initial_message, terminal_message = nil)
  # 
  # 何もしません。
  # 
  # @param out_stream 指定しても意味がありません。
  # 
  # @param size 指定しても意味がありません。
  # 
  # @param initial_message 指定しても意味がありません。
  # 
  # @param terminal_message 指定しても意味がありません。
  def new; end

end
