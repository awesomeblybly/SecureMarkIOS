//
//  File.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/25.
//

import Foundation

struct RequestProfile: Codable{
    let data: RequestData
}

struct RequestData: Codable {
    let serviceToken: String
    let packageName: String
    let account: String
}
