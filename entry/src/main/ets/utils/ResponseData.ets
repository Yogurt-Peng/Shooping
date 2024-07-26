export interface banner {
  id: number;
  ad_position_id: number;
  media_type: number;
  name: string;
  link: string;
  image_url: string;
  content: string;
  end_time: number;
  enabled: number;
}

//通道结构
export interface channel {
  id: number;
  name: string;
  url: string;
  icon_url: string;
  sort_order: number;
}

//品牌直供
export interface brandList {
  id: number,
  name: string,
  list_pic_url: string,
  simple_desc: string,
  pic_url: string,
  sort_order: number,
  is_show: number,
  floor_price: number,
  app_list_pic_url: string,
  is_new: number,
  new_pic_url: string,
  new_sort_order: number
}


//响应具体数据
export interface IndexData {
  banner: Array<banner>;
  channel: Array<channel>;
  brandList:Array<brandList>;
  categoryList:Array<categoryList>;
  newGoodsList:Array<newGoodsList>;
  hotGoodsList:Array<hotGoodsList>;
  topicList:Array<topicList>
}


export interface categoryList{
  id: number
  name: string
  goodsList:Array<goodsList>
}
export interface goodsList{
  id: number
  name: string
  list_pic_url:string
  retail_price:number
}
export interface newGoodsList{
  id: number
  name: string
  list_pic_url: string
  retail_price:number
}
export interface hotGoodsList{
  id: number
  name: string
  list_pic_url: string
  retail_price: number
  goods_brief:string
}
export interface topicList{
  id: number
  title: string
  content: string
  avatar: string
  item_pic_url: string
  subtitle: string
  topic_category_id:number
  price_info: number
  read_count: string
  scene_pic_url: string
  topic_template_id: number
  topic_tag_id: number
  sort_order: number
  is_show: number
}

//响应结果的结构
export interface ResData<T> {
  errno: number;
  errmsg: string;
  data: T
}