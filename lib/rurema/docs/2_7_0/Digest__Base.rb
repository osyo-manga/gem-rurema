class Digest::Base
  # --- update(str) -> self
  # --- <<(str)     -> self
  # 
  # 文字列を追加します。self を返します。
  # 複数回updateを呼ぶことは文字列を連結してupdateを呼ぶことと同じです。
  # すなわち m.update(a); m.update(b) は
  # m.update(a + b) と、 m << a << b は m << a + b とそれぞれ等価
  # です。
  # 
  # @param str 追加する文字列
  # 
  #         require 'digest/md5'
  # 
  #         digest = Digest::MD5.new
  #         digest.update("r")
  #         digest.update("u")
  #         digest.update("b")
  #         digest.update("y")
  #         p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"
  # 
  #         digest = Digest::MD5.new
  #         digest << "r"
  #         digest << "u"
  #         digest << "b"
  #         digest << "y"
  #         p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"
  def <<; end

  # --- ==(md)  -> bool
  # 
  # 与えられたダイジェストオブジェクトと比較します。
  # 
  # @param md 比較対象のダイジェストオブジェクト
  # 
  #         require 'digest/md5'
  #         digest1 = Digest::MD5.new
  #         digest1.update("ruby")
  #         digest2 = Digest::MD5.new
  #         digest2.update("ruby")
  #         p digest1 == digest2 # => true
  #         digest2.update("RUBY")
  #         p digest1 == digest2 # => false
  # 
  # --- ==(str) -> bool
  # 
  # 与えられた文字列を hexdigest 値と見て、自身の hexdigest 値と比較します。
  # 
  # @param str 比較対象の hexdigest 文字列
  # 
  #         require 'digest/md5'
  #         digest = Digest::MD5.new
  #         digest.update("ruby")
  #         p digest == "58e53d1324eef6265fdb97b08ed9aadf" # => true
  def ==; end

  # --- block_length -> Integer
  # 
  # ダイジェストのブロック長を取得します。
  # 例えば、Digest::MD5であれば64、Digest::SHA512であれば128です。
  # 
  # 本メソッドは、Digest::MD5などのダイジェストのサブクラスにより、
  # それぞれの実装に適したものにオーバーライドされます。
  # 
  # 例: Digest::MD、Digest::SHA1、Digest::SHA512のブロック長を順番に調べる。
  # 
  #   require 'digest'
  #   ["MD5", "SHA1", "SHA512"].map{|a| Digest(a).new().block_length } # => [64, 128, 128]
  def block_length; end

  # --- dup   -> Digest::Base
  # --- clone -> Digest::Base
  # 
  # ダイジェストオブジェクトの複製を作ります。
  def clone; end

  # --- digest -> String
  # 
  # updateや<<によって追加した文字列に対するハッシュ値を文字列で返します。
  # 
  # 返す文字列は、MD5では16バイト長、SHA1およびRMD160では20バイト長、
  # SHA256では32バイト長、SHA384では48バイト長、SHA512では64バイト長です。
  # 
  # 例:
  # 
  #   # MD5の場合
  #   require 'digest/md5'
  #   digest = Digest::MD5.new
  #   digest.update("ruby")
  #   p digest.digest # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"
  # 
  # @see [[m:Digest::Base#hexdigest]]
  def digest; end

  # --- digest! -> String
  # 
  # updateや<<によって追加した文字列に対するハッシュ値を文字列で返します。
  # [[m:Digest::Base#digest]]と違い、
  # メソッドの処理後、
  # オブジェクトの状態を初期状態(newした直後と同様の状態)に戻します。
  # 
  # 返す文字列は、MD5では16バイト長、SHA1およびRMD160では20バイト長、
  # SHA256では32バイト長、SHA384では48バイト長、SHA512では64バイト長です。
  # 
  # 例:
  # 
  #   # MD5の場合
  #   require 'digest/md5'
  #   digest = Digest::MD5.new
  #   digest.update("ruby")
  #   p digest.digest! # => "X\345=\023$\356\366&_\333\227\260\216\331\252\337"
  #   p digest.digest! # => "\324\035\214\331\217\000\262\004\351\200\t\230\354\370B~"
  # 
  # @see [[m:Digest::Base#digest]]、[[m:Digest::Base#hexdigest!]]
  def digest!; end

  # --- digest_length -> Integer
  # --- length -> Integer
  # --- size -> Integer
  # 
  # ダイジェストのハッシュ値のバイト長を取得します。
  # 例えば、Digest::MD5であれば16、Digest::SHA1であれば20です。
  # 
  # 本メソッドは、Digest::MD5などのダイジェストのサブクラスにより、
  # それぞれの実装に適したものにオーバーライドされます。
  # 
  # 例: Digest::MD、Digest::SHA1、Digest::SHA512のハッシュ値のバイト長を順番に調べる。
  # 
  #   require 'digest'
  #   ["MD5", "SHA1", "SHA512"].map{|a| Digest(a).new().digest_length } # => [16, 20, 64]
  def digest_length; end

  # --- file(path) -> self
  # 
  # ファイル名 file で指定したファイルの内容を読み込んでダイジェストを更新し、
  # オブジェクト自身を返します。
  # 
  # @param path 読み込み対象のファイル名です。
  # @return ダイジェストオブジェクトを返します。
  # 
  # 例(MD5の場合)
  # 
  #   require 'digest/md5'
  #   digest = Digest::MD5.new
  #   digest.file("/path/to/file") # => Digest::MD5のインスタンス
  #   digest.hexdigest # => "/path/to/file"のMD5値
  def file; end

  # --- hexdigest -> String
  # --- to_s -> String
  # 
  # updateや<<によって追加した文字列に対するハッシュ値を、
  # ASCIIコードを使って16進数の列を示す文字列にエンコードして返します。
  # 
  # 返す文字列は、
  # MD5では32バイト長、SHA1およびRMD160では40バイト長、SHA256では64バイト長、
  # SHA384では96バイト長、SHA512では128バイト長です。
  # 
  # Rubyで書くと以下と同じです。
  # 
  #   def hexdigest
  #     digest.unpack("H*")[0]
  #   end
  # 
  # 例:
  # 
  #   # MD5の場合
  #   require 'digest/md5'
  #   digest = Digest::MD5.new
  #   digest.update("ruby")
  #   p digest.hexdigest # => "58e53d1324eef6265fdb97b08ed9aadf"
  # 
  # @see [[m:Digest::Base#digest]]
  def hexdigest; end

  # --- hexdigest! -> String
  # 
  # updateや<<によって追加した文字列に対するハッシュ値を、
  # ASCIIコードを使って16進数の列を示す文字列にエンコードして返します。
  # [[m:Digest::Base#hexdigest]]と違い、
  # メソッドの処理後、
  # オブジェクトの状態を初期状態(newした直後と同様の状態)に戻します。
  # 
  # 例:
  # 
  #   # MD5の場合
  #   require 'digest/md5'
  #   digest = Digest::MD5.new
  #   digest.update("ruby")
  #   p digest.hexdigest! # => "58e53d1324eef6265fdb97b08ed9aadf"
  #   p digest.hexdigest! # => "d41d8cd98f00b204e9800998ecf8427e"
  # 
  # @see [[m:Digest::Base#hexdigest]]、[[m:Digest::Base#digest!]]
  def hexdigest!; end

  # --- reset -> self
  # 
  # オブジェクトの状態を初期状態(newした直後と同様の状態)に戻し、
  # オブジェクト自身を返します。
  # 
  # 本メソッドは、Digest::MD5などのダイジェストのサブクラスにより、
  # それぞれの実装に適したものにオーバーライドされます。
  def reset; end

  # --- digest(str) -> String
  # 
  # 与えられた文字列に対するハッシュ値を文字列で返します。
  # new(str).digest と等価です。
  def digest; end

  # --- file(path) -> object
  # 
  # 新しいダイジェストオブジェクトを生成し、
  # ファイル名 file で指定したファイルの内容を読み込み、
  # そのダイジェストオブジェクトを返します。
  # 
  # @param path 読み込み対象のファイル名です。
  # @return ダイジェストオブジェクトを返します。
  # 
  # 使用例(SHA256の場合)
  # 
  #         require 'digest'
  #         digest = Digest::SHA256.file("X11R6.8.2-src.tar.bz2")
  #         digest.hexdigest
  #         # => "f02e3c85572dc9ad7cb77c2a638e3be24cc1b5bea9fdbb0b0299c9668475c534"
  def file; end

  # --- hexdigest(str) -> String
  # 
  # 与えられた文字列に対するハッシュ値を、ASCIIコードを使って
  # 16進数の列を示す文字列にエンコードして返します。
  # new(str).hexdigest と等価です。
  def hexdigest; end

  # --- new            -> Digest::Base
  # 新しいダイジェストオブジェクトを生成します。
  def new; end

end
