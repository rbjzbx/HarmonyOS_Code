@Component
@Preview
export struct RowDemo{
  build() {
    Row({space: $r('app.string.spacing_small')}){
      Image('https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300')
        .width($r('app.string.avatar_size'))
        .height($r('app.string.avatar_size'))
      Text('鸿蒙·开发')
        .fontSize($r('app.string.font_size_small'))
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)
      Button('详情')
        .type(ButtonType.Capsule)
        .width($r('app.string.button_small_width'))
        .height($r('app.string.button_small_height'))
    }
    .padding({
      left: $r('app.string.padding_large_left_right'),
      right: $r('app.string.padding_large_left_right')
    })
    .backgroundColor($r('app.color.primary_color'))
    .width($r('app.string.row_demo_width'))
    .height($r('app.string.row_demo_height'))
  }
}
