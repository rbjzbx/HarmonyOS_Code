import { ColumnDemo } from '../components/ColumnDemo';
import { FlexDemo } from '../components/FlexDemo';
import { GridDemo } from '../components/GridDemo';
import { RowDemo } from '../components/RowDemo';
import { StackDemo } from '../components/StackDemo';

@Entry
@Component
struct UiPage {
  build() {
    Column() {
      // 顶部导航区域
      List() {
        RowDemo()
          .margin({ bottom: $r('app.string.spacing_large') })

        // 主内容区域

          ColumnDemo()
            .margin({ bottom: $r('app.string.spacing_medium') })

          FlexDemo()
            .width('100%')
          GridDemo()
          StackDemo()

      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_color'))
  }
}
