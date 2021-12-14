class Gem::Package::TarReader
  # --- close -> nil
  # 
  # 自身を close します。
  def close; end

  # --- each{|entry| ... }
  # --- each_entry{|entry| ... }
  # 
  # ブロックに一つずつエントリを渡して評価します。
  def each; end

  # --- rewind -> Integer
  # 
  # 自身に関連付けられた IO のファイルポインタを先頭に移動します。または、
  # [[m:Gem::Package::TarReader.new]] したときの [[m:IO#pos]] にファイルポ
  # インタを先頭に移動します。
  # 
  # [[m:Gem::Package::TarReader#each]] の実行中に呼ばないようにしてください。
  # 
  # @return 戻った位置を返します。
  # 
  # @raise Gem::Package::NonSeekableIO 自身に関連付けられた IO がシーク可能
  #                                    でない場合に発生します。
  def rewind; end

  # --- new(io) -> Gem::Package::TarReader
  # 
  # io に関連付けて [[c:Gem::Package::TarReader]] を初期化します。
  # 
  # @param io pos, eof?, read, getc, pos= というインスタンスメソッドを持つ
  #           オブジェクトを指定します。
  def new; end

end
