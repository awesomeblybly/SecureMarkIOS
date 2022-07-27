import Foundation
import Alamofire
import SwiftUI

@available(macOS 10.15, iOS 14.0, *)
public class SecureMark: ObservableObject{
    @Published var profile: Profile?
    @Published var clientView: AnyView?
    //    @Published var profile: Profile
    
    public func initialize(server: String, token: String, account: String){
        Network.session = Session(serverTrustManager: makeTrustManager(server: server))
        Network.getProfiles(server: server, token: token, account: account){profile in
            self.profile = profile
        }
    }
    
    func makeTrustManager(server: String) -> ServerTrustManager{
        let ip = server.components(separatedBy: "//")[1].components(separatedBy: ":")[0]
        print(ip)
        return ServerTrustManager(evaluators: [ip: DisabledTrustEvaluator()])
    }
    
    public static let share = SecureMark()
    private init(){}
}

public extension View{
    public func sercureMark() -> some View {
        SecureMark.share.clientView =  AnyView(self) 
        return WaterMarkTextView(viewModel: SecureMark.share)
    }
}
