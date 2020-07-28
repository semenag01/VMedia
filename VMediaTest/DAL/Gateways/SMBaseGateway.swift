//
//  SMBaseGateway.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Alamofire
import SwiftyJSON
import VRGSoftSwiftIOSKit

extension DataResponse {
    
    func defaultResult() -> (SMResponse, JSON) {
        
        var json: JSON
        
        if let value: Value = result.value {
            
            json = JSON(value)
        } else {
            
            json = JSON.null
        }
        
        let response: SMResponse = SMResponse()
        response.error = error
        
        if self.response?.statusCode == 200 || self.response?.statusCode == 201 || self.response?.statusCode == 204 {
            
            response.isSuccess = true
        } else {
            
            var errorMessage: String?
            
            if let dic: [String: Any] = value as? [String: Any] {
                
                errorMessage = stringFromDictionary(dic)
            }
            
            if errorMessage == nil {
                
                errorMessage = response.error?.localizedDescription
            }
            
            response.textMessage = errorMessage
            response.titleMessage = ""
        }
        
        return (response, json)
    }
}

func stringFromDictionary(_ aData: [String: Any]) -> String? {
    
    var result: String?
    var array: [String] = []
    
    for (_, v): (String, Any) in aData {
        
        if let a: [String] = v as? [String] {
            
            for s: String in a {
                
                array.append(s)
            }
        } else if let s: String = v as? String {
            
            array.append(s)
        } else if let d: [String: Any] = v as? [String: Any] {
            
            if let s: String = stringFromDictionary(d) {
                
                array.append(s)
            }
        }
    }
    
    if array.count > 0 {
        
        result = array.joined(separator: "\n")
    }

    return result
}


class SMBaseGateway: SMGateway {
    
    override func request(type aType: HTTPMethod, path aPath: String, parameters aParameters: [String: AnyObject]? = [:], successBlock aSuccessBlock: @escaping SMGatewayRequestResponseBlock) -> SMGatewayRequest {
        
        let request: SMGatewayRequest = super.request(type: aType, path: aPath, parameters: aParameters, successBlock: aSuccessBlock)
        
        return request
        
    }
    
    override func defaultFailureBlockFor(request aRequest: SMGatewayRequest) -> SMGatewayRequestResponseBlock {
        func result(data: DataRequest, responseObject: DataResponse<Any>) -> SMResponse {
            
            let response: SMResponse = SMResponse()
            response.error = responseObject.error

            var errorMessage: String?
            
            if let data: Data = responseObject.data {
                
                do {
                    let json: Any = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let object: [String: Any] = json as? [String: Any] {
                        
                        if let error: [String: String] = object["error"] as? [String: String] {
                            
                            errorMessage = error["message"]
                        } else {
                            
                            errorMessage = object["message"] as? String
                        }
                    }
                } catch {
                    print("---- fetching response error message happened")
                }
                
                if let code: Int = responseObject.response?.statusCode {
                    
                    if code == 401 {
                        
                    }
                }
            }

            if errorMessage == nil {
                
                errorMessage = response.error?.localizedDescription
            }
            response.isCancelled = (responseObject.error as NSError?)?.code == NSURLErrorCancelled
            response.textMessage = errorMessage
            response.isSuccess = false
            
            return response
        }
        
        return result
    }
}
