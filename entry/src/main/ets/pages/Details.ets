import { attribute, DetailsData, gallery, goodsList, info, issue, RelatedData } from '../utils/DetailsData'
import { GetDetailsData, GetRelatedData } from '../utils/GetHome'
import { ResData } from '../utils/ResponseData'
import { router } from '@kit.ArkUI'
import { GouWuCheData, GouWuCheDialog } from '../components/GouWuCheDialog'
let storage = LocalStorage.getShared()
export interface RouterData{
  id:number
}
@Entry(storage)
@Component
struct Details {
  @LocalStorageLink('Total') Total: number = 2;
  @State number:number=1
  @State GouWu:boolean=false
  @State info:info=new Object as info
  @State gallery:Array<gallery>=[]
  @State attribute:Array<attribute>=[]
  @State goodsList:Array<goodsList>=[]
  @State issue:Array<issue>=[]
  @State DetailId:number=1006013
  private GouWuCheDialog:CustomDialogController=new CustomDialogController({
    builder:GouWuCheDialog({number:this.number,info:this.info}),
    width:"100%",
    height:'50%',
    offset: { dx: 0, dy: 200 },
    cornerRadius:{bottomLeft:0,bottomRight:0}
  })

  async aboutToAppear() {

    let a=router.getParams() as RouterData
    this.DetailId=a.id
    console.log('id是'+this.DetailId.toString())
    let res:ResData<DetailsData>=await GetDetailsData(this.DetailId);
    let res1:ResData<RelatedData>=await GetRelatedData(this.DetailId);
    this.issue=res.data.issue
    this.info=res.data.info;
    this.gallery=res.data.gallery;
    this.attribute=res.data.attribute;
    this.goodsList=res1.data.goodsList;
    // console.log(this.goodsList.toString())
  }
  build() {
    Column() {
      List(){
        ListItem() {
          Swiper() {
            ForEach(this.gallery, (item: gallery) => {
              Image(item.img_url)
            })
          }.indicator(Indicator.digit().right('5%')).autoPlay(true).interval(3000)
        }
        ListItem(){
          Row(){
            Row({space:2}){
              Image($r('app.media.app_icon')).width(20).height(20)
              Text('30天无忧退货').fontSize(14).fontColor('#333')
            }
            Row({space:2}){
              Image($r('app.media.app_icon')).width(20).height(20)
              Text('48小时快速退费').fontSize(14).fontColor('#333')
            }
            Row({space:2}){
              Image($r('app.media.app_icon')).width(20).height(20)
              Text('满88元免邮费').fontSize(14).fontColor('#333')
            }
          }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
        }.width('100%').height(50).backgroundColor("#f1f1f1")
        ListItem(){
          Column({space:8}){
              Text(this.info.name).fontColor('#333').font({size:24,weight:FontWeight.Bold})
              Text(this.info.goods_brief).fontColor('#666').fontSize(17)
              Row(){
                Text(`￥${this.info.retail_price}.00元`).fontColor('#ff0000').fontSize(24)
                Text(`库存:${this.info.goods_number}`).fontColor('#999').fontSize(15)
              }.justifyContent(FlexAlign.SpaceBetween).width('100%')
          }.width('100%').alignItems(HorizontalAlign.Start)
        }.width('100%').padding({top:15,bottom:15,left:10,right:10}).borderStyles()
        ListItem(){
            Row(){
              Text('售后保障').fontSize(17).fontColor('#333')
              Image($r('app.media.app_icon')).width(20).height(20)
            }.width('100%').justifyContent(FlexAlign.SpaceBetween).height(50).padding(10)
        .borderStyles()
    }
        ListItem(){
            Column(){
              Text('产品规格').width('100%').borderWidth({
                bottom: 2,
              }).borderColor("#ebedf0").padding(10).height(50).fontSize(22)
              ForEach(this.attribute,(item:attribute,index:number)=>{
                Row({space:2}){
                  Text(item.name).maxLines(10).width('20%').fontColor('#333').fontSize(17)
                  Text(item.value).maxLines(20).width('80%').fontColor('#333').fontSize(17)
                }.width('100%').backgroundColor(index%2==0?Color.White:"#ebedf0").constraintSize({minHeight:40}).padding(10)
              })
              Column() {
                Text('产品详情').fontSize(22)
                RichText(`<div style="font-size:0;text-align:center;">${this.info.goods_desc}</div> `)
              }.padding(10)
            }.borderStyles()
        }
        ListItem(){
              Column(){
                Text('一 常见问题 一').fontSize(22)
                ForEach(this.issue,(item:issue)=>{
                  Column({space:4}){
                    Text(item.question).fontSize(19).fontSize('#333')
                    Text(item.answer).fontSize(17).fontColor('#666')
                  }.width('100%').margin({top:10}).alignItems(HorizontalAlign.Start)
                })
              }.width('100%').padding(10).borderStyles()
        }
        ListItem(){
            Column(){
              Text('一 猜你喜欢 一').fontSize(22)
                Flex({ wrap: FlexWrap.Wrap ,justifyContent:FlexAlign.SpaceAround}) {
                  ForEach(this.goodsList, (item: goodsList) => {
                    Column() {
                      Image(item.list_pic_url).width('100%')
                      Text(item.name).maxLines(1).fontSize(18)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                      Text(`￥${item.retail_price.toFixed()}元`).fontColor('#ff0000')
                    }.width('45%').onClick(()=>{
                      router.pushUrl({
                        url:'pages/Details',
                        params:{
                          id:item.id
                        }
                      },router.RouterMode.Standard)
                    })
                  })
                }
            }.margin({top:20})
        }
      }.width('100%').layoutWeight(1)
      Row(){
        Column(){
            Image($r('app.media.app_icon')).width(25).height(25)
            Text('未收藏').fontColor('#646566').fontSize(15)
          }
        Column(){
          Badge({
            count:this.Total,
            style:{fontSize:14},
            position: BadgePosition.RightTop,
          }){
          Image($r('app.media.app_icon')).width(25).height(25)
          }
          Text('购物车').fontColor('#646566').fontSize(15)
        }
        Row(){
          Button('加入购物车').type(ButtonType.Normal).onClick(()=>{this.GouWuCheDialog.open()})
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
      .alignItems(VerticalAlign.Bottom).padding(10)
    }.height('100%')
    .width('100%')
  }
  @Styles borderStyles(){
    .borderWidth({
      bottom: 12,
    }).borderColor("#ebedf0")
  }
}