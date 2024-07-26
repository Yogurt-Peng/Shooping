
import { AppBrandList } from '../components/AppBrandList';
import { AppCategoryList } from '../components/AppCategoryList';
import { AppChannel } from '../components/AppChannel';
import { AppHotGoodsList } from '../components/AppHotGoodsList';
import { AppNewGoodsList } from '../components/AppNewGoodsList';
import { AppSwiper } from '../components/AppSwiper';
import { AppTopicList } from '../components/AppTopicList';
import { GetData, GetHome } from '../utils/GetHome';
import { banner, brandList, categoryList, channel, goodsList,
  hotGoodsList,
  IndexData,
  newGoodsList,
  ResData,
  topicList} from '../utils/ResponseData';
import { FenLei } from '../viewmodel/FenLei';
import { GouWuChe } from '../viewmodel/GouWuChe';
import { WoDe } from '../viewmodel/WoDe';
import { ZhuanTi } from '../viewmodel/ZhuanTi';
import { router } from '@kit.ArkUI';
import { GouWuCheData } from '../components/GouWuCheDialog';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Index {
  @LocalStorageLink('Total') Total: number = 0;
  @State TotalB:number=0
  @State Account:boolean=false
  @State isHideSearch:boolean=true;
  @State GouWuCheData:Array<GouWuCheData>=[]
  @State isShow:boolean=false
  @State @Watch('watchTabsIndex')curTabIndex: number = 0;
  @State banner: Array<banner> = [];
  @State channel: Array<channel> = [];
  @State brandList: Array<brandList> = [];
  @State categoryList:Array<categoryList>=[];
  @State newGoodsList:Array<newGoodsList>=[]
  @State hotGoodsList:Array<hotGoodsList>=[]
  @State topicList:Array<topicList>=[]
  @State GouWuChe:GouWuCheData=new Object as GouWuCheData
  private scroller:Scroller=new Scroller()

  onPageShow(){
     if (router.getParams()) {
       this.GouWuChe=router.getParams() as GouWuCheData
      console.log('index'+this.GouWuChe.goods_name)
      this.curTabIndex = 3
       this.GouWuCheData.forEach((element,index:number)=> {
         if (element.id==this.GouWuChe.id) {
           const updaData:GouWuCheData={id:this.GouWuChe.id,number:this.GouWuChe.number+element.number,goods_name:this.GouWuChe.goods_name,retail_price:this.GouWuChe.retail_price,list_pic_url:this.GouWuChe.list_pic_url}
           this.GouWuCheData.splice(index,1,updaData)
           this.Account=true
         }
       });
         this.Account?this.Account=false:this.GouWuCheData.push(this.GouWuChe)
    }
  }
  onPageHide(): void {
    this.TotalB=0
      this.GouWuCheData.forEach((element)=>{
        this.TotalB+=element.number
      })
      console.log('TotalB'+this.TotalB)
    this.Total=this.TotalB
  }
  watchTabsIndex(){
    this.isHideSearch=this.curTabIndex<3
  }

  async aboutToAppear() {

    // let ress:ResData<IndexData> = await GetData();
    let res: ResData<IndexData> = await GetHome();
    // console.log(JSON.stringify(res));
    this.categoryList=res.data.categoryList
    this.banner = res.data.banner;
    this.channel = res.data.channel;
    this.brandList = res.data.brandList;
    this.newGoodsList=res.data.newGoodsList;
    this.hotGoodsList=res.data.hotGoodsList;
    this.topicList=res.data.topicList;
    // console.info(this.categoryList.toString())
    console.log(JSON.stringify(res.data.categoryList))
  }

  build() {
    Column() {
      if (this.isHideSearch) {
        Row() {
          Search({ placeholder: "请输入搜索关键字" }).borderRadius(5).onSubmit(()=>{
            router.pushUrl({
              url:'pages/SearchDetail',
            },router.RouterMode.Single)
          })
        }
        .padding({
          left: 10,
          right: 10,
          top: 5,
          bottom: 0
        });
      }
      Tabs({index:this.curTabIndex}) {
        TabContent() {
          Stack({
            alignContent:Alignment.BottomEnd
          }) {
            List({scroller:this.scroller}) {
              //轮播图区域
              ListItem() {
                AppSwiper({ banner: this.banner })
              }
              //通道区域
              ListItem() {
                AppChannel({channel:this.channel})
              }
              //品牌直供
              ListItem() {
                AppBrandList({brandList:this.brandList});
              }
              ListItem(){
                AppNewGoodsList({newGoodsList:this.newGoodsList,})
              }
              ListItem(){
                AppHotGoodsList({hotGoodsList:this.hotGoodsList})
              }
              ListItem(){
                AppTopicList({topicList:this.topicList})
              }
              ListItem(){
                  AppCategoryList({categoryList:this.categoryList})
              }
            }.listDirection(Axis.Vertical).height('100%')
            .onScrollIndex((start)=>{
                    // console.log(start.toString())
                this.isShow=start>0.5
            })
            if (this.isShow) {
              Row() {
                Image($r('app.media.ZhiDing')).width(40)
              }
              .margin({right:10,bottom:10})
              .width(60)
              .height(60)
              .backgroundColor("rgba(0,0,0,0.3)")
              .justifyContent(FlexAlign.Center)
              .borderRadius(30)
              .onClick(()=>{
                this.scrollToTop()
              })
            }
          }.width("100%").height("100%");
        }.tabBar(this.barItem(0, "首页", $rawfile('鼓.png')));

        TabContent() {
          ZhuanTi()
        }.tabBar(this.barItem(1, "专题",  $rawfile('音乐.png')));

        TabContent() {
            FenLei()
        }.tabBar(this.barItem(2, "分类",$rawfile('乐谱.png')));

        TabContent() {

            GouWuChe({TotalB:this.TotalB,GouWuChe:this.GouWuChe,GouWuCheData:this.GouWuCheData})

        }.tabBar(this.barItem(3, "购物车", $rawfile('麦克风.png')));


        TabContent() {
          WoDe()
        }.tabBar(this.barItem(4, "我的", $rawfile('吉他.png')));
      }
      .barPosition(BarPosition.End)
      .scrollable(false)
      .layoutWeight(1)
      .onTabBarClick(index=>this.curTabIndex=index)

    }
    .height('100%')
    .width('100%')
  }
  scrollToTop() {
    this.scroller.scrollEdge(Edge.Top)
  }
  @Builder
  barItem(index: number, title: string, icon: Resource) {
    Column() {
      Image(icon)
        .width(23).fillColor(this.curTabIndex === index ? Color.Red : Color.Black)
      Text(title).fontSize(13).width(40).textAlign(TextAlign.Center)
        .fontColor(this.curTabIndex === index ? Color.Red : Color.Black)
    }
  }

}