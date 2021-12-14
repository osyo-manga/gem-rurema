module IRB::ContextExtender
  # --- def_extend_command(cmd_name, load_file, *aliases) -> object
  # 
  # [[c:IRB::Context]] に cmd_name で指定したメソッドが実行できるように拡張
  # します。
  # 
  # @param cmd_name メソッド名を [[c:Symbol]] で指定します。
  #                 [[c:IRB::Context]] クラスのインスタンスメソッドとして定
  #                 義してある必要があります。
  # 
  # @param load_file cmd_name で指定したメソッドが定義されたファイル名を指
  #                  定します。このファイルは自動的に require されます。
  # 
  # @param aliases cmd_name の別名を [[c:Symbol]] で指定します。複数指定する事ができます。
  def def_extend_command; end

  # --- install_extend_commands -> object
  # 
  # 定義済みの拡張を読み込みます。
  # 
  # [[c:IRB::Context]] で以下のメソッドが利用できるようになります。
  # 
  #  * eval_history=
  #  * use_tracer=
  #  * math_mode=
  #  * use_loader=
  #  * save_history=
  # 
  # [[lib:irb/extend-command]] が require された時にライブラリ内部で自動的
  # に実行されます。
  # 
  # @see [[m:IRB::ContextExtender.def_extend_command]]
  def install_extend_commands; end

end
