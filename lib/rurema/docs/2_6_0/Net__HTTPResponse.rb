class Net::HTTPResponse
  # --- body -> String | () | nil
  # --- entity -> String | () | nil
  # 
  # エンティティボディを返します。
  # 
  # レスポンスにボディがない場合には nil を返します。
  # 
  # [[m:Net::HTTPResponse#read_body]] をブロック付きで呼んだ場合には
  # このメソッドはNet::ReadAdapter のインスタンスを返しますが、
  # これは使わないでください。
  # 
  # entity は obsolete です。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.body[0..10] # => "<!doctype h"
  # //}
  def body; end

  # --- code -> String
  # 
  # HTTP のリザルトコードです。例えば '302' などです。
  # 
  # この値を見ることでレスポンスの種類を判別できますが、
  # レスポンスオブジェクトがどのクラスのインスタンスかを
  # 見ることでもレスポンスの種類を判別できます。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.code # => "200"
  # //}
  def code; end

  # --- response -> self
  # --- header -> self
  # --- reader_header -> self
  # 
  # 互換性を保つためだけに導入されたメソッドです。
  # 使わないでください。
  # 
  # 自分自身を返します。
  def header; end

  # --- http_version -> String
  # 
  # サーバがサポートしている HTTP のバージョンを文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.http_version # => "1.1"
  # //}
  def http_version; end

  # --- message -> String
  # --- msg -> String
  # 
  # HTTP サーバがリザルトコードに付加して返すメッセージです。
  # 例えば 'Not Found' などです。
  # 
  # msg は obsolete です。使わないでください。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.message # => "OK"
  # //}
  def message; end

  # --- read_body(dest=nil) -> String|nil
  # --- read_body {|str| .... } -> ()
  # 
  # ブロックを与えなかった場合にはエンティティボディを
  # 文字列で返します。
  # ブロックを与えた場合には
  # エンティティボディを少しずつ取得して順次ブロックに
  # 文字列で与えます。
  # 
  # レスポンスがボディを持たない場合には nil を返します。
  # 
  # //emlist[例1 ブロックを与えずに一度に結果取得][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.read_body[0..10] # => "<!doctype h"
  # //}
  # 
  # //emlist[例2 ブロックを与えて大きいファイルを取得][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/path/to/big.file')
  # Net::HTTP.start(uri.host, uri.port) do |http|
  #   File.open("/path/to/big.file", "w") do |f|
  #     # Net::HTTP#request_get と Net::HTTPResponse#read_body で少しずつ読み書き。メモリ消費が少ない。
  #     http.request_get(uri.path) do |response|
  #       response.read_body do |s|
  #         f.write(s)
  #       end
  #     end
  #   end
  # end
  # //}
  # 
  # 一度ブロックを与えずにこのメソッドを呼んだ場合には、
  # 次からはすでに読みだしたボディを文字列として
  # 返します。また一度ブロックを与えてこのメソッドを呼んだ場合には、
  # 次からは Net::ReadAdapter のインスタンスが返ってきますが、
  # その場合はそのオブジェクトは使わないでください。
  # 
  # dest は obsolete です。使わないでください。
  # dest を指定した場合には
  # ボディを少しずつ取得して順次
  # 「dest << ボディの断片」を実行します。
  # 
  # @param dest obsoleteな引数です。利用しないでください。
  # 
  # @see [[m:Net::HTTP#request_get]]
  def read_body; end

  # --- value -> nil
  # レスポンスが 2xx(成功)でなかった場合に、対応する
  # 例外を発生させます。
  # 
  # @raise HTTPError レスポンスが 1xx であるか、 net/http が知らない
  #                  種類のレスポンスである場合に発生します。
  # @raise HTTPRetriableError レスポンスが 3xx である場合に発生します。
  # @raise HTTPServerException レスポンスが 4xx である場合に発生します。
  # @raise HTTPFatalError レスポンスが 5xx である場合に発生します。
  # 
  # //emlist[例 レスポンスが 2xx(成功)][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/index.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # response.value # => nil
  # //}
  # 
  # //emlist[例 レスポンスが 2xx以外][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/invalid.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # begin
  #   response.value
  # rescue => e
  #   e.class # => Net::HTTPServerException
  #   e.message # => 404 "Not Found"
  # end
  # //}
  def value; end

  # --- body_permitted? -> bool
  # エンティティボディを含むことが許されているレスポンスクラス
  # ならば真を、そうでなければ偽を返します。
  def body_permitted?; end

end
