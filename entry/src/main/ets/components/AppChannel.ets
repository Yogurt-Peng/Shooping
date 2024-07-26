import { channel } from '../utils/ResponseData'

@Component
export  struct AppChannel {
  @Prop channel:Array<channel>
  build() {
    Flex() {
      ForEach(this.channel, (item: channel) => {
        Column() {
          Image(item.icon_url).width("60%")
          Text(item.name).fontSize(18)
        }.width("20%").margin({ top: 10, bottom: 10 })
        .borderWidth({
          bottom: 12,
        }).borderColor("#ebedf0")
      })
    }
  }
}