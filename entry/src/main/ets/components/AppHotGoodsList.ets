import { hotGoodsList } from '../utils/ResponseData'
import { router } from '@kit.ArkUI'

@Component
export struct AppHotGoodsList {
  @Prop hotGoodsList:Array<hotGoodsList>
  build() {
    Column() {
      Row() {
        Text("人气推荐").fontSize(22)
      }.height(40)
        ForEach(this.hotGoodsList, (item: hotGoodsList) => {
          Row() {
            Image(item.list_pic_url).width(120).height(120)
            Column() {
              Text(item.name).fontSize(18).fontColor('#333')
              Text(item.goods_brief).fontSize(15).fontColor('#999')
              Text(`￥${item.retail_price.toFixed()}元`).fontColor('#8b0000')
            }.alignItems(HorizontalAlign.Start)
          }.justifyContent(FlexAlign.Start).width('100%').backgroundColor('#fafafa').margin(5)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Details',
              params:{
                id:item.id
              }
            },router.RouterMode.Standard)
          })
        })
    }.borderWidth({
      bottom: 12,
    }).borderColor("#ebedf0")
.width('100%')
  }
}