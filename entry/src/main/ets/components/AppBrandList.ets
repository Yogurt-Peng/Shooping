import { brandList } from '../utils/ResponseData';
import { router } from '@kit.ArkUI';

@Component
export struct AppBrandList {
  //@State必须有初始值, 是可以没有初始值,等待父组件给它值
  @Prop brandList: Array<brandList>;

  build() {
    Column() {
      Row() {
        Text("品牌制造商直供").fontSize(22)
      }.height(40)

      Row() {
        Flex({
          wrap: FlexWrap.Wrap
        }) {
          ForEach(this.brandList, (item: brandList) => {
            Image(item.list_pic_url).width("50%")
              .onClick(()=>{
                router.pushUrl({
                  url:'pages/Brand',
                  params:{
                    id:item.id
                  }
                },router.RouterMode.Standard)
              })
              .padding(5)
              .overlay(this.brandItem(item.name, item.floor_price))
          })
        }
      }
    }.borderWidth({
      bottom: 12,
    }).borderColor("#ebedf0")
  }

  @Builder
  brandItem(name: string, price: number) {
    Column() {
      Text(name).fontSize(18).position({ left: 10, top: 10 });
      Text(`￥${price}元`).fontColor('#8b0000')
        .position({ left: 10, top: 30 })

    }.backgroundColor(Color.Transparent)
  }
}