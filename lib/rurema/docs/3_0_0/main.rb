class main
  # --- define_method(name, method) -> Symbol
  # --- define_method(name) { ... } -> Symbol
  # 
  # インスタンスメソッド name を [[c:Object]] に定義します。
  # 
  # ブロックを与えた場合、定義したメソッドの実行時にブロックが
  # [[c:Object]] インスタンスの上で [[m:BasicObject#instance_eval]] されます。
  # 
  # @param name [[c:String]] または [[c:Symbol]] を指定します。
  # 
  # @param method [[c:Proc]]、[[c:Method]] あるいは [[c:UnboundMethod]] の
  #               いずれかのインスタンスを指定します。
  # 
  # @return メソッド名を表す [[c:Symbol]] を返します。
  # 
  # @raise TypeError method に同じクラス、サブクラス以外のメソッドを指定し
  #                  た場合に発生します。
  # 
  # 
  # @see [[m:Module#define_method]]
  def define_method; end

  # --- include(*modules) -> self
  # 
  # 引数 modules で指定したモジュールを後ろから順番にインクルードします。
  # 
  # @param modules [[c:Module]] のインスタンス( [[c:Enumerable]] など)を指定します。
  # 
  # @raise ArgumentError 継承関係が循環してしまうような include を行った場
  #                      合に発生します。
  # 
  # //emlist[例:][ruby]{
  # include Math
  # 
  # hypot(3, 4)  # => 5.0
  # //}
  # 
  # @see [[m:Module#include]]
  def include; end

  # --- to_s    -> "main"
  # --- inspect -> "main"
  # 
  # "main" を返します。
  def inspect; end

  # --- private(*name) -> Object
  # --- private(names) -> Object
  # 
  # メソッドを private に設定します。
  # 
  # 引数が与えられた時には引数によって指定されたメソッドを private に
  # 設定します。
  # 
  # 引数なしのときは今後このクラスまたはモジュール定義内で新規に定義さ
  # れるメソッドを関数形式でだけ呼び出せるように(private)設定します。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # @param names 0 個以上の [[c:String]] または [[c:Symbol]] を [[c:Array]] で指定します。
  # 
  # @raise NameError 存在しないメソッド名を指定した場合に発生します。
  # 
  # 
  # @see [[m:Module#private]]
  def private; end

  # --- public(*name) -> Object
  # --- public(names) -> Object
  # 
  # メソッドを public に設定します。
  # 
  # 引数なしのときは今後このクラスまたはモジュール定義内で新規に定義さ
  # れるメソッドをどんな形式でも呼び出せるように(public)設定します。
  # 
  # 引数が与えられた時には引数によって指定されたメソッドを public に設
  # 定します。
  # 
  # @param name  0 個以上の [[c:String]] または [[c:Symbol]] を指定します。
  # @param names 0 個以上の [[c:String]] または [[c:Symbol]] を [[c:Array]] で指定します。
  # 
  # @raise NameError 存在しないメソッド名を指定した場合に発生します。
  # 
  # 
  # @see [[m:Module#public]]
  def public; end

  # --- using(module) -> self
  # 
  # 引数で指定したモジュールで定義された拡張を有効にします。
  # 
  # 有効にした拡張の有効範囲については以下を参照してください。
  # 
  #  * [[url:https://docs.ruby-lang.org/en/master/doc/syntax/refinements_rdoc.html#label-Scope]]
  # 
  # @param module 有効にするモジュールを指定します。
  # 
  # //emlist[例][ruby]{
  # module Sloth
  #   refine String do
  #     def downcase
  #       self
  #     end
  #   end
  # end
  # 
  # "ABC".downcase # => "abc"
  # 
  # using Sloth
  # 
  # "ABC".downcase # => "ABC"
  # //}
  # 
  # @see [[m:Module#refine]], [[m:Module#using]]
  def using; end

end
