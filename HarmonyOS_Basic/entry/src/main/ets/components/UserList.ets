import { UserInfo } from '../model/UserInfo';
import { UserProfile } from './UserProfile';


@Component
export struct UserList{
  @State isOnline:boolean =true;
  @State color:string='#fffaf5f5'
  @State image:string='https://ts1.tc.mm.bing.net/th/id/OIP-C.mH9YLFEL5YdVxJM82mjVJQHaEo?w=267&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2&ucfimg=1'
  @State title:string='sxw'
  @State userList: UserInfo[] = [
    { id: 1, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300', name: 'Yang',age:16,email:"",active:true,    brief: '资深全栈工程师，拥有10年以上开发经验，精通HarmonyOS应用开发', },
    { id: 2, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300', name: 'Alice',age: 15,email:"12314",active:false,    brief: '资深全栈工程师，拥有10年以上开发经验，精通HarmonyOS应用开发',},
    { id: 3, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300', name: 'Bob' ,email:"2222",active:true,age:15,    brief: '资深全栈工程师，拥有10年以上开发经验，精通HarmonyOS应用开发',},
    { id: 4, avatar: 'https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300', name: 'Cathy',email:'',active:true,age:20,    brief: '资深全栈工程师，拥有10年以上开发经验，精通HarmonyOS应用开发',}
  ]
  build() {
    Column(){
      // Text(this.isOnline?"在线":"离线")
      // MyButton({isOnline: this.isOnline,color: this.color})
      // UserProfile()
      List() {
        ForEach(this.userList, (user: UserInfo) => {
          UserProfile({ userInfo: user })   // 把单条数据传进子组件
        }, (user: UserInfo) => user.id.toString())
      }
      .width('100%')
      .divider({ strokeWidth: 1, color: '#eee' })
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#f5f5f5')
    }
  }
