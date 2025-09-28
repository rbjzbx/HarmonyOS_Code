@Entry
@Component
struct ExplictAnimationPage {
  @State isMoved: boolean = false;
  @State rectIsMoved: boolean = false;
@State btnWidth:number=120;
@State color:string='#2196F3'
  @State rotateAngle:number=0
  @State _scale:number=1
  build() {
    Navigation(){
      Column({space:16}){
        Text('显示动画演示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)

        Button('改变位置').onClick(()=>{
          this.isMoved=!this.isMoved
        })
        Circle({width:60,height:60})
          .fill("#ff4fa9e3")
          .translate({x:this.isMoved?100:0,y:0})
          .animation({
            duration:1000,
            curve:Curve.Smooth
          })
        Button('改变位置和颜色').onClick(()=>{
          this.rectIsMoved=!this.rectIsMoved
        })
        Rect({width:80,height:60})
          .fill(this.rectIsMoved?"#f0f":"#ff4fa9e3")
          .translate({x:this.rectIsMoved?100:0,y:0})
          .animation({
            duration:1000,
            curve:Curve.Smooth
          })
        Button('点击改变文字大小和背景颜色')
          .width(this.btnWidth)
          .height(50)
          .backgroundColor(this.color)
          .onClick(()=>{
            this.btnWidth=this.btnWidth===120?200:120
            this.color=this.color==='#2196F3'?'FF5722':'#2196F3'
          })
          .animation({
            duration:600,
            curve:Curve.EaseInOut,
            iterations:3,
            playMode:PlayMode.Normal
          })
        Button('角度变化')
          .onClick(()=>{
            this.rotateAngle=90
          })
          .margin(50)
          .rotate({angle:this.rotateAngle})
          .animation({
            duration:1200,
            curve:Curve.Friction,
            delay:500,
            iterations:-1,
            playMode:PlayMode.Alternate,
            expectedFrameRateRange:{
              min:20,
              max:120,
              expected:90,
            }
          })
        Image($r('app.media.heart'))
          .width(100)
          .height(100)
          .fillColor('#f00')
          .scale({x:this._scale,y:this._scale})
          .animation({
            duration:500,
            curve:Curve.Friction,
            iterations:-1,
            playMode:PlayMode.Alternate
          })
          .onAppear(()=>{
            this._scale=1.3
          })
      }
      .padding(16)
    }
    .title('显示动画')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .navBarWidth('100%')
    .navBarPosition(NavBarPosition.Start)
  }
}