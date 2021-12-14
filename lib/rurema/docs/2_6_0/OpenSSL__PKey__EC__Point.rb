class OpenSSL::PKey::EC::Point
  # --- eql?(other) -> bool
  # --- ==(other) -> bool
  # 自身が other と等しいならば true を返します。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  def ==; end

  # --- group -> OpenSSL::PKey::EC::Group
  # 
  # 自身と関連付けられた群を返します。
  def group; end

  # --- infinity? -> bool
  # 自身が無限遠点であるならば true を返します。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  # @see [[m:OpenSSL::PKey::EC::Point#set_to_infinity!]]
  def infinity?; end

  # --- invert! -> self
  # 自身をその逆元に設定します。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  def invert!; end

  # --- make_affine! -> self
  # @todo
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  def make_affine!; end

  # --- on_curve? -> bool
  # 点が曲線上にあるならば真を返します。
  # 
  # [[m:OpenSSL::PKey::EC::Group]] で得られる群と関連付けられた
  # 曲線を考えます。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  def on_curve?; end

  # --- set_to_infinity! -> self
  # 自身を無限遠点に設定します。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error エラーが生じた場合に発生します
  # @see [[m:OpenSSL::PKey::EC::Point#infinity!]]
  def set_to_infinity!; end

  # --- to_bn -> OpenSSL::BN
  # 点を整数に変換します。
  # 
  # @raise OpenSSL::PKey::EC::Point::Error 変換に失敗した場合に発生します
  def to_bn; end

  # --- new(point) -> OpenSSL::PKey::EC::Point
  # --- new(group) -> OpenSSL::PKey::EC::Point
  # --- new(group, bn) -> OpenSSL::PKey::EC::Point
  # 
  # Point オブジェクトを生成します。
  # 
  # 引数に OpenSSL::PKey::EC::Point オブジェクトを渡した場合は
  # それを複製します。
  # 
  # 引数に OpenSSL::PKey::EC::Group オブジェクトを渡した場合は
  # それに関連付けられたオブジェクトを返します。
  # 
  # 引数に OpenSSL::PKey::EC::Group オブジェクトと
  # 整数を渡した場合は、整数で定義される点を返します。
  # 
  # @param point 複製する [[c:OpenSSL::PKey::EC::Point]] オブジェクト
  # @param group 関連付ける群([[c:OpenSSL::PKey::EC::Group]] オブジェクト)
  # @param bn 点を表す整数([[c:OpenSSL::BN]] オブジェクト)
  # @raise OpenSSL::PKey::EC::Point::Error オブジェクトの生成に失敗した場合
  #        に発生します。
  def new; end

end
