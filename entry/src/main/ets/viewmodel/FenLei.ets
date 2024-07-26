import { categoryList, currentCategory, FenLeiData, FenLeiIndexData, subCategoryList } from '../utils/FenLeiData';
import { GetCatalogCurrent, PostCatalog } from '../utils/GetHome';
import { ResData } from '../utils/ResponseData';
import { router } from '@kit.ArkUI';


@Entry
@Component
export struct FenLei {
  @Builder TextStyle(title:string){

    Text(title).textShadow({
      fill:false,
      radius:10,
      color:"#8b0000"}).fontSize(18).fontColor('#fff')
  }
  @State selectedIndex:number=0
  @State categoryList: Array<categoryList> = [];
  @State  currentCategory:currentCategory=new Object as currentCategory
  async aboutToAppear() {
    let res :ResData<FenLeiData> = await PostCatalog();
    this.categoryList=res.data.categoryList
    this.currentCategory=res.data.currentCategory
    console.log(res.data.categoryList.toString())
  }
  async toIndex(index:number){
    console.log(this.categoryList[index].id.toString())
    let ress :ResData<FenLeiIndexData> = await GetCatalogCurrent(this.categoryList[index].id);
    this.currentCategory=ress.data.currentCategory
    console.log(JSON.stringify(ress));

  }
  build() {
      Row(){
        Column(){
          List(){
            ForEach(this.categoryList,(item:categoryList,index:number)=>{
              ListItem() {
                Row() {
                  Divider().vertical(false).height(30).backgroundColor(this.selectedIndex===index?Color.Red:Color.Transparent).width(4)
                  Text(item.name).padding({left:10})
                }.height(60).width('100%')
              }.backgroundColor(this.selectedIndex===index?Color.White:'#f7f8fa')
              .height(60).width('100%').onClick(()=>{
                this.selectedIndex=index
                this.toIndex(index)
              })
            })
          }
        }.width('20%').height('100%').backgroundColor('#f7f8fa')
        Column(){
          Image(this.currentCategory.banner_url)
            .width('100%').padding(5).borderRadius(5).height(120)
            .overlay(this.TextStyle(this.currentCategory.front_desc),{
                offset:{
                  x:90,
                  y :50
                }
            })
            Text(`一 ${this.currentCategory.name} 一`).fontSize(22).margin({top:10,bottom:10})
          Flex({wrap:FlexWrap.Wrap}){
            ForEach(this.currentCategory.subCategoryList,(item:subCategoryList,index:number)=>{
              Column() {
                Image(item.banner_url).width('50%')
                  Text(item.name)
              }.width('33%').border({width:1}).borderColor("#ebedf0").height(100).justifyContent(FlexAlign.Center)
            })
          }.onClick(()=>{
            router.pushUrl({
              url:'pages/FenLeiDetails',
              params:{
                id:this.currentCategory.subCategoryList[0].id
              }
            },router.RouterMode.Standard)
          })
        }.layoutWeight(1).height('100%')
      }
  }
}