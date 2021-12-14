class REXML::NotationDecl
  # --- name -> String
  # 記法宣言の名前を返します。
  def name; end

  # --- public -> String | nil
  # 公開識別子を返します。
  # 
  # 宣言が公開識別子を含まない場合は nil を返します。
  def public; end

  # --- public=(value)
  # 公開識別子を value に変更します。
  # 
  # @param value 設定する公開識別子(文字列)
  def public=; end

  # --- system -> String | nil
  # システム識別子(URI)を返します。
  # 
  # 宣言がシステム識別子を含まない場合は nil を返します。
  def system; end

  # --- system=(value)
  # システム識別子を変更します。
  # 
  # @param value 設定するシステム識別子
  def system=; end

  # --- to_s -> String
  # self を文字列化したものを返します。
  def to_s; end

  # --- write(output, indent = -1)
  # output へ self を文字列化して出力します。
  # 
  # このメソッドは deprecated です。[[c:REXML::Formatter]] で
  # 出力してください。
  # 
  # @param output 出力先の IO オブジェクト
  # @param indent インデントの大きさ。無視されます。
  def write; end

  # --- new(name, middle, pub, sys) -> REXML::NotationDecl
  # NotationDecl オブジェクトを生成します。
  # 
  # @param name 記法名(文字列)
  # @param middle 種別("PUBLIC" もしくは "SYSTEM")
  # @param pub 公開識別子(文字列)
  # @param sys URI(文字列)
  def new; end

end
