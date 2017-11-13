//
//  APIConfig.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import Moya
import Result


let baseUrlString = "http://sdp.hzsb365.com"

//"http://dinner.lewitech.cn";

//let baseUrlString = "http://dinner.lewitech.cn"

var accessToken = ""

/*这个节点闭包是添加自定义请求头*/
func endpointClosure<T>(target : T) -> Endpoint<T> where T : TargetType
{
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)

    return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": accessToken])
}

/*这个函数闭包里面可以自定义请求头*/
func requestClosure<T>(endpoint: Endpoint<T> , done:@escaping MoyaProvider<T>.RequestResultClosure) where T :TargetType
{
    guard var request = endpoint.urlRequest else { return }
    request.timeoutInterval = 30    //设置请求超时时间
    done(.success(request))
}

/*这个插件是控制打应请求头的的信息和响应体的信息*/
let networkLoggerPlugin = NetworkLoggerPlugin{
    (t) in
    
    let data = Data(base64Encoded: "hhhhhhhh")
    
    return data!
}

/*这个插件通常用来控制Toastd的展示*/
let networkPlugin = NetworkActivityPlugin { (type) in
    
    switch type
    {
    case .began:
        
        Toast().showActivityIndicator()
        
    case .ended:
        
        Toast().dismiss()
    }
}

let plugins = [networkPlugin,networkLoggerPlugin,CustomPlugin()] as [PluginType]

func sendRxRequest<T>() -> RxMoyaProvider<T> where T : TargetType {
    
    return RxMoyaProvider<T>(endpointClosure: endpointClosure, requestClosure: requestClosure,plugins: plugins)
}

class CustomPlugin: PluginType {
    
    // MARK: Plugin
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest
    {
        var urlRequest = request
        
        /*这里自定义协议头*/
        urlRequest.addHeader()
    
        return urlRequest
    }
    
    func willSend(_ request: RequestType, target: TargetType)
    {
        
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType)
    {
        
        switch result {
            
        case .failure(let error):
            
            Toast().showError(text: error.localizedDescription)
            
        case .success(let value):
            
            let JsonData = JSON(data: value.data)
            
            if JsonData["code"].doubleValue == 0
            {
                LWLog(message: JsonData)
            }
            else
            {
                Toast().showError(text: JsonData["msg"].stringValue)
            }
            
        }
    }
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError>
    {
        switch result
        {
            case .failure(let error):
            
                Toast().showError(text: error.errorDescription!)
//                LWLog(message: "请求发生错误:" + error.errorDescription!)
            case .success(let value):
                               
                LWLog(message: "data;\(value)")
        }
        
        return result
    }
}

extension URLRequest
{
    mutating func addHeader()
    {
        self.addValue(accessToken, forHTTPHeaderField: "Authorization")
    }
}



