module JSON::Generator::GeneratorMethods::NilClass
  # --- to_json(state_or_hash = nil) -> String
  # 
  # 自身から生成した JSON 形式の文字列を返します。
  # 
  # "null" という文字列を返します。
  # 
  # @param state_or_hash 生成する JSON 形式の文字列をカスタマイズするため
  #                      に [[c:JSON::State]] のインスタンスか、
  #                      [[m:JSON::State.new]] の引数と同じ [[c:Hash]] を
  #                      指定します。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # nil.to_json # => "null"
  # //}
  def to_json; end

end
