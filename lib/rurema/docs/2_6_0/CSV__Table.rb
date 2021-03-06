class CSV::Table
  # --- <<(row_or_array) -> self
  # 
  # 自身の最後に新しい行を追加します。
  # 
  # @param row_or_array [[c:CSV::Row]] のインスタンスか配列を指定します。
  #                     配列を指定した場合は [[c:CSV::Row]] に変換されます。
  # 
  # @return メソッドチェーンのために自身を返します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1])
  # table << row2
  # table.to_a # => [["header1", "header2"], ["row1_1", "row1_2"], ["row2_1", "row2_2"]]
  # //}
  def <<; end

  # --- ==(other) -> bool
  # 
  # 自身の全ての行が比較対象と同じである場合は真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param other [[c:CSV::Table]] を指定します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1_1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row1_2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # row2_1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2_2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table1 = CSV::Table.new([row1_1, row1_2])
  # table2 = CSV::Table.new([row2_1, row2_2])
  # table1 == table2 # => true
  # table2 << CSV::Row.new(["header1", "header2"], ["row3_1", "row3_2"])
  # table1 == table2 # => false
  # //}
  def ==; end

  # --- [](index_or_header) -> object
  # 
  # ミックスモードでは、このメソッドは引数に行番号を指定すれば行単位で動作
  # し、ヘッダの名前を指定すれば列単位で動作します。
  # 
  # このメソッドを呼び出す前に [[m:CSV::Table#by_col!]] を呼び出すとカラム
  # モードになります。また [[m:CSV::Table#by_row!]] を呼び出すとロウモード
  # になります。
  # 
  # @param index_or_header 行番号かヘッダの名前を指定します。
  # 
  # @return 値の配列を返します。この配列を変更しても元のデータには何の影響
  #         もありません。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table[0] # => #<CSV::Row "header1":"row1_1" "header2":"row1_2">
  # table[1] # => #<CSV::Row "header1":"row2_1" "header2":"row2_2">
  # table.by_col!
  # table[0] # => ["row1_1", "row2_1"]
  # table[1] # => ["row1_2", "row2_2"]
  # //}
  def []; end

  # --- []=(index_or_header, value)
  # 
  # ミックスモードでは、このメソッドは引数に行番号を指定すれば行単位で動作
  # し、ヘッダの名前を指定すれば列単位で動作します。
  # 
  # このメソッドを呼び出す前に [[m:CSV::Table#by_col!]] を呼び出すとカラム
  # モードになります。また [[m:CSV::Table#by_row!]] を呼び出すとロウモード
  # になります。
  # 
  # 行には配列か [[c:CSV::Row]] のインスタンスを指定します。
  # 
  # 列に値を一つだけ指定した場合は、全ての行にその値をコピーします。配列を
  # 指定した場合は、上から順に値を割り当てます。余分な値は無視します。また、
  # 値が不足している場合は nil を割り当てます。
  # 
  # 既存の行または列のデータを上書きします。
  # 新しい列を追加する場合は、右端に列を追加します。
  # 
  # @param index_or_header 行番号かヘッダの名前を指定します。
  # 
  # @param value 値を指定します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # row3 = CSV::Row.new(["header1", "header2"], ["row3_1", "row3_2"])
  # table = CSV::Table.new([row1, row2])
  # table[0] # => #<CSV::Row "header1":"row1_1" "header2":"row1_2">
  # table[1] # => #<CSV::Row "header1":"row2_1" "header2":"row2_2">
  # table[1] = row3
  # table[1] # => #<CSV::Row "header1":"row3_1" "header2":"row3_2">
  # table.by_col!
  # table[0] # => ["row1_1", "row3_1"]
  # table[1] # => ["row1_2", "row3_2"]
  # table[1] = ["row1_2", "row2_2"]
  # table[1] # => ["row1_2", "row2_2"]
  # //}
  def []=; end

  # --- by_col -> CSV::Table
  # 
  # カラムモードになっている新しい [[c:CSV::Table]] オブジェクトを返します。
  # 
  # 元のテーブルモードを変更せずにメソッドチェーンできるので便利です。しか
  # し、大きなデータセットに対しても同じだけメモリを消費するので気をつけて
  # ください。
  # 
  # このメソッドは複製したテーブルを返すので、破壊的なメソッドはメソッド
  # チェーンに組込まないようにしてください。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # col_table = table.by_col
  # col_table[0] # => ["row1_1", "row2_1"]
  # col_table[1] # => ["row1_2", "row2_2"]
  # //}
  def by_col; end

  # --- by_col! -> self
  # 
  # 自身をカラムモードに変更します。
  # 
  # 再びモードが変更されるまで、いくつかのメソッドはカラム単位で動きます。
  # 
  # @return 必ず自身を返すので安全にメソッドチェーンできます。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.by_col!
  # table[0] # => ["row1_1", "row2_1"]
  # table[1] # => ["row1_2", "row2_2"]
  # //}
  def by_col!; end

  # --- by_col_or_row -> CSV::Table
  # 
  # ミックスモードになっている新しい [[c:CSV::Table]] オブジェクトを返します。
  # 
  # 元のテーブルモードを変更せずにメソッドチェーンできるので便利です。しか
  # し、大きなデータセットに対しても同じだけメモリを消費するので気をつけて
  # ください。
  # 
  # このメソッドは複製したテーブルを返すので、破壊的なメソッドはメソッド
  # チェーンに組込まないようにしてください。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2]).by_col!
  # table             # => #<CSV::Table mode:col row_count:3>
  # col_or_row_table = table.by_col_or_row
  # col_or_row_table  # => #<CSV::Table mode:col_or_row row_count:3>
  # table             # => #<CSV::Table mode:col row_count:3>
  # //}
  def by_col_or_row; end

  # --- by_col_or_row! -> self
  # 
  # 自身をミックスモードに変更します。
  # 
  # 再びモードが変更されるまで、いくつかのメソッドはミックスモードで動きます。
  # 
  # デフォルトのミックスモードではインデックスによるアクセスは行単位での参
  # 照であると見なします。しかし、他の方法ではヘッダによる列単位での参照で
  # あると見なします。
  # 
  # @return 必ず自身を返すので安全にメソッドチェーンできます。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2]).by_col!
  # table             # => #<CSV::Table mode:col row_count:3>
  # table.by_col_or_row!
  # table             # => #<CSV::Table mode:col_or_row row_count:3>
  # //}
  def by_col_or_row!; end

  # --- by_row -> CSV::Table
  # 
  # ロウモードになっている新しい [[c:CSV::Table]] オブジェクトを返します。
  # 
  # 元のテーブルモードを変更せずにメソッドチェーンできるので便利です。しか
  # し、大きなデータセットに対しても同じだけメモリを消費するので気をつけて
  # ください。
  # 
  # このメソッドは複製したテーブルを返すので、破壊的なメソッドはメソッド
  # チェーンに組込まないようにしてください。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table         # => #<CSV::Table mode:col_or_row row_count:3>
  # row_table = table.by_row  # => #<CSV::Table mode:row row_count:3>
  # row_table[0] # => #<CSV::Row "header1":"row1_1" "header2":"row1_2">
  # row_table[1] # => #<CSV::Row "header1":"row2_1" "header2":"row2_2">
  # //}
  def by_row; end

  # --- by_row! -> self
  # 
  # 自身をロウモードに変更します。
  # 
  # 再びモードが変更されるまで、いくつかのメソッドは行単位で動きます。
  # 
  # @return 必ず自身を返すので安全にメソッドチェーンできます。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table         # => #<CSV::Table mode:col_or_row row_count:3>
  # table.by_row!
  # table         # => #<CSV::Table mode:row row_count:3>
  # table[0] # => #<CSV::Row "header1":"row1_1" "header2":"row1_2">
  # table[1] # => #<CSV::Row "header1":"row2_1" "header2":"row2_2">
  # //}
  def by_row!; end

  # --- delete(index_or_header) -> object
  # 
  # 指定された行か列を削除して返します。
  # 
  # デフォルトのミックスモードではインデックスによるアクセスは行単位での参
  # 照であると見なします。しかし、他の方法ではヘッダによる列単位での参照で
  # あると見なします。
  # 
  # 探索方法を変更したい場合は [[m:CSV::Table#by_col!]],
  # [[m:CSV::Table#by_row!]] を使用してください。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.delete(1)
  # table.to_a         # => [["header1", "header2"], ["row1_1", "row1_2"]]
  # //}
  # 
  # @see [[m:CSV::Table#by_col!]], [[m:CSV::Table#by_row!]], [[m:CSV::Table#delete_if]]
  def delete; end

  # --- delete_if{|row| ... } -> self
  # --- delete_if{|column_name, values| ... } -> self
  # 
  # ブロックを評価した結果が真である行か列を削除します。
  # 
  # デフォルトのミックスモードかロウモードでは、行単位で繰り返します。カラ
  # ムモードでは、ブロックに列名と対応する値の配列を与え、列単位で繰り返し
  # ます。
  # 
  # //emlist[例 ロウモード][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "valid"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "invalid"])
  # row3 = CSV::Row.new(["header1", "header2"], ["row3_1", "valid"])
  # table = CSV::Table.new([row1, row2, row3])
  # table.delete_if { |row| row["header2"] == "invalid" }
  # table.to_a # => [["header1", "header2"], ["row1_1", "valid"], ["row3_1", "valid"]]
  # //}
  # 
  # //emlist[例 カラムモード][ruby]{
  # require "csv"
  # row1 = CSV::Row.new(["id", "name"], [1, "tanaka"])
  # row2 = CSV::Row.new(["id", "name"], [2, "suzuki"])
  # row3 = CSV::Row.new(["id", "name"], [3, "sato"])
  # table = CSV::Table.new([row1, row2, row3])
  # table.by_col!
  # table.delete_if { |column_name, values| column_name == "id" }
  # table.to_a # => [["name"], ["tanaka"], ["suzuki"], ["sato"]]
  # //}
  # 
  # @see [[m:CSV::Table#delete]]
  def delete_if; end

  # --- each{|row| ... } -> self
  # --- each{|column_name, values| ... } -> self
  # 
  # デフォルトのミックスモードかロウモードでは、行単位で繰り返します。カラ
  # ムモードでは、ブロックに列名と対応する値の配列を与え、列単位で繰り返し
  # ます。
  # 
  # //emlist[例 ロウモード][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # row3 = CSV::Row.new(["header1", "header2"], ["row3_1", "row3_2"])
  # table = CSV::Table.new([row1, row2, row3])
  # table.each { |row| p row }
  # 
  # # => #<CSV::Row "header1":"row1_1" "header2":"row1_2">
  # # => #<CSV::Row "header1":"row2_1" "header2":"row2_2">
  # # => #<CSV::Row "header1":"row3_1" "header2":"row3_2">
  # //}
  # 
  # //emlist[例 カラムモード][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # row3 = CSV::Row.new(["header1", "header2"], ["row3_1", "row3_2"])
  # table = CSV::Table.new([row1, row2, row3])
  # table.by_col!
  # table.each { |column_name, values| print column_name, values, "\n" }
  # 
  # # => header1["row1_1", "row2_1", "row3_1"]
  # # => header2["row1_2", "row2_2", "row3_2"]
  # //}
  def each; end

  # --- empty? -> bool
  # 
  # [[m:Array#empty?]] に委譲します。
  # 
  # 
  # @see [[m:Array#empty?]]
  def empty?; end

  # --- headers -> Array
  # 
  # 自身のヘッダ行を返します。
  # 
  # テーブルが空である場合は空の配列を返します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # table = CSV::Table.new([row])
  # table.headers # => ["header1", "header2"]
  # //}
  def headers; end

  # --- inspect -> String
  # 
  # モードとサイズを US-ASCII な文字列で返します。
  # 
  # 例:
  #   require 'csv'
  #   csv = CSV.new("a,b,c\n1,2,3", headers: true)
  #   table = csv.read
  #   table.inspect # => "#<CSV::Table mode:col_or_row row_count:2>"
  def inspect; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # [[m:Array#length]], [[m:Array#size]] に委譲します。
  # 
  # 
  # @see [[m:Array#length]], [[m:Array#size]]
  def length; end

  # --- mode -> Symbol
  # 
  # 現在のアクセスモードを返します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # table = CSV::Table.new([row])
  # table.mode    # => :col_or_row
  # table.by_col!
  # table.mode    # => :col
  # //}
  def mode; end

  # --- push(*rows) -> self
  # 
  # 複数の行を追加するためのショートカットです。
  # 
  # @param rows [[c:CSV::Row]] のインスタンスか配列を指定します。
  # 
  # 以下と同じです。
  #   require 'csv'
  #   csv = CSV.new("a,b,c\n,1,2,3", headers: true)
  #   table = csv.read
  #   rows = [[4, 5, 6], [7, 8, 9]]
  #   rows.each{|row| table << row }
  def push; end

  # --- table -> Array
  # 
  # 同値性を比較するために内部的に使用します。
  def table; end

  # --- to_a -> [Array]
  # 
  # 配列の配列を返します。
  # 
  # 一番目の要素はヘッダで、残りの要素はデータを表わします。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.to_a # => [["header1", "header2"], ["row1_1", "row1_2"], ["row2_1", "row2_2"]]
  # //}
  def to_a; end

  # --- to_csv(options = Hash.new) -> String
  # --- to_s(options = Hash.new) -> String
  # 
  # CSV の文字列に変換して返します。
  # 
  # ヘッダを一行目に出力します。その後に残りのデータを出力します。
  # 
  # デフォルトでは、ヘッダを出力します。オプションに :write_headers =>
  # false を指定するとヘッダを出力しません。
  # 
  # 例:
  #   require 'csv'
  #   csv = CSV.new("a,b,c\n,1,2,3", headers: true)
  #   table = csv.read
  #   table.to_csv                       # => "a,b,c\n1,2,3\n"
  #   table.to_csv(write_headers: false) # => "1,2,3\n"
  def to_csv; end

  # --- values_at(indices_or_headers) -> Array
  # 
  # デフォルトのミックスモードでは、インデックスのリストを与えると行単位の
  # 参照を行い、行の配列を返します。他の方法は列単位の参照と見なします。行
  # 単位の参照では、返り値は行ごとの配列を要素に持つ配列です。
  # 
  # 探索方法を変更したい場合は [[m:CSV::Table#by_col!]],
  # [[m:CSV::Table#by_row!]] を使用してください。
  # 
  # アクセスモードを混在させることはできません。
  # 
  # //emlist[例 ロウモード][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.values_at(1) # => [#<CSV::Row "header1":"row2_1" "header2":"row2_2">]
  # //}
  # 
  # //emlist[例 カラムモード][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.by_col!
  # table.values_at(1) # => [["row1_2"], ["row2_2"]]
  # //}
  # 
  # @see [[m:CSV::Table#by_col!]], [[m:CSV::Table#by_row!]]
  def values_at; end

  # --- new(array_of_rows) -> CSV::Table
  # 
  # 自身を初期化します。
  # 
  # 全ての行が同じヘッダを持つことを仮定しています。
  # 
  # @param array_of_rows [[c:CSV::Row]] のインスタンスの配列を指定します。
  # 
  # //emlist[例][ruby]{
  # require "csv"
  # 
  # row1 = CSV::Row.new(["header1", "header2"], ["row1_1", "row1_2"])
  # row2 = CSV::Row.new(["header1", "header2"], ["row2_1", "row2_2"])
  # table = CSV::Table.new([row1, row2])
  # table.to_a # => [["header1", "header2"], ["row1_1", "row1_2"], ["row2_1", "row2_2"]]
  # //}
  def new; end

end
