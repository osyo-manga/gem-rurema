module OpenSSL
  # --- debug -> bool
  # デバッグモードが on ならば true を返します。
  # 
  # @see [[m:OpenSSL.#debug=]]
  def debug; end

  # --- debug=(b)
  # デバッグモードを on/off します。
  # 
  # @see [[m:OpenSSL.#debug]]
  def debug=; end

  # --- errors -> [String]
  # OpenSSL のエラーキューに残っているエラー文字列を返します。
  # 
  # 通常、エラーキューはこの拡張ライブラリが空にするため、
  # これは空の配列を返します。もしそうでないならば
  # このライブラリのバグです。
  def errors; end

  # --- fips_mode=(bool)
  # 
  # FIPS モードを明示的に on/off します。
  # 
  # @raise OpenSSL::OpenSSLError インストールされている OpenSSL が
  #        FIPS をサポートしていない場合に発生します。
  # 
  # @see [[m:OpenSSL::OPENSSL_FIPS]]
  def fips_mode=; end

  # --- OPENSSL_FIPS -> bool
  # 
  # システムにインストールされている OpenSSL が FIPS を
  # サポートしているならば true です。
  # 
  # していなければ false です。
  # 
  # @see [[m:OpenSSL.#fips_mode=]]
  def OPENSSL_FIPS; end

  # --- OPENSSL_LIBRARY_VERSION -> String
  # 
  # 実行時に使われている OpenSSL 本体のバージョンを表した文字列です。
  def OPENSSL_LIBRARY_VERSION; end

  # --- OPENSSL_VERSION -> String
  # 
  # ビルド時に使われた OpenSSL 本体のバージョンを表した文字列です。
  def OPENSSL_VERSION; end

  # --- OPENSSL_VERSION_NUMBER -> Integer
  # 
  # システムにインストールされている OpenSSL 本体のバージョンを表した数です。
  # [[url:https://www.openssl.org/docs/manmaster/man3/OPENSSL_VERSION_NUMBER.html]]
  # も参照してください。
  def OPENSSL_VERSION_NUMBER; end

  # --- VERSION -> String
  # 
  # Ruby/OpenSSL のバージョンです。
  def VERSION; end

end
