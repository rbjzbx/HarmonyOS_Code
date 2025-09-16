@Component
@Preview
export struct FlexDemo{
  @State skills:string[]=['项目管理','vue','Java','Python','鸿蒙开发']

  build() {
    Flex({
      direction: FlexDirection.Row,
      wrap: FlexWrap.Wrap,
      justifyContent: FlexAlign.Start
    }){
      ForEach(this.skills,(skill:string)=>{
        Text(skill)
          .fontSize($r('app.string.font_size_medium'))
          .fontColor($r('app.color.tag_text_color'))
          .backgroundColor($r('app.color.tag_background_color'))
          .padding({
            left: $r('app.string.tag_padding_left_right'),
            right: $r('app.string.tag_padding_left_right'),
            top: $r('app.string.tag_padding_top_bottom'),
            bottom: $r('app.string.tag_padding_top_bottom')
          })
          .borderRadius($r('app.string.border_radius'))
          .margin({
            right: $r('app.string.tag_margin_right_bottom'),
            bottom: $r('app.string.tag_margin_right_bottom')
          })
      })
    }
    .backgroundColor($r('app.color.flex_demo_background'))
  }
}
