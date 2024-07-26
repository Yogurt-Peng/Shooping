import { router } from '@kit.ArkUI';
import { brand, BrandData } from '../utils/BrandData';
import { GetBrand } from '../utils/GetHome';
import { ResData } from '../utils/ResponseData';
import { RouterData } from './Details';

@Entry
@Component
struct Brand {
  @State brand:brand=new Object as  brand
  async aboutToAppear() {
    let a=router.getParams() as RouterData
     // console.log('id是'+a.id.toString())
    let res:ResData<BrandData>=await GetBrand(a.id);
    // console.log(JSON.stringify(res.data))
    this.brand=res.data.brand
  }
  build() {
    Column() {
      Row(){
        Image($r('app.media.app_icon')).height(20).width(20).onClick(()=>{
          router.back()
        })
        Text(this.brand.name).fontColor('#323233').fontSize(20)
      }.width('66%').justifyContent(FlexAlign.SpaceBetween).padding(12).height(50)
      Image(this.brand.list_pic_url).width('100%')
      Row(){
        Text(this.brand.name).fontColor('#333').font({size:24,weight:FontWeight.Bold})
        Text(`￥${this.brand.floor_price}.00元`).fontColor('#ff0000').fontSize(18)
      }.width("100%").justifyContent(FlexAlign.SpaceBetween).padding({top:10,left:10,right:10})
      Text(`订单排名:${this.brand.sort_order}`).padding(10).fontColor('#666').fontSize(16)
      Text(this.brand.simple_desc).width('100%').padding(10).fontColor('#999').fontSize(18)
    }.alignItems(HorizontalAlign.Start)
    .height('100%')
    .width('100%')
  }
}