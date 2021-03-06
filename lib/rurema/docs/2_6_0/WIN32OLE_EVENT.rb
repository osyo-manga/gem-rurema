class WIN32OLE_EVENT
  # --- handler -> object
  # [[m:WIN32OLE_EVENT#handler=]]メソッドで登録したイベントハンドラオブジェ
  # クトを返します。
  # 
  # @return イベントハンドラオブジェクト。未登録ならばnil。
  def handler; end

  # --- handler=(obj) -> ()
  # イベント処理を実行するオブジェクトを登録します。
  # 
  # イベントハンドラをメソッドとして持つオブジェクトをイベントハンドラとし
  # て登録します。
  # 
  # イベントハンドラはイベント名に「on」を前置します。もし、イベントに対応
  # するonメソッドが実装されていなければmethod_missingが呼ばれます。イベン
  # ト名は大文字小文字を区別するため、正確な記述が必要です。
  # 
  # @param obj イベントに対応するメソッドを持つオブジェクト。イベント受信を
  #            解除するにはnilを指定します。
  # 
  #   class IeHandler
  #     def initialize
  #       @completed = false
  #     end
  #     attr_reader :completed
  #     def onDocumentComplete(disp, uri)
  #       disp.document.getElementsByTagName('a').each do |e|
  #         puts "#{e.innerHTML}=#{e.href}"
  #       end
  #       @completed = true
  #     end
  #     def method_missing(id, *args)
  #       puts "event=#{id.to_s}, args=#{args.inspect}"
  #     end
  #   end
  # 
  #   ie = WIN32OLE.new('InternetExplorer.Application.1')
  #   event = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  #   event.handler = IeHandler.new
  #   ie.Navigate2 'http://www.ruby-lang.org/ja/'
  #   loop do
  #     break if event.handler.completed
  #     WIN32OLE_EVENT.message_loop
  #   end
  #   ie.Quit
  # 
  # [[m:WIN32OLE_EVENT#on_event]]などの呼び出しでブロックが登録されている場
  # 合、そちらが優先されます。
  def handler=; end

  # --- off_event(event = nil) -> ()
  # [[m:WIN32OLE_EVENT#on_event]]で登録したブロックを解除します。
  # 
  # @param event 文字列またはシンボルで登録時に指定したイベント名を指定しま
  # す。nilの場合、[[m:WIN32OLE_EVENT#on_event]]に対してnilを指定したブロッ
  # クを解除します。
  # 
  #   ev = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents')
  #   ev.on_event(:NavigateComplete) {|url| puts url }
  #   ...
  #   ev.off_event(:NavigateComplete)
  def off_event; end

  # --- on_event(event = nil) {|*args| ... } -> ()
  # 
  # イベント通知を受けるブロックを登録します。
  # 
  # 引数にはイベントのメソッド名を指定します。引数を省略した場合は、すべて
  # のイベントを対象とするブロックの登録となります。
  # 
  # @param event イベント名を文字列かシンボルで指定します。イベント名は大文
  #              字小文字を区別します。省略時にはすべてのイベントが対象となります。
  # 
  # @param args サーバがイベント通知時に指定した引数です。
  #             eventパラメータを省略した場合、第1引数にはイベントのメソッ
  #             ド名が文字列で与えられます。引数の変更が必要な場合は、
  #             [[m:WIN32OLE_EVENT#on_event_with_outargs]]を利用してください。
  # 
  # @raise WIN32OLERuntimeError [[m:WIN32OLE_EVENT#unadvise]]によってイベン
  #                             トソースと切断済みです。
  # 
  #   ie = WIN32OLE.new('InternetExplorer.Application')
  #   ev = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  #   ev.on_event("NavigateComplete2") do |browser, url| 
  #     puts url
  #   end
  # 
  # 同じオブジェクトに対してeventパラメータを指定したブロックと指定しないブ
  # ロックが混在している場合、通知されたイベントに対応するブロックがあれば
  # そちらだけが呼び出されます。
  # 
  #   ie = WIN32OLE.new('InternetExplorer.Application')
  #   ev = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  #   ev.on_event("NavigateComplete2") do |browser, url| 
  #     puts url
  #   end
  #   ev.on_event do |*args|   # <- NavigateComplete2イベント時は実行されない
  #     puts args[0]
  #   end
  #   ...
  # 
  # 当メソッドはイベント名の大文字小文字を区別するほか、イベント名の存在確
  # 認を行いません。このため、誤ったイベント名を記述してもエラーとはならず、
  # 単にイベントを受け取れなくなります。
  def on_event; end

  # --- on_event_with_outargs(event = nil) {|*args| ... } -> ()
  # イベント通知を受けて結果を呼び出し元へ返すブロックを登録します。
  # 
  # 引数にはイベントのメソッド名を指定します。引数を省略した場合は、すべて
  # のイベントを対象とするブロックの登録となります。
  # 
  # [[m:WIN32OLE_EVENT#on_event]]と異なり、イベントのブロック変数に戻り値を
  # 設定できます。
  # 
  # @param event イベント名を文字列かシンボルで指定します。イベント名は大文
  #              字小文字を区別します。省略時にはすべてのイベントが対象となります。
  # 
  # @param args サーバがイベント通知時に指定した引数の配列です。
  #             eventパラメータを省略した場合、第1要素にはイベントのメソッ
  #             ド名が文字列で与えられます。なお、引数に値を設定するには、
  #             ブロック変数を分割せずに配列の形式で受けてください。
  # 
  # @raise WIN32OLERuntimeError [[m:WIN32OLE_EVENT#unadvise]]によってイベン
  #                             トソースと切断済みです。
  # 
  #   ie = WIN32OLE.new('InternetExplorer.Application')
  #   ev = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  #   ev.on_event('BeforeNavigate2') do |*args|
  #     args[6] = true unless args[4]  # Cancel = true unless PostData
  #   end
  # 
  # 当メソッドはイベント名の大文字小文字を区別するほか、イベント名の存在確
  # 認を行いません。このため、誤ったイベント名を記述してもエラーとはならず、
  # 単にイベントを受け取れなくなります。
  def on_event_with_outargs; end

  # --- unadvise -> ()
  # イベント通知元をオブジェクトから切断します。
  # 
  # 当メソッド実行後は、イベント通知を受けられなくなります。また、このオブ
  # ジェクトを利用した[[m:WIN32OLE_EVENT#on_event]]などの呼び出しはエラー
  # （[[c:WIN32OLERuntimeError]]の通知）となります。
  # 
  # WIN32OLE_EVENTオブジェクトは一度生成すると、イベントハンドラが登録され
  # ている限りオブジェクトを解放しません。というのは、イベントの通知元のオ
  # ブジェクトと相互参照されるため、自動的に解放することができないからです。
  # 結果として、OLEオートメーションサーバの解放もスクリプトが終了するまで行
  # われません。
  # 
  # この状態が望ましくないアプリケーション（サーバがリソースを消費する、あ
  # るいはスクリプトの寿命が非常に長いなど）で、積極的にサーバを解放したい
  # 場合に限り、当メソッドを呼び出してください。
  def unadvise; end

  # --- message_loop -> ()
  # 
  # Windowsのメッセージポンプを実行します。
  # 
  # message_loopメソッドは、Windowsメッセージがキューイングされている限りメッ
  # セージの読み出しとディスパッチを実行します。
  # 
  # COMのスレッド間/プロセス間通信はスレッド内で呼び出しをシリアライズする
  # ためにWindowsメッセージを利用します。このため、ほとんどのイベント処理は
  # Windowsメッセージを読み取ってディスパッチすることで通知されます。
  # 
  #   ie = WIN32OLE.new('InternetExplorer.Application.1')
  #   event = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  #   b = false
  #   event.on_event('DocumentComplete') do |disp, uri|
  #     disp.document.getElementsByTagName('a').each do |e|
  #       puts "#{e.innerHTML}=#{e.href}"   #=> ダウンロード=http://www.ruby-lang.org/ja/downloads/ など
  #     end
  #     disp.quit
  #     b = true
  #   end
  #   ie.Navigate2 'http://www.ruby-lang.org/ja/'
  #   loop do
  #     break if b
  #     WIN32OLE_EVENT.message_loop
  #   end
  # 
  # なお、メソッド名はloopですが、呼び出し時および既にキューイングされたメッ
  # セージの処理中にキューされたメッセージの処理が終わると呼び出し元に制御
  # が戻ります。このため、イベント通知までに長い時間がかかる場合はすべての
  # イベントを受信するまでループを実行する必要があります。このとき他のスレッ
  # ドに制御を与える必要があれば、[[m:Kernel.#sleep]]などを呼び出してくださ
  # い。message_loopメソッドの呼び出し中はRubyのスレッドの切り替えは行われ
  # ません。
  def message_loop; end

  # --- new(ole, event = nil) -> WIN32OLE_EVENT
  # 
  # OLEオートメーションサーバのイベント受信機構をオブジェクト化して返します。
  # 
  # newメソッドは、OLEオートメーションサーバがイベント通知に利用するインター
  # フェイスを取得し、オブジェクトとして返します。
  # 
  # @param ole イベントの通知元のWIN32OLEオブジェクトを指定します。
  # 
  # @param event イベントのインターフェイスを示すインターフェイス名または
  #              IIDを文字列で指定します。省略時にはoleパラメータで指定した
  #              オブジェクトの既定のイベントインターフェイスを利用します。
  # 
  # @return 指定したオブジェクトのイベントを管理するWIN32OLE_EVENTオブジェクト。
  # 
  # @raise RuntimeError eventパラメータで指定したIIDが見つかりません。また
  #                     はオブジェクトがイベントをサポートしていません。
  # 
  # 以下の3例はいずれも同等です。
  # 
  # デフォルトイベントインターフェイスを指定した例
  # 
  #    ie = WIN32OLE.new('InternetExplorer.Application')
  #    ev = WIN32OLE_EVENT.new(ie)
  # 
  # インターフェイス名を指定した例
  # 
  #    ie = WIN32OLE.new('InternetExplorer.Application')
  #    ev = WIN32OLE_EVENT.new(ie, 'DWebBrowserEvents2')
  # 
  # IIDを指定した例
  # 
  #    ie = WIN32OLE.new('InternetExplorer.Application')
  #    ev = WIN32OLE_EVENT.new(ie, '{34A715A0-6587-11D0-924A-0020AFC7AC4D}')
  def new; end

end
