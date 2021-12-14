module SingleForwardable
  # --- def_single_delegator(accessor, method, ali = method)    -> ()
  # --- def_delegator(accessor, method, ali = method)           -> ()
  # 
  # メソッドの委譲先を設定します。
  # 
  # @param accessor 委譲先のオブジェクト
  # 
  # @param method 委譲先のメソッド
  # 
  # @param ali 委譲元のメソッド
  # 
  # 委譲元のオブジェクトで ali が呼び出された場合に、
  # 委譲先のオブジェクトの method へ処理が委譲されるようになります。
  # 
  # 委譲元と委譲先のメソッド名が同じ場合は, ali を省略することが可能です。
  # 
  # def_delegator は def_singleton_delegator の別名になります。
  # 
  # @see [[m:SingleForwardable#def_delegators]]
  def def_delegator; end

  # --- def_single_delegators(accessor, *methods)    -> ()
  # --- def_delegators(accessor, *methods)           -> ()
  # 
  # メソッドの委譲先をまとめて設定します。
  # 
  # @param accessor 委譲先のオブジェクト
  # 
  # @param methods 委譲するメソッドのリスト
  # 
  # 委譲元のオブジェクトで methods のそれぞれのメソッドが呼び出された場合に、
  # 委譲先のオブジェクトの同名のメソッドへ処理が委譲されるようになります。
  # 
  # def_delegators は def_singleton_delegators の別名になります。
  # 
  # また、以下の 2 つの例は同じ意味です。
  # 
  #   def_delegators :@records, :size, :<<, :map
  # 
  #   def_delegator :@records, :size
  #   def_delegator :@records, :<<
  #   def_delegator :@records, :map
  # 
  # @see [[m:SingleForwardable#def_delegator]]
  def def_delegators; end

  # --- single_delegate(hash) -> ()
  # --- delegate(hash)        -> ()
  # 
  # メソッドの委譲先を設定します。
  # 
  # @param hash 委譲先のメソッドがキー、委譲先のオブジェクトが値の
  #             [[c:Hash]] を指定します。キーは [[c:Symbol]]、
  #             [[c:String]] かその配列で指定します。
  # 
  # @see [[m:Forwardable#delegate]]
  def delegate; end

end
