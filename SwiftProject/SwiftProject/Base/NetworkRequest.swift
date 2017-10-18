//
//  NetworkRequest.swift
//  SwiftProject
//
//  Created by 刘毅 on 2017/10/18.
//  Copyright © 2017年 vpjacob. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
enum MethodType {
    case get
    case post
}
private let NetworkRequestShareInstance = NetworkRequest()

class NetworkRequest {
    class var sharedInstance : NetworkRequest {
        return NetworkRequestShareInstance
    }
}

extension NetworkRequest {
    
    
    func getRequest(URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : JSON) -> (),failer:@escaping (_ error : Error) -> ()) {
        // 2.发送网络请求
        Alamofire.request(URLString, method: .get, parameters: parameters).responseJSON { (response) in
            // 3.获取结果
            guard response.result.value != nil else {
                print(response.result.error!)
                failer(response.result.error!)
                return
            }
            let json = JSON(response.data!)
            
            // 4.将结果回调出去
            finishedCallback(json)
        }
    }
    
    
    
    func postRequest(URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : JSON) -> (),failer:@escaping (_ error : Error) -> ()) {
        // 2.发送网络请求
        Alamofire.request(URLString, method: .post, parameters: parameters).responseJSON { (response) in
            // 3.获取结果
            guard response.result.value != nil else {
                print(response.result.error!)
                failer(response.result.error!)
                return
            }
            let json = JSON(response.data!)
            // 4.将结果回调出去
            finishedCallback(json)
            
            
        }
    }
    
    
    
    
    //MARK: - 照片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:
    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
                            let json = JSON(value)
                            print(json)
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        }
        )
    }
}
