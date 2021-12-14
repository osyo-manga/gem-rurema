class Rake::PackageTask
  # --- define -> self
  # 
  # タスクを定義します。
  # 
  # @raise RuntimeError バージョン情報をセットしていない場合に発生します。
  #                     初期化時に :noversion が指定されている場合は発生しません。
  def define; end

  # --- init(name, version)
  # 
  # 自身の各属性にデフォルト値をセットします。
  # 
  # @param name パッケージの名前を指定します。
  # 
  # @param version パッケージのバージョンを指定します。
  def init; end

  # --- name -> String
  # 
  # バージョン情報を含まないパッケージの名前を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.name # => "sample"
  # end
  # //}
  def name; end

  # --- name=(name)
  # 
  # バージョン情報を含まないパッケージの名前をセットします。
  # 
  # @param name パッケージの名前を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.name # => "sample"
  #   package_task.name = "update"
  #   package_task.name # => "update"
  # end
  # //}
  def name=; end

  # --- need_tar -> bool
  # 
  # この値が真である場合は gzip した tar ファイル (tgz) を作成します。
  # デフォルトは偽です。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar # => false
  # end
  # //}
  def need_tar; end

  # --- need_tar=(flag)
  # 
  # gzip した tar ファイル (tgz) を作成するかどうかを設定します。
  # 
  # @param flag 真または偽を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar # => false
  #   package_task.need_tar = true
  #   package_task.need_tar # => true
  # end
  # //}
  def need_tar=; end

  # --- need_tar_bz2 -> bool
  # 
  # この値が真である場合は bzip2 した tar ファイル (tar.bz2) を作成します。
  # デフォルトは偽です。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar_bz2 # => false
  # end
  # //}
  def need_tar_bz2; end

  # --- need_tar_bz2=(flag)
  # 
  # bzip2 した tar ファイル (tar.bz2) を作成するかどうかを設定します。
  # 
  # @param flag 真または偽を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar_bz2 # => false
  #   package_task.need_tar_bz2 = true
  #   package_task.need_tar_bz2 # => true
  # end
  # //}
  def need_tar_bz2=; end

  # --- need_tar_gz -> bool
  # 
  # この値が真である場合は gzip した tar ファイル (tar.gz) を作成します。
  # デフォルトは偽です。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar_gz # => false
  # end
  # //}
  def need_tar_gz; end

  # --- need_tar_gz=(flag)
  # 
  # gzip した tar ファイル (tar.gz) を作成するかどうかを設定します。
  # 
  # @param flag 真または偽を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_tar_gz # => false
  #   package_task.need_tar_gz = true
  #   package_task.need_tar_gz # => true
  # end
  # //}
  def need_tar_gz=; end

  # --- need_zip -> bool
  # 
  # この値が真である場合は zip ファイルを作成します。
  # デフォルトは偽です。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_zip # => false
  # end
  # //}
  def need_zip; end

  # --- need_zip=(flag)
  # 
  # zip ファイル (tgz) を作成するかどうかを設定します。
  # 
  # @param flag 真または偽を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.need_zip # => false
  #   package_task.need_zip = true
  #   package_task.need_zip # => true
  # end
  # //}
  def need_zip=; end

  # --- package_dir -> String
  # 
  # パッケージに入れるファイルを保存するディレクトリ名を返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_dir # => "pkg"
  # end
  # //}
  def package_dir; end

  # --- package_dir=(dirname)
  # 
  # パッケージに入れるファイルを保存するディレクトリ名をセットします。
  # 
  # @param dirname パッケージに入れるファイルを保存するディレクトリ名を指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_dir # => "pkg"
  #   package_task.package_dir = "package"
  #   package_task.package_dir # => "package"
  # end
  # //}
  def package_dir=; end

  # --- package_dir_path -> String
  # 
  # パッケージに含むファイルを配置するディレクトリを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_dir_path # => "pkg/sample-1.0.0"
  # end
  # //}
  def package_dir_path; end

  # --- package_files -> Rake::FileList
  # 
  # パッケージに含むファイルリストを返します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_files # => []
  #   package_task.package_files.include("*.rb")
  #   package_task.package_files # => ["test1.rb", "test2.rb"]
  # end
  # //}
  def package_files; end

  # --- package_files=(file_list)
  # 
  # パッケージに含むファイルリストを設定します。
  # 
  # @param file_list ファイルリストを指定します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # IO.write("test1.rb", "test")
  # IO.write("test2.rb", "test")
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_files # => []
  #   package_task.package_files = FileList.new("test1.rb", "test2.rb")
  #   package_task.package_files # => ["test1.rb", "test2.rb"]
  # end
  # //}
  def package_files=; end

  # --- package_name -> String
  # 
  # バージョン情報を含むパッケージ名を返します。
  def package_name; end

  # --- tar_bz2_file -> String
  # 
  # tar.bz2 用のファイル名を返します。
  def tar_bz2_file; end

  # --- tar_command -> String
  # 
  # tar コマンドとして使用するコマンドを返します。
  # 
  # デフォルトは 'tar' です。
  def tar_command; end

  # --- tar_command=(command)
  # 
  # tar コマンドとして使用するコマンドを設定します。
  # 
  # @param command コマンドを文字列で指定します。
  def tar_command=; end

  # --- tar_gz_file -> String
  # 
  # tar.gz 用のファイル名を返します。
  def tar_gz_file; end

  # --- tgz_file -> String
  # 
  # tgz 用のファイル名を返します。
  def tgz_file; end

  # --- version -> String
  # 
  # 作成するパッケージのバージョンを表す文字列を返します。
  def version; end

  # --- version=(str)
  # 
  # 作成するパッケージのバージョンをセットします。
  # 
  # @param str バージョンを表す文字列を指定します。
  def version=; end

  # --- zip_command -> String
  # 
  # zip コマンドとして使用するコマンドを返します。
  # 
  # デフォルトは 'zip' です。
  def zip_command; end

  # --- zip_command=(command)
  # 
  # zip コマンドとして使用するコマンドを設定します。
  # 
  # @param command コマンドを文字列で指定します。
  def zip_command=; end

  # --- zip_file -> String
  # 
  # zip ファイル用のファイル名を返します。
  def zip_file; end

  # --- new(name = nil, version = nil){|t| ... } -> Rake::PackageTask
  # 
  # 自身を初期化してタスクを定義します。
  # 
  # ブロックが与えられた場合は、自身をブロックパラメータとして
  # ブロックを評価します。
  # 
  # @param name パッケージ名を指定します。
  # 
  # @param version パッケージのバージョンを指定します。
  #                ':noversion' というシンボルを指定するとバージョン情報をセットしません。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # require 'rake/packagetask'
  # 
  # Rake::PackageTask.new("sample", "1.0.0") do |package_task|
  #   package_task.package_dir = "./pkg"
  #   package_task.package_files.include("lib/**/*")
  # end
  # 
  # # rake -T を実行すると以下になる
  # # => rake clobber_package  # Remove package products
  # #    rake package          # Build all the packages
  # #    rake repackage        # Force a rebuild of the package files
  # //}
  def new; end

end
