class DRb::TimerIdConv
  # --- to_id(obj) -> Integer
  # 
  # オブジェクトを識別子に変換します。
  def to_id; end

  # --- to_obj(ref) -> Object
  # 
  # 識別子をオブジェクトに変換します。
  def to_obj; end

  # --- new(timeout=600) -> DRb::TimerIdConv
  # TimerIdConv のインスタンスを生成して返します。
  # 
  # @param timeout to_id で識別子に変換してからオブジェクトがGCされないことが保証される秒数
  def new; end

end
