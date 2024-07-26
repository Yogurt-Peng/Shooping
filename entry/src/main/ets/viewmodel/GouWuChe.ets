import { GouWuCheData } from '../components/GouWuCheDialog'

@Component
export struct GouWuChe {
  // @State checkSelect:boolean=false
  // @State updataTotal:number=0
  // @State updataTotalAmount:number=0
  @Prop  GouWuChe:GouWuCheData
  @Link GouWuCheData:Array<GouWuCheData>
  // @State GouWuCheData:Array<GouWuCheData>=[{id:1,number:2,retail_price:300,list_pic_url:'faf',goods_name:'nih'}
  // ,{id:1,number:2,retail_price:300,list_pic_url:'faf',goods_name:'nih'}
  //   ,{id:1,number:2,retail_price:300,list_pic_url:'faf',goods_name:'nih'}
  //   ,{id:1,number:2,retail_price:300,list_pic_url:'faf',goods_name:'nih'}
  // ]
  @State ButtonText:string='编辑'
  @State ButtonState:boolean=false
  @State SelectTotal:number=0
  // @LocalStorageLink('Total') Total: number = 1;
  @Link TotalB:number
  @State TotalAmount:number=0

  // @State Total
  @Builder DeleteItem(index:number){
    Button('删除').type(ButtonType.Normal).backgroundColor(Color.Red).onClick(()=>{
      this.GouWuCheData.splice(index,1)
    })
  }
  build() {
    Column() {
      Text('购物车').fontSize(30).height('10%')
      List() {
        ForEach(this.GouWuCheData,(item:GouWuCheData,index:number)=>{
          ListItem() {
            Column(){
            Row() {
              Checkbox({ group: 'GouWuChe' }).onChange((vule: boolean) => {
                if (vule) {
                  // this.checkSelect=true
                  this.SelectTotal += item.number
                  this.TotalAmount += item.number * item.retail_price
                } else {
                  // this.checkSelect=false
                  this.SelectTotal-= item.number
                  this.TotalAmount -= item.number * item.retail_price
                }

              })
              Image(item.list_pic_url).width(100).height(100)
              Column() {
                Text(item.goods_name)
                Row() {
                  Text(item.retail_price.toString())
                  Text(item.number.toString())
                }.justifyContent(FlexAlign.SpaceBetween).width('50%')

              }.height('100%').justifyContent(FlexAlign.SpaceAround).alignItems(HorizontalAlign.Start)
            }.width('100%').height('80%')

              if (this.ButtonState) {
                Row({ space: 4 }) {
                  Text('-')
                    .fontSize(30)
                    .backgroundColor("#ebedf0")
                    .width(30)
                    .height(30)
                    .textAlign(TextAlign.Center)
                    .lineHeight(30)
                  .onClick(() => {
                    if (item.number>1) {
                      // if (this.updataData) {
                      //   this.updataTotal=item.number
                      //   this.updataTotalAmount=item.retail_price*item.number
                      //   this.updataData=false
                      // }
                      item.number--
                      const updaData:GouWuCheData={id:item.id,number:item.number,goods_name:item.goods_name,retail_price:item.retail_price,list_pic_url:item.list_pic_url}
                      this.GouWuCheData.splice(index,1,updaData)
                    }
                  })
                  Text(item.number.toString())
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
                    // if (this.updataData) {
                    //   this.updataTotal=item.number
                    //   this.updataTotalAmount=item.retail_price*item.number
                    //   this.updataData=false
                    // }
                    item.number++
                    const updaData:GouWuCheData={id:item.id,number:item.number,goods_name:item.goods_name,retail_price:item.retail_price,list_pic_url:item.list_pic_url}
                    this.GouWuCheData.splice(index,1,updaData)
                  })
                }.width('100%').justifyContent(FlexAlign.End).padding({right:20,bottom:8})
              }
          }
          }
          .height(180)
          .border({ width: 1 })
          .borderColor('#eee')
          .backgroundColor('#fafafa')
          .swipeAction({
            end: this.DeleteItem(index)
          })
          .width('100%')
        })
      }.height('70%').width('100%')

      Column({space:5}) {
        Row() {
          Text(`累加共${this.SelectTotal}件商品，可点击`).fontSize(14)
          Button(this.ButtonState ? this.ButtonText = '完成编辑' : this.ButtonText = '编辑')
            .type(ButtonType.Normal)
            .borderRadius(8)
            .backgroundColor(this.ButtonState ? Color.Red : Color.Green)
            .fontColor(Color.White)
            .fontSize(12)
            .width(85)
            .height(20)
            .onClick(() => {
              // this.updataData?this.updataData:this.updataData=true
              // this.Total-=this.updataTotal;
              // this.TotalAmount-=this.updataTotalAmount
              // this.updataTotal=0
              // this.updataTotalAmount=0
              // console.log(this.GouWuChe.goods_name)
              this.ButtonState ? this.ButtonState = false : this.ButtonState = true
            })
          Text('按钮，进行商品数量修改').fontSize(14)
        }.width('100%').height('40%').backgroundColor("#fff7cc")

        Row() {
          Row(){
            CheckboxGroup({ group: 'GouWuChe' })
            Text('全选')
          }
          Row(){
            Text('合计:')
            Text(`￥${this.TotalAmount}`).fontColor(Color.Red)
          }
          Button('提交订单').linearGradient({
            direction: GradientDirection.Right,
            colors: [['#ee0a', 0], ['#ee0a24', 0.5]]
          })
        }.padding({bottom:4}).justifyContent(FlexAlign.SpaceBetween).width('100%')
      }.width('100%').layoutWeight(1).justifyContent(FlexAlign.End)
    }
  }
}