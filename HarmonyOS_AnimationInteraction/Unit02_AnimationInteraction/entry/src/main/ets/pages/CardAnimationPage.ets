@Entry
@Component
struct SlidingCardPage {
  @State isExpanded: boolean = false;
  @State showTask1: boolean = false;
  @State showTask2: boolean = false;
  @State showTask3: boolean = false;
  build() {
    Navigation() {
      Column() {
        Text('滑动卡片演示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        Column() {
          Text('今日待办')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: this.isExpanded ? 10 : 0 })

          if (this.isExpanded) {
            Column() {
              if (this.showTask1) {
                Text('1. Task1')
                  .fontSize(16)
                  .margin({ bottom: 8 })
                  .opacity(this.showTask1 ? 1 : 0)
                  .scale({ x: this.showTask1 ? 1 : 0.8, y: this.showTask1 ? 1 : 0.8 })
                  .animation({
                    duration: 300,
                    curve: Curve.EaseOut
                  })
              }

              if (this.showTask2) {
                Text('2. Task2')
                  .fontSize(16)
                  .margin({ bottom: 8 })
                  .opacity(this.showTask2 ? 1 : 0)
                  .scale({ x: this.showTask2 ? 1 : 0.8, y: this.showTask2 ? 1 : 0.8 })
                  .animation({
                    duration: 300,
                    curve: Curve.EaseOut,
                    delay: 150
                  })
              }

              if (this.showTask3) {
                Text('3. Task3')
                  .fontSize(16)
                  .opacity(this.showTask3 ? 1 : 0)
                  .scale({ x: this.showTask3 ? 1 : 0.8, y: this.showTask3 ? 1 : 0.8 })
                  .animation({
                    duration: 300,
                    curve: Curve.EaseOut,
                    delay: 300
                  })
              }
            }
            .margin({ top: 10 })
            .width('100%')
          }
        }
        .width('90%')
        .height(this.isExpanded ? 180 : 60)
        .padding(16)
        .backgroundColor(this.isExpanded?'#ff0':'#f0f0f0')
        .borderRadius(12)
        .position({
          x: '5%',
          y: this.isExpanded ? '40%' : '85%'
        })
        .onClick(() => {
          if (this.isExpanded) {
            this.showTask3 = false;
            setTimeout(() => { this.showTask2 = false; }, 100);
            setTimeout(() => { this.showTask1 = false; }, 200);
            setTimeout(() => { this.isExpanded = false; }, 300);
          } else {
            this.isExpanded = true;
            setTimeout(() => { this.showTask1 = true; }, 300);
            setTimeout(() => { this.showTask2 = true; }, 450);
            setTimeout(() => { this.showTask3 = true; }, 600);
          }
        })
        .animation({
          duration: 800,
          curve: Curve.EaseInOut
        })
      }
      .width('100%')
      .height('100%')
    }
    .title('滑动卡片')
    .titleMode(NavigationTitleMode.Mini)
  }
}