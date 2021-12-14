class Encoding::UndefinedConversionError
  # --- destination_encoding -> Encoding
  # エラーを発生させた変換の変換先のエンコーディングを [[c:Encoding]]
  # オブジェクトで返します。
  # 
  # @see [[m:Encoding::UndefinedConversionError#source_encoding]]
  def destination_encoding; end

  # --- destination_encoding_name -> String
  # エラーを発生させた変換の変換先のエンコーディングを文字列で返します。
  # 
  # @see [[m:Encoding::UndefinedConversionError#destination_encoding]]
  def destination_encoding_name; end

  # --- error_char -> String
  # エラーを発生させた1文字を文字列で返します。
  # 
  # //emlist[例][ruby]{
  # ec = Encoding::Converter.new("UTF-8", "EUC-JP")
  # begin
  #   ec.convert("\u{a0}")
  # rescue Encoding::UndefinedConversionError
  #   puts $!.error_char.dump   #=> "\u{a0}"
  # end
  # //}
  def error_char; end

  # --- source_encoding -> Encoding
  # エラーを発生させた変換の変換元のエンコーディングを [[c:Encoding]]
  # オブジェクトで返します。
  # 
  # 変換が多段階になされる場合は元の文字列のものではない
  # エンコーディングが返される場合があることに注意してください。
  # 
  # @see [[m:Encoding::UndefinedConversionError#destination_encoding]]
  def source_encoding; end

  # --- source_encoding_name -> Encoding
  # エラーを発生させた変換の変換元のエンコーディングを文字列で返します。
  # 
  # @see [[m:Encoding::UndefinedConversionError#source_encoding]]
  def source_encoding_name; end

end
