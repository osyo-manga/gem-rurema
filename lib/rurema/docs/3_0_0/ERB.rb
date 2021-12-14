class ERB
  # --- def_class(superklass=Object, methodname='erb') -> Class
  # 
  # 変換した Ruby スクリプトをメソッドとして定義した無名のクラスを返します。
  # 
  #  
  # @param superklass 無名クラスのスーパークラス
  # 
  # @param methodname メソッド名
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # 
  # class MyClass_
  #   def initialize(arg1, arg2)
  #     @arg1 = arg1;  @arg2 = arg2
  #   end
  # end
  # filename = 'example.rhtml'  # @arg1 と @arg2 が使われている example.rhtml
  # 
  # erb = ERB.new(File.read(filename))
  # erb.filename = filename
  # MyClass = erb.def_class(MyClass_, 'render()')
  # print MyClass.new('foo', 123).render()
  # 
  # # => test1foo
  # #    test2123
  # //}
  def def_class; end

  # --- def_method(mod, methodname, fname='(ERB)') -> nil
  # 
  # 変換した Ruby スクリプトをメソッドとして定義します。
  # 
  # 定義先のモジュールは mod で指定し、メソッド名は methodname で指定します。
  # fname はスクリプトを定義する際のファイル名です。主にエラー時に活躍します。
  # 
  # @param mod メソッドを定義するモジュール（またはクラス）
  # 
  # @param methodname メソッド名
  # 
  # @param fname スクリプトを定義する際のファイル名
  # 
  # 例:
  # 
  #   require 'erb'
  #   erb = ERB.new(script)
  #   erb.def_method(MyClass, 'foo(bar)', 'foo.erb')
  def def_method; end

  # --- def_module(methodname='erb') -> Module
  # 
  # 変換した Ruby スクリプトをメソッドとして定義した無名のモジュールを返します。
  # 
  # @param methodname メソッド名
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # filename = 'example.rhtml'
  # erb = ERB.new("test1<%= arg1 %>\ntest2<%= arg2 %>\n")
  # erb.filename = filename
  # MyModule = erb.def_module('render(arg1, arg2)')
  # class MyClass
  #   include MyModule
  # end
  # print MyClass.new.render('foo', 123)
  # # test1foo
  # # test2123
  # //}
  def def_module; end

  # --- filename -> String
  # 
  # エラーメッセージを表示する際のファイル名を取得します。
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # filename = 'example.rhtml'
  # erb = ERB.new(File.read(filename))
  # erb.filename # => nil
  # erb.filename = filename
  # erb.filename # =>"example.rhtml"
  # //}
  def filename; end

  # --- filename= -> String
  # 
  # エラーメッセージを表示する際のファイル名を設定します。
  # 
  # filename を設定しておくことにより、エラーが発生した eRuby スクリプトの特定が容易になります。filename を設定していない場合は、エラー発生箇所は「 (ERB) 」という出力となります。
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # filename = 'example.rhtml'
  # erb = ERB.new(File.read(filename))
  # erb.filename # => nil
  # erb.filename = filename
  # erb.filename # =>"example.rhtml"
  # //}
  def filename=; end

  # --- result(b=TOPLEVEL_BINDING) -> String
  # 
  # ERB を b の binding で実行し、結果の文字列を返します。
  # 
  # @param b eRubyスクリプトが実行されるときのbinding
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # erb = ERB.new("test <%= test1 %>\ntest <%= test2 %>\n")
  # test1 = "foo"
  # test2 = "bar"
  # puts erb.result
  # # test foo
  # # test bar
  # //}
  # 
  # @see [[m:ERB#result_with_hash]]
  def result; end

  # --- result_with_hash(hash) -> String
  # 
  # ERB をハッシュオブジェクトで指定されたローカル変数を持つ
  # 新しいトップレベルバインディングで実行し、結果の文字列を返します。
  # 
  # @param hash ローカル変数名をキーにしたハッシュ
  # 
  # @see [[m:ERB#result]]
  def result_with_hash; end

  # --- run(b=TOPLEVEL_BINDING) -> nil
  # 
  # ERB を b の binding で実行し、結果を標準出力へ印字します。
  # 
  # @param b eRubyスクリプトが実行されるときのbinding
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # erb = ERB.new("test <%= test1 %>\ntest <%= test2 %>\n")
  # test1 = "foo"
  # test2 = "bar"
  # erb.run
  # # test foo
  # # test bar
  # //}
  def run; end

  # --- set_eoutvar(compiler, eoutvar = '_erbout') -> Array
  # 
  # ERBの中でeRubyスクリプトの出力をためていく変数を設定します。
  # 
  # ERBでeRubyスクリプトの出力をためていく変数を設定するために使用します。
  # この設定は ERB#new でも行えるため、通常はそちらを使用した方がより容易です。
  # 本メソッドを使用するためには、引数にて指定する eRuby コンパイラを事前に生成しておく必要があります。
  # 
  # @param compiler eRubyコンパイラ
  # 
  # @param eoutvar eRubyスクリプトの中で出力をためていく変数
  def set_eoutvar; end

  # --- src -> String
  # 
  # 変換した Ruby スクリプトを取得します。
  # 
  # //emlist[例][ruby]{
  # require 'erb'
  # erb = ERB.new("test1<%= @arg1%>\ntest2<%= @arg2%>\n\n")
  # puts erb.src
  # 
  # # #coding:UTF-8
  # # _erbout = +''; _erbout.<< "test1".freeze; _erbout.<<(( @arg1).to_s); _erbout.<< "\ntest2".freeze
  # # ; _erbout.<<(( @arg2).to_s); _erbout.<< "\n\n".freeze
  # #
  # # ; _erbout
  # //}
  def src; end

  # --- new(str, safe_level=NOT_GIVEN, trim_mode=NOT_GIVEN, eoutvar=NOT_GIVEN, trim_mode: nil, eoutvar: '_erbout') -> ERB
  # 
  # eRubyスクリプト から ERB オブジェクトを生成して返します。
  # 
  # @param str eRubyスクリプトを表す文字列
  # 
  # @param safe_level eRubyスクリプトが実行されるときのセーフレベル
  # 
  # @param trim_mode 整形の挙動を変更するオプション
  # 
  # @param eoutvar eRubyスクリプトの中で出力をためていく変数の名前を表す文
  #                字列。eRuby スクリプトの中でさらに ERB を使うときに変更
  #                します。通常は指定する必要はありません。
  # 
  # Ruby 2.6.0 から位置引数での safe_level, trim_mode, eoutvar の指定は非推奨です。
  # Ruby 2.5 が EOL になったときに削除される予定です。
  # trim_mode と eoutvar の指定はキーワード引数に移行してください。
  # 
  # //emlist[例][ruby]{
  # require "erb"
  # 
  # # build data class
  # class Listings
  #   PRODUCT = { :name => "Chicken Fried Steak",
  #               :desc => "A well messages pattie, breaded and fried.",
  #               :cost => 9.95 }
  # 
  #   attr_reader :product, :price
  # 
  #   def initialize( product = "", price = "" )
  #     @product = product
  #     @price = price
  #   end
  # 
  #   def build
  #     b = binding
  #     # create and run templates, filling member data variables
  #     ERB.new(<<-'END_PRODUCT'.gsub(/^\s+/, ""), eoutvar: "@product").result b
  #       <%= PRODUCT[:name] %>
  #       <%= PRODUCT[:desc] %>
  #     END_PRODUCT
  #     ERB.new(<<-'END_PRICE'.gsub(/^\s+/, ""), eoutvar: "@price").result b
  #       <%= PRODUCT[:name] %> -- <%= PRODUCT[:cost] %>
  #       <%= PRODUCT[:desc] %>
  #     END_PRICE
  #   end
  # end
  # 
  # # setup template data
  # listings = Listings.new
  # listings.build
  # 
  # puts listings.product + "\n" + listings.price
  # 
  # # Chicken Fried Steak
  # # A well messages pattie, breaded and fried.
  # # 
  # # Chicken Fried Steak -- 9.95
  # # A well messages pattie, breaded and fried.
  # //}
  def new; end

  # --- version -> String
  # 
  # erb.rbのリビジョン情報を返します。
  def version; end

end
