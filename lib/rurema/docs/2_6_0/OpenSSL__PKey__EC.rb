class OpenSSL::PKey::EC
  # --- check_key -> true
  # 
  # パラメータと鍵対をチェックします。
  # 
  # なんらかの意味で鍵対に問題がある場合には例外 ECError を発生します。
  # 
  # @raise OpenSSL::PKey::ECError 鍵に問題がある場合に発生します
  def check_key; end

  # --- dh_compute_key(pubkey) -> String
  # 自分の秘密鍵と相手の公開鍵から ECDH によって鍵文字列を計算し、返します。
  # 
  # 相手の公開鍵は [[c:OpenSSL::PKey::EC::Point]] オブジェクトである必要があります。
  # 
  # @param pubkey 相手の公開鍵
  # @raise OpenSSL::PKey::ECError 鍵交換に失敗した場合に発生します
  def dh_compute_key; end

  # --- dsa_sign_asn1(data) -> String
  # 秘密鍵を用い、data に ECDSA で署名します。
  # 
  # 結果は文字列として返します。
  # 
  # data のダイジェストを取る処理はこのメソッドに含まれていません。
  # 自身で適当なダイジェストを取る必要があります。
  # 
  # @param data 署名対象のデータ(文字列)
  # @raise OpenSSL::PKey::ECError EC オブジェクトが秘密鍵を保持していない場合、
  #                               もしくは署名に失敗した場合に発生します
  # @see [[m:OpenSSL::PKey::EC#dsa_verify_asn1]]
  def dsa_sign_asn1; end

  # --- dsa_verify_asn1(data, sig) -> bool
  # 公開鍵を用い、署名を ECDSA で検証します。
  # 
  # data のダイジェストを取る処理はこのメソッドに含まれていません。
  # 自身で適当なダイジェストを取る必要があります。
  # 
  # 検証に成功した場合は true を返します。
  # 
  # @param data 署名対象のデータ(文字列)
  # @param sig 署名データ(文字列)
  # @raise OpenSSL::PKey::ECError 署名の検証時にエラーが生じた場合に発生します
  # @see [[m:OpenSSL::PKey::EC#dsa_sign_asn1]]
  def dsa_verify_asn1; end

  # --- generate_key -> self
  # 鍵ペアを乱数で生成します。
  # 
  # @raise OpenSSL::PKey::ECError 鍵ペアの生成に失敗した場合に発生します
  def generate_key; end

  # --- group -> OpenSSL::PKey::EC::Group
  # 鍵パラメータとなる群を表すオブジェクトを返します。
  # 
  # @see [[m:OpenSSL::PKey::EC#group=]]
  def group; end

  # --- group=(gr)
  # 鍵パラメータとなる群を表すオブジェクトを設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param gr 設定する [[c:OpenSSL::PKey::EC::Group]] オブジェクト
  # @raise OpenSSL::PKey::ECError Group オブジェクトの設定に失敗した場合に発生します
  # @see [[m:OpenSSL::PKey::EC#group]]
  def group=; end

  # --- private_key -> OpenSSL::BN|nil
  # 秘密鍵となる整数を返します。
  # 
  # 鍵が設定されていない場合は nil を返します。
  # 
  # @see [[m:OpenSSL::PKey::EC#private_key=]]
  def private_key; end

  # --- private_key=(privkey)
  # 秘密鍵となる整数を設定します。
  # 
  # nil を渡すことで EC オブジェクトが公開鍵のみを持つ状態に変更できます。
  # 
  # @param privkey 設定する秘密鍵([[c:OpenSSL::BN]] オブジェクト)
  # @raise OpenSSL::PKey::ECError 秘密鍵の設定に失敗した場合に発生します
  # @see [[m:OpenSSL::PKey::EC#private_key]]
  def private_key=; end

  # --- private_key? -> bool
  # EC オブジェクトが秘密鍵を保持していれば真を返します。
  def private_key?; end

  # --- public_key -> OpenSSL::PKey::EC::Point|nil
  # 公開鍵となる楕円曲線上の点を表すオブジェクトを返します。
  # 
  # 鍵が設定されていない場合は nil を返します。
  # 
  # @raise OpenSSL::PKey::ECError 公開鍵の取得時にエラーが生じた場合に発生します
  # @see [[m:OpenSSL::PKey::EC#public_key=]]
  def public_key; end

  # --- public_key=(pubkey)
  # 公開鍵となる楕円曲線上の点を表すオブジェクトを設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param pubkey 公開鍵となる [[c:OpenSSL::PKey::EC::Point]] オブジェクト
  # @raise OpenSSL::PKey::ECError 公開鍵の設定時にエラーが生じた場合に発生します
  # @see [[m:OpenSSL::PKey::EC#public_key]]
  def public_key=; end

  # --- public_key? -> bool
  # EC オブジェクトが公開鍵を保持していれば真を返します。
  # 
  # [[c:OpenSSL::PKey::RSA]] や [[c:OpenSSL::PKey::DSA]] と
  # 異なり、EC オブジェクトが公開鍵を含まない場合が存在します。
  # 例えば、[[m:OpenSSL::PKey::EC.new]] でパラメータとなる群のみを
  # 指定して EC オブジェクトを作った場合は、公開鍵も秘密鍵も
  # 保持していません。この場合 [[m:OpenSSL::PKey::EC#generate_key]] で
  # 鍵を生成するまで、その状態のままです。
  # 
  # このメソッドを呼ぶ前に [[c:OpenSSL::Random]] の各モジュール関数に
  # よって乱数が適切に初期化されている必要があります。
  def public_key?; end

  # --- to_der -> String
  # 鍵を DER 形式の文字列に変換します。
  # 
  # @raise OpenSSL::PKey::ECError 文字列への変換に失敗した場合に発生します。
  #        公開鍵が含まれていない場合や、鍵が妥当でない場合などに失敗します。
  def to_der; end

  # --- to_pem -> String
  # 鍵を PEM 形式の文字列に変換します。
  # 
  # 現在の仕様では [[m:OpenSSL::PKey::RSA#to_pem]] のように
  # 出力をパスフレーズで暗号化することはできません。
  # 
  # @raise OpenSSL::PKey::ECError 文字列への変換に失敗した場合に発生します。
  #        公開鍵が含まれていない場合や、鍵が妥当でない場合などに失敗します。
  def to_pem; end

  # --- to_text -> String
  # 鍵を人間が読める形式に変換します。
  # 
  # @raise OpenSSL::PKey::ECError 文字列への変換に失敗した場合に発生します。
  #        公開鍵が含まれていない場合や、鍵が妥当でない場合などに失敗します。
  def to_text; end

  # --- builtin_curves -> [[String, String]]
  # 
  # 組み込みの曲線の名前と、それに対する説明を文字列の配列ペアの配列で返します。
  # 
  # 例:
  #   require 'openssl'
  # 
  #   OpenSSL::PKey::EC.builtin_curves
  #   # => [["secp112r1", "SECG/WTLS curve over a 112 bit prime field"],
  #   #     ["secp112r2", "SECG curve over a 112 bit prime field"], 
  #   #     ["secp128r1", "SECG curve over a 128 bit prime field"], 
  #   #     ["secp128r2", "SECG curve over a 128 bit prime field"],
  #   #     ... ]
  # 
  # @see [[m:OpenSSL::PKey::EC::Group.new]]
  def builtin_curves; end

  # --- new -> OpenSSL::PKey::EC
  # --- new(obj) -> OpenSSL::PKey::EC
  # 
  # OpenSSL::PKey::EC オブジェクトを生成します。
  # 
  # 引数の種類や内容によって異なる挙動をします。
  # 
  # 引数なしの場合は、空の EC オブジェクトを生成します。
  # これにはパラメータ(曲線から定義される群)も鍵対も含まれていません。
  # 
  # 引数が OpenSSL::PKey::EC オブジェクトである場合には、
  # そのオブジェクトのコピーを返します。
  # 
  # 引数が [[c:OpenSSL::PKey::EC::Group]] のオブジェクトである場合には、
  # それを群として設定されます。鍵対は含まれません。
  # 
  # 引数が DER 形式もしくは PEM 形式の文字列である場合は、その内容を
  # 読み込んで EC オブジェクトを出力します。その内容によって
  # 鍵対の両方、もしくは公開鍵のみ含まれています。
  # 
  # 引数が曲線の名前の文字列である場合には、その曲線で定義される
  # 群がパラメータとして設定されます。鍵対は含まれません。
  # 
  # @param obj ECオブジェクトの生成元(EC オブジェクト or EC::Group オブジェクト
  #            or 文字列)
  # @raise OpenSSL::PKey::ECError オブジェクトの生成に失敗した場合に発生します
  def new; end

  # --- NAMED_CURVE -> Integer
  # その群が名前を持つ曲線から定義されていることを意味するフラグです。
  # 
  # [[m:OpenSSL::PKey::EC::Group#asn1_flag=]] で利用されます。
  def NAMED_CURVE; end

end
