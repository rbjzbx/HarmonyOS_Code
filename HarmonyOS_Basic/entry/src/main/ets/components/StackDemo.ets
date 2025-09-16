@Component
@Preview
export struct StackDemo{
  @Prop avatarUrl:string='https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300'
  @Prop username:string='张三'

  @State hasNewMsg:boolean=true

  build() {
    Stack(){
      Stack({alignContent:Alignment.TopEnd}){
        Image('https://public-cdn-oss.mosoteach.cn/avatar/2023/43/05ced60b69da837686d71f6a365a35f0.jpg?v=1724931071&x-oss-process=style/s300x300')
          .width(60)
          .height(60)
          .borderRadius(30)
          .border({
            width:2,
            color:Color.Red
          })
        if(this.hasNewMsg){
          Circle({width:18,height:18}).position({x:44,y:0}).fill(Color.Red)
          Text('8').fontSize(10).fontColor(Color.White).position({x:50,y:4})
        }
        Text(this.username).fontSize(14).fontColor(Color.Red).position({x:2,y:65}).width(60).textAlign(TextAlign.Center)
      }
    }.width(80).height(120)
    }


}