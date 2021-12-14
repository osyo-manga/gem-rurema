class OpenSSL::X509::Store
  # --- add_cert(cert) -> self
  # CA 証明書を信頼する証明書として証明書ストアに加えます。
  # 
  # @param cert 追加する CA 証明書の [[c:OpenSSL::X509::Certificate]] オブジェクト
  # @raise OpenSSL::X509::StoreError 追加に失敗した場合に発生します
  def add_cert; end

  # --- add_crl(crl) -> self
  # 信頼する CRL(証明書失効リスト)
  # を証明書ストアに加えます。
  # 
  # @param crl 追加する CRL の [[c:OpenSSL::X509::CRL]] オブジェクト
  # @raise OpenSSL::X509::StoreError 追加に失敗した場合に発生します
  def add_crl; end

  # --- add_file(file) -> self
  # ファイルに含まれる CA 証明書を信頼する証明書として証明書ストアに加えます。
  # 
  # @param file ファイル名文字列
  # @raise OpenSSL::X509::StoreError 追加に失敗した場合に発生します
  def add_file; end

  # --- add_path(path) -> self
  # path が指し示すディレクトリに含まれる証明書ファイルを
  # 信頼する証明書として加えます。
  # 
  # @param path 証明書が含まれるディレクトリのパス
  # @raise OpenSSL::X509::StoreError 追加に失敗した場合に発生します
  def add_path; end

  # --- chain -> [OpenSSL::X509::Certificate] | nil
  # 最後に [[m:OpenSSL::X509::Store#verify]] を呼び、
  # 検証したときのルート CA までの証明書のチェインを返します。
  # 
  # 証明書の順序は以下の通りです。
  # 
  #   [証明書, 下位 CA 証明書, 中間 CA 証明書, ... , ルート CA 証明書]
  # 
  # verify を一度も呼びだしていない場合は nil を返します。
  # 
  # 返り値は verify を呼ぶごとに更新されます。
  def chain; end

  # --- error -> Integer | nil
  # 最後に [[m:OpenSSL::X509::Store#verify]] を呼び、
  # 検証したときのエラーコードを返します。
  # 
  # エラーコードの整数値は [[c:OpenSSL::X509]] に定数が定義されています。
  # 詳しくは [[ref:c:OpenSSL::X509#verify_error]] を見てください。
  # 検証に成功した場合は [[m:OpenSSL::X509::V_OK]] を返します。
  # 
  # verify を一度も呼びだしていない場合は nil を返します。
  # 
  # 返り値は verify を呼ぶごとに更新されます。
  def error; end

  # --- error_string -> String | nil
  # 最後に [[m:OpenSSL::X509::Store#verify]] を呼び、
  # 検証したときのエラー文字列を返します。
  # 
  # 検証に成功した場合は "ok" を返します。
  # 
  # verify を一度も呼びだしていない場合は nil を返します。
  # 
  # 返り値は verify を呼ぶごとに更新されます。
  def error_string; end

  # --- flags=(flags)
  # CRL に関するフラグを設定します。
  # 
  # 以下の定数から必要なものを選んで OR 取り、渡します。
  #   * [[m:OpenSSL::X509::V_FLAG_CRL_CHECK]]
  #   * [[m:OpenSSL::X509::V_FLAG_CRL_CHECK_ALL]]
  # 
  # このフラグは [[m:OpenSSL::X509::Store#verify]] で検証する場合に利用されます。
  # [[m:OpenSSL::X509::StoreContext.new]] で証明書ストアコンテキストを
  # 生成する場合にはそのコンテキストにフラグがコピーされます。
  # 
  # デフォルトではフラグは設定されていません。
  # 
  # @param flags 設定するフラグ(整数値)
  # @see [[m:OpenSSL::X509::StoreContext#flags=]]
  def flags=; end

  # --- purpose=(purpose)
  # 証明書の使用目的を設定します。
  # 
  # 以下の定数値のうちいずれか1つを渡します。
  #   * [[m:OpenSSL::X509::PURPOSE_ANY]]
  #   * [[m:OpenSSL::X509::PURPOSE_CRL_SIGN]]
  #   * [[m:OpenSSL::X509::PURPOSE_NS_SSL_SERVER]]
  #   * [[m:OpenSSL::X509::PURPOSE_SMIME_ENCRYPT]]
  #   * [[m:OpenSSL::X509::PURPOSE_SMIME_SIGN]]
  #   * [[m:OpenSSL::X509::PURPOSE_SSL_CLIENT]]
  #   * [[m:OpenSSL::X509::PURPOSE_SSL_SERVER]]
  #   * [[m:OpenSSL::X509::PURPOSE_OCSP_HELPER]]
  # 
  # この値は [[m:OpenSSL::X509::Store#verify]] で検証する場合に利用されます。
  # 証明書に記載されている使用目的が適合していない場合には検証が失敗します。
  # [[m:OpenSSL::X509::StoreContext.new]] で証明書ストアコンテキストを
  # 生成する場合にはそのコンテキストにこの値がコピーされます。
  # 
  # @param purpose 証明書の使用目的を表す整数値
  # @see [[m:OpenSSL::X509::StoreContext#purpose=]]
  def purpose=; end

  # --- set_default_paths -> nil
  # システムに組込まれている証明書を読み込みます。
  # 
  # @raise OpenSSL::X509::StoreError 読み込みに失敗した場合に発生します
  def set_default_paths; end

  # --- time=(time)
  # 証明書の有効期限の検証に使う日時を設定します。
  # 
  # デフォルトでは現在時刻が使われます。
  # 
  # @param time 検証に使う日時の [[c:Time]] オブジェクト
  # @see [[m:OpenSSL::X509::StoreContext#time=]]
  def time=; end

  # --- trust=(trust)
  # 
  # @todo
  # 
  # 以下のいずれかの定数の値を指定します。
  # 
  #  * [[m:OpenSSL::X509::TRUST_COMPAT]]
  #  * [[m:OpenSSL::X509::TRUST_EMAIL]]
  #  * [[m:OpenSSL::X509::TRUST_OBJECT_SIGN]]
  #  * [[m:OpenSSL::X509::TRUST_SSL_CLIENT]]
  #  * [[m:OpenSSL::X509::TRUST_SSL_SERVER]]
  #  * [[m:OpenSSL::X509::TRUST_OCSP_REQUEST]]
  #  * [[m:OpenSSL::X509::TRUST_OCSP_SIGN]]
  # @param trust 整数値
  # @see [[m:OpenSSL::X509::StoreContext#trust=]]
  def trust=; end

  # --- verify(cert, chain = nil) -> bool
  # --- verify(cert, chain = nil){|ok, ctx| ... } -> bool
  # 証明書を証明書ストアに存在する CA 証明書で検証します。
  # 
  # chain には検証したい証明書の証明書チェイン全体を 
  # [[c:OpenSSL::X509::Certificate]] の配列で渡します。
  # 
  # 検証に成功した場合は true を、失敗した場合は false を返します。
  # 
  # このメソッドをブロック付きで呼び出すと、そのブロックが
  # 検証をフィルタするコールバックと見做されます。このコールバックについては
  # [[m:OpenSSL::X509::Store#verify_callback=]] を参照してください。
  # 
  # 内部では [[m:OpenSSL::X509::StoreContext.new]] と
  # [[m:OpenSSL::X509::StoreContext#verify]] を呼びだすことによって検証しています。
  # 
  # @param cert 検証したい証明書の [[c:OpenSSL::X509::Certificate]]
  # @param chain 検証したい証明書の証明書チェイン全体の配列
  # @raise OpenSSL::X509::StoreError 検証時にエラーが生じたときに発生します
  def verify; end

  # --- verify_callback -> Proc | nil
  # オブジェクトに設定されている検証をフィルタするコールバックを
  # 返します。
  # 
  # デフォルトのコールバックが設定されている場合には nil を返します。
  # 
  # @see [[m:OpenSSL::X509::Store#verify_callback=]]
  def verify_callback; end

  # --- verify_callback=(proc)
  # 検証をフィルタするコールバックを設定します。
  # 
  # コールバックには [[c:Proc]] や [[c:Method]] を渡します。
  # 
  # 渡されたコールバックオブジェクトは証明書チェインの検証時に
  # チェインに含まれる各証明書の署名を検証するたびに呼びだされます。
  # そのときに渡される引数は以下のように
  #   proc{|ok, ctx| ... }
  # 2つで、1つめは検証が成功したかの真偽値、
  # 2つめは検証後の状態を保存した
  # [[c:OpenSSL::X509::StoreContext]] オブジェクトです。
  # このコールバックには2つの役割があります。1つ目はコンテキストオブジェクト
  # を調べることで詳細なエラー情報を得ることです。2つ目は検証をカスタマイズ
  # することです。このコールバックが true を返すと、たとえ
  # OpenSSL が検証失敗と判定しても、検証が成功したものと判断し証明書チェイン
  # の検証を続けます。逆に false を返すと、検証が失敗したものとみなされ
  # 検証を停止し、検証メソッドは検証失敗を返します。詳細なエラー情報を
  # 得たいだけの場合はコールバックは第一引数をそのまま返すようにしてください。
  # 
  # nil を設定するとデフォルトのコールバック(単に第一引数をそのまま返すだけ)
  # が使われます。
  # 
  # 初期状態は nil です。
  # 
  # @param proc 設定する [[c:Proc]] オブジェクト
  # @see [[m:OpenSSL::X509::Store#verify_callback]],
  #      [[m:OpenSSL::X509::Store#verify]],
  #      [[m:OpenSSL::X509::StoreContext#verify]]
  def verify_callback=; end

  # --- new -> OpenSSL::X509::Store
  # 空の Store オブジェクトを生成します。
  # 
  # @raise OpenSSL::X509::StoreError オブジェクトの生成に失敗した場合に発生します
  def new; end

end
