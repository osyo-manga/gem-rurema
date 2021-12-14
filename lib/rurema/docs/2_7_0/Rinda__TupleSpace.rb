class Rinda::TupleSpace
  # --- notify(event, pattern, sec = nil) -> Rinda::NotifyTemplateEntry
  # event で指定した種類のイベントの監視を開始します。
  # 
  # イベントを生じさせたタプルがpattern にマッチした場合にのみ報告されます。
  # 
  # イベントが生じた場合、
  # このメソッドの返り値の [[c:Rinda::NotifyTemplateEntry]] を経由し、
  # [[m:Rinda::NotifyTemplateEntry#each]] を用いて報告を受け取ります。
  # 
  # sec で監視期間を秒数で指定できます。 nil で無限に監視し続けます。
  # 
  # event として以下の3つを指定できます。
  #   * 'write' : タプルが追加された
  #   * 'take' : タプルが take された
  #   * 'delete' : タプルが有効期限切れや上書きされたなどでタプルスペースから削除された
  # これで指定したイベントに加えて、
  # 有効期限切れによって監視が終了した場合には 'close' イベントが報告されます。
  # 
  # pattern で指定できるパターンについては [[ref:lib:rinda/rinda#tuplepattern]] を
  # 参照してください。
  # 
  # @param event 監視対象のイベント(文字列)
  # @param pattern 監視対象となるタプルのパターン
  # @param sec 監視期間の長さ(秒数)
  # 
  # === 例
  #   require 'rinda/tuplespace'
  #   
  #   tuplespace = Rinda::TupleSpace.new
  #   observer = tuplespace.notify("write", ["xyz", nil, nil])
  #   Therad.new do 
  #     observer.each{|event, tuple| p event, tuple }
  #   end
  #   
  #   tuplespace.write(["xyz", 0, 1]) 
  #   tuplespace.write(["pqr", 0, 1])
  #   tuplespace.write(["xyz", 4, 2])
  def notify; end

  # --- read(tuple, sec=nil) -> [Array|Hash]
  # タプルスペース内の tuple にマッチするタプルを一つコピーして返します。
  # 
  # このメソッド呼び出しが終了しても、タプルスペースからタプルは取り除かれません。
  # 
  # tuple で指定できるパターンについては [[ref:lib:rinda/rinda#tuplepattern]] を
  # 参照してください。
  # 
  # マッチするタプルが存在しない場合は、マッチするタプルがタプルスペースに
  # 投入されるまで待ちます。
  # 
  # sec でタイムアウト秒数を指定できます。
  # 待ち時間が sec 秒を過ぎた時には read をあきらめ
  # 例外 [[c:Rinda::RequestExpiredError]] を発生させます。
  # sec に nil を指定するとタイムアウトせずに無限に待ち続けます。
  # 
  # @param tuple タプルのパターン
  # @param sec タイムアウト秒数
  # @raise Rinda::RequestExpiredError read がタイムアウトした場合に発生します
  # @raise Ridna::RequestCanceledError read が何らかの理由でキャンセルされた場合に発生します。
  def read; end

  # --- read_all(tuple) -> [Array|Hash]
  # タプルスペース内の tuple にマッチするタプルをすべてコピーして返します。
  # 
  # このメソッド呼び出しが終了しても、タプルスペースからタプルは取り除かれません。
  # 
  # tuple で指定できるパターンについては [[ref:lib:rinda/rinda#tuplepattern]] を
  # 参照してください。
  # 
  # マッチするタプルが存在しない場合は、待たずに空の配列を返します。
  # 
  # このメソッドは主にデバッグのための利用を想定しています。
  # 
  # @param tuple タプルのパターン
  def read_all; end

  # --- take(tuple, sec = nil) -> Array | Hash
  # 
  # tuple にマッチするタプルをタプルスペースから取り出して返します。
  # 
  # tuple で指定できるパターンについては [[ref:lib:rinda/rinda#tuplepattern]] を
  # 参照してください。
  # 
  # マッチするタプルが存在しない場合は、マッチするタプルがタプルスペースに
  # 投入されるまで待ちます。
  # 
  # sec でタイムアウト秒数を指定できます。
  # 待ち時間が sec 秒を過ぎた時には take をあきらめ
  # 例外 [[c:Rinda::RequestExpiredError]] を発生させます。
  # sec に nil を指定するとタイムアウトせずに無限に待ち続けます。
  # 
  # @param tuple タプルのパターン
  # @param sec タイムアウト秒数
  # @raise Rinda::RequestExpiredError take がタイムアウトした場合に発生します
  # @raise Ridna::RequestCanceledError take が何らかの理由でキャンセルされた場合に発生します。
  def take; end

  # --- write(tuple, sec = nil) -> Rinda::TupleEntry
  # 
  # tuple をタプルスペースに加えます。
  # tuple を管理するための [[c:Rinda::TupleEntry]] オブジェクトを返します。
  # 
  # sec で追加したタプルの有効期限を指定できます。
  # 追加されてから sec 秒過ぎたタプルはタプルスペースから削除されます。
  # nil は無限を意味し、この場合にはタプルは経過時間によっては削除されません。
  # 
  # 返り値の [[c:Rinda::TupleEntry]] オブジェクトを使ってタプルを明示的に
  # キャンセルしたり有効期限を変更したりできます。ただし、利用にはGCなどに
  # 気を付ける必要があります。
  # 詳しくは[[c:Rinda::TupleEntry]] のエントリーを見てください。
  # 
  # 
  # @param tuple 追加する tuple (配列かHash)
  # @param sec 有効期限(秒数)
  # 
  # @raise Rinda::InvalidHashTupleKey 不正な Hash tuple (キーが文字列以外のもの)を
  #        追加しようとすると発生します
  # 
  # @return tuple 管理用の [[c:Rinda::TupleEntry]] オブジェクト
  def write; end

  # --- new(period = 60) -> Rinda::TupleSpace
  # 
  # [[c:Rinda::TupleSpace]] オブジェクトを生成します。
  # 
  # period で掃除用スレッドが動く周期を指定します。
  # このスレッドでは cancel されたタプルや expire(期限切れ、タイムアウト) された
  # タプルをタプルスペース内から取り除きます。
  # 
  # @param period cancel/expireされたタプルを取り除く周期を秒で指定します
  def new; end

end
