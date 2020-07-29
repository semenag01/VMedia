//
//  SMChannelGateway.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import SwiftyJSON
import VRGSoftSwiftIOSKit
import Alamofire
import AuthenticationServices

class SMChannelGateway: SMBaseGateway {

    static let shared: SMChannelGateway = SMChannelGateway()

    func getChannels() -> SMGatewayRequest {

        let request: SMGatewayRequest = self.request(type: .get, path: "Channels") { (_, response) -> SMResponse in

            let result: (SMResponse, JSON) = response.defaultResult()

            if result.0.isSuccess {

                if let data: Data = try? result.1.rawData() {
                    
                    do {
                        let items: [SMChannel] = try JSONDecoder.commonDecoder.decode([SMChannel].self, from: data)
                        result.0.boArray.append(contentsOf: items)
                    } catch {
                        result.0.error = error
                        result.0.isSuccess = false
                    }
                }
            }

            return result.0
        }

        return request
    }
    
    func getProgramItems() -> SMGatewayRequest {

        let request: SMGatewayRequest = self.request(type: .get, path: "ProgramItems") { (_, response) -> SMResponse in

            let result: (SMResponse, JSON) = response.defaultResult()

            if result.0.isSuccess {

                if let data: Data = try? result.1.rawData() {
                    
                    do {
                        let items: [SMProgramItem] = try JSONDecoder.commonDecoder.decode([SMProgramItem].self, from: data)
                        result.0.boArray.append(contentsOf: items)
                    } catch {
                        result.0.error = error
                        result.0.isSuccess = false
                    }
                }
            }

            return result.0
        }

        return request
    }
}
