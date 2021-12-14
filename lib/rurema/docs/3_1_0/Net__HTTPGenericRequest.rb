class Net::HTTPGenericRequest
  # --- body -> String
  # サーバに送るリクエストのエンティティボディを返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # req = Net::HTTP::Post.new(uri.request_uri)
  # req.body = "Test Post Data"
  # req.body # => "Test Post Data"
  # //}
  # 
  # @see [[m:Net::HTTPGenericRequest#body=]]
  def body; end

  # --- body=(body)
  # 
  # サーバに送るリクエストのエンティティボディを文字列で設定します。
  # 
  # @param body 設定するボディを文字列で与えます。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # req = Net::HTTP::Post.new(uri.request_uri)
  # req.body = "Test Post Data" # => "Test Post Data"
  # //}
  # 
  # @see [[m:Net::HTTPGenericRequest#body]]
  def body=; end

  # --- body_exist? -> bool
  # このメソッドは obsolete です。
  # 
  # 
  # [[m:Net::HTTPGenericRequest#response_body_permitted?]]
  # の別名です。
  def body_exist?; end

  # --- body_stream -> object
  # --- body_stream=(f)
  # 
  # サーバに送るリクエストのエンティティボディを
  # [[c:IO]] オブジェクトなどのストリームで設定します。
  # f は read(size) メソッドが定義されている必要があります。
  # 
  # @param f エンティティボディのデータを得るストリームオブジェクトを与えます。
  def body_stream; end

  # --- method -> String
  # リクエストの HTTP メソッドを文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # req = Net::HTTP::Post.new(uri.request_uri)
  # req.method # => "POST"
  # req = Net::HTTP::Get.new(uri.request_uri)
  # req.method # => "GET"
  # //}
  def method; end

  # --- path -> String
  # 
  # リクエストする path を文字列で返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # req = Net::HTTP::Get.new(uri.request_uri)
  # req.path # => "/index.html"
  # //}
  def path; end

  # --- request_body_permitted? -> bool
  # 
  # リクエストにエンティティボディを一緒に送ることが許されている
  # HTTP メソッド (POST など)の場合真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # post = Net::HTTP::Post.new(uri.request_uri)
  # post.request_body_permitted?   # => true
  # 
  # head = Net::HTTP::Head.new(uri.request_uri)
  # head.request_body_permitted?   # => false
  # //}
  def request_body_permitted?; end

  # --- response_body_permitted? -> bool
  # 
  # サーバからのレスポンスにエンティティボディを含むことが許されている
  # HTTP メソッド (GET, POST など)の場合真を返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = URI.parse('http://www.example.com/index.html')
  # post = Net::HTTP::Post.new(uri.request_uri)
  # post.response_body_permitted?   # => true
  # 
  # head = Net::HTTP::Head.new(uri.request_uri)
  # head.response_body_permitted?   # => false
  # //}
  def response_body_permitted?; end

end
