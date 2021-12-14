class OpenSSL::Config
  # --- [](sec) -> {String => String}
  # --- section(sec) -> {String => String}
  # 指定したセクションの設定情報をハッシュで返します。
  # 
  # ハッシュのキーが設定情報のキー、ハッシュの値が対応する情報となります。
  # 
  # section は obsolete です。[] を使ってください。
  # 
  # @param sec セクションを表す文字列
  def []; end

  # --- []=(sec, hashtbl)
  # 指定したセクションの設定情報を上書きします。
  # 
  # sec で変更するセクションを指定し、hashtbl は {キー文字列 => データ文字列}
  # というハッシュで変更する情報を渡します。
  # 
  # hashtbl に含まれていないキーに対応する情報は変更されません。
  # 
  # @param sec セクションを表す文字列
  # @param hashtbl 設定する情報のハッシュ
  def []=; end

  # --- add_value(section, name, value) -> String
  # section で指定したセクションにある name というキーの
  # 情報を value に変更します。
  # 
  # 指定した section が存在しない場合には新たにそのセクションが
  # オブジェクト内に作られます。
  # 指定した name が存在しない場合も同様に新たな領域が
  # そのオブジェクト内に作られます。指定した name が存在した場合には
  # 情報が上書きされます。
  # 
  # value を返します。
  # 
  # @param section セクションを表す文字列
  # @param name キーを表す文字列
  # @param value 変更後の値の文字列
  # @raise OpenSSL::ConfigError 設定に失敗した場合に発生します
  def add_value; end

  # --- each {|section, key, value| ... } -> self
  # オブジェクトに含まれる全ての設定情報を順にブロックに渡し
  # 呼び出します。
  # 
  # 渡される値は、セクションを表す文字列、キーを表す文字列、キーに
  # 割り当てられた値の文字列、の3つです。
  # 
  #   require 'openssl'
  #   conf = OpenSSL::Config.load(OpenSSL::Config::DEFAULT_CONFIG_FILE)
  #   conf.each{|section, key, value| p [section, key, value]}
  #   # => ["req_distinguished_name", "countryName", "Country Name (2 letter code)"]
  #   # => ["req_distinguished_name", "countryName_default", "AU"]
  #   # => ["req_distinguished_name", "countryName_min", "2"]
  #   # =>       :
  def each; end

  # --- get_value(section, name) -> String | nil
  # オブジェクトが持っている設定情報を返します。
  # 
  # キーに対応する設定情報がない場合は nil を返します。
  # 
  # @param section セクションを表す文字列。"" を渡すことでグローバルな設定情報を読むことができます。
  # @param name キーを表す文字列
  def get_value; end

  # --- sections -> [String]
  # オブジェクトに含まれる全てのセクション名の配列を返します。
  def sections; end

  # --- to_s -> String
  # オブジェクトに含まれる設定情報を OpenSSL の設定ファイルの形式で
  # 出力します。
  def to_s; end

  # --- value(name) -> String | nil
  # --- value(section, name) -> String | nil
  # このメソッドは obsolete です。
  # 
  # オブジェクトが持っている設定情報を返します。
  # 
  # 引数が一つの場合はグローバルセクションの情報を返し、
  # 2つの場合は section で指定したセクションの情報を返します。
  # 
  # @param section セクションを表す文字列
  # @param name キーを表す文字列
  def value; end

  # --- load(filename = nil) -> OpenSSL::Config
  # --- new(filename = nil) -> OpenSSL::Config
  # OpenSSL::Config オブジェクトを生成します。
  # 
  # filename で指定したファイルから設定データを読みこみます。
  # 
  # filename を省略した場合は空のオブジェクトが生成されます。
  # 
  # @param filename ファイル名文字列
  # @raise OpenSSL::ConfigError 設定ファイルの文法が正しくない場合に発生します
  def load; end

  # --- parse(str) -> OpenSSL::Config
  # 文字列から OpenSSL::Config オブジェクトを生成します。
  # 
  # @param str 設定ファイルデータ
  def parse; end

  # --- DEFAULT_CONFIG_FILE -> String
  # デフォルトの設定ファイル名を返します。
  def DEFAULT_CONFIG_FILE; end

end
