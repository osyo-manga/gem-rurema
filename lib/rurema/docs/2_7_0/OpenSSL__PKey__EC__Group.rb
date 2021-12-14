class OpenSSL::PKey::EC::Group
  # --- ==(other) -> bool
  # --- eql?(other) -> bool
  # 自身が other と等しいときは true を返します。
  # 
  # @param other 比較対象の [[c:OpenSSL::PKey::EC::Group]] オブジェクト
  def ==; end

  # --- asn1_flag -> Integer
  # 自身に設定された ASN1 フラグを返します。
  # 
  # @see [[m:OpenSSL::PKey::EC::Group#asn1_flag=]]
  def asn1_flag; end

  # --- asn1_flag=(flags)
  # 自身に ASN1 フラグを設定します。
  # 
  # 現在利用可能なフラグは以下の通りです。
  #   * [[m:OpenSSL::PKey::EC::NAMED_CURVE]]
  # 
  # @see [[m:OpenSSL::PKey::EC::Group#asn1_flag]]
  def asn1_flag=; end

  # --- cofactor -> OpenSSL::BN
  # 余因子を返します。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 余因子の取得に失敗した場合に発生します
  def cofactor; end

  # --- curve_name -> String | nil
  # 曲線の名前を文字列で返します。
  # 
  # 名前がない場合は nil を返します。
  def curve_name; end

  # --- degree -> Integer
  # 群の定義の元となっている体の要素を
  # 表現するのに必要なビット数を返します。
  def degree; end

  # --- generator -> OpenSSL::PKey::EC::Point
  # 群の生成元を返します。
  def generator; end

  # --- order -> OpenSSL::BN
  # 生成元の位数を返します。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 位数の取得に失敗した場合に発生します
  def order; end

  # --- point_conversion_form -> Symbol
  # 点のエンコーディング方式を返します。
  # 
  # 以下のいずれかを返します。
  #   * :compressed
  #   * :uncompressed
  #   * :hybrid
  # 詳しくは  X9.62 (ECDSA) などを参照してください。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 得られたエンコーディングが未知の値であった
  #        場合に発生します。
  # @see [[m:OpenSSL::PKey::EC::Group#point_conversion_form=]]
  def point_conversion_form; end

  # --- point_conversion_form=(sym)
  # 点のエンコーディング方式を設定します。
  # 
  # 以下のいずれかを設定します。
  #   * :compressed
  #   * :uncompressed
  #   * :hybrid
  # 詳しくは  X9.62 (ECDSA) などを参照してください。
  # 
  # @param sym 設定する方式([[c:Symbol]])
  # @see [[m:OpenSSL::PKey::EC::Group#point_conversion_form]]
  def point_conversion_form=; end

  # --- seed -> String | nil
  # seed を返します。
  # 
  # seed が設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::PKey::EC::Group#seed]]
  def seed; end

  # --- seed=(s)
  # seed を設定します。
  # 
  # @param s seed(文字列)
  # @raise OpenSSL::PKey::EC::Group::Error seedの設定に失敗した場合に発生します。
  # @see [[m:OpenSSL::PKey::EC::Group#seed]]
  def seed=; end

  # --- set_generator(generator, order, cofactor) -> self
  # 群のパラメータを設定します。
  # 
  # @param generator 生成元([[c:OpenSSL::PKey::EC::Point]] オブジェクト)
  # @param order 生成元の位数([[c:OpenSSL::BN]] オブジェクト)
  # @param cofactor 余因子[[c:OpenSSL::BN]] オブジェクト
  # @raise OpenSSL::PKey::EC::Group::Error 設定に失敗した場合に発生します
  def set_generator; end

  # --- to_der -> String
  # 自身を DER 形式の文字列に変換します。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 変換に失敗した場合に発生します。
  def to_der; end

  # --- to_pem -> String
  # 自身を PEM 形式の文字列に変換します。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 変換に失敗した場合に発生します。
  def to_pem; end

  # --- to_text -> String
  # 自身を人間に可読な形式の文字列に変換します。
  # 
  # @raise OpenSSL::PKey::EC::Group::Error 変換に失敗した場合に発生します。
  def to_text; end

  # --- new(obj) -> OpenSSL::PKey::EC::Group
  # --- new(sym, p, a, b) -> OpenSSL::PKey::EC::Group
  # 
  # 楕円曲線から定義される群を表すオブジェクトを生成します。
  # 
  # 引数の種類と個数によって挙動が異なります。
  # 
  # 引数が1つの場合は、シンボル、[[c:OpenSSL::PKey::EC::Group]] オブジェクト、
  # 文字列のいずれかを渡すことができます。
  # 
  # 引数にシンボルを渡した場合は対応する群を返します。以下の4つを
  # 指定できます。
  #   * :GFp_simple
  #   * :GFp_mont
  #   * :GFp_nist
  #   * :GF2m_simple
  # この方法で生成された Group オブジェクトは不完全です。
  # 
  # [[c:OpenSSL::PKey::EC::Group]] オブジェクト
  # を渡した場合はそれを複製したオブジェクトを返します。
  # 
  # 文字列を渡した場合は、PEM もしくは DER 形式のデータとみなして
  # データを読み込み、オブジェクトを生成します。
  # 
  # 曲線名文字列を渡した場合は、その曲線で定義される
  # 群を表すオブジェクトを返します。
  # 
  # 引数が4つの場合は sym で :GFp_simple もしくは :GF2m_simple を指定し、
  # それと p, a, b という 3 つの整数で定義される
  # 楕円曲線から定義される群を返します。
  # 
  # @param obj Groupオブジェクト生成のためのデータ(シンボル、Group, 文字列のいずれか)
  # @param sym Group を定義するためのシンボル
  # @param p 整数([[c:OpenSSL::BN]])
  # @param a 整数([[c:OpenSSL::BN]])
  # @param b 整数([[c:OpenSSL::BN]])
  # @raise OpenSSL::PKey::EC::Group::Error オブジェクトの生成に失敗した場合に発生します。
  #        曲線名が不正である場合などに発生します。
  def new; end

end
