class Resolv::DNS::Name
  # --- absolute? -> bool
  # 絶対パス形式であるかどうかを返します。
  def absolute?; end

  # --- subdomain_of?(other) -> bool
  # other が self のサブドメインであるかどうかを返します。
  # 
  # //emlist[][ruby]{
  # require "resolv"
  # domain = Resolv::DNS::Name.create("y.z")
  # p Resolv::DNS::Name.create("w.x.y.z").subdomain_of?(domain) #=> true
  # p Resolv::DNS::Name.create("x.y.z").subdomain_of?(domain) #=> true
  # p Resolv::DNS::Name.create("y.z").subdomain_of?(domain) #=> false
  # p Resolv::DNS::Name.create("z").subdomain_of?(domain) #=> false
  # p Resolv::DNS::Name.create("x.y.z.").subdomain_of?(domain) #=> false
  # p Resolv::DNS::Name.create("w.z").subdomain_of?(domain) #=> false
  # //}
  def subdomain_of?; end

  # --- to_s -> String
  # ドメイン名を文字列として返します。
  # 
  # 絶対パス形式であっても返される文字列には最後のドットは含まれません。
  def to_s; end

  # --- create(name) -> Resolv::DNS::Name
  # 文字列 name から Resolv::DNS::Name のインスタンスを生成します。
  # 
  # @param name ドメイン名の文字列。最後に"."を置くと絶対パス形式、そうでなければ相対パス形式とみなされます。
  def create; end

  # --- new(labels, absolute = true) -> Resolv::DNS::Name
  # Resolv::DNS::Nameのインスタンスを生成します。
  # labels は [[c:Resolv::DNS::Label::Str]] の配列を与えます。
  # 
  # @param labels ドメイン名を [[c:Resolv::DNS::Label::Str]] の配列として与えます。
  # @param absolute ドメイン名が絶対パスであるかどうかを 真偽値で与えます。
  # 
  # @see [[m:Resolv::DNS::Name.create]]
  def new; end

end
