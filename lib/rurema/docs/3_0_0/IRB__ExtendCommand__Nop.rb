class IRB::ExtendCommand::Nop
  # --- execute(*opts) -> ()
  # 
  # 何もしません。サブクラスでオーバーライドして使用します。
  # 
  # @param opts irb 中でコマンドに渡す引数を指定します。
  def execute; end

  # --- irb_context -> IRB::Context
  # 
  # irb の現在の設定([[c:IRB::Context]])を返します。
  def irb_context; end

  # --- execute(conf, *opts) -> ()
  # 
  # コマンドを実行します。ユーザが直接使用するものではありません。
  # 
  # @param conf [[c:IRB::Context]] オブジェクトを指定します。
  # 
  # @param opts irb 中でコマンドに渡す引数を指定します。
  def execute; end

  # --- new(conf) -> IRB::ExtendCommand::Nop
  # 
  # 自身を初期化します。ユーザが直接使用するものではありません。
  # 
  # @param conf [[c:IRB::Context]] オブジェクトを指定します。
  def new; end

end
