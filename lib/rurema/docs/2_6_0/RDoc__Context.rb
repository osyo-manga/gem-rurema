class RDoc::Context
  # --- <=>(other) -> -1 | 0 | 1
  # 
  # 自身と other の full_name を比較した結果を返します。
  # 
  # ソートのために使われます。
  # 
  # @param other 自身と比較したいオブジェクトを指定します。
  def <=>; end

  # --- add_alias(an_alias) -> RDoc::Alias
  # 
  # 引数で指定した [[c:RDoc::Alias]] オブジェクトを追加します。
  # 
  # @param an_alias [[c:RDoc::Alias]] オブジェクトを指定します。
  def add_alias; end

  # --- add_attribute(an_attribute) -> ()
  # 
  # 引数で指定した [[c:RDoc::Attr]] オブジェクトを追加します。
  # 
  # @param an_attribute [[c:RDoc::Attr]] オブジェクトを指定します。
  def add_attribute; end

  # --- add_class(class_type, name, superclass) -> RDoc::SingleClass | RDoc::NormalClass
  # 
  # 引数で指定したクラスを追加します。
  # 
  # @param class_type 追加するクラス、モジュールを [[c:RDoc::NormalClass]]、
  #                   [[c:RDoc::SingleClass]]、[[c:RDoc::NormalModule]] オ
  #                   ブジェクトのいずれかで指定します。
  # 
  # @param name クラス名を文字列で指定します。
  # 
  # @param superclass 追加するクラスの親クラスを [[c:RDoc::NormalClass]] オ
  #                   ブジェクトで指定します。
  def add_class; end

  # --- add_class_or_module(collection, class_type, name, superclass = nil) -> RDoc::NormalClass | RDoc::SingleClass | RDoc::NormalModule
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

  # --- add_constant(const) -> ()
  # 
  # 引数で指定した [[c:RDoc::Constant]] オブジェクトを追加します。
  # 
  # @param const [[c:RDoc::Constant]] オブジェクトを指定します。
  def add_constant; end

  # --- add_include(an_include) -> ()
  # 
  # 引数で指定した [[c:RDoc::Include]] オブジェクトを追加します。
  # 
  # @param an_include [[c:RDoc::Include]] オブジェクトを指定します。
  def add_include; end

  # --- add_method(a_method) -> ()
  # 
  # 引数で指定した [[c:RDoc::AnyMethod]] オブジェクトを追加します。
  # 
  # @param a_method [[c:RDoc::AnyMethod]] オブジェクトかそのサブクラスのオ
  #                 ブジェクトを指定します。
  def add_method; end

  # --- add_module(class_type, name) -> RDoc::NormalModule | RDoc::SingleClass | RDoc::NormalClass
  # 
  # 引数で指定したモジュールを追加します。
  # 
  # ただし、クラスとして既に同名のものが登録されていた場合は、何もせずにそ
  # のクラスを返します。
  # 
  # @param class_type 追加するクラス、モジュールを [[c:RDoc::NormalClass]]、
  #                   [[c:RDoc::SingleClass]]、[[c:RDoc::NormalModule]] オ
  #                   ブジェクトのいずれかで指定します。
  # 
  # @param name クラス名を文字列で指定します。
  # 
  # @see [[m:RDoc::Context#add_class]]
  def add_module; end

  # --- add_require(a_require) -> ()
  # 
  # 自身が所属する [[c:RDoc::TopLevel]] オブジェクトに引数で指定した
  # [[c:RDoc::Require]] を追加します。
  # 
  # @param a_require [[c:RDoc::Require]] オブジェクトを指定します。
  def add_require; end

  # --- add_to(array, thing) -> ()
  # 
  # array に thing を追加します。
  # 
  # @param array 配列を指定します。
  # 
  # @param thing 追加する要素を指定します。
  # 
  # [[m:RDoc::Context#add_alias]] などで使われています。ライブラリ内部で使
  # 用します。
  # 
  # @see [[m:RDoc::Context#add_alias]], [[m:RDoc::Context#add_attribute]],
  #      [[m:RDoc::Context#add_constant]], [[m:RDoc::Context#add_include]],
  #      [[m:RDoc::Context#add_method]], [[m:RDoc::Context#add_require]]
  def add_to; end

  # --- aliases -> [RDoc::Alias]
  # 
  # 追加された [[c:RDoc::Alias]] の配列を返します。
  def aliases; end

  # --- attributes -> [RDoc::Attr]
  # 
  # 追加された [[c:RDoc::Attr]] の配列を返します。
  def attributes; end

  # --- classes -> [RDoc::SingleClass | RDoc::NormalClass]
  # 
  # 追加されたクラスの配列を返します。
  def classes; end

  # --- constants -> [RDoc::Constant]
  # 
  # 追加された [[c:RDoc::Constant]] の配列を返します。
  def constants; end

  # --- current_section -> RDoc::Context::Section
  # 
  # 現在の section を返します。
  def current_section; end

  # --- defined_in?(file)
  # 
  # Return true if at least part of this thing was defined in file
  def defined_in?; end

  # --- each_attribute {|a| ... } -> [RDoc::Attr]
  # 
  # 追加された [[c:RDoc::Attr]] に対してブロックを評価します。
  def each_attribute; end

  # --- each_classmodule {|m| ... } -> [RDoc::SingleClass | RDoc::NormalClass | RDoc::NormalModule]
  # 
  # 追加されたクラス、モジュールに対してブロックを評価します。
  # 
  # @see [[m:RDoc::Context#classes]], [[m:RDoc::Context#modules]]
  def each_classmodule; end

  # --- each_constant {|c| ... } -> [RDoc::Constant]
  # 
  # 追加された [[c:RDoc::Constant]] に対してブロックを評価します。
  def each_constant; end

  # --- each_method {|m| ... } -> [RDoc::AnyMethod]
  # 
  # 追加されたメソッド([[c:RDoc::AnyMethod]] かそのサブクラスのオブジェクト)
  # に対してブロックを評価します。
  def each_method; end

  # --- find_enclosing_module_named(name) -> RDoc::NormalModule | nil
  # 
  # find a module at a higher scope
  def find_enclosing_module_named; end

  # --- find_local_symbol(symbol)
  # 
  # Finds a method, constant, attribute, module or files named +symbol+ in
  # this context
  def find_local_symbol; end

  # --- find_module_named(name) -> RDoc::NormalModule | nil
  # 
  # 追加された [[c:RDoc::NormalModule]] から引数で指定した名前のモジュール
  # を検索します。見つからなかった場合は nil を返します。
  # 
  # @param name モジュールの名前を文字列で指定します。
  def find_module_named; end

  # --- find_symbol(symbol, method=nil)
  # 
  # Look up the given symbol. If method is non-nil, then we assume
  # the symbol references a module that contains that method
  def find_symbol; end

  # --- in_files
  # 
  # Files this context is found in
  def in_files; end

  # --- includes -> [RDoc::Include]
  # 
  # 追加された [[c:RDoc::Include]] の配列を返します。
  def includes; end

  # --- initialize_classes_and_modules -> ()
  # 
  # 追加されたクラスやモジュールをクリアします。
  def initialize_classes_and_modules; end

  # --- initialize_methods_etc -> ()
  # 
  # 追加されたメソッド、属性、alias されたメソッド(メソッド名の対応が取れて
  # いないものを含む)、require されたファイル、include されたファイル、定数
  # をクリアします。
  def initialize_methods_etc; end

  # --- method_list -> [RDoc::AnyMethod]
  # 
  # 追加された([[c:RDoc::AnyMethod]] かそのサブクラスのオブジェクト)の配列
  # を返します。
  def method_list; end

  # --- modules -> [RDoc::NormalModule]
  # 
  # 追加された [[c:RDoc::NormalModule]] の配列を返します。
  def modules; end

  # --- name -> String
  # 
  # 自身の名前を返します。
  # 
  # サブクラスによっては、メソッド名やクラス名を意味します。
  def name; end

  # --- ongoing_visibility=(vis)
  # 
  # Change the default visibility for new methods
  def ongoing_visibility=; end

  # --- record_location(toplevel)
  # 
  # Record the file that we happen to find it in
  def record_location; end

  # --- requires -> [RDoc::Require]
  # 
  # 追加された [[c:RDoc::Require]] の配列を返します。
  def requires; end

  # --- sections -> RDoc::Context::Section
  # 
  # 追加された [[c:RDoc::Context::Section]] の配列を返します。
  def sections; end

  # --- set_current_section(title, comment) -> ()
  # 
  # Handle sections
  def set_current_section; end

  # --- set_visibility_for(methods, visibility, singleton = false) -> ()
  # 
  # methods で指定した [[c:RDoc::AnyMethod]]、[[c:RDoc::Attr]] の内、
  # singleton で指定した条件と一致するメソッドすべての可視性を visibility
  # に設定します。
  # 
  # @param methods [[c:RDoc::AnyMethod]]、[[c:RDoc::Attr]] オブジェクトの配
  #                列を指定します。
  # 
  # @param visibility 可視性を :public, :protected, :private の内のいずれか
  #                   で指定します。
  # 
  # @param singleton 特異メソッドの可視性を変更する場合は true、そうでない
  #                  場合は false を指定します。
  def set_visibility_for; end

  # --- toplevel -> RDoc::TopLevel
  # 
  # 自身が所属する [[c:RDoc::TopLevel]] オブジェクトを返します。
  def toplevel; end

  # --- unmatched_alias_lists -> {String => RDoc::Alias}
  # 
  # メソッド名の対応が取れていない alias の旧メソッド名がキー、
  # [[c:RDoc::Alias]] が値の [[c:Hash]] を返します。
  def unmatched_alias_lists; end

  # --- unmatched_alias_lists=(val)
  # 
  # メソッド名の対応が取れていない alias の旧メソッド名がキー、
  # [[c:RDoc::Alias]] が値の [[c:Hash]] を設定します。
  # 
  # @param val 旧メソッド名がキー、[[c:RDoc::Alias]] が値の [[c:Hash]] を指
  #            定します。
  def unmatched_alias_lists=; end

  # --- visibility -> :public | :protected | :private
  # 
  # 自身の可視性を [[c:Symbol]] で返します。
  def visibility; end

  # --- new -> RDoc::Context
  # 
  # 自身を初期化します。
  def new; end

  # --- TYPES -> ["class", "instance"]
  # 
  # メソッドの種類を文字列の配列で返します。
  def TYPES; end

  # --- VISIBILITIES -> [:public, :protected, :private]
  # 
  # メソッドの可視性を [[c:Symbol]] の配列で返します。
  def VISIBILITIES; end

end
