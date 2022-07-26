//
//  File.swift
//  
//
//  Created by TAE JUN CHA on 2022/07/26.
//

import Foundation
import SwiftUI

public class WaterMarkViewModel: ObservableObject{
    @Published var clientView: AnyView
    @Published var profile: Profile
    
    init(view: AnyView, profile: Profile){
        self.clientView = view
        self.profile = profile
    }
}
