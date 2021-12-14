class Thread::Backtrace::Location
  # --- absolute_path -> String
  # 
  # self が表すフレームの絶対パスを返します。
  # 
  # //emlist[例][ruby]{
  # # foo.rb
  # class Foo
  #   attr_accessor :locations
  #   def initialize(skip)
  #     @locations = caller_locations(skip)
  #   end
  # end
  # 
  # Foo.new(0..2).locations.map do |call|
  #   puts call.absolute_path
  # end
  # 
  # # => /path/to/foo.rb
  # # /path/to/foo.rb
  # # /path/to/foo.rb
  # //}
  # 
  # @see [[m:Thread::Backtrace::Location#path]]
  def absolute_path; end

  # --- base_label -> String
  # 
  # self が表すフレームの基本ラベルを返します。通常、
  # [[m:Thread::Backtrace::Location#label]] から修飾を取り除いたもので構成
  # されます。
  # 
  # //emlist[例][ruby]{
  # # foo.rb
  # class Foo
  #   attr_accessor :locations
  #   def initialize(skip)
  #     @locations = caller_locations(skip)
  #   end
  # end
  # 
  # Foo.new(0..2).locations.map do |call|
  #   puts call.base_label
  # end
  # 
  # # => initialize
  # # new
  # # <main>
  # //}
  # 
  # @see [[m:Thread::Backtrace::Location#label]]
  def base_label; end

  # --- inspect -> String
  # 
  # [[m:Thread::Backtrace::Location#to_s]] の結果を人間が読みやすいような文
  # 字列に変換したオブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # # foo.rb
  # class Foo
  #   attr_accessor :locations
  #   def initialize(skip)
  #     @locations = caller_locations(skip)
  #   end
  # end
  # 
  # Foo.new(0..2).locations.map do |call|
  #   puts call.inspect
  # end
  # 
  # # => "path/to/foo.rb:5:in `initialize'"
  # # "path/to/foo.rb:9:in `new'"
  # # "path/to/foo.rb:9:in `<main>'"
  # //}
  def inspect; end

  # --- label -> String
  # 
  # self が表すフレームのラベルを返します。通常、メソッド名、クラス名、モ
  # ジュール名などで構成されます。
  # 
  # 例: [[c:Thread::Backtrace::Location]] の例1を用いた例
  # 
  #   loc = c(0..1).first
  #   loc.label # => "a"
  # 
  # @see [[m:Thread::Backtrace::Location#base_label]]
  def label; end

  # --- lineno -> Integer
  # 
  # self が表すフレームの行番号を返します。
  # 
  # 例: [[c:Thread::Backtrace::Location]] の例1を用いた例
  # 
  #   loc = c(0..1).first
  #   loc.lineno # => 2
  def lineno; end

  # --- path -> String
  # 
  # self が表すフレームのファイル名を返します。
  # 
  # 例: [[c:Thread::Backtrace::Location]] の例1を用いた例
  # 
  #   loc = c(0..1).first
  #   loc.path # => "caller_locations.rb"
  # 
  # @see [[m:Thread::Backtrace::Location#absolute_path]]
  def path; end

  # --- to_s -> String
  # 
  # self が表すフレームを [[m:Kernel.#caller]] と同じ表現にした文字列を返し
  # ます。
  # 
  # //emlist[例][ruby]{
  # # foo.rb
  # class Foo
  #   attr_accessor :locations
  #   def initialize(skip)
  #     @locations = caller_locations(skip)
  #   end
  # end
  # 
  # Foo.new(0..2).locations.map do |call|
  #   puts call.to_s
  # end
  # 
  # # => path/to/foo.rb:5:in `initialize'
  # # path/to/foo.rb:9:in `new'
  # # path/to/foo.rb:9:in `<main>'
  # //}
  def to_s; end

end
