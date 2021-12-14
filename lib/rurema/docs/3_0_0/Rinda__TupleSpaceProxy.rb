class Rinda::TupleSpaceProxy
  # --- notify(ev, tuple, sec = nil)  -> Rinda::NotifyTemplateEntry
  # event で指定した種類のイベントの監視を開始します。
  # 
  # 内部的にはリモートオブジェクトの [[m:Rinda::TupleSpace#notify]] にフォワードされます。
  # 詳細は [[m:Rinda::TupleSpace#notify]] 参照してください
  # 
  # @param event 監視対象のイベント(文字列)
  # @param pattern 監視対象となるタプルのパターン
  # @param sec 監視期間の長さ(秒数)
  def notify; end

  # --- read(tuple, sec=nil) -> [Array|Hash]
  # 
  # タプルスペース内の tuple にマッチするタプルを一つコピーして返します。
  # 
  # 内部的にはリモートオブジェクトの [[m:Rinda::TupleSpace#read]] にフォワードされます。
  # 詳細は [[m:Rinda::TupleSpace#read]] を参照してください。
  # 
  # @param tuple タプルのパターン
  # @param sec タイムアウト秒数
  # @raise Rinda::RequestExpiredError read がタイムアウトした場合に発生します
  # @raise Ridna::RequestCanceledError read が何らかの理由でキャンセルされた場合に発生します。
  def read; end

  # --- read_all(tuple) -> [Array|Hash]
  # タプルスペース内の tuple にマッチするタプルをすべてコピーして返します。
  # 
  # 内部的にはリモートオブジェクトの [[m:Rinda::TupleSpace#read_all]] にフォワードされます。
  # 詳細は [[m:Rinda::TupleSpace#read_all]] を参照してください。
  # 
  # @param tuple タプルのパターン
  def read_all; end

  # --- take(tuple, sec = nil) -> Array | Hash
  # tuple にマッチするタプルをタプルスペースから取り出して返します。
  # 
  # 内部的にはリモートオブジェクトの [[m:Rinda::TupleSpace#take]] にフォワードされます。
  # 詳細は [[m:Rinda::TupleSpace#take]] を参照してください。
  # 
  # @param tuple タプルのパターン
  # @param sec タイムアウト秒数
  # @raise Rinda::RequestExpiredError take がタイムアウトした場合に発生します
  # @raise Ridna::RequestCanceledError take が何らかの理由でキャンセルされた場合に発生します。
  def take; end

  # --- write(tuple, sec = nil) -> Rinda::TupleEntry
  # tuple をタプルスペースに加えます。
  # tuple を管理するための [[c:Rinda::TupleEntry]] オブジェクトを返します。
  # 
  # 内部的にはリモートオブジェクトの [[m:Rinda::TupleSpace#write]] にフォワードされます。
  # 詳細は [[m:Rinda::TupleSpace#write]] を参照してください。
  # 
  # @param tuple 追加する tuple (配列かHash)
  # @param sec 有効期限(秒数)
  def write; end

  # --- new(ts) -> Rinda::TupleSpaceProxy
  # ts を wrap した新たな TupleSpaceProxy オブジェクトを生成します。
  # 
  # @param ts ラップするリモート [[c:Rinda::TupleSpace]] オブジェクト
  def new; end

end
