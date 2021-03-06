class LoadError
  # --- path -> String | nil
  # 
  # [[m:Kernel.#require]] や [[m:Kernel.#load]] に失敗したパスを返します。
  # 
  #   begin
  #     require 'this/file/does/not/exist'
  #   rescue LoadError => e
  #     e.path # => 'this/file/does/not/exist'
  #   end
  # 
  # パスが定まらない場合は nil を返します。
  def path; end

end
