#import "@preview/tablex:0.0.8": gridx, hlinex

#let invoice(
  title: none,
  vice-title: none,
  invoice-date: "始皇帝十七年",
  items: none,
  pay: none,
  recipient: none,
  signature: none,
  thanks: none,
) = {
  set text(lang: "zh", region: "cn")

  set page(paper: "a4", margin: (x: 20%, y: 20%, top: 10%, bottom: 10%))

  show heading.where(
    level: 1
  ): it => block(width: 100%)[
    #set text(20pt, weight: "regular")
    #smallcaps(it.body)
  ]

  let format_currency(number, locale: "zh") = {
    number
  }

  set text(1.6em)

  align(center, smallcaps[
    #set text(size: 2.5em)
    #set par()
    *#title*
  ])

  align(center,[
    #set par(leading: 0.40em)
    #set text(size: 2em)
    #vice-title \
  ])

  align(left,[
    #set par(leading: 0.40em)
    #set text(size: 1em)
    #recipient.name \ 
    #recipient.street \
    #recipient.city
  ])

  v(0.5em)

  let num_to_chinese(id) = {
    if id == 1 { "壹" }
    else if id == 2 { "贰" }
    else if id == 3 { "叁" }
    else if id == 4 { "肆" }
    else if id == 5 { "伍" }
    else if id == 6 { "陆" }
    else if id == 7 { "柒" }
    else if id == 8 { "捌" }
    else if id == 9 { "玖" }
    else if id == 10 { "拾" }
    else { "" };
  }
  
  // 返回空字符串以防止索引超出范围
  let items = items.enumerate().map(
    ((id, item)) => ([#str(num_to_chinese(id + 1))], [#item.description], [#format_currency(item.price)钱],),
  ).flatten()

  [
    #set text(number-type: "lining", 1em)
    #gridx(
      columns: (auto, 10fr, auto), 
      align: (
        (column, row) => 
          if column == 0 { center } 
          else if column == 1 { center } 
          else { right }
      ),
      hlinex(), 
      [*编号*], 
      [*条目*], 
      [*计*], 
      hlinex(), 
      ..items, 
      hlinex(), 
      [], 
      align(right,[总计]),
      [#format_currency(pay.total)钱],
      hlinex(start: 3),  
      [],
      align(right,[优惠]),
      [#format_currency(pay.discount)钱],
      hlinex(start: 3), 
      [],
      align(right,[实付]),
      [#format_currency(pay.real)钱],
      hlinex(start: 3),        
    )
  ]
  align(center, [
    #set text(size: 1.2em)
     *#invoice-date*
  ])

  align(center,[
    #set text(size: 1.2em)
    #thanks \
    #signature
  ])
}
