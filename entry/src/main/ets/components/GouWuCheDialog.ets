import { info } from '../utils/DetailsData';
import { promptAction, router } from '@kit.ArkUI';
export interface GouWuCheData{
  id:number
  number:number
  retail_price:number
  list_pic_url:string
  goods_name:string
}
@CustomDialog
@Component
export struct GouWuCheDialog{
  @Link number:number
  @Prop info:info=new Object as info
  controller:CustomDialogController;
  build() {
    Column(){
      Column() {
        Row() {
          Image($r('app.media.app_icon')).width(20).height(20).onClick(() => {
            this.controller.close()
          })
        }.width('100%').justifyContent(FlexAlign.End)

        Row({ space: 10 }) {
          Image(this.info.list_pic_url).width(100).height(100).margin({ left: -18 })
          Column({ space: 6 }) {
            Text(`￥${this.info.retail_price}`).fontSize(22).fontColor('#ff0000')
            Text(`剩余${this.info.goods_number}件`).fontSize(17).fontColor('#666')
            Text('请选择').fontSize(17).fontColor('#666')
          }
        }.width('100%')

        Row() {
          Text('购买数量').fontSize(20)
          Row({ space: 4 }) {
            Text('-')
              .fontSize(30)
              .backgroundColor("#ebedf0")
              .width(30)
              .height(30)
              .textAlign(TextAlign.Center)
              .lineHeight(30)
              .onClick(() => {
                if (this.number > 1) {
                  this.number--
                }
                if (this.number == 1) {
                  promptAction.showToast({ message: '至少购买一件商品' })
                }
              })
            Text(this.number.toString())
              .fontSize(20)
              .backgroundColor("#ebedf0")
              .width(30)
              .height(30)
              .textAlign(TextAlign.Center)
              .lineHeight(30)
            Text('+')
              .fontSize(30)
              .backgroundColor("#ebedf0")
              .width(30)
              .height(30)
              .textAlign(TextAlign.Center)
              .lineHeight(30)
              .onClick(() => {
                this.number++
              })
          }
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
      }.layoutWeight(1)
        Row(){
        Column(){
          Image($r('app.media.app_icon')).width(25).height(25)
          Text('未收藏').fontColor('#646566').fontSize(15)
        }
        Column(){
          Badge({
            count:15,
            style:{fontSize:14},
            position: BadgePosition.RightTop,
          }){
            Image($r('app.media.app_icon')).width(25).height(25)
          }
          Text('购物车').fontColor('#646566').fontSize(15)
        }
        Row(){
          Button('加入购物车')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/Index',
                params:{
                  id:this.info.id,
                  number:this.number,
                  retail_price:this.info.retail_price,
                  list_pic_url:this.info.list_pic_url,
                  goods_name:this.info.name
                }
              },router.RouterMode.Single)
              this.controller.close()
            })
            .type(ButtonType.Normal)
            .width(100)
            .height(50)
            .borderRadius({
              topLeft:'50%',
              bottomLeft:'50%'
            })
            .linearGradient({
              direction:GradientDirection.Right,
              colors:[['#ffd01e',0],['#ff8917',1]]
            })
          Button('立即购买').type(ButtonType.Normal)
            .width(100)
            .height(50)
            .borderRadius({
              topRight:'50%',
              bottomRight:'50%'
            })
            .linearGradient({
              direction:GradientDirection.Right,
              colors:[['#ff6034',0],['#ee0a24',1]]
            })
        }
      }.width('100%').height('8%').justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Bottom)
    }.margin(20)
  }
}