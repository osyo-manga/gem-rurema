class NameError
  # --- local_variables -> [Symbol]
  # 
  # self が発生した時に定義されていたローカル変数名の一覧を返します。
  # 
  # 内部での使用に限ります。
  # 
  # 例:
  # 
  #   def foo
  #     begin
  #       b = "bar"
  #       c = 123
  #       d
  #     rescue NameError => err
  #       p err.local_variables #=> [:b, :c, :err]
  #     end
  #   end
  # 
  #   a = "buz"
  #   foo
  def local_variables; end

  # --- name -> Symbol
  # 
  # この例外オブジェクトを発生させる原因となった
  # 変数や定数、メソッドの名前をシンボルで返します。
  # 
  # 例:
  # 
  #   begin
  #     foobar
  #   rescue NameError => err
  #     p err       # => #<NameError: undefined local variable or method `foobar' for main:Object>
  #     p err.name  # => :foobar
  #   end
  def name; end

  # --- receiver -> object
  # 
  # self が発生した時のレシーバオブジェクトを返します。
  # 
  # 例:
  # 
  #   class Sample
  #     def foo
  #       return "foo"
  #     end
  #   end
  # 
  #   bar = Sample.new
  #   begin
  #     bar.bar
  #   rescue NameError => err
  #     p err.receiver  # => #<Sample:0x007fd4d89b3110>
  #     p err.receiver.foo  # => "foo"
  #   end
  def receiver; end

  # --- to_s -> String
  # 
  # 例外オブジェクトを文字列に変換して返します。
  # 
  # 例:
  # 
  #   begin
  #     foobar
  #   rescue NameError => err
  #     p err       # => #<NameError: undefined local variable or method `foobar' for main:Object>
  #     p err.to_s  # => "undefined local variable or method `foobar' for main:Object"
  #   end
  def to_s; end

  # --- new(error_message = "", name = nil) -> NameError
  # --- new(error_message = "", name = nil, receiver:) -> NameError
  # 
  # 例外オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列です
  # 
  # @param name 未定義だったシンボルです
  # 
  # @param receiver 原因となったメソッド呼び出しのレシーバです
  # 
  # 例:
  # 
  #   err = NameError.new("message", "foo")
  #   p err       # => #<NameError: message>
  #   p err.name  # => "foo"
  def new; end

end
