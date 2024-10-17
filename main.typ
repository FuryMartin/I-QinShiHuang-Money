#set text(font: "三极小篆简")

#import "lib.typ": invoice

#show: invoice(
  title: "始皇帝",
  vice-title: "六国统一经费收据",
  recipient: (
    name: "张三",
    street: "某某大学",
    city: "渔阳郡",
  ),
  items: (
    (
      description: "吮指原味鸡",
      price: "二十",
    ),
    (
      description: "热辣香骨鸡",
      price: "三十"
    )
  ),
  pay: (
    total: "五十",
    discount: "零",
    real: "五十",
  ),
  invoice-date: "始皇帝十七年",
  thanks: "寡人谢诸君助力\n扫六合而统华夏",
  signature: image("./assets/传国玉玺.png", width: 5em)
)