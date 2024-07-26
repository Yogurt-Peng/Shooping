export interface FenLeiData {
  categoryList: Array<categoryList>;
  currentCategory: currentCategory;
}
export interface currentCategory{
  id: number
  name: string
  keywords:string
  front_desc: string
  parent_id: number
  sort_order: number
  show_index: number
  is_show: number
  banner_url: string
  icon_url:string
  img_url: string
  wap_banner_url: string
  level: string
  type: number
  front_name: string
  subCategoryList:Array<subCategoryList>
}
export interface FenLeiIndexData {
  currentCategory: currentCategory;
}
export interface subCategoryList{
  id: number
  name: string
  keywords:string
  front_desc: string
  parent_id: number
  sort_order:number
  show_index: number
  is_show:number
  banner_url: string
  icon_url: string
  img_url: string
  wap_banner_url: string
  level: string
  type:number
  front_name:string
}
export interface categoryList{
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
  subCategoryList:Array<subCategoryList>
}