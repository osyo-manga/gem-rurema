class RDoc::Context::Section
  # --- ==(other) -> bool
  # 
  # 自身と other のシーケンス番号を比較した結果を返します。
  # 
  # @param other [[c:RDoc::Context::Section]] オブジェクトを指定します。
  def ==; end

  # --- comment -> String | nil
  # 
  # section のコメントを返します。
  def comment; end

  # --- inspect -> String
  # 
  # 自身の情報を人間に読みやすい文字列にして返します。
  def inspect; end

  # --- parent -> RDoc::Context
  # 
  # 自身が所属する [[c:RDoc::Context]] オブジェクトを返します。
  def parent; end

  # --- sequence -> String
  # 
  # section のシーケンス番号を文字列で返します。
  # 
  # リンクを作成する時に使われます。
  def sequence; end

  # --- set_comment(comment) -> ()
  # 
  # 自身にコメントを設定します。
  # 
  # @param comment 文字列を指定します。
  # 
  # comment の最初の行に :section: を含んでいた場合、その行以降の文字列をコ
  # メントとして設定します。そうでない場合は comment すべてをコメントとして
  # 設定します。
  # 
  #   # ---------------------
  #   # :section: The title
  #   # The body
  #   # ---------------------
  def set_comment; end

  # --- title -> String | nil
  # 
  # section のタイトルを返します。
  def title; end

  # --- new(parent, title, comment) -> RDoc::Context::Section
  # 
  # 自身を初期化します。
  # 
  # @param parent [[c:RDoc::Context]] オブジェクトを指定します。
  # 
  # @param title section のタイトルを文字列で指定します。
  # 
  # @param comment section のコメントを文字列で指定します。
  # 
  # また、section のシーケンス番号を新しく作成します。
  def new; end

end
