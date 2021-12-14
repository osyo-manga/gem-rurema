class URI::LDAP
  # --- attributes    -> String
  # 
  # 自身の Attribute を文字列で返します。
  def attributes; end

  # --- attributes=(s)
  # 
  # 自身の Attribute を文字列で設定します。
  # 
  # @param s 自身の Attribute を文字列で設定します。
  def attributes=; end

  # --- dn    -> String
  # 
  # 自身の Distinguished Name を文字列で返します。
  def dn; end

  # --- dn=(s)
  # 
  # 自身の Distinguished Name を文字列で設定します。
  # 
  # @param s 自身の Distinguished Name を文字列で指定します。
  def dn=; end

  # --- extensions    -> String
  # 
  # 自身の extensions を文字列で返します。
  def extensions; end

  # --- extensions=(s)
  # 
  # 自身の extensions を文字列で設定します。
  # 
  # @param s 自身の extensions を文字列で設定します。
  def extensions=; end

  # --- filter    -> String
  # 
  # 自身の filter を文字列で返します。
  def filter; end

  # --- filter=(s)
  # 
  # 自身の filter を文字列で設定します。
  # 
  # @param s 自身の filter を文字列で設定します。
  def filter=; end

  # --- scope    -> String
  # 
  # 自身の Scope を文字列で返します。
  def scope; end

  # --- scope=(s)
  # 
  # 自身の Scope を文字列で設定します。
  # 
  # @param s 自身の Scope を文字列で設定します。
  def scope=; end

  # --- build(ary)   -> URI::LDAP
  # --- build(hash)  -> URI::LDAP
  # 
  # 引数で与えられた URI 構成要素から URI::LDAP オブジェクトを生成します。
  # 引数の正当性を検査します。
  # 
  # @param ary 構成要素を表す配列を与えます。要素は次の順です。
  # //emlist{
  #       [:host, :port, :dn, :attributes, :scope, :filter, :extensions]
  # //}
  # @param hash 構成要素を表すハッシュを与えます。ハッシュのキーは 
  # //emlist{
  #             :host, :port, :dn, :attributes, :scope, :filter, :extensions 
  # //}
  #             のいずれかです。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  # 
  # 例:
  #   require 'uri'
  #   p URI::LDAP.build(["example.com", "1", "/a", "b", "c", "d", "e=f"]).to_s   
  #   #=> "ldap://example.com:1/a?b?c?d?e=f"
  def build; end

  # --- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment, arg_check = false)   -> URI::LDAP
  # 
  # 汎用的な構成要素から URI::LDAP オブジェクトを生成します。
  # build と異なり、デフォルトでは引数の正当性を検査しません。
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
  # @param arg_check 真が与えられた場合は、各引数が字句規則に適合しているか否かを検査します。適合しない場合は例外 URI::InvalidComponentError が起ります。
  # 
  # @raise URI::InvalidURIError use_registry が偽のとき、registry が与えられると発生します。
  # 
  # @raise URI::InvalidComponentError 各要素が適合しない場合に発生します。
  def new; end

end
