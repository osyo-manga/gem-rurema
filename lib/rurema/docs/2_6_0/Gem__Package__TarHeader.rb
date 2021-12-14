class Gem::Package::TarHeader
  # --- ==(other) -> bool
  # 
  # 自身と other が等しければ真を返します。
  # そうでない場合は偽を返します。
  # 
  # @param other 比較対象のオブジェクトを指定します。
  def ==; end

  # --- checksum -> Integer
  # 
  # tar のヘッダに含まれるチェックサムを返します。
  def checksum; end

  # --- devmajor -> Integer
  # 
  # tar のヘッダに含まれる devmajor を返します。
  def devmajor; end

  # --- devminor -> Integer
  # 
  # tar のヘッダに含まれる devminor を返します。
  def devminor; end

  # --- empty? -> bool
  # 
  # ヘッダが "\0" で埋められている場合、真を返します。
  # そうでない場合は、偽を返します。
  def empty?; end

  # --- gid -> Integer
  # 
  # tar のヘッダに含まれる gid を返します。
  def gid; end

  # --- gname -> String
  # 
  # tar のヘッダに含まれるグループ名を返します。
  def gname; end

  # --- linkname -> String
  # 
  # tar のヘッダに含まれる linkname を返します。
  def linkname; end

  # --- magic -> String
  # 
  # tar のヘッダに含まれる magic を返します。
  def magic; end

  # --- mode -> Integer
  # 
  # tar のヘッダに含まれる mode を返します。
  def mode; end

  # --- mtime -> Integer
  # 
  # tar のヘッダに含まれる mtime を返します。
  def mtime; end

  # --- name -> String
  # 
  # tar のヘッダに含まれる name を返します。
  def name; end

  # --- prefix -> String
  # 
  # tar のヘッダに含まれる prefix を返します。
  def prefix; end

  # --- size -> Integer
  # 
  # tar のヘッダに含まれる size を返します。
  def size; end

  # --- to_s -> String
  # 
  # ヘッダの情報を文字列として返します。
  def to_s; end

  # --- typeflag -> String
  # 
  # tar のヘッダに含まれる typeflag を返します。
  def typeflag; end

  # --- uid -> Integer
  # 
  # tar のヘッダに含まれる uid を返します。
  def uid; end

  # --- uname -> String
  # 
  # tar のヘッダに含まれるユーザ名を返します。
  def uname; end

  # --- update_checksum
  # チェックサムを更新します。
  def update_checksum; end

  # --- version -> Integer
  # 
  # tar のヘッダに含まれる version を返します。
  def version; end

  # --- from(stream) -> Gem::Package::TarHeader
  # 
  # stream から先頭 512 バイトを読み込んで [[c:Gem::Package::TarHeader]] の
  # インスタンスを作成して返します。
  # 
  # @param stream IO のように read メソッドを持つオブジェクトを指定します。
  def from; end

  # --- FIELDS -> Array
  # 
  # 内部で使用します。
  def FIELDS; end

  # --- PACK_FORMAT -> String
  # 
  # 内部で使用します。
  def PACK_FORMAT; end

  # --- UNPACK_FORMAT -> String
  # 
  # 内部で使用します。
  def UNPACK_FORMAT; end

end
