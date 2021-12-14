class RSS::Maker::RSSBase
  # --- channel
  # @todo
  # channel要素を生成するオブジェクトを返します．
  def channel; end

  # --- encoding
  # @todo
  # 作成するXMLのエンコーディングを返します．デフォルトは
  # UTF-8です．
  def encoding; end

  # --- encoding=()
  # @todo
  # 作成するXMLのエンコーディングを設定します．maker
  # に設定する際のエンコーディングはここで指定したものにす
  # る必要があります．
  def encoding=; end

  # --- image
  # @todo
  # image要素を生成するオブジェクトを返します．
  def image; end

  # --- items
  # @todo
  # item要素を生成するオブジェクトを管理するオブジェクトを
  # 返します．
  def items; end

  # --- rss_version
  # @todo
  # 作成するRSSのバージョンを返します．
  def rss_version; end

  # --- standalone
  # @todo
  # 作成するXMLのstandaloneを返します．
  def standalone; end

  # --- standalone=()
  # @todo
  # 作成するXMLのstandaloneを設定します．
  def standalone=; end

  # --- textinput
  # @todo
  # textinput要素を生成するオブジェクトを返します．
  def textinput; end

  # --- version
  # @todo
  # 作成するXMLのバージョンを返します．
  def version; end

  # --- version=()
  # @todo
  # 作成するXMLのバージョンを設定します．
  def version=; end

  # --- xml_stylesheets
  # @todo
  # xml_stylesheetを管理するオブジェクトを返します．
  def xml_stylesheets; end

end
