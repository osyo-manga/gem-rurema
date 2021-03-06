class SystemExit
  # --- status -> Integer
  # 
  # 例外オブジェクトに保存された終了ステータスを返します。
  # 
  # 終了ステータスは [[m:Kernel.#exit]] や [[m:SystemExit.new]] などで設定されます。
  # 
  # 例:
  # 
  #   begin
  #     exit 1
  #   rescue SystemExit => err
  #     p err.status   # => 1
  #   end
  # 
  #   begin
  #     raise SystemExit.new(1, "dummy exit")
  #   rescue SystemExit => err
  #     p err.status   # => 1
  #   end
  def status; end

  # --- success? -> bool
  # 
  # 終了ステータスが正常終了を示す値ならば true を返します。
  # 
  # 大半のシステムでは、ステータス 0 が正常終了を表します。
  # 
  # 例:
  # 
  #   begin
  #     exit true
  #   rescue SystemExit => err
  #     p err.success?  # => true
  #   end
  # 
  #   begin
  #     exit false
  #   rescue SystemExit => err
  #     p err.success?  # => false
  #   end
  def success?; end

  # --- new(status = 0, error_message = "") -> SystemExit
  # 
  # SystemExit オブジェクトを生成して返します。
  # 
  # @param status 終了ステータスを整数で指定します。
  # 
  # @param error_message エラーメッセージを文字列で指定します。
  # 
  # 例:
  # 
  #   ex = SystemExit.new(1)
  #   p ex.status   # => 1
  def new; end

end
