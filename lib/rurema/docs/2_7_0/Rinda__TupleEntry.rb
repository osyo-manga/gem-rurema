class Rinda::TupleEntry
  # --- [](key)
  # タプルの key に対応する要素を返します。
  # 
  # [[m:Rinda::TupleEntry#value]][key] を返します。
  # 
  # @param key 要素を指定するキー
  # 
  # @see [[m:Rinda::TupleEntry#fetch]]
  def []; end

  # --- alive? -> bool
  # タプルが有効である(期限切れでもなく、キャンセルされていない)ならば
  # 真を返します。
  # 
  # @see [[m:Rinda::TupleEntry#canceled?]], [[m:Rinda::TupleEntry#expired?]]
  def alive?; end

  # --- cancel -> ()
  # タプルをキャンセルし、タプルスペースから取り除きます。
  # 
  # すでにタプルスペースから取り除かれている場合には何もしません。
  # 
  # @see [[m:Rinda::TupleEntry#canceled?]]
  def cancel; end

  # --- canceled? -> bool
  # 
  # タプルが既にキャンセルされているならば真を返します。
  # 
  # @see [[m:Rinda::TupleEntry#cancel]]
  def canceled?; end

  # --- expired? -> bool
  # タプルが既に期限切れになっているならば真を返します。
  # 
  # @see [[m:Rinda::TupleEntry#expires]], @see [[m:Rinda::TupleEntry#renew]]
  def expired?; end

  # --- expires -> Time
  # タプルの期限切れの時刻を返します。
  # 
  # 有効期限を無限に指定した場合、この時刻は Time.at(2**31-1)、つまり
  # Tue Jan 19 03:14:07 GMT Standard Time 2038 を返します。
  # 
  # @see [[m:Rinda::TupleEntry#expire]]
  def expires; end

  # --- expires=(expires) 
  # タプルの期限切れの時刻を指定します。
  # 
  # @param expires 期限切れの時刻([[c:Time]])
  # 
  # @see [[m:Rinda::TupleEntry#expires]]
  def expires=; end

  # --- fetch(key) -> object
  # タプルの key に対応する要素を返します。
  # 
  # [[m:Rinda::TupleEntry#value]].fetch(key) を返します。
  # 
  # @param key 要素を指定するキー
  # 
  # @see [[m:Rinda::TupleEntry#[] ]]
  def fetch; end

  # --- renew(sec_or_renewer) -> ()
  # タプルの有効期限を更新します。
  # 
  # sec_or_renewer によって以下のように更新されます。
  #   * nil :  遠い未来(実質的に無限)を指定します。詳しくは [[m:Rinda::TupleEntry#expires]] 参照
  #   * true :  直ちに有効期限切れになるよう指定します
  #   * 数値 : 有効期限を現在から sec_or_renewer 秒後に指定します
  #   * それ以外 : renew メソッドを持っていると仮定され、そのメソッドの呼び出し結果を用います。
  #     renew メソッドは nil, true, 数値のいずれかを上のルールに従って返さなければなりません。
  def renew; end

  # --- size -> Integer
  # タプルのサイズ(配列の要素数/ハッシュテーブルのエントリー数)を返します
  # 
  # @see [[m:Rinda::TupleEntry#value]]
  def size; end

  # --- value -> Array | Hash
  # 管理対象のタプルを返します。
  def value; end

end
