@Component
export struct PersonalInfoCard {
  // 个人信息属性定义
  @Prop name: string
  @Prop avatar: string
  // 可选属性，设置卡片宽度，默认300
  @Prop cardWidth?: number = 300
  // 可选属性，设置卡片背景色，默认白色
  @Prop cardBackgroundColor?: string = '#fffff0'

  build() {
    Column() {
      // 头像区域
      Image(this.avatar)
        .width(100)
        .height(100)
        .borderRadius(50)
        .objectFit(ImageFit.Cover)
        .margin({ top: 20 })

      // 姓名
      Text(this.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })
      .margin({ top: 15, bottom: 20 })
    }
    .width(this.cardWidth)
    .backgroundColor(this.cardBackgroundColor)
    .borderRadius(12)
    .shadow({ radius: 10, color: '#00001010' })
    .padding({ left: 10, right: 10 })
  }
}
