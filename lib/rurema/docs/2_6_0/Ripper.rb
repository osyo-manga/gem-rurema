class Ripper
  # --- column -> Integer | nil
  # 
  # 現在のトークンの桁番号を 0 から始まる数値で返します。
  # 
  # このメソッドはイベントハンドラの中でのみ意味のある値を返します。イベン
  # トハンドラの中で self.column を実行してください。
  def column; end

  # --- compile_error(msg) -> nil
  # 
  # 解析した Ruby プログラムの中にコンパイルエラーがあった場合に実行されま
  # す。
  # 
  # @param msg エラーメッセージ。
  # 
  # サブクラスでオーバライドして使用します。
  def compile_error; end

  # --- encoding -> Encoding
  # 
  # 自身の持つ Ruby プログラムの文字エンコーディングを返します。
  # 
  # Ruby プログラムの解析前は [[m:Encoding::US_ASCII]] を返します。
  def encoding; end

  # --- end_seen? -> bool
  # 
  # これまでに解析した Ruby プログラムの中に __END__ が含まれていたかどうか
  # を返します。
  def end_seen?; end

  # --- filename -> String
  # 
  # 自身の持つ Ruby プログラムのファイル名を文字列で返します。
  def filename; end

  # --- lineno -> Integer | nil
  # 
  # 現在のトークンの行番号を 1 から始まる数値で返します。
  # 
  # このメソッドはイベントハンドラの中でのみ意味のある値を返します。イベン
  # トハンドラの中で self.lineno を実行してください。
  def lineno; end

  # --- parse -> nil
  # 
  # 自身の持つ Ruby プログラムを解析します。常に nil を返します。
  # 
  # サブクラスでオーバライドして使用します。Ruby プログラムの解析は行います
  # が、そのままでは解析結果は利用できません。サブクラスでイベントハンドラ
  # の定義や本メソッドの戻り値の追加などで対応する必要があります。
  # 
  # @see [[m:Ripper.parse]]
  def parse; end

  # --- warn(fmt, *args) -> nil
  # 
  # 解析した Ruby プログラムの中に警告([[m:$-w]] が true の時だけ出力される
  # 警告)を出力するようなものがあった場合に実行されます。
  # 
  # @param fmt エラーメッセージのフォーマット文字列です。
  # 
  # @param args エラーメッセージのフォーマットされる引数です。
  # 
  # サブクラスでオーバライドして使用します。
  # 
  # 引数のエラーメッセージは printf フォーマットに従って渡されます。
  def warn; end

  # --- warning(fmt, *args) -> nil
  # 
  # 解析した Ruby プログラムの中に重要な警告([[m:$-w]] が false の時だけ出
  # 力される警告)を出力するようなものがあった場合に実行されます。
  # 
  # @param fmt エラーメッセージのフォーマット文字列です。
  # 
  # @param args エラーメッセージのフォーマットされる引数です。
  # 
  # サブクラスでオーバライドして使用します。
  # 
  # 引数のエラーメッセージは printf フォーマットに従って渡されます。
  def warning; end

  # --- Ripper.lex(src, filename = '-', lineno = 1) -> [[Integer, Integer], Symbol, String, Ripper::Lexer::State]
  # 
  # Ruby プログラム str をトークンに分割し、そのリストを返します。
  # ただし [[m:Ripper.tokenize]] と違い、トークンの種類と位置情報も付属します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "-" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # 
  # 
  # //emlist[][ruby]{
  # require 'ripper'
  # 
  # pp Ripper.lex("def m(a) nil end")
  # # => [[[1, 0], :on_kw, "def", EXPR_FNAME],
  # #     [[1, 3], :on_sp, " ", EXPR_FNAME],
  # #     [[1, 4], :on_ident, "m", EXPR_ENDFN],
  # #     [[1, 5], :on_lparen, "(", EXPR_BEG|EXPR_LABEL],
  # #     [[1, 6], :on_ident, "a", EXPR_ARG],
  # #     [[1, 7], :on_rparen, ")", EXPR_ENDFN],
  # #     [[1, 8], :on_sp, " ", EXPR_BEG],
  # #     [[1, 9], :on_kw, "nil", EXPR_END],
  # #     [[1, 12], :on_sp, " ", EXPR_END],
  # #     [[1, 13], :on_kw, "end", EXPR_END]]
  # //}
  # 
  # 
  # Ripper.lex は分割したトークンを詳しい情報とともに返します。
  # 返り値の配列の要素は 4 要素の配列 (概念的にはタプル) です。
  # その内訳を以下に示します。
  # 
  # : 位置情報 (Integer,Integer)
  #     トークンが置かれている行 (1-origin) と桁 (0-origin) の 2 要素の配列です。
  # : 種類 (Symbol)
  #     トークンの種類が「:on_XXX」の形式のシンボルで渡されます。
  # : トークン (String)
  #     トークン文字列です。
  # : ステート (Ripper::Lexer::State)
  #     トークンの状態を表す Ripper::Lexer::State のインスタンスです。
  def lex; end

  # --- new(src, filename = "(ripper)", lineno = 1) -> Ripper
  # 
  # Ripper オブジェクトを作成します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "(ripper)" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # src の解析を行うには更に [[m:Ripper#parse]] などの呼び出しが必要です。
  # 
  # @see [[m:Ripper.parse]], [[m:Ripper#parse]]
  def new; end

  # --- parse(src, filename = '(ripper)', lineno = 1) -> nil
  # 
  # 指定された文字列を解析します。常に nil を返します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "(ripper)" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # @see [[m:Ripper#parse]]
  def parse; end

  # --- Ripper.sexp(src, filename = '-', lineno = 1) -> object
  # 
  # Ruby プログラム str を解析して S 式のツリーにして返します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "-" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # 実行結果は、括弧の代わりに配列の要素として S 式のツリーを表現しています。
  # 
  # 例:
  # 
  #   require 'ripper'
  #   require 'pp'
  # 
  #   pp Ripper.sexp("def m(a) nil end")
  #     # => [:program,
  #           [[:def,
  #             [:@ident, "m", [1, 4]],
  #             [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil, nil]],
  #             [:bodystmt, [[:var_ref, [:@kw, "nil", [1, 9]]]], nil, nil, nil]]]]
  # 
  # パーサイベントは以下のような形式になります。
  # 
  #   [:イベント名, ...]
  # 
  # 例:
  # 
  #   [:program, ...]
  # 
  # スキャナイベントは以下のような形式になります。
  # 
  #   [:@イベント名, トークン, 位置情報(行、桁の配列)]
  # 
  # 例:
  # 
  #   [:@ident, "m", [1, 4]]
  # 
  # また、Ripper.sexp は [[m:Ripper.sexp_raw]] とは異なり、読みやすさのため
  # に stmts_add や stmts_new のような _add、_new で終わるパーサイベントを
  # 省略します。_add で終わるパーサイベントはハンドラの引数が 0 個のものが
  # 省略されます。詳しくは [[m:Ripper::PARSER_EVENTS]] を確認してください。
  # 
  # @see [[m:Ripper.sexp_raw]]
  def sexp; end

  # --- Ripper.sexp_raw(src, filename = '-', lineno = 1) -> object
  # 
  # Ruby プログラム str を解析して S 式のツリーにして返します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "-" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # 実行結果は、括弧の代わりに配列の要素として S 式のツリーを表現しています。
  # 
  # 例:
  # 
  #   require 'ripper'
  #   require 'pp'
  # 
  #   pp Ripper.sexp_raw("def m(a) nil end")
  #     # => [:program,
  #           [:stmts_add,
  #            [:stmts_new],
  #            [:def,
  #             [:@ident, "m", [1, 4]],
  #             [:paren, [:params, [[:@ident, "a", [1, 6]]], nil, nil, nil]],
  #             [:bodystmt,
  #              [:stmts_add, [:stmts_new], [:var_ref, [:@kw, "nil", [1, 9]]]],
  #              nil,
  #              nil,
  #              nil]]]]
  # 
  # Ripper.sexp_raw は [[m:Ripper.sexp]] とは異なり解析結果を加工しません。
  # 
  # @see [[m:Ripper.sexp]]
  def sexp_raw; end

  # --- Ripper.slice(src, pattern, n = 0) -> String | nil
  # 
  # Ruby プログラム src のうち、
  # パターン pattern の n 番目の括弧にマッチする文字列を取り出します。
  # 
  # マッチしない場合は nil を返します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param pattern 取り出すプログラムのパターンを文字列で指定します。
  # 
  # @param n pattern で指定した文字列の内、n 番目の括弧の中の文字列だけが必
  #          要な時に指定します。省略すると 0 (pattern 全体)になります。
  # 
  # pattern は Ripper のイベント ID のリストを文字列で記述します。
  # また pattern には Ruby の正規表現と同じメタ文字も使えます。
  # ただし「.」は任意のトークン 1 つにマッチし、
  # その他のメタ文字もすべて文字単位ではなくトークン単位で動作します。
  # 
  # 使用例
  # 
  #   require 'ripper'
  #   p Ripper.slice(%(<<HERE\nstring\#{nil}\nHERE),
  #                  "heredoc_beg .*? nl $(.*?) heredoc_end", 1)
  #       # => "string\#{nil}\n"
  # 
  # イベント ID は [[m:Ripper::SCANNER_EVENTS]] で確認できます。
  def slice; end

  # --- Ripper.token_match(src, pattern) -> Ripper::TokenPattern::MatchData | nil
  # 
  # Ruby プログラム src に対してパターン pattern をマッチし、
  # マッチデータを返します。
  # 
  # ライブラリ内部で使用します。
  def token_match; end

  # --- Ripper.tokenize(src, filename = '-', lineno = 1) -> [String]
  # 
  # Ruby プログラム str をトークンに分割し、そのリストを返します。
  # 
  # @param src Ruby プログラムを文字列か IO オブジェクトで指定します。
  # 
  # @param filename src のファイル名を文字列で指定します。省略すると "-" になります。
  # 
  # @param lineno src の開始行番号を指定します。省略すると 1 になります。
  # 
  # 
  # //emlist[][ruby]{
  # require 'ripper'
  # 
  # p Ripper.tokenize("def m(a) nil end")
  # # => ["def", " ", "m", "(", "a", ")", " ", "nil", " ", "end"]
  # //}
  # 
  # Ripper.tokenize は空白やコメントも含め、
  # 元の文字列にある文字は 1 バイトも残さずに分割します。
  # ただし、ごく僅かな例外として、__END__ 以降の文字列は黙って捨てられます。
  # これは現在のところ仕様と考えてください。
  def tokenize; end

  # --- yydebug -> bool
  # 
  # yydebugの構文解析器の追跡機能が有効か無効かを返します。
  def yydebug; end

  # --- yydebug=(flag)
  # 
  # yydebugの構文解析器の追跡機能が有効か無効かを指定します。
  # 
  # @param flag true か false を指定します。
  def yydebug=; end

  # --- EVENTS -> [Symbol]
  # 
  # ripper の扱う全てのイベント ID (シンボル) のリストを返します。
  def EVENTS; end

  # --- PARSER_EVENTS -> [Symbol]
  # 
  # パーサイベントのイベント ID (シンボル) のリストを返します。
  def PARSER_EVENTS; end

  # --- PARSER_EVENT_TABLE -> {Symbol => Integer}
  # 
  # パーサイベントのイベント ID (シンボル) と対応するハンドラの引数の個数の
  # リストをハッシュで返します。
  def PARSER_EVENT_TABLE; end

  # --- SCANNER_EVENTS -> [Symbol]
  # 
  # スキャナイベントのイベント ID (シンボル) のリストを返します。
  def SCANNER_EVENTS; end

  # --- SCANNER_EVENT_TABLE -> {Symbol => Integer}
  # 
  # スキャナイベントのイベント ID (シンボル) と対応するハンドラの引数の個数
  # のリストをハッシュで返します。
  def SCANNER_EVENT_TABLE; end

  # --- Version -> String
  # 
  # ripper のバージョンを文字列で返します。
  def Version; end

end
