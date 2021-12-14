module Profiler__
  # --- print_profile(file) -> ()
  # 
  # stop_profile を実行し、プロファイルの結果を file に出力します。
  # file には printf メソッドが定義されていなければいけません。
  # 
  # @param file [[c:File]] のインスタンスを指定します。
  def print_profile; end

  # --- start_profile -> object
  # 
  # プロファイルの取得を開始します。
  def start_profile; end

  # --- stop_profile -> nil
  # 
  # プロファイルの取得を停止します。
  def stop_profile; end

  # --- PROFILE_PROC -> Proc
  # 
  # 内部で使用します。
  def PROFILE_PROC; end

end
