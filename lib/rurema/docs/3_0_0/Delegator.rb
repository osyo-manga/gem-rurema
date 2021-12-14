class Delegator
  # --- ! -> bool
  # 
  # 自身を否定します。
  def !; end

  # --- !=(obj) -> bool
  # 
  # 自身が与えられたオブジェクトと等しくない場合は、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param obj 比較対象のオブジェクトを指定します。
  def !=; end

  # --- ==(obj) -> bool
  # 
  # 自身が与えられたオブジェクトと等しい場合は、真を返します。
  # そうでない場合は、偽を返します。
  # 
  # @param obj 比較対象のオブジェクトを指定します。
  def ==; end

  # --- __getobj__ -> object
  # 
  # 委譲先のオブジェクトを返します。
  # 
  # 本メソッドは、サブクラスで再定義する必要があり、
  # デフォルトでは [[c:NotImplementedError]] が発生します。
  # 
  # @raise NotImplementedError サブクラスにて本メソッドが再定義されていない場合に発生します。
  def __getobj__; end

  # --- __setobj__(obj) -> object
  # 
  # 委譲先のオブジェクトをセットします。
  # 
  # @param obj 委譲先のオブジェクトを指定します。
  # 
  # @raise NotImplementedError サブクラスにて本メソッドが再定義されていない場合に発生します。
  def __setobj__; end

  # --- freeze -> self
  # 
  # 自身を凍結します。
  # 
  # @see [[m:Object#freeze]]
  def freeze; end

  # --- marshal_dump -> object
  # 
  # シリアライゼーションをサポートするために[[m:Delegator#__getobj__]] が返すオブジェクトを返します。
  def marshal_dump; end

  # --- marshal_load(obj) -> object
  # 
  # シリアライズされたオブジェクトから、[[m:Delegator#__getobj__]] が返すオブジェクトを再現します。
  # 
  # @param obj [[m:Delegator#marshal_dump]]の戻り値のコピー
  def marshal_load; end

  # --- method_missing(m, *args) -> object
  # 
  # 渡されたメソッド名と引数を使って、[[m:Delegator#__getobj__]] が返すオブジェクトへメソッド委譲を行います。
  # 
  # @param m メソッドの名前（シンボル）
  # 
  # @param args メソッドに渡された引数
  # 
  # @return 委譲先のメソッドからの返り値
  # 
  # @see [[m:BasicObject#method_missing]]
  def method_missing; end

  # --- methods -> [Symbol]
  # 
  # そのオブジェクトに対して呼び出せるメソッド名の一覧を返します。
  # このメソッドは public メソッドおよび protected メソッドの名前を返します。
  # 
  # @see [[m:Object#methods]]
  def methods; end

  # --- protected_methods(all = true) -> [Symbol]
  # 
  # そのオブジェクトが理解できる protected メソッド名の一覧を返します。
  # 
  # @param all 偽を指定すると __getobj__ のスーパークラスで定義されたメソッドを除きます。
  # 
  # @see [[m:Object#protected_methods]]
  def protected_methods; end

  # --- public_methods(all = true) -> [Symbol]
  # 
  # そのオブジェクトが理解できる public メソッド名の一覧を返します。
  # 
  # @param all 偽を指定すると __getobj__ のスーパークラスで定義されたメソッドを除きます。
  # 
  # @see [[m:Object#public_methods]]
  def public_methods; end

  # --- respond_to?(m) -> bool
  # 
  # [[m:Delegator#__getobj__]] が返すオブジェクトが メソッド m を持つとき真を返します。
  # 
  # @param m メソッド名
  # 
  # @see [[m:Object#respond_to?]]
  def respond_to?; end

  # --- respond_to_missing?(m, include_private) -> bool
  # 
  # @param m メソッド名を指定します。
  # 
  # @param include_private 真を指定すると private メソッドも調べます。
  def respond_to_missing?; end

end
