class Net::IMAP::BodyTypeBasic
  # --- content_id -> String | nil
  # Content-ID の値を文字列で返します。
  # 
  # @see [[RFC:2045]]
  def content_id; end

  # --- description -> String | nil
  # Content-Description の値を文字列で返します。
  # 
  # @see [[RFC:2045]]
  def description; end

  # --- disposition -> Net::IMAP::ContentDisposition | nil
  # Content-Dispotition の値を返します。
  # 
  # [[c:Net::IMAP::ContentDisposition]] オブジェクトを返します。
  # 
  # @see [[RFC:1806]], [[RFC:2183]]
  def disposition; end

  # --- encoding -> String
  # Content-Transfer-Encoding の値を文字列で返します。
  # 
  # @see [[RFC:2045]]
  def encoding; end

  # --- extension -> Array | nil
  # メッセージの拡張データを返します。
  def extension; end

  # --- language -> String | [String] | nil
  # [[RFC:1766]] で定義されているボディ言語を表わす
  # 文字列もしくは文字列の配列を返します。
  def language; end

  # --- md5 -> String | nil
  # ボディの MD5 値を文字列で返します。
  def md5; end

  # --- subtype -> String
  # --- media_subtype -> String
  # MIME のメディアタイプのサブタイプを返します。
  #  
  # media_subtype は obsolete です。
  # 
  # @see [[m:Net::IMAP::BodyTypeBasic#media_type]]
  def media_subtype; end

  # --- media_type -> String
  # MIME のメディアタイプを返します。
  # 
  # @see [[m:Net::IMAP::BodyTypeBasic#subtype]]
  def media_type; end

  # --- multipart? -> bool
  # マルチパートかどうかを返します。
  # false を返します。
  def multipart?; end

  # --- param -> { String => String } | nil
  # MIME のボディパラメータをハッシュテーブルで返します。
  # 
  # ハッシュテーブルのキーがパラメータ名となります。
  # 
  # @see [[RFC:2045]]
  def param; end

  # --- size -> Integer
  # ボディのサイズのオクテット数を返します。
  def size; end

end
