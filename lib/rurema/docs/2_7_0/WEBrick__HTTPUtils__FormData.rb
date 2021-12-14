class WEBrick::HTTPUtils::FormData
  # --- <<(str)    -> self
  # 
  # WEBrick::HTTPUtils の内部で使われます。ユーザがこのメソッドを直接呼ぶことはありません。
  def <<; end

  # --- [](header)    -> String | nil
  # 
  # 自身が multipart/form-data なデータの場合に、header で指定された 
  # ヘッダの値を文字列で返します。無ければ nil を返します。
  # 
  # @param header ヘッダ名を文字列で指定します。大文字と小文字を区別しません。
  # 
  # 例:
  # 
  #  require "webrick/cgi"
  #  class MyCGI < WEBrick::CGI
  #    def do_GET(req, res)
  #      p req.query['q']['content-type']   #=> "plain/text"
  #    end
  #  end
  #  MyCGI.new.start()
  def []; end

  # --- append_data(data)   -> self
  # 
  # WEBrick::HTTPUtils の内部で使われます。ユーザがこのメソッドを直接呼ぶことはありません。
  def append_data; end

  # --- each_data{|s| ... }
  # 
  # 自身が表す各フォームデータを引数として、与えられたブロックを実行します。
  # 
  # 例:
  # 
  #  require "webrick/cgi"
  #  class MyCGI < WEBrick::CGI
  #    def do_GET(req, res)
  #      req.query['q'].each_data{|s|
  #        p s
  #      }
  #      #=> "val1"
  #          "val2"
  #          "val3"
  #    end
  #  end
  #  MyCGI.new.start()
  #   
  def each_data; end

  # --- filename         -> String | nil
  # --- filename=(value)
  # 
  # フォームデータの filename 属性を文字列で表すアクセサです。
  # 
  # @param value フォームデータの filename 属性を文字列で指定します。
  # 
  # 例:
  # 
  #  require "webrick/cgi"
  #  class MyCGI < WEBrick::CGI
  #    def do_GET(req, res)
  #      p req.query['q'].filename   #=> "my_file.txt"
  #    end
  #  end
  #  MyCGI.new.start()
  def filename; end

  # --- list      -> Array
  # --- to_ary    -> Array
  # 
  # 自身が表す各フォームデータを収納した配列を生成して返します。
  # 
  # 例:
  # 
  #  require "webrick/cgi"
  #  class MyCGI < WEBrick::CGI
  #    def do_GET(req, res)
  #      p req.query['q'].list    #=> ["val1", "val2", "val3"]
  #    end
  #  end
  #  MyCGI.new.start()
  def list; end

  # --- name          -> String | nil
  # --- name=(value)
  # 
  # フォームデータの name 属性を文字列で表すアクセサです。
  # 
  # @param value フォームデータの name 属性を文字列で指定します。
  # 
  # 例:
  # 
  #  require "webrick/cgi"
  #  class MyCGI < WEBrick::CGI
  #    def do_GET(req, res)
  #      p req.query['q'].name   #=> "q"
  #    end
  #  end
  #  MyCGI.new.start()
  def name; end

  # --- to_s      -> String
  # 
  # 自身が表すフォームデータのうちのひとつを文字列として返します。
  def to_s; end

  # --- new(*args)   -> WEBrick::HTTPUtils::FormData
  # 
  # WEBrick::HTTPUtils の内部で使われます。ユーザがこのメソッドを直接呼ぶことはありません。
  def new; end

end
