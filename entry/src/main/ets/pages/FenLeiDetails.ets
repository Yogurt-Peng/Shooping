import { brotherCategory, currentCategory, data, FenLeiDetailsData, FenLeiListData } from '../utils/FenLeiDetailsData';
import { GetFenLeiDetails, GetFenLeiList } from '../utils/GetHome';
import { ResData } from '../utils/ResponseData';
import { router } from '@kit.ArkUI';
import { RouterData } from './Details';


@Entry
@Component
struct FenLeiDetails {
  @Builder TextStyle(name:string,title:string){
    Column() {
      Text(name).textShadow({
        fill: false,
        radius: 10,
        color: "#8b0000"
      }).fontSize(26).fontColor('#fff')
      Text(title).textShadow({
        fill: false,
        radius: 10,
        color: "#8b0000"
      }).fontSize(23).fontColor('#fff')
    }
  }
  @State selectedIndex:number=0
  @State brotherCategory:Array<brotherCategory>=[]
  @State data:Array<data>=[]
  @State currentCategory:currentCategory=new Object as currentCategory
  async aboutToAppear() {
    let a=router.getParams() as RouterData
    let res :ResData<FenLeiDetailsData> = await GetFenLeiDetails(a.id);
    this.brotherCategory=res.data.brotherCategory
    this.currentCategory=res.data.currentCategory
    console.log(JSON.stringify(res))
    let ress:ResData<FenLeiListData>=await GetFenLeiList(a.id)
    this.data=ress.data.data
    console.log(JSON.stringify(ress))
  }
  async toIndex(index:number){
    let res :ResData<FenLeiDetailsData> = await GetFenLeiDetails(this.brotherCategory[index].id);
    this.currentCategory=res.data.currentCategory
    let ress:ResData<FenLeiListData>=await GetFenLeiList(this.brotherCategory[index].id);
    this.data=ress.data.data
  }
  build() {
      Column(){
        Row(){
             List(){
               ForEach(this.brotherCategory,(item:brotherCategory,index:number)=>{
                 ListItem() {
                     Column({space:8}) {
                       Text(item.name).fontColor(this.selectedIndex==index?'#333':"#666").fontSize(19)
                       Divider()
                         .width(40)
                         .height(4)
                         .backgroundColor(this.selectedIndex === index ? Color.Red : Color.Transparent)
                     }.height(60).constraintSize({maxWidth:100,minWidth:70})
                 }.onClick(()=>{
                   this.selectedIndex=index
                   this.toIndex(index)
                 })
               })
             }.listDirection(Axis.Horizontal).scrollBar(BarState.Off)
        }.width('100%').height(50).margin({top:15,left:30,right:30})
          List(){
            ListItem(){
              Image(this.currentCategory.banner_url).width('100%').height('30%')
                .overlay(this.TextStyle(this.currentCategory.name,this.currentCategory.front_desc),{
                  offset:{
                    x:5,
                    y :80
                  }
                })
            }
            ListItem(){
                Flex({wrap:FlexWrap.Wrap}) {
                  ForEach(this.data, (item: data) => {
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
                }.width('100%')
            }
          }.width('100%')

      }
  }
}