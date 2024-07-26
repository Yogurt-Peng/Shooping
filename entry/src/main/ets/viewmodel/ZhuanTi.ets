import { postZhuanTi } from '../utils/GetHome';
import { ResData } from '../utils/ResponseData';
import { Data, data } from '../utils/ZhuanTiData'

@Entry
@Component
export struct ZhuanTi {
  @State once:boolean=false
  @State data:Array<data>=[]
  @State isRefreshing:boolean=false
  @State i:number=1
  async aboutToAppear()  {
    let res :ResData<Data> = await postZhuanTi(this.i);
    console.log(JSON.stringify(res.data))
    this.data=this.data.concat(res.data.data)
  }
  build() {
Column() {
    List() {
      ForEach(this.data, (item: data) => {
        ListItem() {
          Column({space:10}) {
            Image(item.scene_pic_url).height(180).width('100%')
            Text(item.title).fontSize(18).fontColor('#333')
            Text(item.subtitle).fontSize(15).fontColor('#999')
            Text(`￥${item.price_info.toFixed(2)}元`).fontColor('#8b0000')
          }.alignItems(HorizontalAlign.Start)
        }.borderWidth({
          bottom: 12,
        }).borderColor("#ebedf0")
      })
      ListItem(){
        this.customRefreshComponent()
      }
    }.onReachEnd(()=>{
      if (this.once&&this.i==1) {
       setTimeout( async ()=>{
         this.i++
          let res :ResData<Data> = await postZhuanTi(this.i);
          this.data=this.data.concat(res.data.data)
         console.log(this.i.toString());
        },1000)
      }
       this.once=true
    })

}
  }
  @Builder
  customRefreshComponent()
  {
    Stack()
    {
      Row()
      {
        if (this.i==1) {
          LoadingProgress().width(30)
          Text("正在刷新...").fontSize(16)
        }else {
          Text("没有更多了...").fontSize(16).margin({ left: 20 })
        }
      }.margin({top:10,bottom:20})
      .alignItems(VerticalAlign.Center)
    }.width("100%").align(Alignment.Center)
  }
}