class Psych::Nodes::Stream
  # --- encoding -> Integer
  # stream に使われるエンコーディングを返します。
  # 
  # @see [[m:Psych::Nodes::Stream#encoding=]]
  def encoding; end

  # --- encoding=(enc)
  # stream に使われるエンコーディングを指定します。
  # 
  # 以下のいずれかを指定します。
  #   * [[m:Psych::Nodes::Node::UTF8]]
  #   * [[m:Psych::Nodes::Node::UTF16BE]]
  #   * [[m:Psych::Nodes::Node::UTF16LE]]
  # 
  # @param enc 設定するエンコーディング
  # @see [[m:Psych::Nodes::Stream#encoding]]
  def encoding=; end

  # --- new(encoding = Psych::Nodes::Stream::UTF8) -> Psych::Nodes::Stream
  # 
  # Psych::Nodes::Stream オブジェクトを生成して返します。
  # 
  # encoding には stream に使われるエンコーディングを指定します。
  # 以下のいずれかを指定します。
  #   * [[m:Psych::Nodes::Node::UTF8]]
  #   * [[m:Psych::Nodes::Node::UTF16BE]]
  #   * [[m:Psych::Nodes::Node::UTF16LE]]
  # 
  # @param encoding エンコーディング
  def new; end

  # --- ANY -> Integer
  # 任意のエンコーディングを表す値。
  # 
  # [[m:Psych::Parser::ANY]] と同じ値です。
  def ANY; end

  # --- UTF16BE -> Integer
  # UTF16BE エンコーディングを表します。
  # 
  # [[m:Psych::Parser::UTF16BE]] と同じ値です。
  # 
  # @see [[m:Psych::Nodes::Stream.new]]
  def UTF16BE; end

  # --- UTF16LE -> Integer
  # UTF16LE エンコーディングを表します。
  # 
  # [[m:Psych::Parser::UTF16LE]] と同じ値です。
  # 
  # @see [[m:Psych::Nodes::Stream.new]]
  def UTF16LE; end

  # --- UTF8 -> Integer
  # UTF8 エンコーディングを表します。
  # 
  # [[m:Psych::Parser::UTF8]] と同じ値です。
  # 
  # @see [[m:Psych::Nodes::Stream.new]]
  def UTF8; end

end
