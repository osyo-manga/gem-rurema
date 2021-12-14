class Gem::LoadError
  # --- name -> String
  # 
  # ロードに失敗した Gem の名前を返します。
  def name; end

  # --- name=(gem_name)
  # 
  # ロードに失敗した Gem の名前をセットします。
  # 
  # @param gem_name Gem の名前を指定します。
  def name=; end

  # --- version_requirement -> Get::Requirement
  # 
  # ロードに失敗した Gem の必要条件を返します。
  # 
  # @see [[c:Gem::Requirement]], [[m:Gem::Dependency#version_requirements]]
  def version_requirement; end

  # --- version_requirement=(version_requirement)
  # 
  # ロードに失敗した Gem の必要条件をセットします。
  # 
  # @param version_requirement [[c:Gem::Requirement]] のインスタンスをセットします。
  # 
  # @see [[c:Gem::Requirement]], [[m:Gem::Dependency#version_requirements]]
  def version_requirement=; end

end
