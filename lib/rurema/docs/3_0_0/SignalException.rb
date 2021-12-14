class SignalException
  # --- signm -> String
  # 
  # self.message のエイリアスです。
  # 
  # //emlist[例][ruby]{
  # begin
  #   Process.kill('HUP', Process.pid)
  #   sleep
  # rescue SignalException => e
  #   puts e.signm  # => SIGHUP
  # end
  # //}
  def signm; end

  # --- signo -> Integer
  # 
  # self のシグナル番号を返します。
  # 
  # //emlist[例][ruby]{
  # p Signal.signame(1) # => "HUP"
  # begin
  #   Process.kill('HUP', Process.pid)
  #   sleep
  # rescue SignalException => e
  #   p e.signo # => 1
  # end
  # //}
  def signo; end

  # --- new(sig_number)           -> SignalException
  # --- new(sig_name)             -> SignalException
  # --- new(sig_number, sig_name) -> SignalException
  # 
  # 引数で指定したシグナルに関する SignalException オブジェクトを生成して返
  # します。
  # 
  # 引数は [[m:Signal.#list]] に含まれるもののいずれかを指定する必要があり
  # ます。
  # 
  # @param sig_name シグナル名を [[c:Symbol]] オブジェクト、文字列のいずれ
  #                 かで指定します。
  # 
  # @param sig_number シグナル番号を指定します。整数以外のオブジェクトを指
  #                   定した場合は to_int メソッドによる暗黙の型変換を試み
  #                   ます。
  # 
  # //emlist[例][ruby]{
  # signal_number = Signal.list["INT"]
  # se = SignalException.new(signal_number) # => #<SignalException: SIGINT>
  # se.signo # => 2
  # //}
  # 
  # //emlist[例][ruby]{
  # se = SignalException.new("INT") # => #<SignalException: SIGINT>
  # se.signm # => "SIGINT"
  # //}
  # 
  # @see [[m:Signal.#list]]
  def new; end

end
