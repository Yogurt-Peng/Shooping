export interface FenLeiDetailsData{
  brotherCategory:Array<brotherCategory>
  currentCategory:currentCategory
}
export interface brotherCategory{
  id: number
  name: string
  keywords: string
  front_desc: string
  parent_id: number
  sort_order: number
  show_index: number
  is_show: number
  banner_url: string
  icon_url: string
  img_url: string
  wap_banner_url: string
  level: string
  type: number
  front_name: string
}

export interface currentCategory{
  id: number
  name: string
  keywords: string
  front_desc: string
  parent_id: number
  sort_order: number
  show_index: number
  is_show: number
  banner_url: string
  icon_url: string
  img_url: string
  wap_banner_url: string
  level: string
  type: number
  front_name: string
}
export interface FenLeiListData{
  data:Array<data>
}
export interface data{
  id: number
  name: string
  list_pic_url: string
  retail_price: number
}