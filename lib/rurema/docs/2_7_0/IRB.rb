module IRB
  # --- CurrentContext -> IRB::Context
  # 
  # 現在の irb に関する [[c:IRB::Context]] を返します。
  def CurrentContext; end

  # --- Inspector(inspect, init = nil) -> IRB::Inspector
  # 
  # [[c:IRB::Inspector]] オブジェクトを生成します。
  # 
  # @param inspect 実行結果の出力のための手続きオブジェクトを指定します。
  # 
  # @param init inspect_mode の初期化のための手続きオブジェクトを指定します。
  #             あらかじめ require が必要な場合などに、proc { require "foo" }
  #             といった指定を行います。
  def Inspector; end

  # --- conf -> Hash
  # 
  # irb の設定をハッシュで返します。
  def conf; end

  # --- irb_abort(irb, exception = Abort)
  # 
  # 実行中の処理を中断します。必ず例外が発生するため、何も返しません。
  # 
  # @param irb 現在の [[c:IRB::Irb]] オブジェクトを指定します。
  # 
  # @param exception 発生させる例外を指定します。指定しなかった場合は
  #                  [[c:IRB::Abort]] が発生します。
  # 
  # @raise exception 引数 exception で指定した例外が発生します。
  # 
  # ユーザが直接使用するものではありません。
  def irb_abort; end

  # --- irb_at_exit -> ()
  # 
  # at_exit で登録された処理を実行します。
  # 
  # ユーザが直接使用するものではありません。
  def irb_at_exit; end

  # --- irb_exit(irb, ret) -> object
  # 
  # irb を終了します。ret で指定したオブジェクトを返します。
  # 
  # @param irb 現在の [[c:IRB::Irb]] オブジェクトを指定します。
  # 
  # @param ret 戻り値を指定します。
  # 
  # ユーザが直接使用するものではありません。
  def irb_exit; end

  # --- print_usage -> ()
  # 
  # irb コマンドのヘルプを表示します。
  def print_usage; end

  # --- start(ap_path = nil) -> ()
  # 
  # [[c:IRB]] を初期化して、トップレベルの irb を開始します。
  # 
  # @param ap_path irb コマンドのパスを指定します。
  def start; end

  # --- version -> String
  # 
  # IRB のバージョンを文字列で返します。
  # 
  # ~/.irbrc などの設定ファイル内で IRB.conf[:VERSION] を設定していた場合は
  # 任意のバージョンを返すように設定できます。
  def version; end

  # --- STDIN_FILE_NAME -> "(line)"
  # 
  # 標準入力を使用する際のファイル名を文字列で返します。
  def STDIN_FILE_NAME; end

end
