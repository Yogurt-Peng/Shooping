export interface DetailsData{
      info:info;
      gallery:Array<gallery>;
      attribute:Array<attribute>
      issue:Array<issue>
}
export interface info{
  id: number;
  category_id: number;
  goods_sn: string;
  name: string;
  brand_id: number;
  goods_number: number;
  keywords: string;
  goods_brief: string;
  goods_desc: string;
  is_on_sale: number;
  add_time: number;
  sort_order: number;
  is_delete: number;
  attribute_category: number;
  counter_price: number;
  extra_price: number;
  is_new: number;
  goods_unit: string;
  primary_pic_url: string;
  list_pic_url: string;
  retail_price: number;
  sell_volume: number;
  primary_product_id: number;
  unit_price: number;
  promotion_desc: string;
  promotion_tag: string;
  app_exclusive_price: number;
  is_app_exclusive: number;
  is_limited: number;
  is_hot: number;
}
export interface gallery{
  id: number
  goods_id: number
  img_url: string
  img_desc: string
  sort_order: number
}
export interface attribute{
  value:string;
  name:string;
}
export interface issue{
  id: number
  goods_id: string
  question: string
  answer:string
}

export interface RelatedData{
 goodsList:Array<goodsList>
}
export interface goodsList{
  id: number
  name: string
  list_pic_url: string
  retail_price: number
}