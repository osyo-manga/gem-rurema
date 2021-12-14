class Rake::FileList
  # --- *(other) -> Array | String
  # 
  # [[m:Array#*]] と動作を合わせるために再定義しています。
  # 
  # 
  # @see [[m:Array#*]]
  def *; end

  # --- ==(array) -> bool
  # 
  # 自身を配列に変換してから与えられた配列と比較します。
  # 
  # @param array 比較対象の配列を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new('lib/**/*.rb', 'test/test*.rb')
  #   file_list == file_list.to_a # => true
  # end
  # //}
  def ==; end

  # --- clear_exclude -> self
  # 
  # 登録されている除外リストをクリアします。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test.rb", "test.bak")
  #   file_list.exclude("test.rb")
  #   # DEFAULT_IGNORE_PATTERNS と "test.rb" の双方の除外がクリアされる
  #   file_list.clear_exclude
  #   file_list # => ["test.rb", "test.bak"]
  # end
  # //}
  def clear_exclude; end

  # --- egrep(pattern){|filename, count, line| ... }
  # 
  # 与えられたパターンをファイルリストから grep のように検索します。
  # 
  # ブロックが与えられた場合は、マッチした行の情報 (ファイル名、行番号、マッチした行) が
  # ブロックに渡されてブロックが評価されます。ブロックが与えられなかった場合は、
  # 標準出力に、ファイル名:行番号:マッチした行を出力します。
  # 
  # @param pattern 正規表現を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("sample1", "line1\nline2\nline3\n")
  # IO.write("sample2", "line1\nline2\nline3\nline4\n")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  # 
  #   file_list = FileList.new('sample*')
  #   file_list.egrep(/line/) # => 7
  # 
  #   file_list.egrep(/.*/) do |filename, count, line|
  #     "filename = #{filename}, count = #{count}, line = #{line}"
  #   end
  # end
  # 
  # # => "filename = sample1, count = 1, line = line1\n"
  # # => "filename = sample1, count = 2, line = line2\n"
  # # => "filename = sample1, count = 3, line = line3\n"
  # # => "filename = sample2, count = 1, line = line1\n"
  # # => "filename = sample2, count = 2, line = line2\n"
  # # => "filename = sample2, count = 3, line = line3\n"
  # # => "filename = sample2, count = 4, line = line4\n"
  # //}
  def egrep; end

  # --- exclude(*patterns){|entry| ... } -> self
  # 
  # 自身から取り除くべきファイル名のパターンを自身の除外リストに登録します。
  # 
  # パターンとして正規表現、グロブパターン、文字列が使用可能です。
  # さらにブロックが与えられた場合は、ブロックを評価して真になったエントリを削除します。
  # 
  # グロブパターンはファイルシステムに対して展開されます。
  # もし、ファイルシステムに存在しないファイルを明示的にリストへ追加した場合、
  # グロブパターンではそのファイルをリストから削除しません。
  # 
  # 例:
  #   FileList['a.c', 'b.c'].exclude("a.c") # => ['b.c']
  #   FileList['a.c', 'b.c'].exclude(/^a/)  # => ['b.c']
  # 
  #   # If "a.c" is a file, then ...
  #   FileList['a.c', 'b.c'].exclude("a.*") # => ['b.c']
  # 
  #   # If "a.c" is not a file, then ...
  #   FileList['a.c', 'b.c'].exclude("a.*") # => ['a.c', 'b.c']
  def exclude; end

  # --- excluded_from_list?(file_name) -> bool
  # 
  # 与えられたファイル名が除外される場合は、真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param file_name ファイル名を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb")
  #   file_list.exclude("test1.rb")
  #   file_list.excluded_from_list?("test1.rb") # => true
  #   file_list.excluded_from_list?("test2.rb") # => false
  # end
  # //}
  def excluded_from_list?; end

  # --- existing -> Rake::FileList
  # 
  # 自身に含まれるファイルのうちファイルシステムに存在するファイルのみを
  # 含む [[c:Rake::FileList]] を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.existing # => ["test1.rb", "test2.rb"]
  # end
  # //}
  def existing; end

  # --- existing! -> self
  # 
  # 自身に含まれるファイルのうちファイルシステムに存在するファイルのみを
  # 含むように自身を変更して返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.existing! # => ["test1.rb", "test2.rb"]
  #   file_list           # => ["test1.rb", "test2.rb"]
  # end
  # //}
  def existing!; end

  # --- ext(newext = '') -> Rake::FileList
  # 
  # 各要素に [[m:String#ext]] を適用した新しい [[c:Rake::FileList]] を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.ext(".erb") # => ["test1.erb", "test2.erb", "test3.erb"]
  # end
  # //}
  # 
  # @see [[m:String#ext]]
  def ext; end

  # --- gsub(pattern, replace) -> Rake::FileList
  # 
  # 自身に含まれるファイルリストのそれぞれのエントリに対して [[m:String#gsub]] を実行し、
  # 結果を新しい [[c:Rake::FileList]] として返します。
  # 
  # 例:
  #    FileList['lib/test/file', 'x/y'].gsub(/\//, "\\") # => ['lib\\test\\file', 'x\\y']
  def gsub; end

  # --- gsub!(pattern, replace) -> self
  # 
  # 自身に含まれるファイルリストのそれぞれのエントリに対して [[m:String#gsub]] を実行します。
  # 自身を破壊的に変更します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.gsub!(/\.rb/, ".erb") # => ["test1.erb", "test2.erb", "test3.erb"]
  #   file_list                       # => ["test1.erb", "test2.erb", "test3.erb"]
  # end
  # //}
  def gsub!; end

  # --- import(array) -> self
  # 
  # 与えられた配列を自身にインポートします。
  # 
  # @param array ファイル名のリストを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.import(["test4.rb", "test5.rb"]) # => ["test4.rb", "test5.rb", "test1.rb", "test2.rb", "test3.rb"]
  #   file_list                                  # => ["test4.rb", "test5.rb", "test1.rb", "test2.rb", "test3.rb"]
  # end
  # //}
  def import; end

  # --- include(*filenames) -> self
  # 
  # ファイル名のパターンを追加リストに登録します。
  # 配列が与えられた場合、配列の各要素が追加されます。
  # 
  # @param filenames 追加するファイル名のパターンを指定します。
  # 
  # 例:
  #    file_list.include("*.java", "*.cfg")
  #    file_list.include %w( math.c lib.h *.o )
  def include; end

  # --- is_a?(klass) -> bool
  # --- kind_of?(klass) -> bool
  # 
  # 自身に [[c:Array]] のフリをさせます。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.is_a?(Array)  # => true
  #   file_list.is_a?(String) # => false
  # end
  # //}
  def is_a?; end

  # --- pathmap(spec = nil) -> Rake::FileList
  # 
  # 各要素に [[m:String#pathmap]] を適用した新しい [[c:Rake::FileList]] を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList.new("test1.rb", "test2.rb", "test3.rb")
  #   file_list.pathmap("%n") # => ["test1", "test2", "test3"]
  # end
  # //}
  # 
  # @see [[m:String#pathmap]]
  def pathmap; end

  # --- resolve -> self
  # 
  # 追加リストと除外リストを評価します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # IO.write("test.rb", "test")
  # IO.write("test.java", "test")
  # IO.write("test.js", "test")
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list  = FileList.new("*.rb")
  #   file_list.include("*.java")
  #   file_list.exclude("*.js")
  #   file_list.resolve # => ["test.rb", "test.java"]
  # end
  # //}
  def resolve; end

  # --- sub(pattern, replace) -> Rake::FileList
  # 
  # 自身に含まれるファイルリストのそれぞれのエントリに対して [[m:String#sub]] を実行し、
  # 結果を新しい [[c:Rake::FileList]] として返します。
  # 
  # 例:
  #    FileList['a.c', 'b.c'].sub(/\.c$/, '.o')  => ['a.o', 'b.o']
  def sub; end

  # --- sub!(pattern, replace) -> self
  # 
  # 自身に含まれるファイルリストのそれぞれのエントリに対して [[m:String#sub]] を実行します。
  # 自身を破壊的に変更します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList['a.c', 'b.c']
  #   file_list.sub!(/\.c$/, '.o') # => ['a.o', 'b.o']
  #   file_list                    # => ['a.o', 'b.o']
  # end
  # //}
  def sub!; end

  # --- to_a -> Array
  # --- to_ary -> Array
  # 
  # 内部的な配列を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList['a.c', 'b.c']
  #   file_list.to_a # => ["a.c", "b.c"]
  # end
  # //}
  def to_a; end

  # --- to_s -> String
  # 
  # 全ての要素をスペースで連結した文字列を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList['a.c', 'b.c']
  #   file_list.to_s # => "a.c b.c"
  # end
  # //}
  def to_s; end

  # --- [](*args) -> Rake::FileList
  # 
  # 与えられたパターンをもとにして自身を初期化します。
  # 
  # @param args パターンを指定します。
  # 
  # //emlist[][ruby]{
  # require 'rake'
  # 
  # file_list1 = FileList.new('lib/**/*.rb', 'test/test*.rb')
  # file_list2 = FileList['lib/**/*.rb', 'test/test*.rb']
  # 
  # file_list1 == file_list2 # => true
  # //}
  def []; end

  # --- new(*patterns){|self| ... }
  # 
  # 与えられたパターンをもとにして自身を初期化します。
  # 
  # ブロックが与えられている場合は、自身をブロックパラメータとしてブロックを評価します。
  # 
  # @param patterns パターンを指定します。
  # 
  # 例:
  #    file_list = FileList.new('lib/**/*.rb', 'test/test*.rb')
  # 
  #    pkg_files = FileList.new('lib/**/*') do |fl|
  #      fl.exclude(/\bCVS\b/)
  #    end
  def new; end

  # --- ARRAY_METHODS -> Array
  # 
  # [[c:Array]] に定義されているメソッドのリストです。
  def ARRAY_METHODS; end

  # --- DEFAULT_IGNORE_PATTERNS -> Array
  # 
  # デフォルトで除外するパターンのリストです。
  def DEFAULT_IGNORE_PATTERNS; end

  # --- DEFAULT_IGNORE_PROCS
  # 
  # デフォルトで除外する手続きです。
  def DEFAULT_IGNORE_PROCS; end

  # --- DELEGATING_METHODS -> Array
  # 
  # 委譲するメソッドのリストです。
  def DELEGATING_METHODS; end

  # --- MUST_DEFINE -> Array
  # 
  # 必ず委譲しなければならない付加的なメソッドのリストです。
  def MUST_DEFINE; end

  # --- MUST_NOT_DEFINE -> Array
  # 
  # 委譲してはいけないメソッドのリストです。
  # 
  # このリストに含まれているメソッドはこのクラスで定義しています。
  def MUST_NOT_DEFINE; end

  # --- SPECIAL_RETURN -> Array
  # 
  # [[c:Array]] のインスタンスを返すので委譲した後にラップする必要があるメソッドのリストです。
  def SPECIAL_RETURN; end

end
