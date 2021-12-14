class IRB::FileInputMethod
  # --- encoding -> Encoding
  # 
  # 読み込んだファイルの文字エンコーディングを返します。
  def encoding; end

  # --- gets -> String
  # 
  # 読み込んだファイルから文字列を 1 行読み込みます。
  def gets; end

  # --- new(path) -> IRB::FileInputMethod
  # 
  # 自身を初期化します。
  # 
  # @param path パスを文字列で指定します。
  def new; end

end
