#import "template.typ": *
#import "personal.typ": 私情報, 写真パス, 連絡先1, 連絡先2, 学歴データ, 職歴データ, 学習歴データ, 資格データ, 扶養情報データ
#let title = [#text(tracking: 1em,size: 14pt,[履歴書])]

#let fontSerif = ("Noto Serif", "Noto Serif CJK JP")
#let fontSan = ("Noto Sans", "Noto Sans CJK JP")

#set text(font: fontSerif, size: systemFontSize)
#set page(paper: "a4",margin: 1.5cm)

= #title
// 使い方の説明。
// "私"と"アドレス"など日本語名の関数の引数を変更してください。

#move( dy: -1cm,
  stack(
    align(bottom,
      grid(
        columns: (5fr,2fr),
        私(
          性読み: 私情報.性読み,
          名読み: 私情報.名読み,
          性: 私情報.性,
          名: 私情報.名,
          生年月日: 私情報.生年月日,
          年齢: 私情報.年齢
        ),
        証明写真(写真: 写真パス)
        // 証明写真()
      ),
    ),
    アドレス(
      住所ふりがな1: 連絡先1.住所ふりがな,
      住所1: 連絡先1.住所,
      郵便番号1: 連絡先1.郵便番号,
      電話番号1: 連絡先1.電話番号,
      Email1: 連絡先1.Email,
      住所ふりがな2: 連絡先2.住所ふりがな,
      住所2: 連絡先2.住所,
      郵便番号2: 連絡先2.郵便番号,
      電話番号2: 連絡先2.電話番号,
      Email2: 連絡先2.Email
    ),
    linebreak(),
    経歴(
      mode: "学歴・職歴",
      columns: 14,
      grid(
        gutter: 0.61cm,
        ..学歴データ.map(d => 学歴(年: d.年, 月: d.月, 学歴: d.内容)),
        linebreak(),
        ..職歴データ.map(d => 職歴(年: d.年, 月: d.月, 職歴: d.内容)),
      )
    ),
  ),
)
#pagebreak()

#stack(
  経歴(
    mode: "学歴・職歴",
    columns: 5,
    hegithLength: 5cm,
    grid(
      gutter: 0.61cm,
      ..学習歴データ.map(d => 学習歴(年: d.年, 月: d.月, 学習歴: d.内容)),
      以上()
    )
  ),
  linebreak(),
  経歴(
    mode: "資格",
    columns: 7,
    hegithLength: 6.6cm,
    grid(
      gutter: 0.61cm,
      ..資格データ.map(d => 資格(年: d.年, 月: d.月, 資格: d.内容))
    )
  ),
  linebreak(),
  扶養情報(
    扶養家族数: 扶養情報データ.扶養家族数,
    配偶者: 扶養情報データ.配偶者,
    配偶者の扶養義務: 扶養情報データ.配偶者の扶養義務
  ),
  linebreak(),
  本人希望(
    [貴社規定に従います。]
  ),
  place(
    bottom + right,
    dy: 10pt,
    [Made with Typst]
  )
)
