class Ripper::Lexer
  # --- lex -> [[Integer, Integer], Symbol, String, Ripper::Lexer::State]
  # 
  # 自身の持つ Ruby プログラムをトークンに分割し、そのリストを返します。
  # 
  # ライブラリ内部で使用します。 [[m:Ripper.lex]] を使用してください。
  def lex; end

  # --- parse -> [[Integer, Integer], Symbol, String, Ripper::Lexer::State]
  # 
  # 自身の持つ Ruby プログラムをトークンに分割し、そのリストを返します。た
  # だし [[m:Ripper::Lexer#lex]] と違い、結果をソートしません。
  # 
  # ライブラリ内部で使用します。
  def parse; end

  # --- tokenize -> [String]
  # 
  # 自身の持つ Ruby プログラムをトークンに分割し、そのリストを返します。
  # 
  # ライブラリ内部で使用します。 [[m:Ripper.tokenize]] を使用してください。
  def tokenize; end

end
