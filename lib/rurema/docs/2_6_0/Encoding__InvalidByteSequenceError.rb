class Encoding::InvalidByteSequenceError
  # --- destination_encoding -> Encoding
  # エラーを発生させた変換の変換先のエンコーディングを [[c:Encoding]]
  # オブジェクトで返します。
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#source_encoding]],
  #      [[m:Encoding::UndefinedConversionError#destination_encoding]]
  def destination_encoding; end

  # --- destination_encoding_name -> String
  # エラーを発生させた変換の変換先のエンコーディングを文字列で返します。
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#destination_encoding]]
  def destination_encoding_name; end

  # --- error_bytes -> String
  # エラー発生時に捨てられたバイト列を返します。
  # 
  # 
  # //emlist[例][ruby]{
  # ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
  # begin
  #   ec.convert("abc\xA1\xFFdef")
  # rescue Encoding::InvalidByteSequenceError
  #   p $!
  #   #=> #<Encoding::InvalidByteSequenceError: "\xA1" followed by "\xFF" on EUC-JP>
  #   puts $!.error_bytes.dump          #=> "\xA1"
  #   puts $!.readagain_bytes.dump      #=> "\xFF"
  # end
  # //}
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#readagain_bytes]]
  def error_bytes; end

  # --- incomplete_input? -> bool
  # エラー発生時に入力文字列が不足している場合に真を返します。
  # 
  # つまり、マルチバイト文字列の途中で文字列が終わっている場合に
  # 真を返します。これは後続の入力を追加することでエラーが
  # 解消する可能性があることを意味します。
  # 
  # //emlist[例][ruby]{
  # ec = Encoding::Converter.new("EUC-JP", "ISO-8859-1")
  # 
  # begin
  #   ec.convert("abc\xA1z")
  # rescue Encoding::InvalidByteSequenceError
  #   p $!
  #   #=> #<Encoding::InvalidByteSequenceError: "\xA1" followed by "z" on EUC-JP>
  #   p $!.incomplete_input?    #=> false
  # end
  # 
  # begin
  #   ec.convert("abc\xA1")
  #   ec.finish
  # rescue Encoding::InvalidByteSequenceError
  #   p $! #=> #<Encoding::InvalidByteSequenceError: incomplete "\xA1" on EUC-JP>
  #   p $!.incomplete_input?    #=> true
  # end
  # //}
  def incomplete_input?; end

  # --- readagain_bytes -> String
  # エラー発生時に読み直さなければならないバイト列を返します。
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#error_bytes]]
  def readagain_bytes; end

  # --- source_encoding -> Encoding
  # エラーを発生させた変換の変換元のエンコーディングを [[c:Encoding]]
  # オブジェクトで返します。
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#destination_encoding]],
  #      [[m:Encoding::UndefinedConversionError#source_encoding]]
  def source_encoding; end

  # --- source_encoding_name -> Encoding
  # エラーを発生させた変換の変換元のエンコーディングを文字列で返します。
  # 
  # @see [[m:Encoding::InvalidByteSequenceError#source_encoding]]
  def source_encoding_name; end

end
