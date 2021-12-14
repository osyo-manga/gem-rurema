module Fiddle::Importer
  # --- [](name) -> Fiddle::Function|nil
  # [[m:Fiddle::Importer#extern]] でインポートした関数の 
  # [[c:Fiddle::Function]] オブジェクト
  # を返します。
  # 
  # name という名前の関数が存在しない場合は nil を返します。
  # 
  # @param name 関数の名前の文字列
  def []; end

  # --- bind(signature, *opts){ ... } -> Fiddle::Function
  # Ruby のブロックを C の関数で wrap し、その関数をモジュールに
  # インポートします。
  # 
  # これでインポートされた関数はモジュール関数として定義されます。
  # また、[[m:Fiddle::Importer#[] ]] で [[c:Fiddle::Function]] オブジェクトとして
  # 取り出すことができます。
  # 
  # signature で関数の名前とシネグチャを指定します。例えば
  # "int compare(void*, void*)" のように指定します。
  # 
  # opts には :stdcall もしくは :cdecl を渡すことができ、
  # 呼出規約を明示することができます。
  # 
  # @return インポートした関数を表す [[c:Fiddle::Function]] オブジェクトを返します。
  # 
  # @param signature 関数の名前とシネグチャ
  # @param opts オプション
  # 
  # 例
  #   require 'fiddle/import'
  #   
  #   module M
  #     extend Fiddle::Importer
  #     dlload "libc.so.6"
  #     typealias "size_t", "unsigned long"
  #     extern "int qsort(void*, size_t, size_t, void*)"
  #     
  #     bind("int compare(void*, void*)"){|px, py|
  #       x = px.to_s(Fiddle::SIZEOF_INT).unpack("i!")
  #       y = py.to_s(Fiddle::SIZEOF_INT).unpack("i!")
  # 
  #       x <=> y
  #     }
  #   end
  #   
  #   data = [32, 180001, -13, -1, 0, 49].pack("i!*")
  #   M.qsort(Fiddle::Pointer[data], 6, Fiddle::SIZEOF_INT, M["compare"])
  #   p data.unpack("i!*") # => [-13, -1, 0, 32, 49, 180001]
  def bind; end

  # --- create_value(type, val = nil) -> Fiddle::CStruct
  # --- value(type, val = nil) -> Fiddle::CStruct
  # 型が type で要素名が "value" であるような構造体を
  # 定義([[m:Fiddle::Importer#struct]])し、
  # その構造体のメモリを [[m:Fiddle::CStruct#malloc]] で確保し、
  # 確保したメモリを保持しているオブジェクトを返します。
  # 
  # type は "int", "void*" といった文字列で型を指定します。
  # val に nil 以外を指定すると、確保された構造体に
  # その値を代入します。
  # 
  # @param type 型を表す文字列
  # @param val 構造体に確保される初期値
  # 
  # 例
  #   require 'fiddle/import'
  #   
  #   module M
  #     extend Fiddle::Importer
  #   end
  #   
  #   v = M.value("int", 32)
  #   p v.value # => 32
  #   v.value = 48
  #   p v.value # => 48
  def create_value; end

  # --- dlload(*libs) -> ()
  # 
  # C の動的ライブラリをモジュールにインポートします。
  # 
  # これで取り込んだライブラリの関数は [[m:Fiddle::Importer#extern]] で
  # インポートできます。
  # 
  # 複数のライブラリを指定することができます。
  # ファイル名文字列を指定することでそのライブラリをインポートします。
  # [[c:Fiddle::Handle]] を渡すとそのハンドルが指しているライブラリをインポート
  # します。
  # 
  # このメソッドは同じモジュールで2回呼ばないでください。
  # 
  # 
  # @param libs インポートするライブラリ
  # @raise Fiddle::DLError ライブラリのインポートができなかった場合に発生します
  def dlload; end

  # --- extern(signature, *opts) -> Fiddle::Function
  # 
  # [[m:Fiddle::Importer#dlload]] で取り込んだライブラリから
  # C の関数をインポートします。
  # 
  # インポートした関数はそのモジュールにモジュール関数として定義されます。
  # 
  # signature で関数の名前とシネグチャを指定します。例えば
  # "int strcmp(char*, char*)" のように指定することができます。
  # 
  # opts には :stdcall もしくは :cdecl を渡すことができ、
  # 呼出規約を明示することができます。
  # 
  # @return インポートした関数を表す [[c:Fiddle::Function]] オブジェクトを返します。
  # 
  # @param signature 関数の名前とシネグチャ
  # @param opts オプション
  # 
  # 例
  #   require 'fiddle/import'
  #   
  #   module M
  #     extern Fiddle::Importer
  #     dlload "libc.so.6"
  #     extern "int strcmp(char*, char*)"
  #   end
  #    
  #   M.strcmp("abc", "abc") # => 0
  #   M.strcmp("abc", "abd") # => -1
  def extern; end

  # --- import_symbol(name) -> Fiddle::Pointer
  # 取り込んだライブラリからシンボルをインポートします。
  # 
  # 返り値はシンボルがロードされたメモリのアドレスを持つ [[c:Fiddle::Pointer]] 
  # オブジェクトを返します。
  # 
  # @param name シンボル名(文字列)
  def import_symbol; end

  # --- sizeof(t) -> Integer
  # 
  # C における sizeof(t) の値を返します。
  # 
  # t が文字列の場合、その文字列が表す C の型の size が返されます。
  # 例えば、sizeof("char") は 1 を返します。
  # sizeof("char*") は環境によって 4 や 8 といった値を返します。
  # 
  # [[m:Fiddle::Importer#struct]] で定義した
  # 構造体クラスを渡すと、その構造体のサイズを返します。
  # [[m:Fiddle::Importer#union]] で定義した共用体クラスも同様です。
  # 
  # t がクラスの場合、t が to_ptr というインスタンスメソッドを持っている
  # ならば t.size を返します。
  # 
  # それ以外の場合は Pointer[t].size を返します。
  # 
  # @param t サイズを計算する対象
  # @raise Fiddle::DLError t として文字列を渡し、それが表している型を Fiddle が知らなかった
  #        場合に発生します
  # 
  # 例:
  # 
  #   require 'fiddle/import'
  #   
  #   module M
  #     extend Fiddle::Importer
  #     Timeval = struct(["long tv_sec", "long tv_usec"])
  #     p sizeof("char") # => 1
  #     p sizeof("void*") # => 8
  #     p sizeof(Timeval) # => 16
  #   end
  def sizeof; end

  # --- struct(signature) -> Class
  # C の構造体型に対応する Ruby のクラスを構築して返します。
  # 
  # 構造体の各要素は C と似せた表記ができます。そしてそれを
  # 配列で signature に渡してデータを定義します。例えば C における
  #   struct timeval {
  #     long tv_sec;
  #     long tv_usec;
  #   };
  # という構造体型に対応して
  #   Timeval = struct(["long tv_sec", "long tv_usec"])
  # として構造体に対応するクラスを生成します。
  # 
  # このメソッドが返すクラスには以下のメソッドが定義されています
  #   * クラスメソッド malloc
  #   * initialize
  #   * to_ptr
  #   * to_i
  #   * 構造体の各メンバへのアクセサ
  # 返されるクラスは [[c:Fiddle::CStruct]] を継承しています。詳しくは
  # そちらを参照してください。
  # 
  # 
  # @param signature 構造体の各要素を文字列で表現したものの配列
  # 
  #   require 'fiddle/import'
  #   
  #   module M
  #     extend Fiddle::Importer
  #     dlload "libc.so.6"
  #     extern "int gettimeofday(void*, void*)"
  #     Timeval = struct(["long tv_sec", "long tv_usec"])
  #   end
  #   
  #   time = M::Timeval.malloc
  #   M.gettimeofday(time, Fiddle::NULL)
  #   p time.tv_sec
  #   p time.tv_usec
  def struct; end

  # --- typealias(new, orig) -> ()
  # extern や struct で利用する型の別名を定義します。
  # 
  # @param new 別名(文字列)
  # @param orig 別名を付けたい型の名前(文字列)
  # @see [[m:Fiddle::Importer#extern]], [[m:Fiddle::Importer#sizeof]], 
  #      [[m:Fiddle::Importer#struct]], [[m:Fiddle::Importer#union]]
  def typealias; end

  # --- union(signature) -> Class
  # C の共用体型に対応する Ruby のクラスを構築して返します。
  # 
  # 共用体型を Ruby 上で定義する方法は [[m:Fiddle::Importer#struct]] と
  # ほぼ同様です。C における
  #   typedef union epoll_data
  #   {
  #     void *ptr;
  #     int fd;
  #     uint32_t u32;
  #     uint64_t u64;
  #   } epoll_data_t;
  # は、Ruby上では
  #   require 'fiddle/import'
  #   
  #   module M
  #     extend Fiddle::Importer
  #     dlload "libc.so.6"
  #     typealias("uint32_t", "unsigned int")
  #     typealias("uint64_t", "unsigned long long")
  #   
  #     EPollData = union(["void *ptr",
  #                        "int fd",
  #                        "uint32_t u32",
  #                        "uint64_t u64",
  #                       ])
  #   end
  # となります。
  # 
  # 返されるクラスは [[c:Fiddle::CUnion]] を継承しています。
  # 
  # 1.9.x ではこのメソッドで返されるクラスは正しく動作しません。
  # 2.0以降では修正されています。
  # 
  # @param signature 共用体の各要素を文字列で表現したものの配列
  def union; end

end
