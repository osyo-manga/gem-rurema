class PrettyPrint
  # --- breakable(sep = ' ')     -> ()
  # --- breakable(sep, width = sep.length)    -> ()
  # 
  # 「必要ならここで改行出来る」ということを自身に通知します。
  # もしその位置で改行されなければ、width カラムのテキスト sep が出力の際にそこに挿入されます。
  # 
  # @param sep 改行が起きなかった場合に挿入されるテキストを文字列で指定します。
  # 
  # @param width テキスト sep は width カラムであると仮定されます。指定されなければ、
  #              sep.length が利用されます。例えば sep が多バイト文字の際に指定する必要があるかも知れません。
  def breakable; end

  # --- flush     -> ()
  # 
  # バッファされたデータを出力します。
  def flush; end

  # --- genspace    -> Proc
  # 
  # 空白を生成する Proc を返します。
  def genspace; end

  # --- group(indent = 0, open_obj = '', close_obj = '', open_width = open_obj.length, close_width = close_obj.length){...}      -> ()
  # 
  # 与えられたブロックを実行します。
  # ブロック内で自身に追加される文字列やオブジェクトは、1行にまとめて表示しても
  # よい同じグループに属すると仮定されます。
  # 
  # もう少し詳しく説明します。pretty printing アルゴリズムはインデントと改行を、
  # ツリー構造を作ることによって決定します。そして、group メソッドは子ノードの作成と
  # 子ノードのインデントの深さの決定を担当します。
  # 
  # 同じノード内で呼ばれた breakable は、改行するならば全て同時に改行します。
  # 
  # @param indent グループのインデントの深さを指定します。
  # 
  # @param open_obj 指定された場合、self.text(open_obj, open_width) がブロックが
  #                 実行される前に呼ばれます。開き括弧などを出力するのに使用されます。
  # 
  # @param close_obj 指定された場合、self.text(close_obj, close_width) がブロックが
  #                  実行された後に呼ばれます。閉じ括弧などを出力するのに使用されます。
  # 
  # @param open_width open_obj のカラムを指定します。
  # 
  # @param close_width close_obj のカラムを指定します。
  def group; end

  # --- indent    -> Integer
  # 
  # 現在のインデントの深さを返します。
  def indent; end

  # --- maxwidth    -> Integer
  # 
  # 自身の幅を返します。
  def maxwidth; end

  # --- nest(indent) {...}     -> ()
  # 
  # 自身の現在のインデントを indent だけ増加させてから、ブロックを実行し、元に戻します。
  # 
  # @param indent インデントの増加分を整数で指定します。
  def nest; end

  # --- newline    -> String
  # 
  # 自身の改行文字を返します。
  def newline; end

  # --- output    -> object
  # 
  # 自身の output を返します。
  def output; end

  # --- text(obj)           -> ()
  # --- text(obj, width = obj.length)    -> ()
  # 
  # obj を width カラムのテキストとして自身に追加します。
  # 
  # @param obj 自身に追加するテキストを文字列で指定します。
  # 
  # @param width obj のカラムを指定します。指定されなかった場合、obj.length が利用されます。
  def text; end

  # --- format(output = '', maxwidth = 79, newline = "\n", genspace = lambda{|n| ' ' * n}) {|pp| ...}    -> object
  # PrettyPrint オブジェクトを生成し、それを引数としてブロックを実行します。
  # 与えられた output を返します。
  # 
  # 以下と同じ働きをするもので簡便のために用意されています。
  # 
  # //emlist[][ruby]{
  # require 'prettyprint'
  # 
  # begin
  #   pp = PrettyPrint.new(output, maxwidth, newline, &genspace)
  #   ...
  #   pp.flush
  #   output
  # end
  # //}
  # 
  # @param output 出力先を指定します。output は << メソッドを持っていなければなりません。
  # 
  # @param maxwidth 行の最大幅を指定します。ただし、改行できないものが渡された場合は、
  #                 実際の出力幅は maxwidth を越えることがあります。
  # 
  # @param newline 改行に使われます。
  # 
  # @param genspace 空白の生成に使われる [[c:Proc]] オブジェクトを指定します。
  #                 生成したい空白の幅を表す整数を引数として呼ばれます。
  def format; end

  # --- new(output = '', maxwidth = 79, newline = "\n")               -> PrettyPrint
  # --- new(output = '', maxwidth = 79, newline = "\n"){|width| ...}  -> PrettyPrint
  # 
  # pretty printing のためのバッファを生成します。
  # output は出力先です。output は << メソッドを持っていなければなりません。
  # << メソッドには
  #  * [[m:PrettyPrint#text]] の第1引数 obj
  #  * [[m:PrettyPrint#breakable]] の第1引数 sep
  #  * [[m:PrettyPrint.new]] の第3引数 newline
  #  * [[m:PrettyPrint.new]] に与えたブロックを評価した結果
  # のどれかひとつが引数として与えられます。
  # 
  # ブロックが指定された場合は、空白を生成するために使われます。ブロックは、生成したい空白の幅を表す整数を引数として呼ばれます。ブロックが指定されない場合は、空白を生成するために {|width| ' ' * width} が使われます。
  # 
  # @param output 出力先を指定します。output は << メソッドを持っていなければなりません。
  # 
  # @param maxwidth 行の最大幅を指定します。ただし、改行できないものが渡された場合は、実際の出力幅は maxwidth を越えることがあります。
  # 
  # @param newline 改行に使われます。
  def new; end

  # --- singleline_format(output = '', maxwidth = 79, newline = "\n", genspace = lambda{|n| ' ' * n}) {|pp| ...}    -> object
  # 
  # PrettyPrint オブジェクトを生成し、それを引数としてブロックを実行します。
  # [[m:PrettyPrint.format]] に似ていますが、改行しません。
  # 
  # 引数 maxwidth, newline と genspace は無視されます。ブロック中の breakable の実行は、
  # 改行せずに text の実行であるかのように扱います。
  # 
  # @param output 出力先を指定します。output は << メソッドを持っていなければなりません。
  # 
  # @param maxwidth 無視されます。
  # 
  # @param newline 無視されます。
  # 
  # @param genspace 無視されます。
  def singleline_format; end

end
