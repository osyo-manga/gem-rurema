class URI::HTTP
  # --- request_uri     -> String
  # 
  # 自身の「path + '?' + query」を文字列で返します。
  # query が nil である場合は、自身の path を返します。
  # 
  # path が空である場合には、path は「'/'」であるとします。
  # 
  # 例:
  #   require 'uri'
  #   u = URI.parse("http://example.com/search?q=xxx")
  #   p u.request_uri                                  #=> "/search?q=xxx"
  def request_uri; end

  # --- build(ary)     -> URI::HTTP
  # --- build(hash)    -> URI::HTTP
  # 
  # 引数で与えられた URI 構成要素から URI::HTTP オブジェクトを生成します。
  # 引数の正当性を検査します。
  # 
  # @param ary 構成要素を表す配列を与えます。要素は次の順です。
  # //emlist{
  #       [userinfo, host, port, path, query, fragment]
  # //}
  # @param hash 構成要素を表すハッシュを与えます。ハッシュのキーは  :scheme, :userinfo, :host, :port, :path, :query, :fragment のいずれかです。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  # 
  # 例:
  #   require 'uri'
  #   newuri = URI::HTTP.build({:host => 'www.example.com', :path => '/foo/bar'})  
  #   newuri = URI::HTTP.build([nil, "www.example.com", nil, "/path", "query", 'fragment'])
  def build; end

  # --- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment, arg_check = false)     -> URI::HTTP   
  # 
  # 汎用的な構成要素から URI::HTTP オブジェクトを生成します。build
  # と異なり、デフォルトでは引数の正当性を検査しません。
  # 
  # @param scheme 構成要素を表す文字列を与えます。
  # 
  # @param userinfo 構成要素を表す文字列を与えます。
  # 
  # @param host 構成要素を表す文字列を与えます。
  # 
  # @param port 構成要素を表す文字列を与えます。
  # 
  # @param registry nil を与えます。
  # 
  # @param path 構成要素を表す文字列を与えます。
  # 
  # @param opaque 構成要素を表す文字列を与えます。
  # 
  # @param query 構成要素を表す文字列を与えます。
  # 
  # @param fragment 構成要素を表す文字列を与えます。
  # 
  # @param arg_check 真が与えられた場合は、各引数が字句規則に適合しているか否かを検査します。適合しな い場合は例外 URI::InvalidComponentError が起ります。
  # 
  # @raise URI::InvalidURIError registry に nil 以外を与えた時に発生します。デフォルトでは引数の正当性は、これ以外 検査しません。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  def new; end

end
