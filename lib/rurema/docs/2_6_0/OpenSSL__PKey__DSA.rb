class OpenSSL::PKey::DSA
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

  # --- g -> OpenSSL::BN
  # DSA 鍵のパラメータ g を返します。
  # 
  # g は公開鍵、秘密鍵の両方に属する情報です。
  def g; end

  # --- g=(g)
  # DSA 鍵のパラメータ g を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param g 設定する整数値
  def g=; end

  # --- p -> OpenSSL::BN
  # DSA 鍵のパラメータ p を返します。
  # 
  # p は公開鍵、秘密鍵の両方に属する情報です。
  def p; end

  # --- p=(p)
  # DSA 鍵のパラメータ p を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param p 設定する整数値
  def p=; end

  # --- params -> {String => OpenSSL::BN}
  # 鍵のパラメータを {パラメータ名 => その整数値} というハッシュで返します。
  # 
  # 公開鍵における priv_key のように自身が持っていないパラメータは
  # 0 がセットされます。
  def params; end

  # --- priv_key -> OpenSSL::BN
  # DSA 鍵の秘密鍵パラメータを返します。
  # 
  # 秘密鍵はこの値と、
  # [[m:OpenSSL::PKey::DSA#p]], [[m:OpenSSL::PKey::DSA#q]], [[m:OpenSSL::PKey::DSA#g]]
  # から構成されます。
  def priv_key; end

  # --- priv_key=(private_key)
  # DSA 鍵の秘密鍵パラメータを設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param private_key 設定する整数値
  def priv_key=; end

  # --- private? -> bool
  # 自身が秘密鍵をもっている場合に true を返します。
  def private?; end

  # --- pub_key -> OpenSSL::BN
  # DSA 鍵の公開鍵パラメータを返します。
  # 
  # 公開鍵はこの値と、
  # [[m:OpenSSL::PKey::DSA#p]], [[m:OpenSSL::PKey::DSA#q]], [[m:OpenSSL::PKey::DSA#g]]
  # から構成されます。
  def pub_key; end

  # --- pub_key=(public_key)
  # DSA 鍵の公開鍵パラメータを設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param public_key 設定する整数値
  def pub_key=; end

  # --- public? -> bool
  # 自身が公開鍵をもっている場合に true を返します。
  def public?; end

  # --- public_key -> OpenSSL::PKey::DSA
  # 公開鍵を複製して DSA オブジェクトとして返します。
  def public_key; end

  # --- q -> OpenSSL::BN
  # DSA 鍵のパラメータ q を返します。
  # 
  # q は公開鍵、秘密鍵の両方に属する情報です。
  def q; end

  # --- q=(q)
  # DSA 鍵のパラメータ q を設定します。
  # 
  # 通常このメソッドで値を変更することはありません。
  # よく考えて必要な場合のみ利用してください。
  # 
  # @param q 設定する整数値
  def q=; end

  # --- syssign(data) -> String
  # 自身で data に署名をし、 DER 形式の文字列で署名を返します。
  # 
  # data は適切なハッシュ関数で計算されたダイジェストであると仮定
  # しています。
  # 
  # 通常は [[m:OpenSSL::PKey::PKey#sign]] を使い、署名をすべきです。
  # 
  # @param data 署名の対象
  def syssign; end

  # --- sysverify(data, sign) -> bool
  # 署名 sign と自身の公開鍵で data を検証します。
  # 
  # 検証に成功した場合は真を返します。
  # 
  # sign に [[m:OpenSSL::PKey::DSA#syssign]] が返す DER 形式の文字列
  # を渡さなければなりません。
  # 
  # data は適切なハッシュ関数で計算されたダイジェストであると仮定
  # しています。
  # 
  # @param data 検証対象の文字列
  # @param sign 署名文字列
  # @raise OpenSSL::PKey::DSAError 検証時にエラーが起きた場合に発生します。
  #        正しい署名でなかった場合など、検証に失敗した場合はこの
  #        例外は発生しないことに注意してください
  def sysverify; end

  # --- to_der -> String
  # 自身を DER 形式に変換します。
  def to_der; end

  # --- to_text -> String
  # 鍵を人間が読める形式に変換します。
  def to_text; end

  # --- generate(size) -> OpenSSL::PKey::DSA
  # --- generate(size){|u,n| ... } -> OpenSSL::PKey::DSA
  # 乱数により DSA 公開鍵と秘密鍵のペアを生成して、DSA オブジェクトとして
  # 返します。
  # 
  # このメソッドを呼ぶ前に [[c:OpenSSL::Random]] の各モジュール関数に
  # よって乱数が適切に初期化されている必要があります。
  # 
  # size は DSA パラメータの素数のビット数を指定します。最大 1024 まで
  # 指定できます。通常 512 か 1024 を使います。
  # 
  # このメソッドにブロックが渡された場合には、鍵パラメータ生成の途中経過の
  # 情報を引数としてブロックが呼び出されます。
  #   * n個目の素数候補を生成した場合、u=0 でブロックが呼びだされる
  #   * 生成した素数候補が小さな素数で割りきれてしまった場合は
  #     u=1, n=-1 でブロックが呼びだされる
  #   * 生成した素数候補がn回目の素数テスト(Miller-Robin)に成功した
  #     場合、u=1 でブロックが呼び出される
  #   * 適当な1つめの素数が見付かった場合は、u=2, n=0 と
  #     u=3, n=0 でブロックが呼び出される
  #   * もう1つ素数を見付けるために、上の1,2,3をもう一度繰り返す
  #   * 適当な2つめの素数が見付かった場合は、u=2, n=1 でブロックが
  #     呼び出される
  #   * パラメータ g (generator) が見付かった場合には、
  #     u=3, n=1 でブロックが呼び出される
  # DSA パラメータの生成には時間がかかるため、生成の途中経過を
  # ユーザに表示したい場合にこの機能を使います。
  def generate; end

  # --- new -> OpenSSL::PKey::DSA
  # --- new(size) -> OpenSSL::PKey::DSA
  # --- new(obj, pass=nil) -> OpenSSL::PKey::DSA
  # --- new(obj, pass=nil){|flag| ... } -> OpenSSL::PKey::DSA
  # DSA オブジェクトを生成します。
  # 
  # 引数なしの場合は空の DSA オブジェクトを返します。
  # 
  # 第一引数に整数を指定した場合には、[[m:OpenSSL::PKey::DSA.generate]] により
  # 公開鍵と秘密鍵のペアを生成し、それを返します。
  # 
  # それ以外の場合には、以下のようにして鍵データを読みこみ、DSA オブジェクト
  # を生成します。
  #   * 第一引数が文字列の場合は、PEM 形式もしくは DER 形式と仮定して
  #     鍵データを読み込みます
  #   * 第一引数が [[c:IO]] オブジェクトの場合は、その内容を
  #     読み込んで DSA オブジェクトを生成します。
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
  # @param size 鍵を生成する時の素数のビット数
  # @param obj 鍵データ
  # @param pass 鍵データに設定したパスフレーズ
  # @raise OpenSSL::PKey::DSAError 鍵の読み込みに失敗した場合に発生します。
  def new; end

end
