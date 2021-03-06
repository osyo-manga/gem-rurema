class OpenSSL::Engine
  # --- cipher(name) -> OpenSSL::Cipher
  # engine から暗号化/復号化オブジェクトを生成します。
  # 
  # @param name 暗号化方式名(文字列)
  # @raise OpenSSL::Engine::EngineError 指定した暗号化方式が存在しない、もしくは
  #        engine がサポートしていない場合に発生します。
  def cipher; end

  # --- cmds -> [[String, String, String]]
  # その engine がサポートしているコマンドの一覧を
  # 配列で返します。
  # 
  # 配列の各要素は
  #   [コマンド名、コマンドの説明、コマンドのフラグ]
  # という3つの文字列の配列です。
  # 
  # @see [[m:OpenSSL::Engine#ctrl_cmd]]
  def cmds; end

  # --- ctrl_cmd(cmd, val=nil) -> self
  # engine にコマンドを送ります。
  # 
  # @param cmd コマンド名(文字列)
  # @param val コマンド引数(文字列)
  # @see [[m:OpenSSL::Engine#ctrl_cmd]]
  def ctrl_cmd; end

  # --- digest(name) -> OpenSSL::Digest
  # engine からメッセージダイジェストオブジェクトを生成します。
  # 
  # @param name メッセージダイジェストアルゴリズム名(文字列)
  # @raise OpenSSL::Engine::EngineError 指定したアルゴリズムが存在しない、もしくは
  #        engine がサポートしていない場合に発生します。
  def digest; end

  # --- finish -> nil
  # engine を終了させ、内部に保持しているデータを破棄します。
  def finish; end

  # --- id -> String
  # engine の識別子を文字列で返します。
  # 
  # @see [[m:OpenSSL::Engine#name]]
  def id; end

  # --- load_private_key(id=nil, data=nil) -> OpenSSL::PKey::PKey
  # 秘密鍵を engine にロードします。
  # 
  # @param id key id(文字列)
  # @param data 文字列
  def load_private_key; end

  # --- load_public_key(id=nil, data=nil) -> OpenSSL::PKey::PKey
  # 公開鍵を engine にロードします。
  # 
  # @param id key id(文字列)
  # @param data 文字列
  def load_public_key; end

  # --- name -> String
  # engine の(人間に読みやすい)名称を文字列で返します。
  # 
  # 例:
  #   engine.name # => "Atalla hardware engine support"
  # 
  # @see [[m:OpenSSL::Engine#id]]
  def name; end

  # --- set_default(flags) -> true
  # engine をデフォルトで利用するようにします。
  # 
  # flags は engine を openssl のどの機能に関してデフォルトに
  # するかを指定します。
  # 
  # flags は以下の値の OR を取ります。
  #   * [[m:OpenSSL::Engine::METHOD_CIPHERS]]
  #   * [[m:OpenSSL::Engine::METHOD_DH]]
  #   * [[m:OpenSSL::Engine::METHOD_DIGESTS]]
  #   * [[m:OpenSSL::Engine::METHOD_DSA]]
  #   * [[m:OpenSSL::Engine::METHOD_RSA]]
  #   * [[m:OpenSSL::Engine::METHOD_RAND]]
  # また、 [[m:OpenSSL::Engine::METHOD_ALL]] や
  # [[m:OpenSSL::Engine::METHOD_NONE]] が利用可能です。
  def set_default; end

  # --- by_id(id) -> OpenSSL::Engine
  # id で指定した engine をロードします。
  # 
  # [[m:OpenSSL::Engine#load]] ではコンパイル時に決められた engine しか
  # 読み込めませんが、これは動的なロードが可能です。
  # 
  # @param id engine の名前(文字列)
  # @raise OpenSSL::Engine::EngineError ロードが失敗した場合に発生します。
  def by_id; end

  # --- cleanup -> nil
  # ロードされている engine を全て破棄します。
  # 
  # engine が利用していたリソースを開放します。
  # 
  # @see [[m:OpenSSL::Engine.load]]
  def cleanup; end

  # --- engines -> [OpenSSL::Engine]
  # ロードされていて利用可能な engine を配列で返します。
  # 
  # @see [[m:OpenSSL::Engine.load]]
  def engines; end

  # --- load(name = nil) -> true | nil
  # Engine をロードします。
  # 
  # このメソッドは openssl のコンパイル時に静的に
  # コンパイルされたものを読み込みます。
  # 
  # name で指定した engine をロードします。以下が指定可能です。
  #   * "dynamic"
  #   * "cswift"
  #   * "chil"
  #   * "atalla"
  #   * "nuron"
  #   * "ubsec"
  #   * "aep"
  #   * "sureware"
  #   * "4758cca"
  #   * "openbsd_dev_crypto"
  #   * "openssl"
  # 引数を省略した場合はロード可能なすべての engine をロードします。
  # 
  # 動的な読み込みをしたい場合は [[m:OpenSSL::Engine#by_id]] を
  # 用います。
  # 
  # ロードに成功した場合は true を返します。
  # 
  # @param name ロードする engine の名前(文字列)
  # @see [[m:OpenSSL::Engine.cleanup]]
  def load; end

  # --- METHOD_ALL -> Integer
  # engine が持っている機能をすべて openssl のデフォルトにすること
  # を意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_ALL; end

  # --- METHOD_CIPHERS -> Integer
  # デフォルトの暗号化のための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_CIPHERS; end

  # --- METHOD_DH -> Integer
  # デフォルトの DH アルゴリズムのための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_DH; end

  # --- METHOD_DIGESTS -> Integer
  # デフォルトのダイジェストのための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_DIGESTS; end

  # --- METHOD_DSA -> Integer
  # デフォルトの DSA アルゴリズムのための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_DSA; end

  # --- METHOD_NONE -> Integer
  # engine をデフォルトに設定しないことを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_NONE; end

  # --- METHOD_RAND -> Integer
  # デフォルトのセキュアな乱数生成のための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_RAND; end

  # --- METHOD_RSA -> Integer
  # デフォルトの RSA アルゴリズムのための engine に設定することを意味します。
  # 
  # [[m:OpenSSL::Engine#set_default]] のフラグとして使います。
  def METHOD_RSA; end

end
