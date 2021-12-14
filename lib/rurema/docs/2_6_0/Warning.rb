module Warning
  # --- warn(message) -> nil
  # 
  # 引数 message を標準エラー出力 [[m:$stderr]] に出力します。
  # 
  # [[m:Kernel.#warn]]の挙動を変更する際は、このメソッドではなくクラスメソッドである[[m:Warning.warn]]をオーバーライドする必要があります。
  # 
  # @param message 出力するオブジェクトを指定します。
  # 
  # @param category 警告のカテゴリを指定します。サポートされている category については [[m:Warning.[] ]] を参照してください。
  # 
  # 
  # @see [[m:Kernel.#warn]], [[m:Warning.warn]]
  def warn; end

  # --- warn(message) -> nil
  # 
  # 引数 message を標準エラー出力 [[m:$stderr]] に出力します。
  # 
  # 本メソッドはRubyが出力する全ての警告に対して呼び出されます。
  # そのため本メソッドをオーバーライドすることで Ruby から出力される警告の動作を変更できます。
  # またオーバーライドしたメソッドからは super を呼び出すことで、デフォルトの動作である [[m:$stderr]] への出力ができます。
  # 
  # //emlist[][ruby]{
  # warn "hoge" # => hoge
  # 
  # module Warning
  #   # 警告メッセージの末尾に !!! を追加する
  #   def self.warn(message)
  #     super(message.chomp + "!!!\n")
  #   end
  # end
  # 
  # warn "hoge" # => hoge!!!
  # //}
  # 
  # @param message 出力するオブジェクトを指定します。
  # 
  # @param category 警告のカテゴリを指定します。サポートされている category については [[m:Warning.[] ]] を参照してください。
  # 
  # @see [[m:Kernel.#warn]], [[m:Warning#warn]]
  def warn; end

end
