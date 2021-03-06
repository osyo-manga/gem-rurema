class URI::MailTo
  # --- headers        -> [[String]]
  # 
  # 自身のヘッダーを文字列の配列の配列として設定します。
  # 
  # 例: 
  #  require 'uri'
  #  m = URI.parse("mailto:ruby-list@ruby-lang.org?subject=subscribe&cc=myaddr")
  #  p m.headers #=> [["subject", "subscribe"], ["cc", "myaddr"]]
  def headers; end

  # --- headers=(s)
  # 
  # 自身のヘッダーを文字列で設定します。
  # 
  # @param s ヘッダーを表す文字列を指定します。
  # 
  # @raise URI::InvalidComponentError 不正な引数 s に対して発生します。
  # 
  # 例: 
  #   require 'uri'
  #   m = URI.parse("mailto:nospam@example.com")
  #   m.headers =  URI.escape("subject=hello hello")
  def headers=; end

  # --- to         -> String
  # 
  # 自身の e-mail アドレスを文字列で返します。
  # 
  # 例:
  #   require 'uri'
  #   p URI.parse("mailto:nospam@example.com").to     #=> "nospam@example.com"
  def to; end

  # --- to=(s) 
  # 
  # 自身の e-mail アドレスを文字列で設定します。
  # 
  # @param s 自身の e-mail アドレスを文字列で指定します。
  # 
  # @raise URI::InvalidComponentError 不正な引数 s に対して発生します。
  # 
  # 例:
  #   require 'uri'
  #   m = URI.parse("mailto:nospam@example.com")
  #   m.to = "nospaaaam@example.com"
  #   p m                                        #=> #<URI::MailTo:0xb7bf0614 URL:mailto:nospaaaam@example.com>
  def to=; end

  # --- to_mailtext      -> String
  # --- to_rfc822text    -> String
  # 
  # URI オブジェクトからメールテキスト文字列を生成します。
  # 
  # 例: 
  #   require 'uri'
  #   p mailto = URI.parse("mailto:ruby-list@ruby-lang.org?subject=subscribe&cc=myaddr")
  #   print mailto.to_mailtext
  # 
  #   => #<URI::MailTo:0x20104a0e URL:mailto:ruby-list@ruby-lang.org?subject=subscribe&cc=myaddr>
  #      To: ruby-list@ruby-lang.org
  #      Subject: subscribe
  #      Cc: myaddr
  def to_mailtext; end

  # --- build(ary)     -> URI::MailTo 
  # --- build(hash)    -> URI::MailTo 
  # 
  # 引数で与えられた URI 構成要素から URI::MailTo オブジェクトを生成します。
  # 引数の正当性をチェックします。
  # 
  # @param ary 構成要素を
  #       [to, headers]
  # という文字列の配列で与えます。headers は、以下のような文字列か配列で
  # 与えます。
  #   "subject=subscribe&cc=addr"
  #   
  #   [["subject", "subscribe"], ["cc", "addr"]]
  # 
  # @param hash 構成要素をハッシュで与えます。ハッシュのキーは :to, :headers です。ハッシュの値は ary と同様です。
  # 
  # @raise URI::InvalidComponentError 不正な引数に対して発生します。
  def build; end

  # --- new(scheme, userinfo, host, port, registry, path, opaque, query, fragment, arg_check = false)    -> URI::MailTo
  # 
  # 汎用的な構成要素から URI::MailTo オブジェクトを生成します。
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
