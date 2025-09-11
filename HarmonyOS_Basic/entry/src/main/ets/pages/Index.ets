import { MyButton } from '../components/MyButton'
import { PersonalInfoCard } from '../components/PersonalInfoCard'
import { UserProfile } from '../components/UserProfile'

@Entry
@Component
struct Index {
  @Prop isOnline: boolean=true
  build() {
    Column({space:20}){
      Text(this.isOnline?"在线":"离线")
      // 使用示例
      MyButton({
        buttonName: '主要按钮',
        buttonBackColor: '#3698a0'
      })

      MyButton({
        buttonName: '次要按钮',
        buttonBackColor: '#82d4db'
      })
      PersonalInfoCard({
        name:'张三',
        avatar:'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300'
      })
      UserProfile()
    }
  }
}