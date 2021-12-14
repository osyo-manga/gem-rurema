module RakeFileUtils
  # --- nowrite(value = nil){ ... }
  # 
  # ファイルを書き込むかどうかを制御します。
  # 
  # @param value 真を指定するとファイルを書き込みません。
  # 
  # 例:
  #     nowrite              # 現在の状態を返します。
  #     nowrite(v)           # 与えられた状態に変更します。
  #     nowrite(v) { code }  # ブロックを評価する間だけ与えられた状態に変更します。
  #                          # ブロックの評価が終わると元の値に戻します。
  def nowrite; end

  # --- verbose(value = nil){ ... }
  # 
  # 詳細を出力するかどうかを制御します。
  # 
  # @param value 真を指定すると詳細を出力します。
  # 
  # 例
  #     verbose              # 現在の状態を返します。
  #     verbose(v)           # 与えられた状態に変更します。
  #     verbose(v) { code }  # ブロックを評価する間だけ与えられた状態に変更します。
  #                          # ブロックの評価が終わると元の値に戻します。
  def verbose; end

  # --- when_writing(msg = nil){ ... }
  # 
  # [[m:RakeFileUtils.nowrite_flag]] が真である場合与えられたブロックを実行せずに、
  # 与えられたメッセージを表示します。
  # 
  # そうでない場合は、与えられたブロックを実行します。
  # 
  # @param msg 表示するメッセージを指定します。
  # 
  # 例:
  #   when_writing("Building Project") do
  #     project.build
  #   end
  def when_writing; end

  # --- nowrite_flag -> bool
  # 
  # この値が真の場合、実際のファイル書き込みをともなう操作は行いません。
  # そうでない場合、ファイル書き込みを行います。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # task default: :sample_file_task
  # 
  # file :sample_file_task do |t|
  #   RakeFileUtils.nowrite_flag # => false
  # end
  # //}
  def nowrite_flag; end

  # --- nowrite_flag=(flag)
  # 
  # 実際に動作を行うかどうか設定します。
  # 
  # @param flag 実際に動作を行うかどうかを指定します。真を指定すると動作を実行しません。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :sample_file_task
  # 
  # file :sample_file_task do |t|
  #   RakeFileUtils.nowrite_flag # => false
  #   RakeFileUtils.nowrite_flag = true
  #   RakeFileUtils.nowrite_flag # => true
  # end
  # //}
  def nowrite_flag=; end

  # --- verbose_flag -> bool
  # 
  # この値が真の場合、詳細を表示します。
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :sample_file_task
  # 
  # file :sample_file_task do |t|
  #   # --verbose で rake を実行する
  #   RakeFileUtils.verbose_flag # => true
  # end
  # //}
  def verbose_flag; end

  # --- verbose_flag=(flag)
  # 
  # 詳細を表示するかどうか設定します。
  # 
  # @param flag 詳細を表示するかどうか指定します。真を指定すると詳細を表示します。
  # 
  # 
  # //emlist[][ruby]{
  # # Rakefile での記載例とする
  # 
  # task default: :sample_file_task
  # 
  # file :sample_file_task do |t|
  #   # --verbose で rake を実行する
  #   p RakeFileUtils.verbose_flag # => true
  #   RakeFileUtils.verbose_flag = false
  #   p RakeFileUtils.verbose_flag # => false
  # end
  # //}
  def verbose_flag=; end

end
