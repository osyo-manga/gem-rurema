module REXML::Namespace
  # --- expanded_name -> String
  # [[m:REXML::Namespace#name=]] で設定された名前を返します。
  # 
  # name= で指定した名前が prefix を含んでいれば
  # prefix を含む名前を返し、そうでなければ
  # prefix を含まない名前を返します。
  # 
  # @see [[m:REXML::Namespace#prefix]]
  def expanded_name; end

  # --- fully_expanded_name -> String
  # 完全修飾名を返します。
  def fully_expanded_name; end

  # --- has_name?(other, ns = nil) -> bool
  # self が other と ns で指定した名前を持っているならば真を返します。
  # 
  # ns が nil でない場合は名前空間も比較されます。
  # other が ":" を含んでいる(つまり prefix を含んでいる)場合は
  # [[m:REXML::Namespace#fully_expanded_name]] と other を比較します。
  # どちらでもない場合は other と [[m:REXML::Namespace#name]] を直接
  # 比較します。
  # 
  # @param other 比較する名前(文字列)
  # @param ns 比較する名前空間(文字列)
  def has_name?; end

  # --- name -> String
  # --- local_name -> String
  # prefix を含まない「ローカルな」名前を返します。
  def local_name; end

  # --- name=(name)
  # 名前を設定します。
  # 
  # prefix を持つ名前も持たない名前も受け付けます。
  # 
  # @param name 名前(文字列)
  def name=; end

  # --- prefix -> String
  # prefix (前置修飾子) を返します。
  # 
  # @see [[m:REXML::Namespace#prefix=]]
  def prefix; end

  # --- prefix=(value)
  # prefix (前置修飾子) を設定します。
  # 
  # @param value prefix文字列
  # @see [[m:REXML::Namespace#prefix]]
  def prefix=; end

end
