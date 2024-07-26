import { router } from '@kit.ArkUI'

@Entry
@Component
struct SearchDetail {
  @State Add:boolean=false
  @State SearchText:string=''
  @State HotSearch:Array<string>=['520元礼包','母亲节','日式','新品上市','墨镜','夏凉被','单鞋']
  @State SearchHistory:Array<string>=[]
  build() {
    Column() {
      Column({ space: 10 }) {
        Row({ space: 10 }) {
          Search({ value: this.SearchText, placeholder: this.HotSearch[0] }).width('80%').onSubmit((content: string) => {
            this.SearchHistory.forEach((element,index:number)=>{
              if(element==content){
                  this.Add=true
                this.SearchHistory.splice(index,1)
                this.SearchHistory.unshift(content)
              }
            })
            this.Add?this.Add=false:this.SearchHistory.unshift(content)
          })
          Text('取消').width('15%').backgroundColor('#fff').onClick(() => {
            router.back()
          })
        }.width('100%')
        Row(){
          Text('搜索历史').fontSize(28).margin({ left: 10 })
           Text('删除').fontSize(16).margin({ right:30 }).onClick(()=>{
             this.SearchHistory.length=0
           })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.SearchHistory, (item: string) => {
            Column() {
              Text(item).fontSize(18)
            }
            .height(30)
            .constraintSize({ minWidth: 30, maxWidth: 100 })
            .border({ width: 1, radius: 4 })
            .borderColor('#999')
            .margin(10)
            .justifyContent(FlexAlign.Center)
          })
        }

        Divider().width('96%').height(6)
        Text('热门搜索').fontSize(28).margin({ left: 10 })
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.HotSearch, (item: string) => {
            Column() {
              Text(item).fontSize(18)
            }
            .height(30)
            .constraintSize({ minWidth: 30, maxWidth: 100 })
            .onClick(() => {
              this.SearchText = item
            })
            .border({ width: 1, radius: 4 })
            .borderColor('#999')
            .margin(10)
            .justifyContent(FlexAlign.Center)
          })
        }
      }.alignItems(HorizontalAlign.Start).margin({ left: 10, right: 10 })
      .constraintSize({minHeight:'0%',maxHeight:'100%'})
      .width('100%')
      Column(){

      }.backgroundColor("#eee").width('100%').layoutWeight(1)
    }

  }
}