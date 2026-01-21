# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

日本語履歴書（JIS規格B5）と職務経歴書を管理するリポジトリ。

- 履歴書: Typstで作成 (`resume/`)
- 職務経歴書: Markdownで作成 (`cv/`)

## ビルドコマンド

```bash
# 履歴書PDFの生成
typst compile resume/main.typ

# ウォッチモード（変更を監視して自動コンパイル）
typst watch resume/main.typ
```

## アーキテクチャ

### 履歴書 (resume/)

- `template.typ` - テンプレート定義。日本語名の関数でJIS規格履歴書のセクションを構成
- `main.typ` - 実際の履歴書データ。templateをインポートして使用
- `image/` - 証明写真などの画像ファイル

### テンプレート関数 (template.typ)

main.typでは以下の関数を呼び出してセクションを構成:

| 関数 | 用途 |
|------|------|
| `私()` | 氏名・ふりがな・生年月日・年齢 |
| `証明写真()` | 証明写真（4cm×3cm） |
| `アドレス()` | 住所・電話・Email（現住所と連絡先の2段構成） |
| `学歴()` / `職歴()` / `資格()` | 各経歴エントリ（年・月・内容） |
| `経歴()` | 学歴・職歴・資格セクションの親コンテナ |
| `志望動機()` / `本人希望()` | 自由記述セクション |
| `以上()` | 経歴セクションの終了マーク |

### 職務経歴書 (cv/)

- `cv.md` - 職務経歴書本体（Markdown形式）

## フォント設定

Noto Serif CJK JP / Noto Sans CJK JP を使用。システムにインストールが必要。
