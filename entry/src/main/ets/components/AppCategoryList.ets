import { categoryList, goodsList } from '../utils/ResponseData'
import { router } from '@kit.ArkUI'


@Component
export struct AppCategoryList {
  @Prop categoryList:Array<categoryList>
  build() {
    Column() {
      ForEach(this.categoryList, (item: categoryList) => {
        Column(){
        Text(`一 ${item.name} 一`).fontSize(22).padding({top:5})
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(item.goodsList, (item: goodsList) => {
            Column() {
              Image(item.list_pic_url).width('100%')
              Text(item.name).maxLines(1).fontSize(18)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(`￥${item.retail_price.toFixed()}元`).fontColor('#8b0000')
            }.width('50%').onClick(()=>{
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
      })
    }
  }
}