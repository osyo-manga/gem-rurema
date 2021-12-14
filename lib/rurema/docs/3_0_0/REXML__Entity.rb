class REXML::Entity
  # --- external -> String | nil
  # 実体が外部実体(external entity)宣言である場合は
  # "SYSTEM" もしくは "PUBLIC" という文字列を返します。
  # 
  # 内部実体(internal entity)宣言である場合には nil を返します。
  def external; end

  # --- name -> String
  # 実体の名前を返します。
  def name; end

  # --- ndata -> String | nil
  # 解析対象外実体(unparsed entity)宣言である場合には
  # その記法名(notation name)を返します。
  # 
  # それ以外の場合は nil を返します。
  def ndata; end

  # --- normalized -> String | nil
  # 正規化された(normalized)実体の値を返します。
  # 
  # すなわち、一切の実体参照を展開していない値を返します。
  # 
  # 外部実体(external entity)宣言の場合は nil を返します。
  # 
  # @see [[m:REXML::Entity#value]], [[m:REXML::Entity#unnormalized]]
  def normalized; end

  # --- pubid -> String | nil
  # 公開識別子(public identifier)を用いた外部実体宣言の場合は、その公開識別子を
  # 返します。
  # 
  # それ以外の場合は nil を返します。
  def pubid; end

  # --- ref -> String | nil
  # 外部実体(external entity)宣言の URI を返します。
  # 
  # 内部実体宣言の場合は nil を返します。
  def ref; end

  # --- to_s -> String
  # 実体宣言を文字列化したものを返します。
  # 
  # @see [[m:REXML::Entity#write]]
  # 
  # //emlist[][ruby]{
  # e = REXML::ENTITY.new("w", "wee");
  # p e.to_s # => "<!ENTITY w \"wee\">"
  # //}
  def to_s; end

  # --- unnormalized -> String | nil
  # 非正規化された(unnormalized)実体の値を返します。
  # 
  # すなわち、self が属する DTD によってすべての実体参照(&ent; と %ent; の両方)
  # を展開した文字列を返します。
  # 
  # 外部実体(external entity)宣言の場合は nil を返します。
  # 
  # @see [[m:REXML::Entity#value]], [[m:REXML::Entity#normalized]]
  def unnormalized; end

  # --- value -> String | nil
  # 実体の値を返します。
  # 
  # パラメータ実体参照(parameter entity)のみが展開され、
  # そうでない実体参照(general entity)は展開されて
  # いないような値が返されます。
  # 
  # 外部実体(external entity)宣言の場合は nil を返します。
  # 
  # @see [[m:REXML::Entity#unnormalized]], [[m:REXML::Entity#normalized]]
  def value; end

  # --- write(out, indent = -1) -> ()
  # 実体宣言を文字列化したものを out に書き込みます。
  # 
  # @param out 出力先の IO オブジェクト
  # @param indent 利用されません。deprecated なパラメータです
  # @see [[m:REXML::Entity#to_s]]
  def write; end

  # --- matches?(string) -> bool
  # string が実体宣言の文法に従う文字列であれば真を返します。
  # 
  # @param string 判定対象の文字列
  # 
  # //emlist[][ruby]{
  # require 'rexml/document'
  # 
  # p REXML::Entity.matches?('<!ENTITY s "seal">') # => true
  # p REXML::Entity.matches?('<!ENTITY % s "seal">') # => true
  # p REXML::Entity.matches?('<!ELEMENT br EMPTY >') # => false
  # //}
  def matches?; end

  # --- new(name, value, parent=nil, reference=false) -> REXML::Entity
  # --- new(array) -> REXML::Entity
  # 新たな Entity オブジェクトを生成して返します。
  # 
  # name, value で実体の名前とその値を定義します。
  # parent はその entity オブジェクトが属するノードを渡します。
  # reference でその実体宣言がパラメータ実体(parameter entity)かどうかを指定します。
  # 
  # このコンストラクタでは単純な内部実体(internal entity)宣言のみを実現できます。
  # 
  # それ以外の内容を保持する Entity オブジェクトが欲しい場合は、
  # 文書に適切な DTD を含めておいてそれを [[m:REXML::Document.new]] で
  # パースするようにしてください。
  # 
  # 配列を使うほうは rexml のパーサが内部的に利用するため通常は利用しません。
  # 
  # @param name 実体参照の名前
  # @param value 参照の値
  # @param parent 親ノード
  # @param reference パラメータ実体であるかどうかの真偽値
  # @param array 初期化のための配列
  # 
  # === 例
  # 「&gt;」「>」 の対応は以下のように実現されます。
  #   REXML::Entity.new("gt", ">")
  def new; end

end
