class RDoc::Options
  # --- all_one_file -> bool
  # 
  # コマンドライン引数の --one-file を指定していた場合、もしくは --fmt オプ
  # ションに xml 指定した場合に true を返します。そうでない場合は false を
  # 返します。
  def all_one_file; end

  # --- charset -> String
  # 
  # コマンドライン引数の --charset オプションで指定した文字コードを文字列で
  # 返します。
  # 
  # 指定しなかった場合は、[[m:$KCODE]] に応じた値になります。
  def charset; end

  # --- coverage_report -> Integer | false
  # 
  # コマンドライン引数の --coverage-report オプションを指定していた場合、指
  # 定した数値を返します。
  # 
  # 指定しなかった場合は false を返します。
  def coverage_report; end

  # --- coverage_report=(val)
  # 
  # コマンドライン引数の --coverage-report オプションと同様の指定を行います。
  # 
  # @param val 数値オブジェクトか false を指定します。
  def coverage_report=; end

  # --- css -> String
  # 
  # コマンドライン引数の --style オプションで指定した URL を文字列で返しま
  # す。
  def css; end

  # --- diagram -> bool
  # 
  # コマンドライン引数の --diagram オプションを指定していた場合、true を返
  # します。そうでない場合は false を返します。
  def diagram; end

  # --- dry_run -> bool
  # 
  # コマンドライン引数の --dry-run オプションを指定していた場合、true を返
  # します。--no-dry-run オプションを指定していた場合、false を返します。
  # 
  # どちらも指定しなかった場合は false を返します。
  def dry_run; end

  # --- dry_run=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --dry-run オプションと
  # 同様の指定を行います。
  # 
  # @param val --dry-run オプションと同じ指定を行う場合は true、そうでない
  #            場合は false を指定します。
  def dry_run=; end

  # --- encoding -> Encoding
  # 
  # コマンドライン引数の --encoding オプションを指定していた場合、指定した
  # エンコーディングに対応する [[c:Encoding]] オブジェクトを返します。
  # 
  # 指定しなかった場合は [[m:Encoding.default_external]] の値を返します。
  def encoding; end

  # --- encoding=(val)
  # 
  # コマンドライン引数の --encoding オプションと同様の指定を行います。
  # 
  # @param val 設定する [[c:Encoding]] オブジェクトを指定します。
  def encoding=; end

  # --- exclude -> Regexp
  # 
  # コマンドライン引数の --exclude オプションで指定した正規表現を返します。
  # 複数指定していた場合は、1 つの [[c:Regexp]] オブジェクトにまとめられた
  # ものを返します。
  def exclude; end

  # --- exclude=(val)
  # 
  # コマンドライン引数の --exclude オプションと同様の指定を行います。
  # 
  # @param val 設定するパターンを [[c:Regexp]] オブジェクトで指定します。
  def exclude=; end

  # --- extra_accessor_flags -> {String => String}
  # 
  # コマンドライン引数の --accessor オプションで指定したアクセサがキー、ア
  # クセサの種類が値のハッシュを返します。
  # 
  # 値は r、w、rw のいずれかです。それぞれ attr_reader、attr_writer、
  # attr_accessor に対応します。
  def extra_accessor_flags; end

  # --- extra_accessors -> Regexp | nil
  # 
  # コマンドライン引数の --accessor オプションで指定したアクセサの名前すべ
  # てにマッチする正規表現オブジェクトを返します。
  # 
  # 指定しなかった場合は nil を返します。
  def extra_accessors; end

  # --- fileboxes -> bool
  # 
  # コマンドライン引数の --diagram オプション、--fileboxes オプションを指定
  # していた場合、true を返します。そうでない場合は false を返します。
  def fileboxes; end

  # --- files -> [String]
  # 
  # 解析するファイルの一覧を文字列の配列で返します。
  def files; end

  # --- finish_page_dir
  # 
  # ライブラリ内部で使用します。
  def finish_page_dir; end

  # --- force_output -> bool
  # 
  # コマンドライン引数の --force_output オプションを指定していた場合、true
  # を返します。--no-force_output オプションを指定していた場合、false を返
  # します。
  # 
  # どちらも指定しなかった場合は true を返します。
  def force_output; end

  # --- force_output=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --force_output オプショ
  # ンと同様の指定を行います。
  # 
  # @param val --force_output オプションと同じ指定を行う場合は true、そうで
  #            ない場合は false を指定します。
  def force_output=; end

  # --- force_update -> bool
  # 
  # コマンドライン引数の --force_update を指定していた場合に true を返しま
  # す。そうでない場合は false を返します。
  def force_update; end

  # --- formatter -> nil
  # 
  # 使用されていません。常に nil を返します。
  def formatter; end

  # --- formatter=(val)
  # 
  # 使用されていません。
  def formatter=; end

  # --- generator -> Generator
  # 
  # コマンドライン引数の --fmt オプションで指定した文字列に応じた
  # Generator を返します。
  # 
  # 指定しなかった場合は、HTML に対応する Generator を返します。
  def generator; end

  # --- generator=(val)
  # 
  # コマンドライン引数の --fmt オプションと同様の指定を行います。
  # 
  # @param val 設定する Generator を指定します。
  def generator=; end

  # --- hyperlink_all -> bool
  # 
  # コマンドライン引数の --hyperlink-all オプションを指定していた場合、
  # true を返します。
  # 
  # 指定しなかった場合は false を返します。
  def hyperlink_all; end

  # --- hyperlink_all=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --hyperlink-all オプショ
  # ンと同様の指定を行います。
  # 
  # @param val --hyperlink-all オプションと同じ指定を行う場合は true、そう
  #            でない場合は false を指定します。
  def hyperlink_all=; end

  # --- image_format -> String
  # 
  # コマンドライン引数の --image-format オプションで指定した名前を文字列の
  # 配列で返します。
  # 
  # 指定しなかった場合は 'png' を返します。
  def image_format; end

  # --- include_line_numbers -> bool
  # 
  # コマンドライン引数の --include-line-numbers を指定していた場合に true
  # を返します。そうでない場合は false を返します。
  def include_line_numbers; end

  # --- inline_source -> bool
  # 
  # コマンドライン引数の --inline-source オプションか --one-file を指定して
  # いた場合、もしくは --fmt オプションに xml 指定した場合に true を返しま
  # す。そうでない場合は false を返します。
  def inline_source; end

  # --- line_numbers -> bool
  # 
  # コマンドライン引数の --line-numbers オプションを指定していた場合、true
  # を返します。--no-line-numbers オプションを指定していた場合、false を返
  # します。
  # 
  # どちらも指定しなかった場合は false を返します。
  def line_numbers; end

  # --- line_numbers=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --line-numbers オプショ
  # ンと同様の指定を行います。
  # 
  # @param val --line-numbers オプションと同じ指定を行う場合は true、そうで
  #            ない場合は false を指定します。
  def line_numbers=; end

  # --- main_page -> String | nil
  # 
  # コマンドライン引数の --main オプションで指定したファイル名、クラス/モ
  # ジュール名を返します。
  # 
  # 指定しなかった場合は nil を返します。
  def main_page; end

  # --- main_page=(val)
  # 
  # コマンドライン引数の --main オプションと同様の指定を行います。
  # 
  # @param val 設定するファイル名、クラス/モジュール名を文字列で指定します。
  def main_page=; end

  # --- markup -> String
  # 
  # コマンドライン引数の --markup オプションで指定したフォーマットを返しま
  # す。
  # 
  # 指定されていない場合は 'rdoc' を返します。
  def markup; end

  # --- markup=(val)
  # 
  # コマンドライン引数の --markup オプションと同様の指定を行います。
  # 
  # @param val フォーマットを文字列で指定します。
  def markup=; end

  # --- merge -> true | nil
  # 
  # コマンドライン引数の --merge オプションを指定していた場合、true を返し
  # ます。そうでない場合は nil を返します。
  def merge; end

  # --- op_dir -> String
  # 
  # コマンドライン引数の --op オプションで指定したディレクトリを返します。
  # 
  # --ri、--ri-site、--ri-system オプションにも影響される事に注意してください。
  # 
  # @return 設定されたディレクトリを文字列で返します。
  def op_dir; end

  # --- op_dir=(val)
  # 
  # コマンドライン引数の --op オプションと同様の指定を行います。
  # 
  # @param val 設定するディレクトリを文字列で指定します。
  def op_dir=; end

  # --- op_name -> String
  # 
  # コマンドライン引数の --opname オプションで指定した名前を文字列で返しま
  # す。
  def op_name; end

  # --- option_parser -> OptionParser | nil
  # 
  # コマンドライン引数の解析のための [[c:OptionParser]] オブジェクトを返し
  # ます。
  def option_parser; end

  # --- option_parser=(val)
  # 
  # コマンドライン引数の解析のための [[c:OptionParser]] オブジェクトを設定
  # します。
  # 
  # @param val [[c:OptionParser]] オブジェクトを指定します。
  def option_parser=; end

  # --- page_dir -> Pathname | nil
  # 
  # コマンドライン引数の --page-dir オプションで指定したディレクトリを返し
  # ます。
  # 
  # 指定されていない場合は nil を返します。
  def page_dir; end

  # --- page_dir=(val)
  # 
  # コマンドライン引数の --page-dir オプションと同様の指定を行います。
  # 
  # @param val パスを文字列で指定します。
  def page_dir=; end

  # --- parse(argv) -> ()
  # 
  # コマンドライン引数を解析します。
  # 
  # @param argv コマンドライン引数を文字列の配列で指定します。
  # 
  # 
  # また、以下のような指定をした場合は標準エラーに出力を行い、終了コード 1
  # でプログラムを終了します。
  # 
  #  * --extension オプションに拡張子を 2 つ指定しなかった場合
  #  * --extension オプションに new=old を指定した時に old を扱えるフォーマッ
  #    タがない場合
  #  * --fmt オプションに扱えない出力を指定した場合
  def parse; end

  # --- pipe -> bool
  # 
  # コマンドライン引数の --pipe オプションを指定していた場合、true を返しま
  # す。そうでない場合は false を返します。
  def pipe; end

  # --- pipe=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --pipe オプションと同
  # 様の指定を行います。
  # 
  # @param val --pipe オプションと同じ指定を行う場合は true、そうでない場合
  #            は false を指定します。
  def pipe=; end

  # --- promiscuous
  # 
  # コマンドライン引数の --promiscuous を指定していた場合に true を返します。
  # そうでない場合は false を返します。
  def promiscuous; end

  # --- quiet -> bool
  # 
  # コマンドライン引数の --quiet オプションを指定していた場合、true を返し
  # ます。そうでない場合は nil を返します。
  def quiet; end

  # --- rdoc_include -> [String]
  # 
  # コマンドライン引数の --include オプションで指定したディレクトリを文字列
  # の配列で返します。
  # 
  # 指定しなかった場合は ['.'] を返します。
  def rdoc_include; end

  # --- root -> Pathname
  # 
  # コマンドライン引数の --root オプションで指定したディレクトリを返します。
  # 
  # 指定されていない場合はカレントディレクトリを返します。
  def root; end

  # --- root=(val)
  # 
  # コマンドライン引数の --root オプションと同様の指定を行います。
  # 
  # @param val パスを文字列で指定します。
  def root=; end

  # --- sanitize_path(path)
  # 
  # ライブラリ内部で使用します。
  def sanitize_path; end

  # --- show_all -> bool
  # 
  # コマンドライン引数の --all オプションを指定していた場合、true を返しま
  # す。そうでない場合は false を返します。
  def show_all; end

  # --- show_all=(val)
  # 
  # val に true を指定した場合、コマンドライン引数の --all オプションと同様
  # の指定を行います。
  # 
  # @param val --all オプションと同じ指定を行う場合は true、そうでない場合
  #            は false を指定します。
  def show_all=; end

  # --- show_hash -> bool
  # 
  # コマンドライン引数の --show-hash オプションを指定していた場合、true を
  # 返します。そうでない場合は false を返します。
  def show_hash; end

  # --- static_path -> [String]
  # 
  # コマンドライン引数の --copy-files オプションで指定したパスの一覧を返し
  # ます。
  def static_path; end

  # --- static_path=(vals)
  # 
  # コマンドライン引数の --copy-files オプションと同様の指定を行います。
  # 
  # @param vals パスを文字列の配列で指定します。
  def static_path=; end

  # --- tab_width -> Integer
  # 
  # コマンドライン引数の --tab-width オプションで指定した数値を返します。
  def tab_width; end

  # --- template -> String
  # 
  # コマンドライン引数の --template オプションで指定した名前を文字列の配列
  # で返します。
  # 
  # 指定しなかった場合は 'html' を返します。
  def template; end

  # --- template_dir -> String | nil
  # 
  # コマンドライン引数の --template オプションで指定したテンプレートに対応
  # するディレクトリを返します。
  # 
  # オプションの解析前は nil を返します。
  def template_dir; end

  # --- template_dir=(val)
  # 
  # コマンドライン引数の --template オプションで指定したテンプレートに対応
  # するディレクトリを設定します。
  # 
  # @param val パスを文字列で指定します。
  def template_dir=; end

  # --- title -> String | nil
  # 
  # ドキュメントのタイトルを返します。指定されていない場合は nil を返します。
  def title; end

  # --- title=(string)
  # 
  # ドキュメントのタイトルがまだ設定されていない場合に string で指定した文
  # 字列に設定します。
  # 
  # コマンドライン引数で既に --title オプションが指定されていた場合には、そ
  # ちらを優先します。
  # 
  # @param string 設定するタイトルを文字列で指定します。
  def title=; end

  # --- verbosity -> 0 | 1 | 2
  # 
  # プログラムの解析時に表示する情報の詳細さを数値で返します。
  # 
  # 以下の値を指定する事ができます。
  # 
  # : 0(--quiet オプションを指定した場合)
  # 
  #   情報を表示しません。
  # 
  # : 1
  # 
  #   通常の表示を行います。
  # 
  # : 2(--verbose オプションを指定した場合)
  # 
  #   詳細な情報を表示します。
  def verbosity; end

  # --- verbosity=(val)
  # 
  # プログラムの解析時に表示する情報の詳細さを数値で指定します。
  # 
  # @param val 何も表示しない場合は 0、通常の表示を行う場合は 1、詳細な表示
  #            を行う場合は 2 を指定します。
  # 
  # @see [[m:RDoc::Options#verbosity]]
  def verbosity=; end

  # --- visibility -> :public | :protected | :private
  # 
  # コマンドライン引数の --visibility で指定したオプションを [[c:Symbol]]
  # で返します。
  def visibility; end

  # --- visibility=(val)
  # 
  # コマンドライン引数の --visibility オプションと同様の指定を行います。
  # 
  # @param val :public、:protected、:private のいずれかを指定します。
  def visibility=; end

  # --- warn(message) -> nil
  # 
  # --verbose オプションを指定していた場合に message を 標準エラー出力
  # $stderr に出力します。
  def warn; end

  # --- webcvs -> String | nil
  # 
  # コマンドライン引数の --webcvs オプションで指定した URL を文字列で返しま
  # す。
  # 
  # 指定しなかった場合は nil を返します。
  def webcvs; end

  # --- write_options -> object
  # 
  # カレントディレクトリの .rdoc_options ファイルに指定した設定を YAML 形式
  # で保存します。
  def write_options; end

  # --- DEPRECATED -> {String -> String}
  # 
  # 非推奨のオプションの一覧を返します。
  def DEPRECATED; end

  # --- SPECIAL -> [String]
  # 
  # --write-options を指定した際に .rdoc_options ファイルに保存されないオプ
  # ションの一覧を返します。
  def SPECIAL; end

end
