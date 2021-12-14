module Forwardable
  # --- def_instance_delegator(accessor, method, ali = method) -> ()
  # --- def_delegator(accessor, method, ali = method)          -> ()
  # 
  # メソッドの委譲先を設定します。
  # 
  # @param accessor 委譲先のオブジェクト
  # 
  # @param method 委譲先のメソッド
  # 
  # @param ali 委譲元のメソッド
  # 
  # 委譲元のオブジェクトで ali が呼び出された場合に、
  # 委譲先のオブジェクトの method へ処理が委譲されるようになります。
  # 
  # 委譲元と委譲先のメソッド名が同じ場合は, ali を省略することが可能です。
  # 
  # def_delegator は def_instance_delegator の別名になります。
  # 
  # 例:
  # 
  #   require 'forwardable'
  #   class MyQueue
  #     extend Forwardable
  #     attr_reader :queue
  #     def initialize
  #       @queue = []
  #     end
  # 
  #     def_delegator :@queue, :push, :mypush
  #   end
  # 
  #   q = MyQueue.new
  #   q.mypush 42
  #   q.queue    # => [42]
  #   q.push 23  # => NoMethodError
  # 
  # @see [[m:Forwardable#def_delegators]]
  def def_delegator; end

  # --- def_instance_delegators(accessor, *methods) -> ()
  # --- def_delegators(accessor, *methods)          -> ()
  # 
  # メソッドの委譲先をまとめて設定します。
  # 
  # @param accessor 委譲先のオブジェクト
  # 
  # @param methods 委譲するメソッドのリスト
  # 
  # 委譲元のオブジェクトで methods のそれぞれのメソッドが呼び出された場合に、
  # 委譲先のオブジェクトの同名のメソッドへ処理が委譲されるようになります。
  # 
  # def_delegators は def_instance_delegators の別名になります。
  # 
  # また、以下の 2 つの例は同じ意味です。
  # 
  #   def_delegators :@records, :size, :<<, :map
  # 
  #   def_delegator :@records, :size
  #   def_delegator :@records, :<<
  #   def_delegator :@records, :map
  # 
  # @see [[m:Forwardable#def_delegator]]
  def def_delegators; end

  # --- instance_delegate(hash) -> ()
  # --- delegate(hash)          -> ()
  # 
  # メソッドの委譲先を設定します。
  # 
  # @param hash 委譲先のメソッドがキー、委譲先のオブジェクトが値の
  #             [[c:Hash]] を指定します。キーは [[c:Symbol]]、
  #             [[c:String]] かその配列で指定します。
  # 
  # 
  # 例:
  # 
  #   require 'forwardable'
  #   class Zap
  #      extend Forwardable
  #      delegate :length => :@str
  #      delegate [:first, :last] => :@arr
  #      def initialize
  #         @arr = %w/foo bar baz/
  #         @str = "world"
  #      end
  #   end
  # 
  #   zap = Zap.new
  #   zap.length # => 5
  #   zap.first  # => "foo"
  #   zap.last   # => "baz"
  def delegate; end

  # --- debug -> bool
  # 
  # 委譲部分をバックトレースに含めるかどうかの状態を返します。
  # 
  # バックトレースを含める設定となっている時、真を返します。
  # デフォルトは含めない設定となっています。
  def debug; end

  # --- debug= -> bool
  # 
  # 委譲部分をバックトレースに含めるかどうかの状態を設定します。
  def debug=; end

  # --- FORWARDABLE_VERSION -> "1.1.0"
  # 
  # [[lib:forwardable]] ライブラリのバージョンを返します。
  def FORWARDABLE_VERSION; end

end
