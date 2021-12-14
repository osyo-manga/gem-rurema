module Shellwords
  # --- shellescape(str) -> String
  # 
  # 文字列を Bourne シェルのコマンドライン中で安全に使えるようにエスケープします。
  # 
  # @param str エスケープの対象となる文字列を指定します。
  # @return エスケープされた文字列を返します。
  # 
  # 例:
  #     require 'shellwords'
  #     
  #     pattern = 'Jan 15'
  #     puts "grep #{Shellwords.shellescape(pattern)} file"
  #     # => grep Jan\ 15 file
  def shellescape; end

  # --- shelljoin(array) -> String
  # 
  # 配列の各要素である文字列に対して、Bourne シェルのコマンドライン中で安全に
  # 使えるためのエスケープを適用し、空白文字を介してそれらを連結したコマンド
  # ライン文字列を生成します。
  # 
  # 個々の配列要素に対するエスケープには、[[m:Shellwords.#shellescape]] と
  # 同じ規則が適用されます。
  # 
  # @param array エスケープ対象の文字列を要素とする配列を指定します。
  # @return エスケープ結果を連結した文字列を返します。
  # 
  # 例:
  #     require 'shellwords'
  #     
  #     pattern = 'Jan 15'
  #     file = 'file name with spaces'
  #     puts Shellwords.shelljoin(['grep', pattern, file])
  #     # => grep Jan\ 15 file\ name\ with\ spaces
  def shelljoin; end

  # --- shellsplit(line) -> [String]
  # --- shellwords(line) -> [String]
  # 
  # Bourne シェルの単語分割規則に従った空白区切りの単語分割を行い、
  # 単語 (文字列) の配列を返します。
  # 
  # 空白、シングルクォート (')、ダブルクォート (")、バックスラッシュ (\)
  # を解釈します。
  # 
  # @param line 分割の対象となる文字列を指定します。
  # @return 分割結果の各文字列を要素とする配列を返します。
  # @raise ArgumentError 引数の中に対でないシングルクォートまたはダブル
  #        クォートが現れた場合に発生します。
  # 
  # 例:
  #     require 'shellwords'
  #     
  #     p Shellwords.shellwords(%q{  foo bar "foo bar"\ baz 'foo bar'  })
  #     # => ["foo", "bar", "foo bar baz", "foo bar"]
  #      
  #     p Shellwords.shellwords(%q{  A B C "D E F" "G","H I"  })
  #     # => ["A", "B", "C", "D E F", "G,H I"]
  def shellsplit; end

  # --- escape(str) -> String
  # 文字列を Bourne シェルのコマンドライン中で安全に使えるようにエスケープします。
  # 
  # このメソッドは、[[m:Shellwords.#shellescape]] の別名です。
  # 
  # @param str エスケープの対象となる文字列を指定します。
  # @return エスケープされた文字列を返します。
  def escape; end

  # --- join(array) -> String
  # 配列の各要素である文字列に対して、Bourne シェルのコマンドライン中で安全に
  # 使えるためのエスケープを適用し、空白文字を介してそれらを連結したコマンド
  # ライン文字列を生成します。
  # 
  # このメソッドは、[[m:Shellwords.#shelljoin]] の別名です。
  # 
  # @param array エスケープ対象の文字列を要素とする配列を指定します。
  # @return エスケープ結果を連結した文字列を返します。
  def join; end

  # --- split(line) -> [String]
  # Bourne シェルの単語分割規則に従った空白区切りの単語分割を行い、
  # 単語 (文字列) の配列を返します。
  # 
  # このメソッドは、[[m:Shellwords.#shellsplit]] の別名です。
  # 
  # @param line 分割の対象となる文字列を指定します。
  # @return 分割結果の各文字列を要素とする配列を返します。
  # @raise ArgumentError 引数の中に対でないシングルクォートまたはダブル
  #        クォートが現れた場合に発生します。
  def split; end

end
