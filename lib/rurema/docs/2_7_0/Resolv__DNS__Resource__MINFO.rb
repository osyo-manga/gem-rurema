class Resolv::DNS::Resource::MINFO
  # --- emailbx -> String
  # メーリングリストもしくはメールボックスの
  # エラーを受け取るメールボックスのドメイン名を
  # 返します。
  def emailbx; end

  # --- rmailbx -> String
  # メーリングリストもしくはメールボックスの
  # 責任者のドメイン名を返します。
  def rmailbx; end

  # --- new(rmailbx, emailbx) -> Resolv::DNS::Resource::MINFO
  # Resolv::DNS::Resource::MINFO のインスタンスを生成します。
  # 
  # @param rmailbx このメールリストドメイン名
  # @param emailbx
  def new; end

end
