class Net::FTP::MLSxEntry
  # --- appendable? -> bool
  # 
  # エントリが追記可能であれば true を返します。
  # 
  # APPE コマンド([[m:Net::FTP#putbinaryfile]] など)
  # が適用可能であるかどうかを意味します。
  def appendable?; end

  # --- charset -> String|nil
  # 
  # エンコーディング情報を返します。
  # 
  # IANA character set name の値を返します。
  # 
  # 情報がない場合は nil を返します。
  def charset; end

  # --- creatable? -> bool
  # 
  # ディレクトリにファイルが作成可能であれば true を返します。
  # 
  # STOU, STOR  などのコマンド([[m:Net::FTP#putbinaryfile]] など)
  # が適用可能であるかどうかを意味します。
  def creatable?; end

  # --- create -> Time|nil
  # 
  # エントリの作成時刻を返します。
  # 
  # 情報がない場合は nil を返します。
  def create; end

  # --- deletable? -> bool
  # 
  # エントリが削除可能であれば true を返します。
  # 
  # ディレクトリであれば [[m:Net::FTP#rmdir]] が、
  # ファイルであれば [[m:Net::FTP#delete]] が、それぞれ
  # 適用可能であるかどうかを意味します。
  def deletable?; end

  # --- directory? -> bool
  # 
  # エントリがディレクトリであれば true を返します。
  # 
  # [[m:Net::FTP::MLSxEntry#type]] が "dir"、 "pdir"、 "cdir"、
  # のいずれかであれば true を返します。
  def directory?; end

  # --- directory_makable? -> bool
  # 
  # ディレクトリを作成可能ならば true を返します。
  # 
  # [[m:Net::FTP#mkdir]] でディレクトリを作成可能かどうかを意味します。
  def directory_makable?; end

  # --- enterable? -> bool
  # 
  # エントリの中に入れるならば true を返します。
  # 
  # [[m:Net::FTP#chdir]] で入れるかどうかを意味します。
  def enterable?; end

  # --- facts -> { String => String|Integer|Time }
  # 
  # そのエントリの「facts」を返します。
  # 
  # facts とはそのエントリに関するファイルサイズなどの様々な情報です。
  # Net::FTP はこの情報を文字列をキーとするハッシュテーブルで
  # 返します。
  # 標準では以下のような facts が定義されています。これらの facts には
  # 対応するメソッドが定義されています。すべてのサーバでこれら
  # の facts がすべて実装されているわけではありません。
  # [[rfc:3659]] では
  # modify, perm, type, size, unique はすべてのサーバで
  # 対応すべき(SHOULD)、とされています。
  # 
  # 
  #   * "modify" : 変更時刻 (Time)
  #   * "create": 作成時刻
  #   * "perm": パーミッション(String)
  #   * "type": 種類(String, "file", "dir", "cdir", "pdir" など)
  #   * "size": ファイルサイズ (Integer, octet単位)
  #   * "unique": ユニークID (String)
  #   * "lang": ファイルの言語 (String)
  #   * "media-type":  メディアタイプ (String)
  #   * "charset": 文字エンコーディング (String)
  # 
  # サーバが UNIX 系 OS の場合は以下のような facts が
  # 使える可能性があります。
  # 
  #   * "unix.mode": ファイルモード(Integer)
  #   * "unix.group": グループ(Integer)
  #   * "unix.owner": ファイルのオーナー(Integer)
  #   * "unix.atime": ファイルに最後にアクセスした時刻 (Time)
  #   * "unix.ctime": ファイルを作成した時刻 (Time)
  # 
  # これ以外の非標準的な fact を保持している場合もあります。
  # 
  # 詳しくは [[RFC:3659]] を参照してください。
  def facts; end

  # --- file? -> bool
  # 
  # エントリの種類がファイルであれば true を返します。
  # 
  # [[m:Net::FTP::MLSxEntry#type]] == "file" と同じ意味です。
  def file?; end

  # --- lang -> String|nil
  # 
  # 言語情報を返します。
  # 
  # 例えば "en_US" などです。
  # 
  # 情報がない場合は nil を返します。
  def lang; end

  # --- listable? -> bool
  # 
  # ディレクトリの内容一覧を得ることが可能ならば true を返します。
  # 
  # [[m:Net::FTP#list]]、[[m:Net::FTP#nlst]]、[[m:Net::FTP#mlst]]
  # などでディレクトリの内容を閲覧できるかどうかを意味します。
  def listable?; end

  # --- media_type -> String|nil
  # 
  # メディアタイプを返します。
  # 
  # IANA media type の値を返します。
  # 
  # 情報がない場合は nil を返します。
  def media_type; end

  # --- modify -> Time|nil
  # 
  # エントリの変更時刻を返します。
  # 
  # 情報がない場合は nil を返しますが、通常は
  # あるはずです。
  def modify; end

  # --- pathname -> String
  # 
  # パス名を返します。
  def pathname; end

  # --- perm -> String|nil
  # 
  # パーミッション文字列を返します。
  # 
  # 情報がない場合は nil を返しますが、通常は
  # あるはずです。
  def perm; end

  # --- purgeable? -> bool
  # 
  # ディレクトリの内容を削除可能であるならば true を返します。
  # 
  # これはディレクトリ自体が削除できるかどうかは意味しません。
  def purgeable?; end

  # --- readable? -> bool
  # 
  # 内容が読み出せるなら true を返します。
  def readable?; end

  # --- renamable? -> bool
  # 
  # 名前が変更可能であれば true を返します。
  # 
  # [[m:Net::FTP#rename]] が使えるかどうかを意味します。
  def renamable?; end

  # --- size -> Integer|nil
  # 
  # エントリのサイズを返します。
  # 
  # サイズ情報がない、もしくはサイズが意味をもたない(ディレクトリの場合など)
  # は nil を返します。
  def size; end

  # --- type -> String|nil
  # 
  # エントリの種類を返します。
  # 
  # "file", "dir", "cdir", "pdir" などを返します。
  # 
  # 情報がない場合は nil を返しますが、通常は
  # あるはずです。
  def type; end

  # --- unique -> String|nil
  # 
  # ユニークIDを返します。
  # 
  # 情報がない場合は nil を返しますが、通常は
  # あるはずです。
  def unique; end

  # --- writable? -> bool
  # 
  # ファイルに書き込めるなら true を返します。
  def writable?; end

end
