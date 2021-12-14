module IRB::ExtendCommandBundle
  # --- install_alias_method(to, from, override = NO_OVERRIDE)
  # 
  # メソッドのエイリアスを定義します。ライブラリ内部で使用します。
  # 
  # @param to 新しいメソッド名を [[c:Symbol]] か文字列で指定します。
  # 
  # @param from 元のメソッド名を [[c:Symbol]] か文字列で指定します。
  # 
  # @param override 新しいメソッド名が定義済みであった場合にそのメソッドを
  #                 上書きするかどうかを
  #                 [[m:IRB::ExtendCommandBundle::NO_OVERRIDE]]、
  #                 [[m:IRB::ExtendCommandBundle::OVERRIDE_PRIVATE_ONLY]]、
  #                 [[m:IRB::ExtendCommandBundle::OVERRIDE_ALL]] のいずれか
  #                 で指定します。
  def install_alias_method; end

  # --- irb_context -> IRB::Context
  # 
  # 現在の irb に関する [[c:IRB::Context]] を返します。
  def irb_context; end

  # --- irb_exit(ret = 0) -> object
  # 
  # irb を終了します。ret で指定したオブジェクトを返します。
  # 
  # @param ret 戻り値を指定します。
  # 
  # ユーザが直接使用するものではありません。
  def irb_exit; end

  # --- irb_load(*opts, &b) -> nil
  # 
  # 現在の irb に関する [[c:IRB::Context]] に対して irb_load コマンドを実行
  # します。
  # 
  # @see [[m:IRB::ExtendCommand::Load#execute]]
  def irb_load; end

  # --- irb_require(*opts, &b) -> bool
  # 
  # 現在の irb に関する [[c:IRB::Context]] に対して irb_require コマンドを
  # 実行します。
  # 
  # @see [[m:IRB::ExtendCommand::Require#execute]]
  def irb_require; end

  # --- def_extend_command(cmd_name, cmd_class, load_file = nil, *aliases) -> object
  # 
  # irb に cmd_name で指定したメソッドが実行できるように拡張します。
  # 
  # @param cmd_name メソッド名を [[c:Symbol]] か文字列で指定します。
  #                 cmd_class で指定するクラスの execute メソッドとして定
  #                 義してある必要があります。
  # 
  # @param cmd_class 指定した拡張が定義されたクラス名を [[c:Symbol]]、
  #                  [[c:String]]、[[c:Class]] のいずれかで指定します。
  #                  なお、このクラスは [[c:IRB::ExtendCommand]] 以下で定義
  #                  する必要があります。
  # 
  # @param load_file 指定したメソッドが定義されたファイル名を指
  #                  定します。このファイルは自動的に require されます。
  # 
  # @param aliases cmd_name の別名を [[c:Symbol]] とフラグの配列で指定しま
  #                す。複数指定する事ができます。フラグは
  #                [[m:IRB::ExtendCommandBundle::NO_OVERRIDE]]、
  #                [[m:IRB::ExtendCommandBundle::OVERRIDE_PRIVATE_ONLY]]、
  #                [[m:IRB::ExtendCommandBundle::OVERRIDE_ALL]] のいずれか
  #                を指定します。
  def def_extend_command; end

  # --- extend_object(obj) -> IRB::ExtendCommandBundle
  # 
  # [[c:IRB::ExtendCommandBundle]] で定義済みの拡張に指定されたエイリアスを
  # obj に定義します。
  # 
  # @param obj [[c:IRB::ExtendCommandBundle]] を extend したオブジェクト
  def extend_object; end

  # --- install_extend_commands -> object
  # 
  # 定義済みの拡張を読み込みます。
  # 
  # irb で以下のメソッドが利用できるようになります。(それぞれ 1 つだけ抜粋)
  # 
  #  * irb_current_working_workspace
  #  * irb_change_workspace
  #  * irb_workspaces
  #  * irb_push_workspace
  #  * irb_pop_workspace
  #  * irb_load
  #  * irb_require
  #  * irb_source
  #  * irb
  #  * irb_jobs
  #  * irb_fg
  #  * irb_kill
  #  * irb_help
  # 
  # [[lib:irb/extend-command]] が require された時にライブラリ内部で自動的
  # に実行されます。
  # 
  # @see [[m:IRB::ExtendCommandBundle.install_extend_commands]]
  def install_extend_commands; end

  # --- irb_original_method_name(method_name) -> String
  # 
  # method_name で指定したメソッドの irb 中でのエイリアスを返します。ライブ
  # ラリ内部で使用します。
  # 
  # @param method_name メソッド名を [[c:Symbol]] か文字列で指定します。
  # 
  # @see [[m:IRB::ExtendCommandBundle#install_alias_method]]
  def irb_original_method_name; end

  # --- NO_OVERRIDE -> 0
  # 
  # irb でコマンドのエイリアスを定義する際に、既にこれからエイリアス先に指
  # 定したメソッド名と同名のメソッドが定義済みであった場合、エイリアスを定
  # 義しない事を指定するフラグです。
  # 
  # @see [[m:IRB::ExtendCommandBundle.def_extend_command]]
  def NO_OVERRIDE; end

  # --- OVERRIDE_ALL -> 1
  # 
  # irb でコマンドのエイリアスを定義する際に、既にこれからエイリアス先に指
  # 定したメソッド名と同名のメソッドが定義済みであった場合でも、常にエイリ
  # アスを定義する事を指定するフラグです。
  # 
  # @see [[m:IRB::ExtendCommandBundle.def_extend_command]]
  def OVERRIDE_ALL; end

  # --- OVERRIDE_PRIVATE_ONLY -> 2
  # 
  # irb でコマンドのエイリアスを定義する際に、既にこれからエイリアス先に指
  # 定したメソッド名と同名の public メソッドが定義済みではなかった場合のみ、
  # エイリアスを定義する事を指定するフラグです。
  # 
  # @see [[m:IRB::ExtendCommandBundle.def_extend_command]]
  def OVERRIDE_PRIVATE_ONLY; end

end
