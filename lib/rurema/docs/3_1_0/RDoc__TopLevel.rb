class RDoc::TopLevel
  # --- add_class_or_module(collection, class_type, name, superclass) -> RDoc::NormalClass | RDoc::SingleClass | RDoc::NormalModule
  # 
  # collection に name で指定したクラス、モジュールを追加します。
  # 
  # @param collection クラス、モジュールを追加する先を [[c:Hash]] オブジェ
  #                   クトで指定します。
  # 
  # @param class_type 追加するクラス、モジュールを [[c:RDoc::NormalClass]]、
  #                   [[c:RDoc::SingleClass]]、[[c:RDoc::NormalModule]] オ
  #                   ブジェクトのいずれかで指定します。
  # 
  # @param name クラス名を文字列で指定します。
  # 
  # @param superclass 追加するクラスの親クラスを [[c:RDoc::NormalClass]] オ
  #                   ブジェクトで指定します。
  # 
  # 既に登録済みであった場合は、引数で指定した情報で内容を更新します。ただ
  # し、[[m:RDoc::CodeObject#done_documenting]] が true を返す場合、何も行
  # われません。
  def add_class_or_module; end

  # --- file_absolute_name -> String
  # 
  # 自身が管理するファイルに関する絶対パスを文字列で返します。
  def file_absolute_name; end

  # --- file_absolute_name=(val)
  # 
  # 自身が管理するファイルに関する絶対パスを文字列で設定します。
  # 
  # @param val パスを文字列で指定します。
  def file_absolute_name=; end

  # --- file_relative_name -> String
  # 
  # 自身が管理するファイルに関する相対パスを文字列で返します。
  def file_relative_name; end

  # --- file_relative_name=(val)
  # 
  # 自身が管理するファイルに関する相対パスを文字列で設定します。
  # 
  # @param val パスを文字列で指定します。
  def file_relative_name=; end

  # --- file_stat -> File::Stat
  # 
  # 自身が管理するファイルに関する [[c:File::Stat]] オブジェクトを返します。
  def file_stat; end

  # --- file_stat=(val)
  # 
  # 自身が管理するファイルに関する [[c:File::Stat]] オブジェクトを設定しま
  # す。
  # 
  # @param val [[c:File::Stat]] オブジェクトを指定します。
  def file_stat=; end

  # --- find_local_symbol(name) -> RDoc::NormalClass | RDoc::SingleClass | RDoc::NormalModule | RDoc::AnyMethod | RDoc::Alias | RDoc::Attr | RDoc::Constant
  # 
  # クラス、モジュール、メソッド、定数、属性、alias、ファイルから name で指定したものを返します。見つからなかった場合は nil を返します。
  def find_local_symbol; end

  # --- find_module_named(name) -> RDoc::NormalModule
  # 
  # RDoc が収集したクラスの内、name で指定した名前のモジュールを返します。
  # 見つからなかった場合は nil を返します。
  # 
  # @param name モジュール名を文字列で指定します。
  def find_module_named; end

  # --- full_name -> String
  # 
  # 自身が管理するファイルの名前を返します。
  def full_name; end

  # --- all_classes_and_modules -> [RDoc::NormalClass | RDoc::SingleClass | RDoc::NormalModule]
  # 
  # RDoc が収集したクラス、モジュールを配列で返します。
  def all_classes_and_modules; end

  # --- find_class_named(name) -> RDoc::NormalClass | RDoc::SingleClass | nil
  # 
  # RDoc が収集したクラスの内、name で指定した名前のクラスを返します。見つ
  # からなかった場合は nil を返します。
  # 
  # @param name クラス名を文字列で指定します。
  def find_class_named; end

  # --- new(file_name) -> RDoc::TopLevel
  # 
  # 自身を初期化します。
  # 
  # @param file_name ファイル名を文字列で指定します。
  def new; end

  # --- reset -> ()
  # 
  # RDoc が収集した [[c:RDoc::TopLevel]] の情報(クラス、モジュール、ファイ
  # ル)をクリアします。
  def reset; end

end
