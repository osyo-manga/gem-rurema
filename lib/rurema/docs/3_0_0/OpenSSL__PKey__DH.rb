class OpenSSL::PKey::DH
  # --- compute_key(bn) -> String
  # 自分の秘密鍵と相手の公開鍵から鍵文字列を計算し、返します。
  # 
  # 相手の公開鍵は [[c:OpenSSL::BN]] か [[c:Integer]] である必要があります。
  # 
  # @param bn 相手の公開鍵(OpenSSL::BN)
  def compute_key; end

  # --- export -> String
  # --- to_pem -> String
  # --- to_s -> String
  # 鍵パラメータを PEM 形式に変換します。
  # 
  # 鍵対の値は出力されません。
  def export; end

  # --- g -> OpenSSL::BN
  # DH 鍵共有プロトコルの鍵パラメータ g を返します。
  # 
  # この値は生成元と呼ばれます。
  # 
  # @see [[m:OpenSSL::PKey::DH#g=]]
  def g; end

  # --- g=(g)
  # DH 鍵共有プロトコルの鍵パラメータ g を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param g 設定する整数値(OpenSSL::BN)
  # @see [[m:OpenSSL::PKey::DH#g]]
  def g=; end

  # --- generate_key! -> self
  # 鍵パラメータ p と g から鍵対を生成しなおし、
  # 自身にセットします。
  # 
  # 以前の鍵対の値は廃棄されます。
  # 
  # 生成した値は [[m:OpenSSL::PKey::DH#params_ok?]] で
  # 安全かどうかチェックしてから利用してください。
  # 
  # @raise OpenSSL::PKey::DHError 鍵の生成に失敗した場合に発生します
  def generate_key!; end

  # --- p -> OpenSSL::BN
  # DH 鍵共有プロトコルの鍵パラメータ p を返します。
  # 
  # このパラメータは安全な素数でなければなりません。
  # 
  # @see [[m:OpenSSL::PKey::DH#p=]]
  def p; end

  # --- p=(p)
  # DH 鍵共有プロトコルの鍵パラメータ p を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param p 設定する整数値(OpenSSL::BN)
  # @see [[m:OpenSSL::PKey::DH#p]]
  def p=; end

  # --- params -> {String => OpenSSL::BN}
  # 鍵パラメータと鍵対を {"パラメータ名" => パラメータ値} というハッシュ
  # テーブルで返します。
  # 
  # ハッシュテーブルのキーは "p", "g", "pub_key", "priv_key" の4つです。
  # 自身が内部に鍵対を持っていない場合は、 "pub_key" と "priv_key" に
  # 対応する値は 0 となります。
  def params; end

  # --- params_ok? -> bool
  # パラメータ p と g が安全かどうかを判定します。
  # 
  # @see [[m:OpenSSL::PKey::DH#generate_key!]],
  #      [[m:OpenSSL::PKey::DH.generate]]
  def params_ok?; end

  # --- priv_key -> OpenSSL::BN
  # DH 鍵共有プロトコルの秘密鍵を返します。
  # 
  # @see [[m:OpenSSL::PKey::DH#priv_key=]]
  def priv_key; end

  # --- priv_key=(private_key)
  # DH 鍵共有プロトコルの秘密鍵を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param private_key 設定する整数値(OpenSSL::BN)
  # @see [[m:OpenSSL::PKey::DH#priv_key]],
  #      [[m:OpenSSL::PKey::DH#generate_key!]]
  def priv_key=; end

  # --- pub_key -> OpenSSL::BN
  # DH 鍵共有プロトコルの公開鍵を返します。
  # 
  # @see [[m:OpenSSL::PKey::DH#pub_key=]]
  def pub_key; end

  # --- pub_key=(public_key)
  # DH 鍵共有プロトコルの公開鍵を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param public_key 設定する整数値(OpenSSL::BN)
  # @see [[m:OpenSSL::PKey::DH#pub_key]],
  #      [[m:OpenSSL::PKey::DH#generate_key!]]
  def pub_key=; end

  # --- to_der -> String
  # 
  # 鍵パラメータをDER 形式に変換します。
  def to_der; end

  # --- to_text -> String
  # 鍵パラメータを人間が読める形式に変換します。
  # 
  # 鍵対の値は出力されません。
  def to_text; end

  # --- generate(size, generator = 2) -> PKey::DH
  # --- generate(size, generator = 2){|u,n| ... } -> PKey::DH
  # DH 鍵共有プロトコルのパラメータを生成し、DH オブジェクトを返します。
  # 
  # size は無作為に生成する素数 p (鍵パラメータ)のサイズで、単位はビットです。
  # generatorは1より大きい小さい数で、通常2か5を指定します。
  # 
  # 生成した値は [[m:OpenSSL::PKey::DH#params_ok?]] で
  # 安全かどうかチェックしてから利用してください。
  # 
  # このメソッドにブロックが渡された場合には、パラメータ生成の途中経過の
  # 情報を引数としてブロックが呼び出されます。
  #   * n個目の素数候補を生成した場合、u=0 でブロックが呼びだされる
  #   * 生成した素数候補がn回目の素数テスト(Miller-Robin)に成功した
  #     場合、u=1 でブロックが呼び出される
  #   * n個目に生成した素数が鍵として不適切な場合には、u=2 でブロックが
  #     呼びだされる
  #   * パラメータとして適当な素数 p が見付かった場合には、
  #     u=3, n=0 でブロックが呼び出される
  # DH パラメータの生成には時間がかかるため、鍵生成の途中経過を
  # ユーザに表示したい場合にこの機能を使います。
  # 
  # この場合鍵対も同時に生成されます。
  # 
  # @param size 鍵パラメータの素数のサイズ(ビット数)
  # @param generator 鍵パラメータの生成元(2以上の整数、通常2か5)
  # @raise OpenSSL::PKey::DHError パラメータの生成に失敗した場合に発生します
  # @see [[m:OpenSSL::PKey::DH#generate_key!]]
  def generate; end

  # --- new(size, generator = 2) -> OpenSSL::PKey::DH
  # --- new(obj) -> OpenSSL::PKey::DH
  # --- new() -> OpenSSL::PKey::DH
  # DH オブジェクトを生成します。
  # 
  # 第1引数に整数を渡した場合は、[[m:OpenSSL::PKey::DH#generate]] と
  # 同じです。
  # 
  # それ以外の場合には、以下のようにして鍵パラメータを読みこみ、DH オブジェクト
  # を生成します。
  #   * 第一引数が文字列の場合は、PEM 形式もしくは DER 形式と仮定して
  #     鍵パラメータを読み込みます
  #   * 第一引数が [[c:IO]] オブジェクトの場合は、その内容を
  #     読み込んで DH オブジェクトを生成します。
  #   * 第一引数が to_der メソッドを持つ場合は、それにより DER 形式の
  #     文字列に変換してから読み込みます
  # この場合鍵対は空です。
  # 
  # 引数をまったく与えない場合は空の DH オブジェクトが生成されます。
  # このオブジェクトには鍵パラメータも鍵対も設定されていません。
  # 
  # @param size 鍵パラメータの素数のサイズ(ビット数)
  # @param generator 鍵パラメータの生成元(2以上の整数、通常2か5)
  # @param obj 鍵パラメータを読み込むオブジェクト
  # @raise OpenSSL::PKey::DHError オブジェクトの生成に失敗した場合に発生します
  # @see [[m:OpenSSL::PKey::DH#generate_key!]]
  def new; end

end
