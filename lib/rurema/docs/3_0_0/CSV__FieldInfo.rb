class CSV::FieldInfo
  # --- header -> String | nil
  # 
  # 利用可能な場合はヘッダを表す文字列を返します。
  # 
  # //emlist[例][ruby]{
  # require 'csv'
  # 
  # csv = CSV.new("date1,date2\n2018-07-09,2018-07-10", headers: true)
  # csv.convert do |field,field_info|
  #   p field_info.header
  #   Date.parse(field)
  # end
  # p csv.first
  # 
  # # => "date1"
  # # => "date2"
  # # => #<CSV::Row "date1":#<Date: 2018-07-09 ((2458309j,0s,0n),+0s,2299161j)> "date2":#<Date: 2018-07-10 ((2458310j,0s,0n),+0s,2299161j)>>
  # //}
  def header; end

  # --- header=(val)
  # 
  # ヘッダを表す文字列をセットします。
  # 
  # @param val ヘッダを表す文字列を指定します。
  def header=; end

  # --- index -> Integer
  # 
  # 行内で何番目のフィールドかわかるゼロベースのインデックスを返します。
  # 
  # //emlist[例][ruby]{
  # require 'csv'
  # 
  # csv = CSV.new("date1,date2\n2018-07-09,2018-07-10", headers: true)
  # csv.convert do |field,field_info|
  #   p field_info.index
  #   Date.parse(field)
  # end
  # p csv.first
  # 
  # # => 0
  # # => 1
  # # => #<CSV::Row "date1":#<Date: 2018-07-09 ((2458309j,0s,0n),+0s,2299161j)> "date2":#<Date: 2018-07-10 ((2458310j,0s,0n),+0s,2299161j)>>
  # //}
  def index; end

  # --- index=(val)
  # 
  # インデックスの値をセットします。
  # 
  # @param val インデックスの値を指定します。
  def index=; end

  # --- line -> Integer
  # 
  # 行番号を返します。
  # 
  # //emlist[例][ruby]{
  # require 'csv'
  # 
  # csv = CSV.new("date1,date2,date3\n2018-07-09,2018-07-10\n2018-08-09,2018-08-10", headers: true)
  # csv.convert do |field,field_info|
  #   p field_info.line
  #   Date.parse(field)
  # end
  # p csv.to_a
  # 
  # # => 2
  # # => 2
  # # => 3
  # # => 3
  # # => [#<CSV::Row "date1":#<Date: 2018-07-09 ((2458309j,0s,0n),+0s,2299161j)> "date2":#<Date: 2018-07-10 ((2458310j,0s,0n),+0s,2299161j)> "date3":nil>, ...]
  # //}
  def line; end

  # --- line=(val)
  # 
  # 行番号をセットします。
  # 
  # @param val 行番号を指定します。
  def line=; end

end
