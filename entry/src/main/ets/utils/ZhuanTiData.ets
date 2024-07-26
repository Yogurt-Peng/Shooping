export interface Data {
  count: number
  totalPages: number
  pageSize: number
  currentPage: number
  data:Array<data>
}
export interface data{
  id: number,
  title: string
  price_info: number
  scene_pic_url: string
  subtitle:string
}