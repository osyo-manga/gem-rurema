module OptionParser::Arguable
  # --- getopts(short_opt, *long_opt)    -> Hash
  # 
  # 指定された short_opt や long_opt に応じて自身をパースし、結果を Hash として返します。
  # 
  # コマンドラインに - もしくは -- を指定した場合、それ以降の解析を行ないません。
  # 
  # @param short_opt ショートネームのオプション(-f や -fx)を文字列で指定します。オプションが -f と -x の
  #                  2つの場合は "fx" の様に指定します。ここでオプションがないときは空文字列を指定します。
  #                  オプションが引数をとる場合は直後に ":" を付けます。
  # 
  # @param long_opt ロングネームのオプション(--version や --bufsize=512)を文字列で指定をします。
  #                 オプションが引数をとる場合は後ろに ":" を付けます。
  #                 オプションの引数のデフォルト値を ":" の直後に指定することができます。
  #                 例えば、"bufsize:1024" となります。
  # 
  # @raise OptionParser::ParseError 自身のパースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスの例外になります。
  # 
  # //emlist[t.rb][ruby]{
  # require 'optparse'
  # params = ARGV.getopts("ab:", "foo", "bar:", "bufsize:1024")
  # p params
  # //}
  # 
  #  # 実行結果
  #  $ ruby t.rb -b 1 --foo  --bar xxx -- -a
  #  {"bufsize"=>"1024", "a"=>false, "b"=>"1", "foo"=>true, "bar"=>"xxx"}  # "a"=>false であることに注意。
  def getopts; end

  # --- options                -> OptionParser
  # --- options{|opt| ... }    -> object | nil
  # 
  # 自身をパースするための [[c:OptionParser]] オブジェクトを返します。
  # 初回呼び出し時に自動的に生成されます。
  # この [[m:OptionParser#default_argv]] には self がセットされています。
  # 
  # ブロックを与えた場合は、[[c:OptionParser]] を引数としてブロックを実行します。
  # ブロックの実行結果を返します。
  # ブロックの実行途中で [[c:OptionParser::ParseError]]
  # が発生した場合は、全て rescue し、エラーメッセージを出力し、
  # nil を返します。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # 
  # o = nil
  # ARGV.options{|opt|
  #   opt.on('-a'){ o = true }
  #   opt.parse!
  # }
  # p o                         #=> true
  # //}
  def options; end

  # --- options=(opt)
  # 
  # 自身をパースするための [[c:OptionParser]] オブジェクトをセットします。
  # 
  # @param opt 自身をパースする [[c:OptionParser]] 、あるいは nil か false を指定します。
  #            nil か false である場合、自身の options= メソッドと options メソッドを
  #            undef します。
  def options=; end

  # --- order!               -> [String]
  # --- order!{|s| ... }     -> [String]
  # 
  # 自身を破壊的にパースし、パースされずに残った引数を文字列の配列として返します。
  # [[m:OptionParser#order!]] を参照して下さい。
  # 
  # @raise OptionParser::ParseError 自身のパースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスの例外になります。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # 
  # o = nil
  # ARGV.options.on('-a'){ o = true }
  # ARGV.order!
  # p o                                #=> true
  # //}
  def order!; end

  # --- parse!               -> [String]
  # 
  # 自身を破壊的にパースし、パースされずに残った引数を文字列の配列として返します。
  # [[m:OptionParser#parse!]] を参照して下さい。
  # 
  # @raise OptionParser::ParseError 自身のパースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスの例外になります。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # 
  # o = nil
  # ARGV.options.on('-a'){ o = true }
  # ARGV.parse!
  # p o                                #=> true
  # //}
  def parse!; end

  # --- permute!             -> [String]
  # 
  # 自身を破壊的にパースし、パースされずに残った引数を文字列の配列として返します。
  # [[m:OptionParser#permute!]] を参照して下さい。
  # 
  # @raise OptionParser::ParseError 自身のパースに失敗した場合、発生します。
  #                                 実際は OptionParser::ParseError のサブク
  #                                 ラスの例外になります。
  # 
  # //emlist[][ruby]{
  # require 'optparse'
  # 
  # o = nil
  # ARGV.options.on('-a'){ o = true }
  # ARGV.permute!
  # p o                                #=> true
  # //}
  def permute!; end

end
