module Gem::LocalRemoteOptions
  # --- accept_uri_http
  # HTTP の URI を扱えるようにするためのメソッドです。
  def accept_uri_http; end

  # --- add_bulk_threshold_option
  # オプション --bulk-threshold を追加します。
  def add_bulk_threshold_option; end

  # --- add_local_remote_options
  # オプション --local, --remote, --both を追加します。
  def add_local_remote_options; end

  # --- add_proxy_option
  # オプション --http-proxy を追加します。
  def add_proxy_option; end

  # --- add_source_option
  # オプション --source を追加します。
  def add_source_option; end

  # --- add_update_sources_option
  # オプション --update-source を追加します。
  def add_update_sources_option; end

  # --- both? -> bool
  # 
  # ローカルとリモートの情報を両方とも取得する場合は真を返します。
  # そうでない場合は偽を返します。
  def both?; end

  # --- local? -> bool
  # 
  # ローカルの情報を取得する場合は真を返します。
  # そうでない場合は偽を返します。
  def local?; end

  # --- remote? -> bool
  # 
  # リモートの情報を取得する場合は真を返します。
  # そうでない場合は偽を返します。
  def remote?; end

end
