//
//  File.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/25.
//

import Foundation

struct ResponseProfile: Codable{
    let common: Common
    let data: ResponseData
}

struct Common: Codable {
    let status: Int
}

struct ResponseData: Codable {
    let profiles: Profile
}

