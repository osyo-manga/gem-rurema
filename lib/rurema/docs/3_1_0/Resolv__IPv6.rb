class Resolv::IPv6
  # --- address -> String
  # IPv6アドレスを表す 16 byte の文字列(バイト列)を返します。
  def address; end

  # --- to_name -> Resolv::DNS::Name
  # "h.g.f.e.d.c.b.a.ip6.arpa." という DNS 名を返します。
  def to_name; end

  # --- to_s -> String
  # IPv6 アドレスの文字列表現を返します。
  def to_s; end

  # --- create(address) -> Resolv::IPv6
  # 
  # 引数 address で指定した文字列から Resolv::IPv6 のインスタンスを生成しま
  # す。
  # 
  # @param address human readable な IPv6 アドレスの文字列表現を以下のいず
  #                れかの形式で指定します。
  # 
  #   * 8Hex
  #   * CompressedHex
  #   * 6Hex4Dec
  #   * CompressedHex4Dec
  def create; end

  # --- new(address) -> Resolv::IPv6
  # 16 byte の文字列 address から Resolv::IPv6 のインスタンスを生成します。
  # 
  # @param address IPv6アドレスを表す 16 byte の文字列(バイト列)
  # @see [[m:Resolv::IPv6.create]]
  def new; end

  # --- Regex -> Regexp
  # IPv6のアドレスの正規表現です。
  # [[m:Resolv::IPv6::Regex_6Hex4Dec]],
  # [[m:Resolv::IPv6::Regex_8Hex]],
  # [[m:Resolv::IPv6::Regex_CompressedHex]],
  # [[m:Resolv::IPv6::Regex_CompressedHex4Dec]],
  # のいずれかとマッチする文字列とマッチします。
  def Regex; end

  # --- Regex_6Hex4Dec -> Regexp
  # --- Regex_8Hex -> Regexp
  # --- Regex_CompressedHex -> Regexp
  # --- Regex_CompressedHex4Dec -> Regexp
  # IPv6の各文字列表記とマッチする正規表現です。順に
  #   * a:b:c:d:e:f:w.x.y.z
  #   * a:b:c:d:e:f:g:h
  #   * a::b
  #   * a::b:w.x.y.z
  # という文字列とマッチします。
  def Regex_6Hex4Dec; end

end
