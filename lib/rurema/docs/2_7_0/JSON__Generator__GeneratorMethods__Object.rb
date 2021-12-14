module JSON::Generator::GeneratorMethods::Object
  # --- to_json(state_or_hash = nil) -> String
  # 
  # 自身を to_s で文字列にした結果を JSON 形式の文字列に変換して返します。
  # 
  # このメソッドはあるオブジェクトに to_json メソッドが定義されていない場合に使用する
  # フォールバックのためのメソッドです。
  # 
  # @param state_or_hash 生成する JSON 形式の文字列をカスタマイズするため
  #                      に [[c:JSON::State]] のインスタンスか、
  #                      [[m:JSON::State.new]] の引数と同じ [[c:Hash]] を
  #                      指定します。
  # 
  # //emlist[例][ruby]{
  # require "json"
  # 
  # class Person
  #   attr :name, :age
  # 
  #   def initialize(name, age)
  #     @name, @age = name, age
  #   end
  # end
  # 
  # tanaka = Person.new("tanaka", 29)
  # 
  # tanaka.to_json # => "\"#<Person:0x00007ffdec0167c8>\""
  # tanaka.method(:to_json).owner # => JSON::Ext::Generator::GeneratorMethods::Object
  # //}
  def to_json; end

end
