class DBM
  # --- [](key) -> String
  # 
  # key をキーとする値を返します。
  # 
  # @param key キー。
  def []; end

  # --- []=(key, value)
  # 
  # key をキーとして、value を格納します。
  # value として nil を指定すると、key に対する要素を削除します。
  # 
  # @param key   キー。
  # @param value 値。
  def []=; end

  # --- clear -> self
  # 
  # DBM ファイルを空にします。
  def clear; end

  # --- close -> nil
  # 
  # DBM ファイルをクローズします。以後の操作は例外を発生させます。
  def close; end

  # --- closed? -> bool
  # 
  # DBM ファイルが既に閉じられているか調べます。
  # 
  # 既に閉じられていれば true を返します。そうでなければ false を返します。
  def closed?; end

  # --- delete(key) -> String
  # 
  # key をキーとする要素を削除します。
  # 
  # @return 削除した要素の値を返します。
  # 
  # @raise DBMError 要素の削除に失敗した場合に発生します。
  def delete; end

  # --- reject! { |key, value|  ...  } -> self
  # --- delete_if { |key, value|  ...  } -> self
  # 
  # ブロックを評価した値が真であれば該当する要素を削除します。
  # 
  # このメソッドは self を破壊的に変更します。
  def delete_if; end

  # --- each {|key, value|  ...  } -> self
  # --- each_pair {|key, value|  ...  } -> self
  # 
  # 各要素に対するイテレータ。
  def each; end

  # --- each_key {|key|  ...  } -> self
  # 
  # 全ての key に対して繰り返すイテレータ。
  def each_key; end

  # --- each_value {|value|  ...  } -> self
  # 
  # 全ての value に対して繰り返すイテレータ。
  def each_value; end

  # --- empty?() -> bool
  # 
  # データベースが空の時、真を返します。
  def empty?; end

  # --- fetch(key, ifnone = nil) -> String
  # 
  # データベースからキーを探して対応する要素の値を返します。
  # 
  # @param key    キー。
  # @param ifnone キーが見つからなかった場合に返す値。
  # 
  # @raise IndexError ifnone を指定していないとき、キーが見つからなかった場合に発生します。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   p db1.fetch('a')                     #=> 'aaa'
  #   p db1.fetch('z', 'zzz')              #=> 'zzz'
  #   p db1.fetch('z'){|key| [:key, key] } #=> [:key, 'z']
  #   p db1.fetch('z')                     #=> IndexError 発生
  # 
  # @see [[m:Hash#fetch]]
  def fetch; end

  # --- has_key?(key) -> bool
  # --- key?(key) -> bool
  # --- include?(key) -> bool
  # --- member?(key) -> bool
  # 
  # key がデータベース中に存在する時、真を返します。
  # 
  # @param key キー。
  def has_key?; end

  # --- has_value?(value) -> bool
  # --- value?(value) -> bool
  # 
  # value を値とする組がデータベース中に存在する時、真を返します。
  # 
  # @param value 検索したい値。
  def has_value?; end

  # --- index(value) -> String | nil
  # 
  # このメソッドは deprecated です。[[m:DBM#key]] を使用してください。
  def index; end

  # --- invert -> Hash
  # 
  # 値からキーへのハッシュを返します。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   p db1.invert  #=> {"bbbbbb" => "b", "aaa" => "a"}
  def invert; end

  # --- key(value) -> String | nil
  # 
  # 与えられた値に対応するキーを返します。
  # 
  # 対応する要素が存在しない時には nil を返します。
  # 値に対応するキーが複数ある場合は最初に見つかったキーを返します。
  # 
  # @param value キーを探したい値を指定します。
  def key; end

  # --- keys -> [String]
  # 
  # データベース中に存在するキー全てを含む配列を返します。
  def keys; end

  # --- length -> Integer
  # --- size -> Integer
  # 
  # データベース中の要素の数を返します。
  # 
  # 現在の実装では要素数を数えるためにデータベースを全部検索します。
  def length; end

  # --- reject{ |key, value| ... } -> Hash
  # 
  # ブロックを評価した値が真であれば該当する要素を削除します。
  # 
  #   self.to_hash.reject{|key, value| ... }
  # 
  # と同じです。
  # 
  # @see [[m:Hash#reject]]
  def reject; end

  # --- replace(other) -> self
  # 
  # self の内容を other の内容で置き換えます。
  # 
  # @param other each_pair メソッドを持つオブジェクトでなければなりません。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   db2 = DBM.open('bbb.db', 0666, DBM::NEWDB)
  #   db2[:bb] = 'bbb'
  #   db2[:cc] = 'ccc'
  #   
  #   p db1.keys #=> ['b', 'a']
  #   
  #   db1.replace(db2)
  #   
  #   p db1.keys #=> ['bb', 'cc']
  #   p db2.keys #=> ['bb', 'cc']
  #   
  #   hash = {'x' => 'xxx', 'y' => 'yyy' }
  #   p db1               #=> #<DBM:0xb7c7eb08>
  #   p db1.replace(hash) #=> #<DBM:0xb7c7eb08>
  def replace; end

  # --- select{|key, value| ... } -> [Array]
  # 
  # ブロックを評価して真になった要素のみを配列に格納して返します。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   
  #   p db1.select {|key, value| key == 'a' } #=> [["a", "aaa"]]
  def select; end

  # --- shift -> String
  # 
  # データベース中の要素を一つ取り出し、データベースから削除します。
  def shift; end

  # --- store(key, value) -> String
  # 
  # key に対して value を格納します。
  # 
  # @param key   キー。
  # @param value 値。
  # 
  # @see [[m:DBM#[]=]]
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   p db1.store('c', 'ccc') #=> "ccc"
  def store; end

  # --- to_a -> [Array]
  # 
  # キーと値のペアを配列に変換して返します。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  # 
  #   p db1.to_a #=> [["b", "bbbbbb"], ["a", "aaa"]]
  def to_a; end

  # --- to_hash -> Hash
  # 
  # self をハッシュに変換して返します。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   p db1.to_hash #=> {"a"=>"aaa", "b"=>"bbbbbb"}
  def to_hash; end

  # --- update(other){|key, value| ... } -> self
  # 
  # self と other の内容をマージします。
  # 
  # 重複するキーに対応する値はother の内容で上書きされます。
  # 
  # @param other each_pair メソッドを持つオブジェクトでなければなりません。
  # 
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   db2 = DBM.open('bbb.db', 0666, DBM::NEWDB)
  #   db2[:bb] = 'bbb'
  #   db2[:cc] = 'ccc'
  #   
  #   db1.update(db2)
  #   p db1.keys #=> ["bb", "cc", "b", "a"]
  def update; end

  # --- values -> [String]
  # 
  # データベース中に存在する値全てを含む配列を返します。
  def values; end

  # --- values_at(*keys) -> [String]
  # 
  # keys に対応する値を配列に格納して返します。
  # 
  # @param keys キー。複数指定可能です。
  # 
  #   require 'dbm'
  #   
  #   db1 = DBM.open('aaa.db', 0666, DBM::NEWDB)
  #   db1[:a] = 'aaa'
  #   db1[:b] = 'bbbbbb'
  #   
  #   p db1.values_at('a', 'b') #=> ["aaa", "bbbbbb"]
  def values_at; end

  # --- new(dbname, mode = 0666, flags = nil) -> DBM
  # 
  # dbname で指定したデータベースをモードを mode に設定してオープンします。
  def new; end

  # --- open(dbname, mode = 0666, flags = nil) -> DBM
  # --- open(dbname, mode = 0666, flags = nil) {|db| ... } -> ()
  # 
  # dbname で指定したデータベースをモードを mode に設定してオープンします。
  # 
  # mode の省略値は 0666 です。mode として nil を指定すると
  # データベースが存在しない時には新たなデータベースを作らず nil を返します。
  # 
  # @param dbname データベース名
  # @param mode   データベースのオープンモード
  # @param flags  以下のいずれかを指定します。
  # : DBM::READER
  #   データベースの読み込みのみを行う
  # : DBM::WRITER
  #   データベースの新規作成はせず読み書きする
  # : DBM::WRCREAT
  #   データベースが存在しなければ新規作成して読み書きする
  # : DBM::NEWDB
  #   データベースを常に新規作成して既存のデータは破棄する
  def open; end

  # --- NEWDB -> Integer
  # 
  # 書き込みモードで、すでにファイルが存在したら削除して作り直します．
  # 
  # @see [[m:DBM.open]]
  def NEWDB; end

  # --- READER -> Integer
  # 
  # 読み込みモードでオープンします．
  # 
  # @see [[m:DBM.open]]
  def READER; end

  # --- VERSION -> String
  # 
  # libdbm のバージョンを表す文字列です。
  # 
  # DB_VERSION_STRING という定数が C 言語レベルで定義されていない場合は
  # "unknown" になります。
  def VERSION; end

  # --- WRCREAT -> Integer
  # 
  # 書き込みモードで、すでにファイルが存在しなかったら作ります．
  # 
  # @see [[m:DBM.open]]
  def WRCREAT; end

  # --- WRITER -> Integer
  # 
  # 書き込みモードでオープンします．
  # 
  # @see [[m:DBM.open]]
  def WRITER; end

end
