class Gem::StreamUI::VerboseProgressReporter
  # --- count -> Integer
  # 
  # [[m:Gem::StreamUI::VerboseProgressReporter#updated]] が呼び出された回数を返します。
  def count; end

  # --- done -> nil
  # 
  # 終了メッセージを表示します。
  def done; end

  # --- updated(message) -> nil
  # 
  # 現在の [[m:Gem::StreamUI::VerboseProgressReporter#count]] と全体の数とメッセージを表示します。
  # 
  # @param message 表示するメッセージを指定します。
  def updated; end

  # --- new(out_stream, size, initial_message, terminal_message = nil)
  # 
  # このクラスを初期化します。
  # 
  # @param out_stream 出力ストリームを指定します。
  # 
  # @param size 処理する全体の数を指定します。
  # 
  # @param initial_message 初期化がおわったときに表示するメッセージを指定します。
  # 
  # @param terminal_message 終了時に表示するメッセージです。
  def new; end

end
