@Component
@Preview
export struct ColumnDemo{
  build() {
    Column({space: $r('app.string.spacing_small')}){
      Text('签到提醒')
        .fontSize($r('app.string.font_size_large'))
        .fontWeight(FontWeight.Bold)
      Text('上课5分钟签到')
        .fontSize($r('app.string.font_size_medium'))
        .fontColor($r('app.color.text_secondary_color'))
        .maxLines(2)
        .layoutWeight(1)
      Button('提醒')
        .margin({top: $r('app.string.spacing_medium')})
        .onClick(()=>{
          console.log('签到')
        })
    }
    .backgroundColor($r('app.color.primary_color'))
    .width('100%')
    .borderRadius($r('app.string.border_radius'))
    .shadow({
      radius: $r('app.string.shadow_radius'),
      color: $r('app.color.shadow_color')
    })
  }
}
