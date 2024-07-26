import axios, { AxiosError, AxiosInterceptorOptions, AxiosResponse, InternalAxiosRequestConfig } from  '@ohos/axios'
export  const httpRequest=axios.create({
  baseURL:'http://youker.net:8360',//配置环境变量
  // timeout:3000
});
// 添加请求拦截器
httpRequest.interceptors.request.use((config:InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  return config;
}, (error:AxiosError) => {
  // 对请求错误做些什么
  return Promise.reject(error);
});


// 添加响应拦截器
httpRequest.interceptors.response.use((response:AxiosResponse)=> {
  // 对响应数据做点什么
  return response.data;
}, (error:AxiosError)=> {
  // 对响应错误做点什么
  return Promise.reject(error);
});
//请求拦截
// httpRequest.interceptors.request.use((config:InternalAxiosRequestConfig)=>{
//   return config;
// },(err:AxiosError)=>Promise.reject(err))
//
// //响应拦截
// httpRequest.interceptors.response.use((response:AxiosResponse)=> {
//   // 对响应数据做点什么
//   return response.data;
// }, (error:AxiosError)=> {
//   // 对响应错误做点什么
//   return Promise.reject(error);
// })
// import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from "@ohos/axios";
//
// export const httpRequest=axios.create({
//   baseURL:"http://youker.net:8360",
//   timeout:2000
// })
//
// httpRequest.interceptors.request.use((config:InternalAxiosRequestConfig)=>{
//   // config.headers["token"]="xxx"
//   return config;
// },(err:AxiosError)=>Promise.reject(err))
//
// httpRequest.interceptors.response.use((response:AxiosResponse)=>{
//   // 提前判断 response.status  进行提示
//   return response.data;
// },(err:AxiosError)=>Promise.reject(err))
