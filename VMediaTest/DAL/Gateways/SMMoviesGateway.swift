//
//  SMUserGateway.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import SwiftyJSON
import VRGSoftSwiftIOSKit
import Alamofire
import AuthenticationServices

class SMMoviesGateway: SMBaseGateway {

    static let shared: SMMoviesGateway = SMMoviesGateway()

    func getChanels() -> SMGatewayRequest {

        let request: SMGatewayRequest = self.request(type: .get, path: "user/info") { (_, response) -> SMResponse in

            let result: (SMResponse, JSON) = response.defaultResult()

            if result.0.isSuccess {

            }

            return result.0
        }

        return request
    }
}
