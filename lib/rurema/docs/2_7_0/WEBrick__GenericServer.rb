class WEBrick::GenericServer
  # --- [](key)    -> object
  # 
  # self.config[key] と同じです。
  def []; end

  # --- config     -> Hash
  # 
  # サーバの設定を保存したハッシュを返します。
  def config; end

  # --- listen(address, port) -> [TCPServer]
  # 
  # 与えられたアドレスとポートで [[c:TCPServer]] オブジェクトを生成し
  # listener として管理します。
  # 
  # @param address アドレスを文字列で指定します。
  # 
  # @param port listen するポートを整数で指定します。
  # 
  # @see [[m:WEBrick::GenericServer#listeners]], [[m:TCPServer#listen]]
  def listen; end

  # --- listeners    -> [TCPServer]
  # 
  # listen している [[c:TCPServer]] オブジェクトの配列を返します。
  def listeners; end

  # --- logger    -> WEBrick::Log
  # 
  # 生成する時に指定された、自身をロギングする [[c:WEBrick::Log]] のインス
  # タンスを返します。
  def logger; end

  # --- run(sock)    -> ()
  # 
  # クライアントと接続された TCPSocket オブジェクトを引数として呼ばれ、
  # 具体的な処理を行います。
  # WEBrick::GenericServer のサブクラスはこのメソッドを適切に再定義しなければいけません。
  # 
  # @param sock クライアントと接続された TCPSocket オブジェクトを指定します。
  def run; end

  # --- shutdown     -> ()
  # 
  # [[m:WEBrick::GenericServer#stop]] を呼び、全ての listeners を close します。
  def shutdown; end

  # --- ssl_context -> OpenSSL::SSL::SSLContext | nil
  # 
  # サーバが保持する [[c:OpenSSL::SSL::SSLContext]] オブジェクトを返します。
  def ssl_context; end

  # --- start               -> ()
  # --- start{|soc| ... }   -> ()
  # 
  # サーバをスタートします。
  # 
  # ブロックが与えられた場合 [[m:WEBrick::GenericServer#run]] メソッドの
  # 代わりにブロックが実際のクライアントとの応答を担います。
  # ブロックは [[c:TCPSocket]] オブジェクトを引数として呼ばれます。
  def start; end

  # --- status    -> Symbol
  # 
  # 現在のサーバのステータスを [[c:Symbol]] オブジェクトで返します。
  # 値は :Running(活動中), :Shutdown(終了処理中), :Stop(完全に停止) のいずれかです。
  def status; end

  # --- stop    -> ()
  # 
  # サーバを停止します。
  # 
  # 実際にはサーバの状態を :Shutdown にするだけで、サーバがすぐに停止すると
  # は限りません。
  def stop; end

  # --- tokens    -> Thread::SizedQueue
  # 
  # MaxClient の設定のために使われる [[c:Thread::SizedQueue]] オブジェクト
  # を返します。[[c:Thread::SizedQueue]] オブジェクトのサイズは現在受け付け
  # ることのできるクライアントの数です。
  # 
  # MaxClient を知りたい場合は self.tokens.max です。
  # self.tokens.max - self.tokens.length が現在のクライアントの接続数です。
  def tokens; end

  # --- new(config = {}, default = WEBrick::Config::General) -> WEBrick::GenericServer
  # 
  # GenericServer オブジェクトを生成して返します。
  # 
  # @param config サーバの設定を保存したハッシュを指定します。有効なキーと
  #               値は以下のとおりです。
  # 
  # : :ServerName
  #   サーバのホスト名を表す文字列を指定します。デフォルトの Utils.getservername は /etc/hostname
  #   に書かれている文字列です。
  # : :BindAddress
  #   サーバのアドレスを指定します。デフォルトの nil や "0.0.0.0", "::" などを指定した
  #   場合は使用可能なすべてのネットワークインターフェースに対して listen を開始します。
  #   [[ref:lib:socket#host_format]] を参照して下さい。
  # : :Port
  #   サーバのポートを指定します。[[ref:lib:socket#service_format]]を参照を参照して下さい。
  # : :MaxClients
  #   クライアントの最大接続数を表す整数です。
  # : :ServerType
  #   サーバのタイプを表すクラスを指定します。指定するクラスはブロックを取るstartという名前のクラスメソッドを持つ必要があります。サーバは、startメソッドの中でクライアントからの応答待ちのループ処理を実行します。WEBrickは呼ばれたスレッド内で実行する[[c:WEBrick::SimpleServer]] と、子プロセスをforkしてデーモンとして実行する[[c:WEBrick::Daemon]] を提供します。また、[[c:Thread]]を指定するとサーバはスレッド内で実行されるため[[m:WEBrick::GenericServer#start]]は呼び出し直後に呼び出し元に制御を戻します。
  # : :Logger
  #   ログをとるオブジェクト(Logger オブジェクト)を指定します。通常は [[c:WEBrick::Log]] のインスタンスを指定します。
  #   WEBrick::Log.new(log_file, level) のように出力先とログレベルを設定することができます。
  #   Logger オブジェクトに定義されているべきメソッドに関しては [[c:WEBrick::Log]] を参照して下さい。
  # : :ServerSoftware
  #   サーバソフトウェア名を文字列で指定します。[[c:WEBrick::HTTPServer]] では Server ヘッダにこの値が出力されます。
  # : :DoNotListen
  #   true の場合、GenericServer オブジェクトを生成しただけでは listen を開始しません。
  # : :StartCallback
  #   start 開始時に呼ばれる [[c:Proc]] オブジェクト。呼ばれる時に引数は
  #   特に与えられません。
  # : :StopCallback
  #   サーバを stop した時に呼ばれる [[c:Proc]] オブジェクトを指定します。呼ばれる時に引数は
  #   特に与えられません。
  # : :AcceptCallback
  #   クライアントからの接続を accept したときに呼ばれる [[c:Proc]] オブジェクトを指定します。
  #   クライアントと接続された [[c:TCPSocket]] オブジェクトを引数として呼ばれます。
  # : :DoNotReverseLookup
  #   true の場合、ホスト名への逆引きを行わなくなります。
  #   [[m:BasicSocket#do_not_reverse_lookup]]
  #   も参照して下さい。
  # 
  # @param default サーバのデフォルトの設定を保存したハッシュを指定します。指定された config で
  #                設定がなかった項目に関してはこの default の値が使われます。
  # 
  # @see [[m:WEBrick::Config::General]]
  def new; end

  # --- new(config = {}, default = WEBrick::Config::General) -> WEBrick::GenericServer
  # 
  # GenericServer オブジェクトを生成して返します。
  # 
  # config で有効な項目が増えます。以下は増える項目とそのデフォルト値です。
  # 
  #   :ServerSoftware       => "#{svrsoft} OpenSSL/#{osslv}",
  #   :SSLEnable            => true, # Ruby 1.8.3 以降では false がデフォルトです。
  #   :SSLCertificate       => nil,
  #   :SSLPrivateKey        => nil,
  #   :SSLClientCA          => nil,
  #   :SSLExtraChainCert    => nil,
  #   :SSLCACertificateFile => nil,
  #   :SSLCACertificatePath => nil,
  #   :SSLCertificateStore  => nil,
  #   :SSLVerifyClient      => ::OpenSSL::SSL::VERIFY_NONE,
  #   :SSLVerifyDepth       => nil,
  #   :SSLVerifyCallback    => nil,   # custom verification
  #   :SSLTimeout           => nil,
  #   :SSLOptions           => nil,
  #   :SSLStartImmediately  => true,
  #   # Must specify if you use auto generated certificate.
  #   :SSLCertName          => nil,
  #   :SSLCertComment       => "Generated by Ruby/OpenSSL"
  # 
  # @param config サーバの設定を保存したハッシュを指定します。
  # 
  # @param default サーバのデフォルトの設定を保存したハッシュを指定します。指定された config で
  #                設定がなかった項目に関してはこの default の値が使われます。
  # 
  # @see [[m:WEBrick::Config::General]]
  def new; end

end