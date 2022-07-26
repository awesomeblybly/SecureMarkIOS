//
//  File.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/25.
//

import Foundation

struct Markers: Codable {
    let color: String
    let content: String
    let index: Int
    let opacity: Double
    let size: Int
}

struct Profile: Codable {
    let applyTo: String? = nil
    let config: String
    let markers: [Markers]
    let pattern: String
    let type: String
}
