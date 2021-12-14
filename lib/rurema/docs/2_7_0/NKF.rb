module NKF
  # --- guess(str) -> Encoding
  # 
  # 文字列 str の漢字コードを推測して返します。
  # 
  # 返される値は、NKF モジュールのモジュール定数です。
  # 
  # 返される値(すなわち、推測可能なエンコーディング)は以下のいずれかです。
  #   * NKF::JIS
  #   * NKF::EUC
  #   * NKF::SJIS
  #   * NKF::UNKNOWN
  #   * NKF::UTF8
  #   * NKF::UTF16
  #   * Encoding::EUCJP_MS
  #   * Encoding::CP51932
  #   * Encoding::WINDOWS_31J
  # 
  # @param str 推測対象の文字列です。
  def guess; end

  # --- nkf(opt, str) -> String
  # 
  # 文字列 str の文字コードを変換し、変換結果の文字列を返します。
  # 
  # opt には、nkf と同じコマンドラインオプションを指定します。
  # オプション文字列は [[c:NKF]] のオプション文字列の項を
  # 見てください。
  # オプションを複数指定する場合は、NKF.nkf('-Se', str) や
  # NKF.nkf('-S -e', str) などとします。optは、必ず '-'
  # で始めなければいけないことに注意してください。
  # 
  # @param opt オプション文字列です。
  # @param str 変換対象の文字列です。
  # 
  # === 注意
  # 
  # このメソッドは(nkf コマンドがそうであるように)、MIME Base64 の
  # デコード処理がデフォルトでオンになっています。この動作を無効にしたけ
  # れば opt に '-m0' を含めてください。
  def nkf; end

  # --- ASCII -> Encoding
  # 
  # ASCII コードを表します。
  def ASCII; end

  # --- AUTO -> nil
  # 
  # コードを自動判別することを表します。
  # 
  # NKFモジュール自体からは利用しません。
  def AUTO; end

  # --- BINARY -> Encoding
  # 
  # バイナリ列を表します。
  def BINARY; end

  # --- EUC -> Encoding
  # 
  # EUC コードを表します。
  def EUC; end

  # --- JIS -> Encoding
  # 
  # JIS コードを表します。
  def JIS; end

  # --- NKF_RELEASE_DATE -> String
  # 
  # nkf のリリース日を表す文字列です。
  def NKF_RELEASE_DATE; end

  # --- NKF_VERSION -> String
  # 
  # nkf 自体のバージョンを表す文字列です。
  def NKF_VERSION; end

  # --- NOCONV -> nil
  # 
  # コードを変換しないことを表します。
  # 
  # NKFモジュール自体からは利用しません。
  def NOCONV; end

  # --- SJIS -> Encoding
  # 
  # SJIS コードを表します。
  def SJIS; end

  # --- UNKNOWN -> nil
  # 
  # コード判定に失敗したことを表します。
  def UNKNOWN; end

  # --- UTF16 -> Encoding
  # 
  # UTF-16 (BigEndian) コードを表します。
  def UTF16; end

  # --- UTF32 -> Encoding
  # 
  # UTF-32 (BigEndian) コードを表します。
  def UTF32; end

  # --- UTF8 -> Encoding
  # 
  # UTF-8 コードを表します。
  def UTF8; end

  # --- VERSION -> String
  # 
  # "#{NKF::NKF_VERSION} (#{NKF_RELEASE_DATE})" と
  # あらわされる文字列です。
  def VERSION; end

end
