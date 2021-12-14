class OpenSSL::Cipher
  # --- block_size -> Integer
  # 暗号化のブロックのサイズをバイト数で返します。
  def block_size; end

  # --- decrypt -> self
  # --- decrypt(pass, iv = nil) -> self
  # 復号化の準備をします。
  # 
  # 暗号オブジェクトの内部状態を復号化のために初期化します。
  # 
  # pass と iv が渡された場合、これらを用いて鍵を生成し、暗号オブジェクトに
  # 鍵と IV を設定します。このやりかたは非標準的であるため利用すべきではありません。
  # 
  # @param pass パスワード文字列
  # @param iv IV文字列
  # @raise OpenSSL::Cipher::CipherError 準備に失敗した場合に発生します
  def decrypt; end

  # --- encrypt -> self
  # --- encrypt(pass, iv = nil) -> self
  # 
  # 暗号化の準備をします。
  # 
  # 暗号オブジェクトの内部状態を暗号化のために初期化します。
  # 
  # pass と iv が渡された場合、これらを用いて鍵を生成し、暗号オブジェクトに
  # 鍵と IV を設定します。このやりかたは非標準的であるため利用すべきではありません。
  # 
  # @param pass パスワード文字列
  # @param iv IV文字列
  # @raise OpenSSL::Cipher::CipherError 準備に失敗した場合に発生します
  def encrypt; end

  # --- final -> String
  # 暗号オブジェクト内部に残されたデータを暗号化/復号化し、文字列で
  # 返します。
  # 
  # パディング([[m:OpenSSL::Cipher#padding=]])を有効にしている場合は、
  # 残されたデータにパディングを付加した上で暗号化します。
  def final; end

  # --- iv=(iv) 
  # IV(Initialization Vector) を設定します。
  # 
  # @param iv IV文字列
  def iv=; end

  # --- iv_len -> Integer
  # 必要な IV(Initialization Vector) の長さをバイト数で返します。
  def iv_len; end

  # --- key=(key) 
  # 暗号鍵を設定します。
  # 
  # なお、ここでいう「暗号鍵」は各暗号アルゴリズムに渡される鍵であって、
  # 「パスワード」ではありません。
  def key=; end

  # --- key_len -> Integer
  # 暗号鍵の長さをバイト数で返します。
  def key_len; end

  # --- key_len=(length)
  # 暗号鍵の長さを変更します。
  # 
  # @param length 新しく設定する長さ(バイト数)
  # @raise OpenSSL::Cipher::CipherError 指定した長さが不適切である(暗号方式の規格上許されていない値である)場合に発生します
  def key_len=; end

  # --- name -> String
  # 暗号化アルゴリズムの名前を文字列で返します。
  def name; end

  # --- padding=(padding)
  # パディングを設定します。
  # 
  # 1 でパディングを有効に、0で無効にします。
  # 
  # パディングを無効化した場合には、暗号化するデータのサイズはブロックサイズの
  # 倍数でなければなりません。
  # 
  # 暗号化する側と復号化する側でパディングの設定を一致させておかなければなりません。
  # 
  # @param padding 1でパディングを有効、0で無効
  # @raise OpenSSL::Cipher::CipherError 設定に失敗した場合に発生します
  def padding=; end

  # --- pkcs5_keyivgen(pass, salt=nil, num=2048, digest="md5") -> nil
  # pass と salt から鍵と IV を生成し、暗号オブジェクトに設定します。
  # 
  # このメソッドは PKCS#5 v1.5 で定義されている方法に
  # 従って鍵と IV を生成します。PKCS#5 v1.5 と正しく互換するには
  # digest は md5 か sha1 を使い、暗号アルゴリズムは
  # RC2, RC4-40, DES のいずれかを使わなければなりません。
  # 
  # このメソッドの利用は推奨されません。これではなく
  # PKCS#5 v2.0 に定義されている方法で鍵と IV を生成すべきです。
  # 
  # salt が nil である場合には salt なしと見なします。
  # 
  # num は必要なデータの生成でハッシュ関数を何回繰り返し適用するかを
  # 指定します。最低でも1000を使うべきです。
  # 
  # @param pass パスワード文字列
  # @param salt 鍵と IV を生成するための salt 文字列、長さは 8 byte でなければならない
  # @param num ハッシュ関数の適用回数
  # @param digest ハッシュアルゴリズムを指定する文字列もしくは [[c:OpenSSL::Digest]] のオブジェクト
  # @raise OpenSSL::Cipher::CipherError saltが8 byte でない場合や、鍵と IV の設定に失敗した場合に発生します
  # @see [[c:OpenSSL::PKCS5]]
  def pkcs5_keyivgen; end

  # --- random_iv -> String
  # IV を乱数で生成し、暗号オブジェクトに設定します。
  # 
  # 生成した IV を文字列で返します。
  def random_iv; end

  # --- random_key -> String
  # 鍵を乱数で生成し、暗号オブジェクトに設定します。
  # 
  # 生成した鍵を文字列で返します。
  def random_key; end

  # --- reset -> self
  # 内部状態をリセットします。
  # 
  # 鍵、IV、暗号化/復号化待ちデータなどがクリアされます。
  def reset; end

  # --- update(data) -> String
  # 
  # 渡された文字列を暗号化もしくは復号化して文字列として返します。
  # 
  # どちらがなされるかは直前に [[m:OpenSSL::Cipher#encrypt]] もしくは 
  # [[m:OpenSSL::Cipher#decrypt]] のいずれが呼びだされたかに
  # よって決まります。
  # 
  # ブロック暗号を利用する場合は、暗号化/復号化はブロックサイズで規定された
  # バイト数ごとに行われます。そのため余ったデータは暗号オブジェクト内部に
  # 保存され、次の文字列が渡されたときに使われます。
  # 
  # 暗号化/復号化すべきデータを渡し終えた後は、
  # [[m:OpenSSL::Cipher#final]] 
  # を呼びだして暗号オブジェクト内部に残されたデータを暗号化/復号化
  # する必要があります。
  # 
  # 
  # @param data 暗号化/復号化する文字列
  def update; end

  # --- ciphers -> [String]
  # 利用可能な暗号方式名を文字列の配列で返します。
  # 
  #   require 'openssl'
  # 
  #   OpenSSL::Cipher.ciphers 
  #   # => ["AES-128-CBC", "AES-128-CFB", "AES-128-CFB1", "AES-128-CFB8", "AES-128-ECB", "AES-128-OFB", "AES-192-CBC", ... ]
  def ciphers; end

  # --- new(name) -> OpenSSL::Cipher
  # 
  # 共通鍵暗号のアルゴリズム名を渡し、対応する暗号オブジェクトを生成します。
  # 
  # 利用できるアルゴリズムはシステムにインストールされている openssl に依存します。
  # [[m:OpenSSL::Cipher.ciphers]] で利用可能な暗号のアルゴリズム名が得られます。
  # 
  # さまざまな方式がありますが、2006年現在 aes256 (aes-256-cbc) 
  # を用いるのが安心でしょう。
  # 
  # 
  # @param name 暗号化方式の名前
  # @raise RuntimeError 利用可能でない暗号化方式名を指定した場合に発生します
  # @raise OpenSSL::Cipher::CipherError 初期化に失敗した場合に発生します
  def new; end

end
