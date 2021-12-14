class IRB::Context
  # --- __inspect__ -> String
  # 
  # 自身を文字列表現にしたオブジェクトを返します。
  def __inspect__; end

  # --- __to_s__ -> String
  # 
  # 自身を文字列表現にしたオブジェクトを返します。
  def __to_s__; end

  # --- ap_name -> String
  # 
  # 自身のアプリケーション名を返します。
  # 
  # デフォルト値は "irb" です。
  # 
  # @see [[m:IRB::Context#ap_name=]]
  def ap_name; end

  # --- ap_name=(val)
  # 
  # 自身のアプリケーション名を val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:AP_NAME] を設定する事でも同様の操作が行え
  # ます。
  # 
  # @param val アプリケーション名を [[c:String]] で指定します。
  # 
  # @see [[m:IRB::Context#ap_name]]
  def ap_name=; end

  # --- auto_indent_mode -> bool
  # 
  # 入力が次の行に継続した時に自動で字下げを行うかどうかを返します。
  # 
  # デフォルト値は false です。
  # 
  # @return 自動で字下げを行う場合は true を返します。行わない場合は false
  #         を返します。
  # 
  # @see [[m:IRB::Context#auto_indent_mode=]]
  def auto_indent_mode; end

  # --- auto_indent_mode=(val)
  # 
  # 入力が次の行に継続した時に自動で字下げを行うかどうかを val に設定します。
  # 
  # @param val true を指定した場合、自動で字下げを行います。false を指定し
  #            た場合は自動で字下げを行いません。
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  # 
  # @see [[m:IRB::Context#auto_indent_mode]]
  def auto_indent_mode=; end

  # --- back_trace_limit -> Integer
  # 
  # エラー発生時のバックトレース表示の先頭、末尾の上限の行数を返します。
  # 
  # デフォルト値は 16 です。
  # 
  # @see [[m:IRB::Context#back_trace_limit=]]
  def back_trace_limit; end

  # --- back_trace_limit=(val)
  # 
  # エラー発生時のバックトレース表示の先頭、末尾の上限の行数をそれぞれ val
  # 行に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:BACK_TRACE_LIMIT] を設定する事でも同様の
  # 操作が行えます。
  # 
  # @param val バックトレース表示の先頭、末尾の上限を [[c:Integer]] で指定
  #            します。
  # 
  # @see [[m:IRB::Context#back_trace_limit]]
  def back_trace_limit=; end

  # --- debug? -> bool
  # 
  # irb がデバッグモード([[m:IRB::Context#debug_level]] が 1 以上)で動作し
  # ているかどうかを返します。
  # 
  # デフォルト値は false です。
  # 
  # @see [[m:IRB::Context#debug_level]], [[m:IRB::Context#debug_level=]]
  def debug?; end

  # --- debug_level -> Integer
  # 
  # irb のデバッグレベルを返します。
  # 
  # デフォルト値は 0 です。
  # 
  # @see [[m:IRB::Context#debug_level=]], [[m:IRB::Context#debug?]]
  def debug_level; end

  # --- debug_level=(val)
  # 
  # irb のデバッグレベルを val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:DEBUG_LEVEL] を設定する事でも同様の操作
  # が行えます。
  # 
  # @see [[m:IRB::Context#debug_level]], [[m:IRB::Context#debug?]]
  def debug_level=; end

  # --- echo  -> bool
  # --- echo? -> bool
  # 
  # irb のプロンプトでの評価結果を表示するかどうかを返します。
  # 
  # デフォルト値は false です。
  # 
  # @see [[m:IRB::Context#echo=]]
  def echo; end

  # --- echo=(val)
  # 
  # irb のプロンプトでの評価結果を表示するかどうかを設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:ECHO] を設定する事でも同様の操作が行えま
  # す。
  # 
  # @param val true を指定した場合、irb のプロンプトでの評価結果を表示しま
  #            す。false を指定した場合は表示しません。
  # 
  # @see [[m:IRB::Context#echo]]
  def echo=; end

  # --- eval_history -> Integer | nil
  # 
  # 実行結果の履歴の最大保存件数を [[c:Integer]] か nil で返します。
  # 
  # @return 履歴の最大保存件数を [[c:Integer]] か nil で返します。0 を返し
  #         た場合は無制限に保存します。nil を返した場合は追加の保存は行いません。
  # 
  # @see [[m:IRB::Context#eval_history=]]
  def eval_history; end

  # --- eval_history=(val)
  # 
  # 実行結果の履歴の最大保存件数を val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:EVAL_HISTORY] を設定する事でも同様の事が
  # 行えます。
  # 
  # @param val 実行結果の履歴の最大保存件数を [[c:Integer]] か nil で指定し
  #            ます。0 を指定した場合は無制限に履歴を保存します。現在の値よ
  #            りも小さい値を指定した場合は履歴がその件数に縮小されます。
  #            nil を指定した場合は履歴の追加がこれ以上行われなくなります。
  # 
  # @see [[m:IRB::Context#eval_history]]
  def eval_history=; end

  # --- evaluate(line, line_no) -> object
  # 
  # ライブラリ内部で使用します。
  def evaluate; end

  # --- exit(ret = 0) -> object
  # 
  # irb を終了します。ret で指定したオブジェクトを返します。
  # 
  # @param ret 戻り値を指定します。
  # 
  # @see [[m:IRB.irb_exit]]
  def exit; end

  # --- file_input? -> bool
  # 
  # ライブラリ内部で使用します。
  def file_input?; end

  # --- history_file -> String | nil
  # 
  # 履歴ファイルのパスを返します。
  # 
  # @return 履歴ファイルのパスを [[c:String]] か nil で返します。nil を返し
  #         た場合は、~/.irb_history に履歴が保存されます。
  # 
  # @see [[ref:lib:irb#history]]
  def history_file; end

  # --- history_file=(hist)
  # 
  # 履歴ファイルのパスを val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:HISTORY_FILE] を設定する事でも同様の事が
  # 行えます。
  # 
  # @param hist 履歴ファイルのパスを文字列で指定します。
  # 
  # @see [[ref:lib:irb#history]]
  def history_file=; end

  # --- ignore_eof  -> bool
  # --- ignore_eof? -> bool
  # 
  # Ctrl-D(EOF) が入力された時に irb を終了するかどうかを返します。
  # 
  # true の時は Ctrl-D を無視します。false の時は irb を終了します。
  # 
  # デフォルト値は false です。
  # 
  # @see [[m:IRB::Context#ignore_eof=]]
  def ignore_eof; end

  # --- ignore_eof=(val)
  # 
  # Ctrl-D(EOF) が入力された時に irb を終了するかどうかを val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:IGNORE_EOF] を設定する事でも同様の操作が
  # 行えます。
  # 
  # @param val true を指定した場合、 Ctrl-D を無視します。false を指定した
  #            場合は Ctrl-D の入力時に irb を終了します。
  # 
  # @see [[m:IRB::Context#ignore_eof]]
  def ignore_eof=; end

  # --- ignore_sigint  -> bool
  # --- ignore_sigint? -> bool
  # 
  # Ctrl-C が入力された時に irb を終了するかどうかを返します。
  # 
  # false の時は irb を終了します。true の時は以下のように動作します。
  # 
  # : 入力中
  #     これまで入力したものをキャンセルしトップレベルに戻る.
  # : 実行中
  #     実行を中止する.
  # 
  # デフォルト値は true です。
  # 
  # @see [[m:IRB::Context#ignore_sigint=]]
  def ignore_sigint; end

  # --- ignore_sigint=(val)
  # 
  # Ctrl-C が入力された時に irb を終了するかどうかを val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:IGNORE_SIGINT] を設定する事でも同様の操作
  # が行えます。
  # 
  # @param val false を指定した場合、Ctrl-C の入力時に irb を終了します。
  #            true を指定した場合、Ctrl-C の入力時に以下のように動作します。
  # 
  # : 入力中
  #     これまで入力したものをキャンセルしトップレベルに戻る.
  # : 実行中
  #     実行を中止する.
  # 
  # @see [[m:IRB::Context#ignore_sigint]]
  def ignore_sigint=; end

  # --- init_save_history -> ()
  # 
  # 自身の持つ [[c:IRB::InputMethod]] オブジェクトが irb のヒストリを扱える
  # ようにします。
  # 
  # @see [[m:IRB::HistorySavingAbility.extended]]
  def init_save_history; end

  # --- inspect -> String
  # --- to_s -> String
  # 
  # 自身を人間に読みやすい文字列にして返します。
  def inspect; end

  # --- inspect? -> bool
  # 
  # [[c:IRB::Context#inspect_mode]] が有効かどうかを返します。
  # 
  # @return 出力結果に to_s したものを表示する場合は false を返します。それ
  #         以外の場合は true を返します。
  # 
  # @see [[c:IRB::Context#inspect_mode]], [[c:IRB::Context#inspect_mode=]]
  def inspect?; end

  # --- inspect_mode -> object | nil
  # 
  # 実行結果の出力方式を返します。
  # 
  # @see [[m:IRB::Context#inspect_mode=]]
  def inspect_mode; end

  # --- inspect_mode=(opt)
  # 
  # 実行結果の出力方式を opt に設定します。
  # 
  # @param opt 以下のいずれかを指定します。
  # : false, :to_s, :raw
  #   出力結果を to_s したものを表示します。
  # : true, :p, :inspect
  #   出力結果を inspect したものを表示します。
  # : :pp, :pretty_inspect
  #   出力結果を pretty_inspect したものを表示します。
  # : :yaml, :YAML
  #   出力結果を YAML 形式にしたものを表示します。
  # : :marshal, :Marshal, :MARSHAL, [[c:Marshal]]
  #   出力結果を [[m:Marshal.#dump]] したものを表示します。
  # 
  # @see [[ref:lib:irb#inspect_mode]]
  def inspect_mode=; end

  # --- io -> IRB::InputMethod
  # 
  # ライブラリ内部で使用します。
  def io; end

  # --- io=(val)
  # 
  # ライブラリ内部で使用します。
  def io=; end

  # --- irb -> IRB::Irb
  # 
  # ライブラリ内部で使用します。
  def irb; end

  # --- irb=(val)
  # 
  # ライブラリ内部で使用します。
  def irb=; end

  # --- irb_name -> String
  # 
  # 起動しているコマンド名を文字列で返します。
  # 
  # 
  # @see [[m:IRB::Context#irb_name=]]
  def irb_name; end

  # --- irb_name=(val)
  # 
  # 起動しているコマンド名を val に設定します。
  # 
  # @param val コマンド名を [[c:String]] で指定します。
  # 
  # @see [[m:IRB::Context#irb_name]]
  def irb_name=; end

  # --- irb_path -> String
  # 
  # ライブラリ内部で使用します。
  def irb_path; end

  # --- irb_path=(val)
  # 
  # ライブラリ内部で使用します。
  def irb_path=; end

  # --- last_value -> object
  # 
  # irb 中での最後の実行結果を返します。
  def last_value; end

  # --- load_modules -> [String]
  # 
  # irb の起動時に -r オプション指定で読み込まれたライブラリ、~/.irbrc など
  # の設定ファイル内で IRB.conf[:LOAD_MODULES] 指定で読み込まれたライブラリ
  # の名前の配列を返します。
  def load_modules; end

  # --- main -> object
  # 
  # self に設定されたオブジェクトを返します。
  # 
  # @see cwws コマンド
  def main; end

  # --- prompt_c -> String
  # 
  # 式が継続している時のプロンプトを表現するフォーマット文字列を返します。
  # 
  # @see [[m:IRB::Context#prompt_c=]], [[ref:lib:irb#customize_prompt]]
  def prompt_c; end

  # --- prompt_c=(val)
  # 
  # 式が継続している時のプロンプトを表現するフォーマット文字列を val に設定
  # します。
  # 
  # @param val フォーマットを文字列で指定します。指定できる内容については、
  #            [[ref:lib:irb#customize_prompt]] を参照してください。
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  # 
  # @see [[m:IRB::Context#prompt_mode]], [[m:IRB::Context#prompt_mode=]],
  #      [[m:IRB::Context#prompt_c]], [[ref:lib:irb#customize_prompt]]
  def prompt_c=; end

  # --- prompt_i -> String
  # 
  # 通常のプロンプトを表現するフォーマット文字列を返します。
  # 
  # @see [[m:IRB::Context#prompt_i=]],[[ref:lib:irb#customize_prompt]]
  def prompt_i; end

  # --- prompt_i=(val)
  # 
  # 通常のプロンプトを表現するフォーマット文字列を val に設定します。
  # 
  # @param val フォーマットを文字列で指定します。指定できる内容については、
  #            [[ref:lib:irb#customize_prompt]] を参照してください。
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  # 
  # @see [[m:IRB::Context#prompt_mode]], [[m:IRB::Context#prompt_mode=]],
  #      [[m:IRB::Context#prompt_i]], [[ref:lib:irb#customize_prompt]]
  def prompt_i=; end

  # --- prompt_mode -> Symbol
  # 
  # 現在のプロンプトモードを [[c:Symbol]] で返します。
  # 
  # オリジナルのプロンプトモードを定義していた場合はそのモードを返します。
  # そうでない場合は、:DEFAULT、:CLASSIC、:SIMPLE、:INF_RUBY、:XMP、:NULL
  # のいずれかを返します。
  # 
  # 定義済みのプロンプトモードの内容については、IRB.conf[:PROMPT][mode] を
  # 参照してください。
  # 
  # @see [[m:IRB::Context#prompt_mode=]], [[ref:lib:irb#customize_prompt]]
  def prompt_mode; end

  # --- prompt_mode=(mode)
  # 
  # プロンプトモードを mode に設定します。
  # 
  # @param mode プロンプトモードを [[c:Symbol]] で指定します。オリジナルの
  #             プロンプトモードか、:DEFAULT、:CLASSIC、:SIMPLE、:INF_RUBY、
  #             :XMP、:NULL のいずれを指定してください。
  # 
  # @see [[m:IRB::Context#prompt_mode]], [[ref:lib:irb#customize_prompt]]
  def prompt_mode=; end

  # --- prompt_n -> String
  # 
  # 継続行のプロンプトを表現するフォーマット文字列を返します。
  # 
  # @see [[m:IRB::Context#prompt_n=]], [[ref:lib:irb#customize_prompt]]
  def prompt_n; end

  # --- prompt_n=(val)
  # 
  # 継続行のプロンプトを表現するフォーマット文字列を val に設定します。
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  # 
  # @see [[m:IRB::Context#prompt_mode]], [[m:IRB::Context#prompt_mode=]],
  #      [[m:IRB::Context#prompt_n]], [[ref:lib:irb#customize_prompt]]
  def prompt_n=; end

  # --- prompt_s -> String
  # 
  # 文字列中のプロンプトを表現するフォーマット文字列を返します。
  # 
  # @see [[m:IRB::Context#prompt_s=]], [[ref:lib:irb#customize_prompt]]
  def prompt_s; end

  # --- prompt_s=(val)
  # 
  # 文字列中のプロンプトを表現するフォーマット文字列を val に設定します。
  # 
  # @param val フォーマットを文字列で指定します。指定できる内容については、
  #            [[ref:lib:irb#customize_prompt]] を参照してください。
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  # 
  # @see [[m:IRB::Context#prompt_mode]], [[m:IRB::Context#prompt_mode=]],
  #      [[m:IRB::Context#prompt_s]], [[ref:lib:irb#customize_prompt]]
  def prompt_s=; end

  # --- prompting? -> bool
  # 
  # ライブラリ内部で使用します。
  def prompting?; end

  # --- rc  -> bool
  # --- rc? -> bool
  # 
  # ~/.irbrc などの設定ファイルがあれば読み込みを行うかどうかを返します。
  # 
  # @return 設定ファイルの読み込みを行う場合は true を返します。行わない場
  #         合(irb の起動時に -f オプションを指定した場合)は false を返しま
  #         す。
  def rc; end

  # --- return_format -> String
  # 
  # irb のプロンプトでの評価結果を表示する際のフォーマットを文字列で返します。
  # 
  # @see [[m:IRB::Context#return_format=]], [[d:print_format]]
  def return_format; end

  # --- return_format=(val)
  # 
  # irb のプロンプトでの評価結果を表示する際のフォーマットに val を設定します。
  # 
  # @see [[m:IRB::Context#return_format]], [[d:print_format]]
  # 
  # [[m:IRB::Context#prompt_mode]] の変更に影響を受ける事に注意してください。
  def return_format=; end

  # --- save_history -> Integer | nil
  # 
  # 履歴の最大保存件数を [[c:Integer]] か nil で返します。
  # 
  # @return 履歴の最大保存件数を [[c:Integer]] か nil で返します。0 以下や
  #         nil を返した場合は追加の保存は行いません。
  # 
  # @see [[ref:lib:irb#history]]
  def save_history; end

  # --- save_history=(val)
  # 
  # 履歴の最大保存件数を val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:SAVE_HISTORY] を設定する事でも同様の事が
  # 行えます。
  # 
  # @param val 履歴の最大保存件数を [[c:Integer]] で指定します。0 以下や
  #            nil を返した場合は追加の保存は行いません。現在の件数より小さ
  #            い値を設定した場合は、最新の履歴から指定した件数分のみが保存
  #            されます。
  # 
  # @see [[ref:lib:irb#history]]
  def save_history=; end

  # --- set_last_value(value) -> object
  # 
  # ライブラリ内部で使用します。
  def set_last_value; end

  # --- thread -> Thread
  # 
  # 現在のスレッドを返します。
  # 
  # @see [[m:Thread.current]]
  def thread; end

  # --- use_loader  -> bool
  # --- use_loader? -> bool
  # 
  # load または require 時に irb のファイル読み込み機能(irb_load、
  # irb_require)を使うかどうかを返します。
  # 
  # 
  # @see [[m:IRB::Context#use_loader=]]
  def use_loader; end

  # --- use_loader=(opt)
  # 
  # load または require 時に irb のファイル読み込み機能(irb_load、
  # irb_require)を使うかどうかを設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:USE_LOADER] を設定する事でも同様の事が行
  # えます。
  # 
  # 
  # デフォルト値は false です。
  # 
  # @see [[m:IRB::Context#use_loader?]]
  def use_loader=; end

  # --- use_readline  -> bool | nil
  # --- use_readline? -> bool | nil
  # 
  # [[lib:readline]] を使うかどうかを返します。
  # 
  # @return 戻り値よって以下のように動作します。
  # 
  # : true
  #     readline ライブラリを使う
  # : false
  #     readline ライブラリを使わない
  # : nil
  #     inf-ruby-mode 以外で readline ライブラリを利用しようとする (デフォルト)
  # 
  # 動作を変更するためには .irbrc ファイル中で IRB.conf[:USE_READLINE] の設
  # 定や irb 起動時に --readline オプション、--noreadline オプションの指定
  # を行います。
  def use_readline; end

  # --- use_tracer  -> bool
  # --- use_tracer? -> bool
  # 
  # irb への入力を評価する時に [[lib:tracer]] が有効かどうかを返します。
  # 
  # @see [[lib:tracer]], [[m:IRB::Context#use_tracer=]]
  def use_tracer; end

  # --- use_tracer=(val)
  # 
  # irb への入力を評価する時に [[lib:tracer]] が有効にするかどうかを val で
  # 指定します。
  # 
  # .irbrc ファイル中で IRB.conf[:USE_TRACER] を設定する事でも同様の事が行
  # えます。
  # 
  # @param val [[lib:tracer]] を有効にする場合に true を指定します。
  # 
  # @see [[lib:tracer]], [[m:IRB::Context#use_tracer]]
  def use_tracer=; end

  # --- verbose -> bool | nil
  # 
  # 標準出力に詳細なメッセージを出力するように設定されているかどうかを返し
  # ます。
  # 
  # [[m:IRB::Context#verbose?]] とは別のメソッドである事に注意してください。
  # 
  # @return 詳細なメッセージを出力するように設定されている場合は true を返
  #         します。そうでない場合は false か nil を返します。
  # 
  # @see [[m:IRB::Context#verbose?]], [[m:IRB::Context#verbose=]]
  def verbose; end

  # --- verbose=(val)
  # 
  # 標準出力に詳細なメッセージを出力するかどうかを val に設定します。
  # 
  # .irbrc ファイル中で IRB.conf[:VERBOSE] を設定する事でも同様の操作が行え
  # ます。
  # 
  # false や nil を指定した場合でも、[[m:IRB::Context#verbose?]] が true を
  # 返す場合は詳細なメッセージを出力する事に注意してください。
  # 
  # @param val true を指定した場合、詳細なメッセージを出力します。false や
  #            nil を指定した場合、詳細なメッセージを出力しません。
  # 
  # @see [[m:IRB::Context#verbose]], [[m:IRB::Context#verbose?]]
  def verbose=; end

  # --- verbose? -> bool | nil
  # 
  # 標準出力に詳細なメッセージを出力するかどうかを返します。
  # 
  # @return 詳細なメッセージを出力する場合は true を返します。そうでない場
  #         合は false か nil を返します。
  # 
  # 設定を行っていた場合([[m:IRB::Context#verbose]] が true か false を返す
  # 場合)は設定した通りに動作します。設定を行っていない場合は、ファイルを指
  # 定して irb を実行した場合などに true を返します。
  # 
  # 
  # @see [[m:IRB::Context#verbose]], [[m:IRB::Context#verbose=]]
  def verbose?; end

  # --- workspace -> IRB::WorkSpace
  # 
  # ライブラリ内部で使用します。
  def workspace; end

  # --- workspace=(val)
  # 
  # ライブラリ内部で使用します。
  def workspace=; end

  # --- new(irb, workspace = nil, input_method = nil, output_method = nil) -> IRB::Context
  # 
  # 自身を初期化します。
  # 
  # @param irb [[c:IRB::Irb]] オブジェクトを指定します。
  # 
  # @param workspace [[c:IRB::WorkSpace]] オブジェクトを指定します。省略し
  #                  た場合は新しく作成されます。
  # 
  # @param input_method [[c:String]]、[[c:IRB::InputMethod]] のサブクラスの
  #                     オブジェクト、nil のいずれかを指定します。
  # 
  # @param output_method [[c:IRB::OutputMethod]] のサブクラスのオブジェクト
  #                      を指定します。省略した場合は
  #                      [[c:IRB::StdioOutputMethod]] オブジェクトが新しく
  #                      作成されます。
  def new; end

  # --- IDNAME_IVARS -> [String]
  # 
  # ライブラリ内部で使用します。
  def IDNAME_IVARS; end

  # --- NOPRINTING_IVARS -> [String]
  # 
  # ライブラリ内部で使用します。
  def NOPRINTING_IVARS; end

  # --- NO_INSPECTING_IVARS -> [String]
  # 
  # ライブラリ内部で使用します。
  def NO_INSPECTING_IVARS; end

end
