class IRB::ReadlineInputMethod
  # --- encoding -> Encoding
  # 
  # 自身の文字エンコーディングを返します。
  def encoding; end

  # --- eof? -> bool
  # 
  # 入力が EOF(End Of File)に達したかどうかを返します。
  def eof?; end

  # --- gets -> String
  # 
  # 標準入力から文字列を 1 行読み込みます。
  def gets; end

  # --- line(line_no) -> String
  # 
  # 引数 line_no で指定した過去の入力を行単位で返します。
  # 
  # @param line_no 取得する行番号を整数で指定します。
  def line; end

  # --- readable_atfer_eof? -> false
  # 
  # 入力が EOF(End Of File)に達した後も読み込みが行えるかどうかを返します。
  def readable_atfer_eof?; end

  # --- new -> IRB::ReadlineInputMethod
  # 
  # 自身を初期化します。
  def new; end

end
