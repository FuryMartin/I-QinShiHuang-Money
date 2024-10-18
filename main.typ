#set text(font: "三极小篆简")

#import "src/lib.typ": invoice

#let data = json("data.json")

#show: invoice(
  title: "始皇帝",
  vice-title: "六国统一经费收据",
  recipient: data.recipient,
  items: data.items,
  pay: data.pay,
  invoice-date: "始皇帝十七年",
  thanks: "寡人谢诸君助力\n扫六合而统华夏",
  signature: image("./assets/传国玉玺.png", width: 5em)
)