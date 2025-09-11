@Component
  // @Preview
export struct MyButton {
  // 定义按钮文本属性，指定类型为string
  @Prop buttonName: string

  // 定义按钮背景色属性，指定类型为string
  @Prop buttonBackColor: string

  build() {
    Row({ space: 10 }) {
      // 使用传递过来的属性值，而不是硬编码的值
      Button(this.buttonName)
        .type(ButtonType.Normal)
        .backgroundColor(this.buttonBackColor)
    }
  }
}