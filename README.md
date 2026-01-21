# 履歴書・職務経歴書

日本語履歴書（JIS規格B5）と職務経歴書を管理するリポジトリ。

- 履歴書: Typstで作成 → PDF出力
- 職務経歴書: Markdownで作成

## 必要な環境

### Typst

```bash
# macOS (Homebrew)
brew install typst

# その他のOS
# https://github.com/typst/typst/releases からダウンロード
```

### フォント

Noto Serif CJK JP / Noto Sans CJK JP が必要。

```bash
# macOS (Homebrew)
brew install --cask font-noto-serif-cjk-jp font-noto-sans-cjk-jp
```

## クイックスタート

### 1. 個人情報ファイルを作成

```bash
cp resume/personal.example.typ resume/personal.typ
```

### 2. 個人情報を編集

`resume/personal.typ` を開いて、以下を編集:

- `私情報` - 氏名・ふりがな・生年月日・年齢
- `連絡先1` - 現住所・電話番号・Email
- `連絡先2` - 連絡先（必要な場合のみ）
- `学歴データ` - 学歴
- `職歴データ` - 職歴
- `学習歴データ` - スクール等の学習歴
- `資格データ` - 資格・免許
- `扶養情報データ` - 扶養家族数・配偶者・配偶者の扶養義務

扶養情報は以下の形式で追加:

```typst
#let 扶養情報データ = (
  扶養家族数: 0,
  配偶者: "無",  // "有" または "無"
  配偶者の扶養義務: "無",  // "有" または "無"
)
```

### 3. 証明写真を配置

```bash
# 証明写真を配置（4cm×3cmの縦向き写真）
cp /path/to/your/photo.jpg resume/image/profile.jpg
```

`personal.typ` で写真パスを更新:

```typst
#let 写真パス = "image/profile.jpg"
```

### 4. PDFを生成

```bash
typst compile resume/main.typ
# → resume/main.pdf が生成される
```

## よく使うコマンド

```bash
# PDF生成
typst compile resume/main.typ

# ウォッチモード（編集を監視して自動コンパイル）
typst watch resume/main.typ
```

## ファイル構成

```
resume/
├── main.typ              # メインファイル（レイアウト）
├── template.typ          # テンプレート定義
├── personal.typ          # 個人情報（Git管理外）
├── personal.example.typ  # 個人情報のサンプル
└── image/
    └── profile.jpg       # 証明写真（Git管理外）

cv/
└── cv.md                 # 職務経歴書（Markdown）
```

## データの編集

### 学歴・職歴の追加

`personal.typ` の各データ配列に追加:

```typst
#let 学歴データ = (
  (年: "", 月: "", 内容: ""),  // ヘッダー用（削除しない）
  (年: "2015", 月: "3", 内容: "○○高等学校 卒業"),
  (年: "2015", 月: "4", 内容: "○○大学○○学部 入学"),
  (年: "2019", 月: "3", 内容: "○○大学○○学部 卒業"),
)

#let 職歴データ = (
  (年: "", 月: "", 内容: ""),  // ヘッダー用（削除しない）
  (年: "2019", 月: "4", 内容: "株式会社○○ 入社"),
  (年: "2023", 月: "3", 内容: "一身上の都合により退職"),
)
```

### 本人希望欄の編集

`main.typ` の `本人希望()` を編集:

```typst
本人希望(
  [貴社規定に従います。]
)
```

## Git管理について

### コミットされるもの

- `template.typ` - テンプレート
- `main.typ` - レイアウト設定
- `personal.example.typ` - サンプルデータ
- `cv/cv.md` - 職務経歴書

### コミットされないもの（`.gitignore`）

- `personal.typ` - 個人情報
- `resume/image/*.jpg` - 証明写真
- `*.pdf` - 生成されたPDF

### 新しい環境でのセットアップ

1. リポジトリをクローン
2. `personal.example.typ` → `personal.typ` にコピー
3. 個人情報を入力
4. 証明写真を配置
5. `typst compile resume/main.typ` でPDF生成
