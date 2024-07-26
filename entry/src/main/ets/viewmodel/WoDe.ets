interface MyData{
  id:number
  icon:Resource
  Text:string
}
@Entry
@Component
export struct WoDe {
  @State Data:Array<MyData>=[
    {id:0,icon:$r('app.media.app_icon'),Text:'我的订单'},
  {id:1,icon:$r('app.media.app_icon'),Text:'优惠卷'},
    {id:2,icon:$r('app.media.app_icon'),Text:'礼品卡'},
    {id:3,icon:$r('app.media.app_icon'),Text:'我的收藏'},
    {id:4,icon:$r('app.media.app_icon'),Text:'我的足迹'},
    {id:5,icon:$r('app.media.app_icon'),Text:'会员福利'},
    {id:6,icon:$r('app.media.app_icon'),Text:'地址管理'},
    {id:7,icon:$r('app.media.app_icon'),Text:'账号安全'},
    {id:8,icon:$r('app.media.app_icon'),Text:'联系客服'},
    {id:9,icon:$r('app.media.app_icon'),Text:'帮助中心'},
    {id:10,icon:$r('app.media.app_icon'),Text:'意见反馈'},
  ]
  build() {
      Scroll(){
        Column(){
            Row(){
                Image($r('app.media.app_icon')).height(50).width(50)
                Text('youker')
                Text('>')
            }.backgroundColor(Color.Pink).width('100%').height('18%')
          .justifyContent(FlexAlign.SpaceBetween)
          Flex({wrap:FlexWrap.Wrap}){
              ForEach(this.Data,(item:MyData)=>{
                Column({space:10}){
                  Image(item.icon).width(25.6).height(25.6)
                  Text(item.Text)
                }.width('33%').height('15%').justifyContent(FlexAlign.Center)
                .border({
                  width:1
                })
                .borderColor('#ebedf0')
              })

          }.backgroundColor('#ffffff')
        }.width('100%').height('100%')
      }.width('100%').height('100%')
  }
}