class SystemCallError
  # --- errno -> Integer | nil
  # 
  # レシーバに対応するシステム依存のエラーコードを返します。
  # 
  # エラーコードを渡さない形式で生成した場合は nil を返します。
  # 
  #   begin
  #     raise Errno::ENOENT
  #   rescue Errno::ENOENT => err
  #     p err.errno                 # => 2
  #     p Errno::ENOENT::Errno      # => 2
  #   end
  # 
  #   begin
  #     raise SystemCallError, 'message'
  #   rescue SystemCallError => err
  #     p err.errno                 # => nil
  #   end
  # 
  # 
  # なお、例外を発生させずにエラーコードを得るには、
  # [[m:Errno::EXXX::Errno]] 定数を使います。
  def errno; end

  # --- ===(other) -> bool
  # 
  # other が SystemCallError のサブクラスのインスタンスで、
  # かつ、other.errno の値が self::Errno と同じ場合に真を返します。そうでない場合は偽を返します。
  # 
  # 従って、特に other が self.kind_of?(other) である場合には [[m:Module#===]] と同様に真を返します。
  # その他に、 Errno::EXXX::Errno == Errno::EYYY::Errno である場合にも Errno::EXXX == Errno::EYYY.new は真を返します。
  # 
  # エラー名は異なるがエラーコードは同じであるような Errno::EXXX 例外をまとめて捕捉するために [[m:Module#===]] を上書きしていました。
  # しかし、Ruby 1.8 のリリース時点では同じ errno 値を持つクラスは一つしか作られないようになりました。そのため現在はこのメソッドは実質上 [[m:Module#===]] と同じ意味しかありません。
  # 
  # @param other 任意のオブジェクト
  # 
  # 例
  #     p Errno::EAGAIN::Errno
  #     p Errno::EWOULDBLOCK::Errno
  #     begin
  #       raise Errno::EAGAIN, "pseudo error"
  #     rescue Errno::EWOULDBLOCK
  #       p $!
  #     end
  # 
  #     # => 11
  #          11
  #          #<Errno::EAGAIN: pseudo error>
  def ===; end

  # --- new(error_message) -> SystemCallError
  # SystemCallError オブジェクトを生成して返します。
  # 
  # @param error_message エラーメッセージを表す文字列
  # 
  # 例:
  # 
  #   p SystemCallError.new("message")
  #       # => #<SystemCallError: unknown error - message>
  # 
  # --- new(error_message, errno) -> SystemCallError
  # --- new(errno) -> SystemCallError
  # 整数 errno に対応する [[c:Errno::EXXX]] オブジェクトを生成して返します。
  # 
  # 整数 errno をシステムコールで発生したエラーの原因を示すコードであると解釈し、
  # 対応する例外クラスのインスタンスを生成して返します。
  # 
  # 生成されるオブジェクトは SystemCallError の直接のインスタンスではなく、サブクラスのインスタンスです。
  # それらのサブクラスは [[c:Errno]] モジュール内に定義されています。
  # 対応するサブクラスが存在しないコードを与えた場合には、 SystemCallError の直接のインスタンスが生成されます。
  # 
  # エラーコードの取り得る値および意味はシステムに依存します。詳しくは [[c:Errno::EXXX]] を参照してください。
  # 
  # @param error_message エラーメッセージを表す文字列
  # @param errno システム依存のエラーコード
  # @raise TypeError errno を整数に変換できないときに発生します。
  # 
  # 例:
  # 
  #   p SystemCallError.new("message", 2)
  #       # => #<Errno::ENOENT: No such file or directory - message>
  #   p SystemCallError.new(2)
  #       # => #<Errno::ENOENT: No such file or directory>
  #   p SystemCallError.new(256)
  #       # => #<SystemCallError: Unknown error 256>
  def new; end

end
