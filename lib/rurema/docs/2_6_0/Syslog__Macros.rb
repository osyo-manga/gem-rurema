module Syslog::Macros
  # --- LOG_MASK(priority) -> Integer
  # 
  # 1つの優先度に対するマスクを作成します。
  # 
  # @param priority priority は優先度を示す定数を指定します。
  #                 詳しくは、[[c:Syslog::Level]]を参照してください。
  # 
  # 例:
  #          require 'syslog'
  #          Syslog.mask = Syslog::LOG_MASK(Syslog::LOG_ERR)
  def LOG_MASK; end

  # --- LOG_UPTO(priority) -> Integer
  # 
  # priorityまでのすべての優先度のマスクを作成します。
  # 
  # @param priority priority は優先度を示す定数を指定します。
  #                 詳しくは、[[c:Syslog::Level]]を参照してください。
  # 
  # 例:
  #          require 'syslog'
  #          Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_ERR)
  def LOG_UPTO; end

end
