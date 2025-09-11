import { UserInfo } from '../model/UserInfo'

@Component
export struct UserProfile {
  // 使用@State装饰器确保状态可观察
  @State userinfo: UserInfo[] = [
    { id: 1, name: '张三', age: 18, active: true, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300' },
    { id: 2, name: '李四', age: 22, active: false, email: 'lisi@example.com', avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300' },
    { id: 3, name: '王五', age: 25, active: true, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300' },
    { id: 4, name: '赵六', age: 30, active: true, email: 'zhaoliu@example.com', avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300' }
  ]

  // 分离状态更新逻辑，确保纯净性
  private updateUserStatus(userId: number): UserInfo[] {
    // 创建新数组，确保引用变化
    const updatedUsers: UserInfo[] = [];
    for (const user of this.userinfo) {
      if (user.id === userId) {
        // 完全复制对象，不使用任何展开操作
        const updatedUser: UserInfo = {
          id: user.id,
          name: user.name,
          age: user.age,
          avatar: user.avatar,
          active: !user.active
        };
        // 处理可选属性
        if (user.email) {
          updatedUser.email = user.email;
        }
        updatedUsers.push(updatedUser);
      } else {
        updatedUsers.push(user);
      }
    }
    return updatedUsers;
  }

  build() {
    Column() {
      Text('用户列表')
        .fontSize(24)
        .margin({ bottom: 10 })

      List({ space: 8 }) {
        // 确保ForEach的数据源和键生成器正确
        ForEach(this.userinfo, (item: UserInfo) => {
          ListItem() {
            // 使用Stack确保按钮可点击区域不受限
            Stack() {
              Row({ space: 10 }) {
                Image(item.avatar)
                  .width(80)
                  .height(80)
                  .borderRadius(40)
                  .objectFit(ImageFit.Cover)

                Column({ space: 5 }) {
                  Text(`姓名: ${item.name}`)
                    .fontSize(20)
                  Text(`年龄: ${item.age}`)
                    .fontSize(16)
                  if (item.email) {
                    Text(`邮箱: ${item.email}`)
                      .fontSize(16)
                  }
                  Text(`状态: ${item.active ? '已启用' : '已禁用'}`)
                    .fontSize(16)
                    .fontColor(item.active ? '#008000' : '#ff0000')
                }
                .alignItems(HorizontalAlign.Start)
                .flexGrow(1) // 让信息区域占据剩余空间

                // 确保按钮有足够的尺寸和交互反馈
                Button(item.active ? '禁用用户' : '启用用户')
                  .backgroundColor(item.active ? '#ff4d4f' : '#52c41a')
                  .fontColor('#ffffff')
                  .padding({ left: 20, right: 20, top: 8, bottom: 8 })
                  .borderRadius(8)
                  .onClick(() => {
                    // 显式更新状态，确保触发重渲染
                    this.userinfo = this.updateUserStatus(item.id);
                  })
                  .gesture(
                    TapGesture()
                      .onAction(() => {
                        console.log(`点击了${item.name}的状态按钮`);
                      })
                  )
              }
              .padding(10)
            }
          }
        }, (item: UserInfo) => `user-${item.id}`) // 键生成器更明确
      }
      .width('100%')
      .divider({ strokeWidth: 1, color: '#eeeeee' })
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#f5f5f5')
  }
}
