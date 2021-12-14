module Warning
  # --- warn(message, category: nil) -> nil
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

  # --- [](category) -> bool
  # 
  # 
  # category の種類の警告を表示するかどうかのフラグを返します。
  # 
  # @param category 警告の種類を指定します。
  # 
  # サポートされている category は以下の通りです。
  # 
  # : :deprecated
  #   非推奨の警告。
  #   例: nil ではない値を [[m:$,]] や [[m:$;]] に設定する、キーワード引数、ブロックなしで proc / lambda を呼び出す、等
  # 
  # : :experimental
  #   実験的な機能。
  # 
  #     例: パターンマッチング
  def []; end

  # --- []=(category, flag) -> flag
  # 
  # category の警告を表示するかどうかのフラグを設定します。
  # サポートされている category については [[m:Warning.[] ]] を参照してください。
  # 
  # @param category 警告の種類を指定します。
  # @param flag 真、または偽を指定します。
  # 
  # @see [[m:Warning.[] ]]
  def []=; end

  # --- warn(message, category: nil) -> nil
  # 
  # 引数 message を標準エラー出力 [[m:$stderr]] に出力します。
  # 
  # 本メソッドはRubyが出力する全ての警告に対して呼び出されます。
  # そのため本メソッドをオーバーライドすることで Ruby から出力される警告の動作を変更できます。
  # またオーバーライドしたメソッドからは super を呼び出すことで、デフォルトの動作である [[m:$stderr]] への出力ができます。
  # 
  # //emlist[][ruby]{
  # module Warning
  #   # 警告メッセージに category を表示し、message 末尾に !!! を追加する
  #   def self.warn(message, category: nil)
  #     super("#{category} warning : #{message.chomp}!!!\n")
  #   end
  # end
  # 
  # warn("hoge", category: :deprecated)
  # # => deprecated warning : hoge!!!
  # //}
  # 
  # @param message 出力するオブジェクトを指定します。
  # 
  # @param category 警告のカテゴリを指定します。サポートされている category については [[m:Warning.[] ]] を参照してください。
  # 
  # @see [[m:Kernel.#warn]], [[m:Warning#warn]]
  def warn; end

end
