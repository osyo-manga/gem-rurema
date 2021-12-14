class Gem::Package::TarOutput
  # --- add_gem_contents{|data_tar_writer| ... } -> self
  # 
  # gem-format な tar ファイル内の data.tar.gz にファイルを追加するためのメ
  # ソッドです。
  # 
  # ブロックには data.tar.gz に紐付いた [[c:Gem::Package::TarWriter]] のイ
  # ンスタンスが渡されます。このブロックパラメータには
  # [[c:Gem::Specification]] を追加するための metadata, metadata= という特
  # 異メソッドが追加されています。
  def add_gem_contents; end

  # --- add_metadata
  # gem-format な tar ファイルに metadata.gz を追加します。
  # 
  # 前回の [[m:Gem::Package::TarOutput#add_gem_contents]] の呼び出し以降に
  # 変更したメタデータを書き込みます。
  def add_metadata; end

  # --- add_signatures
  # gem-format な tar ファイルに data.tar.gz.sig, metadata.gz.sig を追加します。
  # 
  # @see [[c:Gem::Security::Signer]]
  def add_signatures; end

  # --- close
  # 
  # 自身に関連付けられた IO を close します。
  def close; end

  # --- new(io, signer) -> Gem::Package::TarOutput
  # 
  # gem-format な tar ファイル内の data.tar.gz にファイルを追加するために
  # 自身を初期化します。
  # 
  # @param io gem-format な tar ファイルを扱うための IO を指定します。
  # 
  # @param signer [[c:Gem::Security::Signer]] のインスタンスを指定します。
  # 
  # @see [[c:Gem::Security::Signer]]
  def new; end

  # --- open(io, signer = nil){|data_tar_writer| ... }
  # 
  # gem-format な tar ファイル内の data.tar.gz にファイルを追加するためのメ
  # ソッドです。
  # 
  # @param io gem-format な tar ファイルを扱うための IO を指定します。
  # 
  # @param signer [[c:Gem::Security::Signer]] のインスタンスを指定します。
  # 
  # @see [[m:Gem::Package::TarOutput#add_gem_contents]]
  def open; end

end
