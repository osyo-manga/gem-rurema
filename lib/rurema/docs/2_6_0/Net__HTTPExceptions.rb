module Net::HTTPExceptions
  # --- response -> Net::HTTPResponse
  # 
  # 例外の原因となったレスポンスオブジェクトを返します。
  # 
  # //emlist[例][ruby]{
  # require 'net/http'
  # 
  # uri = "http://www.example.com/invalid.html"
  # response = Net::HTTP.get_response(URI.parse(uri))
  # begin
  #   response.value
  # rescue => e
  #   e.response # => #<Net::HTTPNotFound 404 Not Found readbody=true>
  # end
  # //}
  def response; end

end
