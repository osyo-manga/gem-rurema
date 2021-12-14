module ERB::Util
  # --- html_escape(s) -> String
  # --- h(s) -> String
  # 
  # 文字列 s を HTML用にエスケープした文字列を返します。
  # 
  # 文字列 s 中に含まれる  &"<> を、実体参照 &amp; &quot; &lt; &gt; にそれぞれ変更した文字列を返します
  # ([[m:CGI.escapeHTML]]とほぼ同じです)。
  # 
  # @param s HTMLエスケープを行う文字列
  # 
  # //emlist[例][ruby]{
  # require "erb"
  # include ERB::Util
  # 
  # puts html_escape("is a > 0 & a < 10?")
  # # is a &gt; 0 &amp; a &lt; 10?
  # //}
  def h; end

  # --- url_encode(s)  -> String
  # --- u(s) -> String
  # 
  # 文字列 s を URLエンコードした文字列を返します。
  # 
  # 文字列 s 中に含まれる 2バイト文字や半角スペースについて URL エンコードを行った文字列を返します([[m:CGI.escape]]とほぼ同じです)。
  # 
  # @param s URLエンコードを行う文字列
  # 
  # //emlist[例][ruby]{
  # require "erb"
  # include ERB::Util
  # 
  # puts url_encode("Programming Ruby:  The Pragmatic Programmer's Guide")
  # # Programming%20Ruby%3A%20%20The%20Pragmatic%20Programmer%27s%20Guide
  # //}
  def u; end

end
