class RubyVM
  # --- DEFAULT_PARAMS -> {Symbol => Integer}
  # 
  # [[c:RubyVM]] のデフォルトのパラメータを返します。
  # 
  # [注意] この値は C Ruby 固有のものです。変更しても [[c:RubyVM]] の動作に
  # は影響しません。また、仕様は変更される場合があるため、この値に依存すべ
  # きではありません。
  def DEFAULT_PARAMS; end

  # --- INSTRUCTION_NAMES -> [String]
  # 
  # [[c:RubyVM]] の命令シーケンスの名前の一覧を返します。
  # 
  # @see [[c:RubyVM::InstructionSequence]]
  def INSTRUCTION_NAMES; end

  # --- OPTS -> [String]
  # 
  # [[c:RubyVM]] のビルドオプションの一覧を返します。
  def OPTS; end

end
