module RubyVM::AbstractSyntaxTree
  # --- of(proc) -> RubyVM::AbstractSyntaxTree::Node
  # 
  # 引数 proc に渡したProcやメソッドオブジェクトの抽象構文木を返します。
  # 
  # このメソッドはProcやメソッドが定義されたファイルを読み込む必要があるため、
  # irbのようなファイルを介さない対話的環境では動作しません。
  # 
  # @param proc Procもしくはメソッドオブジェクトを指定します。
  # 
  # //emlist[][ruby]{
  # pp RubyVM::AbstractSyntaxTree.of(proc {1 + 2})
  # # => (SCOPE@2:38-2:45
  # #     tbl: []
  # #     args: nil
  # #     body:
  # #       (OPCALL@2:39-2:44 (LIT@2:39-2:40 1) :+
  # #          (LIST@2:43-2:44 (LIT@2:43-2:44 2) nil)))
  # 
  # def hello
  #   puts "hello, world"
  # end
  # 
  # pp RubyVM::AbstractSyntaxTree.of(method(:hello))
  # # => (SCOPE@5:0-7:3
  # #     tbl: []
  # #     args:
  # #       (ARGS@5:9-5:9
  # #        pre_num: 0
  # #        pre_init: nil
  # #        opt: nil
  # #        first_post: nil
  # #        post_num: 0
  # #        post_init: nil
  # #        rest: nil
  # #        kw: nil
  # #        kwrest: nil
  # #        block: nil)
  # #     body:
  # #       (FCALL@6:2-6:21 :puts (LIST@6:7-6:21 (STR@6:7-6:21 "hello, world") nil)))
  # //}
  def of; end

  # --- parse(string) -> RubyVM::AbstractSyntaxTree::Node
  # 
  # 文字列を抽象構文木にパースし、その木の根ノードを返します。
  # 
  # @param string パースする対象の Ruby のコードを文字列で指定します。
  # @raise SyntaxError string が Ruby のコードとして正しくない場合に発生します。
  # 
  # //emlist[][ruby]{
  # pp RubyVM::AbstractSyntaxTree.parse("x = 1 + 2")
  # # => (SCOPE@1:0-1:9
  # #     tbl: [:x]
  # #     args: nil
  # #     body:
  # #       (LASGN@1:0-1:9 :x
  # #          (OPCALL@1:4-1:9 (LIT@1:4-1:5 1) :+ (LIST@1:8-1:9 (LIT@1:8-1:9 2) nil))))
  # //}
  def parse; end

  # --- parse_file(pathname) -> RubyVM::AbstractSyntaxTree::Node
  # 
  # pathname のファイルを読み込み、その内容を抽象構文木にパースし、その木の根ノードを返します。
  # 
  # @param pathname パースする対象のファイルパスを指定します
  # @raise SyntaxError string が Ruby のコードとして正しくない場合に発生します。
  # 
  # //emlist[][ruby]{
  # pp RubyVM::AbstractSyntaxTree.parse_file(__FILE__)
  # # => (SCOPE@1:0-1:50
  # #     tbl: []
  # #     args: nil
  # #     body:
  # #       (FCALL@1:0-1:50 :pp
  # #          (LIST@1:3-1:50
  # #             (CALL@1:3-1:50
  # #                (COLON2@1:3-1:29 (CONST@1:3-1:9 :RubyVM) :AbstractSyntaxTree)
  # #                :parse_file (LIST@1:41-1:49 (STR@1:41-1:49 "") nil)) nil)))
  # //}
  def parse_file; end

end
