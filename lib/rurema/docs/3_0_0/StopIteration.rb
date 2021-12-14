class StopIteration
  # --- result -> object
  # 
  # この例外オブジェクトを発生させる原因となったメソッド等の返り値を返します。
  # 
  #   object = Object.new
  #   def object.each
  #     yield :yield1
  #     yield :yield2
  #     :each_returned
  #   end
  # 
  #   enumerator = object.to_enum
  #   
  #   p enumerator.next #=> :yield1
  #   p enumerator.next #=> :yield2
  # 
  #   begin
  #     enumerator.next
  #   rescue StopIteration => error
  #     p error.result #=> :each_returned
  #   end
  def result; end

end
