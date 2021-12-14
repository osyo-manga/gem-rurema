class UncaughtThrowError
  # --- tag -> object
  # 
  # [[m:Kernel.#throw]] に指定した tag を返します。
  # 
  # //emlist[例:][ruby]{
  # def do_complicated_things
  #   throw :uncaught_label
  # end
  # 
  # begin
  #   do_complicated_things
  # rescue UncaughtThrowError => ex
  #   p ex.tag # => ":uncaught_label"
  # end
  # //}
  def tag; end

  # --- to_s -> String
  # 
  # self を tag を含む文字列表現にして返します。
  # 
  # //emlist[例][ruby]{
  # def do_complicated_things
  #   throw :uncaught_label
  # end
  # 
  # begin
  #   do_complicated_things
  # rescue UncaughtThrowError => ex
  #   p ex.to_s # => "uncaught throw :uncaught_label"
  # end
  # //}
  def to_s; end

  # --- value -> object
  # 
  # [[m:Kernel.#throw]] に指定した value を返します。
  # 
  # //emlist[例][ruby]{
  # def do_complicated_things
  #   throw :uncaught_label, "uncaught_value"
  # end
  # 
  # begin
  #   do_complicated_things
  # rescue UncaughtThrowError => ex
  #   p ex.value # => "uncaught_value"
  # end
  # //}
  def value; end

end
