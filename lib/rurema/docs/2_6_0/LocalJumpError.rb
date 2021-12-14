class LocalJumpError
  # --- exit_value -> object
  # 
  # 例外 LocalJumpError を発生する原因となった
  # break や return に渡した値を返します。
  # 
  # 例:
  # 
  #   def foo
  #     proc { return 10 }
  #   end
  #   
  #   begin
  #     foo.call
  #   rescue LocalJumpError => err
  #     p err              # => #<LocalJumpError: return from block-closure>
  #     p err.reason       # => :return
  #     p err.exit_value   # => 10
  #   end
  # 
  #   begin
  #     Block.new { break 5 }.call
  #   rescue LocalJumpError => err
  #     p err              # => #<LocalJumpError: break from block-closure>
  #     p err.reason       # => :break
  #     p err.exit_value   # => 5
  #   end
  def exit_value; end

  # --- reason -> Symbol
  # 
  # 例外を発生させた原因をシンボルで返します。
  # 
  # 返す値は以下のいずれかです。
  # 
  #   * :break
  #   * :redo
  #   * :retry
  #   * :next
  #   * :return
  # 
  # 例:
  # 
  #   def foo
  #     proc { return 10 }
  #   end
  #   
  #   begin
  #     foo.call
  #   rescue LocalJumpError => err
  #     p err              # => #<LocalJumpError: return from block-closure>
  #     p err.reason       # => :return
  #     p err.exit_value   # => 10
  #   end
  # 
  #   begin
  #     Block.new { break 5 }.call
  #   rescue LocalJumpError => err
  #     p err              # => #<LocalJumpError: break from block-closure>
  #     p err.reason       # => :break
  #     p err.exit_value   # => 5
  #   end
  def reason; end

end
