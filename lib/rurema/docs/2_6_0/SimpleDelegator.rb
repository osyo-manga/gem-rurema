class SimpleDelegator
  # --- __getobj__ -> object
  # 
  # 委譲先のオブジェクトを返します。
  # 
  # @see [[m:Delegator#__getobj__]]
  def __getobj__; end

  # --- __setobj__(obj) -> object
  # 
  # 委譲先のオブジェクトを obj に変更します。
  # 
  # メソッド委譲を行うためのクラスメソッドの再定義は行われないことに注意してください。
  # メソッド委譲を行うためのクラスメソッドの定義は生成時にのみ行われます。
  # そのため、以前の委譲先オブジェクトと
  # obj の間で呼び出せるメソッドに違いがあった場合は、
  # 何かしらの例外が発生する可能性があります。
  # 
  # @param obj 委譲先のオブジェクト
  # 
  # @return 変更後の委譲先オブジェクト
  def __setobj__; end

  # --- new(obj) -> object
  # 
  # メソッドを委譲するオブジェクトの設定と、
  # メソッド委譲を行うためのクラスメソッドの定義を行います。
  # 
  # @param obj 委譲先のオブジェクト
  # 
  # @see [[m:Delegator.new]]
  def new; end

end
