class OpenSSL::PKCS7
  # --- add_certificate(cert) -> self
  # 署名に添付する証明書を追加します。
  # 
  # 通常は [[c:OpenSSL::PKCS7.sign]] の引数で添付する証明書を指定した
  # ほうがよいでしょう。
  # 
  # @param cert 追加する証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @raise OpenSSL::PKCS7::PKCS7Error 追加に失敗した場合に発生します。
  def add_certificate; end

  # --- add_crl(crl) -> self
  # 署名に添付する CRL を追加します。
  # 
  # @param crl 追加する CLR ([[c:OpenSSL::X509::CRL]] オブジェクト)
  # @raise OpenSSL::PKCS7::PKCS7Error 追加に失敗した場合に発生します。
  def add_crl; end

  # --- data=(data)
  # --- add_data(data) -> data
  # 
  # 署名対象のデータを設定します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param data 文字列
  def add_data; end

  # --- add_recipient(recipient) -> self
  # 送信者を追加します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param recipient 追加する送信者([[c:OpenSSL::PKCS7::RecipientInfo]])
  def add_recipient; end

  # --- add_signer(singer) -> self
  # 署名者を追加します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param signer 追加する署名者([[c:OpenSSL::PKCS7::SignerInfo]] オブジェクト)
  def add_signer; end

  # --- certificates -> [OpenSSL::X509::Certificate] | nil
  # 署名に添付される証明書を配列で返します。
  def certificates; end

  # --- certificates=(certificates)
  # 署名に付ける証明書を指定します。
  # 
  # PKCS7 オブジェクトに元々つけられていた証明書はクリアされます。
  # 通常は [[c:OpenSSL::PKCS7.sign]] の引数で添付する証明書を指定した
  # ほうがよいでしょう。
  # 
  # @param certificates 証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)の配列
  # @raise OpenSSL::PKCS7::PKCS7Error 変更に失敗した場合に発生します。
  def certificates=; end

  # --- cipher=(cipher)
  # 使用する共通鍵暗号アルゴリズムを指定します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param cipher 共通鍵暗号アルゴリズム([[c:OpenSSL::Cipher]] オブジェクト)
  def cipher=; end

  # --- crls -> [OpenSSL::X509::CRL]
  # 署名に添付されている CRL を配列で返します。
  def crls; end

  # --- crls=(crls)
  # 署名に添付される CRL を配列で設定します。
  # 
  # 元々付けられていた CRL はクリアされます。
  # 
  # @param crls 更新する CRL([[c:OpenSSL::X509::CRL]] オブジェクト) の配列
  # @raise OpenSSL::PKCS7::PKCS7Error 変更に失敗した場合に発生します。
  def crls=; end

  # --- data -> String
  # 署名対象のデータを文字列で返します。
  def data; end

  # --- decrypt(pkey, cert, flags = 0) -> String
  # 暗号化されたデータを復号化し、復号化されたデータを返します。
  # 
  # 復号には暗号化に使った公開鍵に対応する秘密鍵と、その公開鍵を
  # 含む証明書が必要です。
  # 
  # flags には以下のいずれかを指定できます。
  #   * [[m:OpenSSL::PKCS7::TEXT]]
  #       暗号化されたデータに付けられた text/plain タイプの MIME ヘッダ
  #       を取り除きます。もしヘッダがなければエラーとなります。
  # 
  # @param pkey 復号化に使う秘密鍵([[c:OpenSSL::PKey::PKey]] オブジェクト)
  # @param cert 対応する証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param flags フラグ
  # @raise OpenSSL::PKCS7::PKCS7Error 復号に失敗した場合に発生します
  def decrypt; end

  # --- detached? -> bool
  # --- detached -> bool
  # 
  # 平文に署名を付ける形式(multipart/signed)かどうかを返します。
  # 
  # [[m:OpenSSL::PKCS7.sign]] で flags に [[m:OpenSSL::PKCS7::DETACHED]]
  # を渡した場合に真になります。
  def detached; end

  # --- detached=(b)
  # 平文に署名を付ける形式(multipart/signed)かどうかを設定します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param b 設定する真偽値
  def detached=; end

  # --- error_string -> String | nil
  # 検証エラーの理由を表す文字列を返します。
  # 
  # [[m:OpenSSL::PKCS7#verify]] で検証を
  # した場合のみ更新されます。
  # 
  # [[m:OpenSSL::PKCS7#verify]] で検証をする前は nil を返します。
  # 
  # 検証に成功した場合は nil を返します。
  # 
  # @see [[m:OpenSSL::PKCS7#error_string=]]
  def error_string; end

  # --- error_string=(str)
  # 検証エラーの理由を表す文字列を設定します。
  # 
  # @param str 設定するエラー文字列
  # @see [[m:OpenSSL::PKCS7#error_string]]
  def error_string=; end

  # --- recipients -> [OpenSSL::PKCS7::RecipientInfo]
  # メッセージの送信先の情報を配列で返します。
  # 
  # これは暗号化した場合のみ意味があります。
  def recipients; end

  # --- signers -> [OpenSSL::PKCS7::SignerInfo]
  # 
  # メッセージの署名者を表す [[c:OpenSSL::PKCS7::SignerInfo]] オブジェクトの
  # 配列を返します。
  # 
  # これはメッセージを署名した場合にのみ意味があります。
  def signers; end

  # --- to_der -> String
  # DER 形式のバイナリ列に変換します。
  def to_der; end

  # --- to_pem -> String
  # --- to_s -> String
  # 
  # PEM 形式の文字列に変換します。
  def to_pem; end

  # --- type -> Symbol
  # PKCS7 オブジェクトのタイプを [[c:Symbol]] オブジェクトで返します。
  # 
  # 次のうちのいずれかの値をとります。
  #   * :signed
  #   * :encrypted
  #   * :enveloped
  #   * :signedAndEnveloped
  #   * :data
  def type; end

  # --- type=(type)
  # PKCS7 オブジェクトのタイプを [[c:Symbol]] オブジェクトで設定します。
  # 
  # このメソッドは使わないでください。
  # このメソッドは PKCS#7 の低レベル API であり、正しく使うのは
  # 難しいでしょう。
  # 
  # @param type 設定するタイプ(シンボル)
  def type=; end

  # --- verify(certs, store, indata = nil, flags = 0) -> bool
  # 署名を検証します。
  # 
  # 検証に成功した場合は真を、失敗した場合は偽を返します。
  # 
  # certs には署名者の証明書を含む配列を渡します。
  # 通常 S/MIME 署名には証明者の証明書が含まれていますが、
  # [[m:OpenSSL::PKCS7.sign]] で [[m:OpenSSL::PKCS7::NOCERTS]] を渡した
  # 場合には含まれていないので、明示的に渡す必要があります。
  # このメソッドは配列から適切な証明書を自動的に選択します。
  # 
  # store には検証に用いる証明書ストアを渡します。
  # 検証に必要な信頼できる CA 証明書をあらかじめ証明書ストアに含めておく
  # 必要があります。
  # 
  # indata は署名の対象となった文字列を渡します。
  # nil を渡すと [[m:OpenSSL::PKCS7#data]] で得られる文字列
  # を用います。通常は nil を渡すべきです。
  # 
  # flags には以下の値の OR を渡します。
  #   * [[m:OpenSSL::PKCS7::NOINTERN]]
  #       メッセージに添付された証明書を探索しません。
  #       これを指定した場合は、必要な証明書をすべて certs から渡す必要が
  #       あります。ある特定の証明書による署名のみを検証したい場合などに
  #       用います。
  #   * [[m:OpenSSL::PKCS7::TEXT]]
  #       署名対象のデータに含まれる text/plain タイプの MIME ヘッダを取り除きます。
  #       もしヘッダがない場合はエラーとなります。
  #   * [[m:OpenSSL::PKCS7::NOVERIFY]]
  #       署名者の証明書を検証しません。
  #   * [[m:OpenSSL::PKCS7::NOCHAIN]]
  #       メッセージに含まれる証明書を中間 CA として利用しません。
  #   * [[m:OpenSSL::PKCS7::NOSIGS]]
  #       署名を検証しません。
  # 
  # 通常、これらのフラグを渡さなかった場合、
  #   * (もし存在するならば)メッセージに含まれる中間 CA 証明書の検証を行う
  #   * その中間 CA 証明書を用いて、署名者の証明書の検証を行う
  #   * 署名者の証明書を用いて署名の検証を行う
  # という順で検証が行われます。
  # 
  # この検証は署名者証明書の持ち主が署名したという事実のみを検証します。
  # 署名者証明書の持ち主が本当に意図した相手であるかどうかは保証されません。
  # 証明書の内容から(ユーザに確認を取るなど)適切に判断する必要があります。
  # 
  # 検証に失敗した場合は [[m:OpenSSL::PKCS7#error_string]] に
  # 失敗した理由を表す文字列がセットされます。
  # 
  # @param certs 証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)の配列
  # @param store 証明書ストア([[c:OpenSSL::X509::Store]] オブジェクト)
  # @param indata 署名対象の文字列
  # @param flags フラグ
  # @raise OpenSSL::PKCS7::PKCS7Error 検証に失敗した場合に発生します
  def verify; end

  # --- encrypt(certs, data, cipher=nil, flags=0) -> OpenSSL::PKCS7
  # data を証明書の公開鍵で暗号化します。
  # 
  # 暗号化は複数の公開鍵を用いてすることが可能です。そのためには
  # 複数の証明書を配列で渡します。
  # 
  # data には任意の文字列を渡せますが、一般的には MIME 形式の文字列を渡します。
  # 署名と暗号化の両方をしたい場合は、
  # 署名([[m:OpenSSL::PKCS7.sign]])された S/MIME 形式の文字列を
  # 渡すことが一般的です。
  # 
  # cipher は共通鍵暗号の方式を [[c:OpenSSL::Cipher]] オブジェクトで指定します。
  # nil を渡すと適当な方式が選ばれます。互換性を気にするのであれば
  # triple DES を使うとよいでしょう。多くのクライアントで利用可能なはずです。
  # 
  # flags には以下のフラグを渡すことができます。
  #   * [[c:OpenSSL::PKCS7::TEXT]]
  #       暗号化するデータに text/plain タイプの MIME ヘッダを追加します。
  #       MIME形式のデータを渡すときにはこれを使ってはいけません。
  #   * [[c:OpenSSL::PKCS7::BINARY]]
  #       data に MIME 正規化をほどこしません。
  # 
  # @param certs 公開鍵を含む証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)の配列
  # @param data 暗号化対象の文字列
  # @param cipher 共通鍵暗号の方式([[c:OpenSSL::Cipher]] オブジェクト)
  # @param flags フラグ
  def encrypt; end

  # --- new -> OpenSSL::PKCS7
  # --- new(obj) -> OpenSSL::PKCS7
  # PKCS7 オブジェクトを生成します。
  # 
  # 引数を渡さなかった場合は空のオブジェクトを作ります。
  # 
  # 引数を渡した場合は、文字列もしくは [[c:IO]] オブジェクトから
  # PEM 形式もしくは DER 形式の文字列を読み込み
  # PKCS7 オブジェクトを生成します。
  # 
  # @param obj データを読みこむ文字列もしくは IO オブジェクト
  def new; end

  # --- read_smime(obj) -> OpenSSL::PKCS7
  # S/MIME 形式のデータを読み込み、PKCS7 オブジェクトを返します。
  # 
  # 引数 obj からデータを読み込みます。文字列もしくは
  # [[c:IO]] オブジェクトから読み出すことができます。
  # 
  # 
  # @param obj データを読み出すオブジェクト
  # @raise OpenSSL::PKCS7::PKCS7Error 読み込みに失敗した場合に発生します
  def read_smime; end

  # --- sign(cert, key, data, certs = [], flags = 0) -> OpenSSL::PKCS7
  # data に証明書と秘密鍵で署名します。
  # 
  # cert に署名に使う証明書を、key にその証明書に対応する秘密鍵を
  # 渡します。certs に [[c:OpenSSL::X509::Certificate]] オブジェクトの配列 を
  # 渡すと [[c:OpenSSL::PKCS7]] オブジェクトにそれらの証明書が追加で保持されます。
  # 例えば中間 CA 証明書などを渡します。
  # flags は以下の値の OR を渡します。
  #   * [[m:OpenSSL::PKCS7::TEXT]] 
  #       text/plain 用の MIME ヘッダをデータに付け加える。
  #   * [[m:OpenSSL::PKCS7::NOCERTS]]
  #       署名者の証明書を署名に含めません。送り先がすでに証明書をもっている場合
  #       など、他の方法で証明書を手に入れることができる場合に
  #       データ量を減らすために用います。
  #   * [[m:OpenSSL::PKCS7::DETACHED]]
  #       クリア署名(multipart/signed)をする。
  #   * [[m:OpenSSL::PKCS7::BINARY]]
  #       data に MIME 正規化を施さない。
  #   * [[m:OpenSSL::PKCS7::NOATTR]]
  #       PKCS#7 autenticatedAttributes (署名時刻など)をオブジェクトに含めない。
  #   * [[m:OpenSSL::PKCS7::NOSMIMECAP]]
  #       署名者が使用可能な暗号アルゴリズムの情報など(SMIMECapabilities)を省略する。
  # 
  # 
  # 返り値は署名結果を含む [[c:OpenSSL::PKCS7]] オブジェクトを返します。
  # 
  # @param cert 署名に用いる証明書([[c:OpenSSL::X509::Certificate]] オブジェクト)
  # @param key 署名に用いる秘密鍵([[c:OpenSSL::PKey::PKey]] のサブクラスのオブジェクト)
  # @param data 署名対象のデータ文字列
  # @param certs 添付する証明書群([[c:OpenSSL::X509::Certificate]] オブジェクトの配列)
  # @param flags フラグ(整数値)
  # @raise OpenSSL::PKCS7::PKCS7Error 署名に失敗した場合に発生します
  def sign; end

  # --- write_smime(p7sig, data=nil, flags = 0) -> String
  # PKCS7 オブジェクトから S/MIME 形式の文字列を返します。
  # 
  # data には署名対象のデータを渡します。
  # data に nil を渡すと [[m:OpenSSL::PKCS7#data]] で得られる
  # 文字列を用います。通常は nil を渡してください。
  # 
  # flags には以下の定数の or を渡します。
  #   * [[m:OpenSSL::PKCS7::DETACHED]]
  #       クリア署名をします。これは [[m:OpenSSL::PKCS7.sign]] で
  #       [[m:OpenSSL::PKCS7::DETACHED]] を渡した場合にのみ意味を持ちます。
  #   * [[m:OpenSSL::PKCS7::TEXT]]
  #       MIME ヘッダに text/plain を付加します。
  #       これは [[m:OpenSSL::PKCS7.sign]] で
  #       [[m:OpenSSL::PKCS7::DETACHED]] を渡した場合にのみ意味を持ちます。
  # 
  # 例:
  # 
  #   require 'openssl'
  # 
  #   data = "foobar"
  #   p7 = OpenSSL::PKCS7.sign( OpenSSL::X509::Certificate.new(File.read('cert.pem')),
  #                             OpenSSL::PKey::RSA.new(File.read('privkey.pem')),
  #                             data)
  #   smime = PKCS7.write_smime(p7)
  # 
  # @param p7sig PKCS#7 オブジェクト
  # @param data 署名されたデータ文字列
  # @param flags フラグ(整数値)
  # @raise OpenSSL::PKCS::PKCS7Error S/MIME形式への変換に失敗した場合に発生します
  def write_smime; end

  # --- BINARY -> Integer
  # MIME canonical format への変換を行いません。
  # 
  # [[m:OpenSSL::PKCS7.sign]]、[[m:OpenSSL::PKCS7.encrypt]]
  # で利用可能なフラグです。
  def BINARY; end

  # --- DETACHED -> Integer
  # 平文に署名を付ける形式 (multipart/signed) で行います。 
  # 
  # [[m:OpenSSL::PKCS7.sign]]、[[m:OpenSSL::PKCS7.write_smime]]
  # で利用可能なフラグです。
  def DETACHED; end

  # --- NOATTR -> Integer
  # PKCS#7 autenticatedAttributes(署名した時間などの情報)
  # を省略します。
  # 
  # [[m:OpenSSL::PKCS7.sign]] で利用可能なフラグです。
  def NOATTR; end

  # --- NOCERTS  -> Integer
  # 署名者の証明書を署名に含めません。送り先がすでに証明書をもっている場合
  # など、他の方法で証明書を手に入れることができる場合に
  # データ量を減らすために用います。
  # 
  # [[m:OpenSSL::PKCS7.sign]] で利用可能なフラグです。
  def NOCERTS; end

  # --- NOCHAIN  -> Integer
  # 署名検証時に、メッセージに含まれる証明書を中間 CA として利用しません。
  # 
  # [[m:OpenSSL::PKCS7#verify]] で利用可能なフラグです。
  def NOCHAIN; end

  # --- NOINTERN -> Integer
  # 署名検証時に、署名者の証明書をメッセージに添付された証明書から探索しません。
  # 
  # [[m:OpenSSL::PKCS7#verify]] でのみ利用可能なフラグです。
  def NOINTERN; end

  # --- NOSIGS -> Integer
  # 署名の検証を行いません。
  # 
  # [[m:OpenSSL::PKCS7#verify]] で利用可能なフラグです。
  def NOSIGS; end

  # --- NOSMIMECAP -> Integer
  # 署名者が使用可能な暗号アルゴリズムの情報など(SMIMECapabilities)を省略します。
  # 
  # [[m:OpenSSL::PKCS7.sign]] で利用可能なフラグです。
  def NOSMIMECAP; end

  # --- NOVERIFY -> Integer
  # 署名検証時に署名者の証明書の検証を行いません。
  # 
  # [[m:OpenSSL::PKCS7#verify]] で利用可能なフラグです。
  def NOVERIFY; end

  # --- TEXT  -> Integer
  # text/plain タイプの MIME ヘッダーを取り扱います。
  # 
  # [[m:OpenSSL::PKCS7.sign]], [[m:OpenSSL::PKCS7.write_smime]], 
  # [[m:OpenSSL::PKCS7#verify]], 
  # [[m:OpenSSL::PKCS7.encrypt]], [[m:OpenSSL::PKCS7#decrypt]]
  # で利用可能なフラグです。
  #   
  def TEXT; end

end
