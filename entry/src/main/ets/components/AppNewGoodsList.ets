import { newGoodsList } from '../utils/ResponseData';
import { router } from '@kit.ArkUI';

@Component
export struct AppNewGoodsList {
  @Prop newGoodsList: Array<newGoodsList>;
  build() {
    Column() {
      Row() {
        Text("周一周四·新品首发").fontSize(22)
      }.height(40)
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.newGoodsList, (item: newGoodsList) => {
          Column() {
            Image(item.list_pic_url).width("100%")
            Text(item.name);
            Text() {
              Span(`￥${item.retail_price.toFixed(2)}元`)
                .fontColor("#8b0000")
            }
          }.width("50%").onClick(()=>{
              router.pushUrl({
                url:'pages/Details',
                params:{
                  id:item.id
                }
              },router.RouterMode.Standard)
          })
        })
      }
    }.borderWidth({
      bottom: 12,
    }).borderColor("#ebedf0")

  }
}