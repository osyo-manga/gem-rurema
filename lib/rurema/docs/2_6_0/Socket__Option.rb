class Socket::Option
  # --- bool -> bool
  # オプションのデータ(内容)を真偽値に変換して返します。
  # 
  # @raise TypeError dataのバイト数が不適切である(sizeof(int)と異なる)場合に発生します
  # @see [[m:Socket::Option#data]]
  def bool; end

  # --- data -> String
  # --- to_s -> String
  # 
  # オプションのデータ(内容)を文字列で返します。
  # 
  # 内容が整数や真偽値、もしくは struct linger であることがわかっている場合には、
  # [[m:Socket::Option#int]], [[m:Socket::Option#bool]], [[m:Socket::Option#linger]]
  # を用いて
  # 
  # to_s は過去との互換性のために存在します。
  def data; end

  # --- family -> Integer
  # ソケットファミリを表す整数を返します。
  def family; end

  # --- int -> Integer
  # オプションのデータ(内容)を整数に変換して返します。
  # 
  # @raise TypeError dataのバイト数が不適切である(sizeof(int)と異なる)場合に発生します
  # @see [[m:Socket::Option#data]]
  def int; end

  # --- level -> Integer
  # ソケットオプションレベルを表す整数を返します。
  def level; end

  # --- linger -> [bool, Integer]
  # オプションが SOL_SOCKET/SO_LINGER である場合に、
  # オプションのデータ(内容)を真偽値と整数のペアとして返します。
  # 
  # @raise TypeError dataのバイト数が不適切である(sizeof(struct linger)と異なる)場合や、
  #                  level/optname が SOL_SOCKET/SO_LINGER でないに発生します
  # @see [[m:Socket::Option#data]]
  def linger; end

  # --- optname -> Integer
  # ソケットのオプション名を表す整数を返します。
  def optname; end

  # --- unpack(template) -> Array
  # data に対し [[m:String#unpack]] を呼び出し、その結果を返します。
  # 
  # このメソッドは過去との互換性のために存在します。
  def unpack; end

  # --- bool(family, level, optname, boolean) -> Socket::Option
  # 
  # 整数をデータとして持つ Socket::Option オブジェクト新たに生成し返します。
  # 
  # family, level, optname には Socket::SOL_SOCKET のような整数の他、
  # 文字列("SOL_SOCKET", "SOCKET")、シンボル(:SOL_SOCKET, :SOCKET)を
  # 指定することができます。
  # 
  # @param family ソケットファミリー
  # @param level ソケットオプションレベル
  # @param optname オプションの名前
  # @param boolean データ(真偽値)
  # 
  #   require 'socket'
  # 
  #   p Socket::Option.bool(:INET, :SOCKET, :KEEPALIVE, true)
  #   # => #<Socket::Option: INET SOCKET KEEPALIVE 1>
  # 
  #   p Socket::Option.bool(:INET, :SOCKET, :KEEPALIVE, false)
  #   # => #<Socket::Option: AF_INET SOCKET KEEPALIVE 0>
  def bool; end

  # --- int(family, level, optname, integer) -> Socket::Option
  # 
  # 整数をデータとして持つ Socket::Option オブジェクト新たに生成し返します。
  # 
  # family, level, optname には Socket::SOL_SOCKET のような整数の他、
  # 文字列("SOL_SOCKET", "SOCKET")、シンボル(:SOL_SOCKET, :SOCKET)を
  # 指定することができます。
  # 
  # @param family ソケットファミリー
  # @param level ソケットオプションレベル
  # @param optname オプションの名前
  # @param integer データ(整数)
  def int; end

  # --- linger(onoff, secs) -> Socket::Option
  # SOL_SOCKET/SO_LINGER 用の Socket::Option オブジェクト
  # を新たに生成し返します。
  # 
  # @param onoff 0/1もしくは真偽値
  # @param secs 整数値
  def linger; end

  # --- new(family, level, optname, data) -> Socket::Option
  # 
  # Socket::Option オブジェクト新たに生成し返します。
  # 
  # family, level, optname には Socket::SOL_SOCKET のような整数の他、
  # 文字列("SOL_SOCKET", "SOCKET")、シンボル(:SOL_SOCKET, :SOCKET)を
  # 指定することができます。
  # 
  # @param family ソケットファミリー
  # @param level ソケットオプションレベル
  # @param optname オプションの名前
  # @param data データ(文字列)
  # 
  # @see [[m:Socket::Option.int]], [[m:Socket::Option.bool]], [[m:Socket::Option.linger]]
  # 
  #   require 'socket'
  # 
  #   sockopt = Socket::Option.new(:INET, :SOCKET, :KEEPALIVE, [1].pack("i"))
  #   p sockopt #=> #<Socket::Option: INET SOCKET KEEPALIVE 1>
  def new; end

end
