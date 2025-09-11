import { UserInfo } from "../model/UserInfo"
import { pasteboard } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';

@Component
export struct UserProfile {
  /* 示例数据，外部可传入 */
  @Prop userInfo: UserInfo = {
    id: 1,
    name: '张三',
    age: 18,
    avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300',
    active: true,
    email: 'verylongemail@example.comverylongemail@example.com'
  };

  /* 长按复制公共方法 */
  private copyText(value: string) {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, value);
    pasteboard.getSystemPasteboard().setData(data);
    promptAction.showToast({ message: '已复制', duration: 1500 });
  }

  build() {
    ListItem() {
      Column({ space: 12 }) {
        Image(this.userInfo.avatar)
          .border({ width: 2, color: this.userInfo.active ? '#16d719' : '#d7162d' })

        /* 姓名：单行省略 + 长按复制 */
        Text(`姓名：${this.userInfo.name}`)
          .fontColor('#333')
          .fontWeight(FontWeight.Medium)


        /* 年龄：一般不长，省略与否随意 */
        Text(`年龄：${this.userInfo.age}`)
          .fontSize(26)
        Text(`简介：${this.userInfo.brief}`)
          .fontSize(26)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
          .gesture(
            TapGesture()
              .onAction(() => {
                if (this.userInfo.brief) {
                  this.copyText(this.userInfo.brief);
                }
              })
          )
        /* 邮箱：超长时省略 + 长按复制完整地址 */
        if (this.userInfo.email) {
          Text(`邮箱：${this.userInfo.email}`)
            .fontSize(26)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')

        }

        /* 禁用/启用按钮 */
        Button(this.userInfo.active ? '禁用用户' : '启用用户')
          .width('60%')
          .height(40)
          .fontColor(Color.White)
          .onClick(() => {
            this.userInfo.active = !this.userInfo.active;
          })
      }
      .margin({ top: 8, bottom: 8 })
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({ radius: 8, color: '#20000000', offsetX: 2, offsetY: 2 })
    }
  }
}