import { BrandData } from './BrandData';
import { DetailsData, RelatedData } from './DetailsData';
import { FenLeiData, FenLeiIndexData } from './FenLeiData';
import { FenLeiDetailsData, FenLeiListData } from './FenLeiDetailsData';
import { httpRequest } from './request'
import {  IndexData, ResData } from './ResponseData'
import { Data } from './ZhuanTiData';

export const GetHome = ():(Promise<ResData<IndexData>>) => httpRequest({
  url: "/api/index/index" ,
  method:'post'
});
export const GetData = ():(Promise<ResData<IndexData>>) => httpRequest({ url: "/api/topic/list" });
export const PostCatalog = ():(Promise<ResData<FenLeiData>>) => httpRequest({
  url: "/api/catalog/index",
  method:"post",
});
export const GetCatalogCurrent = (id:number):(Promise<ResData<FenLeiIndexData>>) => httpRequest({
  url: "/api/catalog/current",
  method:"get",
  params: { id : id }
});
export const postZhuanTi = (page:number=1,size:number=10):(Promise<ResData<Data>>) => httpRequest({
  url: "/api/topic/list",
  method:"post",
  params: { page:page,size:size }
});
export const GetDetailsData = (id:number):(Promise<ResData<DetailsData>>) => httpRequest({
  url: "/api/goods/detail",
  method:"get",
  params: { id : id }
});
export const GetRelatedData = (id:number):(Promise<ResData<RelatedData>>) => httpRequest({
  url: "/api/goods/related",
  method:"post",
  params: { id : id }
});
export const GetFenLeiDetails = (id:number=1008002):(Promise<ResData<FenLeiDetailsData>>) => httpRequest({
  url: "/api/goods/category",
  method:"get",
  params: { id : id }
});

export const GetFenLeiList= (categoryId:number=1008002,page:number=1,size:number=1000):(Promise<ResData<FenLeiListData>>) => httpRequest({
  url: "/api/goods/list",
  method:"get",
  params: { categoryId : categoryId, page:page,size:size }
});
export const GetBrand= (id:number=1026000):(Promise<ResData<BrandData>>) => httpRequest({
  url: "/api/brand/detail",
  method:"get",
  params: { id : id }
});