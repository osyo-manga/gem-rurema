class Psych::Stream
  # --- finish -> ()
  # YAML document への変換を完了し、io への出力を完了します。
  def finish; end

  # --- start(encoding = Psych::Nodes::Stream::UTF8) -> Psych::Stream
  # --- start(encoding = Psych::Nodes::Stream::UTF8){|em| ... } -> Psych::Stream
  # 
  # Ruby オブジェクトを YAML document に変換するための準備をします。
  # 
  # 変換された document は [[m:Psych::Stream.new]] で指定した
  # 出力先に出力されます。
  # 
  # finish を呼び出すことで出力が完了します(finish を呼び出さないと
  # 最後まで出力されない場合があります)。
  # 
  # ブロック付きで start を呼び出すと、変換準備を終えた Stream オブジェクト
  # (self) がブロックに渡され、ブロックが呼び出された後に finish を呼び出します。
  # これによって finish を確実に呼び出すことができます。
  # 
  # @param encoding 出力のエンコーディング
  def start; end

  # --- new(io) -> Psych::Stream
  # 
  # 新たな Stream オブジェクトを生成します。
  # 
  # io で YAML document の出力先を指定します。
  # 
  # @param io 出力先の IO オブジェクト
  def new; end

end
