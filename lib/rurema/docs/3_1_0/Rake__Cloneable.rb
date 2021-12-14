module Rake::Cloneable
  # --- clone -> object
  # 
  # 自身を複製します。
  # 
  # 自身がフリーズされていれば返されるオブジェクトもフリーズされています。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList['a.c', 'b.c']
  #   clone = file_list.clone
  #   clone                 # => ["a.c", "b.c"]
  #   clone.exclude("a.c")
  #   clone == file_list    # => false
  # end
  # //}
  def clone; end

  # --- dup -> object
  # 
  # 自身と同じクラスのオブジェクトを作成後、自身のインスタンス変数を
  # 全て新たに作成したオブジェクトにコピーします。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :test_rake_app
  # task :test_rake_app do
  #   file_list = FileList['a.c', 'b.c']
  #   file_list.freeze
  #   dup = file_list.dup
  #   clone = file_list.clone
  #   dup.exclude("a.c")   # => ["b.c"]
  #   clone.exclude("a.c") # => can't modify frozen Rake::FileList
  # end
  # //}
  def dup; end

end
