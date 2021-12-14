module Singleton
  # --- clone
  # 
  # @raise TypeError このメソッドを呼び出した場合に発生します。
  def clone; end

  # --- dup
  # 
  # @raise TypeError このメソッドを呼び出した場合に発生します。
  def dup; end

  # --- instance -> object
  # 
  # そのクラスの唯一のインスタンスを返します。
  # 最初に呼ばれたときはそのインスタンスを生成します。
  # 
  # Singleton を include したクラスで定義されますので、
  # 正確には Singleton モジュールのメソッドではありません。
  def instance; end

end
