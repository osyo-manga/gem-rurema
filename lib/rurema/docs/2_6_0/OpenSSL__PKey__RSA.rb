class OpenSSL::PKey::RSA
  # --- d -> OpenSSL::BN
  # 鍵の private exponent です。
  # 
  # これは秘密鍵の一部です。
  def d; end

  # --- d=(new_d)
  # private exponent を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_d 設定する整数値
  def d=; end

  # --- dmp1 -> OpenSSL::BN
  # 鍵の exponent1 (d mod (p-1)) です。
  # 
  # 秘密鍵の情報です。
  def dmp1; end

  # --- dmp1=(new_dmp1)
  # 鍵の exponent1 を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_dmp1 設定する整数
  def dmp1=; end

  # --- dmq1 -> OpenSSL::BN
  # 鍵の exponent2 (d mod (q-1)) です。
  # 
  # 秘密鍵の情報です。
  def dmq1; end

  # --- dmq1=(new_dmq1)
  # 鍵の exponent2 を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_dmq1 設定する整数
  def dmq1=; end

  # --- e -> OpenSSL::BN
  # 鍵の public exponent を返します。
  # 
  # これは公開鍵の一部です。
  def e; end

  # --- e=(new_e)
  # 鍵の public exponent を変更します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_e 設定する public exponent の整数値
  def e=; end

  # --- export(cipher=nil, pass=nil) -> String
  # --- export(cipher=nil, pass=nil){|flag| ... } -> String
  # --- to_pem(cipher=nil, pass=nil) -> String
  # --- to_pem(cipher=nil, pass=nil){|flag| ... } -> String
  # --- to_s(cipher=nil, pass=nil) -> String
  # --- to_s(cipher=nil, pass=nil){|flag| ... } -> String
  # 鍵を PEM 形式で出力します。
  # 
  # cipher と pass が指定された場合、
  # 秘密鍵を暗号 cipher [[c:OpenSSL::Cipher::Cipher]] 
  # とパスワード pass を使って暗号化します。
  # 
  # cipher を指定して pass を省略した場合は
  # 渡されたブロックを呼びだしてパスフレーズを要求します。ブロックの返り値を
  # パスフレーズとみなして暗号化します。
  # ブロックの引数は通常は true が渡されますが、
  # これはそのパスフレーズが秘密鍵の暗号化に使われることを意味します。
  # ブロックが渡されなかった場合にはターミナルに問い合わせをします。
  # 
  # 公開鍵を出力する場合は cipher と pass は無視されます。
  def export; end

  # --- iqmp -> OpenSSL::BN
  # 鍵の coefficient (inverse of q mod p) です。
  # 
  # 秘密鍵の情報です。
  def iqmp; end

  # --- iqmp=(new_iqmp)
  # 鍵の coefficient を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_iqmp 設定する整数値
  def iqmp=; end

  # --- n -> OpenSSL::BN
  # 鍵の modulus です。
  # 
  # 公開鍵、秘密鍵両方の一部です。
  def n; end

  # --- n=(new_n)
  # 鍵の modules を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_n 設定する整数値
  def n=; end

  # --- p -> OpenSSL::BN
  # 鍵の1つめの素数です。
  # 
  # 秘密鍵の情報です。
  def p; end

  # --- p=(new_p)
  # 鍵の1つめの素数を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_p 設定する素数
  def p=; end

  # --- params -> {String => OpenSSL::BN}
  # 鍵のパラメータ([[m:OpenSSL::PKey::RSA#e]],[[m:OpenSSL::PKey::RSA#n]],
  # [[m:OpenSSL::PKey::RSA#d]]など)を{パラメータ名文字列 => パラメータ値}
  # というハッシュで返します。
  # 
  # 鍵が公開鍵の場合、[[m:OpenSSL::PKey::RSA#d]] 
  # のように公開鍵が持っていない値は 0 になります。
  def params; end

  # --- private? -> bool
  # 自身が秘密鍵を持っているかどうか判定します。
  def private?; end

  # --- private_decrypt(str, mode = OpenSSL::PKey::RSA::PKCS1_PADDING) -> String
  # 文字列 str を秘密鍵で復号化します。
  # 
  # 復号化されたデータを文字列で返します。
  # 
  # mode でパディングモードを指定します。暗号化に利用した
  # パディングモードと同じものを指定する必要があります。
  # 以下の4つのうちいずれかが利用可能です。
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::SSLV23_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::NO_PADDING]]
  # 
  # @param str 暗号化する文字列
  # @param mode パディングモード
  # @raise OpenSSL::PKey::RSAError 復号化に失敗した場合に発生します。
  #        公開鍵で復号しようとした場合、鍵が間違っていた場合、
  #        暗号化に使ったパディングモードと異なるモードを使った
  #        場合などに発生します。
  def private_decrypt; end

  # --- private_encrypt(str, mode = OpenSSL::PKey::RSA::PKCS1_PADDING) -> String
  # 文字列 str を秘密鍵で暗号化します。
  # 
  # 暗号化されたデータを文字列で返します。
  # 
  # mode でパディングモードを指定します。以下のいずれかが利用可能です。
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::NO_PADDING]]
  # 
  # @param str 暗号化する文字列
  # @param mode パディングモード
  # @raise OpenSSL::PKey::RSAError 暗号化に失敗した場合に発生します。
  #        自身が秘密鍵でない場合などに発生します。
  def private_encrypt; end

  # --- public? -> true
  # 自身が公開鍵を持っているかどうか判定します。
  # 
  # 秘密鍵は公開鍵も持っているため、常に true を返します。
  def public?; end

  # --- public_decrypt(str, mode = OpenSSL::PKey::RSA::PKCS1_PADDING) -> String
  # 文字列 str を公開鍵で復号化します。
  # 
  # 復号化されたデータを文字列で返します。
  # 
  # mode でパディングモードを指定します。以下のいずれかが
  # 利用可能です。暗号化に利用したパディングモードと同じものを
  # 指定する必要があります。
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::NO_PADDING]]
  # 
  # @param str 復号化する文字列
  # @param mode パディングモード
  # @raise OpenSSL::PKey::RSAError 復号化に失敗した場合に発生します。
  #        
  def public_decrypt; end

  # --- public_encrypt(str, mode = OpenSSL::PKey::RSA::PKCS1_PADDING) -> String
  # 文字列 str を公開鍵で暗号化します。
  # 
  # 暗号化されたデータを文字列で返します。
  # 
  # mode でパディングモードを指定します。以下の4つのうちいずれかが
  # 利用可能です。
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::SSLV23_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING]]
  #  * [[m:OpenSSL::PKey::RSA::NO_PADDING]]
  # 
  # @param str 暗号化する文字列
  # @param mode パディングモード
  # @raise OpenSSL::PKey::RSAError 暗号化に失敗した場合に発生します。
  def public_encrypt; end

  # --- public_key -> OpenSSL::PKey::RSA
  # 公開鍵を複製して RSA オブジェクトとして返します。
  def public_key; end

  # --- q -> OpenSSL::BN
  # 鍵の2つめの素数です。
  # 
  # 秘密鍵の情報です。
  def q; end

  # --- q=(new_q)
  # 鍵の2つめの素数を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param new_q 設定する素数
  def q=; end

  # --- to_der -> String
  # 自身を DER 形式に変換します。
  def to_der; end

  # --- to_text -> String
  # 鍵を人間が読める形式に変換します。
  def to_text; end

  # --- generate(size, exponent = 65537) -> OpenSSL::PKey::RSA
  # --- generate(size, exponent = 65537){|u,n| ... } -> OpenSSL::PKey::RSA
  # 乱数により RSA 公開鍵と秘密鍵のペアを生成して、RSA オブジェクトを返します。
  # 
  # このメソッドを呼ぶ前に [[c:OpenSSL::Random]] の各モジュール関数に
  # よって乱数が適切に初期化されている必要があります。
  # 
  # size で鍵の modulus のビット数つまりは鍵のサイズを指定します。
  # 最低でも1024を指定してください。
  # exponent で public exponent を指定します。exponent には奇数を指定し、
  # 大抵の場合、3、17 あるいは 65537 を指定します。
  # 
  # このメソッドにブロックが渡された場合には、鍵生成の途中経過の
  # 情報を引数としてブロックが呼び出されます。
  #   * n個目の素数候補を生成した場合、u=0 でブロックが呼びだされる
  #   * 生成した素数候補がn回目の素数テスト(Miller-Robin)に成功した
  #     場合、u=1 でブロックが呼び出される
  #   * n個目に生成した素数が鍵として不適切な場合には、u=2 でブロックが
  #     呼びだされる
  #   * p-1 が e と互いに素であるような素数 p が見付かった場合には、
  #     u=3, n=0 でブロックが呼び出される
  #   * 以上の素数生成をもう一度繰り返し、適切な素数 q が見付かった場合には、
  #     u=3, n=1 でブロックが呼び出される
  # RSA 鍵ペアの生成には時間がかかるため、鍵生成の途中経過を
  # ユーザに表示したい場合にこの機能を使います。
  # 
  # 
  # @param size 鍵のサイズ
  # @param exponent public exponent
  def generate; end

  # --- new -> OpenSSL::PKey::RSA
  # --- new(size, exponent = 65537) -> OpenSSL::PKey::RSA
  # --- new(size, exponent = 65537){|u,n| ... }  -> OpenSSL::PKey::RSA
  # --- new(obj, pass = nil) -> OpenSSL::PKey::RSA
  # --- new(obj, pass = nil){|flag| ... } -> OpenSSL::PKey::RSA
  # RSA 暗号鍵オブジェクトを生成します。
  # 
  # 引数なしの場合は空の RSA オブジェクトを返します。
  # 
  # 第一引数に整数を指定した場合には、[[m:OpenSSL::PKey::RSA.generate]] により
  # 公開鍵と秘密鍵のペアを生成し、それを返します。
  # 
  # それ以外の場合には、以下のようにして鍵データを読みこみ、RSA オブジェクト
  # を生成します。
  #   * 第一引数が文字列の場合は、PEM 形式もしくは DER 形式と仮定して
  #     鍵データを読み込みます
  #   * 第一引数が [[c:IO]] オブジェクトの場合は、その内容を
  #     読み込んで RSA オブジェクトを生成します。
  #   * 第一引数が to_der メソッドを持つ場合は、それにより DER 形式の
  #     文字列に変換してから読み込みます
  # pass が指定された場合は、秘密鍵を pass を使って復号化します。
  # 
  # 鍵データにパスフレーズが設定されているにもかかわらず、passが省略された場合は、
  # 渡されたブロックを呼びだしてパスフレーズを要求します。ブロックの返り値を
  # パスフレーズとみなして復号します。ブロックの引数は通常は false が渡されますが、
  # これはそのパスフレーズが秘密鍵の復号に使われることを意味します。
  # ブロックが渡されなかった場合にはターミナルに問い合わせをします。
  # 
  # @param size 鍵生成をする場合の鍵のサイズ
  # @param exponent public exponent
  # @param obj 鍵データ
  # @param pass 鍵データに設定したパスフレーズ
  # @raise OpenSSL::PKey::RSAError 鍵の読み込みに失敗した場合に発生します。
  def new; end

  # --- NO_PADDING -> Integer
  # パディングをしないパディングモードです。
  # 
  # セキュリティ上の問題を引き起すため、基本的に使わないでください。
  # 
  # [[m:OpenSSL::PKey::RSA#public_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#public_decrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_decrypt]] の
  # 第二引数に指定できます。
  def NO_PADDING; end

  # --- PKCS1_OAEP_PADDING -> Integer
  # PKCS #1 v2.0 で定義されているパディングモードです。
  # 
  # 互換性に問題ない場合はこのモードを利用すべきです。
  # 
  # [[m:OpenSSL::PKey::RSA#public_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_decrypt]] の
  # 第二引数に指定できるパディングモード。
  def PKCS1_OAEP_PADDING; end

  # --- PKCS1_PADDING -> Integer
  # 
  # PKCS #1 v1.5 で定義されているパディングモードです。
  # 
  # 互換性目的以外での利用は推奨しません。
  # 
  # [[m:OpenSSL::PKey::RSA#public_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#public_decrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_decrypt]] の
  # 第二引数に指定できます。
  def PKCS1_PADDING; end

  # --- SSLV23_PADDING -> Integer
  # 
  # PKCS #1 v1.5 で定義されているものに
  # SSL特有の変更を加えたパディングモードです。
  # 
  # 互換性目的以外での利用は推奨しません。
  # 
  # [[m:OpenSSL::PKey::RSA#public_encrypt]]、
  # [[m:OpenSSL::PKey::RSA#private_decrypt]] の
  # 第二引数に指定できます。
  def SSLV23_PADDING; end

end
