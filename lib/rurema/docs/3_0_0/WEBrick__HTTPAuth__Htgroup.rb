class WEBrick::HTTPAuth::Htgroup
  # --- add(group, members)
  # 
  # 与えられたグループにメンバを追加します。
  # 
  # @param group メンバを追加するグループを指定します。
  # 
  # @param members 追加するメンバを配列で指定します。
  def add; end

  # --- flush(path = nil) -> ()
  # 
  # ファイルに書き込みます。
  # 
  # @param path ファイル名を指定します。
  def flush; end

  # --- members(group) -> [String]
  # 
  # [[m:WEBrick::HTTPAuth::Htgroup#reload]] を呼んでから与えられたグループに所属するメンバのリストを返します。
  # 
  # @param group グループ名を指定します。
  def members; end

  # --- reload
  # ファイルから再度読み込みます。
  def reload; end

  # --- new(path) -> WEBrick::HTTPAuth::Htgroup
  # 
  # 自身を初期化します。
  # 
  # @param path ファイル名を指定します。
  def new; end

end
