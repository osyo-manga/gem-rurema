class Resolv::DNS::Resource::IN::SRV
  # --- port -> Integer
  # 対象のサービスの対象のホストにおけるポート番号を返します。
  def port; end

  # --- priority -> Integer
  # ホストの優先順位を返します。
  # 
  # クライアントは利用可能なホストの中で最も priority が
  # 小さい数値のホストを利用しなければなりません。
  # 
  # priority が同じならば [[m:Resolv::DNS::Resource::IN::SRV#weight]]
  # で定義されるようにホストを選ぶべきです。
  # 
  # 返り値の範囲は 0 から 65535 までの整数値です。
  def priority; end

  # --- target -> Resolv::DNS::Name
  # 対象のホストのホスト名を返します。
  def target; end

  # --- weight -> Integer
  # サーバを選択するための「重み」です。
  # 
  # [[m:Resolv::DNS::Resource::IN::SRV#priority]] が同じ場合に
  # この項目が利用されます。
  # 重みに比例した確率でホストを選択すべきです。
  # 返り値の範囲は 0 から 65535 までの整数です。
  # 選択肢が一つしかない、つまり選択する必要がない場合には
  # この値は人間が読みやすいよう 0 にすべきです。
  def weight; end

  # --- new(priority, weight, port, target) -> Resolv::DNS::Resource::IN::SRV
  # Resolv::DNS::Resource::IN::SRV のインスタンスを生成します。
  # 
  # @param priority ホストの優先順位
  # @param weight
  # @param port ポート番号
  # @param target ホスト名
  def new; end

end
