class Continuation
  # --- [](*ret)      -> ()
  # --- call(*ret)    -> ()
  # 
  # self が記憶した状態を継続します。引数は そのまま
  # [[m:Kernel.#callcc]] の戻り値になります。
  # 
  # @param ret 継続に復帰した時に返す値を指定します。
  def []; end

end
