class Fiddle::Handle
  # --- sym(func) -> Integer
  # --- [](func)  -> Integer
  # 
  # 関数やグローバル変数 func へのポインタを取得し、整数として返します。
  # 
  # @param func 得たいシンボルの名前を文字列で与えます。
  # 
  # @raise Fiddle::DLError シンボルが見つからなかった時に発生します。
  # 
  #   require 'fiddle'
  #   
  #   h = Fiddle::Handle.new('libc.so.6')
  #   p h.sym('strlen') # 関数ポインタのアドレスを整数で表示
  def []; end

  # --- close    -> Integer
  # 
  # 自身をクローズします。成功した場合は 0 を返します。そうでない場合は、
  # 0 以外の整数を返します。
  # 
  # @see [[man:dlclose(3)]]
  def close; end

  # --- close_enabled? -> bool 
  # 
  # GC によるオブジェクトの回収時に self をクローズする([[m:Fiddle::Handle#close]])
  # かどうかを真偽値で返します。
  # 
  # 
  # @see [[m:Fiddle::Handle#enable_close]], [[m:Fiddle::Handle#disable_close]]
  def close_enabled?; end

  # --- disable_close    -> nil
  # 
  # GC によるオブジェクトの回収時に self をクローズしない([[m:Fiddle::Handle#close]])
  # ように設定します。
  # 
  # デフォルトでは close しません。
  # 
  # @see [[m:Fiddle::Handle#enable_close]], [[m:Fiddle::Handle#close_enabled?]]
  def disable_close; end

  # --- enable_close     -> nil
  # GC によるオブジェクトの回収時に self をクローズする([[m:Fiddle::Handle#close]])
  # ように設定します。
  # 
  # デフォルトでは close しません。
  # 
  # @see [[m:Fiddle::Handle#disable_close]], [[m:Fiddle::Handle#close_enabled?]]
  def enable_close; end

  # --- to_i    -> Integer
  # 
  # 自身が表すハンドル([[man:dlopen(3)]] が返したもの)のアドレスを返します。
  def to_i; end

  # --- sym(func) -> Integer
  # --- [](func) -> Integer
  # 
  # ライブラリのデフォルトの検索順序に従い、現在のライブラリ以降の
  # シンボルを探します。
  # 
  # Fiddle::Handle::NEXT.sym(func) と同じです。詳しくは [[man:dlsym(3)]] の
  # RTLD_NEXT を見てください。
  # 
  # @raise Fiddle::DLError シンボルが見つからなかった時に発生します。
  def []; end

  # --- new(lib, flags=Fiddle::Handle::RTLD_LAZY|Fiddle::Handle::RTLD_GLOBAL) -> Fiddle::Handle
  # --- new(lib, flags=Fiddle::Handle::RTLD_LAZY|Fiddle::Handle::RTLD_GLOBAL) {|handle| ... }    -> Fiddle::Handle
  # 
  # ライブラリ lib をオープンし、Handle オブジェクトとして返します。
  # 
  # ブロックを指定すれば、生成した Handle を引数としてブロックを実行します。
  # Handle はブロックの終りで自動的にクローズされます。
  # 
  # flags で [[man:dlopen(3)]] の第2引数として渡すフラグを指定できます。
  # [[m:Fiddle::Handle::RTLD_LAZY]]、[[m:Fiddle::Handle::RTLD_NOW]] 
  # のどちらか一方を指定する必要があり、
  # またそれに [[m:Fiddle::Handle::RTLD_GLOBAL]] と OR を取ることができます。
  # 詳しい意味は manpage([[man:dlopen(3)]]) を参照してください。
  # 
  # @param lib ライブラリを文字列で指定します。
  # @param flags フラグ
  # @raise Fiddle::DLError ライブラリのオープンに失敗した場合に発生します
  # 
  # 例:
  # 
  #   require 'fiddle'
  #   
  #   h = Fiddle::Handle.new('libc.so.6')
  #   i = h.sym('strlen')
  #   func = Fiddle::Function.new(i, [Fiddle::TYPE_VOIDP], Fiddle::TYPE_INT)
  #   p func.call("uxyz") # => 4
  def new; end

  # --- DEFAULT -> Fiddle::Handle
  # RTLD_DEFAULT で表わされる擬似ハンドルを表します。
  # 
  # 詳しくは [[man:dlsym(3)]] を参照してください。
  def DEFAULT; end

  # --- NEXT -> Fiddle::Handle
  # RTLD_NEXT で表わされる擬似ハンドルを表します。
  # 
  # 詳しくは [[man:dlsym(3)]] を参照してください。
  def NEXT; end

  # --- RTLD_GLOBAL -> Integer
  # dlopen のフラグ RTLD_GLOBAL を表す定数です。
  # 
  # [[m:DL::Handle.new]] の flags として用います。
  # 
  # 詳しくは [[man:dlopen(3)]] を見てください。
  def RTLD_GLOBAL; end

  # --- RTLD_LAZY -> Integer
  # dlopen のフラグ RTLD_LAZY を表す定数です。
  # 
  # [[m:DL::Handle.new]] の flags として用います。
  # 
  # 詳しくは [[man:dlopen(3)]] を見てください。
  def RTLD_LAZY; end

  # --- RTLD_NOW -> Integer
  # dlopen のフラグ RTLD_NOW を表す定数です。
  # 
  # [[m:DL::Handle.new]] の flags として用います。
  # 
  # 詳しくは [[man:dlopen(3)]] を見てください。
  def RTLD_NOW; end

end
