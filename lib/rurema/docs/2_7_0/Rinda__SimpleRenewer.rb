class Rinda::SimpleRenewer
  # --- renew -> Integer
  # [[c:TupleSpace]] からオブジェクトの寿命を問合せるために呼び出されます。
  # 
  # このメソッド自体は [[m:Rinda::SimpleRenewer.new]] で指定した秒数を
  # 返します。
  def renew; end

  # --- new(sec = 180) -> Rinda::SimpleRenewer
  # 新たな SimpleRenewer オブジェクトを生成します。
  # 
  # sec で [[m:Rinda::SimpleRenewer#renew]] が返す秒数を指定します。
  # @param sec renew が返す秒数
  def new; end

end
