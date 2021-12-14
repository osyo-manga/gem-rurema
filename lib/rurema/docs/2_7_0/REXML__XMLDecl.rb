class REXML::XMLDecl
  # --- ==(other) -> bool
  # self と other が同じであるならば真を返します。
  # 
  # 「同じ」とは [[m:REXML::XMLDecl#version]], [[m:REXML::XMLDecl#encoding]],
  # [[m:REXML::XMLDecl#standalone]] が一致していることを意味します。
  # 
  # @param other 比較対象のオブジェクト
  def ==; end

  # --- clone -> REXML::XMLDecl
  # self を複製します。
  def clone; end

  # --- dowrite -> ()
  # 出力時([[m:REXML::Document#write]]) に XML 宣言を省略しない
  # よう指示します。
  # 
  # @see [[m:REXML::XMLDecl#nowrite]], [[m:REXML::XMLDecl#writethis]]
  def dowrite; end

  # --- encoding -> String | nil
  # 設定されているエンコーディングの名前を文字列で返します。
  # 
  # エンコーディングが指定されていない(デフォルトの UTF-8 とみなされます)
  # 場合は nil を返します。
  def encoding; end

  # --- encoding=(enc)
  # エンコーディングを enc に設定します。
  # 
  # enc に nil を渡すと XML 宣言では encoding が
  # 指定されていない(デフォルトで UTF-8 が使われる)
  # ことになります。
  # 
  # @param enc エンコーディング(文字列 or nil)
  # @see [[m:REXML::XMLDecl#encoding=]]
  def encoding=; end

  # --- node_type -> Symbol
  # シンボル :xmldecl を返します。
  def node_type; end

  # --- nowrite -> ()
  # 出力時([[m:REXML::Document#write]]) に XML 宣言を省略する
  # よう指示します。
  # 
  # @see [[m:REXML::XMLDecl#dowrite]], [[m:REXML::XMLDecl#writethis]]
  def nowrite; end

  # --- standalone -> String | nil
  # --- stand_alone? -> String | nil
  # スタンドアロン文書であるかどうかを "yes" "no" で
  # 返します。
  # 
  # nil(省略)を返す場合もあります。
  def stand_alone?; end

  # --- standalone=(value)
  # スタンドアロン文書であるかどうかを "yes" "no" で設定します。
  # 
  # この属性を省略したい場合は nil を指定します。
  # 
  # @param value 設定値(文字列)
  def standalone=; end

  # --- version -> String
  # XML文書のバージョンを文字列で返します。
  def version; end

  # --- version=(value)
  # XML文書のバージョンを設定します。
  # 
  # @param value 設定値(文字列)
  def version=; end

  # --- writeencoding -> bool
  # XML宣言内の encoding の宣言を出力時に省略するならば真を返します。
  # 
  # これが真であっても UTF-8 以外のエンコーディングを指定している
  # ならば encoding は出力されます。
  def writeencoding; end

  # --- writethis -> bool
  # 出力時([[m:REXML::Document#write]]) に XML 宣言を出力する(省略しない)
  # ならば真を返します。
  # 
  # @see [[m:REXML::XMLDecl#dowrite]], [[m:REXML::XMLDecl#nowrite]]
  def writethis; end

  # --- xmldecl(version, encoding, standalone) -> ()
  # 
  # 内容を更新します。
  # 
  # @param version バージョン(文字列)
  # @param encoding エンコーディング(文字列 or nil)
  # @param standalone スタンドアロン文章かどうか("yes", "no", nil)
  def xmldecl; end

  # --- default -> REXML::XMLDecl
  # XML宣言を含まない文章でデフォルトで使うための
  # XMLDecl オブジェクトを生成して返します。
  def default; end

  # --- new(version = REXML::XMLDecl::DEFAULT_VERSION, encoding = nil, standalone = nil)
  # 新たな XMLDecl オブジェクトを生成して返します。
  # 
  # version 以外は省略可能です。
  # 
  # @param version バージョン(文字列)
  # @param encoding エンコーディング(文字列 or nil)
  # @param standalone スタンドアロン文章かどうか("yes", "no", nil)
  def new; end

  # --- DEFAULT_VERSION -> String
  # [[m:REXML::XMLDecl.new]] や [[m:REXML::XMLDecl.default]] で
  # の使われるデフォルトのXMLバージョン。
  def DEFAULT_VERSION; end

end
