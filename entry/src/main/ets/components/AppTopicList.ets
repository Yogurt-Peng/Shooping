import { topicList } from '../utils/ResponseData';


@Component
export struct AppTopicList {
  @Prop topicList: Array<topicList>;

  build() {
    Column() {
      Row() {
        Text("专题精选").fontSize(22)
      }.height(40)
      List() {
        ForEach(this.topicList, (item: topicList) => {
          ListItem() {
            Column() {
              Image(item.item_pic_url)
                .objectFit(ImageFit.Cover)
                .width("90%").height(200)
              Text(item.title).width("90%")
                .fontSize(18)
                .fontColor('#333')
              Text(item.subtitle).width("90%")
                .fontSize(15)
                .fontColor('#999')
                .textAlign(TextAlign.Start)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(`￥${item.price_info.toFixed(2)}元`)
                .textAlign(TextAlign.Start)
                .width("90%")
                .fontColor("#8b0000")
            }.width("100%")
            .justifyContent(FlexAlign.Start)
          }.padding(5)
        })
      }.listDirection(Axis.Horizontal).scrollBar(BarState.Off)
    }
  }
}